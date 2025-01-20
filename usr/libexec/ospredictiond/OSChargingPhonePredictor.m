@interface OSChargingPhonePredictor
- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8;
- (id)getMultiArrayForFeatureDict:(id)a3;
@end

@implementation OSChargingPhonePredictor

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  id v10 = a7;
  id v114 = a8;
  id v11 = a4;
  uint64_t v12 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:1];
  uint64_t v13 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:2];
  uint64_t v14 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:4];
  uint64_t v15 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:8];
  v147 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:16];
  uint64_t v16 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:24];

  uint64_t v17 = +[OSIntelligenceUtilities filterEvents:v12 startOnSameWeekdayAs:v10];
  v141 = (void *)v13;
  uint64_t v18 = +[OSIntelligenceUtilities filterEvents:v13 startOnSameWeekdayAs:v10];
  v113 = (void *)v14;
  uint64_t v19 = +[OSIntelligenceUtilities filterEvents:v14 startOnSameWeekdayAs:v10];
  v144 = +[OSIntelligenceUtilities filterEvents:v15 startOnSameWeekdayAs:v10];
  v139 = v10;
  v143 = +[OSIntelligenceUtilities filterEvents:v16 startOnSameWeekdayAs:v10];
  v142 = (void *)v12;
  v140 = +[OSIntelligenceUtilities getDurationsFromEvents:v12 withUnit:3600.0 cappedAt:0.0];
  uint64_t v20 = +[OSIntelligenceUtilities getDurationsFromEvents:v13 withUnit:3600.0 cappedAt:0.0];
  v21 = +[OSIntelligenceUtilities getDurationsFromEvents:v14 withUnit:3600.0 cappedAt:0.0];
  v146 = (void *)v15;
  uint64_t v22 = +[OSIntelligenceUtilities getDurationsFromEvents:v15 withUnit:3600.0 cappedAt:0.0];
  uint64_t v23 = +[OSIntelligenceUtilities getDurationsFromEvents:v147 withUnit:3600.0 cappedAt:0.0];
  v145 = (void *)v16;
  uint64_t v24 = +[OSIntelligenceUtilities getDurationsFromEvents:v16 withUnit:3600.0 cappedAt:0.0];
  v124 = (void *)v17;
  v138 = +[OSIntelligenceUtilities getDurationsFromEvents:v17 withUnit:3600.0 cappedAt:0.0];
  v123 = (void *)v18;
  v137 = +[OSIntelligenceUtilities getDurationsFromEvents:v18 withUnit:3600.0 cappedAt:0.0];
  v122 = (void *)v19;
  uint64_t v25 = +[OSIntelligenceUtilities getDurationsFromEvents:v19 withUnit:3600.0 cappedAt:0.0];
  uint64_t v26 = +[OSIntelligenceUtilities getDurationsFromEvents:v144 withUnit:3600.0 cappedAt:0.0];
  uint64_t v27 = +[OSIntelligenceUtilities getDurationsFromEvents:v143 withUnit:3600.0 cappedAt:0.0];
  +[OSIntelligenceUtilities standardDeviationOf:v140];
  double v132 = v28;
  +[OSIntelligenceUtilities standardDeviationOf:v20];
  double v133 = v29;
  +[OSIntelligenceUtilities standardDeviationOf:v21];
  double v135 = v30;
  +[OSIntelligenceUtilities standardDeviationOf:v22];
  double v32 = v31;
  +[OSIntelligenceUtilities standardDeviationOf:v23];
  double v34 = v33;
  +[OSIntelligenceUtilities standardDeviationOf:v24];
  double v36 = v35;
  +[OSIntelligenceUtilities standardDeviationOf:v25];
  double v38 = v37;
  +[OSIntelligenceUtilities medianOf:v140];
  double v40 = v39;
  v112 = (void *)v20;
  +[OSIntelligenceUtilities medianOf:v20];
  double v126 = v41;
  +[OSIntelligenceUtilities medianOf:v21];
  double v127 = v42;
  v120 = (void *)v22;
  +[OSIntelligenceUtilities medianOf:v22];
  double v128 = v43;
  v119 = (void *)v23;
  +[OSIntelligenceUtilities medianOf:v23];
  double v129 = v44;
  v118 = (void *)v24;
  +[OSIntelligenceUtilities medianOf:v24];
  double v130 = v45;
  +[OSIntelligenceUtilities medianOf:v138];
  double v134 = v46;
  +[OSIntelligenceUtilities medianOf:v137];
  double v136 = v47;
  v117 = (void *)v25;
  uint64_t v48 = v25;
  v49 = v113;
  +[OSIntelligenceUtilities medianOf:v48];
  double v51 = v50;
  v116 = (void *)v26;
  +[OSIntelligenceUtilities medianOf:v26];
  double v53 = v52;
  v115 = (void *)v27;
  +[OSIntelligenceUtilities medianOf:v27];
  double v55 = v54;
  v56 = v114;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = +[NSNumber numberWithUnsignedInteger:a5];
    v58 = +[NSNumber numberWithDouble:a3];
    v59 = +[NSNumber numberWithDouble:a6];
    *(_DWORD *)buf = 138412802;
    double v155 = *(double *)&v57;
    __int16 v156 = 2112;
    double v157 = *(double *)&v58;
    __int16 v158 = 2112;
    double v159 = *(double *)&v59;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x20u);

    v49 = v113;
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    sub_100042670();
  }
  v60 = v56;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    id v61 = [v142 count];
    *(_DWORD *)buf = 134218496;
    double v155 = *(double *)&v61;
    __int16 v156 = 2048;
    double v157 = v132;
    __int16 v158 = 2048;
    double v159 = v40;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
    sub_100042608();
  }
  v62 = v60;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    id v63 = [v141 count];
    *(_DWORD *)buf = 134218496;
    double v155 = *(double *)&v63;
    __int16 v156 = 2048;
    double v157 = v133;
    __int16 v158 = 2048;
    double v159 = v126;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
    sub_1000425A0();
  }
  v64 = v62;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    id v65 = [v49 count];
    *(_DWORD *)buf = 134218496;
    double v155 = *(double *)&v65;
    __int16 v156 = 2048;
    double v157 = v135;
    __int16 v158 = 2048;
    double v159 = v127;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
    sub_100042538();
  }
  v66 = v64;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    id v67 = [v146 count];
    *(_DWORD *)buf = 134218496;
    double v155 = *(double *)&v67;
    __int16 v156 = 2048;
    double v157 = v32;
    __int16 v158 = 2048;
    double v159 = v128;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
    sub_1000424D0();
  }
  v68 = v66;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    id v69 = [v147 count];
    *(_DWORD *)buf = 134218496;
    double v155 = *(double *)&v69;
    __int16 v156 = 2048;
    double v157 = v34;
    __int16 v158 = 2048;
    double v159 = v129;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
    sub_100042468();
  }
  v70 = v68;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    id v71 = [v145 count];
    *(_DWORD *)buf = 134218496;
    double v155 = *(double *)&v71;
    __int16 v156 = 2048;
    double v157 = v36;
    __int16 v158 = 2048;
    double v159 = v130;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    sub_100042400();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v155 = v134;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday1: weekday_med_dur_1: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    sub_100042398();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v155 = v136;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday2: weekday_med_dur_2: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    sub_100042330();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v155 = v51;
    __int16 v156 = 2048;
    double v157 = v38;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday4: weekday_med_dur_4: %lf, weekday_std_dur_4: %lf", buf, 0x16u);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    sub_1000422C8();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v155 = v53;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday8: weekday_med_dur_8: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    sub_100042260();
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v155 = v55;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday24: weekday_med_dur_24: %lf", buf, 0xCu);
  }
  v72 = +[NSMutableDictionary dictionary];
  v73 = +[NSNumber numberWithUnsignedInteger:a5];
  [v72 setObject:v73 forKeyedSubscript:@"plugin_battery_level"];

  v74 = +[NSNumber numberWithDouble:a6];
  [v72 setObject:v74 forKeyedSubscript:@"time_from_plugin"];

  v75 = +[NSNumber numberWithDouble:v40];
  [v72 setObject:v75 forKeyedSubscript:@"med_dur_1"];

  v76 = +[NSNumber numberWithDouble:v126];
  [v72 setObject:v76 forKeyedSubscript:@"med_dur_2"];

  v77 = +[NSNumber numberWithDouble:v127];
  [v72 setObject:v77 forKeyedSubscript:@"med_dur_4"];

  v78 = +[NSNumber numberWithDouble:v128];
  [v72 setObject:v78 forKeyedSubscript:@"med_dur_8"];

  v79 = +[NSNumber numberWithDouble:v129];
  [v72 setObject:v79 forKeyedSubscript:@"med_dur_16"];

  v80 = +[NSNumber numberWithDouble:v130];
  [v72 setObject:v80 forKeyedSubscript:@"med_dur_24"];

  v81 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v142 count]);
  [v72 setObject:v81 forKeyedSubscript:@"cnt_dur_1"];

  v82 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v141 count]);
  [v72 setObject:v82 forKeyedSubscript:@"cnt_dur_2"];

  v83 = v49;
  v84 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v49 count]);
  [v72 setObject:v84 forKeyedSubscript:@"cnt_dur_4"];

  v85 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v146 count]);
  [v72 setObject:v85 forKeyedSubscript:@"cnt_dur_8"];

  v86 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v147 count]);
  [v72 setObject:v86 forKeyedSubscript:@"cnt_dur_16"];

  v87 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v145 count]);
  [v72 setObject:v87 forKeyedSubscript:@"cnt_dur_24"];

  v88 = +[NSNumber numberWithDouble:v132];
  [v72 setObject:v88 forKeyedSubscript:@"std_dur_1"];

  v89 = +[NSNumber numberWithDouble:v133];
  [v72 setObject:v89 forKeyedSubscript:@"std_dur_2"];

  v90 = +[NSNumber numberWithDouble:v135];
  [v72 setObject:v90 forKeyedSubscript:@"std_dur_4"];

  v91 = +[NSNumber numberWithDouble:v32];
  [v72 setObject:v91 forKeyedSubscript:@"std_dur_8"];

  v92 = +[NSNumber numberWithDouble:v34];
  [v72 setObject:v92 forKeyedSubscript:@"std_dur_16"];

  v93 = +[NSNumber numberWithDouble:v36];
  [v72 setObject:v93 forKeyedSubscript:@"std_dur_24"];

  v94 = +[NSNumber numberWithDouble:v134];
  [v72 setObject:v94 forKeyedSubscript:@"weekday_med_dur_1"];

  v95 = +[NSNumber numberWithDouble:v136];
  [v72 setObject:v95 forKeyedSubscript:@"weekday_med_dur_2"];

  v96 = +[NSNumber numberWithDouble:v51];
  [v72 setObject:v96 forKeyedSubscript:@"weekday_med_dur_4"];

  v97 = +[NSNumber numberWithDouble:v53];
  [v72 setObject:v97 forKeyedSubscript:@"weekday_med_dur_8"];

  v98 = +[NSNumber numberWithDouble:v55];
  [v72 setObject:v98 forKeyedSubscript:@"weekday_med_dur_24"];

  v99 = +[NSNumber numberWithDouble:v38];
  [v72 setObject:v99 forKeyedSubscript:@"weekday_std_dur_4"];

  id v100 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v72 error:0];
  [v139 timeIntervalSince1970];
  double v102 = floor(v101);
  v152[0] = @"pluginDateAsInterval";
  v103 = +[NSNumber numberWithDouble:v102];
  v153[0] = v103;
  v153[1] = v72;
  v152[1] = @"features";
  v152[2] = @"dataVersion";
  v153[2] = &off_100068DB0;
  v104 = +[NSDictionary dictionaryWithObjects:v153 forKeys:v152 count:3];

  v151[0] = @"/var/mobile/Library/OSIntelligence";
  v151[1] = @"obc_features";
  v105 = +[NSArray arrayWithObjects:v151 count:2];
  v106 = +[NSURL fileURLWithPathComponents:v105];

  id v150 = 0;
  [v104 writeToURL:v106 error:&v150];
  id v107 = v150;
  if (v107)
  {
    v149.receiver = self;
    v149.super_class = (Class)OSChargingPhonePredictor;
    v108 = [(OSChargingTwoStagePredictor *)&v149 log];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
      sub_100042C44();
    }
  }
  else
  {
    v148.receiver = self;
    v148.super_class = (Class)OSChargingPhonePredictor;
    v108 = [(OSChargingTwoStagePredictor *)&v148 log];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      v109 = +[NSNumber numberWithDouble:v102];
      *(_DWORD *)buf = 138412290;
      double v155 = *(double *)&v109;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "Feature dict saved for plugin: %@", buf, 0xCu);
    }
  }

  return v100;
}

