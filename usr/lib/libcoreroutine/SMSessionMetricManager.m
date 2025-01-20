@interface SMSessionMetricManager
- (BOOL)_isCellularActivated;
- (BOOL)_isStandalone;
- (BOOL)didArriveSafely;
- (BOOL)didDestinationAnomalyTrigger;
- (BOOL)didHandoffOccur;
- (BOOL)didTriggerOccur;
- (BOOL)didWorkoutEnd;
- (BOOL)didWorkoutPause;
- (BOOL)isWorkoutAlwaysOn;
- (BOOL)noProgressTriggered;
- (BOOL)routeDeviationTriggered;
- (BOOL)sosTriggered;
- (BOOL)userEndedSession;
- (BOOL)wasActiveAtEnd;
- (BOOL)wasActiveAtStart;
- (NSDate)sessionEndDate;
- (NSDate)sessionStartDate;
- (NSString)workoutActivityTypeString;
- (NSUUID)currentDeviceIdentifier;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTFixedSizeQueue)etaUpdateStateQueue;
- (RTFixedSizeQueue)etaUpdateSubmissionQueue;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (SMSessionMetricManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 sessionStore:(id)a5 locationManager:(id)a6 currentDeviceIdentifier:(id)a7;
- (SMSessionStore)sessionStore;
- (double)closestTimeIntervalToExceedingETA;
- (double)initialDestinationExpectedTravelTime;
- (double)initialDistance;
- (double)maxCrowFliesScaleFactor;
- (double)maxMapsETAScaleFactor;
- (double)mostRecentLocationDistance;
- (double)originalNominalTravelTime;
- (double)previousCrowFliesETA;
- (double)previousMapsExpectedETA;
- (double)ratioOfFirstAnomalyDistanceToTotalDistance;
- (id)_createDestinationMetricDictionary;
- (id)_createInitiatorPerSessionDetailsMetricDictionary;
- (id)collectDestinationSessionMetrics;
- (id)collectInitiatorPerSessionMetrics;
- (id)getLocationsForInterval:(id)a3 nearBoundingLocation:(id)a4;
- (id)getRTLocationOfInterestForCLLocation:(id)a3;
- (int)numExtensions;
- (unint64_t)firstAnomalyTriggerCategoryEnum;
- (unint64_t)modeOfTransportation;
- (unint64_t)numAnomalyPrompt;
- (unint64_t)numAnomalyPromptDuringHysteresis;
- (unint64_t)numHandoff;
- (unint64_t)numLPMSeparation;
- (unint64_t)numRecipients;
- (unint64_t)numTakeover;
- (unint64_t)numUnsupportedDeviceSeparation;
- (unint64_t)numUserDisabledConnectivity;
- (unint64_t)originatingLocationTypeEnum;
- (unint64_t)sessionDestinationType;
- (unint64_t)sessionType;
- (void)_gatherSessionDestinationStats:(id)a3;
- (void)_onDailyMetricsNotification:(id)a3;
- (void)_reset;
- (void)_setup;
- (void)_submitTerminationMetricsWithSuccess:(BOOL)a3 reason:(unint64_t)a4 error:(id)a5;
- (void)_updateETASubmissionStates;
- (void)cacheMostRecentLocationDistance:(double)a3;
- (void)initialDistance:(double)a3;
- (void)onBecomingActiveDevice:(id)a3;
- (void)onBecomingNonActiveDevice:(id)a3;
- (void)onCrowFliesETAUpdate:(double)a3;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onDeclareAnomalyForTriggerCategory:(unint64_t)a3;
- (void)onLPMSeparation;
- (void)onMapsETAUpdate:(double)a3;
- (void)onSessionChangedWithConfiguration:(id)a3;
- (void)onSessionEndedForActiveDevice:(BOOL)a3;
- (void)onSessionStartedWithState:(id)a3;
- (void)onSessionTerminationResult:(BOOL)a3 reason:(unint64_t)a4 error:(id)a5;
- (void)onShouldUpdateETAUpperBoundWithETAUpdateState:(id)a3;
- (void)onUnsupportedDeviceSeparation;
- (void)onUserActionWithRemoteCommand:(int64_t)a3 remoteCommandType:(int64_t)a4 error:(int64_t)a5 errorDomain:(id)a6;
- (void)onUserDisabledConnectivity;
- (void)onWorkoutEnded;
- (void)onWorkoutPaused;
- (void)setClosestTimeIntervalToExceedingETA:(double)a3;
- (void)setCurrentDeviceIdentifier:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDidArriveSafely:(BOOL)a3;
- (void)setDidDestinationAnomalyTrigger:(BOOL)a3;
- (void)setDidHandoffOccur:(BOOL)a3;
- (void)setDidTriggerOccur:(BOOL)a3;
- (void)setDidWorkoutEnd:(BOOL)a3;
- (void)setDidWorkoutPause:(BOOL)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setEtaUpdateStateQueue:(id)a3;
- (void)setEtaUpdateSubmissionQueue:(id)a3;
- (void)setFirstAnomalyTriggerCategoryEnum:(unint64_t)a3;
- (void)setInitialDestinationExpectedTravelTime:(double)a3;
- (void)setInitialDistance:(double)a3;
- (void)setIsWorkoutAlwaysOn:(BOOL)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMaxCrowFliesScaleFactor:(double)a3;
- (void)setMaxMapsETAScaleFactor:(double)a3;
- (void)setModeOfTransportation:(unint64_t)a3;
- (void)setMostRecentLocationDistance:(double)a3;
- (void)setNoProgressTriggered:(BOOL)a3;
- (void)setNumAnomalyPrompt:(unint64_t)a3;
- (void)setNumAnomalyPromptDuringHysteresis:(unint64_t)a3;
- (void)setNumExtensions:(int)a3;
- (void)setNumHandoff:(unint64_t)a3;
- (void)setNumLPMSeparation:(unint64_t)a3;
- (void)setNumRecipients:(unint64_t)a3;
- (void)setNumTakeover:(unint64_t)a3;
- (void)setNumUnsupportedDeviceSeparation:(unint64_t)a3;
- (void)setNumUserDisabledConnectivity:(unint64_t)a3;
- (void)setOriginalNominalTravelTime:(double)a3;
- (void)setOriginatingLocationTypeEnum:(unint64_t)a3;
- (void)setPreviousCrowFliesETA:(double)a3;
- (void)setPreviousMapsExpectedETA:(double)a3;
- (void)setQueue:(id)a3;
- (void)setRatioOfFirstAnomalyDistanceToTotalDistance:(double)a3;
- (void)setRouteDeviationTriggered:(BOOL)a3;
- (void)setSessionDestinationType:(unint64_t)a3;
- (void)setSessionEndDate:(id)a3;
- (void)setSessionStartDate:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setSessionType:(unint64_t)a3;
- (void)setSosTriggered:(BOOL)a3;
- (void)setUserEndedSession:(BOOL)a3;
- (void)setWasActiveAtEnd:(BOOL)a3;
- (void)setWasActiveAtStart:(BOOL)a3;
- (void)setWorkoutActivityTypeString:(id)a3;
- (void)setup;
- (void)submitMetrics;
- (void)updateClosestTimeIntervalToExceedingETAWithTimeInterval:(double)a3;
@end

@implementation SMSessionMetricManager

- (SMSessionMetricManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 sessionStore:(id)a5 locationManager:(id)a6 currentDeviceIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v25 = v17;
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: defaultsManager";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_15;
  }
  if (!v14)
  {
    v25 = v17;
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_14;
  }
  if (!v15)
  {
    v25 = v17;
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "Invalid parameter not satisfying: sessionStore";
      goto LABEL_14;
    }
LABEL_15:

    v28 = 0;
    goto LABEL_23;
  }
  id v34 = v17;
  if (v16)
  {
    v35.receiver = self;
    v35.super_class = (Class)SMSessionMetricManager;
    v18 = [(SMSessionMetricManager *)&v35 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_defaultsManager, a3);
      uint64_t v20 = objc_opt_new();
      distanceCalculator = v19->_distanceCalculator;
      v19->_distanceCalculator = (RTDistanceCalculator *)v20;

      objc_storeStrong((id *)&v19->_learnedLocationManager, a4);
      objc_storeStrong((id *)&v19->_sessionStore, a5);
      objc_storeStrong((id *)&v19->_locationManager, a6);
      v22 = v19;
      v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = (const char *)[v22 UTF8String];
      }
      else
      {
        id v30 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v22];
        v24 = (const char *)[v30 UTF8String];
      }
      dispatch_queue_t v31 = dispatch_queue_create(v24, v23);

      id v32 = v22[9];
      v22[9] = v31;

      objc_storeStrong(v22 + 10, a7);
      [v22 setup];
    }
    self = v19;
    v28 = self;
  }
  else
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager", buf, 2u);
    }

    v28 = 0;
  }
  v25 = v34;
LABEL_23:

  return v28;
}

- (void)setup
{
  v3 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SMSessionMetricManager_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__SMSessionMetricManager_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  uint64_t v207 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];

  v4 = [(SMSessionMetricManager *)self defaultsManager];
  v5 = [v4 objectForKey:@"RTDefaultsSessionMetricManagerSessionStartDateKey"];
  objc_storeStrong((id *)&self->_sessionStartDate, v5);

  v6 = [(SMSessionMetricManager *)self defaultsManager];
  v7 = [v6 objectForKey:@"RTDefaultsSessionMetricManagerSessionEndDateKey"];
  objc_storeStrong((id *)&self->_sessionEndDate, v7);

  v8 = [(SMSessionMetricManager *)self defaultsManager];
  v9 = [v8 objectForKey:@"RTDefaultsSessionMetricManagerInitialDestinationExpectedTravelTimeKey"];
  if (v9)
  {
    v10 = [(SMSessionMetricManager *)self defaultsManager];
    v11 = [v10 objectForKey:@"RTDefaultsSessionMetricManagerInitialDestinationExpectedTravelTimeKey"];
    [v11 doubleValue];
    self->_initialDestinationExpectedTravelTime = v12;
  }
  else
  {
    self->_initialDestinationExpectedTravelTime = -1.0;
  }

  id v13 = [(SMSessionMetricManager *)self defaultsManager];
  id v14 = [v13 objectForKey:@"RTDefaultsSessionMetricManagerMaxCrowFliesScaleFactorKey"];
  if (v14)
  {
    id v15 = [(SMSessionMetricManager *)self defaultsManager];
    id v16 = [v15 objectForKey:@"RTDefaultsSessionMetricManagerMaxCrowFliesScaleFactorKey"];
    [v16 doubleValue];
    self->_maxCrowFliesScaleFactor = v17;
  }
  else
  {
    self->_maxCrowFliesScaleFactor = -1.0;
  }

  v18 = [(SMSessionMetricManager *)self defaultsManager];
  v19 = [v18 objectForKey:@"RTDefaultsSessionMetricManagerMaxMapsETAScaleFactorKey"];
  if (v19)
  {
    uint64_t v20 = [(SMSessionMetricManager *)self defaultsManager];
    v21 = [v20 objectForKey:@"RTDefaultsSessionMetricManagerMaxMapsETAScaleFactorKey"];
    [v21 doubleValue];
    self->_maxMapsETAScaleFactor = v22;
  }
  else
  {
    self->_maxMapsETAScaleFactor = -1.0;
  }

  v23 = [(SMSessionMetricManager *)self defaultsManager];
  v24 = [v23 objectForKey:@"RTDefaultsSessionMetricManagerClosestTimeIntervalToExceedingETAKey"];
  if (v24)
  {
    v25 = [(SMSessionMetricManager *)self defaultsManager];
    v26 = [v25 objectForKey:@"RTDefaultsSessionMetricManagerClosestTimeIntervalToExceedingETAKey"];
    [v26 doubleValue];
    self->_closestTimeIntervalToExceedingETA = v27;
  }
  else
  {
    self->_closestTimeIntervalToExceedingETA = 1.79769313e308;
  }

  v28 = [(SMSessionMetricManager *)self defaultsManager];
  v29 = [v28 objectForKey:@"RTDefaultsSessionMetricManagerDidDestinationAnomalyTriggerKey"];
  if (v29)
  {
    id v30 = [(SMSessionMetricManager *)self defaultsManager];
    dispatch_queue_t v31 = [v30 objectForKey:@"RTDefaultsSessionMetricManagerDidDestinationAnomalyTriggerKey"];
    self->_didDestinationAnomalyTrigger = [v31 BOOLValue];
  }
  else
  {
    self->_didDestinationAnomalyTrigger = 0;
  }

  id v32 = [(SMSessionMetricManager *)self defaultsManager];
  v33 = [v32 objectForKey:@"RTDefaultsSessionMetricManagerNoProgressTriggeredKey"];
  if (v33)
  {
    id v34 = [(SMSessionMetricManager *)self defaultsManager];
    objc_super v35 = [v34 objectForKey:@"RTDefaultsSessionMetricManagerNoProgressTriggeredKey"];
    self->_noProgressTriggered = [v35 BOOLValue];
  }
  else
  {
    self->_noProgressTriggered = 0;
  }

  v36 = [(SMSessionMetricManager *)self defaultsManager];
  v37 = [v36 objectForKey:@"RTDefaultsSessionMetricManagerRouteDeviationTriggeredKey"];
  if (v37)
  {
    v38 = [(SMSessionMetricManager *)self defaultsManager];
    v39 = [v38 objectForKey:@"RTDefaultsSessionMetricManagerRouteDeviationTriggeredKey"];
    self->_routeDeviationTriggered = [v39 BOOLValue];
  }
  else
  {
    self->_routeDeviationTriggered = 0;
  }

  v40 = [(SMSessionMetricManager *)self defaultsManager];
  v41 = [v40 objectForKey:@"RTDefaultsSessionMetricManagerDidArriveSafelyKey"];
  if (v41)
  {
    v42 = [(SMSessionMetricManager *)self defaultsManager];
    v43 = [v42 objectForKey:@"RTDefaultsSessionMetricManagerDidArriveSafelyKey"];
    self->_didArriveSafely = [v43 BOOLValue];
  }
  else
  {
    self->_didArriveSafely = 0;
  }

  v44 = [(SMSessionMetricManager *)self defaultsManager];
  v45 = [v44 objectForKey:@"RTDefaultsSessionMetricManagerSosTriggeredKey"];
  if (v45)
  {
    v46 = [(SMSessionMetricManager *)self defaultsManager];
    v47 = [v46 objectForKey:@"RTDefaultsSessionMetricManagerSosTriggeredKey"];
    self->_sosTriggered = [v47 BOOLValue];
  }
  else
  {
    self->_sosTriggered = 0;
  }

  v48 = [(SMSessionMetricManager *)self defaultsManager];
  v49 = [v48 objectForKey:@"RTDefaultsSessionMetricManagerUserEndedSessionKey"];
  if (v49)
  {
    v50 = [(SMSessionMetricManager *)self defaultsManager];
    v51 = [v50 objectForKey:@"RTDefaultsSessionMetricManagerUserEndedSessionKey"];
    self->_userEndedSession = [v51 BOOLValue];
  }
  else
  {
    self->_userEndedSession = 0;
  }

  v52 = [(SMSessionMetricManager *)self defaultsManager];
  v53 = [v52 objectForKey:@"RTDefaultsSessionMetricManagerPreviousCrowFliesETAKey"];
  if (v53)
  {
    v54 = [(SMSessionMetricManager *)self defaultsManager];
    v55 = [v54 objectForKey:@"RTDefaultsSessionMetricManagerPreviousCrowFliesETAKey"];
    [v55 doubleValue];
    self->_previousCrowFliesETA = v56;
  }
  else
  {
    self->_previousCrowFliesETA = -1.0;
  }

  v57 = [(SMSessionMetricManager *)self defaultsManager];
  v58 = [v57 objectForKey:@"RTDefaultsSessionMetricManagerPreviousMapsExpectedETAKey"];
  if (v58)
  {
    v59 = [(SMSessionMetricManager *)self defaultsManager];
    v60 = [v59 objectForKey:@"RTDefaultsSessionMetricManagerPreviousMapsExpectedETAKey"];
    [v60 doubleValue];
    self->_previousMapsExpectedETA = v61;
  }
  else
  {
    self->_previousMapsExpectedETA = -1.0;
  }

  v62 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v63 = objc_opt_class();
  uint64_t v64 = objc_opt_class();
  v65 = [v62 setWithObjects:v63, v64, objc_opt_class(), nil];
  v66 = (void *)MEMORY[0x1E4F28DC0];
  v67 = [(SMSessionMetricManager *)self defaultsManager];
  v68 = [v67 objectForKey:@"RTDefaultsSessionMetricManagerEtaUpdateStateQueueKey"];
  id v202 = 0;
  v69 = [v66 unarchivedObjectOfClasses:v65 fromData:v68 error:&v202];
  id v70 = v202;

  if (v70)
  {
    v71 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v204 = "-[SMSessionMetricManager _setup]";
      __int16 v205 = 2112;
      id v206 = v70;
      _os_log_error_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_ERROR, "%s, Decoding error for etaUpdateStateQueue, %@", buf, 0x16u);
    }

    goto LABEL_41;
  }
  if (!v69)
  {
LABEL_41:
    etaUpdateStateQueue = [[RTFixedSizeQueue alloc] initWithCapacity:2];
    objc_storeStrong((id *)&self->_etaUpdateStateQueue, etaUpdateStateQueue);
    v73 = 0;
    goto LABEL_44;
  }
  v73 = v69;
  etaUpdateStateQueue = self->_etaUpdateStateQueue;
  self->_etaUpdateStateQueue = v73;
