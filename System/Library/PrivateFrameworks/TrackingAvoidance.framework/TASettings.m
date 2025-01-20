@interface TASettings
+ (id)convertEnabledLoiTypesValueContentToNSNumberType:(id)a3;
+ (id)getArraySettingsKeys;
+ (id)getBooleanSettingsKeys;
+ (id)getDoubleSettingsKeys;
+ (id)getIntegerSettingsKeys;
+ (id)getStringSettingsKeys;
+ (id)getUnsignedIntegerSettingsKeys;
- (BOOL)aisFetchEnabled;
- (BOOL)peopleDensityEnabled;
- (BOOL)trackingAvoidanceEnabled;
- (TAAnalyticsManagerSettings)analyticsManagerSettings;
- (TADeviceRecordSettings)deviceRecordSettings;
- (TAEventBufferSettings)eventBufferSettings;
- (TAFilterGeneralSettings)filterGeneralSettings;
- (TAFilterLeavingLOISettings)filterLeavingLOISettings;
- (TAFilterSingleVisitSettings)filterSingleVisitSettings;
- (TAFilterVisitsSettings)filterVisitsSettings;
- (TAPersistenceManagerSettings)persistenceManagerSettings;
- (TAScanRequestSettings)scanRequestSettings;
- (TASettings)init;
- (TASettings)initWithSettings:(id)a3;
- (TATrackingAvoidanceServiceSettings)serviceSettings;
- (TAVisitStateSettings)visitStateSettings;
- (double)persistenceInterval;
- (id)description;
- (unint64_t)maximumDailyScans;
- (unint64_t)notificationThrottleHours;
- (unint64_t)notificationThrottleMaxPerPeriod;
- (unint64_t)settingsVersion;
- (void)description;
- (void)setAisFetchEnabled:(BOOL)a3;
- (void)setAnalyticsManagerSettings:(id)a3;
- (void)setDeviceRecordSettings:(id)a3;
- (void)setEventBufferSettings:(id)a3;
- (void)setFilterGeneralSettings:(id)a3;
- (void)setFilterLeavingLOISettings:(id)a3;
- (void)setFilterSingleVisitSettings:(id)a3;
- (void)setFilterVisitsSettings:(id)a3;
- (void)setMaximumDailyScans:(unint64_t)a3;
- (void)setNotificationThrottleHours:(unint64_t)a3;
- (void)setNotificationThrottleMaxPerPeriod:(unint64_t)a3;
- (void)setPeopleDensityEnabled:(BOOL)a3;
- (void)setPersistenceInterval:(double)a3;
- (void)setPersistenceManagerSettings:(id)a3;
- (void)setScanRequestSettings:(id)a3;
- (void)setServiceSettings:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSettingsVersion:(unint64_t)a3;
- (void)setTrackingAvoidanceEnabled:(BOOL)a3;
- (void)setVisitStateSettings:(id)a3;
@end

@implementation TASettings

- (TAFilterVisitsSettings)filterVisitsSettings
{
  return self->_filterVisitsSettings;
}

- (TAFilterSingleVisitSettings)filterSingleVisitSettings
{
  return self->_filterSingleVisitSettings;
}

- (TASettings)init
{
  return [(TASettings *)self initWithSettings:MEMORY[0x263EFFA78]];
}

- (TASettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TASettings;
  v5 = [(TASettings *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(TASettings *)v5 setSettings:v4];
    v7 = v6;
  }

  return v6;
}

