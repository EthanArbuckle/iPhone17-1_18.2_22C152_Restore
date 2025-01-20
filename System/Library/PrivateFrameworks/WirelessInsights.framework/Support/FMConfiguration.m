@interface FMConfiguration
+ (id)getAllValuesWithDefaultsBasedOn:(id)a3;
+ (id)getNSNumberAtKey:(id)a3 fromDict:(id)a4 error:(id *)a5;
+ (id)sharedInstance;
+ (void)replaceSharedInstanceWithValuesOrDefaults:(id)a3;
- (BOOL)FMTSEnableTimeSeriesPredictions;
- (BOOL)disableCrowdsourcedLearnings;
- (BOOL)disableVisitChecking;
- (BOOL)enableCongestionPredictions;
- (BOOL)enableFedMobilityOOSLearnings;
- (BOOL)isCompatibleToConfig:(id)a3;
- (BOOL)sendOOSPredictionsToBaseband;
- (FMConfiguration)initWithValues:(id)a3;
- (NSArray)congestionPredictionEnabledCountries;
- (NSArray)crowdsourcedDisabledCountries;
- (NSDictionary)configAsDict;
- (double)FMTSAnomalyBaseConfidence;
- (double)FMTSAnomalyUsedForPredictionDistanceThreshold;
- (double)FMTSCellChangeCrossDistance;
- (double)FMTSEventTypeWeightCellChange;
- (double)FMTSEventTypeWeightSignalStrengthChange;
- (double)FMTSEventTypeWeightVisitEnd;
- (double)FMTSEventTypeWeightVisitStart;
- (double)FMTSSignalStrengthChangeSameDirectionDistance;
- (double)FMTSTimeDistanceWeight;
- (float)selectPredictedCellBasedOnSeenCountLikelihood;
- (float)sendCrowdsourcedPredictionLikelihood;
- (float)sendOnDevicePredictionLikelihood;
- (int)FMTSTimeDistanceMaxTime;
- (unint64_t)CellCoverageTileMinNumberOfObservations;
- (unint64_t)CrowdsourcedMaxCountDiffPercentThreshold;
- (unint64_t)CrowdsourcedMinDistanceChangedWhileOOSThreshold;
- (unint64_t)CrowdsourcedOOSRateDiffThreshold;
- (unint64_t)FMTSAnomaliesInDatabase;
- (unint64_t)FMTSAnomalyConfidenceMinPredictionCount;
- (unint64_t)FMTSAnomalyPredictionAdvanceTimeSeconds;
- (unint64_t)FMTSAnomalyPredictionDurationConfidenceRangeSeconds;
- (unint64_t)FMTSAnomalyPredictionMinNumObservedEvents;
- (unint64_t)FMTSAnomalyPredictionTimeToAnomalyConfidenceRangeSeconds;
- (unint64_t)FMTSAnomalyStoringMinNumObservedEvents;
- (unint64_t)FMTSPredictionMinTimeBetweenPredictionsSeconds;
- (unint64_t)FMTSWindowSizeInDatabaseSeconds;
- (unint64_t)FMTSWindowSizeMaxTimeUntilPredictedAnomalySeconds;
- (unint64_t)LocationHorizontalAccuracyThreshold;
- (unint64_t)OOSAreasDatabaseTimeToLive;
- (unint64_t)OOSDurationsInDatabase;
- (unint64_t)OOSMaxOOSAreasInDatabase;
- (unint64_t)OOSMaxSecondsSinceCellSeenBeforeInService;
- (unint64_t)OOSMinOOSAreaDurationSeconds;
- (unint64_t)OOSMinSeenCountForSendingPrediction;
- (unint64_t)OOSNextVisitCutoffMinutes;
- (unint64_t)OOSPrevCellsInDatabase;
- (unint64_t)OOSPrevCellsInMemory;
- (unint64_t)OOSTimeBetweenDatabaseMaintenance;
- (unint64_t)OOSTimeOfDayWindowBackMinutes;
- (unint64_t)OOSTimeOfDayWindowForwardMinutes;
- (unint64_t)congestionGoodCellsInDatabase;
- (unint64_t)congestionMaxAreasInDatabase;
- (unint64_t)congestionMinSeenCountForSendingPrediction;
- (unint64_t)congestionOccurrencesInDatabase;
- (unint64_t)congestionPrevCellsInDatabase;
- (unint64_t)congestionTimeOfDayWindowBackMinutes;
- (unint64_t)congestionTimeOfDayWindowForwardMinutes;
- (unint64_t)coreLocationDistanceFilter;
- (unint64_t)minPredictedDurationSeconds;
- (unint64_t)onDeviceDurationPredictionPercentile;
@end