LABEL_44:

  v74 = (void *)MEMORY[0x1E4F28DC0];
  v75 = [(SMSessionMetricManager *)self defaultsManager];
  v76 = [v75 objectForKey:@"RTDefaultsSessionMetricManagerEtaUpdateSubmissionQueueKey"];
  id v201 = 0;
  v77 = [v74 unarchivedObjectOfClasses:v65 fromData:v76 error:&v201];
  id v78 = v201;

  if (v78)
  {
    v79 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v204 = "-[SMSessionMetricManager _setup]";
      __int16 v205 = 2112;
      id v206 = v78;
      _os_log_error_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_ERROR, "%s, Decoding error for etaUpdateSubmissionQueue, %@", buf, 0x16u);
    }

    goto LABEL_48;
  }
  if (!v77)
  {
LABEL_48:
    etaUpdateSubmissionQueue = [[RTFixedSizeQueue alloc] initWithCapacity:2];
    objc_storeStrong((id *)&self->_etaUpdateSubmissionQueue, etaUpdateSubmissionQueue);
    v81 = 0;
    goto LABEL_51;
  }
  v81 = v77;
  etaUpdateSubmissionQueue = self->_etaUpdateSubmissionQueue;
  self->_etaUpdateSubmissionQueue = v81;
LABEL_51:

  v82 = [(SMSessionMetricManager *)self defaultsManager];
  v83 = [v82 objectForKey:@"RTDefaultsSessionMetricManagerSessionTypeKey"];
  if (v83)
  {
    v84 = [(SMSessionMetricManager *)self defaultsManager];
    v85 = [v84 objectForKey:@"RTDefaultsSessionMetricManagerSessionTypeKey"];
    self->_sessionType = [v85 integerValue];
  }
  else
  {
    self->_sessionType = 0;
  }

  v86 = [(SMSessionMetricManager *)self defaultsManager];
  v87 = [v86 objectForKey:@"RTDefaultsSessionMetricManagerDidTriggerOccurKey"];
  if (v87)
  {
    v88 = [(SMSessionMetricManager *)self defaultsManager];
    v89 = [v88 objectForKey:@"RTDefaultsSessionMetricManagerDidTriggerOccurKey"];
    self->_didTriggerOccur = [v89 BOOLValue];
  }
  else
  {
    self->_didTriggerOccur = 0;
  }

  v90 = [(SMSessionMetricManager *)self defaultsManager];
  v91 = [v90 objectForKey:@"RTDefaultsSessionMetricManagerDestinationLocationTypeEnumKey"];
  if (v91)
  {
    v92 = [(SMSessionMetricManager *)self defaultsManager];
    v93 = [v92 objectForKey:@"RTDefaultsSessionMetricManagerDestinationLocationTypeEnumKey"];
    [v93 doubleValue];
    self->_sessionDestinationType = (unint64_t)v94;
  }
  else
  {
    self->_sessionDestinationType = 0;
  }

  v95 = [(SMSessionMetricManager *)self defaultsManager];
  v96 = [v95 objectForKey:@"RTDefaultsSessionMetricManagerFirstAnomalyTriggerCategoryEnumKey"];
  if (v96)
  {
    v97 = [(SMSessionMetricManager *)self defaultsManager];
    v98 = [v97 objectForKey:@"RTDefaultsSessionMetricManagerFirstAnomalyTriggerCategoryEnumKey"];
    [v98 doubleValue];
    self->_firstAnomalyTriggerCategoryEnum = (unint64_t)v99;
  }
  else
  {
    self->_firstAnomalyTriggerCategoryEnum = 0;
  }

  v100 = [(SMSessionMetricManager *)self defaultsManager];
  v101 = [v100 objectForKey:@"RTDefaultsSessionMetricManagerMostRecentLocationDistanceKey"];
  if (v101)
  {
    v102 = [(SMSessionMetricManager *)self defaultsManager];
    v103 = [v102 objectForKey:@"RTDefaultsSessionMetricManagerMostRecentLocationDistanceKey"];
    [v103 doubleValue];
    self->_mostRecentLocationDistance = v104;
  }
  else
  {
    self->_mostRecentLocationDistance = -1.0;
  }

  v105 = [(SMSessionMetricManager *)self defaultsManager];
  v106 = [v105 objectForKey:@"RTDefaultsSessionMetricManagerNumExtensionsKey"];
  if (v106)
  {
    v107 = [(SMSessionMetricManager *)self defaultsManager];
    v108 = [v107 objectForKey:@"RTDefaultsSessionMetricManagerNumExtensionsKey"];
    [v108 doubleValue];
    self->_numExtensions = (int)v109;
  }
  else
  {
    self->_numExtensions = 0;
  }

  v110 = [(SMSessionMetricManager *)self defaultsManager];
  v111 = [v110 objectForKey:@"RTDefaultsSessionMetricManagerOriginatingLocationTypeKey"];
  if (v111)
  {
    v112 = [(SMSessionMetricManager *)self defaultsManager];
    v113 = [v112 objectForKey:@"RTDefaultsSessionMetricManagerOriginatingLocationTypeKey"];
    [v113 doubleValue];
    self->_originatingLocationTypeEnum = (unint64_t)v114;
  }
  else
  {
    self->_originatingLocationTypeEnum = 0;
  }

  v115 = [(SMSessionMetricManager *)self defaultsManager];
  v116 = [v115 objectForKey:@"RTDefaultsSessionMetricManagerOriginalNominalTravelTimeKey"];
  if (v116)
  {
    v117 = [(SMSessionMetricManager *)self defaultsManager];
    v118 = [v117 objectForKey:@"RTDefaultsSessionMetricManagerOriginalNominalTravelTimeKey"];
    [v118 doubleValue];
    self->_originalNominalTravelTime = v119;
  }
  else
  {
    self->_originalNominalTravelTime = -1.0;
  }

  v120 = [(SMSessionMetricManager *)self defaultsManager];
  v121 = [v120 objectForKey:@"RTDefaultsSessionMetricManagerRatioOfFirstAnomalyDistanceToTotalDistanceKey"];
  if (v121)
  {
    v122 = [(SMSessionMetricManager *)self defaultsManager];
    v123 = [v122 objectForKey:@"RTDefaultsSessionMetricManagerRatioOfFirstAnomalyDistanceToTotalDistanceKey"];
    [v123 doubleValue];
    self->_ratioOfFirstAnomalyDistanceToTotalDistance = v124;
  }
  else
  {
    self->_ratioOfFirstAnomalyDistanceToTotalDistance = -1.0;
  }

  v125 = [(SMSessionMetricManager *)self defaultsManager];
  v126 = [v125 objectForKey:@"RTDefaultsSessionMetricManagerInitialDistanceKey"];
  if (v126)
  {
    v127 = [(SMSessionMetricManager *)self defaultsManager];
    v128 = [v127 objectForKey:@"RTDefaultsSessionMetricManagerInitialDistanceKey"];
    [v128 doubleValue];
    self->_initialDistance = v129;
  }
  else
  {
    self->_initialDistance = -1.0;
  }

  v130 = [(SMSessionMetricManager *)self defaultsManager];
  v131 = [v130 objectForKey:@"RTDefaultsSessionMetricManagerDidHandoffOccurKey"];
  if (v131)
  {
    v132 = [(SMSessionMetricManager *)self defaultsManager];
    v133 = [v132 objectForKey:@"RTDefaultsSessionMetricManagerDidHandoffOccurKey"];
    self->_didHandoffOccur = [v133 BOOLValue];
  }
  else
  {
    self->_didHandoffOccur = 0;
  }

  v134 = [(SMSessionMetricManager *)self defaultsManager];
  v135 = [v134 objectForKey:@"RTDefaultsSessionMetricManagerWasActiveAtStartKey"];
  if (v135)
  {
    v136 = [(SMSessionMetricManager *)self defaultsManager];
    v137 = [v136 objectForKey:@"RTDefaultsSessionMetricManagerWasActiveAtStartKey"];
    self->_wasActiveAtStart = [v137 BOOLValue];
  }
  else
  {
    self->_wasActiveAtStart = 0;
  }

  v138 = [(SMSessionMetricManager *)self defaultsManager];
  v139 = [v138 objectForKey:@"RTDefaultsSessionMetricManagerWasActiveAtEndKey"];
  if (v139)
  {
    v140 = [(SMSessionMetricManager *)self defaultsManager];
    v141 = [v140 objectForKey:@"RTDefaultsSessionMetricManagerWasActiveAtEndKey"];
    self->_wasActiveAtEnd = [v141 BOOLValue];
  }
  else
  {
    self->_wasActiveAtEnd = 0;
  }

  v142 = [(SMSessionMetricManager *)self defaultsManager];
  v143 = [v142 objectForKey:@"RTDefaultsSessionMetricManagerNumAnomalyPromptKey"];
  if (v143)
  {
    v144 = [(SMSessionMetricManager *)self defaultsManager];
    v145 = [v144 objectForKey:@"RTDefaultsSessionMetricManagerNumAnomalyPromptKey"];
    self->_numAnomalyPrompt = [v145 unsignedIntValue];
  }
  else
  {
    self->_numAnomalyPrompt = 0;
  }

  v146 = [(SMSessionMetricManager *)self defaultsManager];
  v147 = [v146 objectForKey:@"RTDefaultsSessionMetricManagerNumAnomalyPromptDuringHysteresisKey"];
  if (v147)
  {
    v148 = [(SMSessionMetricManager *)self defaultsManager];
    v149 = [v148 objectForKey:@"RTDefaultsSessionMetricManagerNumAnomalyPromptDuringHysteresisKey"];
    self->_numAnomalyPromptDuringHysteresis = [v149 unsignedIntValue];
  }
  else
  {
    self->_numAnomalyPromptDuringHysteresis = 0;
  }

  v150 = [(SMSessionMetricManager *)self defaultsManager];
  v151 = [v150 objectForKey:@"RTDefaultsSessionMetricManagerNumHandoffKey"];
  if (v151)
  {
    v152 = [(SMSessionMetricManager *)self defaultsManager];
    v153 = [v152 objectForKey:@"RTDefaultsSessionMetricManagerNumHandoffKey"];
    self->_numHandoff = [v153 unsignedIntValue];
  }
  else
  {
    self->_numHandoff = 0;
  }

  v154 = [(SMSessionMetricManager *)self defaultsManager];
  v155 = [v154 objectForKey:@"RTDefaultsSessionMetricManagerNumLPMSeparationKey"];
  if (v155)
  {
    v156 = [(SMSessionMetricManager *)self defaultsManager];
    v157 = [v156 objectForKey:@"RTDefaultsSessionMetricManagerNumLPMSeparationKey"];
    self->_numLPMSeparation = [v157 unsignedIntValue];
  }
  else
  {
    self->_numLPMSeparation = 0;
  }

  v158 = [(SMSessionMetricManager *)self defaultsManager];
  v159 = [v158 objectForKey:@"RTDefaultsSessionMetricManagerNumTakeoverKey"];
  if (v159)
  {
    v160 = [(SMSessionMetricManager *)self defaultsManager];
    v161 = [v160 objectForKey:@"RTDefaultsSessionMetricManagerNumTakeoverKey"];
    self->_numTakeover = [v161 unsignedIntValue];
  }
  else
  {
    self->_numTakeover = 0;
  }

  v162 = [(SMSessionMetricManager *)self defaultsManager];
  v163 = [v162 objectForKey:@"RTDefaultsSessionMetricManagerNumUnsupportedDeviceSeparationKey"];
  if (v163)
  {
    v164 = [(SMSessionMetricManager *)self defaultsManager];
    v165 = [v164 objectForKey:@"RTDefaultsSessionMetricManagerNumUnsupportedDeviceSeparationKey"];
    self->_numUnsupportedDeviceSeparation = [v165 unsignedIntValue];
  }
  else
  {
    self->_numUnsupportedDeviceSeparation = 0;
  }

  v166 = [(SMSessionMetricManager *)self defaultsManager];
  v167 = [v166 objectForKey:@"RTDefaultsSessionMetricManagerNumUserDisabledConnectivityKey"];
  if (v167)
  {
    v168 = [(SMSessionMetricManager *)self defaultsManager];
    v169 = [v168 objectForKey:@"RTDefaultsSessionMetricManagerNumUserDisabledConnectivityKey"];
    self->_numUserDisabledConnectivity = [v169 unsignedIntValue];
  }
  else
  {
    self->_numUserDisabledConnectivity = 0;
  }

  v170 = [(SMSessionMetricManager *)self defaultsManager];
  v171 = [v170 objectForKey:@"RTDefaultsSessionMetricManagerDidWorkoutEndKey"];
  if (v171)
  {
    v172 = [(SMSessionMetricManager *)self defaultsManager];
    v173 = [v172 objectForKey:@"RTDefaultsSessionMetricManagerDidWorkoutEndKey"];
    self->_didWorkoutEnd = [v173 BOOLValue];
  }
  else
  {
    self->_didWorkoutEnd = 0;
  }

  v174 = [(SMSessionMetricManager *)self defaultsManager];
  v175 = [v174 objectForKey:@"RTDefaultsSessionMetricManagerDidWorkoutPauseKey"];
  if (v175)
  {
    v176 = [(SMSessionMetricManager *)self defaultsManager];
    v177 = [v176 objectForKey:@"RTDefaultsSessionMetricManagerDidWorkoutPauseKey"];
    self->_didWorkoutPause = [v177 BOOLValue];
  }
  else
  {
    self->_didWorkoutPause = 0;
  }

  v178 = [(SMSessionMetricManager *)self defaultsManager];
  v179 = [v178 objectForKey:@"RTDefaultsSessionMetricManagerIsWorkoutAlwaysOnKey"];
  if (v179)
  {
    v180 = [(SMSessionMetricManager *)self defaultsManager];
    v181 = [v180 objectForKey:@"RTDefaultsSessionMetricManagerIsWorkoutAlwaysOnKey"];
    self->_isWorkoutAlwaysOn = [v181 BOOLValue];
  }
  else
  {
    self->_isWorkoutAlwaysOn = 0;
  }

  v182 = [(SMSessionMetricManager *)self defaultsManager];
  v183 = [v182 objectForKey:@"RTDefaultsSessionMetricManagerModeOfTransportationKey"];
  if (v183)
  {
    v184 = [(SMSessionMetricManager *)self defaultsManager];
    v185 = [v184 objectForKey:@"RTDefaultsSessionMetricManagerModeOfTransportationKey"];
    self->_modeOfTransportation = [v185 unsignedIntValue];
  }
  else
  {
    self->_modeOfTransportation = 0;
  }

  v186 = [(SMSessionMetricManager *)self defaultsManager];
  v187 = [v186 objectForKey:@"RTDefaultsSessionMetricManagerNumRecipientsKey"];
  if (v187)
  {
    v188 = [(SMSessionMetricManager *)self defaultsManager];
    v189 = [v188 objectForKey:@"RTDefaultsSessionMetricManagerNumRecipientsKey"];
    self->_numRecipients = [v189 unsignedIntValue];
  }
  else
  {
    self->_numRecipients = 0;
  }

  v190 = [(SMSessionMetricManager *)self defaultsManager];
  v191 = [v190 objectForKey:@"RTDefaultsSessionMetricManagerWorkoutActivityTypeStringKey"];
  if (v191)
  {
    workoutActivityTypeString = [(SMSessionMetricManager *)self defaultsManager];
    v193 = [workoutActivityTypeString objectForKey:@"RTDefaultsSessionMetricManagerWorkoutActivityTypeStringKey"];
    [v193 stringValue];
    v200 = v190;
    v194 = v65;
    id v195 = v78;
    id v196 = v70;
    v197 = v81;
    v199 = v198 = v73;
    objc_storeStrong((id *)&self->_workoutActivityTypeString, v199);

    v73 = v198;
    v81 = v197;
    id v70 = v196;
    id v78 = v195;
    v65 = v194;
    v190 = v200;
  }
  else
  {
    workoutActivityTypeString = self->_workoutActivityTypeString;
    self->_workoutActivityTypeString = (NSString *)@"Unknown";
  }
}

