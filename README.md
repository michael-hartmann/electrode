# Electrode Package

* [API documentation](https://sms.icp.infineon.com/a/gen-pss-its-local/docs/electrode/index.html)
* [ITS-internal documentation](https://confluencewikiprod.intra.infineon.com/display/TIQC/Trap+Design+Softwares)
* [Official quick overview and tutorial](http://nbviewer.ipython.org/github/nist-ionstorage/electrode/blob/master/examples/tutorial.ipynb).
* See also [simulations-helpers](https://gitlab.intra.infineon.com/tiqc/simulations/ion-traps/electrode-package/simulations-helpers)

## Description

Electrode is a toolkit to develop and analyze RF ion traps. It can
optimize 2D surface electrode patterns to achieve desired trapping
properties and extract relevant parameters of the resulting geometry.
The software also treats precomputed 3D volumetric field and potential
data transparently.

## Changes

This is a version of the electrode package for the ITS group with
following adjustments and changes compared to the [public repository](https://github.com/nist-ionstorage/electrode):
* Support for 3D traps (ask Klemens Schüppert for details)
    - Added `up` feature in `PolygonPixelElectrode`
    - Added feature to plot upper and lower electrodes separately
* `plot_electrodes` can now plot voltages instead of `electrode-name`
* Fixed rounding in `polygons.py`
* Fixed change in Python API which prevented compilation of C module
* Fixed attribute error: `AttributeError: module 'numpy' has no attribute 'complex'`
* Replaced module `pngmath` by its successor `sphinx.ext.imgmath` in sphinx documentation

## Installation

It is highly recommended to create and install the package in
a [virtual environment](https://confluencewikiprod.intra.infineon.com/display/TIQC/Python#Python-VirtualEnvironements).

### Windows

Install the package from artifactory using `pip` (requires Python 3.9 or later):
```
pip install --find-links https://artifactory.intra.infineon.com/artifactory/gen-pss-its-local/python/wheels electrode
```

You can also build the package yourself. First, make sure [Microsoft Visual Studio C++ Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022) is installed.
You can build the package using:
```
python -m venv .venv            # create virtual environment
.\.venv\scripts\activate.ps1    # activate virtual environment
pip install -r requirements.txt # install Python dependencies
python setup.py bdist_wheel     # build Python wheel
```

The python wheel will be available in the directory `dist/`. You can
install the wheel using `pip`.

### Linux (Ubuntu or Debian)

On Linux, you need to build the package yourself:
```
apt-get install build-essential # install compiler
python -m venv .venv            # create virtual environment
. .venv/bin/activate            # activate virtual environment
pip install -r requirements.txt # install Python dependencies
python setup.py bdist_wheel     # build Python wheel
```

The python wheel will be available in the directory `dist/`. You can
install the wheel using `pip`.

## Building API Documentation

For building the API documentation, make sure that the sphinx dependencies are installed
by running
```
pip install -r requirements.txt
```
and create the documentation using:
```
cd doc/
make.bat html # on Windows
make html     # on Linux, make sure make is installed
```

To upload the documentation, create a zip directiory and upload it to artifactory using:
```
curl -H "X-JFrog-Art-Api:${ARTIFACTORY_TOKEN}" \
     -X PUT \
     https://artifactory.intra.infineon.com/artifactory/gen-pss-its-local/docs/electrode/documentation.zip \
     -T documentation.zip \
     -H "X-Explode-Archive: true"
```

## References

[1] Roman Schmied <roman.schmied@unibas.ch>, SurfacePattern software
package.
http://atom.physik.unibas.ch/people/romanschmied/code/SurfacePattern.php

[2] Roman Schmied: Electrostatics of gapped and finite surface
electrodes. New Journal of Physics 12:023038 (2010).
http://dx.doi.org/10.1088/1367-2630/12/2/023038

[3] Roman Schmied, Janus H. Wesenberg, and Dietrich Leibfried: Optimal
Surface-Electrode Trap Lattices for Quantum Simulation with Trapped
Ions. Physical Review Letters 102:233002 (2009).
http://dx.doi.org/10.1103/PhysRevLett.102.233002

[4] A. van Oosterom and J. Strackee: The Solid Angle of a Plane
Triangle, IEEE Transactions on Biomedical Engineering, vol. BME-30, no.
2, pp. 125-126. (1983)
http://dx.doi.org/10.1109/TBME.1983.325207

[5] Mário H. Oliveira and José A. Miranda: Biot–Savart-like law in
electrostatics. European Journal of Physics 22:31 (2001).
http://dx.doi.org/10.1088/0143-0807/22/1/304