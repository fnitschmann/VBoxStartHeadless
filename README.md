VBoxStartHeadless
=================

Shell script for Mac OS X to start VirtualBox VMs in headless mode.

Sometimes VirtualBox VirtualMachines can't be started correctly on some Mac OS X versions. This little script script is a work-around therefore.

## Features 

* It uses the `VBoxManage` command to manage your VMs
* An alias command named `VBoxStartHeadless` will be added to your `~/.bash_profile` and/or `~/.zshrc` 
* VMs are then started easy headless in the right way

## Requirements

* VirtualBox with CLI
* Git

## Instllation

Installtion easy with `curl` or `wget` through your command line

#### Via curl:
`curl -L https://raw.github.com/fnitschmann/VBoxStartHeadless/master/install.sh | sh`

#### via wget:
`wget --no-check-certificate https://raw.github.com/fnitschmann/VBoxStartHeadless/master/install.sh -0 - | sh`

## Usage

`VBoxStartHeadless <your_vm_name>`

## License 

See `LICENSE` file

> Copyright &copy; 2013 Florian Nitschmann (f.nitschmann@googlemail.com) 