- (void)_reset
{
  v3 = [(SMSessionMetricManager *)self defaultsManager];
  [v3 setObject:0 forKey:@"RTDefaultsSessionMetricManagerSessionStartDateKey"];

  v4 = [(SMSessionMetricManager *)self defaultsManager];
  [v4 setObject:0 forKey:@"RTDefaultsSessionMetricManagerSessionEndDateKey"];

  v5 = [(SMSessionMetricManager *)self defaultsManager];
  [v5 setObject:0 forKey:@"RTDefaultsSessionMetricManagerClosestTimeIntervalToExceedingETAKey"];

  v6 = [(SMSessionMetricManager *)self defaultsManager];
  [v6 setObject:0 forKey:@"RTDefaultsSessionMetricManagerMaxCrowFliesScaleFactorKey"];

  v7 = [(SMSessionMetricManager *)self defaultsManager];
  [v7 setObject:0 forKey:@"RTDefaultsSessionMetricManagerMaxMapsETAScaleFactorKey"];

  v8 = [(SMSessionMetricManager *)self defaultsManager];
  [v8 setObject:0 forKey:@"RTDefaultsSessionMetricManagerDidDestinationAnomalyTriggerKey"];

  v9 = [(SMSessionMetricManager *)self defaultsManager];
  [v9 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNoProgressTriggeredKey"];

  v10 = [(SMSessionMetricManager *)self defaultsManager];
  [v10 setObject:0 forKey:@"RTDefaultsSessionMetricManagerRouteDeviationTriggeredKey"];

  v11 = [(SMSessionMetricManager *)self defaultsManager];
  [v11 setObject:0 forKey:@"RTDefaultsSessionMetricManagerDidArriveSafelyKey"];

  double v12 = [(SMSessionMetricManager *)self defaultsManager];
  [v12 setObject:0 forKey:@"RTDefaultsSessionMetricManagerSosTriggeredKey"];

  id v13 = [(SMSessionMetricManager *)self defaultsManager];
  [v13 setObject:0 forKey:@"RTDefaultsSessionMetricManagerUserEndedSessionKey"];

  id v14 = [(SMSessionMetricManager *)self defaultsManager];
  [v14 setObject:0 forKey:@"RTDefaultsSessionMetricManagerPreviousCrowFliesETAKey"];

  id v15 = [(SMSessionMetricManager *)self defaultsManager];
  [v15 setObject:0 forKey:@"RTDefaultsSessionMetricManagerPreviousMapsExpectedETAKey"];

  id v16 = [(SMSessionMetricManager *)self defaultsManager];
  [v16 setObject:0 forKey:@"RTDefaultsSessionMetricManagerEtaUpdateStateQueueKey"];

  double v17 = [(SMSessionMetricManager *)self defaultsManager];
  [v17 setObject:0 forKey:@"RTDefaultsSessionMetricManagerEtaUpdateSubmissionQueueKey"];

  v18 = [(SMSessionMetricManager *)self defaultsManager];
  [v18 setObject:0 forKey:@"RTDefaultsSessionMetricManagerSessionTypeKey"];

  v19 = [(SMSessionMetricManager *)self defaultsManager];
  [v19 setObject:0 forKey:@"RTDefaultsSessionMetricManagerDidHandoffOccurKey"];

  uint64_t v20 = [(SMSessionMetricManager *)self defaultsManager];
  [v20 setObject:0 forKey:@"RTDefaultsSessionMetricManagerWasActiveAtStartKey"];

  v21 = [(SMSessionMetricManager *)self defaultsManager];
  [v21 setObject:0 forKey:@"RTDefaultsSessionMetricManagerWasActiveAtEndKey"];

  double v22 = [(SMSessionMetricManager *)self defaultsManager];
  [v22 setObject:0 forKey:@"RTDefaultsSessionMetricManagerDidTriggerOccurKey"];

  v23 = [(SMSessionMetricManager *)self defaultsManager];
  [v23 setObject:0 forKey:@"RTDefaultsSessionMetricManagerDestinationLocationTypeEnumKey"];

  v24 = [(SMSessionMetricManager *)self defaultsManager];
  [v24 setObject:0 forKey:@"RTDefaultsSessionMetricManagerFirstAnomalyTriggerCategoryEnumKey"];

  v25 = [(SMSessionMetricManager *)self defaultsManager];
  [v25 setObject:0 forKey:@"RTDefaultsSessionMetricManagerInitialDistanceKey"];

  v26 = [(SMSessionMetricManager *)self defaultsManager];
  [v26 setObject:0 forKey:@"RTDefaultsSessionMetricManagerMostRecentLocationDistanceKey"];

  double v27 = [(SMSessionMetricManager *)self defaultsManager];
  [v27 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumExtensionsKey"];

  v28 = [(SMSessionMetricManager *)self defaultsManager];
  [v28 setObject:0 forKey:@"RTDefaultsSessionMetricManagerOriginalNominalTravelTimeKey"];

  v29 = [(SMSessionMetricManager *)self defaultsManager];
  [v29 setObject:0 forKey:@"RTDefaultsSessionMetricManagerOriginatingLocationTypeKey"];

  id v30 = [(SMSessionMetricManager *)self defaultsManager];
  [v30 setObject:0 forKey:@"RTDefaultsSessionMetricManagerRatioOfFirstAnomalyDistanceToTotalDistanceKey"];

  dispatch_queue_t v31 = [(SMSessionMetricManager *)self defaultsManager];
  [v31 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumAnomalyPromptKey"];

  id v32 = [(SMSessionMetricManager *)self defaultsManager];
  [v32 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumAnomalyPromptDuringHysteresisKey"];

  v33 = [(SMSessionMetricManager *)self defaultsManager];
  [v33 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumHandoffKey"];

  id v34 = [(SMSessionMetricManager *)self defaultsManager];
  [v34 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumLPMSeparationKey"];

  objc_super v35 = [(SMSessionMetricManager *)self defaultsManager];
  [v35 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumTakeoverKey"];

  v36 = [(SMSessionMetricManager *)self defaultsManager];
  [v36 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumUnsupportedDeviceSeparationKey"];

  v37 = [(SMSessionMetricManager *)self defaultsManager];
  [v37 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumUserDisabledConnectivityKey"];

  v38 = [(SMSessionMetricManager *)self defaultsManager];
  [v38 setObject:0 forKey:@"RTDefaultsSessionMetricManagerDidWorkoutEndKey"];

  v39 = [(SMSessionMetricManager *)self defaultsManager];
  [v39 setObject:0 forKey:@"RTDefaultsSessionMetricManagerDidWorkoutPauseKey"];

  v40 = [(SMSessionMetricManager *)self defaultsManager];
  [v40 setObject:0 forKey:@"RTDefaultsSessionMetricManagerIsWorkoutAlwaysOnKey"];

  v41 = [(SMSessionMetricManager *)self defaultsManager];
  [v41 setObject:0 forKey:@"RTDefaultsSessionMetricManagerModeOfTransportationKey"];

  v42 = [(SMSessionMetricManager *)self defaultsManager];
  [v42 setObject:0 forKey:@"RTDefaultsSessionMetricManagerNumRecipientsKey"];

  v43 = [(SMSessionMetricManager *)self defaultsManager];
  [v43 setObject:0 forKey:@"RTDefaultsSessionMetricManagerWorkoutActivityTypeStringKey"];

  [(SMSessionMetricManager *)self _setup];
}

- (id)_createDestinationMetricDictionary
{
  v2 = objc_opt_new();
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"sessionDuration"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"anyTrigger"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"actualETAScaleFactor"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"initialETA"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"maxCrowFliesETAScaleFactor"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"maxMapsExpectedETAScaleFactor"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"noProgressTriggered"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"routeDeviationTriggered"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"safeArrivalOccurred"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"SOSTriggered"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"userEndedSession"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"nominalTravelTimeRemainingDifference"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"nominalTravelTimeRemaining"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"distanceRemainingDifference"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"distanceRemaining"];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"nominalTravelTimeShorter"];
  [v2 setObject:v3 forKeyedSubscript:@"remainingDistanceShorter"];
  [v2 setObject:v3 forKeyedSubscript:@"shouldUpdateUpperBoundETA"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"nominalTravelTimeRemainingDifferencePrior"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"nominalTravelTimeRemainingPrior"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"distanceRemainingDifferencePrior"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"distanceRemainingPrior"];
  [v2 setObject:v3 forKeyedSubscript:@"nominalTravelTimeShorterPrior"];
  [v2 setObject:v3 forKeyedSubscript:@"remainingDistanceShorterPrior"];
  [v2 setObject:v3 forKeyedSubscript:@"shouldUpdateUpperBoundETAPrior"];
  [v2 setObject:v3 forKeyedSubscript:@"didHandoffOccur"];
  [v2 setObject:v3 forKeyedSubscript:@"wasActiveAtStart"];
  [v2 setObject:v3 forKeyedSubscript:@"wasActiveAtEnd"];

  return v2;
}

- (id)_createInitiatorPerSessionDetailsMetricDictionary
{
  v2 = objc_opt_new();
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numExtensions"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"originalNominalTravelTime"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"originatingLocationTypeEnum"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"sessionDuration"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"ratioOfFirstAnomalyDistanceToTotalDistance"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"destinationLocationTypeEnum"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"didAnomalyPrompt"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"didSafeArrival"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"firstAnomalyTriggerCategoryEnum"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"sessionTypeEnum"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"sessionStartTimeOfDay"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numAnomalyPrompt"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numAnomalyPromptDuringHysteresis"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numHandoff"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numLPMSeparation"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numTakeover"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numUnsupportedDeviceSeparation"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numUserDisabledConnectivity"];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"didWorkoutEnd"];
  [v2 setObject:v3 forKeyedSubscript:@"didWorkoutPause"];
  [v2 setObject:v3 forKeyedSubscript:@"isCellularActivated"];
  [v2 setObject:v3 forKeyedSubscript:@"isStandalone"];
  [v2 setObject:v3 forKeyedSubscript:@"isWorkoutAlwaysOn"];
  [v2 setObject:&unk_1F3451D88 forKeyedSubscript:@"modeOfTransportation"];
  [v2 setObject:&unk_1F3451D70 forKeyedSubscript:@"numRecipients"];
  [v2 setObject:v3 forKeyedSubscript:@"wasActiveAtEnd"];
  [v2 setObject:v3 forKeyedSubscript:@"wasActiveAtStart"];
  [v2 setObject:@"Unknown" forKeyedSubscript:@"workoutActivityTypeString"];

  return v2;
}

- (void)_updateETASubmissionStates
{
  id v4 = [(SMSessionMetricManager *)self etaUpdateStateQueue];
  uint64_t v3 = (void *)[v4 copy];
  [(SMSessionMetricManager *)self setEtaUpdateSubmissionQueue:v3];
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4 = a3;
  v5 = [(SMSessionMetricManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SMSessionMetricManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__SMSessionMetricManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDailyMetricsNotification:*(void *)(a1 + 40)];
}

- (id)getLocationsForInterval:(id)a3 nearBoundingLocation:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29 = v6;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v6 horizontalAccuracy:0 batchSize:v7 boundingBoxLocation:250.0];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__124;
  v37 = __Block_byref_object_dispose__124;
  id v38 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v10 = [(SMSessionMetricManager *)self locationManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__SMSessionMetricManager_getLocationsForInterval_nearBoundingLocation___block_invoke;
  v30[3] = &unk_1E6B90700;
  id v32 = &v33;
  v11 = v9;
  dispatch_queue_t v31 = v11;
  [v10 fetchStoredLocationsWithOptions:v8 handler:v30];

  double v12 = v11;
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v12, v14))
  {
    id v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    v18 = objc_opt_new();
    v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
    uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    v21 = [v20 filteredArrayUsingPredicate:v19];
    double v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v39 count:1];
    v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26) {
  }
    }

  id v27 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v27;
}

void __71__SMSessionMetricManager_getLocationsForInterval_nearBoundingLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getRTLocationOfInterestForCLLocation:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v27 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v26];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__124;
  v42 = __Block_byref_object_dispose__124;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__124;
  v36 = __Block_byref_object_dispose__124;
  id v37 = 0;
  v5 = [(SMSessionMetricManager *)self learnedLocationManager];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__SMSessionMetricManager_getRTLocationOfInterestForCLLocation___block_invoke;
  v28[3] = &unk_1E6B90B28;
  id v30 = &v38;
  dispatch_queue_t v31 = &v32;
  id v6 = v4;
  v29 = v6;
  [v5 fetchLocationOfInterestAtLocation:v27 handler:v28];

  id v7 = (id *)(v33 + 5);
  id v8 = (id)v33[5];
  dispatch_semaphore_t v9 = v6;
  v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    double v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSinceDate:v10];
    double v14 = v13;
    id v15 = objc_opt_new();
    double v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
    double v17 = [MEMORY[0x1E4F29060] callStackSymbols];
    v18 = [v17 filteredArrayUsingPredicate:v16];
    v19 = [v18 firstObject];

    [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v44 count:1];
    v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

    if (v23)
    {
      id v8 = v23;
    }
  }

  objc_storeStrong(v7, v8);
  id v24 = (id)v39[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __63__SMSessionMetricManager_getRTLocationOfInterestForCLLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_gatherSessionDestinationStats:(id)a3
{
  uint64_t v225 = *MEMORY[0x1E4F143B8];
  id v146 = a3;
  v159 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v207 = 0;
  v208 = &v207;
  uint64_t v209 = 0x3032000000;
  v210 = __Block_byref_object_copy__124;
  v211 = __Block_byref_object_dispose__124;
  id v212 = 0;
  id v4 = objc_alloc(MEMORY[0x1E4F99920]);
  LOBYTE(v144) = 0;
  v145 = (void *)[v4 initWithBatchSize:*MEMORY[0x1E4F99C08] fetchLimit:*MEMORY[0x1E4F99C08] sortBySessionStartDate:0 ascending:0 sessionTypes:&unk_1F34532B8 timeInADayInterval:0 pickOneConfigInTimeInADayInterval:v144 dateInterval:v146 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];
  uint64_t v201 = 0;
  id v202 = &v201;
  uint64_t v203 = 0x3032000000;
  v204 = __Block_byref_object_copy__124;
  __int16 v205 = __Block_byref_object_dispose__124;
  id v206 = 0;
  id v5 = [(SMSessionMetricManager *)self sessionStore];
  v197[0] = MEMORY[0x1E4F143A8];
  v197[1] = 3221225472;
  v197[2] = __57__SMSessionMetricManager__gatherSessionDestinationStats___block_invoke;
  v197[3] = &unk_1E6B905F0;
  v199 = &v201;
  v200 = &v207;
  id v6 = v3;
  v198 = v6;
  [v5 fetchSessionConfigurationsWithOptions:v145 handler:v197];

  uint64_t v7 = (id *)(v208 + 5);
  id v8 = (id)v208[5];
  dsema = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  intptr_t v11 = dispatch_semaphore_wait(dsema, v10);
  id v12 = (uint64_t *)MEMORY[0x1E4F5CFE8];
  if (v11)
  {
    double v13 = [MEMORY[0x1E4F1C9C8] now];
    [v13 timeIntervalSinceDate:v9];
    double v15 = v14;
    double v16 = objc_opt_new();
    double v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
    v18 = [MEMORY[0x1E4F29060] callStackSymbols];
    v19 = [v18 filteredArrayUsingPredicate:v17];
    uint64_t v20 = [v19 firstObject];

    [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    double v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v216 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v216 count:1];
    id v24 = [v22 errorWithDomain:*v12 code:15 userInfo:v23];

    if (v24)
    {
      id v8 = v24;
    }
  }

  objc_storeStrong(v7, v8);
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  obuint64_t j = (id)v202[5];
  uint64_t v170 = [obj countByEnumeratingWithState:&v193 objects:v222 count:16];
  if (v170)
  {
    uint64_t v168 = *(void *)v194;
    uint64_t v158 = *MEMORY[0x1E4F99C10];
    uint64_t v155 = *v12;
    uint64_t v156 = *MEMORY[0x1E4F28568];
    uint64_t v153 = *MEMORY[0x1E4F99A50];
    uint64_t v151 = *MEMORY[0x1E4F99A58];
    uint64_t v152 = *MEMORY[0x1E4F99A68];
    uint64_t v150 = *MEMORY[0x1E4F99A60];
    uint64_t v149 = *MEMORY[0x1E4F99A78];
    uint64_t v148 = *MEMORY[0x1E4F99A70];
    do
    {
      for (uint64_t i = 0; i != v170; ++i)
      {
        if (*(void *)v194 != v168) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v193 + 1) + 8 * i);
        context = (void *)MEMORY[0x1E016D870]();
        if ([v25 sessionType] == 2)
        {
          id v26 = [v25 sessionID];
          BOOL v27 = v26 == 0;

          if (!v27)
          {
            v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v29 = [v25 sessionID];
              *(_DWORD *)buf = 136446466;
              *(void *)&uint8_t buf[4] = "-[SMSessionMetricManager _gatherSessionDestinationStats:]";
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v29;
              _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%{public}s, fetching session states for sessionID %{public}@", buf, 0x16u);
            }
            id v30 = objc_alloc(MEMORY[0x1E4F99998]);
            dispatch_queue_t v31 = [v25 sessionID];
            v166 = (void *)[v30 initWithBatchSize:v158 fetchLimit:v158 sortByCreationDate:1 ascending:1 dateInterval:0 sessionState:0 locationBoundingBox:0 boundingBoxRadius:0 sessionIdentifier:v31];

            *(void *)buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x2020000000;
            char v221 = 0;
            uint64_t v216 = 0;
            v217 = &v216;
            uint64_t v218 = 0x2020000000;
            char v219 = 0;
            dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
            uint64_t v33 = [(SMSessionMetricManager *)self currentDeviceIdentifier];
            uint64_t v34 = [(SMSessionMetricManager *)self sessionStore];
            v187[0] = MEMORY[0x1E4F143A8];
            v187[1] = 3221225472;
            v187[2] = __57__SMSessionMetricManager__gatherSessionDestinationStats___block_invoke_666;
            v187[3] = &unk_1E6B9AA90;
            v191 = buf;
            id v35 = v33;
            v192 = &v216;
            id v164 = v35;
            id v188 = v35;
            v189 = v25;
            v36 = v32;
            v190 = v36;
            [v34 fetchSessionManagerStatesWithOptions:v166 handler:v187];

            id v37 = (id *)(v208 + 5);
            id v38 = (id)v208[5];
            v171 = v36;
            uint64_t v39 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v40 = dispatch_time(0, 3600000000000);
            if (dispatch_semaphore_wait(v171, v40))
            {
              uint64_t v41 = [MEMORY[0x1E4F1C9C8] now];
              [v41 timeIntervalSinceDate:v39];
              double v43 = v42;
              uint64_t v44 = objc_opt_new();
              v45 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
              uint64_t v46 = [MEMORY[0x1E4F29060] callStackSymbols];
              v47 = [v46 filteredArrayUsingPredicate:v45];
              v48 = [v47 firstObject];

              [v44 submitToCoreAnalytics:v48 type:1 duration:v43];
              v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v224 = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v224, 2u);
              }

              v50 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v223 = v156;
              *(void *)v224 = @"semaphore wait timeout";
              v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v224 forKeys:&v223 count:1];
              v52 = [v50 errorWithDomain:v155 code:15 userInfo:v51];

              if (v52)
              {
                id v38 = v52;
              }
            }

            objc_storeStrong(v37, v38);
            v172 = [v25 destination];
            id v53 = objc_alloc(MEMORY[0x1E4F28C18]);
            v54 = [v25 sessionStartDate];
            v165 = (void *)[v53 initWithStartDate:v54 endDate:v159];

            v55 = [(SMSessionMetricManager *)self getLocationsForInterval:v165 nearBoundingLocation:0];
            double v56 = v55;
            if (v55 && [v55 count])
            {
              v157 = v56;
              v167 = [v56 objectAtIndexedSubscript:0];
              id v57 = objc_alloc(MEMORY[0x1E4F28C18]);
              v58 = [v25 sessionStartDate];
              v59 = [v167 timestamp];
              v160 = (void *)[v57 initWithStartDate:v58 endDate:v59];

              [v160 duration];
              if (v60 <= 10.0)
              {
                double v61 = [v172 eta];
                [v61 expectedTravelTime];
                double v63 = v62;
                uint64_t v64 = [v172 eta];
                [v64 additionalTravelTime];
                double v66 = v65;

                double v67 = v63 + v66;
                if (v63 + v66 > 0.0)
                {
                  long long v185 = 0u;
                  long long v186 = 0u;
                  long long v183 = 0u;
                  long long v184 = 0u;
                  id v161 = v157;
                  uint64_t v68 = [v161 countByEnumeratingWithState:&v183 objects:v215 count:16];
                  if (v68)
                  {
                    char v69 = 0;
                    uint64_t v70 = *(void *)v184;
                    double v71 = -1.0;
                    double v72 = -1.0;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v68; ++j)
                      {
                        if (*(void *)v184 != v70) {
                          objc_enumerationMutation(v161);
                        }
                        v74 = *(void **)(*((void *)&v183 + 1) + 8 * j);
                        v75 = (void *)MEMORY[0x1E016D870]();
                        v76 = [v172 clLocation];
                        [v76 distanceFromLocation:v74];
                        double v78 = v77;

                        [v167 distanceFromLocation:v74];
                        double v80 = v79;
                        [v172 radius];
                        double v82 = v81;
                        if (v78 < v81)
                        {
                          id v83 = objc_alloc(MEMORY[0x1E4F28C18]);
                          v84 = [v25 sessionStartDate];
                          v85 = [v74 timestamp];
                          v86 = (void *)[v83 initWithStartDate:v84 endDate:v85];

                          [v86 duration];
                          double v88 = v87;

                          double v72 = v88 / v67;
                        }
                        if (!((v80 <= 250.0) | v69 & 1))
                        {
                          id v89 = objc_alloc(MEMORY[0x1E4F28C18]);
                          v90 = [v25 sessionStartDate];
                          v91 = [v74 timestamp];
                          v92 = (void *)[v89 initWithStartDate:v90 endDate:v91];

                          [v92 duration];
                          double v71 = v93;

                          char v69 = 1;
                        }
                        if (v78 < v82)
                        {
                          unsigned int v154 = 1;
                          goto LABEL_39;
                        }
                      }
                      uint64_t v68 = [v161 countByEnumeratingWithState:&v183 objects:v215 count:16];
                      if (v68) {
                        continue;
                      }
                      break;
                    }
                    unsigned int v154 = 0;
                  }
                  else
                  {
                    unsigned int v154 = 0;
                    double v71 = -1.0;
                    double v72 = -1.0;
                  }
LABEL_39:

                  double v94 = [(SMSessionMetricManager *)self getRTLocationOfInterestForCLLocation:v167];
                  long long v181 = 0u;
                  long long v182 = 0u;
                  long long v179 = 0u;
                  long long v180 = 0u;
                  v95 = [v94 visits];
                  uint64_t v96 = [v95 countByEnumeratingWithState:&v179 objects:v214 count:16];
                  double v97 = -1.0;
                  if (v96)
                  {
                    uint64_t v98 = *(void *)v180;
                    while (2)
                    {
                      for (uint64_t k = 0; k != v96; ++k)
                      {
                        if (*(void *)v180 != v98) {
                          objc_enumerationMutation(v95);
                        }
                        v100 = *(void **)(*((void *)&v179 + 1) + 8 * k);
                        v101 = [v100 exitDate];
                        v102 = [v25 sessionStartDate];
                        BOOL v103 = [v101 compare:v102] == 1;

                        if (v103)
                        {
                          id v104 = objc_alloc(MEMORY[0x1E4F28C18]);
                          v105 = [v25 sessionStartDate];
                          v106 = [v100 exitDate];
                          v107 = (void *)[v104 initWithStartDate:v105 endDate:v106];

                          [v107 duration];
                          double v97 = v108;

                          goto LABEL_49;
                        }
                      }
                      uint64_t v96 = [v95 countByEnumeratingWithState:&v179 objects:v214 count:16];
                      if (v96) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_49:

                  double v109 = [v25 destination];
                  v110 = [v109 clLocation];
                  id v162 = [(SMSessionMetricManager *)self getRTLocationOfInterestForCLLocation:v110];

                  long long v177 = 0u;
                  long long v178 = 0u;
                  long long v175 = 0u;
                  long long v176 = 0u;
                  v111 = [v162 visits];
                  uint64_t v112 = [v111 countByEnumeratingWithState:&v175 objects:v213 count:16];
                  if (v112)
                  {
                    uint64_t v113 = *(void *)v176;
                    while (2)
                    {
                      for (uint64_t m = 0; m != v112; ++m)
                      {
                        if (*(void *)v176 != v113) {
                          objc_enumerationMutation(v111);
                        }
                        v115 = *(void **)(*((void *)&v175 + 1) + 8 * m);
                        v116 = [v115 entryDate];
                        v117 = [v25 sessionStartDate];
                        BOOL v118 = [v116 compare:v117] == 1;

                        if (v118)
                        {
                          id v119 = objc_alloc(MEMORY[0x1E4F28C18]);
                          v120 = [v25 sessionStartDate];
                          v121 = [v115 entryDate];
                          v122 = (void *)[v119 initWithStartDate:v120 endDate:v121];

                          [v122 duration];
                          double v124 = v123;
                          v125 = [v172 eta];
                          [v125 expectedTravelTime];
                          double v127 = v126;
                          v128 = [v172 eta];
                          [v128 additionalTravelTime];
                          double v130 = v129;

                          int v131 = v154 ^ 1;
                          if (v124 / (v127 + v130) < v72) {
                            int v131 = 1;
                          }
                          if (v131) {
                            double v72 = v124 / (v127 + v130);
                          }
                          v154 |= v131;
                          goto LABEL_63;
                        }
                      }
                      uint64_t v112 = [v111 countByEnumeratingWithState:&v175 objects:v213 count:16];
                      if (v112) {
                        continue;
                      }
                      break;
                    }
                  }

LABEL_63:
                  if (v71 == -1.0) {
                    double v132 = -1.0;
                  }
                  else {
                    double v132 = v71 / 60.0;
                  }
                  if (v97 == -1.0) {
                    double v133 = -1.0;
                  }
                  else {
                    double v133 = v97 / 60.0;
                  }
                  v134 = objc_opt_new();
                  v135 = [NSNumber numberWithBool:v154];
                  [v134 setObject:v135 forKeyedSubscript:v153];

                  v136 = [NSNumber numberWithDouble:v72];
                  [v134 setObject:v136 forKeyedSubscript:v152];

                  v137 = [NSNumber numberWithDouble:v133];
                  [v134 setObject:v137 forKeyedSubscript:v151];

                  v138 = [NSNumber numberWithDouble:v132];
                  [v134 setObject:v138 forKeyedSubscript:v150];

                  v139 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)&buf[8] + 24)];
                  [v134 setObject:v139 forKeyedSubscript:v149];

                  v140 = [NSNumber numberWithBool:*((unsigned __int8 *)v217 + 24)];
                  [v134 setObject:v140 forKeyedSubscript:v148];

                  id v141 = [NSString alloc];
                  v142 = (void *)[v141 initWithCString:RTAnalyticsEventSafetyMonitorInitiatorExitAndArrivalMetrics encoding:1];
                  log_analytics_submission(v142, v134);
                  v143 = [NSString stringWithFormat:@"com.apple.%@", v142];
                  AnalyticsSendEvent();
                }
              }

              double v56 = v157;
            }

            _Block_object_dispose(&v216, 8);
            _Block_object_dispose(buf, 8);
          }
        }
      }
      uint64_t v170 = [obj countByEnumeratingWithState:&v193 objects:v222 count:16];
    }
    while (v170);
  }

  _Block_object_dispose(&v201, 8);
  _Block_object_dispose(&v207, 8);
}

