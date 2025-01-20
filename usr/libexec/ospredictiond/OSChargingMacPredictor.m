@interface OSChargingMacPredictor
- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8;
@end

@implementation OSChargingMacPredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  id v11 = a4;
  id v12 = a7;
  v13 = a8;
  v14 = +[NSCalendar currentCalendar];
  v107 = [v14 components:96 fromDate:v12];

  double v15 = (double)(uint64_t)[v107 hour];
  double v16 = 0.0;
  uint64_t v17 = +[OSIntelligenceUtilities events:v11 forHourBin:1 date:v12 withMaxDuration:0.0];
  uint64_t v18 = +[OSIntelligenceUtilities events:v11 forHourBin:2 date:v12 withMaxDuration:0.0];
  uint64_t v19 = +[OSIntelligenceUtilities events:v11 forHourBin:4 date:v12 withMaxDuration:0.0];
  uint64_t v20 = +[OSIntelligenceUtilities events:v11 forHourBin:8 date:v12 withMaxDuration:0.0];
  uint64_t v21 = +[OSIntelligenceUtilities events:v11 forHourBin:16 date:v12 withMaxDuration:0.0];
  uint64_t v22 = +[OSIntelligenceUtilities events:v11 forHourBin:24 date:v12 withMaxDuration:0.0];
  +[OSIntelligenceUtilities standardDeviationOf:v17];
  double v91 = v23;
  +[OSIntelligenceUtilities standardDeviationOf:v18];
  double v92 = v24;
  +[OSIntelligenceUtilities standardDeviationOf:v19];
  double v93 = v25;
  +[OSIntelligenceUtilities standardDeviationOf:v20];
  double v94 = v26;
  +[OSIntelligenceUtilities standardDeviationOf:v21];
  id v95 = v27;
  +[OSIntelligenceUtilities standardDeviationOf:v22];
  double v108 = v28;
  v101 = (void *)v17;
  +[OSIntelligenceUtilities medianOf:v17];
  double v30 = v29;
  v106 = (void *)v18;
  +[OSIntelligenceUtilities medianOf:v18];
  double v32 = v31;
  v100 = (void *)v19;
  +[OSIntelligenceUtilities medianOf:v19];
  double v34 = v33;
  v99 = (void *)v20;
  +[OSIntelligenceUtilities medianOf:v20];
  double v36 = v35;
  v98 = (void *)v21;
  +[OSIntelligenceUtilities medianOf:v21];
  double v38 = v37;
  v105 = (void *)v22;
  +[OSIntelligenceUtilities medianOf:v22];
  double v90 = v39;
  v40 = +[NSMutableDictionary dictionary];
  v41 = +[NSNumber numberWithUnsignedInteger:a5];
  [v40 setObject:v41 forKeyedSubscript:@"plugin_battery_level"];

  v42 = +[NSNumber numberWithDouble:v15];
  [v40 setObject:v42 forKeyedSubscript:@"hour"];

  v43 = [v11 lastObject];
  v44 = [v43 endDate];
  v45 = [v11 lastObject];
  v46 = [v45 startDate];
  [v44 timeIntervalSinceDate:v46];
  v48 = +[NSNumber numberWithDouble:v47 / 3600.0];
  [v40 setObject:v48 forKeyedSubscript:@"prev_charge_duration_1"];

  v102 = v12;
  v104 = v11;
  v49 = +[OSIntelligenceUtilities getUsageBucketsForEvents:v11 forDate:v12 withLog:v13];
  +[OSIntelligenceUtilities hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:](OSIntelligenceUtilities, "hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:", v49, (int)a3, [v107 minute]);
  v50 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v40 setObject:v50 forKeyedSubscript:@"hours_until_use"];

  uint64_t v51 = 0;
  do
  {
    v52 = +[NSString stringWithFormat:@"hour_plus_%d", v51];
    int v53 = (int)(v16 + a3);
    if (v53 > 23) {
      v53 -= 24;
    }
    v54 = [v49 objectAtIndexedSubscript:v53];
    [v54 doubleValue];
    v55 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v40 setObject:v55 forKeyedSubscript:v52];

    double v16 = v16 + 1.0;
    uint64_t v51 = (v51 + 1);
  }
  while (v51 != 6);
  v97 = v49;
  v56 = +[NSNumber numberWithDouble:v30];
  [v40 setObject:v56 forKeyedSubscript:@"med_dur_1"];

  v57 = +[NSNumber numberWithDouble:v32];
  [v40 setObject:v57 forKeyedSubscript:@"med_dur_2"];

  v58 = +[NSNumber numberWithDouble:v34];
  [v40 setObject:v58 forKeyedSubscript:@"med_dur_4"];

  v59 = +[NSNumber numberWithDouble:v36];
  [v40 setObject:v59 forKeyedSubscript:@"med_dur_8"];

  v60 = +[NSNumber numberWithDouble:v38];
  [v40 setObject:v60 forKeyedSubscript:@"med_dur_16"];

  v61 = +[NSNumber numberWithDouble:v90];
  [v40 setObject:v61 forKeyedSubscript:@"med_dur_24"];

  v62 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v106 count]);
  [v40 setObject:v62 forKeyedSubscript:@"cnt_dur_2"];

  v63 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v105 count]);
  [v40 setObject:v63 forKeyedSubscript:@"cnt_dur_24"];

  v64 = +[NSNumber numberWithDouble:v91];
  [v40 setObject:v64 forKeyedSubscript:@"std_dur_1"];

  v65 = +[NSNumber numberWithDouble:v92];
  [v40 setObject:v65 forKeyedSubscript:@"std_dur_2"];

  v66 = +[NSNumber numberWithDouble:v93];
  [v40 setObject:v66 forKeyedSubscript:@"std_dur_4"];

  v67 = +[NSNumber numberWithDouble:v94];
  [v40 setObject:v67 forKeyedSubscript:@"std_dur_8"];

  v68 = +[NSNumber numberWithDouble:*(double *)&v95];
  [v40 setObject:v68 forKeyedSubscript:@"std_dur_16"];

  v69 = +[NSNumber numberWithDouble:v108];
  [v40 setObject:v69 forKeyedSubscript:@"std_dur_24"];

  id v96 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v40 error:0];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v70 = v40;
  v71 = [v40 allKeys];
  id v72 = [v71 countByEnumeratingWithState:&v110 objects:v121 count:16];
  if (v72)
  {
    id v73 = v72;
    uint64_t v74 = *(void *)v111;
    do
    {
      v75 = 0;
      do
      {
        if (*(void *)v111 != v74) {
          objc_enumerationMutation(v71);
        }
        v76 = *(void **)(*((void *)&v110 + 1) + 8 * (void)v75);
        v77 = v13;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          v78 = [v70 objectForKeyedSubscript:v76];
          *(_DWORD *)buf = 138412546;
          v118 = v76;
          __int16 v119 = 2112;
          v120 = v78;
          _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "input for feature '%@': %@", buf, 0x16u);
        }
        v75 = (char *)v75 + 1;
      }
      while (v73 != v75);
      id v73 = [v71 countByEnumeratingWithState:&v110 objects:v121 count:16];
    }
    while (v73);
  }

  [v102 timeIntervalSince1970];
  double v80 = floor(v79);
  v115[0] = @"pluginDateAsInterval";
  v81 = +[NSNumber numberWithDouble:v80];
  v116[0] = v81;
  v116[1] = v70;
  v82 = v70;
  v115[1] = @"features";
  v115[2] = @"dataVersion";
  v116[2] = &off_100068D80;
  v83 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:3];

  v114[0] = @"/var/mobile/Library/OSIntelligence";
  v114[1] = @"obc_features";
  v84 = +[NSArray arrayWithObjects:v114 count:2];
  v85 = +[NSURL fileURLWithPathComponents:v84];

  id v109 = 0;
  [v83 writeToURL:v85 error:&v109];
  id v86 = v109;
  if (v86)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100042BCC((uint64_t)v86, v13);
    }
  }
  else
  {
    v87 = v13;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      v88 = +[NSNumber numberWithDouble:v80];
      *(_DWORD *)buf = 138412290;
      v118 = v88;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);
    }
  }

  return v96;
}

@end