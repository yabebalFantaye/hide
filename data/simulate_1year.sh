rootDir="/data/data"
#1 year
#time hide --strategy-start=2016-01-01-00:00:00 \
#--strategy-end=2016-12-31-23:59:00 \
#--verbose=False hide.config.bleien7m

# #train: 1 year
# echo ""
# echo "HIDE: generating 1 year data for training.. "
# time hide --output-path="${rootDir}/hide_sims_train/uncalib_1year" \
#      --strategy-start="2016-01-01-00:00:00" --strategy-end="2017-01-01-23:59:00" \
#      --verbose=True hide.config.bleien7m



# #test: 1 month
# echo ""
# echo "HIDE: generating 1 month data for testing.. "
# time hide --output-path="${rootDir}/hide_sims_test/uncalib_1month" \
#      --strategy-start="2017-05-01-00:00:00" --strategy-end="2017-06-01-23:59:00" \
#      --verbose=False hide.config.bleien7m

# #test: 2 days
# echo ""
# echo "HIDE: generating 1 month data for testing.. "
# time hide --output-path="${rootDir}/hide_sims_test/uncalib_play" \
#      --strategy-start="2017-06-01-00:00:00" --strategy-end="2017-06-02-23:59:00" \
#      --verbose=False hide.config.bleien7m


#=====================================================
#------ SEEK ----
#=====================================================

#train: 1 year
echo ""
echo "SEEK: processing 1 year data for training.. "
time seek --file-prefix=${rootDir}'/hide_sims_train/uncalib_1year' \
     --post-processing-prefix=${rootDir}'/hide_sims_train/calib_1year'\
     --map-name=${rootDir}'/hide_sims_train/hide365_calib_maps.hdf' \
     --strategy-start="2016-01-01-00:00:00" \
     --strategy-end="2017-01-01-23:59:00"  \
     --verbose=False seek.config.hide_sim_fft #| tee ${rootDir}/hide_sims_train/seek.log

#train: 1 month
echo ""
echo "SEEK: processing 1 month data for testing.. "
time seek --file-prefix=${rootDir}'/hide_sims_test/uncalib_1month' \
     --post-processing-prefix=${rootDir}'/hide_sims_test/calib_1month'  \
     --map-name=${rootDir}'/hide_sims_test/hide30_calib_maps.hdf'  \
     --strategy-start="2017-05-01-00:00:00" --strategy-end="2017-06-01-23:59:00" \
     --verbose=False seek.config.hide_sim_fft #| tee ${rootDir}/hide_sims_test/seek.log

#train: 1 day
# echo ""
# echo "SEEK: processing 1 day data for testing.. ${rootDir}/hide_sims_test/uncalib_play"
# time seek --file-prefix="${rootDir}/hide_sims_test/uncalib_play" \
#      --post-processing-prefix="${rootDir}/hide_sims_test/calib_play"  \
#      --map-name="${rootDir}/hide_sims_test/hide1_calib_maps.hdf"  \
#      --strategy-start="2017-06-01-00:00:00" --strategy-end="2017-06-02-23:59:00" \
#      --verbose=True seek.config.hide_sim_fft #| tee ${rootDir}/hide_sims_test/seek.log


#=====================================================
#------ AOFLagger ----
#=====================================================