void __57__SMSessionMetricManager__gatherSessionDestinationStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  if (!v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__SMSessionMetricManager__gatherSessionDestinationStats___block_invoke_666(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 count];
  if (!a3 && v6)
  {
    uint64_t v7 = [v5 firstObject];
    id v8 = [v7 activeDeviceIdentifier];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 isEqual:*(void *)(a1 + 32)];

    id v9 = [v5 lastObject];
    id v10 = [v9 activeDeviceIdentifier];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v10 isEqual:*(void *)(a1 + 32)];
  }
  intptr_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [v5 count];
    double v13 = [*(id *)(a1 + 40) sessionID];
    int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    int v16 = 136447234;
    double v17 = "-[SMSessionMetricManager _gatherSessionDestinationStats:]_block_invoke";
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 1024;
    int v23 = v14;
    __int16 v24 = 1024;
    int v25 = v15;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%{public}s, found %lu states for %@, wasActiveAtStart %{Bool}d, wasActiveAtEnd %{Bool}d", (uint8_t *)&v16, 0x2Cu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_onDailyMetricsNotification:(id)a3
{
  v177[1] = *MEMORY[0x1E4F143B8];
  id v102 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v102;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, received notification, %@", buf, 0x16u);
  }
  v116 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v112 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v116 sinceDate:-86400.0];
  v111 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v116 sinceDate:-604800.0];
  v110 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v116 sinceDate:-2419200.0];
  double v108 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v116 sinceDate:-4838400.0];
  uint64_t v164 = 0;
  v165 = &v164;
  uint64_t v166 = 0x2020000000;
  uint64_t v167 = 0;
  uint64_t v160 = 0;
  id v161 = &v160;
  uint64_t v162 = 0x2020000000;
  uint64_t v163 = 0;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  uint64_t v159 = 0;
  uint64_t v151 = 0;
  uint64_t v152 = 0;
  uint64_t v153 = &v152;
  uint64_t v154 = 0x2020000000;
  uint64_t v155 = 0;
  uint64_t v148 = 0;
  uint64_t v149 = &v148;
  uint64_t v150 = 0x2020000000;
  uint64_t v144 = 0;
  v145 = &v144;
  uint64_t v146 = 0x2020000000;
  uint64_t v147 = 0;
  uint64_t v140 = 0;
  id v141 = &v140;
  uint64_t v142 = 0x2020000000;
  uint64_t v143 = 0;
  uint64_t v136 = 0;
  v137 = &v136;
  uint64_t v138 = 0x2020000000;
  uint64_t v139 = 0;
  v107 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v112 endDate:v116];
  v106 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v111 endDate:v112];
  id v104 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v110 endDate:v111];
  BOOL v103 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v108 endDate:v110];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v174 = __Block_byref_object_copy__124;
  long long v175 = __Block_byref_object_dispose__124;
  id v176 = 0;
  id v8 = [(SMSessionMetricManager *)self sessionStore];
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke;
  v131[3] = &unk_1E6B9AAB8;
  double v133 = &v164;
  v134 = &v148;
  v135 = buf;
  id v9 = v7;
  double v132 = v9;
  [v8 fetchSessionCountWithDateInterval:v107 handler:v131];

  dsema = v9;
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v11)) {
    goto LABEL_8;
  }
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceDate:v10];
  double v14 = v13;
  int v15 = objc_opt_new();
  int v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
  double v17 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v18 = [v17 filteredArrayUsingPredicate:v16];
  uint64_t v19 = [v18 firstObject];

  [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
  __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v168 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v168, 2u);
  }

  v21 = (void *)MEMORY[0x1E4F28C58];
  v177[0] = *MEMORY[0x1E4F28568];
  *(void *)uint64_t v168 = @"semaphore wait timeout";
  __int16 v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v177 count:1];
  int v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
