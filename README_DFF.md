
# UVM-Based D Flip-Flop Verification

This project demonstrates a **Universal Verification Methodology (UVM)**-based testbench for verifying a **D Flip-Flop (DFF)** design. It includes a complete UVM environment using agents, driver, monitor, scoreboard, and sequence-based stimulus.

## 📁 Project Structure

```
├── dff.v                   # RTL design of D Flip-Flop
├── interface.sv            # Interface connecting DUT and UVM
├── testbench.sv            # Top module to start simulation
├── dff_seq_item.sv         # Transaction class (sequence item)
├── dff_sequence.sv         # Stimulus generator (sequence)
├── dff_sequencer.sv        # Sequencer for connecting driver and sequence
├── dff_driver.sv           # Driver to apply stimulus to DUT
├── dff_monitor.sv          # Monitor to sample outputs
├── dff_agent.sv            # Agent wrapping monitor, driver, and sequencer
├── dff_scoreboard.sv       # Scoreboard for checking correctness
├── dff_env.sv              # Environment to instantiate agent and scoreboard
├── dff_test.sv             # UVM test class
└── README.md               # This file
```

## ✅ Features

- Modular UVM testbench
- Sequence-driven stimulus
- Scoreboard to compare actual and expected outputs
- Proper usage of UVM Phases and Messaging
- Works on any compliant SystemVerilog simulator

## 🧪 Design Specification

The D Flip-Flop functionality is verified using the relation:

```
Q_next = D, on rising edge of clock
```

## 🧾 How to Run

### 1. Using Mentor QuestaSim

```bash
vlog +acc *.sv
vsim -c -do "run -all" top
```

### 2. Using Synopsys VCS

```bash
vcs -sverilog -ntb_opts uvm -full64 *.sv
./simv
```

### 3. Using Cadence Xrun

```bash
xrun -uvm -64bit -access +rwc *.sv
```

## 🧠 UVM Concepts Used

- `uvm_sequence_item`, `uvm_sequence`, `uvm_driver`, `uvm_monitor`
- `uvm_analysis_port`, `uvm_analysis_imp`
- Scoreboarding for functional verification
- Factory registration using `uvm_component_utils` and `uvm_object_utils`

## 📌 TODO

- [ ] Add support for reset testing
- [ ] Add functional coverage model
- [ ] Create assertions for protocol checking

## 👤 Author

**Kavin Kumar K**  
VLSI & UVM Enthusiast

## 📝 License

This project is licensed under the [MIT License](LICENSE).

## 🤝 Contributions

Contributions and suggestions are welcome! Feel free to fork or open a pull request.

