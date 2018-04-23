#!/usr/bin/env python 
import sys, os
import h5py

f=sys.argv[1]
with h5py.File(f, "r") as fp:
        print(fp.keys()) #
