@interface PowerUIMLPhonePredictor
- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8;
- (id)getMultiArrayForFeatureDict:(id)a3;
- (int)modelDataVersion;
@end

@implementation PowerUIMLPhonePredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  id v10 = a7;
  id v115 = a8;
  id v11 = a4;
  uint64_t v12 = +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:1];
  uint64_t v13 = +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:2];
  uint64_t v14 = +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:4];
  uint64_t v15 = +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:8];
  v148 = +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:16];
  uint64_t v16 = +[PowerUIPredictorHelper filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:24];

  uint64_t v17 = +[PowerUIPredictorHelper filterEvents:v12 startOnSameWeekdayAs:v10];
  v142 = (void *)v13;
  uint64_t v18 = +[PowerUIPredictorHelper filterEvents:v13 startOnSameWeekdayAs:v10];
  v114 = (void *)v14;
  uint64_t v19 = +[PowerUIPredictorHelper filterEvents:v14 startOnSameWeekdayAs:v10];
  v145 = +[PowerUIPredictorHelper filterEvents:v15 startOnSameWeekdayAs:v10];
  v140 = v10;
  v144 = +[PowerUIPredictorHelper filterEvents:v16 startOnSameWeekdayAs:v10];
  v143 = (void *)v12;
  v141 = +[PowerUIPredictorHelper getDurationsFromEvents:v12 withUnit:3600.0 cappedAt:0.0];
  uint64_t v20 = +[PowerUIPredictorHelper getDurationsFromEvents:v13 withUnit:3600.0 cappedAt:0.0];
  v21 = +[PowerUIPredictorHelper getDurationsFromEvents:v14 withUnit:3600.0 cappedAt:0.0];
  v147 = (void *)v15;
  uint64_t v22 = +[PowerUIPredictorHelper getDurationsFromEvents:v15 withUnit:3600.0 cappedAt:0.0];
  uint64_t v23 = +[PowerUIPredictorHelper getDurationsFromEvents:v148 withUnit:3600.0 cappedAt:0.0];
  v146 = (void *)v16;
  uint64_t v24 = +[PowerUIPredictorHelper getDurationsFromEvents:v16 withUnit:3600.0 cappedAt:0.0];
  v125 = (void *)v17;
  v139 = +[PowerUIPredictorHelper getDurationsFromEvents:v17 withUnit:3600.0 cappedAt:0.0];
  v124 = (void *)v18;
  v138 = +[PowerUIPredictorHelper getDurationsFromEvents:v18 withUnit:3600.0 cappedAt:0.0];
  v123 = (void *)v19;
  uint64_t v25 = +[PowerUIPredictorHelper getDurationsFromEvents:v19 withUnit:3600.0 cappedAt:0.0];
  uint64_t v26 = +[PowerUIPredictorHelper getDurationsFromEvents:v145 withUnit:3600.0 cappedAt:0.0];
  uint64_t v27 = +[PowerUIPredictorHelper getDurationsFromEvents:v144 withUnit:3600.0 cappedAt:0.0];
  +[PowerUIPredictorHelper standardDeviationOf:v141];
  double v133 = v28;
  +[PowerUIPredictorHelper standardDeviationOf:v20];
  double v134 = v29;
  +[PowerUIPredictorHelper standardDeviationOf:v21];
  double v136 = v30;
  +[PowerUIPredictorHelper standardDeviationOf:v22];
  double v32 = v31;
  +[PowerUIPredictorHelper standardDeviationOf:v23];
  double v34 = v33;
  +[PowerUIPredictorHelper standardDeviationOf:v24];
  double v36 = v35;
  +[PowerUIPredictorHelper standardDeviationOf:v25];
  double v38 = v37;
  +[PowerUIPredictorHelper medianOf:v141];
  double v40 = v39;
  v113 = (void *)v20;
  +[PowerUIPredictorHelper medianOf:v20];
  double v127 = v41;
  +[PowerUIPredictorHelper medianOf:v21];
  double v128 = v42;
  v121 = (void *)v22;
  +[PowerUIPredictorHelper medianOf:v22];
  double v129 = v43;
  v120 = (void *)v23;
  +[PowerUIPredictorHelper medianOf:v23];
  double v130 = v44;
  v119 = (void *)v24;
  +[PowerUIPredictorHelper medianOf:v24];
  double v131 = v45;
  +[PowerUIPredictorHelper medianOf:v139];
  double v135 = v46;
  +[PowerUIPredictorHelper medianOf:v138];
  double v137 = v47;
  v118 = (void *)v25;
  uint64_t v48 = v25;
  v49 = v114;
  +[PowerUIPredictorHelper medianOf:v48];
  double v51 = v50;
  v117 = (void *)v26;
  +[PowerUIPredictorHelper medianOf:v26];
  double v53 = v52;
  v116 = (void *)v27;
  +[PowerUIPredictorHelper medianOf:v27];
  double v55 = v54;
  v56 = v115;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = [NSNumber numberWithUnsignedInteger:a5];
    v58 = [NSNumber numberWithDouble:a3];
    v59 = [NSNumber numberWithDouble:a6];
    *(_DWORD *)buf = 138412802;
    double v156 = *(double *)&v57;
    __int16 v157 = 2112;
    double v158 = *(double *)&v58;
    __int16 v159 = 2112;
    double v160 = *(double *)&v59;
    _os_log_impl(&dword_22135E000, v56, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x20u);

    v49 = v114;
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]2();
  }
  v60 = v56;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v61 = [v143 count];
    *(_DWORD *)buf = 134218496;
    double v156 = *(double *)&v61;
    __int16 v157 = 2048;
    double v158 = v133;
    __int16 v159 = 2048;
    double v160 = v40;
    _os_log_impl(&dword_22135E000, v60, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]1();
  }
  v62 = v60;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v63 = [v142 count];
    *(_DWORD *)buf = 134218496;
    double v156 = *(double *)&v63;
    __int16 v157 = 2048;
    double v158 = v134;
    __int16 v159 = 2048;
    double v160 = v127;
    _os_log_impl(&dword_22135E000, v62, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]0();
  }
  v64 = v62;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v65 = [v49 count];
    *(_DWORD *)buf = 134218496;
    double v156 = *(double *)&v65;
    __int16 v157 = 2048;
    double v158 = v136;
    __int16 v159 = 2048;
    double v160 = v128;
    _os_log_impl(&dword_22135E000, v64, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.9();
  }
  v66 = v64;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v67 = [v147 count];
    *(_DWORD *)buf = 134218496;
    double v156 = *(double *)&v67;
    __int16 v157 = 2048;
    double v158 = v32;
    __int16 v159 = 2048;
    double v160 = v129;
    _os_log_impl(&dword_22135E000, v66, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.8();
  }
  v68 = v66;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v69 = [v148 count];
    *(_DWORD *)buf = 134218496;
    double v156 = *(double *)&v69;
    __int16 v157 = 2048;
    double v158 = v34;
    __int16 v159 = 2048;
    double v160 = v130;
    _os_log_impl(&dword_22135E000, v68, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.7();
  }
  v70 = v68;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v71 = [v146 count];
    *(_DWORD *)buf = 134218496;
    double v156 = *(double *)&v71;
    __int16 v157 = 2048;
    double v158 = v36;
    __int16 v159 = 2048;
    double v160 = v131;
    _os_log_impl(&dword_22135E000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.6();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v156 = v135;
    _os_log_impl(&dword_22135E000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday1: weekday_med_dur_1: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.5();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v156 = v137;
    _os_log_impl(&dword_22135E000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday2: weekday_med_dur_2: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:].cold.4();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v156 = v51;
    __int16 v157 = 2048;
    double v158 = v38;
    _os_log_impl(&dword_22135E000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday4: weekday_med_dur_4: %lf, weekday_std_dur_4: %lf", buf, 0x16u);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v156 = v53;
    _os_log_impl(&dword_22135E000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday8: weekday_med_dur_8: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v156 = v55;
    _os_log_impl(&dword_22135E000, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday24: weekday_med_dur_24: %lf", buf, 0xCu);
  }
  v72 = [MEMORY[0x263EFF9A0] dictionary];
  v73 = [NSNumber numberWithUnsignedInteger:a5];
  [v72 setObject:v73 forKeyedSubscript:@"plugin_battery_level"];

  v74 = [NSNumber numberWithDouble:a6];
  [v72 setObject:v74 forKeyedSubscript:@"time_from_plugin"];

  v75 = [NSNumber numberWithDouble:v40];
  [v72 setObject:v75 forKeyedSubscript:@"med_dur_1"];

  v76 = [NSNumber numberWithDouble:v127];
  [v72 setObject:v76 forKeyedSubscript:@"med_dur_2"];

  v77 = [NSNumber numberWithDouble:v128];
  [v72 setObject:v77 forKeyedSubscript:@"med_dur_4"];

  v78 = [NSNumber numberWithDouble:v129];
  [v72 setObject:v78 forKeyedSubscript:@"med_dur_8"];

  v79 = [NSNumber numberWithDouble:v130];
  [v72 setObject:v79 forKeyedSubscript:@"med_dur_16"];

  v80 = [NSNumber numberWithDouble:v131];
  [v72 setObject:v80 forKeyedSubscript:@"med_dur_24"];

  v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v143, "count"));
  [v72 setObject:v81 forKeyedSubscript:@"cnt_dur_1"];

  v82 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v142, "count"));
  [v72 setObject:v82 forKeyedSubscript:@"cnt_dur_2"];

  v83 = v49;
  v84 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v49, "count"));
  [v72 setObject:v84 forKeyedSubscript:@"cnt_dur_4"];

  v85 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v147, "count"));
  [v72 setObject:v85 forKeyedSubscript:@"cnt_dur_8"];

  v86 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v148, "count"));
  [v72 setObject:v86 forKeyedSubscript:@"cnt_dur_16"];

  v87 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v146, "count"));
  [v72 setObject:v87 forKeyedSubscript:@"cnt_dur_24"];

  v88 = [NSNumber numberWithDouble:v133];
  [v72 setObject:v88 forKeyedSubscript:@"std_dur_1"];

  v89 = [NSNumber numberWithDouble:v134];
  [v72 setObject:v89 forKeyedSubscript:@"std_dur_2"];

  v90 = [NSNumber numberWithDouble:v136];
  [v72 setObject:v90 forKeyedSubscript:@"std_dur_4"];

  v91 = [NSNumber numberWithDouble:v32];
  [v72 setObject:v91 forKeyedSubscript:@"std_dur_8"];

  v92 = [NSNumber numberWithDouble:v34];
  [v72 setObject:v92 forKeyedSubscript:@"std_dur_16"];

  v93 = [NSNumber numberWithDouble:v36];
  [v72 setObject:v93 forKeyedSubscript:@"std_dur_24"];

  v94 = [NSNumber numberWithDouble:v135];
  [v72 setObject:v94 forKeyedSubscript:@"weekday_med_dur_1"];

  v95 = [NSNumber numberWithDouble:v137];
  [v72 setObject:v95 forKeyedSubscript:@"weekday_med_dur_2"];

  v96 = [NSNumber numberWithDouble:v51];
  [v72 setObject:v96 forKeyedSubscript:@"weekday_med_dur_4"];

  v97 = [NSNumber numberWithDouble:v53];
  [v72 setObject:v97 forKeyedSubscript:@"weekday_med_dur_8"];

  v98 = [NSNumber numberWithDouble:v55];
  [v72 setObject:v98 forKeyedSubscript:@"weekday_med_dur_24"];

  v99 = [NSNumber numberWithDouble:v38];
  [v72 setObject:v99 forKeyedSubscript:@"weekday_std_dur_4"];

  v100 = (void *)[objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v72 error:0];
  [v140 timeIntervalSince1970];
  double v102 = floor(v101);
  v153[0] = @"pluginDateAsInterval";
  v103 = [NSNumber numberWithDouble:v102];
  v154[0] = v103;
  v154[1] = v72;
  v153[1] = @"features";
  v153[2] = @"dataVersion";
  v154[2] = &unk_26D385288;
  v104 = [NSDictionary dictionaryWithObjects:v154 forKeys:v153 count:3];

  v105 = NSURL;
  v152[0] = @"/var/mobile/Library/PowerUI";
  v152[1] = @"obc_features";
  v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:2];
  v107 = [v105 fileURLWithPathComponents:v106];

  id v151 = 0;
  [v104 writeToURL:v107 error:&v151];
  id v108 = v151;
  if (v108)
  {
    v150.receiver = self;
    v150.super_class = (Class)PowerUIMLPhonePredictor;
    v109 = [(PowerUIMLTwoStageModelPredictor *)&v150 log];
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
      -[PowerUIMLPhonePredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]();
    }
  }
  else
  {
    v149.receiver = self;
    v149.super_class = (Class)PowerUIMLPhonePredictor;
    v109 = [(PowerUIMLTwoStageModelPredictor *)&v149 log];
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      v110 = [NSNumber numberWithDouble:v102];
      *(_DWORD *)buf = 138412290;
      double v156 = *(double *)&v110;
      _os_log_impl(&dword_22135E000, v109, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);
    }
  }

  return v100;
}

