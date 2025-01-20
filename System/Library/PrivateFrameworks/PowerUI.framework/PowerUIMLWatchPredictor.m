@interface PowerUIMLWatchPredictor
- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8;
@end

@implementation PowerUIMLWatchPredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  uint64_t v139 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a7;
  id v12 = a8;
  v13 = [MEMORY[0x263EFF8F0] currentCalendar];
  v14 = [v13 components:32 fromDate:v11];

  v103 = v14;
  double v115 = (double)[v14 hour];
  v15 = +[PowerUIPredictorHelper events:v10 forHourBin:1 date:v11 withMaxDuration:12.0];
  uint64_t v16 = +[PowerUIPredictorHelper events:v10 forHourBin:2 date:v11 withMaxDuration:12.0];
  v17 = +[PowerUIPredictorHelper events:v10 forHourBin:4 date:v11 withMaxDuration:12.0];
  v18 = +[PowerUIPredictorHelper events:v10 forHourBin:8 date:v11 withMaxDuration:12.0];
  uint64_t v19 = +[PowerUIPredictorHelper events:v10 forHourBin:16 date:v11 withMaxDuration:12.0];
  v106 = v10;
  v20 = +[PowerUIPredictorHelper events:v10 forHourBin:24 date:v11 withMaxDuration:12.0];
  +[PowerUIPredictorHelper standardDeviationOf:v15];
  double v22 = v21;
  +[PowerUIPredictorHelper standardDeviationOf:v16];
  double v24 = v23;
  +[PowerUIPredictorHelper standardDeviationOf:v17];
  double v26 = v25;
  +[PowerUIPredictorHelper standardDeviationOf:v18];
  double v28 = v27;
  +[PowerUIPredictorHelper standardDeviationOf:v19];
  double v30 = v29;
  +[PowerUIPredictorHelper standardDeviationOf:v20];
  double v32 = v31;
  +[PowerUIPredictorHelper medianOf:v15];
  id v107 = v33;
  v118 = (void *)v16;
  +[PowerUIPredictorHelper medianOf:v16];
  double v109 = v34;
  +[PowerUIPredictorHelper medianOf:v17];
  double v111 = v35;
  +[PowerUIPredictorHelper medianOf:v18];
  double v113 = v36;
  v117 = (void *)v19;
  +[PowerUIPredictorHelper medianOf:v19];
  double v38 = v37;
  +[PowerUIPredictorHelper medianOf:v20];
  double v40 = v39;
  v41 = v12;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = [NSNumber numberWithDouble:v115];
    [NSNumber numberWithUnsignedInteger:a5];
    v44 = v43 = v20;
    [NSNumber numberWithDouble:a3];
    v46 = v45 = v17;
    [NSNumber numberWithDouble:a6];
    v48 = v47 = v18;
    *(_DWORD *)buf = 138413058;
    uint64_t v132 = (uint64_t)v42;
    __int16 v133 = 2112;
    double v134 = *(double *)&v44;
    __int16 v135 = 2112;
    double v136 = *(double *)&v46;
    __int16 v137 = 2112;
    v138 = v48;
    _os_log_impl(&dword_22135E000, v41, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginHour=%@, PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x2Au);

    v18 = v47;
    v17 = v45;

    v20 = v43;
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]2();
  }
  v49 = v41;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = [v15 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v132 = v50;
    __int16 v133 = 2048;
    double v134 = v22;
    __int16 v135 = 2048;
    double v136 = *(double *)&v107;
    _os_log_impl(&dword_22135E000, v49, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]1();
  }
  v51 = v49;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v52 = [v118 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v132 = v52;
    __int16 v133 = 2048;
    double v134 = v24;
    __int16 v135 = 2048;
    double v136 = v109;
    _os_log_impl(&dword_22135E000, v51, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]0();
  }
  v53 = v51;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v54 = [v17 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v132 = v54;
    __int16 v133 = 2048;
    double v134 = v26;
    __int16 v135 = 2048;
    double v136 = v111;
    _os_log_impl(&dword_22135E000, v53, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.9();
  }
  v55 = v53;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v56 = [v18 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v132 = v56;
    __int16 v133 = 2048;
    double v134 = v28;
    __int16 v135 = 2048;
    double v136 = v113;
    _os_log_impl(&dword_22135E000, v55, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.8();
  }
  v57 = v55;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v58 = [v117 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v132 = v58;
    __int16 v133 = 2048;
    double v134 = v30;
    __int16 v135 = 2048;
    double v136 = v38;
    _os_log_impl(&dword_22135E000, v57, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }
  v105 = v11;

  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.7();
  }
  v59 = v57;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v60 = [v20 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v132 = v60;
    __int16 v133 = 2048;
    double v134 = v32;
    __int16 v135 = 2048;
    double v136 = v40;
    _os_log_impl(&dword_22135E000, v59, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  v61 = [MEMORY[0x263EFF9A0] dictionary];
  v62 = [NSNumber numberWithUnsignedInteger:a5];
  [v61 setObject:v62 forKeyedSubscript:@"plugin_battery_level"];

  v63 = [NSNumber numberWithDouble:a6];
  [v61 setObject:v63 forKeyedSubscript:@"time_from_plugin"];

  v64 = [NSNumber numberWithDouble:v115];
  [v61 setObject:v64 forKeyedSubscript:@"hour"];

  v65 = [NSNumber numberWithDouble:*(double *)&v107];
  [v61 setObject:v65 forKeyedSubscript:@"med_dur_1"];

  v66 = [NSNumber numberWithDouble:v109];
  [v61 setObject:v66 forKeyedSubscript:@"med_dur_2"];

  v67 = [NSNumber numberWithDouble:v111];
  [v61 setObject:v67 forKeyedSubscript:@"med_dur_4"];

  v68 = [NSNumber numberWithDouble:v113];
  [v61 setObject:v68 forKeyedSubscript:@"med_dur_8"];

  v69 = [NSNumber numberWithDouble:v38];
  [v61 setObject:v69 forKeyedSubscript:@"med_dur_16"];

  v70 = [NSNumber numberWithDouble:v40];
  [v61 setObject:v70 forKeyedSubscript:@"med_dur_24"];

  v116 = v15;
  v71 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  [v61 setObject:v71 forKeyedSubscript:@"cnt_dur_1"];

  v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v118, "count"));
  [v61 setObject:v72 forKeyedSubscript:@"cnt_dur_2"];

  v114 = v17;
  v73 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
  [v61 setObject:v73 forKeyedSubscript:@"cnt_dur_4"];

  v112 = v18;
  v74 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  [v61 setObject:v74 forKeyedSubscript:@"cnt_dur_8"];

  v75 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v117, "count"));
  [v61 setObject:v75 forKeyedSubscript:@"cnt_dur_16"];

  v110 = v20;
  v76 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
  [v61 setObject:v76 forKeyedSubscript:@"cnt_dur_24"];

  v77 = [NSNumber numberWithDouble:v22];
  [v61 setObject:v77 forKeyedSubscript:@"std_dur_1"];

  v78 = [NSNumber numberWithDouble:v24];
  [v61 setObject:v78 forKeyedSubscript:@"std_dur_2"];

  v79 = [NSNumber numberWithDouble:v26];
  [v61 setObject:v79 forKeyedSubscript:@"std_dur_4"];

  v80 = [NSNumber numberWithDouble:v28];
  [v61 setObject:v80 forKeyedSubscript:@"std_dur_8"];

  v81 = [NSNumber numberWithDouble:v30];
  [v61 setObject:v81 forKeyedSubscript:@"std_dur_16"];

  v82 = [NSNumber numberWithDouble:v32];
  [v61 setObject:v82 forKeyedSubscript:@"std_dur_24"];

  id v108 = (id)[objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v61 error:0];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  v121 = v61;
  v83 = [v61 allKeys];
  uint64_t v84 = [v83 countByEnumeratingWithState:&v123 objects:v130 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v124;
    do
    {
      uint64_t v87 = 0;
      do
      {
        if (*(void *)v124 != v86) {
          objc_enumerationMutation(v83);
        }
        v88 = *(void **)(*((void *)&v123 + 1) + 8 * v87);
        v89 = v59;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          v90 = [v121 objectForKeyedSubscript:v88];
          *(_DWORD *)buf = 138412546;
          uint64_t v132 = (uint64_t)v88;
          __int16 v133 = 2112;
          double v134 = *(double *)&v90;
          _os_log_debug_impl(&dword_22135E000, v89, OS_LOG_TYPE_DEBUG, "input for feature '%@': %@", buf, 0x16u);
        }
        ++v87;
      }
      while (v85 != v87);
      uint64_t v85 = [v83 countByEnumeratingWithState:&v123 objects:v130 count:16];
    }
    while (v85);
  }

  [v105 timeIntervalSince1970];
  double v92 = floor(v91);
  v128[0] = @"pluginDateAsInterval";
  v93 = [NSNumber numberWithDouble:v92];
  v129[0] = v93;
  v129[1] = v121;
  v128[1] = @"features";
  v128[2] = @"dataVersion";
  v129[2] = &unk_26D385360;
  v94 = [NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:3];

  v95 = NSURL;
  v127[0] = @"/var/mobile/Library/PowerUI";
  v127[1] = @"obc_features";
  v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:2];
  v97 = [v95 fileURLWithPathComponents:v96];

  id v122 = 0;
  [v94 writeToURL:v97 error:&v122];
  id v98 = v122;
  if (v98)
  {
    v99 = v118;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]();
    }
  }
  else
  {
    v100 = v59;
    v99 = v118;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      v101 = [NSNumber numberWithDouble:v92];
      *(_DWORD *)buf = 138412290;
      uint64_t v132 = (uint64_t)v101;
      _os_log_impl(&dword_22135E000, v100, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);
    }
  }

  return v108;
}

@end