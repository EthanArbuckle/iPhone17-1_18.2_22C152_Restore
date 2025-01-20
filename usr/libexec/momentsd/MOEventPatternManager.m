@interface MOEventPatternManager
- (MOEventPatternManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_initializeBatchedTypeDetector;
- (id)_initializeStreamingTypeDetector;
- (id)_processEvents:(id)a3 forDetector:(id)a4;
- (id)processEvents:(id)a3 withRefreshVariant:(unint64_t)a4 forDateInterval:(id)a5;
- (void)_initializeStreamingTypeDetector;
@end

@implementation MOEventPatternManager

- (MOEventPatternManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MOEventPatternManager;
  v6 = [(MOEventPatternManager *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_universe, a3);
    universe = v7->_universe;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [(MODaemonUniverse *)universe getService:v10];
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v11;

    v13 = v7->_universe;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    uint64_t v16 = [(MODaemonUniverse *)v13 getService:v15];
    eventStore = v7->_eventStore;
    v7->_eventStore = (MOEventStore *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("MOEventPatternManager", v18);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v19;
  }
  return v7;
}

- (id)_initializeBatchedTypeDetector
{
  v3 = _mo_log_facility_get_os_log(&MOLogFacilityBatchedPatternDetection);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Constructing batched pattern detectors", buf, 2u);
  }

  v124 = objc_opt_new();
  v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  v118 = objc_opt_new();
  [v4 setPredicate:];
  v119 = (void *)v7;
  [v4 setFeatureExtractor:v7];
  v120 = (void *)v6;
  [v4 setFeatureTransformer:v6];
  v121 = (void *)v5;
  [v4 setTrendDetector:v5];
  v137[0] = @"MinimumFeatureNumberForTrend";
  LODWORD(v8) = 5.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_WDT_MinimumFeatureNumberForTrend" withFallback:v8];
  v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v138[0] = v9;
  v137[1] = @"MinimumValueOfFeatureMaximum";
  LODWORD(v10) = 1133903872;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_WDT_MinimumValueOfFeatureMaximum" withFallback:v10];
  uint64_t v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v138[1] = v11;
  v137[2] = @"MinimumFeatureSlopeForTrend";
  LODWORD(v12) = 25.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_WDT_MinimumFeatureSlopeForTrend" withFallback:v12];
  v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v138[2] = v13;
  v137[3] = @"AggregationWindow";
  v14 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)self->_configurationManager getIntegerSettingForKey:@"PD_WDT_AggregationWindow" withFallback:16]];
  v138[3] = v14;
  v137[4] = @"AggregationType";
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_WDT_AggregationType" withFallback:0.0];
  v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v137[5] = @"TrendFeatureType";
  v138[4] = v15;
  v138[5] = &off_1002F48F8;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:6];
  [v4 configure:v16];

  [v4 setPatternDetectorName:@"durationWorkoutTrend"];
  v122 = v4;
  [v124 addObject:v4];
  v123 = objc_opt_new();
  uint64_t v17 = objc_opt_new();
  uint64_t v18 = objc_opt_new();
  uint64_t v19 = objc_opt_new();
  v117 = (void *)v17;
  [v123 setPredicate:v17];
  v116 = (void *)v18;
  [v123 setFeatureExtractor:v18];
  v115 = (void *)v19;
  [v123 setRoutineDetector:v19];
  v135[0] = @"RoutineConsistencyThreshold";
  v113 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)self->_configurationManager getIntegerSettingForKey:@"PD_TODWR_ConsistencyThreshold" withFallback:2]];
  v136[0] = v113;
  v135[1] = @"IntraWeekFreqThreshold";
  v111 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)self->_configurationManager getIntegerSettingForKey:@"PD_TODWR_IntraWeekFreqThreshold" withFallback:3]];
  v136[1] = v111;
  v135[2] = @"RoutineStdThreshold";
  LODWORD(v20) = 1042983595;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TODWR_RoutineStdThreshold" withFallback:v20];
  v109 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v136[2] = v109;
  v135[3] = @"RoutineStdFilterMultiplier";
  LODWORD(v21) = 1.5;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TODWR_RoutineStdFilterMultiplier" withFallback:v21];
  objc_super v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v136[3] = v22;
  v135[4] = @"RoutineEnvelope";
  LODWORD(v23) = 0.75;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TODWR_RoutineEnvelope" withFallback:v23];
  v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v136[4] = v24;
  v135[5] = @"RoutineDetectionSlidingWinSize";
  LODWORD(v25) = 3.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TODWR_SlidingWinSize" withFallback:v25];
  v26 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v136[5] = v26;
  v135[6] = @"RoutineDetectionSlidingWinStepSize";
  LODWORD(v27) = 1.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TODWR_SlidingWinStepSize" withFallback:v27];
  v28 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v136[6] = v28;
  v135[7] = @"MaxNumDailyDetections";
  v29 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)self->_configurationManager getIntegerSettingForKey:@"PD_TODWR_MaxNumDailyDetections" withFallback:3]];
  v136[7] = v29;
  v135[8] = @"LastWindowEnd";
  LODWORD(v30) = 1103495168;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TODWR_LastWindowEnd" withFallback:v30];
  v31 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v136[8] = v31;
  v135[9] = @"LastWindowStartThreshold";
  LODWORD(v32) = 1101135872;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TODWR_LastWindowStartThreshold" withFallback:v32];
  v33 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v135[10] = @"RoutineFeatureType";
  v136[9] = v33;
  v136[10] = &off_1002F4910;
  v34 = +[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:11];
  [v123 configure:v34];

  [v123 setPatternDetectorName:@"timeOfDayWorkoutRoutine"];
  [v124 addObject:v123];
  v35 = objc_opt_new();
  uint64_t v36 = objc_opt_new();
  uint64_t v37 = objc_opt_new();
  uint64_t v38 = objc_opt_new();
  v112 = (void *)v36;
  [v35 setPredicate:v36];
  v110 = (void *)v37;
  [v35 setFeatureExtractor:v37];
  v108 = (void *)v38;
  [v35 setTrendDetector:v38];
  v133[0] = @"ExcludeTextOnlyConversations";
  v39 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)self->_configurationManager getBoolSettingForKey:@"PD_SCDT_ExcludeTextOnlyConversations" withFallback:1]];
  v134[0] = v39;
  v133[1] = @"MinimumTextCount";
  LODWORD(v40) = 1.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCDT_MinimumTextCount" withFallback:v40];
  v41 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v134[1] = v41;
  v133[2] = @"MinimumTotalCallDuration";
  LODWORD(v42) = 1114636288;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCDT_MinimumTotalCallDuration" withFallback:v42];
  v43 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v134[2] = v43;
  v133[3] = @"MaximumNumberOfContacts";
  LODWORD(v44) = 1.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCDT_MaximumNumberOfContacts" withFallback:v44];
  v45 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v134[3] = v45;
  v133[4] = @"MinimumFeatureNumberForTrend";
  LODWORD(v46) = 5.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCDT_MinimumFeatureNumberForTrend" withFallback:v46];
  v47 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v134[4] = v47;
  v133[5] = @"MinimumValueOfFeatureMaximum";
  LODWORD(v48) = 1133903872;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCDT_MinimumValueOfFeatureMaximum" withFallback:v48];
  v49 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v134[5] = v49;
  v133[6] = @"MinimumFeatureSlopeForTrend";
  LODWORD(v50) = 25.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCDT_MinimumFeatureSlopeForTrend" withFallback:v50];
  v51 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v133[7] = @"TrendFeatureType";
  v134[6] = v51;
  v134[7] = &off_1002F48F8;
  v52 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:8];
  [v35 configure:v52];

  [v35 setPatternDetectorName:@"durationSigContactTrend"];
  v114 = v35;
  [v124 addObject:v35];
  v53 = objc_opt_new();
  uint64_t v54 = objc_opt_new();
  uint64_t v55 = objc_opt_new();
  uint64_t v56 = objc_opt_new();
  v106 = (void *)v54;
  [v53 setPredicate:v54];
  v105 = (void *)v55;
  [v53 setFeatureExtractor:v55];
  v104 = (void *)v56;
  [v53 setTrendDetector:v56];
  v131[0] = @"ExcludeTextOnlyConversations";
  v57 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)self->_configurationManager getBoolSettingForKey:@"PD_SCFT_ExcludeTextOnlyConversations" withFallback:0]];
  v132[0] = v57;
  v131[1] = @"MinimumTextCount";
  LODWORD(v58) = 5.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCFT_MinimumTextCount" withFallback:v58];
  v59 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v132[1] = v59;
  v131[2] = @"MinimumTotalCallDuration";
  LODWORD(v60) = 1114636288;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCFT_MinimumTotalCallDuration" withFallback:v60];
  v61 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v132[2] = v61;
  v131[3] = @"MaximumNumberOfContacts";
  LODWORD(v62) = 1.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCFT_MaximumNumberOfContacts" withFallback:v62];
  v63 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v132[3] = v63;
  v131[4] = @"MinimumFeatureNumberForTrend";
  LODWORD(v64) = 5.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCFT_MinimumFeatureNumberForTrend" withFallback:v64];
  v65 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v132[4] = v65;
  v131[5] = @"MinimumValueOfFeatureMaximum";
  LODWORD(v66) = 10.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCFT_MinimumValueOfFeatureMaximum" withFallback:v66];
  v67 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v132[5] = v67;
  v131[6] = @"MinimumFeatureSlopeForTrend";
  LODWORD(v68) = 1.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_SCFT_MinimumFeatureSlopeForTrend" withFallback:v68];
  v69 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v131[7] = @"TrendFeatureType";
  v132[6] = v69;
  v132[7] = &off_1002F4928;
  v70 = +[NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:8];
  [v53 configure:v70];

  [v53 setPatternDetectorName:@"frequencySigContactTrend"];
  v107 = v53;
  [v124 addObject:v53];
  v71 = objc_opt_new();
  uint64_t v72 = objc_opt_new();
  uint64_t v73 = objc_opt_new();
  uint64_t v74 = objc_opt_new();
  v103 = (void *)v72;
  [v71 setPredicate:v72];
  v102 = (void *)v73;
  [v71 setFeatureExtractor:v73];
  v101 = (void *)v74;
  [v71 setAnomalyDetector:v74];
  v129[0] = @"TukeyFactorForExponentialDistributionOutlier";
  LODWORD(v75) = 3.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_VS_TukeyFactorForExponentialDistributionOutlier" withFallback:v75];
  v76 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v130[0] = v76;
  v129[1] = @"MinimumFeatureNumberForPersonalizedThreshold";
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_VS_MinimumFeatureNumberForPersonalizedThreshold" withFallback:0.0];
  v77 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v130[1] = v77;
  v129[2] = @"MinimumFeatureSizeForPersonalizedThreshold";
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_VS_MinimumFeatureSizeForPersonalizedThreshold" withFallback:0.0];
  v78 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v130[2] = v78;
  v129[3] = @"MaximumThreshold";
  LODWORD(v79) = 1.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_VS_MaximumThreshold" withFallback:v79];
  v80 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v130[3] = v80;
  v129[4] = @"MinimumThreshold";
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_VS_MinimumThreshold" withFallback:0.0];
  v81 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v129[5] = @"AnomalyFeatureType";
  v130[4] = v81;
  v130[5] = &off_1002F4940;
  v82 = +[NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:6];
  [v71 configure:v82];

  [v71 setPatternDetectorName:@"scheduleVisitAnomaly"];
  [v124 addObject:v71];
  v83 = objc_opt_new();
  uint64_t v84 = objc_opt_new();
  v85 = objc_opt_new();
  v86 = objc_opt_new();
  v100 = (void *)v84;
  [v83 setPredicate:v84];
  [v83 setFeatureExtractor:v85];
  [v83 setAnomalyDetector:v86];
  v127[0] = @"TukeyFactorForExponentialDistributionOutlier";
  LODWORD(v87) = *(_DWORD *)"U0B@";
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TSLSM_TukeyFactorForExponentialDistributionOutlier" withFallback:v87];
  v88 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v128[0] = v88;
  v127[1] = @"MinimumFeatureNumberForPersonalizedThreshold";
  LODWORD(v89) = 1.0;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TSLSM_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v89];
  v90 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v128[1] = v90;
  v127[2] = @"MinimumFeatureSizeForPersonalizedThreshold";
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TSLSM_MinimumFeatureSizeForPersonalizedThreshold" withFallback:0.0];
  v91 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v128[2] = v91;
  v127[3] = @"MaximumThreshold";
  LODWORD(v92) = *(_DWORD *)"";
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TSLSM_MaximumThreshold" withFallback:v92];
  v93 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v128[3] = v93;
  v127[4] = @"MinimumThreshold";
  LODWORD(v94) = 1221783552;
  [(MOConfigurationManagerBase *)self->_configurationManager getFloatSettingForKey:@"PD_TSLSM_MinimumThreshold" withFallback:v94];
  v95 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v127[5] = @"AnomalyFeatureType";
  v128[4] = v95;
  v128[5] = &off_1002F4958;
  v96 = +[NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:6];
  [v83 configure:v96];

  [v83 setPatternDetectorName:@"timeSinceStateOfMindAnomaly"];
  [v124 addObject:v83];
  v97 = _mo_log_facility_get_os_log(&MOLogFacilityBatchedPatternDetection);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v98 = [v124 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v126 = v98;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Done constructing batched detectors [%i constructed]", buf, 8u);
  }

  return v124;
}

