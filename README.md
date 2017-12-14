# WixDependencyExample

This is a small example, demonstrating the WixDependencyExtension which can
provide inter-package dependencies.

parent1.msi installs ParentProduct v1.1.0.1
parent2.msi installs ParentProduct v1.2.0.0
child.msi   installs ChildProduct v1.2.3.4 wich requires ParentProduct v1.1.0.0 - v1.1.99.99

Build them on Linux using my dockerized WiX-Toolkit. Requires docker, of course :-)

```make```

Then, copy them to a windows machine and try them out.

Have Fun