- (void)setSettings:(id)a3
{
  id v141 = a3;
  v3 = [v141 objectForKeyedSubscript:@"TAEnable"];
  v119 = v3;
  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }
  self->_trackingAvoidanceEnabled = v4;
  v5 = [v141 objectForKeyedSubscript:@"TAEnablePD"];
  v118 = v5;
  if (v5) {
    LOBYTE(v5) = [v5 BOOLValue];
  }
  self->_peopleDensityEnabled = (char)v5;
  v6 = [v141 objectForKeyedSubscript:@"TAScanMaxDailyRequests"];
  v117 = v6;
  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 50;
  }
  self->_maximumDailyScans = v7;
  v8 = [v141 objectForKeyedSubscript:@"TANotificationThrottleHours"];
  v116 = v8;
  if (v8) {
    unint64_t v9 = [v8 unsignedIntegerValue];
  }
  else {
    unint64_t v9 = 24;
  }
  self->_notificationThrottleHours = v9;
  v10 = [v141 objectForKeyedSubscript:@"TANotificationThrottleMax"];
  v115 = v10;
  if (v10) {
    unint64_t v11 = [v10 unsignedIntegerValue];
  }
  else {
    unint64_t v11 = -1;
  }
  self->_notificationThrottleMaxPerPeriod = v11;
  v12 = [v141 objectForKeyedSubscript:@"TAPersistenceInterval"];
  v114 = v12;
  if (v12) {
    [v12 doubleValue];
  }
  else {
    double v13 = 3600.0;
  }
  self->_persistenceInterval = v13;
  v14 = [v141 objectForKeyedSubscript:@"TASettingsVersion"];
  v113 = v14;
  if (v14) {
    unsigned int v15 = [v14 unsignedIntValue];
  }
  else {
    unsigned int v15 = 1;
  }
  self->_settingsVersion = v15;
  v16 = [v141 objectForKeyedSubscript:@"TAAISFetchEnable"];
  v112 = v16;
  if (v16) {
    char v17 = [v16 BOOLValue];
  }
  else {
    char v17 = 1;
  }
  self->_aisFetchEnabled = v17;
  v18 = [TAFilterGeneralSettings alloc];
  v138 = [v141 objectForKeyedSubscript:@"TAFilterGeneralDurationOfConsideration"];
  v136 = [v141 objectForKeyedSubscript:@"TAFilterGeneralThresholdOfLocationRelevance"];
  v134 = [v141 objectForKeyedSubscript:@"TAFilterGeneralThresholdOfSignificantDuration"];
  v131 = [v141 objectForKeyedSubscript:@"TAFilterGeneralThresholdOfSignificantDistance"];
  v128 = [v141 objectForKeyedSubscript:@"TAFilterGeneralCapOfReasonableWalkingSpeed"];
  v125 = [v141 objectForKeyedSubscript:@"TAFilterGeneralAllowNavGeoAsPrivateVehicleHint"];
  v19 = [v141 objectForKeyedSubscript:@"TAFilterGeneralVehicularImmediacyType"];
  v20 = [v141 objectForKeyedSubscript:@"TAFilterGeneralBeepOnMoveVehicularImmediacyType"];
  v21 = [v141 objectForKeyedSubscript:@"TAFilterGeneralBeepOnMovePedestrianImmediacyType"];
  v22 = [v141 objectForKeyedSubscript:@"TAFilterGeneralNextPLOIVehicularImmediacyType"];
  v122 = [v141 objectForKeyedSubscript:@"TAFilterGeneralNextPLOIPedestrianImmediacyType"];
  v23 = [v141 objectForKeyedSubscript:@"TAFilterGeneralNextBeepOnMoveConsiderationTimeInterval"];
  v24 = [(TAFilterGeneralSettings *)v18 initWithDurationOfConsiderationOrDefault:v138 thresholdOfLocationRelevanceOrDefault:v136 thresholdOfSignificantDurationOrDefault:v134 thresholdOfSignificantDistanceOrDefault:v131 capOfReasonableWalkingSpeedOrDefault:v128 allowNavGeoHintAsPrivateVehicleHintOrDefault:v125 vehicularImmediacyTypeOrDefault:v19 beepOnMoveVehicularImmediacyTypeOrDefault:v20 beepOnMovePedestrianImmediacyTypeOrDefault:v21 nextPLOIVehicularImmediacyTypeOrDefault:v22 nextPLOIPedestrianImmediacyTypeOrDefault:v122 beepOnMoveConsiderationTimeIntervalOrDefault:v23];
  filterGeneralSettings = self->_filterGeneralSettings;
  self->_filterGeneralSettings = v24;

  v111 = [v141 objectForKeyedSubscript:@"TAFilterVisitsEnabledLoiTypes"];
  v139 = +[TASettings convertEnabledLoiTypesValueContentToNSNumberType:v111];
  v26 = [TAFilterVisitsSettings alloc];
  v27 = [v141 objectForKeyedSubscript:@"TAFilterVisitsMaxDuration"];
  v28 = [v141 objectForKeyedSubscript:@"TAFilterVisitsMinInterVisitDistance"];
  v29 = [v141 objectForKeyedSubscript:@"TAFilterVisitsMinNSigma"];
  v30 = [v141 objectForKeyedSubscript:@"TAFilterVisitsEntryDisplayOnBudget"];
  v31 = [v141 objectForKeyedSubscript:@"TAFilterVisitsExitDisplayOnBudget"];
  v32 = [v141 objectForKeyedSubscript:@"TAFilterVisitsMinObservationInterval"];
  v33 = [v141 objectForKeyedSubscript:@"TAFilterVisitsThreeVisitImmediacyTypeKey"];
  v34 = [(TAFilterVisitsSettings *)v26 initWithMaxSuspiciousDurationOrDefault:v27 minInterVisitDistanceOrDefault:v28 minNSigmaBetweenVisitsOrDefault:v29 entryDisplayOnBudgetOrDefault:v30 exitDisplayOnBudgetOrDefault:v31 sensitiveLOITypesOrDefault:v139 minObservationIntervalOrDefault:v32 threeVisitImmediacyTypeOrDefault:v33];
  filterVisitsSettings = self->_filterVisitsSettings;
  self->_filterVisitsSettings = v34;

  v110 = [v141 objectForKeyedSubscript:@"TAFilterSingleVisitEnabledLoiTypes"];
  v137 = +[TASettings convertEnabledLoiTypesValueContentToNSNumberType:v110];
  v36 = [TAFilterSingleVisitSettings alloc];
  v37 = [v141 objectForKeyedSubscript:@"TAFilterSingleVisitThresholdOfSignificantDuration"];
  v38 = [v141 objectForKeyedSubscript:@"TAFilterSingleVisitThresholdOfSignificantDistance"];
  v39 = self->_filterVisitsSettings;
  v40 = [v141 objectForKeyedSubscript:@"TAFilterArrivingWorkImmediacyType"];
  v41 = [(TAFilterSingleVisitSettings *)v36 initWithThresholdOfSignificantDurationOrDefault:v37 thresholdOfSignificantDistanceOrDefault:v38 filterVisitsSettingsOrDefault:v39 enabledLoiTypesOrDefault:v137 arrivingWorkImmediacyTypeOrDefault:v40];
  filterSingleVisitSettings = self->_filterSingleVisitSettings;
  self->_filterSingleVisitSettings = v41;

  v109 = [v141 objectForKeyedSubscript:@"TAFilterLeavingLOIEnabledLoiTypes"];
  v135 = +[TASettings convertEnabledLoiTypesValueContentToNSNumberType:v109];
  v43 = [TAFilterLeavingLOISettings alloc];
  v44 = [v141 objectForKeyedSubscript:@"TAFilterLeavingLOIThresholdOfSignificantDuration"];
  v45 = [v141 objectForKeyedSubscript:@"TAFilterLeavingLOIThresholdOfSignificantDistance"];
  v46 = self->_filterVisitsSettings;
  v47 = [v141 objectForKeyedSubscript:@"TAFilterLeavingHomeImmediacyType"];
  v48 = [v141 objectForKeyedSubscript:@"TAFilterLeavingWorkImmediacyType"];
  v49 = [(TAFilterLeavingLOISettings *)v43 initWithThresholdOfSignificantDurationOrDefault:v44 thresholdOfSignificantDistanceOrDefault:v45 filterVisitsSettingsOrDefault:v46 enabledLoiTypesOrDefault:v135 leavingHomeImmediacyTypeOrDefault:v47 leavingWorkImmediacyTypeOrDefault:v48];
  filterLeavingLOISettings = self->_filterLeavingLOISettings;
  self->_filterLeavingLOISettings = v49;

  v51 = [TAEventBufferSettings alloc];
  v52 = [v141 objectForKeyedSubscript:@"TAEventBufferCapacity"];
  v53 = [v141 objectForKeyedSubscript:@"TAEventBufferTimeIntervalOfRetention"];
  v54 = [(TAEventBufferSettings *)v51 initWithBufferCapacityOrDefault:v52 bufferTimeIntervalOfRetentionOrDefault:v53];
  eventBufferSettings = self->_eventBufferSettings;
  self->_eventBufferSettings = v54;

  v56 = [TAVisitStateSettings alloc];
  v132 = [v141 objectForKeyedSubscript:@"TAVisitStateVisitSnapshotCapacity"];
  v57 = [v141 objectForKeyedSubscript:@"TAVisitStateVisitDisplayBufferCapacity"];
  v129 = [v141 objectForKeyedSubscript:@"TAVisitStateInterVisitMetricSnapshotCapacity"];
  v126 = [v141 objectForKeyedSubscript:@"TAVisitStateInterVisitSnapshotUpdateInterval"];
  id v58 = objc_alloc(NSNumber);
  [(TAFilterGeneralSettings *)self->_filterGeneralSettings thresholdOfLocationRelevance];
  v123 = objc_msgSend(v58, "initWithDouble:");
  v120 = [v141 objectForKeyedSubscript:@"TAVisitStateSnapshotBufferTimeIntervalOfRetention"];
  v59 = [v141 objectForKeyedSubscript:@"TAVisitStateLoiBufferPerTypeCapacity"];
  v60 = [v141 objectForKeyedSubscript:@"TAVisitStateLoiBufferTimeIntervalOfRetention"];
  v61 = [v141 objectForKeyedSubscript:@"TAVisitStateMaxNSigma"];
  v62 = [v141 objectForKeyedSubscript:@"TAVisitStateQualitySnapshotDwellDuration"];
  v63 = [v141 objectForKeyedSubscript:@"TAVisitStateQualitySnapshotDisplayOnDuration"];
  v64 = [v141 objectForKeyedSubscript:@"TAVisitStateUniqueUTObservationCapPerVisit"];
  v65 = [(TAVisitStateSettings *)v56 initWithVisitSnapshotCapacityOrDefault:v132 visitDisplayBufferCapacityOrDefault:v57 interVisitMetricSnapshotCapacityOrDefault:v129 interVisitSnapshotUpdateIntervalOrDefault:v126 thresholdOfLocationRelevanceOrDefault:v123 snapshotBufferTimeIntervalOfRetentionOrDefault:v120 loiBufferPerTypeCapacityOrDefault:v59 loiBufferTimeIntervalOfRetentionOrDefault:v60 maxNSigmaBetweenLastLocationAndVisitOrDefault:v61 qualitySnapshotDwellDurationOrDefault:v62 qualitySnapshotDisplayOnDurationOrDefault:v63 uniqueUTObservationCapPerVisitOrDefault:v64 sensitiveLOITypesOrDefault:v139];
  visitStateSettings = self->_visitStateSettings;
  self->_visitStateSettings = v65;

  v67 = [TADeviceRecordSettings alloc];
  v133 = [v141 objectForKeyedSubscript:@"TADeviceRecordExpiryTimeInterval"];
  v130 = [v141 objectForKeyedSubscript:@"TADeviceRecordPurgeTimeInterval"];
  v127 = [v141 objectForKeyedSubscript:@"TADeviceRecordKeepAliveInterval"];
  v108 = [v141 objectForKeyedSubscript:@"TADeviceRecordMinimumStagingInterval"];
  v107 = [v141 objectForKeyedSubscript:@"TADeviceRecordStagingBackstopHour"];
  v106 = [v141 objectForKeyedSubscript:@"TADeviceRecordAssumedKeyRollHour"];
  v68 = [v141 objectForKeyedSubscript:@"TADeviceRecordScanInterval"];
  v124 = [v141 objectForKeyedSubscript:@"TADeviceRecordSurfaceImmediatelyBeepOnMove"];
  v121 = [v141 objectForKeyedSubscript:@"TADeviceRecordsurfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"];
  v105 = [v141 objectForKeyedSubscript:@"TADeviceRecordMaxExpectedHELEWildInterval"];
  v104 = [v141 objectForKeyedSubscript:@"TADeviceRecordMaxExpectedDurianWildInterval"];
  v69 = [v141 objectForKeyedSubscript:@"TADeviceRecordShouldAlertHELEImmediatelyForImmediateTypes"];
  v103 = [v141 objectForKeyedSubscript:@"TADeviceRecordMinimumHELEStagingInterval"];
  v102 = [v141 objectForKeyedSubscript:@"TADeviceRecordStagingHELEBackstopHour"];
  v101 = [v141 objectForKeyedSubscript:@"TADeviceRecordsurfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"];
  v100 = [v141 objectForKeyedSubscript:@"TADeviceRecordHyperHELEStagingInterval"];
  v70 = [v141 objectForKeyedSubscript:@"TADeviceRecordHyperStagingInterval"];
  v71 = -[TADeviceRecordSettings initWithExpiryTimeIntervalOrDefault:purgeTimeIntervalOrDefault:keepAliveIntervalOrDefault:minimumStagingIntervalOrDefault:stagingBackstopHourOrDefault:assumedKeyRollHourOrDefault:scanIntervalOrDefault:surfaceImmediatelyBeepOnMoveOrDefault:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:maxExpectedHELEWildIntervalOrDefault:maxExpectedDurianWildIntervalOrDefault:shouldAlertHELEImmediatelyForImmediateTypesOrDefault:minimumHELEStagingIntervalOrDefault:stagingHELEBackstopHourOrDefault:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:hyperHELEStagingIntervalOrDefault:hyperStagingIntervalOrDefault:](v67, "initWithExpiryTimeIntervalOrDefault:purgeTimeIntervalOrDefault:keepAliveIntervalOrDefault:minimumStagingIntervalOrDefault:stagingBackstopHourOrDefault:assumedKeyRollHourOrDefault:scanIntervalOrDefault:surfaceImmediatelyBeepOnMoveOrDefault:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:maxExpectedHELEWildIntervalOrDefault:maxExpectedDurianWildIntervalOrDefault:shouldAlertHELEImmediatelyForImmediateTypesOrDefault:minimumHELEStagingIntervalOrDefault:stagingHELEBackstopHourOrDefault:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:hyperHELEStagingIntervalOrDefault:hyperStagingIntervalOrDefault:", v133, v130, v127, v108, v107, v106, v68, v124, v121, v105, v104, v69,
          v103,
          v102,
          v101,
          v100,
          v70);
  deviceRecordSettings = self->_deviceRecordSettings;
  self->_deviceRecordSettings = v71;

  v73 = [TAScanRequestSettings alloc];
  v74 = [v141 objectForKeyedSubscript:@"TAScanMinVisitEntryDisplayOnDuration"];
  v75 = [v141 objectForKeyedSubscript:@"TAScanMinInterVisitDisplayOnDuration"];
  v76 = [v141 objectForKeyedSubscript:@"TAScanInterVisitDelay"];
  v77 = [v141 objectForKeyedSubscript:@"TAScanMaxInterVisitRequests"];
  v78 = [(TAScanRequestSettings *)v73 initWithMinVisitEntryDisplayOnDurationOrDefault:v74 minInterVisitDisplayOnDurationOrDefault:v75 interVisitScanDelayOrDefault:v76 maxInterVisitScanRequestsOrDefault:v77];
  scanRequestSettings = self->_scanRequestSettings;
  self->_scanRequestSettings = v78;

  v80 = [TATrackingAvoidanceServiceSettings alloc];
  v81 = [v141 objectForKeyedSubscript:@"TAServiceEnableTAFilterGeneral"];
  v82 = [v141 objectForKeyedSubscript:@"TAServiceEnableTAFilterVisits"];
  v83 = [v141 objectForKeyedSubscript:@"TAServiceEnableTAFilterSingleVisit"];
  v84 = [v141 objectForKeyedSubscript:@"TAServiceEnableTAFilterLeavingLOI"];
  v85 = [v141 objectForKeyedSubscript:@"TAServiceClassificationTimeInterval"];
  v86 = [(TATrackingAvoidanceServiceSettings *)v80 initWithEnableTAFilterGeneralOrDefault:v81 enableTAFilterVisitsOrDefault:v82 enableTAFilterSingleVisitOrDefault:v83 enableTAFilterLeavingLOIOrDefault:v84 classificationTimeIntervalOrDefault:v85];
  serviceSettings = self->_serviceSettings;
  self->_serviceSettings = v86;

  v88 = [TAAnalyticsManagerSettings alloc];
  v89 = [v141 objectForKeyedSubscript:@"TAAnalyticsManagerEnableSubmission"];
  v90 = [(TAAnalyticsManagerSettings *)v88 initWithEnableSubmissionOrDefault:v89 andSettingsVersion:self->_settingsVersion];
  analyticsManagerSettings = self->_analyticsManagerSettings;
  self->_analyticsManagerSettings = v90;

  v92 = [v141 objectForKeyedSubscript:@"TAPersistenceDirectory"];
  if (v92)
  {
    v93 = NSURL;
    v94 = [v141 objectForKeyedSubscript:@"TAPersistenceDirectory"];
    v95 = [v93 fileURLWithPath:v94];
  }
  else
  {
    v95 = 0;
  }

  v96 = [TAPersistenceManagerSettings alloc];
  v97 = [v141 objectForKeyedSubscript:@"TAPersistenceStoreFileName"];
  v98 = [(TAPersistenceManagerSettings *)v96 initWithDirectoryURLOrDefault:v95 storeFileNameOrDefault:v97];
  persistenceManagerSettings = self->_persistenceManagerSettings;
  self->_persistenceManagerSettings = v98;
}