LABEL_8:
    id v24 = 0;
  }

  id v25 = v24;
  v105 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v116 sinceDate:-172800.0];
  uint64_t v26 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v105 endDate:v112];
  [(SMSessionMetricManager *)self _gatherSessionDestinationStats:v26];
  v101 = (void *)v26;
  dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
  v28 = [(SMSessionMetricManager *)self sessionStore];
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_2;
  v126[3] = &unk_1E6B9AAB8;
  v128 = &v160;
  double v129 = &v144;
  double v130 = buf;
  v29 = v27;
  double v127 = v29;
  [v28 fetchSessionCountWithDateInterval:v106 handler:v126];

  double v114 = v29;
  id v30 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v31 = dispatch_time(0, 3600000000000);
  id v32 = v25;
  if (dispatch_semaphore_wait(v114, v31))
  {
    uint64_t v33 = [MEMORY[0x1E4F1C9C8] now];
    [v33 timeIntervalSinceDate:v30];
    double v35 = v34;
    v36 = objc_opt_new();
    id v37 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
    id v38 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v39 = [v38 filteredArrayUsingPredicate:v37];
    dispatch_time_t v40 = [v39 firstObject];

    [v36 submitToCoreAnalytics:v40 type:1 duration:v35];
    uint64_t v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v168 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v168, 2u);
    }

    double v42 = (void *)MEMORY[0x1E4F28C58];
    v177[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v168 = @"semaphore wait timeout";
    double v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v177 count:1];
    uint64_t v44 = [v42 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v43];

    id v32 = v25;
    if (v44)
    {
      id v32 = v44;
    }
  }

  id v45 = v32;
  dispatch_semaphore_t v46 = dispatch_semaphore_create(0);
  v47 = [(SMSessionMetricManager *)self sessionStore];
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_3;
  v121[3] = &unk_1E6B9AAB8;
  double v123 = &v156;
  double v124 = &v140;
  v125 = buf;
  v48 = v46;
  v122 = v48;
  [v47 fetchSessionCountWithDateInterval:v104 handler:v121];

  uint64_t v113 = v48;
  v49 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v50 = dispatch_time(0, 3600000000000);
  id v51 = v45;
  if (dispatch_semaphore_wait(v113, v50))
  {
    v52 = [MEMORY[0x1E4F1C9C8] now];
    [v52 timeIntervalSinceDate:v49];
    double v54 = v53;
    v55 = objc_opt_new();
    double v56 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
    id v57 = [MEMORY[0x1E4F29060] callStackSymbols];
    v58 = [v57 filteredArrayUsingPredicate:v56];
    v59 = [v58 firstObject];

    [v55 submitToCoreAnalytics:v59 type:1 duration:v54];
    double v60 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v168 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v168, 2u);
    }

    double v61 = (void *)MEMORY[0x1E4F28C58];
    v177[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v168 = @"semaphore wait timeout";
    double v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v177 count:1];
    double v63 = [v61 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v62];

    id v51 = v45;
    if (v63)
    {
      id v51 = v63;
    }
  }

  unint64_t v109 = (unint64_t)v51;
  dispatch_semaphore_t v64 = dispatch_semaphore_create(0);
  double v65 = [(SMSessionMetricManager *)self sessionStore];
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_4;
  v117[3] = &unk_1E6B9AAE0;
  id v119 = &v152;
  v120 = &v136;
  double v66 = v64;
  BOOL v118 = v66;
  [v65 fetchSessionCountWithDateInterval:v103 handler:v117];

  double v67 = (id *)(*(void *)&buf[8] + 40);
  id v68 = *(id *)(*(void *)&buf[8] + 40);
  char v69 = v66;
  uint64_t v70 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v71 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v69, v71))
  {
    double v72 = [MEMORY[0x1E4F1C9C8] now];
    [v72 timeIntervalSinceDate:v70];
    double v74 = v73;
    v75 = objc_opt_new();
    v76 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
    double v77 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v78 = [v77 filteredArrayUsingPredicate:v76];
    double v79 = [v78 firstObject];

    [v75 submitToCoreAnalytics:v79 type:1 duration:v74];
    double v80 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v168 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v80, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v168, 2u);
    }

    double v81 = (void *)MEMORY[0x1E4F28C58];
    v177[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v168 = @"semaphore wait timeout";
    double v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v177 count:1];
    id v83 = [v81 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v82];

    if (v83)
    {
      id v68 = v83;
    }
  }

  objc_storeStrong(v67, v68);
  if (*(void *)(*(void *)&buf[8] + 40) | v109)
  {
    v84 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      uint64_t v85 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v168 = 136315650;
      *(void *)&v168[4] = "-[SMSessionMetricManager _onDailyMetricsNotification:]";
      __int16 v169 = 2112;
      uint64_t v170 = v85;
      __int16 v171 = 2112;
      unint64_t v172 = v109;
      _os_log_error_impl(&dword_1D9BFA000, v84, OS_LOG_TYPE_ERROR, "%s, encountered errors fetching for session count, fetchError, %@, fetchTimeoutError, %@", v168, 0x20u);
    }
  }
  else
  {
    uint64_t v86 = v165[3] + v161[3];
    v161[3] = v86;
    uint64_t v87 = v157[3] + v86;
    v157[3] = v87;
    v153[3] += v87;
    uint64_t v88 = v149[3] + v145[3];
    v145[3] = v88;
    uint64_t v89 = v141[3] + v88;
    v141[3] = v89;
    v137[3] += v89;
    v84 = objc_opt_new();
    v90 = [NSNumber numberWithUnsignedInteger:v165[3]];
    [v84 setObject:v90 forKeyedSubscript:*MEMORY[0x1E4F99B10]];

    v91 = [NSNumber numberWithUnsignedInteger:v161[3]];
    [v84 setObject:v91 forKeyedSubscript:*MEMORY[0x1E4F99B78]];

    v92 = [NSNumber numberWithUnsignedInteger:v157[3]];
    [v84 setObject:v92 forKeyedSubscript:*MEMORY[0x1E4F99B70]];

    double v93 = [NSNumber numberWithUnsignedInteger:v153[3]];
    [v84 setObject:v93 forKeyedSubscript:*MEMORY[0x1E4F99B08]];

    double v94 = [NSNumber numberWithUnsignedInteger:v149[3]];
    [v84 setObject:v94 forKeyedSubscript:*MEMORY[0x1E4F99B38]];

    v95 = [NSNumber numberWithUnsignedInteger:v145[3]];
    [v84 setObject:v95 forKeyedSubscript:*MEMORY[0x1E4F99B48]];

    uint64_t v96 = [NSNumber numberWithUnsignedInteger:v141[3]];
    [v84 setObject:v96 forKeyedSubscript:*MEMORY[0x1E4F99B40]];

    double v97 = [NSNumber numberWithUnsignedInteger:v137[3]];
    [v84 setObject:v97 forKeyedSubscript:*MEMORY[0x1E4F99B30]];

    id v98 = [NSString alloc];
    double v99 = (void *)[v98 initWithCString:RTAnalyticsEventSafetyMonitorInitiatorSessionCount encoding:1];
    log_analytics_submission(v99, v84);
    v100 = [NSString stringWithFormat:@"com.apple.%@", v99, v101];
    AnalyticsSendEvent();
  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v140, 8);
  _Block_object_dispose(&v144, 8);
  _Block_object_dispose(&v148, 8);
  _Block_object_dispose(&v152, 8);
  _Block_object_dispose(&v156, 8);
  _Block_object_dispose(&v160, 8);
  _Block_object_dispose(&v164, 8);
}

void __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (!v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (!v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (!v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onSessionStartedWithState:(id)a3
{
  id v4 = a3;
  id v5 = [(SMSessionMetricManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SMSessionMetricManager_onSessionStartedWithState___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__SMSessionMetricManager_onSessionStartedWithState___block_invoke(uint64_t a1)
{
  v112[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    dispatch_semaphore_t v3 = [v2 configuration];
    id v4 = [v3 sessionStartDate];
    [*(id *)(a1 + 40) setSessionStartDate:v4];

    id v5 = [*(id *)(a1 + 32) configuration];
    [*(id *)(a1 + 40) setSessionType:[v5 sessionType]];

    id v6 = [*(id *)(a1 + 32) configuration];
    id v7 = [v6 destination];
    [*(id *)(a1 + 40) setSessionDestinationType:[v7 destinationType]];

    id v8 = [*(id *)(a1 + 32) activeDeviceIdentifier];
    id v9 = [*(id *)(a1 + 40) currentDeviceIdentifier];
    [*(id *)(a1 + 40) setWasActiveAtStart:objc_msgSend(v8, "isEqual:", v9)];

    id v10 = [*(id *)(a1 + 32) configuration];
    dispatch_time_t v11 = [v10 conversation];
    uint64_t v12 = [v11 receiverHandles];
    [*(id *)(a1 + 40) setNumRecipients:[v12 count]];

    double v13 = [*(id *)(a1 + 32) configuration];
    LODWORD(v11) = [v13 sessionType] == 2;

    double v14 = [*(id *)(a1 + 32) configuration];
    int v15 = v14;
    if (v11)
    {
      int v16 = [v14 destination];
      double v17 = [v16 eta];
      [v17 expectedTravelTime];
      [*(id *)(a1 + 40) setInitialDestinationExpectedTravelTime:];

      __int16 v18 = [*(id *)(a1 + 32) configuration];
      uint64_t v19 = [v18 destination];
      __int16 v20 = [v19 eta];
      [*(id *)(a1 + 40) setModeOfTransportation:[v20 transportType]];

      v21 = [*(id *)(a1 + 32) location];

      if (v21)
      {
        __int16 v22 = [*(id *)(a1 + 32) configuration];
        int v23 = [v22 destination];
        id v24 = [v23 location];

        if (v24)
        {
          id v25 = [*(id *)(a1 + 32) location];
          uint64_t v26 = [*(id *)(a1 + 32) configuration];
          dispatch_semaphore_t v27 = [v26 destination];
          v28 = [v27 clLocation];
          [v25 distanceFromLocation:v28];
          [*(id *)(a1 + 40) setInitialDistance:];
        }
        id v29 = objc_alloc(MEMORY[0x1E4F5CE00]);
        id v30 = [*(id *)(a1 + 32) location];
        dispatch_time_t v31 = (void *)[v29 initWithCLLocation:v30];

        dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
        *(void *)buf = 0;
        id v104 = buf;
        uint64_t v105 = 0x3032000000;
        v106 = __Block_byref_object_copy__124;
        v107 = __Block_byref_object_dispose__124;
        id v108 = 0;
        uint64_t v97 = 0;
        id v98 = (id *)&v97;
        uint64_t v99 = 0x3032000000;
        v100 = __Block_byref_object_copy__124;
        v101 = __Block_byref_object_dispose__124;
        id v102 = 0;
        uint64_t v33 = [*(id *)(a1 + 40) learnedLocationManager];
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __52__SMSessionMetricManager_onSessionStartedWithState___block_invoke_674;
        v93[3] = &unk_1E6B90B28;
        v95 = buf;
        uint64_t v96 = &v97;
        double v34 = v32;
        double v94 = v34;
        [v33 fetchLocationOfInterestAtLocation:v31 handler:v93];

        double v35 = v34;
        v36 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v37 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v35, v37)) {
          goto LABEL_18;
        }
        id v38 = [MEMORY[0x1E4F1C9C8] now];
        [v38 timeIntervalSinceDate:v36];
        double v40 = v39;
        uint64_t v41 = objc_opt_new();
        double v42 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
        double v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v44 = [v43 filteredArrayUsingPredicate:v42];
        id v45 = [v44 firstObject];

        [v41 submitToCoreAnalytics:v45 type:1 duration:v40];
        dispatch_semaphore_t v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)unint64_t v109 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v109, 2u);
        }

        v47 = (void *)MEMORY[0x1E4F28C58];
        v112[0] = *MEMORY[0x1E4F28568];
        *(void *)unint64_t v109 = @"semaphore wait timeout";
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v112 count:1];
        v49 = [v47 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v48];

        if (v49)
        {
          id v50 = v49;

          char v51 = 0;
        }
        else
        {
LABEL_18:
          id v50 = 0;
          char v51 = 1;
        }

        id v62 = v50;
        if ((v51 & 1) == 0) {
          objc_storeStrong(v98 + 5, v50);
        }
        if (v98[5])
        {
          double v63 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            id v91 = v98[5];
            *(_DWORD *)unint64_t v109 = 136315394;
            *(void *)&v109[4] = "-[SMSessionMetricManager onSessionStartedWithState:]_block_invoke_2";
            __int16 v110 = 2112;
            id v111 = v91;
            _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "%s, attempt to fetch LOI at location failed with error, %@", v109, 0x16u);
          }
        }
        dispatch_semaphore_t v64 = (void *)*((void *)v104 + 5);
        if (v64)
        {
          double v65 = [v64 place];
          BOOL v66 = v65 == 0;

          if (!v66)
          {
            double v67 = [*((id *)v104 + 5) place];
            [*(id *)(a1 + 40) setOriginatingLocationTypeEnum:[v67 type]];
          }
        }

        _Block_object_dispose(&v97, 8);
        _Block_object_dispose(buf, 8);
      }
      id v68 = [*(id *)(a1 + 32) configuration];
      char v69 = [v68 destination];
      uint64_t v70 = [v69 eta];
      if (v70)
      {
        dispatch_time_t v71 = [*(id *)(a1 + 32) configuration];
        double v72 = [v71 destination];
        double v73 = [v72 eta];
        [v73 expectedTravelTime];
        BOOL v75 = v74 > 0.0;

        if (v75)
        {
          v76 = [*(id *)(a1 + 32) configuration];
          double v77 = [v76 destination];
          double v78 = [v77 eta];
          [v78 expectedTravelTime];
          [*(id *)(a1 + 40) setOriginalNominalTravelTime:];

          double v79 = [*(id *)(a1 + 32) configuration];
          double v80 = [v79 destination];
          double v81 = [v80 eta];
          [v81 additionalTravelTime];
          BOOL v83 = v82 > 0.0;

          if (v83)
          {
            v84 = (id *)(a1 + 40);
            [*(id *)(a1 + 40) originalNominalTravelTime];
            double v86 = v85;
            uint64_t v87 = [*(id *)(a1 + 32) configuration];
            uint64_t v88 = [v87 destination];
            uint64_t v89 = [v88 eta];
            [v89 additionalTravelTime];
            [*v84 setOriginalNominalTravelTime:v86 + v90];
          }
        }
      }
      else
      {
      }
    }
    else
    {
      uint64_t v53 = [v14 sessionType];

      if (v53 == 4)
      {
        double v54 = [*(id *)(a1 + 32) configuration];
        [v54 sessionWorkoutType];
        v55 = _HKWorkoutActivityNameForActivityType();
        [*(id *)(a1 + 40) setWorkoutActivityTypeString:v55];

        double v56 = (void *)MEMORY[0x1E4F2B718];
        id v57 = [*(id *)(a1 + 32) configuration];
        uint64_t v58 = [v57 sessionWorkoutType];
        v59 = [MEMORY[0x1E4F1C9C8] now];
        double v60 = [MEMORY[0x1E4F1C9C8] now];
        id v92 = [v56 workoutWithActivityType:v58 startDate:v59 endDate:v60];

        double v61 = [MEMORY[0x1E4F61C88] effectiveActivityTypeWithWorkout:v92];
        [*(id *)(a1 + 40) setIsWorkoutAlwaysOn:[v61 supportsSafetyCheckInPrompt]];
      }
    }
  }
  else
  {
    v52 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }
  }
}