@implementation FMConfiguration

- (unint64_t)OOSTimeOfDayWindowForwardMinutes
{
  return self->_OOSTimeOfDayWindowForwardMinutes;
}

- (unint64_t)OOSTimeOfDayWindowBackMinutes
{
  return self->_OOSTimeOfDayWindowBackMinutes;
}

+ (id)sharedInstance
{
  v2 = (void *)qword_1001D7DA0;
  if (!qword_1001D7DA0)
  {
    v3 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "FederatedMobility[FMConfiguration]:Shared instance not yet set up", v5, 2u);
      v2 = (void *)qword_1001D7DA0;
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

- (unint64_t)OOSPrevCellsInDatabase
{
  return self->_OOSPrevCellsInDatabase;
}

- (unint64_t)congestionPrevCellsInDatabase
{
  return self->_congestionPrevCellsInDatabase;
}

- (unint64_t)OOSPrevCellsInMemory
{
  return self->_OOSPrevCellsInMemory;
}

+ (void)replaceSharedInstanceWithValuesOrDefaults:(id)a3
{
  id v7 = a3;
  v3 = [FMConfiguration alloc];
  v4 = +[FMConfiguration getAllValuesWithDefaultsBasedOn:v7];
  v5 = [(FMConfiguration *)v3 initWithValues:v4];
  v6 = (void *)qword_1001D7DA0;
  qword_1001D7DA0 = (uint64_t)v5;
}

+ (id)getNSNumberAtKey:(id)a3 fromDict:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v9 = [a4 objectForKeyedSubscript:v7];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = v9;
    int v11 = 0;
  }
  else
  {
    int v11 = 1;
  }

  if (v11)
  {
    v12 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10014623C((uint64_t)v7, v12);
    }
    v13 = +[NSString stringWithFormat:@"Missing configuration value for key %@", v7, NSLocalizedDescriptionKey];
    v17 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *a5 = +[NSError errorWithDomain:@"FMConfiguration" code:0 userInfo:v14];

    v9 = 0;
  }

  return v9;
}

+ (id)getAllValuesWithDefaultsBasedOn:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  int v11 = sub_100084BF0;
  v12 = &unk_1001B90B0;
  id v5 = v3;
  id v13 = v5;
  id v6 = v4;
  id v14 = v6;
  [&off_1001C4168 enumerateKeysAndObjectsUsingBlock:&v9];
  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

