set_db init_lib_search_path /mnt/apps/prebuilt/eda/designkits/GPDK/gsclib045/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045 

set_db library timing/fast_vdd1v0_basicCells.lib

set_db lef_library {lef/gsclib045_tech.lef lef/gsclib045_macro.lef}

read_qrc qrc/qx/gpdk045.tch

read_hdl /mnt/scratch_b/users/e/emmakoto/picorv32.v

elaborate picorv32

check_design -all

read_sdc /mnt/scratch_b/users/e/emmakoto/DigitalHw/constraints1.sdc

set_db / .use_scan_seqs_for_non_dft false

check_timing_intent

syn_generic

syn_map

syn_opt

report_area

report_gates

report_timing

report_power

report_qor

# write_hdl > /mnt/scratch_b/users/e/emmakoto/DigitalHw/pico.v

# write_script > /mnt/scratch_b/users/e/emmakoto/DigitalHw/contraints.g

# write_sdc > /mnt/scratch_b/users/e/emmakoto/DigitalHw/constraints1_genus.sdc

write_design -innovus picorv32
