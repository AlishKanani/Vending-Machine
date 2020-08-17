# Vending-Machine

A simple digital circuit for the coin acceptor of an electronic railway station platform ticket vending machine.
* Assume that the ticket cost 15 cents.
* The coin acceptor takes only nickels and dimes.
* Exact change must be provided. The acceptor does not return extra money.
* Valid combinations including order of coins are one nickel and one dime, three nickels, or one dime   and one nickel. Two dimes are valid, but the acceptor does not return money.

To test and generate wave forms using opensource softweres [iverilog](http://iverilog.icarus.com/) and [GTKWave](http://gtkwave.sourceforge.net/) run the following commands.

```
iverilog vending_machine.v vending_machineTB.v
vvp a.out
gtkwave test.vcd
```
