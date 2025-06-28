// uvm component class
class dff_scoreboard extends uvm_scoreboard ;
  `uvm_component_utils(dff_scoreboard) // reg class to uvm factory
  
  uvm_analysis_imp#(dff_seq_item, dff_scoreboard) item_collected_export;

  dff_seq_item tx_q[$];

  //standard constructor
  function new(string name ="dff_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("scoreboard Class", "constructor", UVM_MEDIUM)
  endfunction
  
    //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);

  endfunction
  
  // write task - recives the pkt from monitor and pushes into queue
  virtual function void write(dff_seq_item tx);
    //pkt.print();
    tx_q.push_back(tx);
  endfunction
  
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
   
    forever begin
      /*
      // get the packet
      // generate expected value
      // compare it with actual value
      // score the transactions accordingly
      */
      dff_seq_item curr_trans;
      wait((tx_q.size() != 0));
      curr_trans = tx_q.pop_front();
      compare(curr_trans);
      
    end
    
  endtask: run_phase
  
  
  //--------------------------------------------------------
  //Compare : Generate Expected Result and Compare with Actual
  //--------------------------------------------------------
  task compare(dff_seq_item curr_trans);
    logic  expected;
    logic  actual;
    //$display(curr_trans.op_code);
    expected = curr_trans.d;
    actual = curr_trans.q;
    //$display(expected);
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", actual, expected))
    end
    else begin
      // Note: Can display the input and op_code as well if you want to see what's happening
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", actual, expected), UVM_LOW)
    end
    
  endtask: compare
  
  
endclass