- (id)getMultiArrayForFeatureDict:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [&unk_26D385A68 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v7 = v5;
  char v19 = 0;
  uint64_t v8 = *(void *)v24;
  *(void *)&long long v6 = 138412290;
  long long v18 = v6;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(&unk_26D385A68);
      }
      uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
      id v11 = NSNumber;
      uint64_t v12 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, v18);
      [v12 doubleValue];
      uint64_t v13 = objc_msgSend(v11, "numberWithDouble:");

      if (v13)
      {
        [v4 addObject:v13];
      }
      else
      {
        v22.receiver = self;
        v22.super_class = (Class)PowerUIMLPhonePredictor;
        uint64_t v14 = [(PowerUIMLTwoStageModelPredictor *)&v22 log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          uint64_t v28 = v10;
          _os_log_error_impl(&dword_22135E000, v14, OS_LOG_TYPE_ERROR, "Error: feature value for key '%@' is nil", buf, 0xCu);
        }

        char v19 = 1;
      }
    }
    uint64_t v7 = [&unk_26D385A68 countByEnumeratingWithState:&v23 objects:v29 count:16];
  }
  while (v7);
  if (v19)
  {
    uint64_t v15 = 0;
  }
  else
  {
LABEL_15:
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
    v21.receiver = self;
    v21.super_class = (Class)PowerUIMLPhonePredictor;
    uint64_t v15 = [(PowerUIMLTwoStageModelPredictor *)&v21 arrayWithShape:&unk_26D385A80 values:v16 type:65568];
  }
  return v15;
}

- (int)modelDataVersion
{
  return 2;
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22135E000, v0, OS_LOG_TYPE_ERROR, "Error saving latest features: %@", v1, 0xCu);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "weekday24 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "weekday8 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "weekday4 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "weekday2 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "weekday1 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "hourBin24 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "hourBin16 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "hourBin8 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "hourBin4 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "hourBin2 events: %@", v2, v3, v4, v5, v6);
}

- (void)getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "hourBin1 events: %@", v2, v3, v4, v5, v6);
}

@end