- (id)_initializeStreamingTypeDetector
{
  v3 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Constructing streaming pattern detectors", buf, 2u);
  }

  id v235 = (id)objc_opt_new();
  v4 = [(MOEventStore *)self->_eventStore getEWAPlistFileURL];
  if (v4
    && ([(MOEventStore *)self->_eventStore readEWAPlistFile:v4],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v234 = self;
    v182 = v5;
    v183 = v4;
    id v6 = [v5 mutableCopy];
    uint64_t v7 = [v6 allKeys];
    double v8 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Constructing streaming pattern detectors", buf, 2u);
    }

    v233 = objc_opt_new();
    v232 = objc_opt_new();
    v231 = objc_opt_new();
    v230 = objc_opt_new();
    v9 = objc_opt_new();
    long long v271 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    long long v274 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v271 objects:v300 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v272;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v272 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v271 + 1) + 8 * i);
          if ([v15 hasPrefix:@"MOEventCategoryWorkout"]
            && [v15 hasSuffix:@"TimeBetweenEvents"])
          {
            uint64_t v16 = [v6 objectForKey:v15];
            [v9 setObject:v16 forKeyedSubscript:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v271 objects:v300 count:16];
      }
      while (v12);
    }

    v229 = v9;
    [v233 setPredicate:v232];
    [v233 setFeatureExtractor:v231];
    [v233 setAnomalyDetector:v230];
    v298[0] = @"TukeyFactorForExponentialDistributionOutlier";
    LODWORD(v17) = *(_DWORD *)"U0B@";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLW_TukeyFactorForExponentialDistributionOutlier" withFallback:v17];
    uint64_t v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v299[0] = v18;
    v298[1] = @"MinimumFeatureNumberForPersonalizedThreshold";
    LODWORD(v19) = 2.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLW_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v19];
    double v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v299[1] = v20;
    v298[2] = @"MinimumFeatureSizeForPersonalizedThreshold";
    LODWORD(v21) = 1185464320;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLW_MinimumFeatureSizeForPersonalizedThreshold" withFallback:v21];
    objc_super v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v299[2] = v22;
    v298[3] = @"MaximumThreshold";
    LODWORD(v23) = 1242802176;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLW_MaximumThreshold" withFallback:v23];
    v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v299[3] = v24;
    v298[4] = @"MinimumThreshold";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLW_MinimumThreshold" withFallback:0.0];
    double v25 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v299[4] = v25;
    v298[5] = @"BetaForEWAUpdate";
    LODWORD(v26) = 1064198944;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLW_BetaForEWAUpdate" withFallback:v26];
    double v27 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v299[5] = v27;
    v299[6] = &off_1002F4958;
    v298[6] = @"AnomalyFeatureType";
    v298[7] = @"AnomalyEWADictionariesForDetector";
    v299[7] = v9;
    v28 = +[NSDictionary dictionaryWithObjects:v299 forKeys:v298 count:8];
    [v233 configure:v28];

    [v233 setPatternDetectorName:@"timeSinceWorkoutAnomaly"];
    [v235 addObject:v233];
    v29 = objc_opt_new();
    v228 = objc_opt_new();
    v227 = objc_opt_new();
    v226 = objc_opt_new();
    v238 = objc_opt_new();
    long long v267 = 0u;
    long long v268 = 0u;
    long long v269 = 0u;
    long long v270 = 0u;
    id v30 = v10;
    id v31 = [v30 countByEnumeratingWithState:&v267 objects:v297 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v268;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v268 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v267 + 1) + 8 * (void)j);
          if ([v35 hasPrefix:@"MOEventCategoryWorkout"]
            && [v35 hasSuffix:@"EventDuration"])
          {
            uint64_t v36 = [v6 objectForKey:v35];
            [v238 setObject:v36 forKeyedSubscript:v35];
          }
        }
        id v32 = [v30 countByEnumeratingWithState:&v267 objects:v297 count:16];
      }
      while (v32);
    }

    [v29 setPredicate:v228];
    [v29 setFeatureExtractor:v227];
    [v29 setAnomalyDetector:v226];
    v295[0] = @"TukeyFactorForExponentialDistributionOutlier";
    LODWORD(v37) = *(_DWORD *)"U0B@";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_WD_TukeyFactorForExponentialDistributionOutlier" withFallback:v37];
    uint64_t v38 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v296[0] = v38;
    v295[1] = @"MinimumFeatureNumberForPersonalizedThreshold";
    LODWORD(v39) = 2.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_WD_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v39];
    double v40 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v296[1] = v40;
    v295[2] = @"MinimumFeatureSizeForPersonalizedThreshold";
    LODWORD(v41) = 1114636288;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_WD_MinimumFeatureSizeForPersonalizedThreshold" withFallback:v41];
    double v42 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v296[2] = v42;
    v295[3] = @"MaximumThreshold";
    LODWORD(v43) = 1172373504;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_WD_MaximumThreshold" withFallback:v43];
    double v44 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v296[3] = v44;
    v295[4] = @"MinimumThreshold";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_WD_MinimumThreshold" withFallback:0.0];
    v45 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v296[4] = v45;
    v295[5] = @"BetaForEWAUpdate";
    LODWORD(v46) = 1064198944;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_WD_BetaForEWAUpdate" withFallback:v46];
    v47 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v296[5] = v47;
    v296[6] = &off_1002F48F8;
    v295[6] = @"AnomalyFeatureType";
    v295[7] = @"AnomalyEWADictionariesForDetector";
    v296[7] = v238;
    double v48 = +[NSDictionary dictionaryWithObjects:v296 forKeys:v295 count:8];
    [v29 configure:v48];

    [v29 setPatternDetectorName:@"durationWorkoutAnomaly"];
    v181 = v29;
    [v235 addObject:v29];
    v225 = objc_opt_new();
    v224 = objc_opt_new();
    v223 = objc_opt_new();
    v222 = objc_opt_new();
    v49 = objc_opt_new();
    long long v263 = 0u;
    long long v264 = 0u;
    long long v265 = 0u;
    long long v266 = 0u;
    id v50 = v30;
    id v51 = [v50 countByEnumeratingWithState:&v263 objects:v294 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v264;
      do
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(void *)v264 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void **)(*((void *)&v263 + 1) + 8 * (void)k);
          if ([v55 hasPrefix:@"MOEventCategoryMotionActivity"]
            && [v55 hasSuffix:@"EventDuration"])
          {
            uint64_t v56 = [v6 objectForKey:v55];
            [v49 setObject:v56 forKeyedSubscript:v55];
          }
        }
        id v52 = [v50 countByEnumeratingWithState:&v263 objects:v294 count:16];
      }
      while (v52);
    }

    v221 = v49;
    [v225 setPredicate:v224];
    [v225 setFeatureExtractor:v223];
    [v225 setAnomalyDetector:v222];
    v292[0] = @"TukeyFactorForExponentialDistributionOutlier";
    LODWORD(v57) = *(_DWORD *)"U0B@";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_PAD_TukeyFactorForExponentialDistributionOutlier" withFallback:v57];
    double v58 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v293[0] = v58;
    v292[1] = @"MinimumFeatureNumberForPersonalizedThreshold";
    LODWORD(v59) = 2.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_PAD_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v59];
    double v60 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v293[1] = v60;
    v292[2] = @"MinimumFeatureSizeForPersonalizedThreshold";
    LODWORD(v61) = 1114636288;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_PAD_MinimumFeatureSizeForPersonalizedThreshold" withFallback:v61];
    double v62 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v293[2] = v62;
    v292[3] = @"MaximumThreshold";
    LODWORD(v63) = 1172373504;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_PAD_MaximumThreshold" withFallback:v63];
    double v64 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v293[3] = v64;
    v292[4] = @"MinimumThreshold";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_PAD_MinimumThreshold" withFallback:0.0];
    v65 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v293[4] = v65;
    v292[5] = @"BetaForEWAUpdate";
    LODWORD(v66) = 1064198944;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_PAD_BetaForEWAUpdate" withFallback:v66];
    v67 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v293[5] = v67;
    v293[6] = &off_1002F48F8;
    v292[6] = @"AnomalyFeatureType";
    v292[7] = @"AnomalyEWADictionariesForDetector";
    v293[7] = v49;
    double v68 = +[NSDictionary dictionaryWithObjects:v293 forKeys:v292 count:8];
    [v225 configure:v68];

    [v225 setPatternDetectorName:@"durationPhoneActivityAnomaly"];
    [v235 addObject:v225];
    v220 = objc_opt_new();
    v219 = objc_opt_new();
    v218 = objc_opt_new();
    v217 = objc_opt_new();
    v69 = objc_opt_new();
    long long v259 = 0u;
    long long v260 = 0u;
    long long v261 = 0u;
    long long v262 = 0u;
    id v70 = v50;
    id v71 = [v70 countByEnumeratingWithState:&v259 objects:v291 count:16];
    if (v71)
    {
      id v72 = v71;
      uint64_t v73 = *(void *)v260;
      do
      {
        for (m = 0; m != v72; m = (char *)m + 1)
        {
          if (*(void *)v260 != v73) {
            objc_enumerationMutation(v70);
          }
          double v75 = *(void **)(*((void *)&v259 + 1) + 8 * (void)m);
          if ([v75 hasPrefix:@"MOEventCategorySignificantContact"]
            && [v75 hasSuffix:@"TimeBetweenEvents"])
          {
            v76 = [v6 objectForKey:v75];
            [v69 setObject:v76 forKeyedSubscript:v75];
          }
        }
        id v72 = [v70 countByEnumeratingWithState:&v259 objects:v291 count:16];
      }
      while (v72);
    }

    v216 = v69;
    [v220 setPredicate:v219];
    [v220 setFeatureExtractor:v218];
    [v220 setAnomalyDetector:v217];
    v289[0] = @"ExcludeTextOnlyConversations";
    v239 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v234->_configurationManager getBoolSettingForKey:@"PD_TSLSC_ExcludeTextOnlyConversations" withFallback:0]];
    v290[0] = v239;
    v289[1] = @"MinimumTextCount";
    LODWORD(v77) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_MinimumTextCount" withFallback:v77];
    v236 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[1] = v236;
    v289[2] = @"MinimumTotalCallDuration";
    LODWORD(v78) = 1133903872;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_MinimumTotalCallDuration" withFallback:v78];
    v214 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[2] = v214;
    v289[3] = @"MaximumNumberOfContacts";
    LODWORD(v79) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_MaximumNumberOfContacts" withFallback:v79];
    v212 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[3] = v212;
    v289[4] = @"TukeyFactorForExponentialDistributionOutlier";
    LODWORD(v80) = *(_DWORD *)"U0B@";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_TukeyFactorForExponentialDistributionOutlier" withFallback:v80];
    v81 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[4] = v81;
    v289[5] = @"MinimumFeatureNumberForPersonalizedThreshold";
    LODWORD(v82) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v82];
    v83 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[5] = v83;
    v289[6] = @"MinimumFeatureSizeForPersonalizedThreshold";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_MinimumFeatureSizeForPersonalizedThreshold" withFallback:0.0];
    uint64_t v84 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[6] = v84;
    v289[7] = @"MaximumThreshold";
    LODWORD(v85) = 1242802176;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_MaximumThreshold" withFallback:v85];
    v86 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[7] = v86;
    v289[8] = @"MinimumThreshold";
    LODWORD(v87) = 1221783552;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_MinimumThreshold" withFallback:v87];
    v88 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[8] = v88;
    v289[9] = @"BetaForEWAUpdate";
    LODWORD(v89) = 1064198944;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TSLSC_BetaForEWAUpdate" withFallback:v89];
    v90 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v290[9] = v90;
    v290[10] = &off_1002F4958;
    v289[10] = @"AnomalyFeatureType";
    v289[11] = @"AnomalyEWADictionariesForDetector";
    v290[11] = v69;
    v91 = +[NSDictionary dictionaryWithObjects:v290 forKeys:v289 count:12];
    [v220 configure:v91];

    [v220 setPatternDetectorName:@"timeSinceSigContactAnomaly"];
    [v235 addObject:v220];
    v215 = objc_opt_new();
    uint64_t v92 = objc_opt_new();
    v213 = objc_opt_new();
    v211 = objc_opt_new();
    v237 = objc_opt_new();
    long long v255 = 0u;
    long long v256 = 0u;
    long long v257 = 0u;
    long long v258 = 0u;
    id v93 = v70;
    id v94 = [v93 countByEnumeratingWithState:&v255 objects:v288 count:16];
    if (v94)
    {
      id v95 = v94;
      uint64_t v96 = *(void *)v256;
      do
      {
        for (n = 0; n != v95; n = (char *)n + 1)
        {
          if (*(void *)v256 != v96) {
            objc_enumerationMutation(v93);
          }
          unsigned int v98 = *(void **)(*((void *)&v255 + 1) + 8 * (void)n);
          if ([v98 hasPrefix:@"MOEventCategorySignificantContact"]
            && [v98 hasSuffix:@"EventDuration"])
          {
            v99 = [v6 objectForKey:v98];
            [v237 setObject:v99 forKeyedSubscript:v98];
          }
        }
        id v95 = [v93 countByEnumeratingWithState:&v255 objects:v288 count:16];
      }
      while (v95);
    }

    v180 = (void *)v92;
    [v215 setPredicate:v92];
    [v215 setFeatureExtractor:v213];
    [v215 setAnomalyDetector:v211];
    v286[0] = @"ExcludeTextOnlyConversations";
    v240 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v234->_configurationManager getBoolSettingForKey:@"PD_SCD_ExcludeTextOnlyConversations" withFallback:1]];
    v287[0] = v240;
    v286[1] = @"MinimumTextCount";
    LODWORD(v100) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_MinimumTextCount" withFallback:v100];
    v209 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[1] = v209;
    v286[2] = @"MinimumTotalCallDuration";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_MinimumTotalCallDuration" withFallback:0.0];
    v207 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[2] = v207;
    v286[3] = @"MaximumNumberOfContacts";
    LODWORD(v101) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_MaximumNumberOfContacts" withFallback:v101];
    v205 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[3] = v205;
    v286[4] = @"TukeyFactorForExponentialDistributionOutlier";
    LODWORD(v102) = 2.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_TukeyFactorForExponentialDistributionOutlier" withFallback:v102];
    v203 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[4] = v203;
    v286[5] = @"MinimumFeatureNumberForPersonalizedThreshold";
    LODWORD(v103) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v103];
    v104 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[5] = v104;
    v286[6] = @"MinimumFeatureSizeForPersonalizedThreshold";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_MinimumFeatureSizeForPersonalizedThreshold" withFallback:0.0];
    v105 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[6] = v105;
    v286[7] = @"MaximumThreshold";
    LODWORD(v106) = 1172373504;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_MaximumThreshold" withFallback:v106];
    v107 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[7] = v107;
    v286[8] = @"MinimumThreshold";
    LODWORD(v108) = 1147207680;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_MinimumThreshold" withFallback:v108];
    v109 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[8] = v109;
    v286[9] = @"BetaForEWAUpdate";
    LODWORD(v110) = 1064198944;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCD_BetaForEWAUpdate" withFallback:v110];
    v111 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v287[9] = v111;
    v287[10] = &off_1002F48F8;
    v286[10] = @"AnomalyFeatureType";
    v286[11] = @"AnomalyEWADictionariesForDetector";
    v287[11] = v237;
    v112 = +[NSDictionary dictionaryWithObjects:v287 forKeys:v286 count:12];
    [v215 configure:v112];

    [v215 setPatternDetectorName:@"durationSigContactAnomaly"];
    [v235 addObject:v215];
    v210 = objc_opt_new();
    v208 = objc_opt_new();
    v206 = objc_opt_new();
    v204 = objc_opt_new();
    v113 = objc_opt_new();
    long long v251 = 0u;
    long long v252 = 0u;
    long long v253 = 0u;
    long long v254 = 0u;
    id v114 = v93;
    id v115 = [v114 countByEnumeratingWithState:&v251 objects:v285 count:16];
    if (v115)
    {
      id v116 = v115;
      uint64_t v117 = *(void *)v252;
      do
      {
        for (ii = 0; ii != v116; ii = (char *)ii + 1)
        {
          if (*(void *)v252 != v117) {
            objc_enumerationMutation(v114);
          }
          v119 = *(void **)(*((void *)&v251 + 1) + 8 * (void)ii);
          if ([v119 hasPrefix:@"MOEventCategorySignificantContact"]
            && [v119 hasSuffix:@"ContactFrequency"])
          {
            v120 = [v6 objectForKey:v119];
            [v113 setObject:v120 forKeyedSubscript:v119];
          }
        }
        id v116 = [v114 countByEnumeratingWithState:&v251 objects:v285 count:16];
      }
      while (v116);
    }

    [v210 setPredicate:v208];
    [v210 setFeatureExtractor:v206];
    [v210 setAnomalyDetector:v204];
    v283[0] = @"ExcludeTextOnlyConversations";
    v241 = +[NSNumber numberWithBool:[(MOConfigurationManagerBase *)v234->_configurationManager getBoolSettingForKey:@"PD_SCF_ExcludeTextOnlyConversations" withFallback:0]];
    v284[0] = v241;
    v283[1] = @"MinimumTextCount";
    LODWORD(v121) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_MinimumTextCount" withFallback:v121];
    v201 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[1] = v201;
    v283[2] = @"MinimumTotalCallDuration";
    LODWORD(v122) = 1133903872;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_MinimumTotalCallDuration" withFallback:v122];
    v199 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[2] = v199;
    v283[3] = @"MaximumNumberOfContacts";
    LODWORD(v123) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_MaximumNumberOfContacts" withFallback:v123];
    v197 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[3] = v197;
    v283[4] = @"TukeyFactorForExponentialDistributionOutlier";
    LODWORD(v124) = *(_DWORD *)"U0B@";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_TukeyFactorForExponentialDistributionOutlier" withFallback:v124];
    v195 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[4] = v195;
    v283[5] = @"MinimumFeatureNumberForPersonalizedThreshold";
    LODWORD(v125) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v125];
    v193 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[5] = v193;
    v283[6] = @"MinimumFeatureSizeForPersonalizedThreshold";
    LODWORD(v126) = 2.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_MinimumFeatureSizeForPersonalizedThreshold" withFallback:v126];
    v127 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[6] = v127;
    v283[7] = @"MaximumThreshold";
    LODWORD(v128) = 1125515264;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_MaximumThreshold" withFallback:v128];
    v129 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[7] = v129;
    v283[8] = @"MinimumThreshold";
    LODWORD(v130) = 5.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_MinimumThreshold" withFallback:v130];
    v131 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[8] = v131;
    v283[9] = @"BetaForEWAUpdate";
    LODWORD(v132) = 1064198944;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_SCF_BetaForEWAUpdate" withFallback:v132];
    v133 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v284[9] = v133;
    v284[10] = &off_1002F4928;
    v283[10] = @"AnomalyFeatureType";
    v283[11] = @"AnomalyEWADictionariesForDetector";
    v179 = v113;
    v284[11] = v113;
    v134 = +[NSDictionary dictionaryWithObjects:v284 forKeys:v283 count:12];
    [v210 configure:v134];

    [v210 setPatternDetectorName:@"frequencySigContactAnomaly"];
    [v235 addObject:v210];
    v202 = objc_opt_new();
    v200 = objc_opt_new();
    v198 = objc_opt_new();
    v196 = objc_opt_new();
    v194 = objc_opt_new();
    v242 = objc_opt_new();
    long long v247 = 0u;
    long long v248 = 0u;
    long long v249 = 0u;
    long long v250 = 0u;
    id v135 = v114;
    id v136 = [v135 countByEnumeratingWithState:&v247 objects:v282 count:16];
    if (v136)
    {
      id v137 = v136;
      uint64_t v138 = *(void *)v248;
      do
      {
        for (jj = 0; jj != v137; jj = (char *)jj + 1)
        {
          if (*(void *)v248 != v138) {
            objc_enumerationMutation(v135);
          }
          v140 = *(void **)(*((void *)&v247 + 1) + 8 * (void)jj);
          if ([v140 hasPrefix:@"MOEventCategorySocialContextEvent"]
            && ([v140 hasSuffix:@"HostingAtHomeAnomaly"] & 1) != 0
            || [v140 hasPrefix:@"MOEventCategoryPeopleDensityEvent"]
            && [v140 hasSuffix:@"HostingAtHomeAnomaly"])
          {
            v141 = [v6 objectForKey:v140];
            [v242 setObject:v141 forKeyedSubscript:v140];
          }
        }
        id v137 = [v135 countByEnumeratingWithState:&v247 objects:v282 count:16];
      }
      while (v137);
    }

    [v202 setPredicate:v200];
    [v202 setFeatureExtractor:v198];
    [v202 setFeatureTransformer:v196];
    [v202 setAnomalyDetector:v194];
    v280[0] = @"TukeyFactorForExponentialDistributionOutlier";
    LODWORD(v142) = 2.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_HAH_TukeyFactorForExponentialDistributionOutlier" withFallback:v142];
    v191 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v281[0] = v191;
    v280[1] = @"MinimumFeatureNumberForPersonalizedThreshold";
    LODWORD(v143) = 5.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_HAH_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v143];
    v189 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v281[1] = v189;
    v280[2] = @"MinimumFeatureSizeForPersonalizedThreshold";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_HAH_MinimumFeatureSizeForPersonalizedThreshold" withFallback:0.0];
    v187 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v281[2] = v187;
    v280[3] = @"MaximumThreshold";
    LODWORD(v144) = 20.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_HAH_MaximumThreshold" withFallback:v144];
    v185 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v281[3] = v185;
    v280[4] = @"MinimumThreshold";
    LODWORD(v145) = 3.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_HAH_MinimumThreshold" withFallback:v145];
    v146 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v281[4] = v146;
    v280[5] = @"BetaForEWAUpdate";
    LODWORD(v147) = 1064198944;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_HAH_BetaForEWAUpdate" withFallback:v147];
    v148 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v281[5] = v148;
    v280[6] = @"AggregationType";
    LODWORD(v149) = 1.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_HAH_AggregationType" withFallback:v149];
    v150 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v281[6] = v150;
    v280[7] = @"AggregationWindow";
    v151 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v234->_configurationManager getIntegerSettingForKey:@"PD_HAH_AggregationWindow" withFallback:16]];
    v281[7] = v151;
    v281[8] = &off_1002F4970;
    v280[8] = @"AnomalyFeatureType";
    v280[9] = @"AnomalyEWADictionariesForDetector";
    v281[9] = v242;
    v152 = +[NSDictionary dictionaryWithObjects:v281 forKeys:v280 count:10];
    [v202 configure:v152];

    [v202 setPatternDetectorName:@"hostingAtHomeAnomaly"];
    [v235 addObject:v202];
    v192 = objc_opt_new();
    v190 = objc_opt_new();
    v188 = objc_opt_new();
    v186 = objc_opt_new();
    v184 = objc_opt_new();
    v153 = objc_opt_new();
    long long v243 = 0u;
    long long v244 = 0u;
    long long v245 = 0u;
    long long v246 = 0u;
    id v154 = v135;
    id v155 = [v154 countByEnumeratingWithState:&v243 objects:v279 count:16];
    if (v155)
    {
      id v156 = v155;
      uint64_t v157 = *(void *)v244;
      do
      {
        for (kk = 0; kk != v156; kk = (char *)kk + 1)
        {
          if (*(void *)v244 != v157) {
            objc_enumerationMutation(v154);
          }
          v159 = *(void **)(*((void *)&v243 + 1) + 8 * (void)kk);
          if ([v159 hasPrefix:@"MOEventTimeAtHomeAnomaly"]
            && [v159 hasSuffix:@"TimeAtHomeAnomaly"])
          {
            v160 = [v6 objectForKey:v159];
            [v153 setObject:v160 forKeyedSubscript:v159];
          }
        }
        id v156 = [v154 countByEnumeratingWithState:&v243 objects:v279 count:16];
      }
      while (v156);
    }

    [v192 setPredicate:v190];
    [v192 setFeatureExtractor:v188];
    [v192 setFeatureTransformer:v186];
    [v192 setAnomalyDetector:v184];
    v277[0] = @"TukeyFactorForExponentialDistributionOutlier";
    LODWORD(v161) = 1068708659;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TAH_TukeyFactorForExponentialDistributionOutlier" withFallback:v161];
    v178 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v278[0] = v178;
    v277[1] = @"MinimumFeatureNumberForPersonalizedThreshold";
    LODWORD(v162) = 3.0;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TAH_MinimumFeatureNumberForPersonalizedThreshold" withFallback:v162];
    v177 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v278[1] = v177;
    v277[2] = @"MinimumFeatureSizeForPersonalizedThreshold";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TAH_MinimumFeatureSizeForPersonalizedThreshold" withFallback:0.0];
    v176 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v278[2] = v176;
    v277[3] = @"MaximumThreshold";
    LODWORD(v163) = 1200398336;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TAH_MaximumThreshold" withFallback:v163];
    v175 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v278[3] = v175;
    v277[4] = @"MinimumThreshold";
    LODWORD(v164) = 1193852928;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TAH_MinimumThreshold" withFallback:v164];
    v174 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v278[4] = v174;
    v277[5] = @"BetaForEWAUpdate";
    LODWORD(v165) = 1064198944;
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TAH_BetaForEWAUpdate" withFallback:v165];
    v166 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v278[5] = v166;
    v277[6] = @"AggregationType";
    [(MOConfigurationManagerBase *)v234->_configurationManager getFloatSettingForKey:@"PD_TAH_AggregationType" withFallback:0.0];
    v167 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v278[6] = v167;
    v277[7] = @"AggregationWindow";
    v168 = +[NSNumber numberWithInt:[(MOConfigurationManagerBase *)v234->_configurationManager getIntegerSettingForKey:@"PD_TAH_AggregationWindow" withFallback:16]];
    v278[7] = v168;
    v278[8] = &off_1002F4988;
    v277[8] = @"AnomalyFeatureType";
    v277[9] = @"AnomalyEWADictionariesForDetector";
    v278[9] = v153;
    v169 = +[NSDictionary dictionaryWithObjects:v278 forKeys:v277 count:10];
    [v192 configure:v169];

    [v192 setPatternDetectorName:@"tahAnomaly"];
    [v235 addObject:v192];
    v170 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v171 = [v235 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v276 = v171;
      _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "Done constructing streaming detectors [%i constructed]", buf, 8u);
    }

    v172 = v182;
    v4 = v183;
  }
  else
  {
    v172 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
    if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternManager _initializeStreamingTypeDetector](v172);
    }
  }

  return v235;
}

