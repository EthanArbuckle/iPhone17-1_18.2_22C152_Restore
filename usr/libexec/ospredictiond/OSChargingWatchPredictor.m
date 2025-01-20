@interface OSChargingWatchPredictor
- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8;
@end

@implementation OSChargingWatchPredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  id v10 = a4;
  id v11 = a7;
  id v12 = a8;
  v13 = +[NSCalendar currentCalendar];
  v14 = [v13 components:32 fromDate:v11];

  v102 = v14;
  double v114 = (double)(uint64_t)[v14 hour];
  v15 = +[OSIntelligenceUtilities events:v10 forHourBin:1 date:v11 withMaxDuration:12.0];
  uint64_t v16 = +[OSIntelligenceUtilities events:v10 forHourBin:2 date:v11 withMaxDuration:12.0];
  v17 = +[OSIntelligenceUtilities events:v10 forHourBin:4 date:v11 withMaxDuration:12.0];
  v18 = +[OSIntelligenceUtilities events:v10 forHourBin:8 date:v11 withMaxDuration:12.0];
  uint64_t v19 = +[OSIntelligenceUtilities events:v10 forHourBin:16 date:v11 withMaxDuration:12.0];
  v105 = v10;
  v20 = +[OSIntelligenceUtilities events:v10 forHourBin:24 date:v11 withMaxDuration:12.0];
  +[OSIntelligenceUtilities standardDeviationOf:v15];
  double v22 = v21;
  +[OSIntelligenceUtilities standardDeviationOf:v16];
  double v24 = v23;
  +[OSIntelligenceUtilities standardDeviationOf:v17];
  double v26 = v25;
  +[OSIntelligenceUtilities standardDeviationOf:v18];
  double v28 = v27;
  +[OSIntelligenceUtilities standardDeviationOf:v19];
  double v30 = v29;
  +[OSIntelligenceUtilities standardDeviationOf:v20];
  double v32 = v31;
  +[OSIntelligenceUtilities medianOf:v15];
  id v106 = v33;
  v117 = (void *)v16;
  +[OSIntelligenceUtilities medianOf:v16];
  double v108 = v34;
  +[OSIntelligenceUtilities medianOf:v17];
  double v110 = v35;
  +[OSIntelligenceUtilities medianOf:v18];
  double v112 = v36;
  v116 = (void *)v19;
  +[OSIntelligenceUtilities medianOf:v19];
  double v38 = v37;
  +[OSIntelligenceUtilities medianOf:v20];
  double v40 = v39;
  v41 = v12;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = +[NSNumber numberWithDouble:v114];
    +[NSNumber numberWithUnsignedInteger:a5];
    v44 = v43 = v20;
    +[NSNumber numberWithDouble:a3];
    v46 = v45 = v17;
    +[NSNumber numberWithDouble:a6];
    v48 = v47 = v18;
    *(_DWORD *)buf = 138413058;
    id v131 = v42;
    __int16 v132 = 2112;
    double v133 = *(double *)&v44;
    __int16 v134 = 2112;
    double v135 = *(double *)&v46;
    __int16 v136 = 2112;
    v137 = v48;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginHour=%@, PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x2Au);

    v18 = v47;
    v17 = v45;

    v20 = v43;
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_100042670();
  }
  v49 = v41;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    id v50 = [v15 count];
    *(_DWORD *)buf = 134218496;
    id v131 = v50;
    __int16 v132 = 2048;
    double v133 = v22;
    __int16 v134 = 2048;
    double v135 = *(double *)&v106;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
    sub_100042608();
  }
  v51 = v49;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    id v52 = [v117 count];
    *(_DWORD *)buf = 134218496;
    id v131 = v52;
    __int16 v132 = 2048;
    double v133 = v24;
    __int16 v134 = 2048;
    double v135 = v108;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
    sub_1000425A0();
  }
  v53 = v51;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    id v54 = [v17 count];
    *(_DWORD *)buf = 134218496;
    id v131 = v54;
    __int16 v132 = 2048;
    double v133 = v26;
    __int16 v134 = 2048;
    double v135 = v110;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
    sub_100042538();
  }
  v55 = v53;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    id v56 = [v18 count];
    *(_DWORD *)buf = 134218496;
    id v131 = v56;
    __int16 v132 = 2048;
    double v133 = v28;
    __int16 v134 = 2048;
    double v135 = v112;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
    sub_1000424D0();
  }
  v57 = v55;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    id v58 = [v116 count];
    *(_DWORD *)buf = 134218496;
    id v131 = v58;
    __int16 v132 = 2048;
    double v133 = v30;
    __int16 v134 = 2048;
    double v135 = v38;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }
  v104 = v11;

  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
    sub_100042468();
  }
  v59 = v57;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    id v60 = [v20 count];
    *(_DWORD *)buf = 134218496;
    id v131 = v60;
    __int16 v132 = 2048;
    double v133 = v32;
    __int16 v134 = 2048;
    double v135 = v40;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  v61 = +[NSMutableDictionary dictionary];
  v62 = +[NSNumber numberWithUnsignedInteger:a5];
  [v61 setObject:v62 forKeyedSubscript:@"plugin_battery_level"];

  v63 = +[NSNumber numberWithDouble:a6];
  [v61 setObject:v63 forKeyedSubscript:@"time_from_plugin"];

  v64 = +[NSNumber numberWithDouble:v114];
  [v61 setObject:v64 forKeyedSubscript:@"hour"];

  v65 = +[NSNumber numberWithDouble:*(double *)&v106];
  [v61 setObject:v65 forKeyedSubscript:@"med_dur_1"];

  v66 = +[NSNumber numberWithDouble:v108];
  [v61 setObject:v66 forKeyedSubscript:@"med_dur_2"];

  v67 = +[NSNumber numberWithDouble:v110];
  [v61 setObject:v67 forKeyedSubscript:@"med_dur_4"];

  v68 = +[NSNumber numberWithDouble:v112];
  [v61 setObject:v68 forKeyedSubscript:@"med_dur_8"];

  v69 = +[NSNumber numberWithDouble:v38];
  [v61 setObject:v69 forKeyedSubscript:@"med_dur_16"];

  v70 = +[NSNumber numberWithDouble:v40];
  [v61 setObject:v70 forKeyedSubscript:@"med_dur_24"];

  v115 = v15;
  v71 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 count]);
  [v61 setObject:v71 forKeyedSubscript:@"cnt_dur_1"];

  v72 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v117 count]);
  [v61 setObject:v72 forKeyedSubscript:@"cnt_dur_2"];

  v113 = v17;
  v73 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 count]);
  [v61 setObject:v73 forKeyedSubscript:@"cnt_dur_4"];

  v111 = v18;
  v74 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
  [v61 setObject:v74 forKeyedSubscript:@"cnt_dur_8"];

  v75 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v116 count]);
  [v61 setObject:v75 forKeyedSubscript:@"cnt_dur_16"];

  v109 = v20;
  v76 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 count]);
  [v61 setObject:v76 forKeyedSubscript:@"cnt_dur_24"];

  v77 = +[NSNumber numberWithDouble:v22];
  [v61 setObject:v77 forKeyedSubscript:@"std_dur_1"];

  v78 = +[NSNumber numberWithDouble:v24];
  [v61 setObject:v78 forKeyedSubscript:@"std_dur_2"];

  v79 = +[NSNumber numberWithDouble:v26];
  [v61 setObject:v79 forKeyedSubscript:@"std_dur_4"];

  v80 = +[NSNumber numberWithDouble:v28];
  [v61 setObject:v80 forKeyedSubscript:@"std_dur_8"];

  v81 = +[NSNumber numberWithDouble:v30];
  [v61 setObject:v81 forKeyedSubscript:@"std_dur_16"];

  v82 = +[NSNumber numberWithDouble:v32];
  [v61 setObject:v82 forKeyedSubscript:@"std_dur_24"];

  id v107 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v61 error:0];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  v120 = v61;
  v83 = [v61 allKeys];
  id v84 = [v83 countByEnumeratingWithState:&v122 objects:v129 count:16];
  if (v84)
  {
    id v85 = v84;
    uint64_t v86 = *(void *)v123;
    do
    {
      v87 = 0;
      do
      {
        if (*(void *)v123 != v86) {
          objc_enumerationMutation(v83);
        }
        v88 = *(void **)(*((void *)&v122 + 1) + 8 * (void)v87);
        v89 = v59;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          v90 = [v120 objectForKeyedSubscript:v88];
          *(_DWORD *)buf = 138412546;
          id v131 = v88;
          __int16 v132 = 2112;
          double v133 = *(double *)&v90;
          _os_log_debug_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "input for feature '%@': %@", buf, 0x16u);
        }
        v87 = (char *)v87 + 1;
      }
      while (v85 != v87);
      id v85 = [v83 countByEnumeratingWithState:&v122 objects:v129 count:16];
    }
    while (v85);
  }

  [v104 timeIntervalSince1970];
  double v92 = floor(v91);
  v127[0] = @"pluginDateAsInterval";
  v93 = +[NSNumber numberWithDouble:v92];
  v128[0] = v93;
  v128[1] = v120;
  v127[1] = @"features";
  v127[2] = @"dataVersion";
  v128[2] = &off_100068D98;
  v94 = +[NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:3];

  v126[0] = @"/var/mobile/Library/OSIntelligence";
  v126[1] = @"obc_features";
  v95 = +[NSArray arrayWithObjects:v126 count:2];
  v96 = +[NSURL fileURLWithPathComponents:v95];

  id v121 = 0;
  [v94 writeToURL:v96 error:&v121];
  id v97 = v121;
  if (v97)
  {
    v98 = v117;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_100042C44();
    }
  }
  else
  {
    v99 = v59;
    v98 = v117;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      v100 = +[NSNumber numberWithDouble:v92];
      *(_DWORD *)buf = 138412290;
      id v131 = v100;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);
    }
  }

  return v107;
}

@end