- (id)getMultiArrayForFeatureDict:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [&off_100069940 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (!v5) {
    goto LABEL_15;
  }
  id v7 = v5;
  char v18 = 0;
  uint64_t v8 = *(void *)v23;
  *(void *)&long long v6 = 138412290;
  long long v17 = v6;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(&off_100069940);
      }
      uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      id v11 = [v3 objectForKeyedSubscript:v10, v17];
      [v11 doubleValue];
      uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

      if (v12)
      {
        [v4 addObject:v12];
      }
      else
      {
        v21.receiver = self;
        v21.super_class = (Class)OSChargingPhonePredictor;
        uint64_t v13 = [(OSChargingTwoStagePredictor *)&v21 log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v17;
          uint64_t v27 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error: feature value for key '%@' is nil", buf, 0xCu);
        }

        char v18 = 1;
      }
    }
    id v7 = [&off_100069940 countByEnumeratingWithState:&v22 objects:v28 count:16];
  }
  while (v7);
  if (v18)
  {
    uint64_t v14 = 0;
  }
  else
  {
LABEL_15:
    uint64_t v15 = +[NSArray arrayWithArray:v4];
    v20.receiver = self;
    v20.super_class = (Class)OSChargingPhonePredictor;
    uint64_t v14 = [(OSChargingTwoStagePredictor *)&v20 arrayWithShape:&off_100069958 values:v15 type:65568];
  }

  return v14;
}

@end