- (FMConfiguration)initWithValues:(id)a3
{
  id v5 = a3;
  v194.receiver = self;
  v194.super_class = (Class)FMConfiguration;
  id v6 = [(FMConfiguration *)&v194 init];
  id v7 = v6;
  if (v6)
  {
    crowdsourcedDisabledCountries = v6->_crowdsourcedDisabledCountries;
    v6->_crowdsourcedDisabledCountries = (NSArray *)&off_1001C4090;

    congestionPredictionEnabledCountries = v7->_congestionPredictionEnabledCountries;
    v7->_congestionPredictionEnabledCountries = (NSArray *)&off_1001C40A8;

    id v193 = 0;
    uint64_t v10 = +[FMConfiguration getNSNumberAtKey:@"FMEnableFedMobilityOOSLearnings" fromDict:v5 error:&v193];
    id v11 = v193;
    v7->_enableFedMobilityOOSLearnings = [v10 BOOLValue];

    id v192 = v11;
    v12 = +[FMConfiguration getNSNumberAtKey:@"FMSendOOSPredictionsToBaseband" fromDict:v5 error:&v192];
    id v13 = v192;

    v7->_sendOOSPredictionsToBaseband = [v12 BOOLValue];
    id v191 = v13;
    id v14 = +[FMConfiguration getNSNumberAtKey:@"FMOOSTimeOfDayWindowBackMinutes" fromDict:v5 error:&v191];
    id v15 = v191;

    v7->_OOSTimeOfDayWindowBackMinutes = (unint64_t)[v14 unsignedIntegerValue];
    id v190 = v15;
    uint64_t v16 = +[FMConfiguration getNSNumberAtKey:@"FMOOSTimeOfDayWindowForwardMinutes" fromDict:v5 error:&v190];
    id v17 = v190;

    v7->_OOSTimeOfDayWindowForwardMinutes = (unint64_t)[v16 unsignedIntegerValue];
    id v189 = v17;
    v18 = +[FMConfiguration getNSNumberAtKey:@"FMOOSNextVisitCutoffMinutes" fromDict:v5 error:&v189];
    id v19 = v189;

    v7->_OOSNextVisitCutoffMinutes = (unint64_t)[v18 unsignedIntegerValue];
    id v188 = v19;
    v20 = +[FMConfiguration getNSNumberAtKey:@"FMOOSPrevCellsInDatabase" fromDict:v5 error:&v188];
    id v21 = v188;

    v7->_OOSPrevCellsInDatabase = (unint64_t)[v20 unsignedIntegerValue];
    id v187 = v21;
    v22 = +[FMConfiguration getNSNumberAtKey:@"FMOOSDurationsInDatabase" fromDict:v5 error:&v187];
    id v23 = v187;

    v7->_OOSDurationsInDatabase = (unint64_t)[v22 unsignedIntegerValue];
    id v186 = v23;
    v24 = +[FMConfiguration getNSNumberAtKey:@"FMOOSPrevCellsInMemory" fromDict:v5 error:&v186];
    id v25 = v186;

    v7->_OOSPrevCellsInMemory = (unint64_t)[v24 unsignedIntegerValue];
    id v185 = v25;
    v26 = +[FMConfiguration getNSNumberAtKey:@"FMOOSMinOOSAreaDurationSeconds" fromDict:v5 error:&v185];
    id v27 = v185;

    v7->_OOSMinOOSAreaDurationSeconds = (unint64_t)[v26 unsignedIntegerValue];
    id v184 = v27;
    v28 = +[FMConfiguration getNSNumberAtKey:@"FMOOSMaxSecondsSinceCellSeenBeforeInService" fromDict:v5 error:&v184];
    id v29 = v184;

    v7->_OOSMaxSecondsSinceCellSeenBeforeInService = (unint64_t)[v28 unsignedIntegerValue];
    id v183 = v29;
    v30 = +[FMConfiguration getNSNumberAtKey:@"FMOOSMinSeenCountForSendingPrediction" fromDict:v5 error:&v183];
    id v31 = v183;

    v7->_OOSMinSeenCountForSendingPrediction = (unint64_t)[v30 unsignedIntegerValue];
    id v182 = v31;
    v32 = +[FMConfiguration getNSNumberAtKey:@"FMOOSMaxOOSAreasInDatabase" fromDict:v5 error:&v182];
    id v33 = v182;

    v7->_OOSMaxOOSAreasInDatabase = (unint64_t)[v32 unsignedIntegerValue];
    id v181 = v33;
    v34 = +[FMConfiguration getNSNumberAtKey:@"FMOOSTimeBetweenDatabaseMaintenance" fromDict:v5 error:&v181];
    id v35 = v181;

    v7->_OOSTimeBetweenDatabaseMaintenance = (unint64_t)[v34 unsignedIntegerValue];
    id v180 = v35;
    v36 = +[FMConfiguration getNSNumberAtKey:@"FMOOSAreasDatabaseTimeToLive" fromDict:v5 error:&v180];
    id v37 = v180;

    v7->_OOSAreasDatabaseTimeToLive = (unint64_t)[v36 unsignedIntegerValue];
    id v179 = v37;
    v38 = +[FMConfiguration getNSNumberAtKey:@"FMCellCoverageTileMinNumberOfObservations" fromDict:v5 error:&v179];
    id v39 = v179;

    v7->_CellCoverageTileMinNumberOfObservations = (unint64_t)[v38 unsignedIntegerValue];
    id v178 = v39;
    v40 = +[FMConfiguration getNSNumberAtKey:@"FMCrowdsourcedOOSRateDiffThreshold" fromDict:v5 error:&v178];
    id v41 = v178;

    v7->_CrowdsourcedOOSRateDiffThreshold = (unint64_t)[v40 unsignedIntegerValue];
    id v177 = v41;
    v42 = +[FMConfiguration getNSNumberAtKey:@"FMCrowdsourcedMaxCountDiffPercentThreshold" fromDict:v5 error:&v177];
    id v43 = v177;

    v7->_CrowdsourcedMaxCountDiffPercentThreshold = (unint64_t)[v42 unsignedIntegerValue];
    id v176 = v43;
    v44 = +[FMConfiguration getNSNumberAtKey:@"FMCrowdsourcedMinDistanceChangedWhileOOSThreshold" fromDict:v5 error:&v176];
    id v45 = v176;

    v7->_CrowdsourcedMinDistanceChangedWhileOOSThreshold = (unint64_t)[v44 unsignedIntegerValue];
    id v175 = v45;
    v46 = +[FMConfiguration getNSNumberAtKey:@"FMDisableVisitChecking" fromDict:v5 error:&v175];
    id v47 = v175;

    v7->_disableVisitChecking = [v46 BOOLValue];
    id v174 = v47;
    v48 = +[FMConfiguration getNSNumberAtKey:@"FMLocationHorizontalAccuracyThreshold" fromDict:v5 error:&v174];
    id v49 = v174;

    v7->_LocationHorizontalAccuracyThreshold = (unint64_t)[v48 unsignedIntegerValue];
    id v173 = v49;
    v50 = +[FMConfiguration getNSNumberAtKey:@"FMSendOnDevicePredictionLikelihood" fromDict:v5 error:&v173];
    id v51 = v173;

    [v50 floatValue];
    v7->_sendOnDevicePredictionLikelihood = v52;

    id v172 = v51;
    v53 = +[FMConfiguration getNSNumberAtKey:@"FMSelectPredictedCellBasedOnSeenCountLikelihood" fromDict:v5 error:&v172];
    id v54 = v172;

    [v53 floatValue];
    v7->_selectPredictedCellBasedOnSeenCountLikelihood = v55;

    id v171 = v54;
    v56 = +[FMConfiguration getNSNumberAtKey:@"FMSendCrowdsourcedPredictionLikelihood" fromDict:v5 error:&v171];
    id v57 = v171;

    [v56 floatValue];
    v7->_sendCrowdsourcedPredictionLikelihood = v58;

    id v170 = v57;
    v59 = +[FMConfiguration getNSNumberAtKey:@"FMOnDeviceDurationPredictionPercentile" fromDict:v5 error:&v170];
    id v60 = v170;

    v7->_onDeviceDurationPredictionPercentile = (unint64_t)[v59 unsignedIntegerValue];
    id v169 = v60;
    v61 = +[FMConfiguration getNSNumberAtKey:@"FMCoreLocationDistanceFilter" fromDict:v5 error:&v169];
    id v62 = v169;

    v7->_coreLocationDistanceFilter = (unint64_t)[v61 unsignedIntegerValue];
    id v168 = v62;
    v63 = +[FMConfiguration getNSNumberAtKey:@"FMDisableCrowdsourcedLearnings" fromDict:v5 error:&v168];
    id v64 = v168;

    v7->_disableCrowdsourcedLearnings = [v63 BOOLValue];
    id v167 = v64;
    v65 = +[FMConfiguration getNSNumberAtKey:@"FMMinPredictedDurationSeconds" fromDict:v5 error:&v167];
    id v66 = v167;

    v7->_minPredictedDurationSeconds = (unint64_t)[v65 unsignedIntegerValue];
    id v166 = v66;
    v67 = +[FMConfiguration getNSNumberAtKey:@"FMEnableCongestionPredictions" fromDict:v5 error:&v166];
    id v68 = v166;

    v7->_enableCongestionPredictions = [v67 BOOLValue];
    id v165 = v68;
    v69 = +[FMConfiguration getNSNumberAtKey:@"FMCongestionOccurrencesInDatabase" fromDict:v5 error:&v165];
    id v70 = v165;

    v7->_congestionOccurrencesInDatabase = (unint64_t)[v69 unsignedIntegerValue];
    id v164 = v70;
    v71 = +[FMConfiguration getNSNumberAtKey:@"FMCongestionPrevCellsInDatabase" fromDict:v5 error:&v164];
    id v72 = v164;

    v7->_congestionPrevCellsInDatabase = (unint64_t)[v71 unsignedIntegerValue];
    id v163 = v72;
    v73 = +[FMConfiguration getNSNumberAtKey:@"FMCongestionMaxAreasInDatabase" fromDict:v5 error:&v163];
    id v74 = v163;

    v7->_congestionMaxAreasInDatabase = (unint64_t)[v73 unsignedIntegerValue];
    id v162 = v74;
    v75 = +[FMConfiguration getNSNumberAtKey:@"FMCongestionTimeOfDayWindowBackMinutes" fromDict:v5 error:&v162];
    id v76 = v162;

    v7->_congestionTimeOfDayWindowBackMinutes = (unint64_t)[v75 unsignedIntegerValue];
    id v161 = v76;
    v77 = +[FMConfiguration getNSNumberAtKey:@"FMCongestionTimeOfDayWindowForwardMinutes" fromDict:v5 error:&v161];
    id v78 = v161;

    v7->_congestionTimeOfDayWindowForwardMinutes = (unint64_t)[v77 unsignedIntegerValue];
    id v160 = v78;
    v79 = +[FMConfiguration getNSNumberAtKey:@"FMCongestionMinSeenCountForSendingPrediction" fromDict:v5 error:&v160];
    id v80 = v160;

    v7->_congestionMinSeenCountForSendingPrediction = (unint64_t)[v79 unsignedIntegerValue];
    id v159 = v80;
    v81 = +[FMConfiguration getNSNumberAtKey:@"FMCongestionGoodCellsInDatabase" fromDict:v5 error:&v159];
    id v82 = v159;

    v7->_congestionGoodCellsInDatabase = (unint64_t)[v81 unsignedIntegerValue];
    id v158 = v82;
    v83 = +[FMConfiguration getNSNumberAtKey:@"FMTSEnableTimeSeriesPredictions" fromDict:v5 error:&v158];
    id v84 = v158;

    v7->_FMTSEnableTimeSeriesPredictions = [v83 BOOLValue];
    id v157 = v84;
    v85 = +[FMConfiguration getNSNumberAtKey:@"FMTSWindowSizeInDatabaseSeconds" fromDict:v5 error:&v157];
    id v86 = v157;

    v7->_FMTSWindowSizeInDatabaseSeconds = (unint64_t)[v85 unsignedIntegerValue];
    id v156 = v86;
    v87 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomaliesInDatabase" fromDict:v5 error:&v156];
    id v88 = v156;

    v7->_FMTSAnomaliesInDatabase = (unint64_t)[v87 unsignedIntegerValue];
    id v155 = v88;
    v89 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomalyUsedForPredictionDistanceThreshold" fromDict:v5 error:&v155];
    id v90 = v155;

    [v89 doubleValue];
    v7->_FMTSAnomalyUsedForPredictionDistanceThreshold = v91;

    id v154 = v90;
    v92 = +[FMConfiguration getNSNumberAtKey:@"FMTSTimeDistanceWeight" fromDict:v5 error:&v154];
    id v93 = v154;

    [v92 doubleValue];
    v7->_FMTSTimeDistanceWeight = v94;

    id v153 = v93;
    v95 = +[FMConfiguration getNSNumberAtKey:@"FMTSCellChangeCrossDistance" fromDict:v5 error:&v153];
    id v96 = v153;

    [v95 doubleValue];
    v7->_FMTSCellChangeCrossDistance = v97;

    id v152 = v96;
    v98 = +[FMConfiguration getNSNumberAtKey:@"FMTSTimeDistanceMaxTime" fromDict:v5 error:&v152];
    id v99 = v152;

    v7->_FMTSTimeDistanceMaxTime = [v98 intValue];
    id v151 = v99;
    v100 = +[FMConfiguration getNSNumberAtKey:@"FMTSEventTypeWeightCellChange" fromDict:v5 error:&v151];
    id v101 = v151;

    [v100 doubleValue];
    v7->_FMTSEventTypeWeightCellChange = v102;

    id v150 = v101;
    v103 = +[FMConfiguration getNSNumberAtKey:@"FMTSEventTypeWeightSignalStrengthChange" fromDict:v5 error:&v150];
    id v104 = v150;

    [v103 doubleValue];
    v7->_FMTSEventTypeWeightSignalStrengthChange = v105;

    id v149 = v104;
    v106 = +[FMConfiguration getNSNumberAtKey:@"FMTSEventTypeWeightVisitStart" fromDict:v5 error:&v149];
    id v107 = v149;

    [v106 doubleValue];
    v7->_FMTSEventTypeWeightVisitStart = v108;

    id v148 = v107;
    v109 = +[FMConfiguration getNSNumberAtKey:@"FMTSEventTypeWeightVisitEnd" fromDict:v5 error:&v148];
    id v110 = v148;

    [v109 doubleValue];
    v7->_FMTSEventTypeWeightVisitEnd = v111;

    id v147 = v110;
    v112 = +[FMConfiguration getNSNumberAtKey:@"FMTSSignalStrengthChangeSameDirectionDistance" fromDict:v5 error:&v147];
    id v113 = v147;

    [v112 doubleValue];
    v7->_FMTSSignalStrengthChangeSameDirectionDistance = v114;

    id v146 = v113;
    v115 = +[FMConfiguration getNSNumberAtKey:@"FMTSWindowSizeMaxTimeUntilPredictedAnomalySeconds" fromDict:v5 error:&v146];
    id v116 = v146;

    v7->_FMTSWindowSizeMaxTimeUntilPredictedAnomalySeconds = (unint64_t)[v115 unsignedIntegerValue];
    id v145 = v116;
    v117 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomalyPredictionAdvanceTimeSeconds" fromDict:v5 error:&v145];
    id v118 = v145;

    v7->_FMTSAnomalyPredictionAdvanceTimeSeconds = (unint64_t)[v117 unsignedIntegerValue];
    id v144 = v118;
    v119 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomalyPredictionDurationConfidenceRangeSeconds" fromDict:v5 error:&v144];
    id v120 = v144;

    v7->_FMTSAnomalyPredictionDurationConfidenceRangeSeconds = (unint64_t)[v119 unsignedIntegerValue];
    id v143 = v120;
    v121 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomalyPredictionTimeToAnomalyConfidenceRangeSeconds" fromDict:v5 error:&v143];
    id v122 = v143;

    v7->_FMTSAnomalyPredictionTimeToAnomalyConfidenceRangeSeconds = (unint64_t)[v121 unsignedIntegerValue];
    id v142 = v122;
    v123 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomalyBaseConfidence" fromDict:v5 error:&v142];
    id v124 = v142;

    [v123 doubleValue];
    v7->_FMTSAnomalyBaseConfidence = v125;

    id v141 = v124;
    v126 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomalyConfidenceMinPredictionCount" fromDict:v5 error:&v141];
    id v127 = v141;

    v7->_FMTSAnomalyConfidenceMinPredictionCount = (unint64_t)[v126 unsignedIntegerValue];
    id v140 = v127;
    v128 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomalyPredictionMinNumObservedEvents" fromDict:v5 error:&v140];
    id v129 = v140;

    v7->_FMTSAnomalyPredictionMinNumObservedEvents = (unint64_t)[v128 unsignedIntegerValue];
    id v139 = v129;
    v130 = +[FMConfiguration getNSNumberAtKey:@"FMTSPredictionMinTimeBetweenPredictionsSeconds" fromDict:v5 error:&v139];
    id v131 = v139;

    v7->_FMTSPredictionMinTimeBetweenPredictionsSeconds = (unint64_t)[v130 unsignedIntegerValue];
    id v138 = v131;
    v132 = +[FMConfiguration getNSNumberAtKey:@"FMTSAnomalyStoringMinNumObservedEvents" fromDict:v5 error:&v138];
    id v133 = v138;

    v7->_FMTSAnomalyStoringMinNumObservedEvents = (unint64_t)[v132 unsignedIntegerValue];
    if (v133)
    {
      v134 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
      {
        v135 = [v133 localizedDescription];
        sub_1001462B4(v135, buf, v134);
      }
      v136 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v7->_configAsDict, a3);
      [v5 enumerateKeysAndObjectsUsingBlock:&stru_1001B90F0];
      v136 = v7;
    }
  }
  else
  {
    v136 = 0;
  }

  return v136;
}

