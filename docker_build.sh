#docker build --no-cache -t pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:jupyter-0.3 -f Dockerfile-jupyter .
docker build -t pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:jupyter-0.3 -f Dockerfile-jupyter .
docker tag pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:jupyter-0.3 pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:jupyter
docker push pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:jupyter-0.3
docker push pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:jupyter
#docker build --no-cache -t pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:0.4 .
docker build -t pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:0.4 .
docker tag pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:0.4 pss-sw-gov-registry.vih.infineon.com/tiqc/electrode
docker push pss-sw-gov-registry.vih.infineon.com/tiqc/electrode:0.4
docker push pss-sw-gov-registry.vih.infineon.com/tiqc/electrode