- (id)_processEvents:(id)a3 forDetector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_opt_new();
  if ([v7 count])
  {
    v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    if ([v7 count])
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = +[NSNull null];
        [v9 addObject:v11];

        ++v10;
      }
      while (v10 < (unint64_t)[v7 count]);
    }
    id v12 = [[MOPerformanceMeasurement alloc] initWithName:@"MOEventPatternManager" measureRecentPeak:1];
    [(MOPerformanceMeasurement *)v12 startSession];
    id v13 = [v7 count];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __52__MOEventPatternManager__processEvents_forDetector___block_invoke;
    block[3] = &unk_1002CA978;
    id v42 = v7;
    id v15 = v7;
    id v53 = v15;
    id v54 = v6;
    id v16 = v9;
    id v55 = v16;
    dispatch_apply((size_t)v13, queue, block);
    double v40 = v12;
    [(MOPerformanceMeasurement *)v12 endSession];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v49;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          if (v22 && [*(id *)(*((void *)&v48 + 1) + 8 * i) count]) {
            [v8 addObjectsFromArray:v22];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v19);
    }
    double v41 = self;
    id v43 = v6;

    double v23 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v58 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Finished running pattern detectors and generated %lu results", buf, 0xCu);
    }

    double v25 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v26 = v15;
    id v27 = [v26 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)j) getAnomalyDetector];
          if (v31)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v32 = [v31 getAnomalyDetectorDict];
              uint64_t v33 = v32;
              if (v32 && [v32 count]) {
                [v25 addEntriesFromDictionary:v33];
              }
            }
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v28);
    }

    v34 = [(MOEventStore *)v41->_eventStore getEWAPlistFileURL];
    id v6 = v43;
    if (!v34) {
      goto LABEL_38;
    }
    unsigned int v35 = [(MOEventStore *)v41->_eventStore persistEWAMetrics:v34 withData:v25];
    uint64_t v36 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
    if (v35)
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        uint64_t v38 = "Writing to EWA pList successful";
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v38, buf, 2u);
      }
    }
    else if (v37)
    {
      *(_WORD *)buf = 0;
      uint64_t v38 = "Writing to EWA pList failed";
      goto LABEL_36;
    }