+ (id)convertEnabledLoiTypesValueContentToNSNumberType:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    char v4 = [MEMORY[0x263EFF9C0] set];
  }
  else
  {
    char v4 = 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v5 setNumberStyle:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v11 = (void *)[v10 copy];
          [v4 addObject:v11];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          unint64_t v11 = objc_msgSend(v5, "numberFromString:", v10, (void)v13);
          if (v11) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)getBooleanSettingsKeys
{
  v4[13] = *MEMORY[0x263EF8340];
  v4[0] = @"TAEnable";
  v4[1] = @"TAEnablePD";
  v4[2] = @"TAFilterGeneralAllowNavGeoAsPrivateVehicleHint";
  v4[3] = @"TAServiceEnableTAFilterGeneral";
  v4[4] = @"TAServiceEnableTAFilterVisits";
  v4[5] = @"TAServiceEnableTAFilterSingleVisit";
  v4[6] = @"TAServiceEnableTAFilterLeavingLOI";
  v4[7] = @"TAAnalyticsManagerEnableSubmission";
  v4[8] = @"TADeviceRecordSurfaceImmediatelyBeepOnMove";
  v4[9] = @"TADeviceRecordShouldAlertHELEImmediatelyForImmediateTypes";
  v4[10] = @"TAAISFetchEnable";
  v4[11] = @"TADeviceRecordsurfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll";
  v4[12] = @"TADeviceRecordsurfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:13];
  return v2;
}

