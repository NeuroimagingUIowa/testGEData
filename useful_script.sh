#!/usr/bin/env bash

# rename folders from numbers to a semi-useful description
for fold in $(pwd)/20180831/SCANS/*; do 
	first_dicom=$(find ${fold} -name *.dcm -print -quit)
	base_name=$(dicom_hdr ${first_dicom} | grep '0008 103e' | cut -d" " -f29- | tr ' ' '_' | tr '/' '-' | tr '=' '-')
	mv ${fold} $(dirname ${fold})/${base_name}
done