void __52__SMSessionMetricManager_onSessionStartedWithState___block_invoke_674(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onSessionChangedWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SMSessionMetricManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SMSessionMetricManager_onSessionChangedWithConfiguration___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__SMSessionMetricManager_onSessionChangedWithConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumExtensions:(*(id *)(a1 + 32) numExtensions) + 1];
  id v3 = [*(id *)(a1 + 40) conversation];
  v2 = [v3 receiverHandles];
  [*(id *)(a1 + 32) setNumRecipients:[v2 count]];
}

- (void)onSessionTerminationResult:(BOOL)a3 reason:(unint64_t)a4 error:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(SMSessionMetricManager *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SMSessionMetricManager_onSessionTerminationResult_reason_error___block_invoke;
  v11[3] = &unk_1E6B9AB08;
  BOOL v14 = a3;
  id v12 = v8;
  unint64_t v13 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(v9, v11);
}

uint64_t __66__SMSessionMetricManager_onSessionTerminationResult_reason_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2 == 1)
    {
      [*(id *)(a1 + 32) setDidArriveSafely:1];
    }
    else if (v2 == 5 || v2 == 2)
    {
      [*(id *)(a1 + 32) setUserEndedSession:1];
    }
  }
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 32);

  return [v7 _submitTerminationMetricsWithSuccess:v4 reason:v5 error:v6];
}

- (void)onBecomingActiveDevice:(id)a3
{
  uint64_t v4 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SMSessionMetricManager_onBecomingActiveDevice___block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __49__SMSessionMetricManager_onBecomingActiveDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidHandoffOccur:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 numTakeover] + 1;

  return [v2 setNumTakeover:v3];
}

- (void)onBecomingNonActiveDevice:(id)a3
{
  uint64_t v4 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SMSessionMetricManager_onBecomingNonActiveDevice___block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __52__SMSessionMetricManager_onBecomingNonActiveDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidHandoffOccur:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 numHandoff] + 1;

  return [v2 setNumHandoff:v3];
}

- (void)onSessionEndedForActiveDevice:(BOOL)a3
{
  uint64_t v5 = [(SMSessionMetricManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SMSessionMetricManager_onSessionEndedForActiveDevice___block_invoke;
  v6[3] = &unk_1E6B90F08;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __56__SMSessionMetricManager_onSessionEndedForActiveDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setWasActiveAtEnd:*(unsigned __int8 *)(a1 + 40)];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setSessionEndDate:v2];
}

- (void)onLPMSeparation
{
  uint64_t v3 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SMSessionMetricManager_onLPMSeparation__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__SMSessionMetricManager_onLPMSeparation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 numLPMSeparation] + 1;

  return [v1 setNumLPMSeparation:v2];
}

- (void)onUnsupportedDeviceSeparation
{
  uint64_t v3 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SMSessionMetricManager_onUnsupportedDeviceSeparation__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__SMSessionMetricManager_onUnsupportedDeviceSeparation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 numUnsupportedDeviceSeparation] + 1;

  return [v1 setNumUnsupportedDeviceSeparation:v2];
}

- (void)onUserDisabledConnectivity
{
  uint64_t v3 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SMSessionMetricManager_onUserDisabledConnectivity__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__SMSessionMetricManager_onUserDisabledConnectivity__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 numUserDisabledConnectivity] + 1;

  return [v1 setNumUserDisabledConnectivity:v2];
}

- (void)cacheMostRecentLocationDistance:(double)a3
{
  uint64_t v5 = [(SMSessionMetricManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SMSessionMetricManager_cacheMostRecentLocationDistance___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __58__SMSessionMetricManager_cacheMostRecentLocationDistance___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMostRecentLocationDistance:*(double *)(a1 + 40)];
}

- (void)onCrowFliesETAUpdate:(double)a3
{
  uint64_t v5 = [(SMSessionMetricManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SMSessionMetricManager_onCrowFliesETAUpdate___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __47__SMSessionMetricManager_onCrowFliesETAUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) maxCrowFliesScaleFactor];
  if (v2 >= 0.0)
  {
    double v5 = *(double *)(a1 + 40);
    [*(id *)(a1 + 32) previousCrowFliesETA];
    double v7 = v5 / v6;
    [*(id *)(a1 + 32) maxCrowFliesScaleFactor];
    if (v7 >= v4) {
      double v4 = v7;
    }
    uint64_t v3 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    double v4 = 1.0;
  }
  [v3 setMaxCrowFliesScaleFactor:v4];
  double v8 = *(double *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 32);

  return [v9 setPreviousCrowFliesETA:v8];
}

- (void)onMapsETAUpdate:(double)a3
{
  double v5 = [(SMSessionMetricManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SMSessionMetricManager_onMapsETAUpdate___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __42__SMSessionMetricManager_onMapsETAUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) maxMapsETAScaleFactor];
  if (v2 >= 0.0)
  {
    double v5 = *(double *)(a1 + 40);
    [*(id *)(a1 + 32) previousMapsExpectedETA];
    double v7 = v5 / v6;
    [*(id *)(a1 + 32) maxMapsETAScaleFactor];
    if (v7 >= v4) {
      double v4 = v7;
    }
    uint64_t v3 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    double v4 = 1.0;
  }
  [v3 setMaxMapsETAScaleFactor:v4];
  double v8 = *(double *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 32);

  return [v9 setPreviousMapsExpectedETA:v8];
}

- (void)onShouldUpdateETAUpperBoundWithETAUpdateState:(id)a3
{
  id v4 = a3;
  double v5 = [(SMSessionMetricManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SMSessionMetricManager_onShouldUpdateETAUpperBoundWithETAUpdateState___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__SMSessionMetricManager_onShouldUpdateETAUpperBoundWithETAUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) etaUpdateStateQueue];
  id v3 = (id)[v2 enqueueObject:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) etaUpdateStateQueue];

  if (v4)
  {
    double v5 = (void *)MEMORY[0x1E4F28DB0];
    id v6 = [*(id *)(a1 + 32) etaUpdateStateQueue];
    id v12 = 0;
    double v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:0 error:&v12];
    id v8 = v12;

    if (v8)
    {
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v8 description];
        *(_DWORD *)buf = 136315394;
        BOOL v14 = "-[SMSessionMetricManager onShouldUpdateETAUpperBoundWithETAUpdateState:]_block_invoke";
        __int16 v15 = 2112;
        int v16 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%s, error archiving etaUpdateStateQueue, error, %@", buf, 0x16u);
      }
    }
    id v10 = [*(id *)(a1 + 32) defaultsManager];
    [v10 setObject:v7 forKey:@"RTDefaultsSessionMetricManagerEtaUpdateStateQueueKey"];
  }
}

- (void)updateClosestTimeIntervalToExceedingETAWithTimeInterval:(double)a3
{
  double v5 = [(SMSessionMetricManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SMSessionMetricManager_updateClosestTimeIntervalToExceedingETAWithTimeInterval___block_invoke;
  v6[3] = &unk_1E6B91248;
  *(double *)&void v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

uint64_t __82__SMSessionMetricManager_updateClosestTimeIntervalToExceedingETAWithTimeInterval___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) closestTimeIntervalToExceedingETA];
  if (v2 < v4)
  {
    uint64_t result = [*(id *)(a1 + 32) didDestinationAnomalyTrigger];
    if ((result & 1) == 0)
    {
      [*(id *)(a1 + 32) setClosestTimeIntervalToExceedingETA:*(double *)(a1 + 40)];
      double v5 = *(void **)(a1 + 32);
      return [v5 _updateETASubmissionStates];
    }
  }
  return result;
}

- (void)onDeclareAnomalyForTriggerCategory:(unint64_t)a3
{
  double v5 = [(SMSessionMetricManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SMSessionMetricManager_onDeclareAnomalyForTriggerCategory___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __61__SMSessionMetricManager_onDeclareAnomalyForTriggerCategory___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumAnomalyPrompt:[*(id *)(a1 + 32) numAnomalyPrompt] + 1];
  double v2 = [*(id *)(a1 + 32) defaultsManager];
  uint64_t v3 = [v2 objectForKey:@"RTDefaultsSessionManagerHysteresisEventTypeKey"];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [*(id *)(a1 + 32) defaultsManager];
    id v6 = [v5 objectForKey:@"RTDefaultsSessionManagerHysteresisEventTypeKey"];
    uint64_t v7 = [v6 unsignedIntegerValue];

    if (v7) {
      [*(id *)(a1 + 32) setNumAnomalyPromptDuringHysteresis: *(id *)(a1 + 32) numAnomalyPromptDuringHysteresis] + 1);
    }
  }
  else
  {
  }
  if (([*(id *)(a1 + 32) didTriggerOccur] & 1) == 0)
  {
    if ([MEMORY[0x1E4F99968] isValidAnomaly:*(void *)(a1 + 40)])
    {
      [*(id *)(a1 + 32) setFirstAnomalyTriggerCategoryEnum:*(void *)(a1 + 40)];
      if ([*(id *)(a1 + 32) sessionType] == 2)
      {
        [*(id *)(a1 + 32) initialDistance];
        if (v8 > 0.0)
        {
          [*(id *)(a1 + 32) mostRecentLocationDistance];
          if (v9 > 0.0)
          {
            [*(id *)(a1 + 32) mostRecentLocationDistance];
            double v11 = v10;
            [*(id *)(a1 + 32) initialDistance];
            [*(id *)(a1 + 32) setRatioOfFirstAnomalyDistanceToTotalDistance:v11 / v12];
          }
        }
      }
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if ((unint64_t)(v13 - 10) >= 5)
  {
    if (v13 == 3)
    {
      uint64_t v17 = *(void **)(a1 + 32);
      return [v17 setNoProgressTriggered:1];
    }
    else if (v13 == 4)
    {
      int v16 = *(void **)(a1 + 32);
      return [v16 setRouteDeviationTriggered:1];
    }
    else
    {
      __int16 v18 = *(void **)(a1 + 32);
      return [v18 setDidDestinationAnomalyTrigger:1];
    }
  }
  else
  {
    BOOL v14 = *(void **)(a1 + 32);
    return [v14 setSosTriggered:1];
  }
}

- (void)onWorkoutEnded
{
  uint64_t v3 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SMSessionMetricManager_onWorkoutEnded__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __40__SMSessionMetricManager_onWorkoutEnded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDidWorkoutEnd:1];
}

- (void)onWorkoutPaused
{
  uint64_t v3 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SMSessionMetricManager_onWorkoutPaused__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__SMSessionMetricManager_onWorkoutPaused__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDidWorkoutPause:1];
}

- (void)onUserActionWithRemoteCommand:(int64_t)a3 remoteCommandType:(int64_t)a4 error:(int64_t)a5 errorDomain:(id)a6
{
  id v10 = a6;
  double v11 = [(SMSessionMetricManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__SMSessionMetricManager_onUserActionWithRemoteCommand_remoteCommandType_error_errorDomain___block_invoke;
  block[3] = &unk_1E6B9AB30;
  int64_t v15 = a3;
  int64_t v16 = a4;
  int64_t v17 = a5;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(v11, block);
}

void __92__SMSessionMetricManager_onUserActionWithRemoteCommand_remoteCommandType_error_errorDomain___block_invoke(uint64_t a1)
{
  id v13 = (id)objc_opt_new();
  double v2 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v13 setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F99AC0]];

  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  [v13 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F99AC8]];

  double v4 = [NSNumber numberWithBool:[*(id *)(a1 + 32) _isCellularActivated]];
  [v13 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F99AE0]];

  double v5 = [NSNumber numberWithBool:[*(id *)(a1 + 32) _isStandalone]];
  [v13 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F99AE8]];

  uint64_t v6 = *MEMORY[0x1E4F99AF0];
  if (*(void *)(a1 + 64))
  {
    [v13 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v6];
    uint64_t v7 = [NSNumber numberWithLong:*(void *)(a1 + 64)];
    [v13 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F99AD0]];

    double v8 = *(__CFString **)(a1 + 40);
    uint64_t v9 = *MEMORY[0x1E4F99AD8];
  }
  else
  {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v6];
    [v13 setObject:&unk_1F3451DB8 forKeyedSubscript:*MEMORY[0x1E4F99AD0]];
    uint64_t v9 = *MEMORY[0x1E4F99AD8];
    double v8 = @"Unknown";
  }
  [v13 setObject:v8 forKeyedSubscript:v9];
  id v10 = [NSString alloc];
  double v11 = (void *)[v10 initWithCString:RTAnalyticsEventSafetyMonitorRemoteUserActionsMetrics encoding:1];
  log_analytics_submission(v11, v13);
  id v12 = [NSString stringWithFormat:@"com.apple.%@", v11];
  AnalyticsSendEvent();
}

- (BOOL)_isCellularActivated
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = dispatch_get_global_queue(2, 0);
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  id v30 = __46__SMSessionMetricManager__isCellularActivated__block_invoke;
  dispatch_time_t v31 = &unk_1E6B979A8;
  uint64_t v33 = &v34;
  double v4 = v2;
  dispatch_semaphore_t v32 = v4;
  +[SMInitiatorEligibility checkCellularEnabledWithQueue:v3 handler:&v28];

  double v5 = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] now:v28, v29, v30, v31];
  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(v5, v7)) {
    goto LABEL_6;
  }
  double v8 = [MEMORY[0x1E4F1C9C8] now];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;
  double v11 = objc_opt_new();
  id v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_98];
  id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v14 = [v13 filteredArrayUsingPredicate:v12];
  int64_t v15 = [v14 firstObject];

  [v11 submitToCoreAnalytics:v15 type:1 duration:v10];
  int64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  int64_t v17 = (void *)MEMORY[0x1E4F28C58];
  v43[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v43 count:1];
  uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v18];

  if (v19)
  {
    id v20 = v19;
  }
  else
  {
LABEL_6:
    id v20 = 0;
  }

  id v21 = v20;
  if (v21)
  {
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_t v27 = [v21 description];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v26;
      __int16 v39 = 2080;
      double v40 = "-[SMSessionMetricManager _isCellularActivated]";
      __int16 v41 = 2112;
      double v42 = v27;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@,%s,sema error,%@", buf, 0x20u);
    }
  }
  BOOL v23 = *((unsigned char *)v35 + 24) != 0;

  _Block_object_dispose(&v34, 8);
  return v23;
}