+ (id)getIntegerSettingsKeys
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)getUnsignedIntegerSettingsKeys
{
  v4[26] = *MEMORY[0x263EF8340];
  v4[0] = @"TAEventBufferCapacity";
  v4[1] = @"TAVisitStateVisitSnapshotCapacity";
  v4[2] = @"TAVisitStateInterVisitMetricSnapshotCapacity";
  v4[3] = @"TAFilterVisitsMinNSigma";
  v4[4] = @"TAVisitStateMaxNSigma";
  v4[5] = @"TAVisitStateLoiBufferPerTypeCapacity";
  v4[6] = @"TAVisitStateVisitDisplayBufferCapacity";
  v4[7] = @"TAVisitStateUniqueUTObservationCapPerVisit";
  v4[8] = @"TAScanMaxInterVisitRequests";
  v4[9] = @"TAScanMaxDailyRequests";
  v4[10] = @"TANotificationThrottleHours";
  v4[11] = @"TANotificationThrottleMax";
  v4[12] = @"TADeviceRecordStagingBackstopHour";
  v4[13] = @"TADeviceRecordAssumedKeyRollHour";
  void v4[14] = @"TADeviceRecordStagingHELEBackstopHour";
  v4[15] = @"TAFilterGeneralVehicularImmediacyType";
  v4[16] = @"TASettingsVersion";
  v4[17] = @"TAFilterLeavingHomeImmediacyType";
  v4[18] = @"TAFilterLeavingWorkImmediacyType";
  v4[19] = @"TAFilterArrivingWorkImmediacyType";
  v4[20] = @"TAFilterGeneralBeepOnMoveVehicularImmediacyType";
  v4[21] = @"TAFilterGeneralBeepOnMovePedestrianImmediacyType";
  v4[22] = @"TAFilterGeneralNextPLOIVehicularImmediacyType";
  v4[23] = @"TAFilterGeneralNextPLOIPedestrianImmediacyType";
  v4[24] = @"TAFilterVisitsThreeVisitImmediacyTypeKey";
  v4[25] = @"TAFilterGeneralNextBeepOnMoveConsiderationTimeInterval";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:26];
  return v2;
}

+ (id)getDoubleSettingsKeys
{
  v4[35] = *MEMORY[0x263EF8340];
  v4[0] = @"TAFilterGeneralDurationOfConsideration";
  v4[1] = @"TAFilterGeneralThresholdOfLocationRelevance";
  v4[2] = @"TAFilterGeneralThresholdOfSignificantDuration";
  v4[3] = @"TAFilterGeneralThresholdOfSignificantDistance";
  v4[4] = @"TAFilterGeneralCapOfReasonableWalkingSpeed";
  v4[5] = @"TAFilterSingleVisitThresholdOfSignificantDistance";
  v4[6] = @"TAFilterSingleVisitThresholdOfSignificantDuration";
  v4[7] = @"TAFilterLeavingLOIThresholdOfSignificantDistance";
  v4[8] = @"TAFilterLeavingLOIThresholdOfSignificantDuration";
  v4[9] = @"TAFilterVisitsMaxDuration";
  v4[10] = @"TAFilterVisitsMinInterVisitDistance";
  v4[11] = @"TAFilterVisitsEntryDisplayOnBudget";
  v4[12] = @"TAFilterVisitsExitDisplayOnBudget";
  v4[13] = @"TAFilterVisitsMinObservationInterval";
  void v4[14] = @"TAEventBufferTimeIntervalOfRetention";
  v4[15] = @"TAVisitStateInterVisitSnapshotUpdateInterval";
  v4[16] = @"TAVisitStateLoiBufferTimeIntervalOfRetention";
  v4[17] = @"TAVisitStateSnapshotBufferTimeIntervalOfRetention";
  v4[18] = @"TAVisitStateQualitySnapshotDwellDuration";
  v4[19] = @"TAVisitStateQualitySnapshotDisplayOnDuration";
  v4[20] = @"TADeviceRecordExpiryTimeInterval";
  v4[21] = @"TADeviceRecordPurgeTimeInterval";
  v4[22] = @"TADeviceRecordKeepAliveInterval";
  v4[23] = @"TADeviceRecordMinimumStagingInterval";
  v4[24] = @"TADeviceRecordScanInterval";
  v4[25] = @"TADeviceRecordMaxExpectedHELEWildInterval";
  v4[26] = @"TADeviceRecordMaxExpectedDurianWildInterval";
  void v4[27] = @"TADeviceRecordMinimumHELEStagingInterval";
  v4[28] = @"TAScanMinVisitEntryDisplayOnDuration";
  v4[29] = @"TAScanMinInterVisitDisplayOnDuration";
  v4[30] = @"TAScanInterVisitDelay";
  v4[31] = @"TAServiceClassificationTimeInterval";
  v4[32] = @"TAPersistenceInterval";
  v4[33] = @"TADeviceRecordHyperHELEStagingInterval";
  v4[34] = @"TADeviceRecordHyperStagingInterval";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:35];
  return v2;
}