LABEL_38:
    id v7 = v42;
  }

  return v8;
}

void __52__MOEventPatternManager__processEvents_forDetector___block_invoke(uint64_t a1, uint64_t a2)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v6 = [v5 processEvents:*(void *)(a1 + 40)];
  if (v6) {
    [*(id *)(a1 + 48) setObject:v6 atIndexedSubscript:a2];
  }
  double v7 = CFAbsoluteTimeGetCurrent();
  double v8 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v5 patternDetectorName];
    int v10 = 138412546;
    id v11 = v9;
    __int16 v12 = 2048;
    double v13 = v7 - Current;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PatternDetector for %@ took %f secs to complete", (uint8_t *)&v10, 0x16u);
  }
}

- (id)processEvents:(id)a3 withRefreshVariant:(unint64_t)a4 forDateInterval:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = v9;
  id v11 = &__NSArray0__struct;
  switch(__ROR8__(a4, 8))
  {
    case 0:
      double v13 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternManager processEvents:withRefreshVariant:forDateInterval:](v13);
      }
      goto LABEL_13;
    case 1:
    case 3:
    case 5:
      [v9 duration];
      if (v12 >= 2419200.0)
      {
        double v13 = objc_opt_new();
        id v15 = [(MOEventPatternManager *)self _initializeBatchedTypeDetector];
        id v16 = [(MOEventPatternManager *)self _initializeStreamingTypeDetector];
        [v13 addObjectsFromArray:v16];
        [v13 addObjectsFromArray:v15];
        id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Running streaming and batched pattern detectors", (uint8_t *)&v20, 2u);
        }

        id v11 = [(MOEventPatternManager *)self _processEvents:v8 forDetector:v13];
      }
      else
      {
        double v13 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          [v10 duration];
          int v20 = 134218240;
          uint64_t v21 = v14;
          __int16 v22 = 2048;
          unint64_t v23 = a4;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Have only %f days of data, not running batched detectors for variant %lu", (uint8_t *)&v20, 0x16u);
        }
      }
      goto LABEL_13;
    case 2:
      double v13 = [(MOEventPatternManager *)self _initializeStreamingTypeDetector];
      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Running streaming pattern detectors", (uint8_t *)&v20, 2u);
      }

      id v11 = [(MOEventPatternManager *)self _processEvents:v8 forDetector:v13];
LABEL_13:

      break;
    default:
      break;
  }

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_universe, 0);
}

- (void)_initializeStreamingTypeDetector
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "EWA persistence plist read error, so returning empty array of streaming type pattern detectors", v1, 2u);
}

- (void)processEvents:(os_log_t)log withRefreshVariant:forDateInterval:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Refresh variant Unknown", v1, 2u);
}

@end