intptr_t __46__SMSessionMetricManager__isCellularActivated__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isStandalone
{
  id v3 = objc_alloc(MEMORY[0x1E4F99850]);
  double v4 = [(SMSessionMetricManager *)self queue];
  double v5 = (void *)[v3 initWithQueue:v4];

  LOBYTE(v4) = [v5 isEffectivePairedDeviceNearby] ^ 1;
  return (char)v4;
}

- (void)setDidTriggerOccur:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didTriggerOccur = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerDidTriggerOccurKey"];
}

- (void)initialDistance:(double)a3
{
  self->_initialDistance = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerInitialDistanceKey"];
}

- (void)setSessionDestinationType:(unint64_t)a3
{
  self->_sessionDestinationType = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerDestinationLocationTypeEnumKey"];
}

- (void)setRatioOfFirstAnomalyDistanceToTotalDistance:(double)a3
{
  self->_ratioOfFirstAnomalyDistanceToTotalDistance = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerRatioOfFirstAnomalyDistanceToTotalDistanceKey"];
}

- (void)setMostRecentLocationDistance:(double)a3
{
  self->_mostRecentLocationDistance = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerMostRecentLocationDistanceKey"];
}

- (void)setOriginalNominalTravelTime:(double)a3
{
  self->_originalNominalTravelTime = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerOriginalNominalTravelTimeKey"];
}

- (void)setOriginatingLocationTypeEnum:(unint64_t)a3
{
  self->_originatingLocationTypeEnuuint64_t m = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerOriginatingLocationTypeKey"];
}

- (void)setFirstAnomalyTriggerCategoryEnum:(unint64_t)a3
{
  self->_firstAnomalyTriggerCategoryEnuuint64_t m = a3;
  [(SMSessionMetricManager *)self setDidTriggerOccur:1];
  id v6 = [(SMSessionMetricManager *)self defaultsManager];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  [v6 setObject:v5 forKey:@"RTDefaultsSessionMetricManagerFirstAnomalyTriggerCategoryEnumKey"];
}

- (void)setNumExtensions:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_numExtensions = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithInt:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumExtensionsKey"];
}

- (void)setSessionStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartDate, a3);
  id v5 = a3;
  id v6 = [(SMSessionMetricManager *)self defaultsManager];
  [v6 setObject:v5 forKey:@"RTDefaultsSessionMetricManagerSessionStartDateKey"];
}

- (void)setSessionEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEndDate, a3);
  id v5 = a3;
  id v6 = [(SMSessionMetricManager *)self defaultsManager];
  [v6 setObject:v5 forKey:@"RTDefaultsSessionMetricManagerSessionEndDateKey"];

  [(SMSessionMetricManager *)self submitMetrics];
}

- (void)setInitialDestinationExpectedTravelTime:(double)a3
{
  self->_initialDestinationExpectedTravelTime = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerInitialDestinationExpectedTravelTimeKey"];
}

- (void)setMaxCrowFliesScaleFactor:(double)a3
{
  self->_maxCrowFliesScaleFactor = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerMaxCrowFliesScaleFactorKey"];
}

- (void)setMaxMapsETAScaleFactor:(double)a3
{
  self->_maxMapsETAScaleFactor = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerMaxMapsETAScaleFactorKey"];
}

- (void)setClosestTimeIntervalToExceedingETA:(double)a3
{
  self->_closestTimeIntervalToExceedingETA = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerClosestTimeIntervalToExceedingETAKey"];
}

- (void)setDidDestinationAnomalyTrigger:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didDestinationAnomalyTrigger = a3;
  [(SMSessionMetricManager *)self setDidTriggerOccur:1];
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  id v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"RTDefaultsSessionMetricManagerDidDestinationAnomalyTriggerKey"];

  if (v3)
  {
    [(SMSessionMetricManager *)self _updateETASubmissionStates];
  }
}

- (void)setNoProgressTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  self->_noProgressTriggered = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  id v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"RTDefaultsSessionMetricManagerNoProgressTriggeredKey"];

  [(SMSessionMetricManager *)self setDidDestinationAnomalyTrigger:1];
}

- (void)setRouteDeviationTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  self->_routeDeviationTriggered = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  id v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"RTDefaultsSessionMetricManagerRouteDeviationTriggeredKey"];

  [(SMSessionMetricManager *)self setDidDestinationAnomalyTrigger:1];
}

- (void)setDidArriveSafely:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didArriveSafely = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerDidArriveSafelyKey"];
}

- (void)setSosTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  self->_sosTriggered = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  id v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"RTDefaultsSessionMetricManagerSosTriggeredKey"];

  [(SMSessionMetricManager *)self setDidTriggerOccur:1];
  if (v3)
  {
    [(SMSessionMetricManager *)self _updateETASubmissionStates];
  }
}

- (void)setUserEndedSession:(BOOL)a3
{
  BOOL v3 = a3;
  self->_userEndedSession = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerUserEndedSessionKey"];
}

- (void)setPreviousCrowFliesETA:(double)a3
{
  self->_previousCrowFliesETA = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerPreviousCrowFliesETAKey"];
}

- (void)setPreviousMapsExpectedETA:(double)a3
{
  self->_previousMapsExpectedETA = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerPreviousMapsExpectedETAKey"];
}

- (void)setEtaUpdateStateQueue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_etaUpdateStateQueue, a3);
  etaUpdateStateQueue = self->_etaUpdateStateQueue;
  if (etaUpdateStateQueue)
  {
    id v12 = 0;
    dispatch_time_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:etaUpdateStateQueue requiringSecureCoding:0 error:&v12];
    id v8 = v12;
    if (v8)
    {
      double v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        double v11 = [v8 description];
        *(_DWORD *)buf = 136315394;
        id v14 = "-[SMSessionMetricManager setEtaUpdateStateQueue:]";
        __int16 v15 = 2112;
        int64_t v16 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%s, error archiving etaUpdateStateQueue, error, %@", buf, 0x16u);
      }
    }
    double v10 = [(SMSessionMetricManager *)self defaultsManager];
    [v10 setObject:v7 forKey:@"RTDefaultsSessionMetricManagerEtaUpdateStateQueueKey"];
  }
}

- (void)setEtaUpdateSubmissionQueue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_etaUpdateSubmissionQueue, a3);
  etaUpdateSubmissionQueue = self->_etaUpdateSubmissionQueue;
  if (etaUpdateSubmissionQueue)
  {
    id v12 = 0;
    dispatch_time_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:etaUpdateSubmissionQueue requiringSecureCoding:0 error:&v12];
    id v8 = v12;
    if (v8)
    {
      double v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        double v11 = [v8 description];
        *(_DWORD *)buf = 136315394;
        id v14 = "-[SMSessionMetricManager setEtaUpdateSubmissionQueue:]";
        __int16 v15 = 2112;
        int64_t v16 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%s, error archiving etaUpdateSubmissionQueue, error, %@", buf, 0x16u);
      }
    }
    double v10 = [(SMSessionMetricManager *)self defaultsManager];
    [v10 setObject:v7 forKey:@"RTDefaultsSessionMetricManagerEtaUpdateSubmissionQueueKey"];
  }
}

- (void)setDidHandoffOccur:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didHandoffOccur = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerDidHandoffOccurKey"];
}

- (void)setWasActiveAtStart:(BOOL)a3
{
  BOOL v3 = a3;
  self->_wasActiveAtStart = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerWasActiveAtStartKey"];
}

- (void)setWasActiveAtEnd:(BOOL)a3
{
  BOOL v3 = a3;
  self->_wasActiveAtEnd = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerWasActiveAtEndKey"];
}

- (void)setNumAnomalyPrompt:(unint64_t)a3
{
  self->_numAnomalyPrompt = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumAnomalyPromptKey"];
}

- (void)setNumAnomalyPromptDuringHysteresis:(unint64_t)a3
{
  self->_numAnomalyPromptDuringHysteresis = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumAnomalyPromptDuringHysteresisKey"];
}

- (void)setNumHandoff:(unint64_t)a3
{
  self->_numHandoff = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumHandoffKey"];
}

- (void)setNumLPMSeparation:(unint64_t)a3
{
  self->_numLPMSeparation = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumLPMSeparationKey"];
}

- (void)setNumTakeover:(unint64_t)a3
{
  self->_numTakeover = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumTakeoverKey"];
}

- (void)setNumUnsupportedDeviceSeparation:(unint64_t)a3
{
  self->_numUnsupportedDeviceSeparation = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumUnsupportedDeviceSeparationKey"];
}

- (void)setNumUserDisabledConnectivity:(unint64_t)a3
{
  self->_numUserDisabledConnectivity = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumUserDisabledConnectivityKey"];
}

- (void)setDidWorkoutEnd:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didWorkoutEnd = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerDidWorkoutEndKey"];
}

- (void)setDidWorkoutPause:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didWorkoutPause = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerDidWorkoutPauseKey"];
}

- (void)setIsWorkoutAlwaysOn:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isWorkoutAlwaysOn = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerIsWorkoutAlwaysOnKey"];
}

- (void)setModeOfTransportation:(unint64_t)a3
{
  self->_modeOfTransportation = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerModeOfTransportationKey"];
}

- (void)setNumRecipients:(unint64_t)a3
{
  self->_numRecipients = a3;
  id v5 = [(SMSessionMetricManager *)self defaultsManager];
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"RTDefaultsSessionMetricManagerNumRecipientsKey"];
}

- (void)setWorkoutActivityTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_workoutActivityTypeString, a3);
  id v5 = a3;
  id v6 = [(SMSessionMetricManager *)self defaultsManager];
  [v6 setObject:v5 forKey:@"RTDefaultsSessionMetricManagerWorkoutActivityTypeStringKey"];
}