+ (id)getStringSettingsKeys
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"TAPersistenceDirectory";
  v4[1] = @"TAPersistenceStoreFileName";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)getArraySettingsKeys
{
  void v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"TAFilterSingleVisitEnabledLoiTypes";
  v4[1] = @"TAFilterVisitsEnabledLoiTypes";
  v4[2] = @"TAFilterLeavingLOIEnabledLoiTypes";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)description
{
  v127[76] = *MEMORY[0x263EF8340];
  v126[0] = @"TAEnable";
  v123 = [NSNumber numberWithBool:self->_trackingAvoidanceEnabled];
  v127[0] = v123;
  v126[1] = @"TAEnablePD";
  v121 = [NSNumber numberWithBool:self->_peopleDensityEnabled];
  v127[1] = v121;
  v126[2] = @"TAEventBufferCapacity";
  v120 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAEventBufferSettings bufferCapacity](self->_eventBufferSettings, "bufferCapacity"));
  v127[2] = v120;
  v126[3] = @"TAEventBufferTimeIntervalOfRetention";
  id v3 = NSNumber;
  [(TAEventBufferSettings *)self->_eventBufferSettings bufferTimeIntervalOfRetention];
  v119 = objc_msgSend(v3, "numberWithDouble:");
  v127[3] = v119;
  v126[4] = @"TAVisitStateLoiBufferPerTypeCapacity";
  v118 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAVisitStateSettings loiBufferPerTypeCapacity](self->_visitStateSettings, "loiBufferPerTypeCapacity"));
  v127[4] = v118;
  v126[5] = @"TAVisitStateLoiBufferTimeIntervalOfRetention";
  char v4 = NSNumber;
  [(TAVisitStateSettings *)self->_visitStateSettings loiBufferTimeIntervalOfRetention];
  v117 = objc_msgSend(v4, "numberWithDouble:");
  v127[5] = v117;
  v126[6] = @"TAVisitStateVisitSnapshotCapacity";
  v116 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAVisitStateSettings visitSnapshotCapacity](self->_visitStateSettings, "visitSnapshotCapacity"));
  v127[6] = v116;
  v126[7] = @"TAVisitStateVisitDisplayBufferCapacity";
  v115 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAVisitStateSettings visitDisplayBufferCapacity](self->_visitStateSettings, "visitDisplayBufferCapacity"));
  v127[7] = v115;
  v126[8] = @"TAVisitStateInterVisitMetricSnapshotCapacity";
  v114 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAVisitStateSettings interVisitMetricSnapshotCapacity](self->_visitStateSettings, "interVisitMetricSnapshotCapacity"));
  v127[8] = v114;
  v126[9] = @"TAVisitStateInterVisitSnapshotUpdateInterval";
  id v5 = NSNumber;
  [(TAVisitStateSettings *)self->_visitStateSettings interVisitSnapshotUpdateInterval];
  v113 = objc_msgSend(v5, "numberWithDouble:");
  v127[9] = v113;
  v126[10] = @"TAVisitStateSnapshotBufferTimeIntervalOfRetention";
  id v6 = NSNumber;
  [(TAVisitStateSettings *)self->_visitStateSettings snapshotBufferTimeIntervalOfRetention];
  v112 = objc_msgSend(v6, "numberWithDouble:");
  v127[10] = v112;
  v126[11] = @"TAVisitStateMaxNSigma";
  v111 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAVisitStateSettings maxNSigmaBetweenLastLocationAndVisit](self->_visitStateSettings, "maxNSigmaBetweenLastLocationAndVisit"));
  v127[11] = v111;
  v126[12] = @"TAVisitStateQualitySnapshotDwellDuration";
  uint64_t v7 = NSNumber;
  [(TAVisitStateSettings *)self->_visitStateSettings qualitySnapshotDwellDuration];
  v110 = objc_msgSend(v7, "numberWithDouble:");
  v127[12] = v110;
  v126[13] = @"TAVisitStateQualitySnapshotDisplayOnDuration";
  uint64_t v8 = NSNumber;
  [(TAVisitStateSettings *)self->_visitStateSettings qualitySnapshotDisplayOnDuration];
  v109 = objc_msgSend(v8, "numberWithDouble:");
  v127[13] = v109;
  v126[14] = @"TAVisitStateUniqueUTObservationCapPerVisit";
  v108 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAVisitStateSettings uniqueUTObservationCapPerVisit](self->_visitStateSettings, "uniqueUTObservationCapPerVisit"));
  v127[14] = v108;
  v126[15] = @"TADeviceRecordExpiryTimeInterval";
  unint64_t v9 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings expiryTimeInterval];
  v107 = objc_msgSend(v9, "numberWithDouble:");
  v127[15] = v107;
  v126[16] = @"TADeviceRecordPurgeTimeInterval";
  v10 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings purgeTimeInterval];
  v106 = objc_msgSend(v10, "numberWithDouble:");
  v127[16] = v106;
  v126[17] = @"TADeviceRecordKeepAliveInterval";
  unint64_t v11 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings keepAliveInterval];
  v105 = objc_msgSend(v11, "numberWithDouble:");
  v127[17] = v105;
  v126[18] = @"TADeviceRecordMinimumStagingInterval";
  v12 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings minimumStagingInterval];
  v104 = objc_msgSend(v12, "numberWithDouble:");
  v127[18] = v104;
  v126[19] = @"TADeviceRecordStagingBackstopHour";
  v103 = objc_msgSend(NSNumber, "numberWithInteger:", -[TADeviceRecordSettings stagingBackstopHour](self->_deviceRecordSettings, "stagingBackstopHour"));
  v127[19] = v103;
  v126[20] = @"TADeviceRecordAssumedKeyRollHour";
  v102 = objc_msgSend(NSNumber, "numberWithInteger:", -[TADeviceRecordSettings assumedKeyRollHour](self->_deviceRecordSettings, "assumedKeyRollHour"));
  v127[20] = v102;
  v126[21] = @"TADeviceRecordScanInterval";
  long long v13 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings scanInterval];
  v101 = objc_msgSend(v13, "numberWithDouble:");
  v127[21] = v101;
  v126[22] = @"TADeviceRecordSurfaceImmediatelyBeepOnMove";
  v100 = objc_msgSend(NSNumber, "numberWithBool:", -[TADeviceRecordSettings surfaceImmediatelyBeepOnMove](self->_deviceRecordSettings, "surfaceImmediatelyBeepOnMove"));
  v127[22] = v100;
  v126[23] = @"TADeviceRecordsurfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll";
  v99 = objc_msgSend(NSNumber, "numberWithBool:", -[TADeviceRecordSettings surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll](self->_deviceRecordSettings, "surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"));
  v127[23] = v99;
  v126[24] = @"TADeviceRecordMaxExpectedHELEWildInterval";
  long long v14 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings maxExpectedHELEWildInterval];
  v98 = objc_msgSend(v14, "numberWithDouble:");
  v127[24] = v98;
  v126[25] = @"TADeviceRecordMaxExpectedDurianWildInterval";
  long long v15 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings maxExpectedDurianWildInterval];
  v97 = objc_msgSend(v15, "numberWithDouble:");
  v127[25] = v97;
  v126[26] = @"TADeviceRecordShouldAlertHELEImmediatelyForImmediateTypes";
  v96 = objc_msgSend(NSNumber, "numberWithBool:", -[TADeviceRecordSettings shouldAlertHELEImmediatelyForImmediateTypes](self->_deviceRecordSettings, "shouldAlertHELEImmediatelyForImmediateTypes"));
  v127[26] = v96;
  v126[27] = @"TADeviceRecordMinimumHELEStagingInterval";
  long long v16 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings minimumHELEStagingInterval];
  v95 = objc_msgSend(v16, "numberWithDouble:");
  v127[27] = v95;
  v126[28] = @"TADeviceRecordStagingHELEBackstopHour";
  v94 = objc_msgSend(NSNumber, "numberWithInteger:", -[TADeviceRecordSettings stagingHELEBackstopHour](self->_deviceRecordSettings, "stagingHELEBackstopHour"));
  v127[28] = v94;
  v126[29] = @"TADeviceRecordsurfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll";
  v93 = objc_msgSend(NSNumber, "numberWithBool:", -[TADeviceRecordSettings surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll](self->_deviceRecordSettings, "surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"));
  v127[29] = v93;
  v126[30] = @"TADeviceRecordHyperHELEStagingInterval";
  char v17 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings hyperHELEStagingInterval];
  v92 = objc_msgSend(v17, "numberWithDouble:");
  v127[30] = v92;
  v126[31] = @"TADeviceRecordHyperStagingInterval";
  uint64_t v18 = NSNumber;
  [(TADeviceRecordSettings *)self->_deviceRecordSettings hyperStagingInterval];
  v91 = objc_msgSend(v18, "numberWithDouble:");
  v127[31] = v91;
  v126[32] = @"TAFilterGeneralThresholdOfSignificantDuration";
  v19 = NSNumber;
  [(TAFilterGeneralSettings *)self->_filterGeneralSettings thresholdOfSignificantDuration];
  v90 = objc_msgSend(v19, "numberWithDouble:");
  v127[32] = v90;
  v126[33] = @"TAFilterGeneralThresholdOfSignificantDistance";
  v20 = NSNumber;
  [(TAFilterGeneralSettings *)self->_filterGeneralSettings thresholdOfSignificantDistance];
  v89 = objc_msgSend(v20, "numberWithDouble:");
  v127[33] = v89;
  v126[34] = @"TAFilterGeneralThresholdOfLocationRelevance";
  v21 = NSNumber;
  [(TAFilterGeneralSettings *)self->_filterGeneralSettings thresholdOfLocationRelevance];
  v88 = objc_msgSend(v21, "numberWithDouble:");
  v127[34] = v88;
  v126[35] = @"TAFilterGeneralDurationOfConsideration";
  v22 = NSNumber;
  [(TAFilterGeneralSettings *)self->_filterGeneralSettings durationOfConsideration];
  v87 = objc_msgSend(v22, "numberWithDouble:");
  v127[35] = v87;
  v126[36] = @"TAFilterGeneralCapOfReasonableWalkingSpeed";
  v23 = NSNumber;
  [(TAFilterGeneralSettings *)self->_filterGeneralSettings capOfReasonableWalkingSpeed];
  v86 = objc_msgSend(v23, "numberWithDouble:");
  v127[36] = v86;
  v126[37] = @"TAFilterGeneralNextBeepOnMoveConsiderationTimeInterval";
  v85 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterGeneralSettings beepOnMoveConsiderationTimeInterval](self->_filterGeneralSettings, "beepOnMoveConsiderationTimeInterval"));
  v127[37] = v85;
  v126[38] = @"TAFilterVisitsMinInterVisitDistance";
  v24 = NSNumber;
  [(TAFilterVisitsSettings *)self->_filterVisitsSettings minInterVisitDistance];
  v84 = objc_msgSend(v24, "numberWithDouble:");
  v127[38] = v84;
  v126[39] = @"TAFilterVisitsMaxDuration";
  v25 = NSNumber;
  [(TAFilterVisitsSettings *)self->_filterVisitsSettings maxSuspiciousDuration];
  v83 = objc_msgSend(v25, "numberWithDouble:");
  v127[39] = v83;
  v126[40] = @"TAFilterVisitsMinNSigma";
  v82 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterVisitsSettings minNSigmaBetweenVisits](self->_filterVisitsSettings, "minNSigmaBetweenVisits"));
  v127[40] = v82;
  v126[41] = @"TAFilterVisitsEntryDisplayOnBudget";
  v26 = NSNumber;
  [(TAFilterVisitsSettings *)self->_filterVisitsSettings entryDisplayOnBudget];
  v81 = objc_msgSend(v26, "numberWithDouble:");
  v127[41] = v81;
  v126[42] = @"TAFilterVisitsExitDisplayOnBudget";
  v27 = NSNumber;
  [(TAFilterVisitsSettings *)self->_filterVisitsSettings exitDisplayOnBudget];
  v80 = objc_msgSend(v27, "numberWithDouble:");
  v127[42] = v80;
  v126[43] = @"TAFilterVisitsMinObservationInterval";
  v28 = NSNumber;
  [(TAFilterVisitsSettings *)self->_filterVisitsSettings minObservationInterval];
  v79 = objc_msgSend(v28, "numberWithDouble:");
  v127[43] = v79;
  v126[44] = @"TAFilterVisitsThreeVisitImmediacyTypeKey";
  v78 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterVisitsSettings threeVisitImmediacyType](self->_filterVisitsSettings, "threeVisitImmediacyType"));
  v127[44] = v78;
  v126[45] = @"TAScanMinVisitEntryDisplayOnDuration";
  v29 = NSNumber;
  [(TAScanRequestSettings *)self->_scanRequestSettings minVisitEntryDisplayOnDuration];
  v77 = objc_msgSend(v29, "numberWithDouble:");
  v127[45] = v77;
  v126[46] = @"TAScanMinInterVisitDisplayOnDuration";
  v30 = NSNumber;
  [(TAScanRequestSettings *)self->_scanRequestSettings minInterVisitDisplayOnDuration];
  v76 = objc_msgSend(v30, "numberWithDouble:");
  v127[46] = v76;
  v126[47] = @"TAScanInterVisitDelay";
  v31 = NSNumber;
  [(TAScanRequestSettings *)self->_scanRequestSettings interVisitScanDelay];
  v75 = objc_msgSend(v31, "numberWithDouble:");
  v127[47] = v75;
  v126[48] = @"TAScanMaxInterVisitRequests";
  v74 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAScanRequestSettings maxInterVisitScanRequests](self->_scanRequestSettings, "maxInterVisitScanRequests"));
  v127[48] = v74;
  v126[49] = @"TAFilterSingleVisitThresholdOfSignificantDuration";
  v32 = NSNumber;
  [(TAFilterSingleVisitSettings *)self->_filterSingleVisitSettings thresholdOfSignificantDuration];
  v73 = objc_msgSend(v32, "numberWithDouble:");
  v127[49] = v73;
  v126[50] = @"TAFilterSingleVisitThresholdOfSignificantDistance";
  v33 = NSNumber;
  [(TAFilterSingleVisitSettings *)self->_filterSingleVisitSettings thresholdOfSignificantDistance];
  v71 = objc_msgSend(v33, "numberWithDouble:");
  v127[50] = v71;
  v126[51] = @"TAFilterSingleVisitEnabledLoiTypes";
  v72 = [(TAFilterSingleVisitSettings *)self->_filterSingleVisitSettings enabledLoiTypesToString];
  v127[51] = v72;
  v126[52] = @"TAFilterArrivingWorkImmediacyType";
  v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterSingleVisitSettings arrivingWorkImmediacyType](self->_filterSingleVisitSettings, "arrivingWorkImmediacyType"));
  v127[52] = v70;
  v126[53] = @"TAFilterLeavingLOIThresholdOfSignificantDuration";
  v34 = NSNumber;
  [(TAFilterLeavingLOISettings *)self->_filterLeavingLOISettings thresholdOfSignificantDuration];
  v69 = objc_msgSend(v34, "numberWithDouble:");
  v127[53] = v69;
  v126[54] = @"TAFilterLeavingLOIThresholdOfSignificantDistance";
  v35 = NSNumber;
  [(TAFilterLeavingLOISettings *)self->_filterLeavingLOISettings thresholdOfSignificantDistance];
  v67 = objc_msgSend(v35, "numberWithDouble:");
  v127[54] = v67;
  v126[55] = @"TAFilterLeavingLOIEnabledLoiTypes";
  v68 = [(TAFilterLeavingLOISettings *)self->_filterLeavingLOISettings enabledLoiTypesToString];
  v127[55] = v68;
  v126[56] = @"TAFilterLeavingHomeImmediacyType";
  v66 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterLeavingLOISettings leavingHomeImmediacyType](self->_filterLeavingLOISettings, "leavingHomeImmediacyType"));
  v127[56] = v66;
  v126[57] = @"TAFilterLeavingWorkImmediacyType";
  v65 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterLeavingLOISettings leavingWorkImmediacyType](self->_filterLeavingLOISettings, "leavingWorkImmediacyType"));
  v127[57] = v65;
  v126[58] = @"TAFilterGeneralAllowNavGeoAsPrivateVehicleHint";
  v64 = objc_msgSend(NSNumber, "numberWithBool:", -[TAFilterGeneralSettings allowNavGeoHintAsPrivateVehicleHint](self->_filterGeneralSettings, "allowNavGeoHintAsPrivateVehicleHint"));
  v127[58] = v64;
  v126[59] = @"TAFilterGeneralVehicularImmediacyType";
  v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterGeneralSettings vehicularImmediacyType](self->_filterGeneralSettings, "vehicularImmediacyType"));
  v127[59] = v63;
  v126[60] = @"TAFilterGeneralBeepOnMoveVehicularImmediacyType";
  v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterGeneralSettings beepOnMoveVehicularImmediacyType](self->_filterGeneralSettings, "beepOnMoveVehicularImmediacyType"));
  v127[60] = v62;
  v126[61] = @"TAFilterGeneralBeepOnMovePedestrianImmediacyType";
  v61 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterGeneralSettings beepOnMovePedestrianImmediacyType](self->_filterGeneralSettings, "beepOnMovePedestrianImmediacyType"));
  v127[61] = v61;
  v126[62] = @"TAFilterGeneralNextPLOIVehicularImmediacyType";
  v60 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterGeneralSettings nextPLOIVehicularImmediacyType](self->_filterGeneralSettings, "nextPLOIVehicularImmediacyType"));
  v127[62] = v60;
  v126[63] = @"TAFilterGeneralNextPLOIPedestrianImmediacyType";
  v59 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAFilterGeneralSettings nextPLOIPedestrianImmediacyType](self->_filterGeneralSettings, "nextPLOIPedestrianImmediacyType"));
  v127[63] = v59;
  v126[64] = @"TAServiceEnableTAFilterGeneral";
  id v58 = objc_msgSend(NSNumber, "numberWithBool:", -[TATrackingAvoidanceServiceSettings enableTAFilterGeneral](self->_serviceSettings, "enableTAFilterGeneral"));
  v127[64] = v58;
  v126[65] = @"TAServiceEnableTAFilterVisits";
  v57 = objc_msgSend(NSNumber, "numberWithBool:", -[TATrackingAvoidanceServiceSettings enableTAFilterVisits](self->_serviceSettings, "enableTAFilterVisits"));
  v127[65] = v57;
  v126[66] = @"TAServiceEnableTAFilterSingleVisit";
  v56 = objc_msgSend(NSNumber, "numberWithBool:", -[TATrackingAvoidanceServiceSettings enableTAFilterSingleVisit](self->_serviceSettings, "enableTAFilterSingleVisit"));
  v127[66] = v56;
  v126[67] = @"TAServiceEnableTAFilterLeavingLOI";
  v55 = objc_msgSend(NSNumber, "numberWithBool:", -[TATrackingAvoidanceServiceSettings enableTAFilterLeavingLOI](self->_serviceSettings, "enableTAFilterLeavingLOI"));
  v127[67] = v55;
  v126[68] = @"TAServiceClassificationTimeInterval";
  v36 = NSNumber;
  [(TATrackingAvoidanceServiceSettings *)self->_serviceSettings classificationTimeInterval];
  v54 = objc_msgSend(v36, "numberWithDouble:");
  v127[68] = v54;
  v126[69] = @"TAFilterVisitsEnabledLoiTypes";
  v37 = [(TAFilterVisitsSettings *)self->_filterVisitsSettings sensitiveLOITypesToString];
  v127[69] = v37;
  v126[70] = @"TAPersistenceInterval";
  v38 = [NSNumber numberWithDouble:self->_persistenceInterval];
  v127[70] = v38;
  v126[71] = @"TAPersistenceDirectory";
  v39 = [(TAPersistenceManagerSettings *)self->_persistenceManagerSettings persistenceDirectoryURL];
  v40 = [v39 description];
  v127[71] = v40;
  v126[72] = @"TAPersistenceStoreFileName";
  v41 = [(TAPersistenceManagerSettings *)self->_persistenceManagerSettings persistenceStoreFileName];
  v42 = [v41 description];
  v127[72] = v42;
  v126[73] = @"TAAnalyticsManagerEnableSubmission";
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[TAAnalyticsManagerSettings enableSubmission](self->_analyticsManagerSettings, "enableSubmission"));
  v127[73] = v43;
  v126[74] = @"TASettingsVersion";
  v44 = [NSNumber numberWithUnsignedInteger:self->_settingsVersion];
  v127[74] = v44;
  v126[75] = @"TAAISFetchEnable";
  v45 = [NSNumber numberWithBool:self->_aisFetchEnabled];
  v127[75] = v45;
  v122 = [NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:76];

  id v124 = 0;
  v46 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v122 error:&v124];
  id v47 = v124;
  if (v47)
  {
    v48 = (id)TAStatusLog;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      [(TASettings *)v50 description];
    }

    id v51 = [NSString string];
  }
  else
  {
    id v51 = v46;
  }
  v52 = v51;

  return v52;
}