- (BOOL)isCompatibleToConfig:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  BOOL v6 = 1;
  if (v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100086210;
    v8[3] = &unk_1001B9118;
    v8[4] = self;
    id v9 = v4;
    uint64_t v10 = &v11;
    [&off_1001C40C0 enumerateObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

- (BOOL)enableFedMobilityOOSLearnings
{
  return self->_enableFedMobilityOOSLearnings;
}

- (BOOL)sendOOSPredictionsToBaseband
{
  return self->_sendOOSPredictionsToBaseband;
}

- (unint64_t)OOSNextVisitCutoffMinutes
{
  return self->_OOSNextVisitCutoffMinutes;
}

- (unint64_t)OOSDurationsInDatabase
{
  return self->_OOSDurationsInDatabase;
}

- (unint64_t)OOSMinOOSAreaDurationSeconds
{
  return self->_OOSMinOOSAreaDurationSeconds;
}

- (unint64_t)OOSMaxSecondsSinceCellSeenBeforeInService
{
  return self->_OOSMaxSecondsSinceCellSeenBeforeInService;
}

- (unint64_t)OOSMinSeenCountForSendingPrediction
{
  return self->_OOSMinSeenCountForSendingPrediction;
}

- (unint64_t)OOSMaxOOSAreasInDatabase
{
  return self->_OOSMaxOOSAreasInDatabase;
}

- (unint64_t)OOSTimeBetweenDatabaseMaintenance
{
  return self->_OOSTimeBetweenDatabaseMaintenance;
}

- (unint64_t)OOSAreasDatabaseTimeToLive
{
  return self->_OOSAreasDatabaseTimeToLive;
}

- (unint64_t)CellCoverageTileMinNumberOfObservations
{
  return self->_CellCoverageTileMinNumberOfObservations;
}

- (unint64_t)CrowdsourcedOOSRateDiffThreshold
{
  return self->_CrowdsourcedOOSRateDiffThreshold;
}

- (unint64_t)CrowdsourcedMaxCountDiffPercentThreshold
{
  return self->_CrowdsourcedMaxCountDiffPercentThreshold;
}

- (unint64_t)CrowdsourcedMinDistanceChangedWhileOOSThreshold
{
  return self->_CrowdsourcedMinDistanceChangedWhileOOSThreshold;
}

- (BOOL)disableVisitChecking
{
  return self->_disableVisitChecking;
}

- (unint64_t)LocationHorizontalAccuracyThreshold
{
  return self->_LocationHorizontalAccuracyThreshold;
}

- (float)sendOnDevicePredictionLikelihood
{
  return self->_sendOnDevicePredictionLikelihood;
}

- (float)selectPredictedCellBasedOnSeenCountLikelihood
{
  return self->_selectPredictedCellBasedOnSeenCountLikelihood;
}

- (float)sendCrowdsourcedPredictionLikelihood
{
  return self->_sendCrowdsourcedPredictionLikelihood;
}

- (unint64_t)onDeviceDurationPredictionPercentile
{
  return self->_onDeviceDurationPredictionPercentile;
}

- (unint64_t)coreLocationDistanceFilter
{
  return self->_coreLocationDistanceFilter;
}

- (NSArray)crowdsourcedDisabledCountries
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (unint64_t)congestionMaxAreasInDatabase
{
  return self->_congestionMaxAreasInDatabase;
}

- (BOOL)disableCrowdsourcedLearnings
{
  return self->_disableCrowdsourcedLearnings;
}

- (unint64_t)minPredictedDurationSeconds
{
  return self->_minPredictedDurationSeconds;
}

- (BOOL)enableCongestionPredictions
{
  return self->_enableCongestionPredictions;
}

- (NSArray)congestionPredictionEnabledCountries
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (unint64_t)congestionOccurrencesInDatabase
{
  return self->_congestionOccurrencesInDatabase;
}

- (unint64_t)congestionGoodCellsInDatabase
{
  return self->_congestionGoodCellsInDatabase;
}

- (unint64_t)congestionMinSeenCountForSendingPrediction
{
  return self->_congestionMinSeenCountForSendingPrediction;
}

- (unint64_t)congestionTimeOfDayWindowBackMinutes
{
  return self->_congestionTimeOfDayWindowBackMinutes;
}

- (unint64_t)congestionTimeOfDayWindowForwardMinutes
{
  return self->_congestionTimeOfDayWindowForwardMinutes;
}

- (BOOL)FMTSEnableTimeSeriesPredictions
{
  return self->_FMTSEnableTimeSeriesPredictions;
}

- (unint64_t)FMTSWindowSizeInDatabaseSeconds
{
  return self->_FMTSWindowSizeInDatabaseSeconds;
}

- (unint64_t)FMTSWindowSizeMaxTimeUntilPredictedAnomalySeconds
{
  return self->_FMTSWindowSizeMaxTimeUntilPredictedAnomalySeconds;
}

- (unint64_t)FMTSAnomaliesInDatabase
{
  return self->_FMTSAnomaliesInDatabase;
}

- (unint64_t)FMTSAnomalyPredictionAdvanceTimeSeconds
{
  return self->_FMTSAnomalyPredictionAdvanceTimeSeconds;
}

- (double)FMTSAnomalyUsedForPredictionDistanceThreshold
{
  return self->_FMTSAnomalyUsedForPredictionDistanceThreshold;
}

- (double)FMTSTimeDistanceWeight
{
  return self->_FMTSTimeDistanceWeight;
}

- (int)FMTSTimeDistanceMaxTime
{
  return self->_FMTSTimeDistanceMaxTime;
}

- (double)FMTSEventTypeWeightCellChange
{
  return self->_FMTSEventTypeWeightCellChange;
}

- (double)FMTSEventTypeWeightSignalStrengthChange
{
  return self->_FMTSEventTypeWeightSignalStrengthChange;
}

- (double)FMTSEventTypeWeightVisitStart
{
  return self->_FMTSEventTypeWeightVisitStart;
}

- (double)FMTSEventTypeWeightVisitEnd
{
  return self->_FMTSEventTypeWeightVisitEnd;
}

- (double)FMTSCellChangeCrossDistance
{
  return self->_FMTSCellChangeCrossDistance;
}

- (double)FMTSSignalStrengthChangeSameDirectionDistance
{
  return self->_FMTSSignalStrengthChangeSameDirectionDistance;
}

- (unint64_t)FMTSAnomalyPredictionDurationConfidenceRangeSeconds
{
  return self->_FMTSAnomalyPredictionDurationConfidenceRangeSeconds;
}

- (unint64_t)FMTSAnomalyPredictionTimeToAnomalyConfidenceRangeSeconds
{
  return self->_FMTSAnomalyPredictionTimeToAnomalyConfidenceRangeSeconds;
}

- (double)FMTSAnomalyBaseConfidence
{
  return self->_FMTSAnomalyBaseConfidence;
}

- (unint64_t)FMTSAnomalyConfidenceMinPredictionCount
{
  return self->_FMTSAnomalyConfidenceMinPredictionCount;
}

- (unint64_t)FMTSAnomalyPredictionMinNumObservedEvents
{
  return self->_FMTSAnomalyPredictionMinNumObservedEvents;
}

- (unint64_t)FMTSPredictionMinTimeBetweenPredictionsSeconds
{
  return self->_FMTSPredictionMinTimeBetweenPredictionsSeconds;
}

- (unint64_t)FMTSAnomalyStoringMinNumObservedEvents
{
  return self->_FMTSAnomalyStoringMinNumObservedEvents;
}

- (NSDictionary)configAsDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configAsDict, 0);
  objc_storeStrong((id *)&self->_congestionPredictionEnabledCountries, 0);

  objc_storeStrong((id *)&self->_crowdsourcedDisabledCountries, 0);
}

@end