- (id)collectDestinationSessionMetrics
{
  BOOL v3 = [(SMSessionMetricManager *)self _createDestinationMetricDictionary];
  double v4 = [(SMSessionMetricManager *)self sessionEndDate];
  id v5 = [(SMSessionMetricManager *)self sessionStartDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  id v8 = [NSNumber numberWithDouble:v7];
  [v3 setObject:v8 forKeyedSubscript:@"sessionDuration"];

  double v9 = NSNumber;
  BOOL v10 = [(SMSessionMetricManager *)self didDestinationAnomalyTrigger]
     || [(SMSessionMetricManager *)self noProgressTriggered]
     || [(SMSessionMetricManager *)self routeDeviationTriggered]
     || [(SMSessionMetricManager *)self sosTriggered];
  double v11 = [v9 numberWithInt:v10];
  [v3 setObject:v11 forKeyedSubscript:@"anyTrigger"];

  id v12 = NSNumber;
  [(SMSessionMetricManager *)self initialDestinationExpectedTravelTime];
  id v14 = [v12 numberWithDouble:v7 / v13];
  [v3 setObject:v14 forKeyedSubscript:@"actualETAScaleFactor"];

  __int16 v15 = NSNumber;
  [(SMSessionMetricManager *)self initialDestinationExpectedTravelTime];
  int64_t v16 = [v15 numberWithDouble:x0];
  [v3 setObject:v16 forKeyedSubscript:@"initialETA"];

  uint64_t v17 = NSNumber;
  [(SMSessionMetricManager *)self maxCrowFliesScaleFactor];
  __int16 v18 = [v17 numberWithDouble:];
  [v3 setObject:v18 forKeyedSubscript:@"maxCrowFliesETAScaleFactor"];

  uint64_t v19 = NSNumber;
  [(SMSessionMetricManager *)self maxMapsETAScaleFactor];
  id v20 = [v19 numberWithDouble:];
  [v3 setObject:v20 forKeyedSubscript:@"maxMapsExpectedETAScaleFactor"];

  id v21 = [NSNumber numberWithBool:-[SMSessionMetricManager noProgressTriggered](self, "noProgressTriggered")];
  [v3 setObject:v21 forKeyedSubscript:@"noProgressTriggered"];

  __int16 v22 = [NSNumber numberWithBool:-[SMSessionMetricManager routeDeviationTriggered](self, "routeDeviationTriggered")];
  [v3 setObject:v22 forKeyedSubscript:@"routeDeviationTriggered"];

  BOOL v23 = [[NSNumber numberWithBool:-[SMSessionMetricManager didArriveSafely](self, "didArriveSafely")];
  [v3 setObject:v23 forKeyedSubscript:@"safeArrivalOccurred"];

  id v24 = [NSNumber numberWithBool:-[SMSessionMetricManager sosTriggered](self, "sosTriggered")];
  [v3 setObject:v24 forKeyedSubscript:@"SOSTriggered"];

  id v25 = [NSNumber numberWithBool:-[SMSessionMetricManager userEndedSession](self, "userEndedSession")];
  [v3 setObject:v25 forKeyedSubscript:@"userEndedSession"];

  id v26 = [NSNumber numberWithBool:-[SMSessionMetricManager didHandoffOccur](self, "didHandoffOccur")];
  [v3 setObject:v26 forKeyedSubscript:@"didHandoffOccur"];

  dispatch_semaphore_t v27 = [NSNumber numberWithBool:-[SMSessionMetricManager wasActiveAtStart](self, "wasActiveAtStart")];
  [v3 setObject:v27 forKeyedSubscript:@"wasActiveAtStart"];

  uint64_t v28 = [NSNumber numberWithBool:-[SMSessionMetricManager wasActiveAtEnd](self, "wasActiveAtEnd")];
  [v3 setObject:v28 forKeyedSubscript:@"wasActiveAtEnd"];

  uint64_t v29 = [(SMSessionMetricManager *)self etaUpdateSubmissionQueue];
  unint64_t v30 = [v29 count];

  dispatch_time_t v31 = [(SMSessionMetricManager *)self etaUpdateSubmissionQueue];
  dispatch_semaphore_t v32 = v31;
  if (v30 < 2)
  {
    uint64_t v58 = [v31 count];

    if (!v58) {
      goto LABEL_10;
    }
    v59 = [(SMSessionMetricManager *)self etaUpdateSubmissionQueue];
    uint64_t v33 = [v59 dequeueObject];

    double v60 = NSNumber;
    [v33 nominalTravelTimeDifference];
    double v61 = [v60 numberWithDouble:];
    [v3 setObject:v61 forKeyedSubscript:@"nominalTravelTimeRemainingDifference"];

    id v62 = NSNumber;
    [v33 nominalTravelTimeRemaining];
    double v63 = [v62 numberWithDouble:];
    [v3 setObject:v63 forKeyedSubscript:@"nominalTravelTimeRemaining"];

    dispatch_semaphore_t v64 = NSNumber;
    [v33 distanceDifference];
    double v65 = [v64 numberWithDouble:];
    [v3 setObject:v65 forKeyedSubscript:@"distanceRemainingDifference"];

    BOOL v66 = NSNumber;
    [v33 distanceRemaining];
    double v67 = [v66 numberWithDouble:];
    [v3 setObject:v67 forKeyedSubscript:@"distanceRemaining"];

    id v68 = [NSNumber numberWithBool:[v33 nominalTravelTimeShorter]];
    [v3 setObject:v68 forKeyedSubscript:@"nominalTravelTimeShorter"];

    char v69 = [NSNumber numberWithBool:[v33 remainingDistanceShorter]];
    [v3 setObject:v69 forKeyedSubscript:@"remainingDistanceShorter"];

    double v35 = [NSNumber numberWithBool:[v33 shouldUpdateETAUpperBound]];
    [v3 setObject:v35 forKeyedSubscript:@"shouldUpdateUpperBoundETA"];
  }
  else
  {
    uint64_t v33 = [v31 dequeueObject];

    uint64_t v34 = [(SMSessionMetricManager *)self etaUpdateSubmissionQueue];
    double v35 = [v34 dequeueObject];

    uint64_t v36 = NSNumber;
    [v33 nominalTravelTimeDifference];
    char v37 = [v36 numberWithDouble:x0];
    [v3 setObject:v37 forKeyedSubscript:@"nominalTravelTimeRemainingDifferencePrior"];

    id v38 = NSNumber;
    [v33 nominalTravelTimeRemaining];
    __int16 v39 = [v38 numberWithDouble:];
    [v3 setObject:v39 forKeyedSubscript:@"nominalTravelTimeRemainingPrior"];

    double v40 = NSNumber;
    [v33 distanceDifference];
    __int16 v41 = [v40 numberWithDouble:];
    [v3 setObject:v41 forKeyedSubscript:@"distanceRemainingDifferencePrior"];

    double v42 = NSNumber;
    [v33 distanceRemaining];
    double v43 = [v42 numberWithDouble:];
    [v3 setObject:v43 forKeyedSubscript:@"distanceRemainingPrior"];

    uint64_t v44 = [NSNumber numberWithBool:[v33 nominalTravelTimeShorter]];
    [v3 setObject:v44 forKeyedSubscript:@"nominalTravelTimeShorterPrior"];

    id v45 = [NSNumber numberWithBool:[v33 remainingDistanceShorter]];
    [v3 setObject:v45 forKeyedSubscript:@"remainingDistanceShorterPrior"];

    dispatch_semaphore_t v46 = [NSNumber numberWithBool:[v33 shouldUpdateETAUpperBound]];
    [v3 setObject:v46 forKeyedSubscript:@"shouldUpdateUpperBoundETAPrior"];

    v47 = NSNumber;
    [v35 nominalTravelTimeDifference];
    v48 = [v47 numberWithDouble:x0];
    [v3 setObject:v48 forKeyedSubscript:@"nominalTravelTimeRemainingDifference"];

    v49 = NSNumber;
    [v35 nominalTravelTimeRemaining];
    id v50 = [v49 numberWithDouble:];
    [v3 setObject:v50 forKeyedSubscript:@"nominalTravelTimeRemaining"];

    char v51 = NSNumber;
    [v35 distanceDifference];
    v52 = [v51 numberWithDouble:];
    [v3 setObject:v52 forKeyedSubscript:@"distanceRemainingDifference"];

    uint64_t v53 = NSNumber;
    [v35 distanceRemaining];
    double v54 = [v53 numberWithDouble:x0];
    [v3 setObject:v54 forKeyedSubscript:@"distanceRemaining"];

    v55 = [NSNumber numberWithBool:[v35 nominalTravelTimeShorter]];
    [v3 setObject:v55 forKeyedSubscript:@"nominalTravelTimeShorter"];

    double v56 = [[NSNumber numberWithBool:[v35 remainingDistanceShorter]];
    [v3 setObject:v56 forKeyedSubscript:@"remainingDistanceShorter"];

    id v57 = [NSNumber numberWithBool:[v35 shouldUpdateETAUpperBound]];
    [v3 setObject:v57 forKeyedSubscript:@"shouldUpdateUpperBoundETA"];
  }
LABEL_10:

  return v3;
}

- (id)collectInitiatorPerSessionMetrics
{
  BOOL v3 = objc_opt_new();
  double v4 = [(SMSessionMetricManager *)self sessionEndDate];
  id v5 = [(SMSessionMetricManager *)self sessionStartDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  id v8 = [NSNumber numberWithInt:-[SMSessionMetricManager numExtensions](self, "numExtensions")];
  [v3 setObject:v8 forKeyedSubscript:@"numExtensions"];

  double v9 = NSNumber;
  [(SMSessionMetricManager *)self originalNominalTravelTime];
  BOOL v10 = [v9 numberWithDouble:];
  [v3 setObject:v10 forKeyedSubscript:@"originalNominalTravelTime"];

  double v11 = [[NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager originatingLocationTypeEnum](self, "originatingLocationTypeEnum")];
  [v3 setObject:v11 forKeyedSubscript:@"originatingLocationTypeEnum"];

  id v12 = [NSNumber numberWithDouble:v7];
  [v3 setObject:v12 forKeyedSubscript:@"sessionDuration"];

  double v13 = NSNumber;
  [(SMSessionMetricManager *)self ratioOfFirstAnomalyDistanceToTotalDistance];
  id v14 = [v13 numberWithDouble:];
  [v3 setObject:v14 forKeyedSubscript:@"ratioOfFirstAnomalyDistanceToTotalDistance"];

  __int16 v15 = [[NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager sessionDestinationType](self, "sessionDestinationType")];
  [v3 setObject:v15 forKeyedSubscript:@"destinationLocationTypeEnum"];

  int64_t v16 = [NSNumber numberWithBool:-[SMSessionMetricManager didTriggerOccur](self, "didTriggerOccur")];
  [v3 setObject:v16 forKeyedSubscript:@"didAnomalyPrompt"];

  uint64_t v17 = [NSNumber numberWithBool:-[SMSessionMetricManager didArriveSafely](self, "didArriveSafely")];
  [v3 setObject:v17 forKeyedSubscript:@"didSafeArrival"];

  __int16 v18 = [NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager firstAnomalyTriggerCategoryEnum](self, "firstAnomalyTriggerCategoryEnum")];
  [v3 setObject:v18 forKeyedSubscript:@"firstAnomalyTriggerCategoryEnum"];

  uint64_t v19 = [[NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager sessionType](self, "sessionType")];
  [v3 setObject:v19 forKeyedSubscript:@"sessionTypeEnum"];

  id v20 = [NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager numAnomalyPrompt](self, "numAnomalyPrompt")];
  [v3 setObject:v20 forKeyedSubscript:@"numAnomalyPrompt"];

  id v21 = [NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager numAnomalyPromptDuringHysteresis](self, "numAnomalyPromptDuringHysteresis")];
  [v3 setObject:v21 forKeyedSubscript:@"numAnomalyPromptDuringHysteresis"];

  __int16 v22 = [NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager numHandoff](self, "numHandoff")];
  [v3 setObject:v22 forKeyedSubscript:@"numHandoff"];

  BOOL v23 = [[NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager numLPMSeparation](self, "numLPMSeparation")];
  [v3 setObject:v23 forKeyedSubscript:@"numLPMSeparation"];

  id v24 = [NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager numTakeover](self, "numTakeover")];
  [v3 setObject:v24 forKeyedSubscript:@"numTakeover"];

  id v25 = [NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager numUnsupportedDeviceSeparation](self, "numUnsupportedDeviceSeparation")];
  [v3 setObject:v25 forKeyedSubscript:@"numUnsupportedDeviceSeparation"];

  id v26 = [NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager numUserDisabledConnectivity](self, "numUserDisabledConnectivity")];
  [v3 setObject:v26 forKeyedSubscript:@"numUserDisabledConnectivity"];

  dispatch_semaphore_t v27 = [NSNumber numberWithBool:-[SMSessionMetricManager didWorkoutEnd](self, "didWorkoutEnd")];
  [v3 setObject:v27 forKeyedSubscript:@"didWorkoutEnd"];

  uint64_t v28 = [NSNumber numberWithBool:-[SMSessionMetricManager didWorkoutPause](self, "didWorkoutPause")];
  [v3 setObject:v28 forKeyedSubscript:@"didWorkoutPause"];

  uint64_t v29 = [NSNumber numberWithBool:-[SMSessionMetricManager _isCellularActivated](self, "_isCellularActivated")];
  [v3 setObject:v29 forKeyedSubscript:@"isCellularActivated"];

  unint64_t v30 = [NSNumber numberWithBool:-[SMSessionMetricManager _isStandalone](self, "_isStandalone")];
  [v3 setObject:v30 forKeyedSubscript:@"isStandalone"];

  dispatch_time_t v31 = [MEMORY[0x1E4F74230] sharedConnection];
  LODWORD(v5) = [v31 isHealthDataSubmissionAllowed];

  if (v5)
  {
    dispatch_semaphore_t v32 = [NSNumber numberWithBool:-[SMSessionMetricManager isWorkoutAlwaysOn](self, "isWorkoutAlwaysOn")];
    [v3 setObject:v32 forKeyedSubscript:@"isWorkoutAlwaysOn"];
  }
  uint64_t v33 = [NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager modeOfTransportation](self, "modeOfTransportation")];
  [v3 setObject:v33 forKeyedSubscript:@"modeOfTransportation"];

  uint64_t v34 = [[NSNumber numberWithUnsignedInteger:-[SMSessionMetricManager numRecipients](self, "numRecipients")];
  [v3 setObject:v34 forKeyedSubscript:@"numRecipients"];

  double v35 = [[NSNumber numberWithBool:-[SMSessionMetricManager wasActiveAtEnd](self, "wasActiveAtEnd")];
  [v3 setObject:v35 forKeyedSubscript:@"wasActiveAtEnd"];

  uint64_t v36 = [NSNumber numberWithBool:-[SMSessionMetricManager wasActiveAtStart](self, "wasActiveAtStart")];
  [v3 setObject:v36 forKeyedSubscript:@"wasActiveAtStart"];

  char v37 = [MEMORY[0x1E4F74230] sharedConnection];
  int v38 = [v37 isHealthDataSubmissionAllowed];

  if (v38)
  {
    uint64_t v39 = [(SMSessionMetricManager *)self workoutActivityTypeString];
    double v40 = (void *)v39;
    if (v39) {
      __int16 v41 = (__CFString *)v39;
    }
    else {
      __int16 v41 = @"Unknown";
    }
    [v3 setObject:v41 forKeyedSubscript:@"workoutActivityTypeString"];
  }
  double v42 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v43 = [(SMSessionMetricManager *)self sessionStartDate];
  uint64_t v44 = [v42 components:32 fromDate:v43];

  uint64_t v45 = [v44 hour];
  dispatch_semaphore_t v46 = [NSNumber numberWithInteger:v45];
  [v3 setObject:v46 forKeyedSubscript:@"sessionStartTimeOfDay"];

  return v3;
}

- (void)submitMetrics
{
  if ([(SMSessionMetricManager *)self sessionType] == 2)
  {
    BOOL v3 = [(SMSessionMetricManager *)self collectDestinationSessionMetrics];
    id v4 = [NSString alloc];
    id v5 = (void *)[v4 initWithCString:RTAnalyticsEventSessionMonitorMetrics encoding:1];
    log_analytics_submission(v5, v3);
    double v6 = [NSString stringWithFormat:@"com.apple.%@", v5];
    AnalyticsSendEvent();
  }
  id v10 = [(SMSessionMetricManager *)self collectInitiatorPerSessionMetrics];
  id v7 = [NSString alloc];
  id v8 = (void *)[v7 initWithCString:RTAnalyticsEventSafetyMonitorInitiatorPerSessionDetails encoding:1];
  log_analytics_submission(v8, v10);
  double v9 = [NSString stringWithFormat:@"com.apple.%@", v8];
  AnalyticsSendEvent();

  [(SMSessionMetricManager *)self _reset];
}

- (void)_submitTerminationMetricsWithSuccess:(BOOL)a3 reason:(unint64_t)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v16 = a5;
  id v7 = objc_opt_new();
  id v8 = [NSNumber numberWithBool:v6];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F99BB0]];

  double v9 = [NSNumber numberWithUnsignedInteger:a4];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F99BA8]];

  if (v16)
  {
    id v10 = [v16 domain];

    if (v10)
    {
      double v11 = [v16 domain];
      [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F99BA0]];
    }
    id v12 = [NSNumber numberWithInteger:[v16 code]];
    [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F99B98]];
  }
  id v13 = [NSString alloc];
  id v14 = (void *)[v13 initWithCString:RTAnalyticsEventSafetyMonitorInitiatorTerminationResult encoding:1];
  log_analytics_submission(v14, v7);
  __int16 v15 = [NSString stringWithFormat:@"com.apple.%@", v14];
  AnalyticsSendEvent();
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUUID)currentDeviceIdentifier
{
  return self->_currentDeviceIdentifier;
}

- (void)setCurrentDeviceIdentifier:(id)a3
{
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
}

- (RTFixedSizeQueue)etaUpdateStateQueue
{
  return self->_etaUpdateStateQueue;
}

- (RTFixedSizeQueue)etaUpdateSubmissionQueue
{
  return self->_etaUpdateSubmissionQueue;
}

- (double)closestTimeIntervalToExceedingETA
{
  return self->_closestTimeIntervalToExceedingETA;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (double)initialDestinationExpectedTravelTime
{
  return self->_initialDestinationExpectedTravelTime;
}

- (double)previousCrowFliesETA
{
  return self->_previousCrowFliesETA;
}

- (double)previousMapsExpectedETA
{
  return self->_previousMapsExpectedETA;
}

- (double)maxCrowFliesScaleFactor
{
  return self->_maxCrowFliesScaleFactor;
}

- (double)maxMapsETAScaleFactor
{
  return self->_maxMapsETAScaleFactor;
}

- (BOOL)didDestinationAnomalyTrigger
{
  return self->_didDestinationAnomalyTrigger;
}

- (BOOL)noProgressTriggered
{
  return self->_noProgressTriggered;
}

- (BOOL)routeDeviationTriggered
{
  return self->_routeDeviationTriggered;
}

- (BOOL)didArriveSafely
{
  return self->_didArriveSafely;
}

- (BOOL)sosTriggered
{
  return self->_sosTriggered;
}

- (BOOL)userEndedSession
{
  return self->_userEndedSession;
}

- (BOOL)didTriggerOccur
{
  return self->_didTriggerOccur;
}

- (double)initialDistance
{
  return self->_initialDistance;
}

- (void)setInitialDistance:(double)a3
{
  self->_initialDistance = a3;
}

- (unint64_t)sessionDestinationType
{
  return self->_sessionDestinationType;
}

- (double)ratioOfFirstAnomalyDistanceToTotalDistance
{
  return self->_ratioOfFirstAnomalyDistanceToTotalDistance;
}

- (double)mostRecentLocationDistance
{
  return self->_mostRecentLocationDistance;
}

- (double)originalNominalTravelTime
{
  return self->_originalNominalTravelTime;
}

- (unint64_t)firstAnomalyTriggerCategoryEnum
{
  return self->_firstAnomalyTriggerCategoryEnum;
}

- (int)numExtensions
{
  return self->_numExtensions;
}

- (unint64_t)originatingLocationTypeEnum
{
  return self->_originatingLocationTypeEnum;
}

- (unint64_t)numAnomalyPrompt
{
  return self->_numAnomalyPrompt;
}

- (unint64_t)numAnomalyPromptDuringHysteresis
{
  return self->_numAnomalyPromptDuringHysteresis;
}

- (unint64_t)numHandoff
{
  return self->_numHandoff;
}

- (unint64_t)numLPMSeparation
{
  return self->_numLPMSeparation;
}

- (unint64_t)numTakeover
{
  return self->_numTakeover;
}

- (unint64_t)numUnsupportedDeviceSeparation
{
  return self->_numUnsupportedDeviceSeparation;
}

- (unint64_t)numUserDisabledConnectivity
{
  return self->_numUserDisabledConnectivity;
}

- (BOOL)didWorkoutEnd
{
  return self->_didWorkoutEnd;
}

- (BOOL)didWorkoutPause
{
  return self->_didWorkoutPause;
}

- (BOOL)isWorkoutAlwaysOn
{
  return self->_isWorkoutAlwaysOn;
}

- (unint64_t)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (unint64_t)numRecipients
{
  return self->_numRecipients;
}

- (NSString)workoutActivityTypeString
{
  return self->_workoutActivityTypeString;
}

- (BOOL)didHandoffOccur
{
  return self->_didHandoffOccur;
}

- (BOOL)wasActiveAtStart
{
  return self->_wasActiveAtStart;
}

- (BOOL)wasActiveAtEnd
{
  return self->_wasActiveAtEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutActivityTypeString, 0);
  objc_storeStrong((id *)&self->_etaUpdateSubmissionQueue, 0);
  objc_storeStrong((id *)&self->_etaUpdateStateQueue, 0);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_currentDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end