- (BOOL)trackingAvoidanceEnabled
{
  return self->_trackingAvoidanceEnabled;
}

- (void)setTrackingAvoidanceEnabled:(BOOL)a3
{
  self->_trackingAvoidanceEnabled = a3;
}

- (BOOL)peopleDensityEnabled
{
  return self->_peopleDensityEnabled;
}

- (void)setPeopleDensityEnabled:(BOOL)a3
{
  self->_peopleDensityEnabled = a3;
}

- (unint64_t)maximumDailyScans
{
  return self->_maximumDailyScans;
}

- (void)setMaximumDailyScans:(unint64_t)a3
{
  self->_maximumDailyScans = a3;
}

- (unint64_t)notificationThrottleHours
{
  return self->_notificationThrottleHours;
}

- (void)setNotificationThrottleHours:(unint64_t)a3
{
  self->_notificationThrottleHours = a3;
}

- (unint64_t)notificationThrottleMaxPerPeriod
{
  return self->_notificationThrottleMaxPerPeriod;
}

- (void)setNotificationThrottleMaxPerPeriod:(unint64_t)a3
{
  self->_notificationThrottleMaxPerPeriod = a3;
}

- (double)persistenceInterval
{
  return self->_persistenceInterval;
}

- (void)setPersistenceInterval:(double)a3
{
  self->_persistenceInterval = a3;
}

