@interface OSChargingPhoneOnPluginPredictor
- (MLModel)engageOnPluginModel;
- (MLModel)longDurationModel;
- (MLModel)shortDurationModel;
- (OSChargingTwoStagePredictorQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7;
- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8;
- (void)setEngageOnPluginModel:(id)a3;
- (void)setLongDurationModel:(id)a3;
- (void)setShortDurationModel:(id)a3;
@end

@implementation OSChargingPhoneOnPluginPredictor

- (MLModel)engageOnPluginModel
{
  engageOnPluginModel = self->_engageOnPluginModel;
  if (!engageOnPluginModel)
  {
    v4 = [(OSChargingTwoStagePredictor *)self loadModelWithModelNameString:@"engageOnPlugin"];
    v5 = self->_engageOnPluginModel;
    self->_engageOnPluginModel = v4;

    engageOnPluginModel = self->_engageOnPluginModel;
  }

  return engageOnPluginModel;
}

- (MLModel)shortDurationModel
{
  shortDurationModel = self->_shortDurationModel;
  if (!shortDurationModel)
  {
    v4 = [(OSChargingTwoStagePredictor *)self loadModelWithModelNameString:@"shortDurationModel"];
    v5 = self->_shortDurationModel;
    self->_shortDurationModel = v4;

    shortDurationModel = self->_shortDurationModel;
  }

  return shortDurationModel;
}

- (MLModel)longDurationModel
{
  longDurationModel = self->_longDurationModel;
  if (!longDurationModel)
  {
    v4 = [(OSChargingTwoStagePredictor *)self loadModelWithModelNameString:@"longDurationModel"];
    v5 = self->_longDurationModel;
    self->_longDurationModel = v4;

    longDurationModel = self->_longDurationModel;
  }

  return longDurationModel;
}

- (id)getInputFeatures:(double)a3 events:(id)a4 pluginBatteryLevel:(unint64_t)a5 timeFromPlugin:(double)a6 pluginDate:(id)a7 withLog:(id)a8
{
  id v102 = a8;
  id v10 = a7;
  id v11 = a4;
  uint64_t v12 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:1];
  uint64_t v13 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:2];
  uint64_t v14 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:4];
  uint64_t v15 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:8];
  v129 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:16];
  uint64_t v16 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v11 startsBefore:v10 dynamicallyAroundDate:v10 withHourBinWidth:24];

  uint64_t v17 = +[OSIntelligenceUtilities filterEvents:v12 startOnSameWeekdayAs:v10];
  uint64_t v18 = +[OSIntelligenceUtilities filterEvents:v13 startOnSameWeekdayAs:v10];
  uint64_t v19 = +[OSIntelligenceUtilities filterEvents:v14 startOnSameWeekdayAs:v10];
  v127 = +[OSIntelligenceUtilities filterEvents:v15 startOnSameWeekdayAs:v10];
  v126 = +[OSIntelligenceUtilities filterEvents:v16 startOnSameWeekdayAs:v10];

  v128 = (void *)v12;
  v20 = +[OSIntelligenceUtilities getDurationsFromEvents:v12 withUnit:3600.0 cappedAt:0.0];
  v123 = (void *)v13;
  v21 = +[OSIntelligenceUtilities getDurationsFromEvents:v13 withUnit:3600.0 cappedAt:0.0];
  v122 = (void *)v14;
  v22 = +[OSIntelligenceUtilities getDurationsFromEvents:v14 withUnit:3600.0 cappedAt:0.0];
  v121 = (void *)v15;
  v23 = +[OSIntelligenceUtilities getDurationsFromEvents:v15 withUnit:3600.0 cappedAt:0.0];
  uint64_t v24 = +[OSIntelligenceUtilities getDurationsFromEvents:v129 withUnit:3600.0 cappedAt:0.0];
  v120 = (void *)v16;
  v25 = +[OSIntelligenceUtilities getDurationsFromEvents:v16 withUnit:3600.0 cappedAt:0.0];
  v108 = (void *)v17;
  v125 = +[OSIntelligenceUtilities getDurationsFromEvents:v17 withUnit:3600.0 cappedAt:0.0];
  v107 = (void *)v18;
  v124 = +[OSIntelligenceUtilities getDurationsFromEvents:v18 withUnit:3600.0 cappedAt:0.0];
  v106 = (void *)v19;
  v26 = +[OSIntelligenceUtilities getDurationsFromEvents:v19 withUnit:3600.0 cappedAt:0.0];
  uint64_t v27 = +[OSIntelligenceUtilities getDurationsFromEvents:v127 withUnit:3600.0 cappedAt:0.0];
  uint64_t v28 = +[OSIntelligenceUtilities getDurationsFromEvents:v126 withUnit:3600.0 cappedAt:0.0];
  +[OSIntelligenceUtilities standardDeviationOf:v20];
  double v115 = v29;
  +[OSIntelligenceUtilities standardDeviationOf:v21];
  double v116 = v30;
  +[OSIntelligenceUtilities standardDeviationOf:v22];
  double v118 = v31;
  +[OSIntelligenceUtilities standardDeviationOf:v23];
  double v33 = v32;
  +[OSIntelligenceUtilities standardDeviationOf:v24];
  double v35 = v34;
  +[OSIntelligenceUtilities standardDeviationOf:v25];
  double v37 = v36;
  +[OSIntelligenceUtilities standardDeviationOf:v26];
  double v39 = v38;
  +[OSIntelligenceUtilities medianOf:v20];
  double v41 = v40;
  +[OSIntelligenceUtilities medianOf:v21];
  double v109 = v42;
  +[OSIntelligenceUtilities medianOf:v22];
  double v110 = v43;
  +[OSIntelligenceUtilities medianOf:v23];
  double v111 = v44;
  v105 = (void *)v24;
  +[OSIntelligenceUtilities medianOf:v24];
  double v112 = v45;
  +[OSIntelligenceUtilities medianOf:v25];
  double v113 = v46;
  +[OSIntelligenceUtilities medianOf:v125];
  double v117 = v47;
  +[OSIntelligenceUtilities medianOf:v124];
  double v119 = v48;
  +[OSIntelligenceUtilities medianOf:v26];
  double v50 = v49;
  v104 = (void *)v27;
  +[OSIntelligenceUtilities medianOf:v27];
  double v52 = v51;
  v103 = (void *)v28;
  +[OSIntelligenceUtilities medianOf:v28];
  double v54 = v53;
  v55 = v102;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = +[NSNumber numberWithUnsignedInteger:a5];
    v57 = +[NSNumber numberWithDouble:a3];
    v58 = +[NSNumber numberWithDouble:a6];
    *(_DWORD *)buf = 138412802;
    double v131 = *(double *)&v56;
    __int16 v132 = 2112;
    double v133 = *(double *)&v57;
    __int16 v134 = 2112;
    double v135 = *(double *)&v58;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Model inputs: PluginBatteryLevel=%@, Hour=%@, TimeFromPlugin=%@", buf, 0x20u);
  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
    sub_100042670();
  }
  v59 = v55;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    id v60 = [v128 count];
    *(_DWORD *)buf = 134218496;
    double v131 = *(double *)&v60;
    __int16 v132 = 2048;
    double v133 = v115;
    __int16 v134 = 2048;
    double v135 = v41;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin1: count %lu, std_dur_1: %f, med_dur_1: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
    sub_100042608();
  }
  v61 = v59;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    id v62 = [v123 count];
    *(_DWORD *)buf = 134218496;
    double v131 = *(double *)&v62;
    __int16 v132 = 2048;
    double v133 = v116;
    __int16 v134 = 2048;
    double v135 = v109;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin2: count %lu, std_dur_2: %f, med_dur_2: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
    sub_1000425A0();
  }
  v63 = v61;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    id v64 = [v122 count];
    *(_DWORD *)buf = 134218496;
    double v131 = *(double *)&v64;
    __int16 v132 = 2048;
    double v133 = v118;
    __int16 v134 = 2048;
    double v135 = v110;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin4: count %lu, std_dur_4: %f, med_dur_4: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
    sub_100042538();
  }
  v65 = v63;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    id v66 = [v121 count];
    *(_DWORD *)buf = 134218496;
    double v131 = *(double *)&v66;
    __int16 v132 = 2048;
    double v133 = v33;
    __int16 v134 = 2048;
    double v135 = v111;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin8: count %lu, std_dur_8: %f, med_dur_8: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
    sub_1000424D0();
  }
  v67 = v65;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    id v68 = [v129 count];
    *(_DWORD *)buf = 134218496;
    double v131 = *(double *)&v68;
    __int16 v132 = 2048;
    double v133 = v35;
    __int16 v134 = 2048;
    double v135 = v112;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin16: count %lu, std_dur_16: %f, med_dur_16: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
    sub_100042468();
  }
  v69 = v67;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    id v70 = [v120 count];
    *(_DWORD *)buf = 134218496;
    double v131 = *(double *)&v70;
    __int16 v132 = 2048;
    double v133 = v37;
    __int16 v134 = 2048;
    double v135 = v113;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for hourBin24: count %lu, std_dur_24: %f, med_dur_24: %lf", buf, 0x20u);
  }

  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    sub_100042400();
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v131 = v117;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday1: weekday_med_dur_1: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    sub_100042398();
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v131 = v119;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday2: weekday_med_dur_2: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    sub_100042330();
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v131 = v50;
    __int16 v132 = 2048;
    double v133 = v39;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday4: weekday_med_dur_4: %lf, weekday_std_dur_4: %lf", buf, 0x16u);
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    sub_1000422C8();
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v131 = v52;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday8: weekday_med_dur_8: %lf", buf, 0xCu);
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    sub_100042260();
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v131 = v54;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Model inputs for weekday24: weekday_med_dur_24: %lf", buf, 0xCu);
  }
  v71 = +[NSMutableDictionary dictionary];
  v72 = +[NSNumber numberWithUnsignedInteger:a5];
  [v71 setObject:v72 forKeyedSubscript:@"plugin_battery_level"];

  v73 = +[NSNumber numberWithDouble:a6];
  [v71 setObject:v73 forKeyedSubscript:@"time_from_plugin"];

  v74 = +[NSNumber numberWithDouble:v41];
  [v71 setObject:v74 forKeyedSubscript:@"med_dur_1"];

  v75 = +[NSNumber numberWithDouble:v109];
  [v71 setObject:v75 forKeyedSubscript:@"med_dur_2"];

  v76 = +[NSNumber numberWithDouble:v110];
  [v71 setObject:v76 forKeyedSubscript:@"med_dur_4"];

  v77 = +[NSNumber numberWithDouble:v111];
  [v71 setObject:v77 forKeyedSubscript:@"med_dur_8"];

  v78 = +[NSNumber numberWithDouble:v112];
  [v71 setObject:v78 forKeyedSubscript:@"med_dur_16"];

  v79 = +[NSNumber numberWithDouble:v113];
  [v71 setObject:v79 forKeyedSubscript:@"med_dur_24"];

  v80 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v128 count]);
  [v71 setObject:v80 forKeyedSubscript:@"cnt_dur_1"];

  v81 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v123 count]);
  [v71 setObject:v81 forKeyedSubscript:@"cnt_dur_2"];

  v82 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v122 count]);
  [v71 setObject:v82 forKeyedSubscript:@"cnt_dur_4"];

  v83 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v121 count]);
  [v71 setObject:v83 forKeyedSubscript:@"cnt_dur_8"];

  v84 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v129 count]);
  [v71 setObject:v84 forKeyedSubscript:@"cnt_dur_16"];

  v85 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v120 count]);
  [v71 setObject:v85 forKeyedSubscript:@"cnt_dur_24"];

  v86 = +[NSNumber numberWithDouble:v115];
  [v71 setObject:v86 forKeyedSubscript:@"std_dur_1"];

  v87 = +[NSNumber numberWithDouble:v116];
  [v71 setObject:v87 forKeyedSubscript:@"std_dur_2"];

  v88 = +[NSNumber numberWithDouble:v118];
  [v71 setObject:v88 forKeyedSubscript:@"std_dur_4"];

  v89 = +[NSNumber numberWithDouble:v33];
  [v71 setObject:v89 forKeyedSubscript:@"std_dur_8"];

  v90 = +[NSNumber numberWithDouble:v35];
  [v71 setObject:v90 forKeyedSubscript:@"std_dur_16"];

  v91 = +[NSNumber numberWithDouble:v37];
  [v71 setObject:v91 forKeyedSubscript:@"std_dur_24"];

  v92 = +[NSNumber numberWithDouble:v117];
  [v71 setObject:v92 forKeyedSubscript:@"weekday_med_dur_1"];

  v93 = +[NSNumber numberWithDouble:v119];
  [v71 setObject:v93 forKeyedSubscript:@"weekday_med_dur_2"];

  v94 = +[NSNumber numberWithDouble:v50];
  [v71 setObject:v94 forKeyedSubscript:@"weekday_med_dur_4"];

  v95 = +[NSNumber numberWithDouble:v52];
  [v71 setObject:v95 forKeyedSubscript:@"weekday_med_dur_8"];

  v96 = +[NSNumber numberWithDouble:v54];
  [v71 setObject:v96 forKeyedSubscript:@"weekday_med_dur_24"];

  v97 = +[NSNumber numberWithDouble:v39];
  [v71 setObject:v97 forKeyedSubscript:@"weekday_std_dur_4"];

  id v98 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v71 error:0];

  return v98;
}

- (OSChargingTwoStagePredictorQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7
{
  uint64_t v13 = a8;
  id v14 = a7;
  id v15 = a5;
  uint64_t v16 = (void *)os_transaction_create();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Getting predictions with on plugin model", (uint8_t *)&v35, 2u);
  }
  uint64_t v17 = [(OSChargingTwoStagePredictor *)self getInputFeaturesWithPluginDate:v15 withPluginBatteryLevel:v14 forDate:v13 withLog:a6];

  *(void *)&retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0xC0F869F000000000);
  uint64_t v18 = [(OSChargingPhoneOnPluginPredictor *)self engageOnPluginModel];
  uint64_t v19 = [v18 predictionFromFeatures:v17 error:0];

  v20 = [v19 featureValueForName:@"classProbability"];
  v21 = [v20 dictionaryValue];

  v22 = v13;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [v21 description];
    int v35 = 138412290;
    double v36 = *(double *)&v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "On plugin engagement model raw output %@", (uint8_t *)&v35, 0xCu);
  }
  uint64_t v24 = [v21 objectForKeyedSubscript:&off_100068D68];
  [v24 doubleValue];
  double v26 = v25;

  retstr->var2 = v26;
  BOOL v27 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v26 <= 0.675)
  {
    if (v27)
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Querying on plugin short duration model", (uint8_t *)&v35, 2u);
    }
    uint64_t v28 = [(OSChargingPhoneOnPluginPredictor *)self shortDurationModel];
    BOOL v29 = 0;
  }
  else
  {
    if (v27)
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Querying on plugin long duration model", (uint8_t *)&v35, 2u);
    }
    uint64_t v28 = [(OSChargingPhoneOnPluginPredictor *)self longDurationModel];
    BOOL v29 = 1;
  }
  double v30 = [v28 predictionFromFeatures:v17 error:0];

  retstr->var0 = v29;
  double v31 = [v30 featureValueForName:@"duration_pred"];
  [v31 doubleValue];
  double v33 = v32;

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 134217984;
    double v36 = v33;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Overall on plugin regression model output: %lf", (uint8_t *)&v35, 0xCu);
  }
  retstr->var1 = v33;

  return result;
}

- (void)setEngageOnPluginModel:(id)a3
{
}

- (void)setShortDurationModel:(id)a3
{
}

- (void)setLongDurationModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longDurationModel, 0);
  objc_storeStrong((id *)&self->_shortDurationModel, 0);

  objc_storeStrong((id *)&self->_engageOnPluginModel, 0);
}

@end