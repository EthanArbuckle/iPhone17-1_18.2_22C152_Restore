@interface PowerUIMLMacPredictor
- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8;
@end

@implementation PowerUIMLMacPredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a7;
  v13 = a8;
  v14 = [MEMORY[0x263EFF8F0] currentCalendar];
  v110 = [v14 components:96 fromDate:v12];

  double v15 = (double)[v110 hour];
  double v16 = 0.0;
  uint64_t v17 = +[PowerUIPredictorHelper events:v11 forHourBin:1 date:v12 withMaxDuration:0.0];
  uint64_t v18 = +[PowerUIPredictorHelper events:v11 forHourBin:2 date:v12 withMaxDuration:0.0];
  uint64_t v19 = +[PowerUIPredictorHelper events:v11 forHourBin:4 date:v12 withMaxDuration:0.0];
  uint64_t v20 = +[PowerUIPredictorHelper events:v11 forHourBin:8 date:v12 withMaxDuration:0.0];
  uint64_t v21 = +[PowerUIPredictorHelper events:v11 forHourBin:16 date:v12 withMaxDuration:0.0];
  uint64_t v22 = +[PowerUIPredictorHelper events:v11 forHourBin:24 date:v12 withMaxDuration:0.0];
  +[PowerUIPredictorHelper standardDeviationOf:v17];
  double v94 = v23;
  +[PowerUIPredictorHelper standardDeviationOf:v18];
  double v95 = v24;
  +[PowerUIPredictorHelper standardDeviationOf:v19];
  double v96 = v25;
  +[PowerUIPredictorHelper standardDeviationOf:v20];
  double v97 = v26;
  +[PowerUIPredictorHelper standardDeviationOf:v21];
  id v98 = v27;
  +[PowerUIPredictorHelper standardDeviationOf:v22];
  double v111 = v28;
  v104 = (void *)v17;
  +[PowerUIPredictorHelper medianOf:v17];
  double v30 = v29;
  v109 = (void *)v18;
  +[PowerUIPredictorHelper medianOf:v18];
  double v32 = v31;
  v103 = (void *)v19;
  +[PowerUIPredictorHelper medianOf:v19];
  double v34 = v33;
  v102 = (void *)v20;
  +[PowerUIPredictorHelper medianOf:v20];
  double v36 = v35;
  v101 = (void *)v21;
  +[PowerUIPredictorHelper medianOf:v21];
  double v38 = v37;
  v108 = (void *)v22;
  +[PowerUIPredictorHelper medianOf:v22];
  double v93 = v39;
  v40 = [MEMORY[0x263EFF9A0] dictionary];
  v41 = [NSNumber numberWithUnsignedInteger:a5];
  [v40 setObject:v41 forKeyedSubscript:@"plugin_battery_level"];

  v42 = [NSNumber numberWithDouble:v15];
  [v40 setObject:v42 forKeyedSubscript:@"hour"];

  v43 = NSNumber;
  v44 = [v11 lastObject];
  v45 = [v44 endDate];
  v46 = [v11 lastObject];
  v47 = [v46 startDate];
  [v45 timeIntervalSinceDate:v47];
  v49 = [v43 numberWithDouble:v48 / 3600.0];
  [v40 setObject:v49 forKeyedSubscript:@"prev_charge_duration_1"];

  v105 = v12;
  v107 = v11;
  v50 = +[PowerUIPredictorHelper getUsageBucketsForEvents:v11 forDate:v12 withLog:v13];
  +[PowerUIPredictorHelper hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:](PowerUIPredictorHelper, "hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:", v50, (int)a3, [v110 minute]);
  v51 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v40 setObject:v51 forKeyedSubscript:@"hours_until_use"];

  uint64_t v52 = 0;
  do
  {
    v53 = objc_msgSend(NSString, "stringWithFormat:", @"hour_plus_%d", v52);
    int v54 = (int)(v16 + a3);
    if (v54 > 23) {
      v54 -= 24;
    }
    v55 = NSNumber;
    v56 = [v50 objectAtIndexedSubscript:v54];
    [v56 doubleValue];
    v57 = objc_msgSend(v55, "numberWithDouble:");
    [v40 setObject:v57 forKeyedSubscript:v53];

    double v16 = v16 + 1.0;
    uint64_t v52 = (v52 + 1);
  }
  while (v52 != 6);
  v100 = v50;
  v58 = [NSNumber numberWithDouble:v30];
  [v40 setObject:v58 forKeyedSubscript:@"med_dur_1"];

  v59 = [NSNumber numberWithDouble:v32];
  [v40 setObject:v59 forKeyedSubscript:@"med_dur_2"];

  v60 = [NSNumber numberWithDouble:v34];
  [v40 setObject:v60 forKeyedSubscript:@"med_dur_4"];

  v61 = [NSNumber numberWithDouble:v36];
  [v40 setObject:v61 forKeyedSubscript:@"med_dur_8"];

  v62 = [NSNumber numberWithDouble:v38];
  [v40 setObject:v62 forKeyedSubscript:@"med_dur_16"];

  v63 = [NSNumber numberWithDouble:v93];
  [v40 setObject:v63 forKeyedSubscript:@"med_dur_24"];

  v64 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v109, "count"));
  [v40 setObject:v64 forKeyedSubscript:@"cnt_dur_2"];

  v65 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v108, "count"));
  [v40 setObject:v65 forKeyedSubscript:@"cnt_dur_24"];

  v66 = [NSNumber numberWithDouble:v94];
  [v40 setObject:v66 forKeyedSubscript:@"std_dur_1"];

  v67 = [NSNumber numberWithDouble:v95];
  [v40 setObject:v67 forKeyedSubscript:@"std_dur_2"];

  v68 = [NSNumber numberWithDouble:v96];
  [v40 setObject:v68 forKeyedSubscript:@"std_dur_4"];

  v69 = [NSNumber numberWithDouble:v97];
  [v40 setObject:v69 forKeyedSubscript:@"std_dur_8"];

  v70 = [NSNumber numberWithDouble:*(double *)&v98];
  [v40 setObject:v70 forKeyedSubscript:@"std_dur_16"];

  v71 = [NSNumber numberWithDouble:v111];
  [v40 setObject:v71 forKeyedSubscript:@"std_dur_24"];

  id v99 = (id)[objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v40 error:0];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v72 = v40;
  v73 = [v40 allKeys];
  uint64_t v74 = [v73 countByEnumeratingWithState:&v113 objects:v124 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v114;
    do
    {
      uint64_t v77 = 0;
      do
      {
        if (*(void *)v114 != v76) {
          objc_enumerationMutation(v73);
        }
        v78 = *(void **)(*((void *)&v113 + 1) + 8 * v77);
        v79 = v13;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          v80 = [v72 objectForKeyedSubscript:v78];
          *(_DWORD *)buf = 138412546;
          v121 = v78;
          __int16 v122 = 2112;
          v123 = v80;
          _os_log_debug_impl(&dword_22135E000, v79, OS_LOG_TYPE_DEBUG, "input for feature '%@': %@", buf, 0x16u);
        }
        ++v77;
      }
      while (v75 != v77);
      uint64_t v75 = [v73 countByEnumeratingWithState:&v113 objects:v124 count:16];
    }
    while (v75);
  }

  [v105 timeIntervalSince1970];
  double v82 = floor(v81);
  v118[0] = @"pluginDateAsInterval";
  v83 = [NSNumber numberWithDouble:v82];
  v119[0] = v83;
  v119[1] = v72;
  v84 = v72;
  v118[1] = @"features";
  v118[2] = @"dataVersion";
  v119[2] = &unk_26D3852D0;
  v85 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:3];

  v86 = NSURL;
  v117[0] = @"/var/mobile/Library/PowerUI";
  v117[1] = @"obc_features";
  v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:2];
  v88 = [v86 fileURLWithPathComponents:v87];

  id v112 = 0;
  [v85 writeToURL:v88 error:&v112];
  id v89 = v112;
  if (v89)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PowerUIMLMacPredictor getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:]((uint64_t)v89, v13);
    }
  }
  else
  {
    v90 = v13;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = [NSNumber numberWithDouble:v82];
      *(_DWORD *)buf = 138412290;
      v121 = v91;
      _os_log_impl(&dword_22135E000, v90, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);
    }
  }

  return v99;
}

- (void)getInputFeatures:(uint64_t)a1 events:(NSObject *)a2 pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22135E000, a2, OS_LOG_TYPE_ERROR, "Error saving latest features: %@", (uint8_t *)&v2, 0xCu);
}

@end