- (BOOL)aisFetchEnabled
{
  return self->_aisFetchEnabled;
}

- (void)setAisFetchEnabled:(BOOL)a3
{
  self->_aisFetchEnabled = a3;
}

- (TAFilterGeneralSettings)filterGeneralSettings
{
  return self->_filterGeneralSettings;
}

- (void)setFilterGeneralSettings:(id)a3
{
}

- (void)setFilterVisitsSettings:(id)a3
{
}

- (void)setFilterSingleVisitSettings:(id)a3
{
}

- (TAFilterLeavingLOISettings)filterLeavingLOISettings
{
  return self->_filterLeavingLOISettings;
}

- (void)setFilterLeavingLOISettings:(id)a3
{
}

- (TAEventBufferSettings)eventBufferSettings
{
  return self->_eventBufferSettings;
}

- (void)setEventBufferSettings:(id)a3
{
}

- (TAVisitStateSettings)visitStateSettings
{
  return self->_visitStateSettings;
}

- (void)setVisitStateSettings:(id)a3
{
}

- (TADeviceRecordSettings)deviceRecordSettings
{
  return self->_deviceRecordSettings;
}

- (void)setDeviceRecordSettings:(id)a3
{
}

- (TAScanRequestSettings)scanRequestSettings
{
  return self->_scanRequestSettings;
}

- (void)setScanRequestSettings:(id)a3
{
}

- (TATrackingAvoidanceServiceSettings)serviceSettings
{
  return self->_serviceSettings;
}

- (void)setServiceSettings:(id)a3
{
}

- (TAPersistenceManagerSettings)persistenceManagerSettings
{
  return self->_persistenceManagerSettings;
}

- (void)setPersistenceManagerSettings:(id)a3
{
}

- (TAAnalyticsManagerSettings)analyticsManagerSettings
{
  return self->_analyticsManagerSettings;
}

- (void)setAnalyticsManagerSettings:(id)a3
{
}

- (unint64_t)settingsVersion
{
  return self->_settingsVersion;
}

- (void)setSettingsVersion:(unint64_t)a3
{
  self->_settingsVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManagerSettings, 0);
  objc_storeStrong((id *)&self->_persistenceManagerSettings, 0);
  objc_storeStrong((id *)&self->_serviceSettings, 0);
  objc_storeStrong((id *)&self->_scanRequestSettings, 0);
  objc_storeStrong((id *)&self->_deviceRecordSettings, 0);
  objc_storeStrong((id *)&self->_visitStateSettings, 0);
  objc_storeStrong((id *)&self->_eventBufferSettings, 0);
  objc_storeStrong((id *)&self->_filterLeavingLOISettings, 0);
  objc_storeStrong((id *)&self->_filterSingleVisitSettings, 0);
  objc_storeStrong((id *)&self->_filterVisitsSettings, 0);
  objc_storeStrong((id *)&self->_filterGeneralSettings, 0);
}

- (void)description
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_22345C000, log, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
}

@end