@interface RTLearnedLocationEngine
+ (id)computeVisitLabelingMetricsForLabelingRetried:(BOOL)a3 labelingSkipped:(BOOL)a4 revGeoCalled:(BOOL)a5 bluePOICalled:(BOOL)a6 unlabeledVisit:(BOOL)a7 visitAge:(double)a8 error:(id)a9;
+ (int64_t)periodicPurgePolicy;
+ (void)submitVisitLabelingMetricsForLabelingRetried:(BOOL)a3 labelingSkipped:(BOOL)a4 revGeoCalled:(BOOL)a5 bluePOICalled:(BOOL)a6 unlabeledVisit:(BOOL)a7 visitAge:(double)a8 error:(id)a9;
- (BOOL)_appendVisits:(id)a3 lastVisit:(id)a4 lastTransition:(id)a5 outError:(id *)a6;
- (BOOL)_appendVisitsToLocationsOfInterestModelWithError:(id *)a3;
- (BOOL)_classifyPlaceTypes:(id *)a3;
- (BOOL)_consolidateKnownPlaceTypesWithError:(id *)a3;
- (BOOL)_deferSubmittingLoiMetricsDueToNoTrainingSinceLastSubmission;
- (BOOL)_deferTrainingDueToAvailability;
- (BOOL)_deferTrainingDueToRecentResetSync;
- (BOOL)_deferTrainingLOIsDueToCloudStoreNotChangeSinceLastTrainingDate:(id)a3;
- (BOOL)_deferTrainingOnBatteryDueToLackOfLongVisitSinceDate:(id)a3;
- (BOOL)_enableTrainOnBatteryForTripSegments;
- (BOOL)_homeLocationOfInterestExist;
- (BOOL)_isAOIInferredMapItem:(id)a3;
- (BOOL)_isAuthorized;
- (BOOL)_isBluePOICalledForVisit:(id)a3 providers:(id)a4;
- (BOOL)_isFinerGranularityPOIInferredMapItem:(id)a3;
- (BOOL)_isNotTooOldToLabelVisit:(id)a3;
- (BOOL)_isRecentVisit:(id)a3;
- (BOOL)_isUpdateLearnedPlaceWithGEOAddressObjectSerializationRequired:(id)a3;
- (BOOL)_isUpdateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCodeRequired:(id)a3;
- (BOOL)_isUpdateLearnedPlaceWithMapItemPlaceTypeRequired:(id)a3;
- (BOOL)_isUpdateLearnedPlaceWithPOICategoryCodeRequired:(id)a3;
- (BOOL)_momentsdOnBoarding;
- (BOOL)_processVisits:(id)a3 forLastLearnedVisit:(id)a4 error:(id *)a5;
- (BOOL)_purgeWithReferenceDate:(id)a3 error:(id *)a4;
- (BOOL)_reconcileLearnedLocationsWithError:(id *)a3;
- (BOOL)_recoverKnownPlaceTypesWithPlaceTypeClassifier:(id)a3 outError:(id *)a4;
- (BOOL)_relabelWithError:(id *)a3;
- (BOOL)_relabelWithRelabeler:(id)a3 relabelerPersister:(id)a4 error:(id *)a5;
- (BOOL)_removeUnusedMapItems:(id *)a3;
- (BOOL)_retrainVisitsWithoutPlaces:(id *)a3;
- (BOOL)_saveIdentifiersOfKnownPlaceTypesWithError:(id *)a3;
- (BOOL)_skipLabelingForVisit:(id)a3;
- (BOOL)_submitDailyVisitMetrics;
- (BOOL)_trainLocationsOfInterestModelWithError:(id *)a3;
- (BOOL)_trainVisitsFromDate:(id)a3 toDate:(id)a4 forLastLearnedVisit:(id)a5 error:(id *)a6;
- (BOOL)monitorFingerprints;
- (BOOL)registerTrainOnBattery;
- (BOOL)shouldRecoverKnownPlaceTypes;
- (OS_dispatch_queue)queue;
- (RTAccountManager)accountManager;
- (RTBiomeManager)biomeManager;
- (RTContactsManager)contactsManager;
- (RTDailyTrainingSessionCounter)dailyTrainingSessionCounter;
- (RTDefaultsManager)defaultsManager;
- (RTDiagnostics)diagnostics;
- (RTDistanceCalculator)distanceCalculator;
- (RTElevationManager)elevationManager;
- (RTEventManager)eventManager;
- (RTFingerprintManager)fingerprintManager;
- (RTLearnedLocationEngine)init;
- (RTLearnedLocationEngine)initWithAccountManager:(id)a3 biomeManager:(id)a4 contactsManager:(id)a5 dailyTrainingSessionCounter:(id)a6 defaultsManager:(id)a7 diagnostics:(id)a8 distanceCalculator:(id)a9 elevationManager:(id)a10 eventManager:(id)a11 fingerprintManager:(id)a12 learnedLocationStore:(id)a13 learnedPlaceTypeInferenceStore:(id)a14 locationManager:(id)a15 locationStore:(id)a16 mapServiceManager:(id)a17 mapsSupportManager:(id)a18 metricManager:(id)a19 motionActivityManager:(id)a20 placeInferenceQueryStore:(id)a21 platform:(id)a22 pointOfInterestMetricsManager:(id)a23 portraitManager:(id)a24 reconcilerPerVisit:(id)a25 reconcilerPerDevice:(id)a26 settledStateTransitionStore:(id)a27 transitMetricManager:(id)a28 tripSegmentProvider:(id)a29 visitManager:(id)a30 xpcActivityManager:(id)a31;
- (RTLearnedLocationEngineProtocol)delegate;
- (RTLearnedLocationEngineTrainingMetrics)trainingMetrics;
- (RTLearnedLocationReconcilerPerDevice)reconcilerPerDevice;
- (RTLearnedLocationReconcilerPerVisit)reconcilerPerVisit;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore;
- (RTLocationManager)locationManager;
- (RTLocationStore)locationStore;
- (RTMapServiceManager)mapServiceManager;
- (RTMapsSupportManager)mapsSupportManager;
- (RTMetricManager)metricManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPersonalizationPortraitManager)portraitManager;
- (RTPlaceInferenceQueryStore)placeInferenceQueryStore;
- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator;
- (RTPlatform)platform;
- (RTPointOfInterestMetricsManager)pointOfInterestMetricsManager;
- (RTSettledStateTransitionStore)settledStateTransitionStore;
- (RTTransitMetricManager)transitMetricManager;
- (RTTripSegmentProvider)tripSegmentProvider;
- (RTVisitManager)visitManager;
- (RTXPCActivityManager)xpcActivityManager;
- (id)_bestFusedInferredMapItemForVisit:(id)a3 fromCandidates:(id)a4 error:(id *)a5;
- (id)_bestInferredMapItemForVisit:(id)a3 bestFinerGranularityInferredMapItem:(id *)a4 error:(id *)a5;
- (id)_candidatesForInferredMapItems:(id)a3 error:(id *)a4;
- (id)_candidatesForVisit:(id)a3 providers:(id)a4 continueOnError:(BOOL)a5 error:(id *)a6;
- (id)_createLocationOfInterestsWithVisits:(id)a3 visitToTransitionMapping:(id)a4 visitToPlaceMapping:(id)a5;
- (id)_enabledMapItemProviders;
- (id)_filterVisits:(id)a3 lastLearnedVisit:(id)a4;
- (id)_finerGranularityCandidatesDictionaryForFusionCandidates:(id)a3;
- (id)_finerGranularityPOIForInferredMapItem:(id)a3 visit:(id)a4 finerGranularityCandidatesDictionary:(id)a5 error:(id *)a6;
- (id)_getDailyTrainingMetrics;
- (id)_lastVisitWithError:(id *)a3;
- (id)_mapItemProviderForClass:(Class)a3 error:(id *)a4;
- (id)_maximumExpirationDateForLearnedPlace:(id)a3;
- (id)_performPerDeviceReconiliationWithError:(id *)a3;
- (id)_performPerVisitReconciliationWithError:(id *)a3;
- (id)_placeForMapItem:(id)a3 error:(id *)a4;
- (id)_storedMapItemForMapItem:(id)a3 error:(id *)a4;
- (id)_transitionsForVisits:(id)a3 lastLearnedVisit:(id)a4 creationDate:(id)a5;
- (id)_updateLearnedPlaceWithCategory:(id)a3;
- (id)_updateLearnedPlaceWithGEOAddressObjectSerialization:(id)a3;
- (id)_updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode:(id)a3;
- (id)_updateLearnedPlaceWithMapItemPlaceType:(id)a3;
- (id)_updateLocationOfInterestsWithVisits:(id)a3 visitToTransitionMapping:(id)a4 visitToLocationOfInterestMapping:(id)a5;
- (id)_visitsFromDate:(id)a3 toDate:(id)a4 error:(id *)a5;
- (id)calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate:(id)a3 endDate:(id)a4 homeMapItem:(id)a5 workMapItem:(id)a6 locationsOfOthers:(id *)a7 error:(id *)a8;
- (id)createRelabeler;
- (id)createRelabelerPersisterWithError:(id *)a3;
- (id)extractCandidate:(id)a3 fromNearbyCandidates:(id)a4 extractedCandidate:(id *)a5 error:(id *)a6;
- (id)getNearbyCandidatesAroundLocation:(id)a3 distance:(double)a4 loiIdentifierToCoalescedSourceMap:(id)a5 error:(id *)a6;
- (id)getRelabeledInferredMapItemForCandidate:(id)a3 relabeler:(id)a4 loiIdentifierToCoalescedSourceMap:(id)a5 submitMetrics:(BOOL)a6 error:(id *)a7;
- (void)_classifyPlaceTypesWithHandler:(id)a3;
- (void)_fetchLatestVisitWithHandler:(id)a3;
- (void)_harvestFeedbackData;
- (void)_harvestVisits:(id)a3 places:(id)a4;
- (void)_logCloudStoreWithReason:(id)a3;
- (void)_logDatabasesWithReason:(id)a3;
- (void)_logLocalStoreWithReason:(id)a3;
- (void)_onContactsManagerNotification:(id)a3;
- (void)_onDailyMetricsNotification:(id)a3;
- (void)_onFingerprintManagerNotification:(id)a3;
- (void)_onLearnedLocationStoreNotification:(id)a3;
- (void)_onMapsSupportManagerNotification:(id)a3;
- (void)_onVisitManagerNotification:(id)a3;
- (void)_reconcileLearnedLocationsWithHandler:(id)a3;
- (void)_registerForNotifications;
- (void)_registerXpcActivityTrainOnBattery;
- (void)_requestTrainLocationsOfInterestModelWithHandler:(id)a3;
- (void)_setup;
- (void)_setupTrainingMetricsFromDate:(id)a3 toDate:(id)a4 mode:(unint64_t)a5 reason:(unint64_t)a6;
- (void)_setupXpcActivityTrain;
- (void)_shutdown;
- (void)_submitDailyTrainingMetrics;
- (void)_submitDailyTrainingSessionCount;
- (void)_submitMetricsForVisit:(id)a3 possibleInferredMapItems:(id)a4 selectedInferredMapItem:(id)a5;
- (void)_submitPlaceTypeClassificationFeatureInputMetrics;
- (void)_teardownTrainingMetrics;
- (void)_teardownXpcActivityTrain;
- (void)_trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5;
- (void)_trainWithFromDate:(id)a3 ToDate:(id)a4 forLastLearnedVisit:(id)a5 reason:(unint64_t)a6 mode:(unint64_t)a7 handler:(id)a8;
- (void)_unregisterForNotifications;
- (void)_unregisterXpcActivityTrainOnBattery;
- (void)_updateMonitorFingerprintsWithVisit:(id)a3;
- (void)_updateUnlabeledVisitsWithPlaceInformation:(id)a3;
- (void)calculateNewMetricsAndSubmitAlongWithTheOldMetrics:(id)a3 startDate:(id)a4 endDate:(id)a5 homeMapItem:(id)a6 workMapItem:(id)a7 distanceThresholdArray:(id)a8 locationsOfOthers:(id)a9;
- (void)classifyPlaceTypesWithHandler:(id)a3;
- (void)didClear;
- (void)didFinishTraining;
- (void)didUpdateWithIntervalSinceLastUpdate:(double)a3;
- (void)fetchFusionCandidatesForVisit:(id)a3 handler:(id)a4;
- (void)onContactsManagerNotification:(id)a3;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onFingerprintManagerNotification:(id)a3;
- (void)onLearnedLocationStoreNotification:(id)a3;
- (void)onMapsSupportManagerNotification:(id)a3;
- (void)onVisitManagerNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)performTransitAnalyticsWithHandler:(id)a3;
- (void)queryMapItemProvider:(id)a3 options:(id)a4 handler:(id)a5;
- (void)reconcileLearnedLocationsWithHandler:(id)a3;
- (void)relabelWithHandler:(id)a3;
- (void)requestTrainLocationsOfInterestModelWithHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMonitorFingerprints:(BOOL)a3;
- (void)setRegisterTrainOnBattery:(BOOL)a3;
- (void)setShouldRecoverKnownPlaceTypes:(BOOL)a3;
- (void)setTrainingMetrics:(id)a3;
- (void)setup;
- (void)shutdown;
- (void)submitVisitSettledStateMetricsForVisits:(id)a3 transitions:(id)a4;
- (void)trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5;
- (void)trainLocationsOfInterestModelWithHandler:(id)a3;
- (void)willBeginTraining;
@end

@implementation RTLearnedLocationEngine

- (RTLearnedLocationEngine)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_biomeManager_contactsManager_dailyTrainingSessionCounter_defaultsManager_diagnostics_distanceCalculator_elevationManager_eventManager_fingerprintManager_learnedLocationStore_learnedPlaceTypeInferenceStore_locationManager_locationStore_mapServiceManager_mapsSupportManager_metricManager_motionActivityManager_placeInferenceQueryStore_platform_pointOfInterestMetricsManager_portraitManager_reconcilerPerVisit_reconcilerPerDevice_settledStateTransitionStore_transitMetricManager_tripSegmentProvider_visitManager_xpcActivityManager_);
}

- (RTLearnedLocationEngine)initWithAccountManager:(id)a3 biomeManager:(id)a4 contactsManager:(id)a5 dailyTrainingSessionCounter:(id)a6 defaultsManager:(id)a7 diagnostics:(id)a8 distanceCalculator:(id)a9 elevationManager:(id)a10 eventManager:(id)a11 fingerprintManager:(id)a12 learnedLocationStore:(id)a13 learnedPlaceTypeInferenceStore:(id)a14 locationManager:(id)a15 locationStore:(id)a16 mapServiceManager:(id)a17 mapsSupportManager:(id)a18 metricManager:(id)a19 motionActivityManager:(id)a20 placeInferenceQueryStore:(id)a21 platform:(id)a22 pointOfInterestMetricsManager:(id)a23 portraitManager:(id)a24 reconcilerPerVisit:(id)a25 reconcilerPerDevice:(id)a26 settledStateTransitionStore:(id)a27 transitMetricManager:(id)a28 tripSegmentProvider:(id)a29 visitManager:(id)a30 xpcActivityManager:(id)a31
{
  id obj = a3;
  id v99 = a3;
  id v63 = a4;
  id v36 = a4;
  id v64 = a5;
  id v82 = a5;
  id v65 = a6;
  id v98 = a6;
  id v66 = a7;
  id v97 = a7;
  id v68 = a8;
  id v96 = a8;
  id v75 = a9;
  id v95 = a10;
  id v94 = a11;
  id v67 = a12;
  id v93 = a12;
  id v69 = a13;
  id v92 = a13;
  id v91 = a14;
  id v90 = a15;
  id v89 = a16;
  id v88 = a17;
  id v87 = a18;
  id v74 = a19;
  id v86 = a20;
  id v85 = a21;
  id v84 = a22;
  id v83 = a23;
  id v81 = a24;
  id v80 = a25;
  id v79 = a26;
  id v78 = a27;
  id v73 = a28;
  id v72 = a29;
  id v77 = a30;
  id v76 = a31;
  if (!v99)
  {
    v43 = v36;
    v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: accountManager", buf, 2u);
    }

    v45 = 0;
    v46 = 0;
    goto LABEL_34;
  }
  id v70 = v36;
  if (!v36)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
LABEL_33:

      v45 = 0;
      v46 = v99;
      v43 = v70;
LABEL_34:
      v37 = v82;
LABEL_73:
      v52 = v74;
      v51 = v75;
      v54 = v72;
      v53 = v73;
      v55 = self;
      goto LABEL_74;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: biomeManager";
LABEL_48:
    _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, v50, buf, 2u);
    goto LABEL_33;
  }
  v37 = v82;
  if (!v82)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: contactsManager";
LABEL_71:
    _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, v49, buf, 2u);
    goto LABEL_72;
  }
  if (!v98)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: dailyTrainingSessionCounter";
    goto LABEL_71;
  }
  if (!v97)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_71;
  }
  if (!v96)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: diagnostics";
    goto LABEL_71;
  }
  if (!v95)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: elevationManager";
    goto LABEL_71;
  }
  if (!v94)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: eventManager";
    goto LABEL_71;
  }
  if (!v93)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_71;
  }
  if (!v92)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_71;
  }
  if (!v91)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: learnedPlaceTypeInferenceStore";
    goto LABEL_71;
  }
  if (!v90)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_71;
  }
  if (!v89)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: locationStore";
    goto LABEL_71;
  }
  if (!v88)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_71;
  }
  if (!v87)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: mapsSupportManager";
    goto LABEL_71;
  }
  if (!v86)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_71;
  }
  if (!v85)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_71;
  }
  if (!v84)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_WORD *)buf = 0;
    v49 = "Invalid parameter not satisfying: platform";
    goto LABEL_71;
  }
  if (!v83)
  {
    v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v49 = "Invalid parameter not satisfying: pointOfInterestMetricsManager";
      goto LABEL_71;
    }
LABEL_72:

    v45 = 0;
    v46 = v99;
    v43 = v70;
    goto LABEL_73;
  }
  if (!v81)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: portraitManager";
    goto LABEL_48;
  }
  if (!v80)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: reconcilerPerVisit";
    goto LABEL_48;
  }
  if (!v79)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: reconcilerPerDevice";
    goto LABEL_48;
  }
  if (!v78)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: settledStateTransitionStore";
    goto LABEL_48;
  }
  if (!v77)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_48;
  }
  if (!v76)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: xpcActivityManager";
    goto LABEL_48;
  }
  v100.receiver = self;
  v100.super_class = (Class)RTLearnedLocationEngine;
  v38 = [(RTLearnedLocationEngine *)&v100 init];
  v39 = v38;
  if (v38)
  {
    v40 = v38;
    v41 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = (const char *)[(RTLearnedLocationEngine *)v40 UTF8String];
    }
    else
    {
      id v57 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v40, obj, v63, a5, a6, a7, a12, a8, a13];
      v42 = (const char *)[v57 UTF8String];
    }
    dispatch_queue_t v58 = dispatch_queue_create(v42, v41);

    queue = v40->_queue;
    v40->_queue = (OS_dispatch_queue *)v58;

    objc_storeStrong((id *)&v40->_accountManager, obj);
    objc_storeStrong((id *)&v40->_biomeManager, v63);
    objc_storeStrong((id *)&v40->_contactsManager, v64);
    objc_storeStrong((id *)&v40->_dailyTrainingSessionCounter, v65);
    objc_storeStrong((id *)&v40->_defaultsManager, v66);
    objc_storeStrong((id *)&v40->_diagnostics, v68);
    objc_storeStrong((id *)&v40->_distanceCalculator, a9);
    objc_storeStrong((id *)&v40->_elevationManager, a10);
    objc_storeStrong((id *)&v40->_eventManager, a11);
    objc_storeStrong((id *)&v40->_fingerprintManager, v67);
    objc_storeStrong((id *)&v40->_learnedLocationStore, v69);
    objc_storeStrong((id *)&v40->_learnedPlaceTypeInferenceStore, a14);
    objc_storeStrong((id *)&v40->_locationManager, a15);
    objc_storeStrong((id *)&v40->_locationStore, a16);
    objc_storeStrong((id *)&v40->_mapServiceManager, a17);
    objc_storeStrong((id *)&v40->_mapsSupportManager, a18);
    objc_storeStrong((id *)&v40->_metricManager, a19);
    v60 = [[RTPlaceTypeClassifierMetricsCalculator alloc] initWithDistanceCalculator:v40->_distanceCalculator learnedLocationStore:v40->_learnedLocationStore learnedPlaceTypeInferenceStore:v40->_learnedPlaceTypeInferenceStore metricManager:v40->_metricManager];
    placeTypeClassifierMetricsCalculator = v40->_placeTypeClassifierMetricsCalculator;
    v40->_placeTypeClassifierMetricsCalculator = v60;

    objc_storeStrong((id *)&v40->_motionActivityManager, a20);
    objc_storeStrong((id *)&v40->_placeInferenceQueryStore, a21);
    objc_storeStrong((id *)&v40->_platform, a22);
    objc_storeStrong((id *)&v40->_pointOfInterestMetricsManager, a23);
    objc_storeStrong((id *)&v40->_portraitManager, a24);
    objc_storeStrong((id *)&v40->_reconcilerPerVisit, a25);
    objc_storeStrong((id *)&v40->_reconcilerPerDevice, a26);
    objc_storeStrong((id *)&v40->_settledStateTransitionStore, a27);
    objc_storeStrong((id *)&v40->_transitMetricManager, a28);
    objc_storeStrong((id *)&v40->_tripSegmentProvider, a29);
    objc_storeStrong((id *)&v40->_visitManager, a30);
    objc_storeStrong((id *)&v40->_xpcActivityManager, a31);
    *(_WORD *)&v40->_registerTrainOnBattery = 256;
    [(RTLearnedLocationEngine *)v40 setup];
  }
  v55 = v39;
  v45 = v55;
  v46 = v99;
  v43 = v70;
  v37 = v82;
  v52 = v74;
  v51 = v75;
  v54 = v72;
  v53 = v73;
LABEL_74:

  return v45;
}

- (void)_registerForNotifications
{
  v3 = [(RTLearnedLocationEngine *)self contactsManager];
  v4 = +[RTNotification notificationName];
  [v3 addObserver:self selector:sel_onContactsManagerNotification_ name:v4];

  v5 = [(RTLearnedLocationEngine *)self visitManager];
  v6 = +[RTNotification notificationName];
  [v5 addObserver:self selector:sel_onVisitManagerNotification_ name:v6];

  v7 = [(RTLearnedLocationEngine *)self visitManager];
  v8 = +[RTNotification notificationName];
  [v7 addObserver:self selector:sel_onVisitManagerNotification_ name:v8];

  v9 = [(RTLearnedLocationEngine *)self visitManager];
  v10 = +[RTNotification notificationName];
  [v9 addObserver:self selector:sel_onVisitManagerNotification_ name:v10];

  v11 = [(RTLearnedLocationEngine *)self mapsSupportManager];
  v12 = +[RTNotification notificationName];
  [v11 addObserver:self selector:sel_onMapsSupportManagerNotification_ name:v12];

  v13 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v14 = +[RTNotification notificationName];
  [v13 addObserver:self selector:sel_onLearnedLocationStoreNotification_ name:v14];

  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 addObserver:self selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];
}

- (void)_unregisterForNotifications
{
  v3 = [(RTLearnedLocationEngine *)self contactsManager];
  [v3 removeObserver:self];

  v4 = [(RTLearnedLocationEngine *)self fingerprintManager];
  [v4 removeObserver:self];

  v5 = [(RTLearnedLocationEngine *)self visitManager];
  [v5 removeObserver:self];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];
}

- (void)_setupXpcActivityTrain
{
  v4 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:1 priority:1 requireNetworkConnectivity:2 requireInexpensiveNetworkConnectivity:0 networkTransferDirection:1 allowBattery:14400.0 powerNap:7200.0];
  [(RTXPCActivityCriteria *)v4 setCpuIntensive:1];
  objc_initWeak(&location, self);
  v5 = [(RTLearnedLocationEngine *)self xpcActivityManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__RTLearnedLocationEngine__setupXpcActivityTrain__block_invoke;
  v6[3] = &unk_1E6B928D0;
  v7[1] = (id)a2;
  objc_copyWeak(v7, &location);
  [v5 registerActivityWithIdentifier:@"com.apple.routined.learnedLocationEngine.train" criteria:v4 handler:v6];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __49__RTLearnedLocationEngine__setupXpcActivityTrain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__RTLearnedLocationEngine__setupXpcActivityTrain__block_invoke_312;
      v10[3] = &unk_1E6B90890;
      uint64_t v12 = *(void *)(a1 + 40);
      v11 = v5;
      [WeakRetained trainForReason:1 mode:1 handler:v10];
    }
    else if (v5)
    {
      v5[2](v5, 0);
    }
  }
}

void __49__RTLearnedLocationEngine__setupXpcActivityTrain__block_invoke_312(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to train, error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)_registerXpcActivityTrainOnBattery
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:1 priority:1 requireNetworkConnectivity:2 requireInexpensiveNetworkConnectivity:1 networkTransferDirection:1 allowBattery:1800.0 powerNap:900.0];
  v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, XPC activity criteria, %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  int v7 = [(RTLearnedLocationEngine *)self xpcActivityManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__RTLearnedLocationEngine__registerXpcActivityTrainOnBattery__block_invoke;
  v8[3] = &unk_1E6B928D0;
  v9[1] = (id)a2;
  objc_copyWeak(v9, (id *)buf);
  [v7 registerActivityWithIdentifier:@"com.apple.routined.learnedLocationEngine.train-on-battery" criteria:v4 handler:v8];

  objc_destroyWeak(v9);
  objc_destroyWeak((id *)buf);
}

void __61__RTLearnedLocationEngine__registerXpcActivityTrainOnBattery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__RTLearnedLocationEngine__registerXpcActivityTrainOnBattery__block_invoke_315;
      v12[3] = &unk_1E6B93D88;
      id v10 = v5;
      uint64_t v11 = *(void *)(a1 + 40);
      v13 = v10;
      uint64_t v14 = v11;
      v12[4] = WeakRetained;
      [WeakRetained trainForReason:1 mode:2 handler:v12];
    }
    else if (v5)
    {
      v5[2](v5, 0);
    }
  }
}

void __61__RTLearnedLocationEngine__registerXpcActivityTrainOnBattery__block_invoke_315(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  if (v3)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v7 = 138412546;
      v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, failed to train, error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setRegisterTrainOnBattery:0];
  }
}

- (void)_unregisterXpcActivityTrainOnBattery
{
  v42[1] = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__36;
  v37 = __Block_byref_object_dispose__36;
  id v38 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v5 = [(RTLearnedLocationEngine *)self xpcActivityManager];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __63__RTLearnedLocationEngine__unregisterXpcActivityTrainOnBattery__block_invoke;
  v30 = &unk_1E6B90728;
  v32 = &v33;
  id v6 = v4;
  v31 = v6;
  [v5 unregisterActivityWithIdentifier:@"com.apple.routined.learnedLocationEngine.train-on-battery" handler:&v27];

  int v7 = v6;
  v8 = [MEMORY[0x1E4F1C9C8] now:v27, v28, v29, v30];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9)) {
    goto LABEL_6;
  }
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  v13 = objc_opt_new();
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  __int16 v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v16 = [v15 filteredArrayUsingPredicate:v14];
  __int16 v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
  v42[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v42 count:1];
  v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

  if (v21)
  {
    id v22 = v21;
  }
  else
  {
LABEL_6:
    id v22 = 0;
  }

  id v23 = v22;
  if (v23) {
    objc_storeStrong(v34 + 5, v22);
  }
  v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = NSStringFromSelector(a2);
    id v26 = v34[5];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v25;
    __int16 v40 = 2112;
    id v41 = v26;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
  }
  _Block_object_dispose(&v33, 8);
}

void __63__RTLearnedLocationEngine__unregisterXpcActivityTrainOnBattery__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setRegisterTrainOnBattery:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_registerTrainOnBattery != a3)
  {
    self->_registerTrainOnBattery = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_registerTrainOnBattery) {
        v5 = @"YES";
      }
      else {
        v5 = @"NO";
      }
      int v6 = 138412290;
      int v7 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "register train on battery, %@", (uint8_t *)&v6, 0xCu);
    }

    if (self->_registerTrainOnBattery) {
      [(RTLearnedLocationEngine *)self _registerXpcActivityTrainOnBattery];
    }
    else {
      [(RTLearnedLocationEngine *)self _unregisterXpcActivityTrainOnBattery];
    }
  }
}

- (void)_teardownXpcActivityTrain
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(RTLearnedLocationEngine *)self xpcActivityManager];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __52__RTLearnedLocationEngine__teardownXpcActivityTrain__block_invoke;
  v25 = &unk_1E6B90840;
  v5 = v3;
  id v26 = v5;
  [v4 unregisterActivityWithIdentifier:@"com.apple.routined.learnedLocationEngine.train" handler:&v22];

  int v6 = v5;
  int v7 = [MEMORY[0x1E4F1C9C8] now:v22, v23, v24, v25];
  dispatch_time_t v8 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    dispatch_time_t v9 = [MEMORY[0x1E4F1C9C8] now];
    [v9 timeIntervalSinceDate:v7];
    double v11 = v10;
    double v12 = objc_opt_new();
    v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v15 = [v14 filteredArrayUsingPredicate:v13];
    id v16 = [v15 firstObject];

    [v12 submitToCoreAnalytics:v16 type:1 duration:v11];
    __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v27 count:1];
    v21 = [v18 errorWithDomain:v19 code:15 userInfo:v20];

    if (v21) {
  }
    }
}

intptr_t __52__RTLearnedLocationEngine__teardownXpcActivityTrain__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_fetchLatestVisitWithHandler:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_6;
  }
  v5 = [(RTLearnedLocationEngine *)self visitManager];

  if (v5)
  {
    int v6 = [objc_alloc(MEMORY[0x1E4F5CF58]) initWithAscending:0 confidence:0 dateInterval:0 labelVisit:0 limit:&unk_1F34502A0];
    int v7 = [(RTLearnedLocationEngine *)self visitManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__RTLearnedLocationEngine__fetchLatestVisitWithHandler___block_invoke;
    v8[3] = &unk_1E6B92A68;
    id v9 = v4;
    [v7 fetchStoredVisitsWithOptions:v6 handler:v8];

LABEL_6:
  }
}

void __56__RTLearnedLocationEngine__fetchLatestVisitWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)_setup
{
  [(RTLearnedLocationEngine *)self _registerForNotifications];

  [(RTLearnedLocationEngine *)self _setupXpcActivityTrain];
}

- (void)setup
{
  dispatch_semaphore_t v3 = [(RTLearnedLocationEngine *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__RTLearnedLocationEngine_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__RTLearnedLocationEngine_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_shutdown
{
  [(RTLearnedLocationEngine *)self _teardownXpcActivityTrain];
  [(RTLearnedLocationEngine *)self _unregisterForNotifications];
  [(RTLearnedLocationEngine *)self setRegisterTrainOnBattery:0];
  accountManager = self->_accountManager;
  self->_accountManager = 0;

  contactsManager = self->_contactsManager;
  self->_contactsManager = 0;

  defaultsManager = self->_defaultsManager;
  self->_defaultsManager = 0;

  diagnostics = self->_diagnostics;
  self->_diagnostics = 0;

  eventManager = self->_eventManager;
  self->_eventManager = 0;

  fingerprintManager = self->_fingerprintManager;
  self->_fingerprintManager = 0;

  learnedLocationStore = self->_learnedLocationStore;
  self->_learnedLocationStore = 0;

  locationManager = self->_locationManager;
  self->_locationManager = 0;

  locationStore = self->_locationStore;
  self->_locationStore = 0;

  mapServiceManager = self->_mapServiceManager;
  self->_mapServiceManager = 0;

  mapsSupportManager = self->_mapsSupportManager;
  self->_mapsSupportManager = 0;

  metricManager = self->_metricManager;
  self->_metricManager = 0;

  motionActivityManager = self->_motionActivityManager;
  self->_motionActivityManager = 0;

  portraitManager = self->_portraitManager;
  self->_portraitManager = 0;

  visitManager = self->_visitManager;
  self->_visitManager = 0;

  xpcActivityManager = self->_xpcActivityManager;
  self->_xpcActivityManager = 0;
}

- (void)shutdown
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__36;
  v15[4] = __Block_byref_object_dispose__36;
  uint64_t v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = NSStringFromSelector(a2);
  id v8 = [v4 stringWithFormat:@"%@-%@", v6, v7];
  [v8 UTF8String];
  id v16 = (id)os_transaction_create();

  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  double v10 = [(RTLearnedLocationEngine *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RTLearnedLocationEngine_shutdown__block_invoke;
  block[3] = &unk_1E6B90E98;
  block[4] = self;
  void block[5] = v15;
  dispatch_async(v10, block);

  _Block_object_dispose(v15, 8);
}

void __35__RTLearnedLocationEngine_shutdown__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _shutdown];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (id)_lastVisitWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__36;
  v45 = __Block_byref_object_dispose__36;
  id v46 = 0;
  uint64_t v35 = 0;
  id v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__36;
  v39 = __Block_byref_object_dispose__36;
  id v40 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  learnedLocationStore = self->_learnedLocationStore;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __47__RTLearnedLocationEngine__lastVisitWithError___block_invoke;
  v31 = &unk_1E6B920C8;
  uint64_t v33 = &v41;
  v34 = &v35;
  int v7 = v5;
  v32 = v7;
  [(RTLearnedLocationStore *)learnedLocationStore fetchLastVisitWithHandler:&v28];
  id v8 = v7;
  id v9 = [MEMORY[0x1E4F1C9C8] now:v28, v29, v30, v31];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  double v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  uint64_t v14 = objc_opt_new();
  __int16 v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v17 = [v16 filteredArrayUsingPredicate:v15];
  id v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v47 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v47 count:1];
  uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;

    char v24 = 0;
  }
  else
  {
LABEL_6:
    id v23 = 0;
    char v24 = 1;
  }

  id v25 = v23;
  if ((v24 & 1) == 0) {
    objc_storeStrong(v36 + 5, v23);
  }
  if (a3) {
    *a3 = v36[5];
  }
  id v26 = (id)v42[5];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v26;
}

void __47__RTLearnedLocationEngine__lastVisitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_visitsFromDate:(id)a3 toDate:(id)a4 error:(id *)a5
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v8 = a4;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__36;
  v52 = __Block_byref_object_dispose__36;
  id v53 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__36;
  id v46 = __Block_byref_object_dispose__36;
  id v47 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  dispatch_time_t v10 = [(RTLearnedLocationEngine *)self visitManager];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __56__RTLearnedLocationEngine__visitsFromDate_toDate_error___block_invoke;
  v38[3] = &unk_1E6B905F0;
  id v40 = &v48;
  uint64_t v41 = &v42;
  id v11 = v9;
  v39 = v11;
  [v10 fetchVisitsFromDate:v37 toDate:v8 handler:v38];

  id v12 = v11;
  double v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_6;
  }
  __int16 v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  id v18 = objc_opt_new();
  __int16 v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
  uint64_t v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  char v24 = (void *)MEMORY[0x1E4F28C58];
  v61[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v61 count:1];
  id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;

    char v28 = 0;
  }
  else
  {
LABEL_6:
    id v27 = 0;
    char v28 = 1;
  }

  id v29 = v27;
  if ((v28 & 1) == 0) {
    objc_storeStrong(v43 + 5, v27);
  }
  if (a5) {
    *a5 = v43[5];
  }
  v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = [(id)v49[5] count];
    id v32 = [v37 stringFromDate];
    uint64_t v33 = [v8 stringFromDate];
    id v34 = v43[5];
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v31;
    __int16 v55 = 2112;
    id v56 = v32;
    __int16 v57 = 2112;
    dispatch_queue_t v58 = v33;
    __int16 v59 = 2112;
    id v60 = v34;
    _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%lu visits from, %@, to, %@, error, %@", buf, 0x2Au);
  }
  [(id)v49[5] enumerateObjectsUsingBlock:&__block_literal_global_28];
  id v35 = (id)v49[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v35;
}

void __56__RTLearnedLocationEngine__visitsFromDate_toDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__RTLearnedLocationEngine__visitsFromDate_toDate_error___block_invoke_331(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "visit %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)_filterVisits:(id)a3 lastLearnedVisit:(id)a4
{
  v50[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke;
  v48[3] = &unk_1E6B93DD0;
  id v8 = v5;
  id v49 = v8;
  id v9 = [v7 predicateWithBlock:v48];
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337];
  id v11 = [v6 exitDate];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  dispatch_time_t v14 = v13;

  __int16 v15 = (void *)MEMORY[0x1E4F28F60];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke_339;
  v46[3] = &unk_1E6B93DD0;
  id v16 = v14;
  id v47 = v16;
  double v17 = [v15 predicateWithBlock:v46];
  id v18 = (void *)MEMORY[0x1E4F28BA0];
  v50[0] = v9;
  v50[1] = v10;
  v45 = (void *)v10;
  v50[2] = v17;
  __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
  v20 = [v18 andPredicateWithSubpredicates:v19];
  uint64_t v21 = [v8 filteredArrayUsingPredicate:v20];

  uint64_t v22 = [v21 lastObject];
  id v23 = v22;
  if (v22 && ([v22 exit], char v24 = objc_claimAutoreleasedReturnValue(), v24, !v24))
  {
    uint64_t v41 = v9;
    id v42 = v8;
    id v43 = v6;
    uint64_t v44 = objc_opt_new();
    int v26 = [v21 count];
    uint64_t v27 = (v26 - 2);
    if (v26 >= 2)
    {
      id v40 = v16;
      while (1)
      {
        char v28 = [v23 entry];
        id v29 = [v21 objectAtIndexedSubscript:v27];
        v30 = [v29 exit];
        [v28 timeIntervalSinceDate:v30];
        if (v31 >= 180.0) {
          break;
        }
        id v32 = [v23 location];
        uint64_t v33 = [v21 objectAtIndexedSubscript:v27];
        id v34 = [v33 location];
        [v44 distanceFromLocation:v32 toLocation:v34 error:0];
        double v36 = v35;

        if (v36 >= 250.0) {
          goto LABEL_15;
        }
        uint64_t v37 = [v21 objectAtIndexedSubscript:v27];

        id v23 = (void *)v37;
        if (v27-- <= 0)
        {
          LODWORD(v27) = -1;
          id v23 = (void *)v37;
          goto LABEL_15;
        }
      }

LABEL_15:
      id v16 = v40;
    }
    [v21 subarrayWithRange:0, (int)v27 + 1];
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = v42;
    id v6 = v43;
    id v9 = v41;
  }
  else
  {
    id v25 = v21;
  }

  return v25;
}

uint64_t __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 entry];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v3 exit];

    if (v6) {
      goto LABEL_7;
    }
  }
  id v7 = [*(id *)(a1 + 32) lastObject];

  if (v7 == v3)
  {
LABEL_7:
    uint64_t v9 = 1;
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "dropping visit, %@. incomplete", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke_335(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 exit];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = (void *)v3;
  id v5 = [v2 entry];
  id v6 = [v2 exit];
  uint64_t v7 = [v5 compare:v6];

  if (v7 == -1)
  {
LABEL_6:
    uint64_t v9 = 1;
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = v2;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "dropping visit, %@. failed integrity check", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __58__RTLearnedLocationEngine__filterVisits_lastLearnedVisit___block_invoke_339(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 exit];
  id v6 = [v4 earlierDate:v5];
  uint64_t v7 = [v6 isEqualToDate:*(void *)(a1 + 32)];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "dropping visit, %@. redundant submission", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

- (id)_mapItemProviderForClass:(Class)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: providerClass", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"providerClass");
      int v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v12 = [RTMapItemProviderLearnedPlace alloc];
    id v8 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v9 = [(RTLearnedLocationEngine *)self distanceCalculator];
    uint64_t v13 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    uint64_t v14 = [(RTMapItemProviderLearnedPlace *)v12 initWithDefaultsManager:v8 distanceCalculator:v9 learnedLocationStore:v13];
LABEL_15:
    int v10 = (RTMapItemProviderBluePOI *)v14;
LABEL_19:

    goto LABEL_20;
  }
  if ((Class)objc_opt_class() == a3)
  {
    __int16 v15 = [RTMapItemProviderProactiveExperts alloc];
    id v8 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v9 = [(RTLearnedLocationEngine *)self distanceCalculator];
    uint64_t v13 = [(RTLearnedLocationEngine *)self mapServiceManager];
    id v16 = [(RTLearnedLocationEngine *)self portraitManager];
    uint64_t v17 = [(RTMapItemProviderProactiveExperts *)v15 initWithDefaultsManager:v8 distanceCalculator:v9 mapServiceManager:v13 personalizationPortraitManager:v16];
LABEL_18:
    int v10 = (RTMapItemProviderBluePOI *)v17;

    goto LABEL_19;
  }
  if ((Class)objc_opt_class() == a3)
  {
    id v18 = [RTMapItemProviderEventKit alloc];
    id v8 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v9 = [(RTLearnedLocationEngine *)self distanceCalculator];
    uint64_t v13 = [(RTLearnedLocationEngine *)self eventManager];
    id v16 = [(RTLearnedLocationEngine *)self mapServiceManager];
    uint64_t v17 = [(RTMapItemProviderEventKit *)v18 initWithDefaultsManager:v8 distanceCalculator:v9 eventManager:v13 mapServiceManager:v16];
    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v27 = [RTMapItemProviderMapsSupport alloc];
    id v8 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v9 = [(RTLearnedLocationEngine *)self distanceCalculator];
    uint64_t v13 = [(RTLearnedLocationEngine *)self mapsSupportManager];
    uint64_t v14 = [(RTMapItemProviderMapsSupport *)v27 initWithDefaultsManager:v8 distanceCalculator:v9 mapsSupportManager:v13];
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a3)
  {
    id v34 = [RTMapItemProviderBluePOI alloc];
    id v8 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v9 = [(RTLearnedLocationEngine *)self distanceCalculator];
    double v35 = [(RTLearnedLocationEngine *)self fingerprintManager];
    char v28 = [(RTLearnedLocationEngine *)self locationManager];
    id v29 = [(RTLearnedLocationEngine *)self mapServiceManager];
    v30 = [(RTLearnedLocationEngine *)self motionActivityManager];
    double v31 = [(RTLearnedLocationEngine *)self placeInferenceQueryStore];
    id v32 = [(RTLearnedLocationEngine *)self platform];
    int v10 = [(RTMapItemProviderBluePOI *)v34 initWithDefaultsManager:v8 distanceCalculator:v9 fingerprintManager:v35 locationManager:v28 mapServiceManager:v29 motionActivityManager:v30 placeInferenceQueryStore:v31 platform:v32];

LABEL_20:
    if (v10) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v33 = [RTMapItemProviderPOIHistory alloc];
    id v8 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v9 = [(RTLearnedLocationEngine *)self distanceCalculator];
    uint64_t v13 = [(RTLearnedLocationEngine *)self placeInferenceQueryStore];
    uint64_t v14 = [(RTMapItemProviderPOIHistory *)v33 initWithDefaultsManager:v8 distanceCalculator:v9 placeInferenceQueryStore:v13];
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v7 = [RTMapItemProviderReverseGeocode alloc];
    id v8 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v9 = [(RTLearnedLocationEngine *)self mapServiceManager];
    int v10 = [(RTMapItemProviderReverseGeocode *)v7 initWithDefaultsManager:v8 mapServiceManager:v9];
    goto LABEL_20;
  }
LABEL_21:
  __int16 v19 = NSString;
  v20 = NSStringFromClass(a3);
  uint64_t v21 = [v19 stringWithFormat:@"could not find provider %@", v20];

  uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v23 = *MEMORY[0x1E4F5CFE8];
  uint64_t v37 = *MEMORY[0x1E4F28568];
  v38[0] = v21;
  char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  id v25 = [v22 errorWithDomain:v23 code:7 userInfo:v24];

  if (a4) {
    *a4 = v25;
  }

LABEL_24:
  int v10 = 0;
LABEL_25:

  return v10;
}

- (id)_enabledMapItemProviders
{
  v63[2] = *MEMORY[0x1E4F143B8];
  if ([(RTLearnedLocationEngine *)self _isAuthorized])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [MEMORY[0x1E4F1CA80] set];
    id v6 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v7 = [v6 objectForKey:@"RTDefaultsMapItemProviderDenyList"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __51__RTLearnedLocationEngine__enabledMapItemProviders__block_invoke;
      v55[3] = &unk_1E6B90B78;
      id v56 = v5;
      [v7 enumerateObjectsUsingBlock:v55];
    }
    id v8 = [MEMORY[0x1E4F64500] sharedConfiguration];
    uint64_t v9 = [v8 defaultForKey:@"RTDefaultsMapItemProviderDenyList" defaultValue:MEMORY[0x1E4F1CBF0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v50 = MEMORY[0x1E4F143A8];
      uint64_t v51 = 3221225472;
      v52 = __51__RTLearnedLocationEngine__enabledMapItemProviders__block_invoke_2;
      id v53 = &unk_1E6B90B78;
      v54 = v5;
      [v9 enumerateObjectsUsingBlock:&v50];
    }
    if (![(RTPlatform *)self->_platform iPhoneDevice])
    {
      int v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      v63[0] = v11;
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      v63[1] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
      [v5 addObjectsFromArray:v14];
    }
    __int16 v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    char v17 = [v5 containsObject:v16];

    if ((v17 & 1) == 0)
    {
      id v18 = [(RTLearnedLocationEngine *)self _mapItemProviderForClass:objc_opt_class() error:0];
      if (v18) {
        [v4 addObject:v18];
      }
    }
    __int16 v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    char v21 = [v5 containsObject:v20];

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = [(RTLearnedLocationEngine *)self _mapItemProviderForClass:objc_opt_class() error:0];
      if (v22) {
        [v4 addObject:v22];
      }
    }
    uint64_t v23 = (objc_class *)objc_opt_class();
    char v24 = NSStringFromClass(v23);
    char v25 = [v5 containsObject:v24];

    if ((v25 & 1) == 0)
    {
      int v26 = [(RTLearnedLocationEngine *)self _mapItemProviderForClass:objc_opt_class() error:0];
      if (v26) {
        [v4 addObject:v26];
      }
    }
    uint64_t v27 = (objc_class *)objc_opt_class();
    char v28 = NSStringFromClass(v27);
    char v29 = [v5 containsObject:v28];

    if ((v29 & 1) == 0)
    {
      v30 = [(RTLearnedLocationEngine *)self _mapItemProviderForClass:objc_opt_class() error:0];
      if (v30) {
        [v4 addObject:v30];
      }
    }
    double v31 = (objc_class *)objc_opt_class();
    id v32 = NSStringFromClass(v31);
    char v33 = [v5 containsObject:v32];

    if ((v33 & 1) == 0)
    {
      id v34 = [(RTLearnedLocationEngine *)self _mapItemProviderForClass:objc_opt_class() error:0];
      if (v34) {
        [v4 addObject:v34];
      }
    }
    double v35 = (objc_class *)objc_opt_class();
    double v36 = NSStringFromClass(v35);
    char v37 = [v5 containsObject:v36];

    if ((v37 & 1) == 0)
    {
      id v38 = [(RTLearnedLocationEngine *)self _mapItemProviderForClass:objc_opt_class() error:0];
      if (v38) {
        [v4 addObject:v38];
      }
    }
    v39 = (objc_class *)objc_opt_class();
    id v40 = NSStringFromClass(v39);
    char v41 = [v5 containsObject:v40];

    if ((v41 & 1) == 0)
    {
      id v42 = [(RTLearnedLocationEngine *)self _mapItemProviderForClass:objc_opt_class() error:0];
      if (v42) {
        [v4 addObject:v42];
      }
      id v43 = [v4 lastObject];
      char v44 = [v43 isMemberOfClass:objc_opt_class()];

      if ((v44 & 1) == 0)
      {
        v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = (objc_class *)objc_opt_class();
          id v49 = NSStringFromClass(v48);
          *(_DWORD *)buf = 138412802;
          dispatch_queue_t v58 = v49;
          __int16 v59 = 2080;
          id v60 = "-[RTLearnedLocationEngine _enabledMapItemProviders]";
          __int16 v61 = 1024;
          int v62 = 892;
          _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "the last mapItem provider must be %@ (in %s:%d)", buf, 0x1Cu);
        }
      }
    }
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v46 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v58 = v46;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, not authorized to use mapItem providers", buf, 0xCu);
    }
    uint64_t v4 = 0;
  }

  return v4;
}

void __51__RTLearnedLocationEngine__enabledMapItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __51__RTLearnedLocationEngine__enabledMapItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)fetchFusionCandidatesForVisit:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [(RTLearnedLocationEngine *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__RTLearnedLocationEngine_fetchFusionCandidatesForVisit_handler___block_invoke;
      block[3] = &unk_1E6B92668;
      block[4] = self;
      id v17 = v7;
      id v16 = v6;
      dispatch_async(v8, block);
    }
    else
    {
      int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        char v21 = "-[RTLearnedLocationEngine fetchFusionCandidatesForVisit:handler:]";
        __int16 v22 = 1024;
        int v23 = 902;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit (in %s:%d)", buf, 0x12u);
      }

      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      __int16 v19 = @"requires a non-nil visit.";
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      uint64_t v14 = [v11 errorWithDomain:v12 code:7 userInfo:v13];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __65__RTLearnedLocationEngine_fetchFusionCandidatesForVisit_handler___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _enabledMapItemProviders];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v2 count]];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v18 = 0;
    uint64_t v13 = [v11 _candidatesForVisit:v12 providers:v4 continueOnError:1 error:&v18];
    id v14 = v18;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"required at least one mapItem provider.";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v14 = [v16 errorWithDomain:v17 code:2 userInfo:v4];
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v14);
  }
}

- (void)queryMapItemProvider:(id)a3 options:(id)a4 handler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (NSString *)a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  if (!v10)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_18;
  }
  if (!v8)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTLearnedLocationEngine queryMapItemProvider:options:handler:]";
      __int16 v40 = 1024;
      int v41 = 944;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: providerClassName (in %s:%d)", buf, 0x12u);
    }

    if (v9) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTLearnedLocationEngine queryMapItemProvider:options:handler:]";
      __int16 v40 = 1024;
      int v41 = 945;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

    if (v8)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F5CFE8];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      double v35 = @"requires a non-nil options";
      long long v19 = (void *)MEMORY[0x1E4F1C9E8];
      long long v20 = &v35;
      long long v21 = &v34;
LABEL_16:
      long long v22 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
      int v23 = [v17 errorWithDomain:v18 code:7 userInfo:v22];
      v10[2](v10, 0, v23);

      goto LABEL_19;
    }
LABEL_15:
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CFE8];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    char v37 = @"requires a non-nil provider class name";
    long long v19 = (void *)MEMORY[0x1E4F1C9E8];
    long long v20 = &v37;
    long long v21 = &v36;
    goto LABEL_16;
  }
  Class v11 = NSClassFromString(v8);
  if (!v11)
  {
    id v14 = [NSString stringWithFormat:@"could not find provider %@", v8];
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F5CFE8];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    char v33 = v14;
    int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v27 = [v24 errorWithDomain:v25 code:7 userInfo:v26];

    v10[2](v10, 0, v27);
LABEL_18:

    goto LABEL_19;
  }
  Class v12 = v11;
  uint64_t v13 = [(RTLearnedLocationEngine *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__RTLearnedLocationEngine_queryMapItemProvider_options_handler___block_invoke;
  block[3] = &unk_1E6B93E18;
  block[4] = self;
  Class v31 = v12;
  v30 = v10;
  id v29 = v9;
  dispatch_async(v13, block);

LABEL_19:
}

void __64__RTLearnedLocationEngine_queryMapItemProvider_options_handler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[7];
  id v10 = 0;
  uint64_t v4 = [v2 _mapItemProviderForClass:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v6 = a1[5];
    id v9 = 0;
    uint64_t v7 = [v4 mapItemsWithOptions:v6 error:&v9];
    id v8 = v9;
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (BOOL)_isAOIInferredMapItem:(id)a3
{
  id v3 = a3;
  if (([v3 source] & 0x41C0) != 0)
  {
    uint64_t v4 = [v3 mapItem];
    BOOL v5 = [v4 mapItemPlaceType] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isFinerGranularityPOIInferredMapItem:(id)a3
{
  id v3 = a3;
  if (([v3 source] & 0x41C0) != 0)
  {
    uint64_t v4 = [v3 mapItem];
    BOOL v5 = [v4 mapItemPlaceType] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_finerGranularityCandidatesDictionaryForFusionCandidates:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v58 = v34;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, computing the finer granularity candidates", buf, 0xCu);
  }
  if ([v4 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v35 = v4;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(obj);
          }
          Class v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          Class v12 = [v11 firstObject:v35];
          BOOL v13 = [(RTLearnedLocationEngine *)self _isAOIInferredMapItem:v12];

          if (v13)
          {
            id v14 = [v11 firstObject];
            [v6 addObject:v14];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v8);
    }

    [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v6 count]];
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v36 = v6;
    uint64_t v39 = [v36 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v49;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v49 != v38) {
            objc_enumerationMutation(v36);
          }
          uint64_t v42 = v15;
          id v16 = *(void **)(*((void *)&v48 + 1) + 8 * v15);
          uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v32 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            dispatch_queue_t v58 = v32;
            __int16 v59 = 2112;
            id v60 = v16;
            _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%@, AOI candidate, %@", buf, 0x16u);
          }
          uint64_t v18 = NSNumber;
          long long v19 = [v16 mapItem];
          int v41 = [v18 numberWithUnsignedInteger:[v19 muid]];

          long long v20 = [MEMORY[0x1E4F1CA48] array];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v21 = obj;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v45 != v24) {
                  objc_enumerationMutation(v21);
                }
                int v26 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                uint64_t v27 = [v26 firstObject:v35];
                BOOL v28 = [(RTLearnedLocationEngine *)self _isFinerGranularityPOIInferredMapItem:v27];

                if (v28)
                {
                  id v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    v30 = NSStringFromSelector(a2);
                    Class v31 = [v26 firstObject];
                    *(_DWORD *)buf = 138412546;
                    dispatch_queue_t v58 = v30;
                    __int16 v59 = 2112;
                    id v60 = v31;
                    _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "%@, finer granularity candidate, %@", buf, 0x16u);
                  }
                  [v20 addObject:v26];
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
            }
            while (v23);
          }

          if ([v20 count]) {
            [v37 setObject:v20 forKeyedSubscript:v41];
          }

          uint64_t v15 = v42 + 1;
        }
        while (v42 + 1 != v39);
        uint64_t v39 = [v36 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v39);
    }

    id v4 = v35;
  }
  else
  {
    id v37 = (id)MEMORY[0x1E4F1CC08];
  }

  return v37;
}

- (id)_finerGranularityPOIForInferredMapItem:(id)a3 visit:(id)a4 finerGranularityCandidatesDictionary:(id)a5 error:(id *)a6
{
  id v10 = a4;
  Class v11 = NSNumber;
  id v12 = a5;
  BOOL v13 = [a3 mapItem];
  id v14 = [v11 numberWithUnsignedInteger:[v13 muid]];
  uint64_t v15 = [v12 objectForKeyedSubscript:v14];

  if ([v15 count] == 1)
  {
    id v16 = [v15 firstObject];
    uint64_t v17 = [v16 firstObject];

    id v18 = 0;
    if (!a6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((unint64_t)[v15 count] >= 2)
  {
    id v22 = 0;
    long long v19 = [(RTLearnedLocationEngine *)self _bestFusedInferredMapItemForVisit:v10 fromCandidates:v15 error:&v22];
    id v18 = v22;
    uint64_t v17 = [v19 convertToInferredMapItem];

    if (!a6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v18 = 0;
  uint64_t v17 = 0;
  if (a6) {
LABEL_8:
  }
    *a6 = v18;
LABEL_9:
  id v20 = v17;

  return v20;
}

- (id)_candidatesForInferredMapItems:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    aSelector = a2;
    uint64_t v34 = a4;
    [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v7 count]];
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v35 = v8;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v43;
      uint64_t v37 = *MEMORY[0x1E4F5CFE8];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          *(void *)buf = 0;
          uint64_t v41 = 0;
          uint64_t v15 = [(RTLearnedLocationEngine *)self learnedLocationStore];
          id v16 = [v14 mapItem];
          id v40 = 0;
          char v17 = [v15 placeTypeForMapItem:v16 placeType:buf placeTypeSource:&v41 error:&v40];
          id v18 = v40;

          if ((v17 & 1) == 0)
          {
            [v9 addObject:v18];
            *(void *)buf = 0;
            uint64_t v41 = 0;
          }
          id v19 = objc_alloc(MEMORY[0x1E4F5CE58]);
          id v20 = [NSNumber numberWithUnsignedInteger:*(void *)buf];
          id v21 = (void *)[v19 initWithFirstObject:v14 secondObject:v20];

          if (v21)
          {
            [v39 addObject:v21];
          }
          else
          {
            id v22 = NSString;
            uint64_t v23 = +[RTLearnedPlace placeTypeToString:*(void *)buf];
            uint64_t v24 = [v22 stringWithFormat:@"candidate was nil for inferredMapItem, %@, placeType, %@", v14, v23];

            uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v49 = v36;
            long long v50 = v24;
            int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
            uint64_t v27 = [v25 errorWithDomain:v37 code:0 userInfo:v26];

            [v9 addObject:v27];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v11);
    }

    if ([v9 count])
    {
      BOOL v28 = _RTSafeArray();
      id v29 = _RTMultiErrorCreate();

      v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v47 = 2112;
        long long v48 = v29;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      if (v34) {
        id *v34 = v29;
      }
    }
    uint64_t v8 = v35;
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

- (id)_candidatesForVisit:(id)a3 providers:(id)a4 continueOnError:(BOOL)a5 error:(id *)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    long long v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    if (a6)
    {
      long long v43 = @"visit";
LABEL_40:
      _RTErrorInvalidParameterCreate((uint64_t)v43);
      uint64_t v11 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
LABEL_46:
    uint64_t v11 = 0;
    goto LABEL_47;
  }
  if (!v9)
  {
    long long v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: providers", buf, 2u);
    }

    if (a6)
    {
      long long v43 = @"providers";
      goto LABEL_40;
    }
    goto LABEL_46;
  }
  long long v48 = a6;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  id v60 = [MEMORY[0x1E4F1CA48] array];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v49 = v10;
  id obj = v10;
  uint64_t v61 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v69;
    id v50 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v69 != v59) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        uint64_t v14 = MEMORY[0x1E016D870]();
        id v15 = objc_alloc(MEMORY[0x1E4F5CE78]);
        id v16 = [v8 location];
        char v17 = [v16 location];
        id v18 = [v8 entryDate];
        id v19 = [v8 exitDate];
        id v20 = v15;
        id v21 = (void *)v14;
        id v22 = (void *)[v20 initWithinDistance:v17 location:v18 startDate:v19 endDate:50.0];

        if (([v13 skipForOptions:v22 error:0] & 1) == 0)
        {
          id v67 = 0;
          uint64_t v23 = [v13 mapItemsWithOptions:v22 error:&v67];
          id v24 = v67;
          uint64_t v25 = v24;
          if (v24 && ([v24 isOnlyThrottlingError] & 1) == 0) {
            [v60 addObject:v25];
          }
          int v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            uint64_t v27 = (objc_class *)objc_opt_class();
            BOOL v28 = NSStringFromClass(v27);
            uint64_t v29 = [v23 count];
            *(_DWORD *)buf = 138412802;
            id v74 = v28;
            __int16 v75 = 2048;
            uint64_t v76 = v29;
            __int16 v77 = 2112;
            id v78 = v25;
            _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);
          }
          id v66 = 0;
          dispatch_queue_t v58 = v23;
          v30 = [(RTLearnedLocationEngine *)self _candidatesForInferredMapItems:v23 error:&v66];
          id v31 = v66;
          uint64_t v32 = v60;
          if (v31) {
            [v60 addObject:v31];
          }
          __int16 v57 = v31;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v33 = v30;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v72 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            long long v54 = v25;
            long long v55 = v22;
            id v56 = v21;
            char v36 = 0;
            uint64_t v37 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v63 != v37) {
                  objc_enumerationMutation(v33);
                }
                id v39 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                id v40 = [v39 secondObject];
                uint64_t v41 = [v40 unsignedIntegerValue];

                v36 |= (unint64_t)(v41 - 1) < 3;
                [v11 addObject:v39];
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v72 count:16];
            }
            while (v35);

            id v8 = v50;
            uint64_t v32 = v60;
            id v22 = v55;
            id v21 = v56;
            uint64_t v25 = v54;
            if (v36)
            {
LABEL_41:

              goto LABEL_42;
            }
          }
          else
          {
          }
          if (!a5 && [v32 count]) {
            goto LABEL_41;
          }
        }
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
      if (v61) {
        continue;
      }
      break;
    }
  }
LABEL_42:

  long long v45 = v60;
  if (v48 && [v60 count])
  {
    long long v46 = _RTSafeArray();
    _RTMultiErrorCreate();
    id *v48 = (id)objc_claimAutoreleasedReturnValue();

    long long v45 = v60;
  }

  uint64_t v10 = v49;
LABEL_47:

  return v11;
}

- (id)_bestFusedInferredMapItemForVisit:(id)a3 fromCandidates:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v39 = v7;
    uint64_t v38 = [[RTInferredMapItemFuser alloc] initWithDefaultsManager:self->_defaultsManager distanceCalculator:self->_distanceCalculator learnedLocationStore:0];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO) && [v8 count])
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = [v8 objectAtIndexedSubscript:v9];
        uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = NSStringFromSelector(a2);
          BOOL v13 = [v10 firstObject];
          uint64_t v14 = [v10 secondObject];
          id v15 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v14 unsignedIntegerValue]);
          *(_DWORD *)buf = 138413058;
          long long v46 = v12;
          __int16 v47 = 2048;
          unint64_t v48 = v9;
          __int16 v49 = 2112;
          id v50 = v13;
          __int16 v51 = 2112;
          uint64_t v52 = v15;
          _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, candidate %lu, inferredMapItem, %@, placeType, %@", buf, 0x2Au);
        }
        ++v9;
      }
      while (v9 < [v8 count]);
    }
    id v16 = [v39 location];
    char v17 = [v16 location];
    id v44 = 0;
    id v18 = [(RTInferredMapItemFuser *)v38 fusedInferredMapItemsUsingCandidates:v8 referenceLocation:v17 snapToBestKnownPlaceAndAoi:1 error:&v44];
    id v19 = v44;

    id v20 = [(RTInferredMapItemFuser *)v38 bestFromFusedInferredMapItems:v18];
    id v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      long long v46 = v22;
      __int16 v47 = 2112;
      unint64_t v48 = (unint64_t)v20;
      __int16 v49 = 2112;
      id v50 = v19;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, best fusedInferredMapItem, %@, error, %@", buf, 0x20u);
    }
    uint64_t v23 = objc_alloc_init(RTFusionMetrics);
    [(RTFusionMetrics *)v23 setMetricsUsingInputCandidates:v8 outputFusedInferredMapItems:v18 bestFusedInferredMapItem:v20 outputError:v19];
    id v43 = 0;
    BOOL v24 = [(RTFusionMetrics *)v23 submitMetricsWithError:&v43];
    id v25 = v43;
    int v26 = v25;
    if (v24)
    {
      if (!v19)
      {
        id v41 = v25;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO) && [v18 count])
        {
          unint64_t v32 = 0;
          do
          {
            id v33 = [v18 objectAtIndexedSubscript:v32];
            uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              uint64_t v35 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              long long v46 = v35;
              __int16 v47 = 2048;
              unint64_t v48 = v32;
              __int16 v49 = 2112;
              id v50 = v33;
              _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, fusedInferredMapItem %lu, %@", buf, 0x20u);
            }
            ++v32;
          }
          while (v32 < [v18 count]);
        }
        id v30 = v20;
        int v26 = v41;
        goto LABEL_32;
      }
      uint64_t v27 = a5;
      if (a5)
      {
        BOOL v28 = v19;
LABEL_22:
        id v30 = 0;
        *uint64_t v27 = v28;
LABEL_32:

        id v7 = v39;
        goto LABEL_33;
      }
    }
    else
    {
      id v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        long long v46 = v37;
        __int16 v47 = 2112;
        unint64_t v48 = (unint64_t)v26;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, fusion metrics submission error, %@", buf, 0x16u);
      }
      uint64_t v27 = a5;
      if (a5)
      {
        BOOL v28 = v26;
        goto LABEL_22;
      }
    }
    id v30 = 0;
    goto LABEL_32;
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"visit");
    id v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v30 = 0;
  }
LABEL_33:

  return v30;
}

- (BOOL)_isRecentVisit:(id)a3
{
  id v3 = [a3 creationDate];
  [v3 timeIntervalSinceNow];
  BOOL v5 = v4 > -259200.0;

  return v5;
}

- (BOOL)_isNotTooOldToLabelVisit:(id)a3
{
  id v3 = [a3 creationDate];
  [v3 timeIntervalSinceNow];
  BOOL v5 = v4 > -604800.0;

  return v5;
}

- (BOOL)_skipLabelingForVisit:(id)a3
{
  id v4 = a3;
  if ([(RTLearnedLocationEngine *)self _isRecentVisit:v4])
  {
    char v5 = 0;
  }
  else if ([(RTLearnedLocationEngine *)self _isNotTooOldToLabelVisit:v4])
  {
    char v5 = RTCommonRandomFlip();
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)_isBluePOICalledForVisit:(id)a3 providers:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = objc_alloc(MEMORY[0x1E4F5CE78]);
          uint64_t v10 = [v17 location];
          uint64_t v11 = [v10 location];
          uint64_t v12 = [v17 entryDate];
          BOOL v13 = [v17 exitDate];
          uint64_t v14 = (void *)[v9 initWithinDistance:v11 location:v12 startDate:v13 endDate:50.0];

          int v15 = [v8 skipForOptions:v14 error:0];
          if (!v15)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (id)_bestInferredMapItemForVisit:(id)a3 bestFinerGranularityInferredMapItem:(id *)a4 error:(id *)a5
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [v9 creationDate];
  [v11 timeIntervalSinceNow];
  double v13 = v12;

  uint64_t v14 = [(RTLearnedLocationEngine *)self _enabledMapItemProviders];
  if (![v14 count])
  {
    long long v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F5CFE8];
    uint64_t v97 = *MEMORY[0x1E4F28568];
    v98[0] = @"required at least one mapItem provider.";
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:&v97 count:1];
    id v18 = [v22 errorWithDomain:v23 code:2 userInfo:v24];

    [(id)objc_opt_class() submitVisitLabelingMetricsForLabelingRetried:0 labelingSkipped:1 revGeoCalled:0 bluePOICalled:0 unlabeledVisit:1 visitAge:v18 error:v13];
    if (a5)
    {
      id v18 = v18;
      id v25 = 0;
      *a5 = v18;
      goto LABEL_63;
    }
    goto LABEL_10;
  }
  if ([(RTLearnedLocationEngine *)self _skipLabelingForVisit:v9])
  {
    uint64_t v95 = *MEMORY[0x1E4F28568];
    int v15 = NSString;
    id v16 = [MEMORY[0x1E4F1C9C8] date];
    id v17 = [v15 stringWithFormat:@"skipped labeling to reduce network traffic, creation date, %@", v16];
    id v96 = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];

    long long v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:12 userInfo:v18];
    long long v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      long long v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v90 = v21;
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v9;
      __int16 v93 = 2112;
      id v94 = v19;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, Skipped labeling, visit, %@, error, %@", buf, 0x20u);
    }
    [(id)objc_opt_class() submitVisitLabelingMetricsForLabelingRetried:0 labelingSkipped:1 revGeoCalled:0 bluePOICalled:0 unlabeledVisit:1 visitAge:v19 error:v13];
    if (a5) {
      *a5 = v19;
    }

LABEL_10:
    id v25 = 0;
    goto LABEL_63;
  }
  uint64_t v76 = a4;
  aSelector = a2;
  id v78 = a5;
  int v26 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v14 count] - 1];
  uint64_t v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  __int16 v77 = v14;
  id v28 = v14;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v84 objects:v88 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v85 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        if ([v33 isMemberOfClass:objc_opt_class()]) {
          uint64_t v34 = v27;
        }
        else {
          uint64_t v34 = v26;
        }
        [v34 addObject:v33];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v84 objects:v88 count:16];
    }
    while (v30);
  }

  id v83 = 0;
  uint64_t v35 = [(RTLearnedLocationEngine *)self _candidatesForVisit:v9 providers:v26 continueOnError:[(RTLearnedLocationEngine *)self _isRecentVisit:v9] ^ 1 error:&v83];
  id v36 = v83;
  BOOL v37 = [(RTLearnedLocationEngine *)self _isBluePOICalledForVisit:v9 providers:v26];
  if (v36) {
    [v10 addObject:v36];
  }
  uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    uint64_t v39 = [v35 count];
    *(_DWORD *)buf = 138412802;
    id v90 = v9;
    __int16 v91 = 2048;
    uint64_t v92 = v39;
    __int16 v93 = 2112;
    id v94 = v36;
    _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "visit, %@, possible candidates, %lu, error, %@", buf, 0x20u);
  }

  if (v36 && [(RTLearnedLocationEngine *)self _isRecentVisit:v9])
  {
    BOOL v40 = v37;
    id v41 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    uint64_t v14 = v77;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v90 = v9;
      _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "skipping labelling visit, %@", buf, 0xCu);
    }

    [(id)objc_opt_class() submitVisitLabelingMetricsForLabelingRetried:1 labelingSkipped:0 revGeoCalled:0 bluePOICalled:v40 unlabeledVisit:1 visitAge:v36 error:v13];
    id v18 = 0;
    if (v78) {
      *id v78 = v36;
    }
  }
  else
  {
    BOOL v71 = v37;
    id v82 = 0;
    long long v42 = [(RTLearnedLocationEngine *)self _bestFusedInferredMapItemForVisit:v9 fromCandidates:v35 error:&v82];
    id v43 = v82;
    if (v43) {
      [v10 addObject:v43];
    }
    id v44 = [v42 mapItem];

    long long v68 = v44;
    long long v69 = v43;
    id v72 = v36;
    long long v70 = v42;
    if (v44)
    {
      id v79 = [v42 convertToInferredMapItem];
      long long v45 = 0;
    }
    else
    {
      id v81 = 0;
      long long v45 = [(RTLearnedLocationEngine *)self _candidatesForVisit:v9 providers:v27 continueOnError:1 error:&v81];
      id v46 = v81;
      if (v46) {
        [v10 addObject:v46];
      }
      __int16 v47 = [v45 firstObject];
      if (v47)
      {
        unint64_t v48 = [v45 firstObject];
        id v79 = [v48 firstObject];
      }
      else
      {
        id v79 = 0;
      }
    }
    __int16 v49 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v45 count] + [v35 count]];
    if ([v35 count]) {
      [v49 addObjectsFromArray:v35];
    }
    if ([v45 count]) {
      [v49 addObjectsFromArray:v45];
    }
    id v50 = [[_RTMap alloc] initWithInput:v49];
    uint64_t v51 = [(_RTMap *)v50 withBlock:&__block_literal_global_399];

    id v67 = (void *)v51;
    [(RTLearnedLocationEngine *)self _submitMetricsForVisit:v9 possibleInferredMapItems:v51 selectedInferredMapItem:v79];
    id v73 = v35;
    __int16 v75 = v45;
    uint64_t v52 = v76;
    if (v76)
    {
      id v66 = v49;
      uint64_t v53 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        long long v54 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412546;
        id v90 = v54;
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v9;
        _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_INFO, "%@, computing the finer granularity map item for visit, %@", buf, 0x16u);
      }
      long long v55 = [(RTLearnedLocationEngine *)self _finerGranularityCandidatesDictionaryForFusionCandidates:v35];
      id v80 = 0;
      id v56 = [(RTLearnedLocationEngine *)self _finerGranularityPOIForInferredMapItem:v79 visit:v9 finerGranularityCandidatesDictionary:v55 error:&v80];
      id v57 = v80;
      dispatch_queue_t v58 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        uint64_t v59 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        id v90 = v59;
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v56;
        __int16 v93 = 2112;
        id v94 = v9;
        _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_INFO, "%@, the selected finer granularity map item, %@, for visit, %@", buf, 0x20u);

        uint64_t v52 = v76;
      }

      if (v57) {
        [v10 addObject:v57];
      }
      id v60 = v56;
      id *v52 = v60;

      __int16 v49 = v66;
    }
    if ([v10 count])
    {
      uint64_t v61 = _RTSafeArray();
      long long v62 = _RTMultiErrorCreate();

      id v63 = v62;
      *id v78 = v63;
    }
    else
    {
      id v63 = 0;
    }
    [(id)objc_opt_class() submitVisitLabelingMetricsForLabelingRetried:0 labelingSkipped:0 revGeoCalled:v68 == 0 bluePOICalled:v71 unlabeledVisit:v79 == 0 visitAge:v63 error:v13];
    long long v64 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v90 = v79;
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v9;
      __int16 v93 = 2112;
      id v94 = v63;
      _os_log_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_INFO, "selected inferredMapItem, %@, for visit, %@, error, %@", buf, 0x20u);
    }

    id v36 = v72;
    if (v78) {
      *id v78 = v63;
    }
    id v18 = v79;

    uint64_t v14 = v77;
    uint64_t v35 = v73;
  }

  id v25 = v18;
LABEL_63:

  return v25;
}

uint64_t __98__RTLearnedLocationEngine__bestInferredMapItemForVisit_bestFinerGranularityInferredMapItem_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 firstObject];
}

- (void)_submitMetricsForVisit:(id)a3 possibleInferredMapItems:(id)a4 selectedInferredMapItem:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8 && v9 && v10)
  {
    uint64_t v31 = self;
    id v34 = v8;
    double v12 = [v10 mapItem];
    double v13 = (void *)[v12 copy];

    if (!v13)
    {
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v28 = NSStringFromSelector(a2);
        uint64_t v29 = [v11 mapItem];
        *(_DWORD *)buf = 138412546;
        long long v42 = v28;
        __int16 v43 = 2112;
        id v44 = v29;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, failed to copy selectedMapItem, %@", buf, 0x16u);
      }
    }
    unint64_t v32 = v11;
    uint64_t v30 = v13;
    [v13 setSource:[v11 source]];
    int v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v9 count]];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v33 = v9;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v22 = [v21 mapItem];
          uint64_t v23 = (void *)[v22 copy];

          if (v23)
          {
            [v23 setSource:[v21 source]];
            [v15 addObject:v23];
          }
          else
          {
            uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v25 = NSStringFromSelector(a2);
              int v26 = [v21 mapItem];
              *(_DWORD *)buf = 138412546;
              long long v42 = v25;
              __int16 v43 = 2112;
              id v44 = v26;
              _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, failed to copy possibleMapItem, %@", buf, 0x16u);
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v18);
    }

    uint64_t v27 = [(RTLearnedLocationEngine *)v31 trainingMetrics];
    id v8 = v34;
    [v27 submitVisit:v34 possibleMapItems:v15 selectedMapItem:v30];

    uint64_t v11 = v32;
    id v9 = v33;
  }
}

- (id)_storedMapItemForMapItem:(id)a3 error:(id *)a4
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    v117 = a4;
    id v8 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    v118 = [v8 predicateForObjectsFromCurrentDevice];

    context = (void *)MEMORY[0x1E016D870]();
    uint64_t v132 = 0;
    v133 = &v132;
    uint64_t v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__36;
    v136 = __Block_byref_object_dispose__36;
    id v137 = 0;
    uint64_t v126 = 0;
    v127 = (id *)&v126;
    uint64_t v128 = 0x3032000000;
    v129 = __Block_byref_object_copy__36;
    v130 = __Block_byref_object_dispose__36;
    id v131 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __58__RTLearnedLocationEngine__storedMapItemForMapItem_error___block_invoke;
    v122[3] = &unk_1E6B905F0;
    v124 = &v132;
    v125 = &v126;
    uint64_t v11 = v9;
    v123 = v11;
    [v10 fetchStoredMapItemsWithMapItem:v7 predicate:v118 handler:v122];

    double v12 = v11;
    double v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      int v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      uint64_t v18 = objc_opt_new();
      uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      long long v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v21 = [v20 filteredArrayUsingPredicate:v19];
      long long v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v146 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v146 count:1];
      id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v26 = v26;

        char v27 = 0;
LABEL_11:

        id v116 = v26;
        if ((v27 & 1) == 0) {
          objc_storeStrong(v127 + 5, v26);
        }
        id v33 = v127[5];
        if (v33)
        {
          id v32 = v33;
          id v34 = 0;
        }
        else if ([(id)v133[5] count])
        {
          id v34 = [(id)v133[5] firstObject];
          uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v34;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v7;
            *(_WORD *)&buf[22] = 2112;
            v140 = 0;
            _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "selected existing mapItem, %@, for the input mapItem, %@, error, %@", buf, 0x20u);
          }

          id v32 = 0;
        }
        else
        {
          v113 = [MEMORY[0x1E4F1C9C8] date];
          v114 = [v113 dateByAddingTimeInterval:4838400.0];
          id v76 = objc_alloc(MEMORY[0x1E4F5CD80]);
          uint64_t v92 = [MEMORY[0x1E4F29128] UUID];
          v111 = [v7 address];
          __int16 v91 = [v111 geoAddressData];
          v109 = [v7 address];
          id v90 = [v109 subPremises];
          v107 = [v7 address];
          id v89 = [v107 subThoroughfare];
          v105 = [v7 address];
          id v80 = [v105 thoroughfare];
          v103 = [v7 address];
          id v88 = [v103 subLocality];
          v102 = [v7 address];
          long long v87 = [v102 locality];
          v101 = [v7 address];
          id v79 = [v101 subAdministrativeArea];
          objc_super v100 = [v7 address];
          long long v86 = [v100 administrativeArea];
          id v99 = [v7 address];
          long long v85 = [v99 administrativeAreaCode];
          id v98 = [v7 address];
          long long v84 = [v98 postalCode];
          uint64_t v97 = [v7 address];
          id v83 = [v97 country];
          id v96 = [v7 address];
          id v78 = [v96 countryCode];
          uint64_t v95 = [v7 address];
          id v82 = [v95 inlandWater];
          id v94 = [v7 address];
          id v81 = [v94 ocean];
          __int16 v93 = [v7 address];
          long long v36 = [v93 areasOfInterest];
          long long v37 = [v7 address];
          char v38 = [v37 isIsland];
          long long v39 = [v7 address];
          BOOL v40 = [v39 iso3166CountryCode];
          id v41 = [v7 address];
          long long v42 = [v41 iso3166SubdivisionCode];
          LOBYTE(v75) = v38;
          __int16 v77 = objc_msgSend(v76, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v92, v91, v90, v89, v80, v88, v87, v79, v86, v85, v84, v83, v78, v82,
                          v81,
                          v36,
                          v75,
                          v113,
                          v114,
                          v40,
                          v42);

          id v106 = objc_alloc(MEMORY[0x1E4F5CE38]);
          v112 = [MEMORY[0x1E4F29128] UUID];
          v110 = [v7 name];
          v108 = [v7 category];
          __int16 v43 = [v7 location];
          uint64_t v104 = [v7 source];
          uint64_t v44 = [v7 mapItemPlaceType];
          uint64_t v45 = [v7 muid];
          uint64_t v46 = [v7 resultProviderID];
          __int16 v47 = [v7 geoMapItemHandle];
          unint64_t v48 = [v7 extendedAttributes];
          __int16 v49 = [v7 displayLanguage];
          LOBYTE(v74) = [v7 disputed];
          id v34 = (void *)[v106 initWithIdentifier:v112 name:v110 category:v108 address:v77 location:v43 source:v104 mapItemPlaceType:v44 muid:v45 resultProviderID:v46 geoMapItemHandle:v47 creationDate:v113 expirationDate:v114 extendedAttributes:v48 displayLanguage:v49 disputed:v74];

          id v50 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v34;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v7;
            _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "selected new mapItem, %@, for input mapItem, %@", buf, 0x16u);
          }

          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          v140 = __Block_byref_object_copy__36;
          v141 = __Block_byref_object_dispose__36;
          id v142 = 0;
          dispatch_semaphore_t v51 = dispatch_semaphore_create(0);

          uint64_t v52 = [(RTLearnedLocationEngine *)self learnedLocationStore];
          v138 = v34;
          uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
          v119[0] = MEMORY[0x1E4F143A8];
          v119[1] = 3221225472;
          v119[2] = __58__RTLearnedLocationEngine__storedMapItemForMapItem_error___block_invoke_406;
          v119[3] = &unk_1E6B90728;
          v121 = buf;
          long long v54 = v51;
          v120 = v54;
          [v52 storeMapItems:v53 handler:v119];

          double v12 = v54;
          long long v55 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v56 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v12, v56)) {
            goto LABEL_26;
          }
          id v57 = [MEMORY[0x1E4F1C9C8] now];
          [v57 timeIntervalSinceDate:v55];
          double v59 = v58;
          id v60 = objc_opt_new();
          uint64_t v61 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
          long long v62 = [MEMORY[0x1E4F29060] callStackSymbols];
          id v63 = [v62 filteredArrayUsingPredicate:v61];
          long long v64 = [v63 firstObject];

          [v60 submitToCoreAnalytics:v64 type:1 duration:v59];
          long long v65 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v146 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v146, 2u);
          }

          id v66 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v145 = *MEMORY[0x1E4F28568];
          *(void *)v146 = @"semaphore wait timeout";
          id v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:&v145 count:1];
          long long v68 = [v66 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v67];

          if (v68)
          {
            id v69 = v68;

            char v70 = 0;
          }
          else
          {
LABEL_26:
            char v70 = 1;
            id v69 = v116;
          }

          id v71 = v69;
          if ((v70 & 1) == 0) {
            objc_storeStrong((id *)(*(void *)&buf[8] + 40), v69);
          }
          id v32 = *(id *)(*(void *)&buf[8] + 40);
          if (v32) {
            id v72 = v32;
          }

          _Block_object_dispose(buf, 8);
          id v116 = v71;
        }

        _Block_object_dispose(&v126, 8);
        _Block_object_dispose(&v132, 8);

        if (v117) {
          id *v117 = v32;
        }
        uint64_t v31 = v34;
        a4 = v31;
        goto LABEL_35;
      }
    }
    else
    {
      id v26 = 0;
    }
    char v27 = 1;
    goto LABEL_11;
  }
  if (!a4) {
    goto LABEL_36;
  }
  id v28 = a4;
  uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v143 = *MEMORY[0x1E4F28568];
  uint64_t v30 = NSString;
  NSStringFromSelector(a2);
  uint64_t v31 = (id *)objc_claimAutoreleasedReturnValue();
  id v32 = [v30 stringWithFormat:@"%@ requires a valid mapItem.", v31];
  id v144 = v32;
  v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
  [v29 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v118];
  a4 = 0;
  *id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

LABEL_36:

  return a4;
}

void __58__RTLearnedLocationEngine__storedMapItemForMapItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __58__RTLearnedLocationEngine__storedMapItemForMapItem_error___block_invoke_406(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_placeForMapItem:(id)a3 error:(id *)a4
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    v129 = a4;
    v127 = self;
    id v8 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    v130 = [v8 predicateForObjectsFromCurrentDevice];

    context = (void *)MEMORY[0x1E016D870]();
    uint64_t v144 = 0;
    uint64_t v145 = &v144;
    uint64_t v146 = 0x3032000000;
    uint64_t v147 = __Block_byref_object_copy__36;
    v148 = __Block_byref_object_dispose__36;
    id v149 = 0;
    uint64_t v138 = 0;
    v139 = (id *)&v138;
    uint64_t v140 = 0x3032000000;
    v141 = __Block_byref_object_copy__36;
    id v142 = __Block_byref_object_dispose__36;
    id v143 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    v134[0] = MEMORY[0x1E4F143A8];
    v134[1] = 3221225472;
    v134[2] = __50__RTLearnedLocationEngine__placeForMapItem_error___block_invoke;
    v134[3] = &unk_1E6B93E60;
    v136 = &v144;
    id v137 = &v138;
    id v11 = v9;
    v135 = v11;
    [v10 fetchPlaceWithMapItem:v7 predicate:v130 handler:v134];

    id v12 = v11;
    double v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      int v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      uint64_t v18 = objc_opt_new();
      uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      long long v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v21 = [v20 filteredArrayUsingPredicate:v19];
      long long v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v158 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v158 count:1];
      id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v26 = v26;

        char v27 = 0;
LABEL_11:

        id v128 = v26;
        if ((v27 & 1) == 0) {
          objc_storeStrong(v139 + 5, v26);
        }
        id v33 = v139[5];
        if (v33)
        {
          id v32 = v33;
          id v34 = 0;
        }
        else
        {
          uint64_t v35 = (void *)v145[5];
          if (v35)
          {
            id v34 = v35;
            long long v36 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              long long v37 = (uint64_t (*)(uint64_t, uint64_t))v139[5];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v34;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v7;
              *(_WORD *)&buf[22] = 2112;
              v152 = v37;
              _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "selected existing place, %@, with mapItem, %@, error, %@", buf, 0x20u);
            }

            id v32 = 0;
          }
          else
          {
            long long v85 = [MEMORY[0x1E4F1C9C8] date];
            long long v86 = [v85 dateByAddingTimeInterval:4838400.0];
            id v83 = objc_alloc(MEMORY[0x1E4F5CD80]);
            char v38 = [MEMORY[0x1E4F29128] UUID];
            v124 = [v7 address];
            v101 = [v124 geoAddressData];
            v122 = [v7 address];
            objc_super v100 = [v122 subPremises];
            v120 = [v7 address];
            id v99 = [v120 subThoroughfare];
            v118 = [v7 address];
            id v98 = [v118 thoroughfare];
            v115 = [v7 address];
            uint64_t v97 = [v115 subLocality];
            v113 = [v7 address];
            id v96 = [v113 locality];
            v112 = [v7 address];
            uint64_t v95 = [v112 subAdministrativeArea];
            v111 = [v7 address];
            id v94 = [v111 administrativeArea];
            v110 = [v7 address];
            __int16 v93 = [v110 administrativeAreaCode];
            v109 = [v7 address];
            uint64_t v92 = [v109 postalCode];
            v108 = [v7 address];
            __int16 v91 = [v108 country];
            v107 = [v7 address];
            id v90 = [v107 countryCode];
            id v106 = [v7 address];
            id v89 = [v106 inlandWater];
            v105 = [v7 address];
            id v88 = [v105 ocean];
            uint64_t v104 = [v7 address];
            long long v87 = [v104 areasOfInterest];
            v103 = [v7 address];
            char v82 = [v103 isIsland];
            v102 = [v7 address];
            long long v39 = [v102 creationDate];
            BOOL v40 = [v7 address];
            id v41 = [v40 expirationDate];
            long long v42 = [v7 address];
            __int16 v43 = [v42 iso3166CountryCode];
            uint64_t v44 = [v7 address];
            uint64_t v45 = [v44 iso3166SubdivisionCode];
            LOBYTE(v81) = v82;
            long long v84 = objc_msgSend(v83, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v38, v101, v100, v99, v98, v97, v96, v95, v94, v93, v92, v91, v90, v89,
                            v88,
                            v87,
                            v81,
                            v39,
                            v41,
                            v43,
                            v45);

            id v116 = objc_alloc(MEMORY[0x1E4F5CE38]);
            v125 = [MEMORY[0x1E4F29128] UUID];
            v123 = [v7 name];
            v121 = [v7 category];
            v119 = [v7 location];
            uint64_t v114 = [v7 source];
            uint64_t v46 = [v7 mapItemPlaceType];
            uint64_t v47 = [v7 muid];
            uint64_t v48 = [v7 resultProviderID];
            __int16 v49 = [v7 geoMapItemHandle];
            id v50 = [v7 creationDate];
            dispatch_semaphore_t v51 = [v7 expirationDate];
            uint64_t v52 = [v7 extendedAttributes];
            uint64_t v53 = [v7 displayLanguage];
            LOBYTE(v80) = [v7 disputed];
            v117 = (void *)[v116 initWithIdentifier:v125 name:v123 category:v121 address:v84 location:v119 source:v114 mapItemPlaceType:v46 muid:v47 resultProviderID:v48 geoMapItemHandle:v49 creationDate:v50 expirationDate:v51 extendedAttributes:v52 displayLanguage:v53 disputed:v80];

            long long v54 = [RTLearnedPlace alloc];
            long long v55 = [MEMORY[0x1E4F29128] UUID];
            id v34 = [(RTLearnedPlace *)v54 initWithIdentifier:v55 type:0 typeSource:0 mapItem:v117 customLabel:0 creationDate:v85 expirationDate:v86];

            dispatch_time_t v56 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v34;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v7;
              _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "selected new place, %@, with mapItem, %@", buf, 0x16u);
            }

            *(void *)buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            v152 = __Block_byref_object_copy__36;
            v153 = __Block_byref_object_dispose__36;
            id v154 = 0;
            dispatch_semaphore_t v57 = dispatch_semaphore_create(0);

            double v58 = [(RTLearnedLocationEngine *)v127 learnedLocationStore];
            v150 = v34;
            double v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];
            v131[0] = MEMORY[0x1E4F143A8];
            v131[1] = 3221225472;
            v131[2] = __50__RTLearnedLocationEngine__placeForMapItem_error___block_invoke_408;
            v131[3] = &unk_1E6B90728;
            v133 = buf;
            id v60 = v57;
            uint64_t v132 = v60;
            [v58 storePlaces:v59 handler:v131];

            id v12 = v60;
            uint64_t v61 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v62 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v12, v62)) {
              goto LABEL_26;
            }
            id v63 = [MEMORY[0x1E4F1C9C8] now];
            [v63 timeIntervalSinceDate:v61];
            double v65 = v64;
            id v66 = objc_opt_new();
            id v67 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
            long long v68 = [MEMORY[0x1E4F29060] callStackSymbols];
            id v69 = [v68 filteredArrayUsingPredicate:v67];
            char v70 = [v69 firstObject];

            [v66 submitToCoreAnalytics:v70 type:1 duration:v65];
            id v71 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v158 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v158, 2u);
            }

            id v72 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v157 = *MEMORY[0x1E4F28568];
            *(void *)v158 = @"semaphore wait timeout";
            id v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:&v157 count:1];
            uint64_t v74 = [v72 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v73];

            if (v74)
            {
              id v75 = v74;

              char v76 = 0;
            }
            else
            {
LABEL_26:
              char v76 = 1;
              id v75 = v128;
            }

            id v77 = v75;
            if ((v76 & 1) == 0) {
              objc_storeStrong((id *)(*(void *)&buf[8] + 40), v75);
            }
            id v32 = *(id *)(*(void *)&buf[8] + 40);
            if (v32) {
              id v78 = v32;
            }

            _Block_object_dispose(buf, 8);
            id v128 = v77;
          }
        }

        _Block_object_dispose(&v138, 8);
        _Block_object_dispose(&v144, 8);

        if (v129) {
          id *v129 = v32;
        }
        uint64_t v31 = v34;
        a4 = v31;
        goto LABEL_35;
      }
    }
    else
    {
      id v26 = 0;
    }
    char v27 = 1;
    goto LABEL_11;
  }
  if (!a4) {
    goto LABEL_36;
  }
  id v28 = a4;
  uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v155 = *MEMORY[0x1E4F28568];
  uint64_t v30 = NSString;
  NSStringFromSelector(a2);
  uint64_t v31 = (id *)objc_claimAutoreleasedReturnValue();
  id v32 = [v30 stringWithFormat:@"%@ requires a valid mapItem.", v31];
  id v156 = v32;
  v130 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
  [v29 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v130];
  a4 = 0;
  *id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

LABEL_36:

  return a4;
}

void __50__RTLearnedLocationEngine__placeForMapItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __50__RTLearnedLocationEngine__placeForMapItem_error___block_invoke_408(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)submitVisitSettledStateMetricsForVisits:(id)a3 transitions:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        double v13 = [v12 entryDate];
        dispatch_time_t v14 = [v12 exitDate];
        +[RTVisitSettledStateMetrics submitVisitSettledStateMetricsForStartDate:v13 endDate:v14 isVisit:1 settledStateTransitionStore:self->_settledStateTransitionStore];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        long long v21 = [v20 startDate];
        long long v22 = [v20 stopDate];
        +[RTVisitSettledStateMetrics submitVisitSettledStateMetricsForStartDate:v21 endDate:v22 isVisit:0 settledStateTransitionStore:self->_settledStateTransitionStore];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }
}

- (id)_transitionsForVisits:(id)a3 lastLearnedVisit:(id)a4 creationDate:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v43 = a4;
  id v8 = a5;
  uint64_t v46 = v8;
  if (!v7)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visits", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!v8)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate", buf, 2u);
    }

LABEL_12:
    id v44 = 0;
    goto LABEL_25;
  }
  if (v43)
  {
    id v58 = v43;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v7];

    id v7 = v10;
  }
  uint64_t v47 = v7;
  if ((unint64_t)[v7 count] >= 2)
  {
    [MEMORY[0x1E4F1CA48] arrayWithCapacity:-[NSObject count](v7, "count") - 1];
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)[v7 count] >= 2)
    {
      unint64_t v12 = 1;
      uint64_t v41 = *MEMORY[0x1E4F5CFE8];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      do
      {
        id v50 = [v47 objectAtIndexedSubscript:v12 - 1];
        double v13 = [v47 objectAtIndexedSubscript:v12];
        __int16 v49 = [v50 exitDate];
        uint64_t v48 = [v13 entryDate];
        *(void *)buf = 0;
        long long v55 = buf;
        uint64_t v56 = 0x2020000000;
        uint64_t v57 = 0;
        dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
        id v15 = [(RTLearnedLocationEngine *)self motionActivityManager];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __79__RTLearnedLocationEngine__transitionsForVisits_lastLearnedVisit_creationDate___block_invoke;
        v51[3] = &unk_1E6B938D8;
        uint64_t v53 = buf;
        uint64_t v16 = v14;
        uint64_t v52 = v16;
        [v15 fetchPredominantMotionActivityTypeFromStartDate:v49 toEndDate:v48 withHandler:v51];

        uint64_t v17 = v16;
        uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v19 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v17, v19)) {
          goto LABEL_20;
        }
        long long v20 = [MEMORY[0x1E4F1C9C8] now];
        [v20 timeIntervalSinceDate:v18];
        double v22 = v21;
        long long v23 = objc_opt_new();
        long long v24 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
        long long v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v26 = [v25 filteredArrayUsingPredicate:v24];
        long long v27 = [v26 firstObject];

        [v23 submitToCoreAnalytics:v27 type:1 duration:v22];
        long long v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v60 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v60, 2u);
        }

        long long v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = v42;
        *(void *)id v60 = @"semaphore wait timeout";
        long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
        uint64_t v31 = [v29 errorWithDomain:v41 code:15 userInfo:v30];

        if (v31)
        {
          id v32 = v31;
        }
        else
        {
LABEL_20:
          id v32 = 0;
        }

        id v33 = v32;
        id v34 = [RTLearnedTransition alloc];
        uint64_t v35 = [MEMORY[0x1E4F29128] UUID];
        long long v36 = [v50 identifier];
        long long v37 = [v13 identifier];
        char v38 = [v13 expirationDate];
        long long v39 = [(RTLearnedTransition *)v34 initWithIdentifier:v35 startDate:v49 stopDate:v48 visitIdentifierOrigin:v36 visitIdentifierDestination:v37 creationDate:v46 expirationDate:v38 predominantMotionActivityType:*((void *)v55 + 3)];

        if (v39) {
          [v44 addObject:v39];
        }

        _Block_object_dispose(buf, 8);
        ++v12;
      }
      while (v12 < [v47 count]);
    }
  }
  else
  {
    id v44 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v47;
LABEL_25:

  return v44;
}

void __79__RTLearnedLocationEngine__transitionsForVisits_lastLearnedVisit_creationDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "failed fetching motion activities, error, %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 134217984;
      id v9 = a2;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "dominant motion activity, %lu", (uint8_t *)&v8, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_harvestVisits:(id)a3 places:(id)a4
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    log = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    long long v54 = "Invalid parameter not satisfying: placeToVisitsMap";
LABEL_25:
    _os_log_error_impl(&dword_1D9BFA000, log, OS_LOG_TYPE_ERROR, v54, buf, 2u);
    goto LABEL_23;
  }
  if (!v6)
  {
    log = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    long long v54 = "Invalid parameter not satisfying: placesMap";
    goto LABEL_25;
  }
  int v8 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  log = [v8 predicateForObjectsFromCurrentDevice];

  dispatch_semaphore_t v60 = dispatch_semaphore_create(0);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v55 = v5;
  id obj = v5;
  uint64_t v62 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
  id v9 = 0;
  if (v62)
  {
    uint64_t v58 = *(void *)v74;
    uint64_t v57 = *MEMORY[0x1E4F5CFE8];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    uint64_t v59 = v7;
    do
    {
      uint64_t v10 = 0;
      id v11 = v9;
      do
      {
        if (*(void *)v74 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v67 = v10;
        uint64_t v65 = *(void *)(*((void *)&v73 + 1) + 8 * v10);
        unint64_t v12 = [v7 objectForKeyedSubscript:];
        double v13 = [(RTLearnedLocationEngine *)self trainingMetrics];
        dispatch_semaphore_t v14 = [v13 places];
        [v14 addObject:v12];

        id v15 = [(RTLearnedLocationEngine *)self learnedLocationStore];
        uint64_t v16 = [v12 mapItem];
        uint64_t v17 = [v16 location];
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __49__RTLearnedLocationEngine__harvestVisits_places___block_invoke;
        v70[3] = &unk_1E6B93E88;
        v70[4] = self;
        id v66 = v12;
        id v71 = v66;
        uint64_t v18 = v60;
        id v72 = v18;
        [v15 fetchPlacesWithinDistance:v17 location:log predicate:v70 handler:1000.0];

        dispatch_time_t v19 = v18;
        long long v20 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v21 = dispatch_time(0, 3600000000000);
        id v22 = v11;
        if (dispatch_semaphore_wait(v19, v21))
        {
          long long v23 = [MEMORY[0x1E4F1C9C8] now];
          [v23 timeIntervalSinceDate:v20];
          double v25 = v24;
          long long v26 = objc_opt_new();
          long long v27 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
          long long v28 = [MEMORY[0x1E4F29060] callStackSymbols];
          long long v29 = [v28 filteredArrayUsingPredicate:v27];
          long long v30 = [v29 firstObject];

          [v26 submitToCoreAnalytics:v30 type:1 duration:v25];
          uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          id v32 = (void *)MEMORY[0x1E4F28C58];
          v85[0] = v56;
          *(void *)buf = @"semaphore wait timeout";
          id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v85 count:1];
          id v34 = [v32 errorWithDomain:v57 code:15 userInfo:v33];

          id v22 = v11;
          if (v34)
          {
            id v22 = v34;
          }
        }

        id v64 = v22;
        uint64_t v35 = [RTMapItemProviderBluePOI alloc];
        long long v36 = [(RTLearnedLocationEngine *)self defaultsManager];
        long long v37 = [(RTLearnedLocationEngine *)self distanceCalculator];
        char v38 = [(RTLearnedLocationEngine *)self fingerprintManager];
        long long v39 = [(RTLearnedLocationEngine *)self locationManager];
        BOOL v40 = [(RTLearnedLocationEngine *)self mapServiceManager];
        uint64_t v41 = [(RTLearnedLocationEngine *)self motionActivityManager];
        uint64_t v42 = [(RTLearnedLocationEngine *)self placeInferenceQueryStore];
        id v43 = [(RTLearnedLocationEngine *)self platform];
        id v44 = [(RTMapItemProviderBluePOI *)v35 initWithDefaultsManager:v36 distanceCalculator:v37 fingerprintManager:v38 locationManager:v39 mapServiceManager:v40 motionActivityManager:v41 placeInferenceQueryStore:v42 platform:v43];

        uint64_t v45 = [obj objectForKeyedSubscript:v65];
        uint64_t v46 = [v66 mapItem];
        id v69 = 0;
        BOOL v47 = [(RTMapItemProviderBluePOI *)v44 harvestVisits:v45 mapItem:v46 harvestType:1 error:&v69];
        id v48 = v69;

        __int16 v49 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          uint64_t v50 = [v45 count];
          uint64_t v51 = [v66 mapItem];
          uint64_t v52 = (void *)v51;
          *(_DWORD *)buf = 134218754;
          uint64_t v53 = @"NO";
          if (v47) {
            uint64_t v53 = @"YES";
          }
          *(void *)&uint8_t buf[4] = v50;
          __int16 v78 = 2112;
          uint64_t v79 = v51;
          __int16 v80 = 2112;
          uint64_t v81 = v53;
          __int16 v82 = 2112;
          id v83 = v48;
          _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "harvested %lu visits, mapItem, %@, success, %@, error %@", buf, 0x2Au);
        }
        uint64_t v10 = v67 + 1;
        id v9 = v64;
        id v11 = v64;
        id v7 = v59;
      }
      while (v62 != v67 + 1);
      uint64_t v62 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
    }
    while (v62);
  }

  id v5 = v55;
LABEL_23:
}

intptr_t __49__RTLearnedLocationEngine__harvestVisits_places___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 trainingMetrics];
  [v5 submitPlace:a1[5] nearbyPlaces:v4];

  id v6 = a1[6];

  return dispatch_semaphore_signal(v6);
}

- (void)_harvestFeedbackData
{
  v161[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(RTLearnedLocationEngine *)self defaultsManager];
  uint64_t v97 = [v2 objectForKey:@"ReviewedPlaceLastFetchedDate"];

  id v98 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  id v96 = [v98 laterDate:v97];
  uint64_t v95 = [MEMORY[0x1E4F1C9C8] now];
  __int16 v91 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v96 endDate:v95];
  id v94 = [[RTMapsSupportOptions alloc] initWithDateInterval:v91];
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x3032000000;
  uint64_t v138 = __Block_byref_object_copy__36;
  v139 = __Block_byref_object_dispose__36;
  id v140 = 0;
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x3032000000;
  uint64_t v132 = __Block_byref_object_copy__36;
  v133 = __Block_byref_object_dispose__36;
  id v134 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(RTLearnedLocationEngine *)self mapsSupportManager];
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __47__RTLearnedLocationEngine__harvestFeedbackData__block_invoke;
  v125[3] = &unk_1E6B905F0;
  v127 = &v135;
  id v128 = &v129;
  id v5 = v3;
  uint64_t v126 = v5;
  [v4 fetchReviewedPlacesWithOptions:v94 handler:v125];

  dsema = v5;
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v7 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v7)) {
    goto LABEL_6;
  }
  int v8 = [MEMORY[0x1E4F1C9C8] now];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;
  id v11 = objc_opt_new();
  unint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  double v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  dispatch_semaphore_t v14 = [v13 filteredArrayUsingPredicate:v12];
  id v15 = [v14 firstObject];

  [v11 submitToCoreAnalytics:v15 type:1 duration:v10];
  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v150 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v150 count:1];
  dispatch_time_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v18];

  if (v19)
  {
    id v20 = v19;

    char v21 = 0;
  }
  else
  {
LABEL_6:
    id v20 = 0;
    char v21 = 1;
  }

  id v92 = v20;
  if (v21)
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [(id)v136[5] count];
      uint64_t v24 = v130[5];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "fetched, %lu, reviewedPlaces, error, %@", buf, 0x16u);
    }

    if (!v130[5])
    {
      v105 = objc_opt_new();
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v25 = (id)v136[5];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v121 objects:v160 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v122;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v122 != v27) {
              objc_enumerationMutation(v25);
            }
            long long v29 = *(void **)(*((void *)&v121 + 1) + 8 * i);
            if ([v29 hasUserReviewed])
            {
              long long v30 = [v29 lastSuggestedReviewDate];
              if (v30)
              {
                BOOL v31 = [v29 muid] == 0;

                if (!v31)
                {
                  id v32 = [NSNumber numberWithUnsignedInteger:[v29 muid]];
                  [v105 setObject:v29 forKey:v32];
                }
              }
            }
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v121 objects:v160 count:16];
        }
        while (v26);
      }

      v102 = [v105 allKeys];
      id v33 = [RTMapItemProviderBluePOI alloc];
      id v34 = [(RTLearnedLocationEngine *)self defaultsManager];
      uint64_t v35 = [(RTLearnedLocationEngine *)self distanceCalculator];
      long long v36 = [(RTLearnedLocationEngine *)self fingerprintManager];
      long long v37 = [(RTLearnedLocationEngine *)self locationManager];
      char v38 = [(RTLearnedLocationEngine *)self mapServiceManager];
      long long v39 = [(RTLearnedLocationEngine *)self motionActivityManager];
      BOOL v40 = [(RTLearnedLocationEngine *)self placeInferenceQueryStore];
      uint64_t v41 = [(RTLearnedLocationEngine *)self platform];
      __int16 v93 = [(RTMapItemProviderBluePOI *)v33 initWithDefaultsManager:v34 distanceCalculator:v35 fingerprintManager:v36 locationManager:v37 mapServiceManager:v38 motionActivityManager:v39 placeInferenceQueryStore:v40 platform:v41];

      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      uint64_t v157 = __Block_byref_object_copy__36;
      v158 = __Block_byref_object_dispose__36;
      id v159 = 0;
      uint64_t v150 = 0;
      v151 = &v150;
      uint64_t v152 = 0x3032000000;
      v153 = __Block_byref_object_copy__36;
      id v154 = __Block_byref_object_dispose__36;
      id v155 = 0;

      dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
      id v43 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      id v44 = [MEMORY[0x1E4F1C9C8] now];
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __47__RTLearnedLocationEngine__harvestFeedbackData__block_invoke_417;
      v117[3] = &unk_1E6B905F0;
      v119 = buf;
      v120 = &v150;
      uint64_t v45 = v42;
      v118 = v45;
      [v43 fetchLocationsOfInterestVisitedBetweenStartDate:v98 endDate:v44 handler:v117];

      dsema = v45;
      uint64_t v46 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v47 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v47)) {
        goto LABEL_27;
      }
      id v48 = [MEMORY[0x1E4F1C9C8] now];
      [v48 timeIntervalSinceDate:v46];
      double v50 = v49;
      uint64_t v51 = objc_opt_new();
      uint64_t v52 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      uint64_t v53 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v54 = [v53 filteredArrayUsingPredicate:v52];
      id v55 = [v54 firstObject];

      [v51 submitToCoreAnalytics:v55 type:1 duration:v50];
      uint64_t v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v141 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v141, 2u);
      }

      uint64_t v57 = (void *)MEMORY[0x1E4F28C58];
      v161[0] = *MEMORY[0x1E4F28568];
      *(void *)v141 = @"semaphore wait timeout";
      uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v161 count:1];
      uint64_t v59 = [v57 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v58];

      if (v59)
      {
        id v60 = v59;

        char v61 = 0;
      }
      else
      {
LABEL_27:
        id v60 = 0;
        char v61 = 1;
      }

      id v92 = v60;
      if ((v61 & 1) == 0)
      {
LABEL_60:

        _Block_object_dispose(&v150, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_61;
      }
      if (v151[5])
      {
        uint64_t v62 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          uint64_t v63 = v151[5];
          *(_DWORD *)v141 = 138412290;
          *(void *)&v141[4] = v63;
          _os_log_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_INFO, "Error was issued during fetching locationsOfInterest from store, error, %@", v141, 0xCu);
        }
LABEL_59:

        goto LABEL_60;
      }
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      uint64_t v62 = *(id *)(*(void *)&buf[8] + 40);
      uint64_t v64 = [v62 countByEnumeratingWithState:&v113 objects:v149 count:16];
      if (!v64) {
        goto LABEL_59;
      }
      uint64_t v103 = *(void *)v114;
      id obj = v62;
LABEL_34:
      uint64_t v104 = v64;
      uint64_t v65 = 0;
      while (1)
      {
        if (*(void *)v114 != v103) {
          objc_enumerationMutation(obj);
        }
        id v66 = *(void **)(*((void *)&v113 + 1) + 8 * v65);
        uint64_t v67 = [v66 place];
        v107 = [v67 mapItem];

        id v106 = [v66 visits];
        long long v68 = [MEMORY[0x1E4F1CA48] array];
        if (!v107) {
          goto LABEL_57;
        }
        id v69 = [NSNumber numberWithUnsignedInteger:[v107 muid]];
        if (![v102 containsObject:v69]) {
          goto LABEL_56;
        }
        BOOL v70 = [v106 count] == 0;

        if (!v70) {
          break;
        }
LABEL_57:

        if (++v65 == v104)
        {
          uint64_t v62 = obj;
          uint64_t v64 = [obj countByEnumeratingWithState:&v113 objects:v149 count:16];
          if (!v64) {
            goto LABEL_59;
          }
          goto LABEL_34;
        }
      }
      id v71 = [NSNumber numberWithUnsignedInteger:[v107 muid]];
      id v69 = [v105 objectForKey:v71];

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id v72 = v106;
      uint64_t v73 = [v72 countByEnumeratingWithState:&v109 objects:v148 count:16];
      if (v73)
      {
        uint64_t v74 = *(void *)v110;
        do
        {
          for (uint64_t j = 0; j != v73; ++j)
          {
            if (*(void *)v110 != v74) {
              objc_enumerationMutation(v72);
            }
            long long v76 = *(void **)(*((void *)&v109 + 1) + 8 * j);
            id v77 = [v69 lastSuggestedReviewDate];
            __int16 v78 = [v76 exitDate];
            [v77 timeIntervalSinceDate:v78];
            double v80 = v79;

            if (v80 <= 259200.0) {
              [v68 addObject:v76];
            }
          }
          uint64_t v73 = [v72 countByEnumeratingWithState:&v109 objects:v148 count:16];
        }
        while (v73);
      }

      id v108 = 0;
      BOOL v81 = [(RTMapItemProviderBluePOI *)v93 harvestVisits:v68 mapItem:v107 harvestType:2 error:&v108];
      id v82 = v108;
      id v83 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        uint64_t v84 = [v68 count];
        *(_DWORD *)v141 = 134218754;
        long long v85 = @"NO";
        if (v81) {
          long long v85 = @"YES";
        }
        *(void *)&v141[4] = v84;
        __int16 v142 = 2112;
        id v143 = v107;
        __int16 v144 = 2112;
        uint64_t v145 = v85;
        __int16 v146 = 2112;
        id v147 = v82;
        _os_log_impl(&dword_1D9BFA000, v83, OS_LOG_TYPE_INFO, "harvested %lu visits as feedback data, mapItem, %@, success, %@, error %@", v141, 0x2Au);
      }

      if (v81)
      {
        long long v86 = [(RTLearnedLocationEngine *)self defaultsManager];
        long long v87 = [v86 objectForKey:@"ReviewedPlaceLastFetchedDate"];
        id v88 = [v69 lastSuggestedReviewDate];
        id v89 = [v87 laterDate:v88];

        id v90 = [(RTLearnedLocationEngine *)self defaultsManager];
        [v90 setObject:v89 forKey:@"ReviewedPlaceLastFetchedDate"];
      }
LABEL_56:

      goto LABEL_57;
    }
  }
LABEL_61:

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);
}

void __47__RTLearnedLocationEngine__harvestFeedbackData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__RTLearnedLocationEngine__harvestFeedbackData__block_invoke_417(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_maximumExpirationDateForLearnedPlace:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v4 dateByAddingTimeInterval:4838400.0];

  if (!v3)
  {
    dispatch_time_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    __int16 v30 = 0;
    uint64_t v24 = "Invalid parameter not satisfying: place";
    id v25 = (uint8_t *)&v30;
    goto LABEL_20;
  }
  id v6 = [v3 mapItem];

  if (!v6)
  {
    dispatch_time_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    __int16 v29 = 0;
    uint64_t v24 = "Invalid parameter not satisfying: place.mapItem";
    id v25 = (uint8_t *)&v29;
    goto LABEL_20;
  }
  uint64_t v7 = [v3 mapItem];
  int v8 = [v7 address];

  if (v8)
  {
    uint64_t v9 = v5;
    unint64_t v10 = [v3 expirationDate];
    id v11 = (void *)v10;
    if ((unint64_t)v9 >= v10) {
      id v12 = v9;
    }
    else {
      id v12 = (void *)v10;
    }
    id v13 = v12;

    id v14 = v13;
    id v15 = [v3 mapItem];
    id v16 = [v15 expirationDate];

    if (v14 >= v16) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = v16;
    }
    id v18 = v17;

    dispatch_time_t v19 = v18;
    id v20 = [v3 mapItem];
    char v21 = [v20 address];
    id v22 = [v21 expirationDate];

    if (v19 >= v22) {
      uint64_t v23 = v19;
    }
    else {
      uint64_t v23 = v22;
    }
    id v5 = v23;

    goto LABEL_21;
  }
  dispatch_time_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __int16 v28 = 0;
    uint64_t v24 = "Invalid parameter not satisfying: place.mapItem.address";
    id v25 = (uint8_t *)&v28;
LABEL_20:
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, v24, v25, 2u);
  }
LABEL_21:

  uint64_t v26 = v5;

  return v26;
}

- (BOOL)_isUpdateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCodeRequired:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 mapItem];
  char v5 = [v4 disputed];

  if (v5)
  {
    double v6 = 10368000.0;
LABEL_7:
    id v18 = [v3 mapItem];
    dispatch_time_t v19 = [v18 address];
    id v20 = [v19 creationDate];
    char v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v6];
    int v22 = [v20 isBeforeDate:v21];

    goto LABEL_8;
  }
  uint64_t v7 = [v3 mapItem];
  int v8 = [v7 address];
  uint64_t v9 = [v8 iso3166CountryCode];
  char v10 = [v9 isEqualToString:&stru_1F33EAD88];

  if (v10)
  {
    double v6 = 2592000.0;
    goto LABEL_7;
  }
  id v11 = [v3 mapItem];
  id v12 = [v11 address];
  id v13 = [v12 iso3166CountryCode];

  if (v13)
  {
    id v14 = [v3 mapItem];
    id v15 = [v14 address];
    id v16 = [v15 iso3166SubdivisionCode];
    BOOL v17 = v16 == 0;

    double v6 = dbl_1DA0FF5B0[v17];
    goto LABEL_7;
  }
  int v22 = 1;
  double v6 = 0.0;
LABEL_8:
  uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = @"NO";
    int v26 = 138412802;
    id v27 = v3;
    if (v22) {
      uint64_t v24 = @"YES";
    }
    __int16 v28 = 2048;
    double v29 = v6;
    __int16 v30 = 2112;
    BOOL v31 = v24;
    _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "ISO 3166 country code and subdivision code refresh for place, %@, refreshInterval, %.2f, required, %@", (uint8_t *)&v26, 0x20u);
  }

  return v22;
}

- (BOOL)_isUpdateLearnedPlaceWithGEOAddressObjectSerializationRequired:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v16) = 0;
    id v14 = "Invalid parameter not satisfying: place";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 2u);
    goto LABEL_15;
  }
  char v5 = [v3 mapItem];

  if (!v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v16) = 0;
    id v14 = "Invalid parameter not satisfying: place.mapItem";
    goto LABEL_14;
  }
  double v6 = [v4 mapItem];
  uint64_t v7 = [v6 address];

  if (!v7)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      id v14 = "Invalid parameter not satisfying: place.mapItem.address";
      goto LABEL_14;
    }
LABEL_15:
    BOOL v11 = 0;
    goto LABEL_16;
  }
  int v8 = [v4 mapItem];
  uint64_t v9 = [v8 address];
  char v10 = [v9 geoAddressData];
  BOOL v11 = v10 == 0;

  id v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = @"NO";
    if (!v10) {
      id v13 = @"YES";
    }
    int v16 = 138412546;
    BOOL v17 = v4;
    __int16 v18 = 2112;
    dispatch_time_t v19 = v13;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "GEOAddressObject serialization, refresh for place, %@, required, %@", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:

  return v11;
}

- (id)_updateLearnedPlaceWithGEOAddressObjectSerialization:(id)a3
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(RTPlatform *)self->_platform iPhoneDevice]
      && [(RTLearnedLocationEngine *)self _isUpdateLearnedPlaceWithGEOAddressObjectSerializationRequired:v4])
    {
      id v5 = objc_alloc(MEMORY[0x1E4F5CE48]);
      double v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      id v71 = (void *)[v5 initWithUseBackgroundTraits:1 analyticsIdentifier:v7];

      *(void *)id v83 = 0;
      uint64_t v84 = v83;
      uint64_t v85 = 0x3032000000;
      long long v86 = __Block_byref_object_copy__36;
      long long v87 = __Block_byref_object_dispose__36;
      id v88 = 0;
      uint64_t v77 = 0;
      __int16 v78 = (id *)&v77;
      uint64_t v79 = 0x3032000000;
      double v80 = __Block_byref_object_copy__36;
      BOOL v81 = __Block_byref_object_dispose__36;
      id v82 = 0;
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      uint64_t v9 = [(RTLearnedLocationEngine *)self mapServiceManager];
      char v10 = [v4 mapItem];
      BOOL v11 = [v10 geoMapItemHandle];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __80__RTLearnedLocationEngine__updateLearnedPlaceWithGEOAddressObjectSerialization___block_invoke;
      v73[3] = &unk_1E6B920F0;
      long long v75 = v83;
      long long v76 = &v77;
      id v12 = v8;
      uint64_t v74 = v12;
      [v9 fetchMapItemFromHandle:v11 options:v71 handler:v73];

      dsema = v12;
      id v13 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v14 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v14)) {
        goto LABEL_13;
      }
      id v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      __int16 v18 = objc_opt_new();
      dispatch_time_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v21 = [v20 filteredArrayUsingPredicate:v19];
      int v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      v92[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v92 count:1];
      int v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v27 = v26;

        char v28 = 0;
      }
      else
      {
LABEL_13:
        id v27 = 0;
        char v28 = 1;
      }

      id v70 = v27;
      if ((v28 & 1) == 0) {
        objc_storeStrong(v78 + 5, v27);
      }
      if (v78[5])
      {
        BOOL v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v60 = v78[5];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v60;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "error fetching GEOAddressObject serialization, %@", buf, 0xCu);
        }

        double v29 = (RTLearnedPlace *)v4;
      }
      else
      {
        uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          id v33 = [*((id *)v84 + 5) shortAddress];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v33;
          __int16 v90 = 2112;
          id v91 = v4;
          _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "update GEOAddressObject serialization, %@, for place, %@", buf, 0x16u);
        }
        id v69 = [(RTLearnedLocationEngine *)self _maximumExpirationDateForLearnedPlace:v4];
        id v34 = [v4 mapItem];
        uint64_t v35 = [v4 mapItem];
        long long v68 = [v35 address];

        id v36 = objc_alloc(MEMORY[0x1E4F5CD80]);
        long long v37 = [v68 identifier];
        uint64_t v38 = *((void *)v84 + 5);
        long long v39 = [v68 subPremises];
        uint64_t v40 = [v68 isIsland];
        uint64_t v41 = [v68 creationDate];
        dispatch_semaphore_t v42 = [v68 iso3166CountryCode];
        id v43 = [v68 iso3166SubdivisionCode];
        uint64_t v64 = (void *)[v36 initWithIdentifier:v37 geoAddressObject:v38 subPremises:v39 isIsland:v40 creationDate:v41 expirationDate:v69 iso3166CountryCode:v42 iso3166SubdivisionCode:v43];

        id v63 = objc_alloc(MEMORY[0x1E4F5CE38]);
        uint64_t v67 = [v34 identifier];
        id v66 = [v34 name];
        uint64_t v65 = [v34 category];
        id v44 = [v34 location];
        uint64_t v62 = [v34 source];
        uint64_t v45 = [v34 mapItemPlaceType];
        uint64_t v46 = [v34 muid];
        uint64_t v47 = [v34 resultProviderID];
        id v48 = [v34 geoMapItemHandle];
        double v49 = [v34 creationDate];
        double v50 = [v34 extendedAttributes];
        uint64_t v51 = [v34 displayLanguage];
        LOBYTE(v61) = [v34 disputed];
        uint64_t v52 = (void *)[v63 initWithIdentifier:v67 name:v66 category:v65 address:v64 location:v44 source:v62 mapItemPlaceType:v45 muid:v46 resultProviderID:v47 geoMapItemHandle:v48 creationDate:v49 expirationDate:v69 extendedAttributes:v50 displayLanguage:v51 disputed:v61];

        uint64_t v53 = [RTLearnedPlace alloc];
        long long v54 = [v4 identifier];
        uint64_t v55 = [v4 type];
        uint64_t v56 = [v4 typeSource];
        uint64_t v57 = [v4 customLabel];
        uint64_t v58 = [v4 creationDate];
        double v29 = [(RTLearnedPlace *)v53 initWithIdentifier:v54 type:v55 typeSource:v56 mapItem:v52 customLabel:v57 creationDate:v58 expirationDate:v69];
      }
      _Block_object_dispose(&v77, 8);

      _Block_object_dispose(v83, 8);
    }
    else
    {
      double v29 = (RTLearnedPlace *)v4;
    }
  }
  else
  {
    __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v83 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v83, 2u);
    }

    double v29 = 0;
  }

  return v29;
}

void __80__RTLearnedLocationEngine__updateLearnedPlaceWithGEOAddressObjectSerialization___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    double v6 = [a2 address];
    uint64_t v7 = [v6 geoAddressObject];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode:(id)a3
{
  v114[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(RTPlatform *)self->_platform iPhoneDevice]
      && [(RTLearnedLocationEngine *)self _isUpdateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCodeRequired:v4])
    {
      *(void *)uint64_t v103 = 0;
      uint64_t v104 = v103;
      uint64_t v105 = 0x3032000000;
      id v106 = __Block_byref_object_copy__36;
      v107 = __Block_byref_object_dispose__36;
      id v108 = 0;
      uint64_t v97 = 0;
      id v98 = &v97;
      uint64_t v99 = 0x3032000000;
      objc_super v100 = __Block_byref_object_copy__36;
      v101 = __Block_byref_object_dispose__36;
      id v102 = 0;
      uint64_t v91 = 0;
      id v92 = (id *)&v91;
      uint64_t v93 = 0x3032000000;
      id v94 = __Block_byref_object_copy__36;
      uint64_t v95 = __Block_byref_object_dispose__36;
      id v96 = 0;
      id v5 = objc_alloc(MEMORY[0x1E4F5CE48]);
      double v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v84 = (void *)[v5 initWithUseBackgroundTraits:1 analyticsIdentifier:v7];

      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      uint64_t v9 = [(RTLearnedLocationEngine *)self mapServiceManager];
      uint64_t v10 = [v4 mapItem];
      BOOL v11 = [v10 location];
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __87__RTLearnedLocationEngine__updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode___block_invoke;
      v86[3] = &unk_1E6B90908;
      id v88 = v103;
      id v89 = &v97;
      __int16 v90 = &v91;
      id v12 = v8;
      long long v87 = v12;
      [v9 fetchCountryAndSubdivisionCodesFromLocation:v11 options:v84 handler:v86];

      dsema = v12;
      id v13 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v14 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v14)) {
        goto LABEL_13;
      }
      id v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      __int16 v18 = objc_opt_new();
      dispatch_time_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v21 = [v20 filteredArrayUsingPredicate:v19];
      int v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      v114[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v114 count:1];
      int v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v27 = v26;

        char v28 = 0;
      }
      else
      {
LABEL_13:
        id v27 = 0;
        char v28 = 1;
      }

      id v83 = v27;
      if ((v28 & 1) == 0) {
        objc_storeStrong(v92 + 5, v27);
      }
      if (v92[5])
      {
        BOOL v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v61 = v92[5];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v61;
          _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "error fetching ISO 3166 country and subdivision codes, %@", buf, 0xCu);
        }

        double v29 = (RTLearnedPlace *)v4;
      }
      else
      {
        uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = *((void *)v104 + 5);
          uint64_t v34 = v98[5];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v33;
          __int16 v110 = 2112;
          uint64_t v111 = v34;
          __int16 v112 = 2112;
          id v113 = v4;
          _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "update ISO 3166 country code, %@, subdivision code, %@, for place, %@", buf, 0x20u);
        }

        uint64_t v35 = [v4 mapItem];
        id v36 = [v35 address];

        id v82 = [(RTLearnedLocationEngine *)self _maximumExpirationDateForLearnedPlace:v4];
        id v64 = objc_alloc(MEMORY[0x1E4F5CD80]);
        double v80 = [v36 identifier];
        __int16 v78 = [v36 geoAddressData];
        long long v76 = [v36 subPremises];
        uint64_t v67 = [v36 subThoroughfare];
        uint64_t v74 = [v36 thoroughfare];
        id v72 = [v36 subLocality];
        id v70 = [v36 locality];
        id v66 = [v36 subAdministrativeArea];
        id v69 = [v36 administrativeArea];
        long long v68 = [v36 administrativeAreaCode];
        long long v37 = [v36 postalCode];
        uint64_t v38 = [v36 country];
        long long v39 = [v36 countryCode];
        uint64_t v40 = [v36 inlandWater];
        uint64_t v41 = [v36 ocean];
        dispatch_semaphore_t v42 = [v36 areasOfInterest];
        char v43 = [v36 isIsland];
        id v44 = [v36 creationDate];
        LOBYTE(v63) = v43;
        uint64_t v65 = objc_msgSend(v64, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v80, v78, v76, v67, v74, v72, v70, v66, v69, v68, v37, v38, v39, v40,
                        v41,
                        v42,
                        v63,
                        v44,
                        v82,
                        *((void *)v104 + 5),
                        v98[5]);

        uint64_t v45 = [v4 mapItem];
        id v73 = objc_alloc(MEMORY[0x1E4F5CE38]);
        uint64_t v79 = [v45 identifier];
        uint64_t v77 = [v45 name];
        BOOL v81 = [v45 category];
        long long v75 = [v45 location];
        uint64_t v71 = [v45 source];
        uint64_t v46 = [v45 mapItemPlaceType];
        uint64_t v47 = [v45 muid];
        uint64_t v48 = [v45 resultProviderID];
        double v49 = [v45 geoMapItemHandle];
        double v50 = [v45 creationDate];
        uint64_t v51 = [v45 extendedAttributes];
        uint64_t v52 = [v45 displayLanguage];
        LOBYTE(v62) = [v45 disputed];
        uint64_t v53 = (void *)[v73 initWithIdentifier:v79 name:v77 category:v81 address:v65 location:v75 source:v71 mapItemPlaceType:v46 muid:v47 resultProviderID:v48 geoMapItemHandle:v49 creationDate:v50 expirationDate:v82 extendedAttributes:v51 displayLanguage:v52 disputed:v62];

        long long v54 = [RTLearnedPlace alloc];
        uint64_t v55 = [v4 identifier];
        uint64_t v56 = [v4 type];
        uint64_t v57 = [v4 typeSource];
        uint64_t v58 = [v4 customLabel];
        uint64_t v59 = [v4 creationDate];
        double v29 = [(RTLearnedPlace *)v54 initWithIdentifier:v55 type:v56 typeSource:v57 mapItem:v53 customLabel:v58 creationDate:v59 expirationDate:v82];
      }
      _Block_object_dispose(&v91, 8);

      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(v103, 8);
    }
    else
    {
      double v29 = (RTLearnedPlace *)v4;
    }
  }
  else
  {
    __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v103 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v103, 2u);
    }

    double v29 = 0;
  }

  return v29;
}

void __87__RTLearnedLocationEngine__updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  if ([v20 count])
  {
    double v6 = [v20 firstObject];
    uint64_t v7 = [v6 address];
    uint64_t v8 = [v7 iso3166CountryCode];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    BOOL v11 = [v20 firstObject];
    id v12 = [v11 address];
    uint64_t v13 = [v12 iso3166SubdivisionCode];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    double v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = &stru_1F33EAD88;

    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v11 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = &stru_1F33EAD88;
  }

  if ([v5 code] == -8) {
    dispatch_time_t v19 = 0;
  }
  else {
    dispatch_time_t v19 = v5;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v19);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isUpdateLearnedPlaceWithPOICategoryCodeRequired:(id)a3
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  if (!v5)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v67) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", (uint8_t *)&v67, 2u);
    }

    goto LABEL_26;
  }
  uint64_t v7 = [v5 mapItem];
  if ([v7 mapItemPlaceType] != 2)
  {
    uint64_t v9 = [v6 mapItem];
    uint64_t v10 = [v9 mapItemPlaceType];

    if (v10 == 1) {
      goto LABEL_8;
    }
    id v44 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      uint64_t v45 = NSStringFromSelector(a2);
      LODWORD(v67) = 138412290;
      *(void *)((char *)&v67 + 4) = v45;
      _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, not POI or AOI, skip category update", (uint8_t *)&v67, 0xCu);
    }
LABEL_26:
    BOOL v43 = 0;
    goto LABEL_27;
  }

LABEL_8:
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  *(void *)&long long v67 = 0;
  *((void *)&v67 + 1) = &v67;
  uint64_t v68 = 0x3032000000;
  id v69 = __Block_byref_object_copy__36;
  id v70 = __Block_byref_object_dispose__36;
  id v71 = 0;
  BOOL v11 = [v6 mapItem];
  id v12 = [v11 category];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F5D008]];

  if (v13)
  {
    *((unsigned char *)v57 + 24) = 1;
  }
  else
  {
    uint64_t v14 = [v6 mapItem];
    id v15 = [v14 category];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      double v49 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      double v17 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v48 = [v49 components:12 fromDate:v17];

      uint64_t v18 = [v49 dateFromComponents:v48];
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      id v20 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      char v21 = [v6 identifier];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __76__RTLearnedLocationEngine__isUpdateLearnedPlaceWithPOICategoryCodeRequired___block_invoke;
      v50[3] = &unk_1E6B93EB0;
      SEL v55 = a2;
      uint64_t v53 = &v67;
      id v47 = v18;
      id v51 = v47;
      long long v54 = &v56;
      int v22 = v19;
      uint64_t v52 = v22;
      [v20 fetchLastVisitToPlaceWithIdentifier:v21 handler:v50];

      uint64_t v23 = v22;
      uint64_t v24 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v25 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v23, v25))
      {
        int v26 = [[MEMORY[0x1E4F1C9C8] now:v47];
        [v26 timeIntervalSinceDate:v24];
        double v28 = v27;
        double v29 = objc_opt_new();
        __int16 v30 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
        BOOL v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v32 = [v31 filteredArrayUsingPredicate:v30];
        uint64_t v33 = [v32 firstObject];

        [v29 submitToCoreAnalytics:v33 type:1 duration:v28];
        uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
        v72[0] = *MEMORY[0x1E4F28568];
        *(void *)buf = @"semaphore wait timeout";
        id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v72 count:1];
        long long v37 = [v35 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v36];

        if (v37) {
      }
        }
    }
  }
  uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    uint64_t v39 = NSStringFromSelector(a2);
    uint64_t v40 = (void *)v39;
    uint64_t v41 = *(void *)(*((void *)&v67 + 1) + 40);
    if (*((unsigned char *)v57 + 24)) {
      dispatch_semaphore_t v42 = @"YES";
    }
    else {
      dispatch_semaphore_t v42 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v39;
    __int16 v61 = 2112;
    uint64_t v62 = v6;
    __int16 v63 = 2112;
    uint64_t v64 = v41;
    __int16 v65 = 2112;
    id v66 = v42;
    _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, POI Category refresh for place, %@, last visit, %@, required, %@", buf, 0x2Au);
  }
  BOOL v43 = *((unsigned char *)v57 + 24) != 0;
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v56, 8);
LABEL_27:

  return v43;
}

void __76__RTLearnedLocationEngine__isUpdateLearnedPlaceWithPOICategoryCodeRequired___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v14 = 138412802;
    id v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, fetched visit, %@, error, %@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  BOOL v11 = [v10 entryDate];
  int v12 = [v11 isBeforeDate:*(void *)(a1 + 32)];

  if (v12) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_updateLearnedPlaceWithCategory:(id)a3
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(RTPlatform *)self->_platform iPhoneDevice]
      && [(RTLearnedLocationEngine *)self _isUpdateLearnedPlaceWithPOICategoryCodeRequired:v4])
    {
      id v5 = objc_alloc(MEMORY[0x1E4F5CE48]);
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v62 = (void *)[v5 initWithUseBackgroundTraits:1 analyticsIdentifier:v7];

      *(void *)id v73 = 0;
      uint64_t v74 = v73;
      uint64_t v75 = 0x3032000000;
      long long v76 = __Block_byref_object_copy__36;
      uint64_t v77 = __Block_byref_object_dispose__36;
      id v78 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = (id *)&v67;
      uint64_t v69 = 0x3032000000;
      id v70 = __Block_byref_object_copy__36;
      id v71 = __Block_byref_object_dispose__36;
      id v72 = 0;
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      uint64_t v9 = [(RTLearnedLocationEngine *)self mapServiceManager];
      id v10 = [v4 mapItem];
      BOOL v11 = [v10 geoMapItemHandle];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __59__RTLearnedLocationEngine__updateLearnedPlaceWithCategory___block_invoke;
      void v63[3] = &unk_1E6B920F0;
      __int16 v65 = v73;
      id v66 = &v67;
      int v12 = v8;
      uint64_t v64 = v12;
      [v9 fetchMapItemFromHandle:v11 options:v62 handler:v63];

      int v13 = v12;
      int v14 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v15 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v13, v15)) {
        goto LABEL_13;
      }
      __int16 v16 = [MEMORY[0x1E4F1C9C8] now];
      [v16 timeIntervalSinceDate:v14];
      double v18 = v17;
      id v19 = objc_opt_new();
      uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      char v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v22 = [v21 filteredArrayUsingPredicate:v20];
      uint64_t v23 = [v22 firstObject];

      [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
      uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      dispatch_time_t v25 = (void *)MEMORY[0x1E4F28C58];
      v82[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v82 count:1];
      double v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

      if (v27)
      {
        id v28 = v27;

        char v29 = 0;
      }
      else
      {
LABEL_13:
        id v28 = 0;
        char v29 = 1;
      }

      id v61 = v28;
      if ((v29 & 1) == 0) {
        objc_storeStrong(v68 + 5, v28);
      }
      if (v68[5])
      {
        uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v51 = v68[5];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v51;
          _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "error fetching category, %@", buf, 0xCu);
        }

        __int16 v30 = (RTLearnedPlace *)v4;
      }
      else
      {
        uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = *((void *)v74 + 5);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v34;
          __int16 v80 = 2112;
          id v81 = v4;
          _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "update POI Category, %@, for place, %@", buf, 0x16u);
        }

        id v60 = [(RTLearnedLocationEngine *)self _maximumExpirationDateForLearnedPlace:v4];
        uint64_t v35 = [v4 mapItem];
        id v55 = objc_alloc(MEMORY[0x1E4F5CE38]);
        char v59 = [v35 identifier];
        uint64_t v58 = [v35 name];
        uint64_t v54 = *((void *)v74 + 5);
        uint64_t v57 = [v35 address];
        uint64_t v56 = [v35 location];
        uint64_t v53 = [v35 source];
        uint64_t v36 = [v35 mapItemPlaceType];
        uint64_t v37 = [v35 muid];
        uint64_t v38 = [v35 resultProviderID];
        uint64_t v39 = [v35 geoMapItemHandle];
        uint64_t v40 = [v35 creationDate];
        uint64_t v41 = [v35 extendedAttributes];
        dispatch_semaphore_t v42 = [v35 displayLanguage];
        LOBYTE(v52) = [v35 disputed];
        BOOL v43 = (void *)[v55 initWithIdentifier:v59 name:v58 category:v54 address:v57 location:v56 source:v53 mapItemPlaceType:v36 muid:v37 resultProviderID:v38 geoMapItemHandle:v39 creationDate:v40 expirationDate:v60 extendedAttributes:v41 displayLanguage:v42 disputed:v52];

        id v44 = [RTLearnedPlace alloc];
        uint64_t v45 = [v4 identifier];
        uint64_t v46 = [v4 type];
        uint64_t v47 = [v4 typeSource];
        uint64_t v48 = [v4 customLabel];
        double v49 = [v4 creationDate];
        __int16 v30 = [(RTLearnedPlace *)v44 initWithIdentifier:v45 type:v46 typeSource:v47 mapItem:v43 customLabel:v48 creationDate:v49 expirationDate:v60];
      }
      _Block_object_dispose(&v67, 8);

      _Block_object_dispose(v73, 8);
    }
    else
    {
      __int16 v30 = (RTLearnedPlace *)v4;
    }
  }
  else
  {
    BOOL v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v73 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v73, 2u);
    }

    __int16 v30 = 0;
  }

  return v30;
}

void __59__RTLearnedLocationEngine__updateLearnedPlaceWithCategory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 category];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isUpdateLearnedPlaceWithMapItemPlaceTypeRequired:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 mapItem];
    uint64_t v6 = [v5 mapItemPlaceType];
    BOOL v7 = v6 == 1000;

    dispatch_semaphore_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      if (v6 == 1000) {
        uint64_t v9 = @"YES";
      }
      int v11 = 138412546;
      int v12 = v4;
      __int16 v13 = 2112;
      int v14 = v9;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Map Item Place Type refresh for place, %@, required, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    dispatch_semaphore_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", (uint8_t *)&v11, 2u);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_updateLearnedPlaceWithMapItemPlaceType:(id)a3
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(RTPlatform *)self->_platform iPhoneDevice]
      && [(RTLearnedLocationEngine *)self _isUpdateLearnedPlaceWithMapItemPlaceTypeRequired:v4])
    {
      id v5 = objc_alloc(MEMORY[0x1E4F5CE48]);
      uint64_t v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      uint64_t v62 = (void *)[v5 initWithUseBackgroundTraits:1 analyticsIdentifier:v7];

      uint64_t v73 = 0;
      uint64_t v74 = &v73;
      uint64_t v75 = 0x2020000000;
      uint64_t v76 = 0;
      *(void *)uint64_t v67 = 0;
      uint64_t v68 = v67;
      uint64_t v69 = 0x3032000000;
      id v70 = __Block_byref_object_copy__36;
      id v71 = __Block_byref_object_dispose__36;
      id v72 = 0;
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      uint64_t v9 = [(RTLearnedLocationEngine *)self mapServiceManager];
      id v10 = [v4 mapItem];
      int v11 = [v10 geoMapItemHandle];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __67__RTLearnedLocationEngine__updateLearnedPlaceWithMapItemPlaceType___block_invoke;
      void v63[3] = &unk_1E6B920F0;
      __int16 v65 = &v73;
      id v66 = v67;
      int v12 = v8;
      uint64_t v64 = v12;
      [v9 fetchMapItemFromHandle:v11 options:v62 handler:v63];

      __int16 v13 = v12;
      int v14 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v15 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v13, v15)) {
        goto LABEL_13;
      }
      __int16 v16 = [MEMORY[0x1E4F1C9C8] now];
      [v16 timeIntervalSinceDate:v14];
      double v18 = v17;
      id v19 = objc_opt_new();
      uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      char v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v22 = [v21 filteredArrayUsingPredicate:v20];
      uint64_t v23 = [v22 firstObject];

      [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
      uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      dispatch_time_t v25 = (void *)MEMORY[0x1E4F28C58];
      v80[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v80 count:1];
      double v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

      if (v27)
      {
        id v28 = v27;

        char v29 = 0;
      }
      else
      {
LABEL_13:
        id v28 = 0;
        char v29 = 1;
      }

      id v61 = v28;
      if ((v29 & 1) == 0) {
        objc_storeStrong((id *)v68 + 5, v28);
      }
      if (*((void *)v68 + 5))
      {
        uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v51 = *((void *)v68 + 5);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v51;
          _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "error fetching category, %@", buf, 0xCu);
        }

        __int16 v30 = (RTLearnedPlace *)v4;
      }
      else
      {
        uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = [MEMORY[0x1E4F5CE38] placeTypeToString:v74[3]];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v34;
          __int16 v78 = 2112;
          id v79 = v4;
          _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "update Map Item Place Type, %@, for place, %@", buf, 0x16u);
        }
        id v60 = [(RTLearnedLocationEngine *)self _maximumExpirationDateForLearnedPlace:v4];
        uint64_t v35 = [v4 mapItem];
        id v54 = objc_alloc(MEMORY[0x1E4F5CE38]);
        uint64_t v58 = [v35 identifier];
        uint64_t v57 = [v35 name];
        char v59 = [v35 category];
        uint64_t v56 = [v35 address];
        id v55 = [v35 location];
        uint64_t v53 = [v35 source];
        uint64_t v36 = v74[3];
        uint64_t v37 = [v35 muid];
        uint64_t v38 = [v35 resultProviderID];
        uint64_t v39 = [v35 geoMapItemHandle];
        uint64_t v40 = [v35 creationDate];
        uint64_t v41 = [v35 extendedAttributes];
        dispatch_semaphore_t v42 = [v35 displayLanguage];
        LOBYTE(v52) = [v35 disputed];
        BOOL v43 = (void *)[v54 initWithIdentifier:v58 name:v57 category:v59 address:v56 location:v55 source:v53 mapItemPlaceType:v36 muid:v37 resultProviderID:v38 geoMapItemHandle:v39 creationDate:v40 expirationDate:v60 extendedAttributes:v41 displayLanguage:v42 disputed:v52];

        id v44 = [RTLearnedPlace alloc];
        uint64_t v45 = [v4 identifier];
        uint64_t v46 = [v4 type];
        uint64_t v47 = [v4 typeSource];
        uint64_t v48 = [v4 customLabel];
        double v49 = [v4 creationDate];
        __int16 v30 = [(RTLearnedPlace *)v44 initWithIdentifier:v45 type:v46 typeSource:v47 mapItem:v43 customLabel:v48 creationDate:v49 expirationDate:v60];
      }
      _Block_object_dispose(v67, 8);

      _Block_object_dispose(&v73, 8);
    }
    else
    {
      __int16 v30 = (RTLearnedPlace *)v4;
    }
  }
  else
  {
    BOOL v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v67 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v67, 2u);
    }

    __int16 v30 = 0;
  }

  return v30;
}

void __67__RTLearnedLocationEngine__updateLearnedPlaceWithMapItemPlaceType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 mapItemPlaceType];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_updateUnlabeledVisitsWithPlaceInformation:(id)a3
{
  v322[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v200 = v3;
  if (v3)
  {
    [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v3 count]];
    os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    v206 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v200 count]];
    v202 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v200 count]];
    v249 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[v200 count]];
    long long v306 = 0u;
    long long v307 = 0u;
    long long v304 = 0u;
    long long v305 = 0u;
    id obj = v200;
    id v270 = (id)[obj countByEnumeratingWithState:&v304 objects:v321 count:16];
    if (!v270) {
      goto LABEL_27;
    }
    uint64_t v267 = *(void *)v305;
    while (1)
    {
      id v4 = 0;
      do
      {
        if (*(void *)v305 != v267) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v304 + 1) + 8 * (void)v4);
        id v303 = 0;
        id v302 = 0;
        uint64_t v6 = [(RTLearnedLocationEngine *)self _bestInferredMapItemForVisit:v5 bestFinerGranularityInferredMapItem:&v303 error:&v302];
        id v7 = v303;
        id v8 = v302;
        uint64_t v9 = [v6 mapItem];
        if (!v8)
        {
          id v301 = 0;
          int v11 = [(RTLearnedLocationEngine *)self _placeForMapItem:v9 error:&v301];
          id v10 = v301;
          if (v10)
          {
            int v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v5;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v9;
              *(_WORD *)&buf[22] = 2112;
              v317 = (uint64_t (*)(uint64_t, uint64_t))v10;
              _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "failed to find place for visit, %@, with mapitem, %@, error, %@", buf, 0x20u);
            }
            goto LABEL_13;
          }
          if (v11)
          {
            [v6 confidence];
            [v5 setPlaceConfidence:];
            [v5 setPlaceSource:[v6 source]];
            __int16 v13 = [v11 identifier];
            [oslog setObject:v11 forKeyedSubscript:v13];

            int v14 = [v11 identifier];
            int v12 = [v206 objectForKeyedSubscript:v14];

            if (!v12)
            {
              int v12 = [MEMORY[0x1E4F1CA48] array];
              dispatch_time_t v15 = [v11 identifier];
              [v206 setObject:v12 forKeyedSubscript:v15];
            }
            [v12 addObject:v5];
            if (v7)
            {
              v261 = [v7 mapItem];
              id v300 = 0;
              v259 = [(RTLearnedLocationEngine *)self _storedMapItemForMapItem:v261 error:&v300];
              dispatch_semaphore_t dsema = (dispatch_semaphore_t)v300;
              if (dsema)
              {
                __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v5;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v261;
                  *(_WORD *)&buf[22] = 2112;
                  v317 = (uint64_t (*)(uint64_t, uint64_t))dsema;
                  _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "failed to find finer granularity mapItem for visit, %@, with mapitem, %@, error, %@", buf, 0x20u);
                }
              }
              else
              {
                id v17 = objc_alloc(MEMORY[0x1E4F5CDF8]);
                [v7 confidence];
                __int16 v16 = [v17 initWithMapItem:v259 confidence:objc_msgSend(v7, "source") source:v18];
                id v19 = [v5 identifier];
                [v249 setObject:v16 forKeyedSubscript:v19];
              }
            }
LABEL_13:
          }
          goto LABEL_15;
        }
        id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v5;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "failed to find mapItem for visit, %@, error, %@", buf, 0x16u);
        }
LABEL_15:

        id v4 = (char *)v4 + 1;
      }
      while (v270 != v4);
      uint64_t v20 = [obj countByEnumeratingWithState:&v304 objects:v321 count:16];
      id v270 = (id)v20;
      if (!v20)
      {
LABEL_27:

        dispatch_semaphore_t v204 = dispatch_semaphore_create(0);
        long long v296 = 0u;
        long long v297 = 0u;
        long long v298 = 0u;
        long long v299 = 0u;
        id v201 = [oslog allKeys];
        uint64_t v205 = [v201 countByEnumeratingWithState:&v296 objects:v320 count:16];
        if (v205)
        {
          id obja = 0;
          uint64_t v203 = *(void *)v297;
          uint64_t v251 = *MEMORY[0x1E4F5CFE8];
          uint64_t v252 = *MEMORY[0x1E4F28568];
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v297 != v203)
              {
                uint64_t v22 = v21;
                objc_enumerationMutation(v201);
                uint64_t v21 = v22;
              }
              uint64_t v207 = v21;
              uint64_t v253 = *(void *)(*((void *)&v296 + 1) + 8 * v21);
              uint64_t v23 = -[NSObject objectForKeyedSubscript:](oslog, "objectForKeyedSubscript:");
              uint64_t v24 = [(RTLearnedLocationEngine *)self _updateLearnedPlaceWithISO3166CountryCodeAndSubdivisionCode:v23];
              [oslog setObject:v24 forKeyedSubscript:v253];

              dispatch_time_t v25 = [oslog objectForKeyedSubscript:v253];

              int v26 = [(RTLearnedLocationEngine *)self _updateLearnedPlaceWithCategory:v25];
              [oslog setObject:v26 forKeyedSubscript:v253];

              double v27 = [oslog objectForKeyedSubscript:v253];

              id v28 = [(RTLearnedLocationEngine *)self _updateLearnedPlaceWithGEOAddressObjectSerialization:v27];
              [oslog setObject:v28 forKeyedSubscript:v253];

              v248 = [oslog objectForKeyedSubscript:v253];

              char v29 = [(RTLearnedLocationEngine *)self _updateLearnedPlaceWithMapItemPlaceType:v248];
              [oslog setObject:v29 forKeyedSubscript:v253];

              uint64_t v292 = 0;
              v293 = &v292;
              uint64_t v294 = 0x2020000000;
              uint64_t v295 = 0;
              __int16 v30 = [(RTLearnedLocationEngine *)self learnedLocationStore];
              v289[0] = MEMORY[0x1E4F143A8];
              v289[1] = 3221225472;
              v289[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke;
              v289[3] = &unk_1E6B938D8;
              v291 = &v292;
              BOOL v31 = v204;
              v290 = v31;
              [v30 fetchCountOfVisitsToPlaceWithIdentifier:v253 handler:v289];

              dsemaa = v31;
              uint64_t v32 = [MEMORY[0x1E4F1C9C8] now];
              dispatch_time_t v33 = dispatch_time(0, 3600000000000);
              id v34 = obja;
              if (dispatch_semaphore_wait(dsemaa, v33))
              {
                uint64_t v35 = [MEMORY[0x1E4F1C9C8] now];
                [v35 timeIntervalSinceDate:v32];
                double v37 = v36;
                uint64_t v38 = objc_opt_new();
                uint64_t v39 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
                uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
                uint64_t v41 = [v40 filteredArrayUsingPredicate:v39];
                dispatch_semaphore_t v42 = [v41 firstObject];

                [v38 submitToCoreAnalytics:v42 type:1 duration:v37];
                BOOL v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
                }

                id v44 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v310 = v252;
                *(void *)buf = @"semaphore wait timeout";
                uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v310 count:1];
                uint64_t v46 = [v44 errorWithDomain:v251 code:15 userInfo:v45];

                id v34 = obja;
                if (v46)
                {
                  id v34 = v46;
                }
              }

              id v47 = v34;
              v262 = [v206 objectForKeyedSubscript:v253];
              uint64_t v48 = [v262 count];
              uint64_t v49 = v293[3];
              if ((unint64_t)(v49 + v48) >= 2)
              {
                if (v49 == 1)
                {
                  double v50 = [(RTLearnedLocationEngine *)self learnedLocationStore];
                  v286[0] = MEMORY[0x1E4F143A8];
                  v286[1] = 3221225472;
                  v286[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_2;
                  v286[3] = &unk_1E6B93ED8;
                  id v287 = v262;
                  uint64_t v51 = dsemaa;
                  v288 = v51;
                  [v50 fetchLastVisitToPlaceWithIdentifier:v253 handler:v286];

                  uint64_t v52 = v51;
                  uint64_t v53 = [MEMORY[0x1E4F1C9C8] now];
                  dispatch_time_t v54 = dispatch_time(0, 3600000000000);
                  id v55 = v47;
                  if (dispatch_semaphore_wait(v52, v54))
                  {
                    uint64_t v56 = [MEMORY[0x1E4F1C9C8] now];
                    [v56 timeIntervalSinceDate:v53];
                    double v58 = v57;
                    char v59 = objc_opt_new();
                    id v60 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
                    id v61 = [MEMORY[0x1E4F29060] callStackSymbols];
                    uint64_t v62 = [v61 filteredArrayUsingPredicate:v60];
                    __int16 v63 = [v62 firstObject];

                    [v59 submitToCoreAnalytics:v63 type:1 duration:v58];
                    uint64_t v64 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
                    }

                    __int16 v65 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v310 = v252;
                    *(void *)buf = @"semaphore wait timeout";
                    id v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v310 count:1];
                    uint64_t v67 = [v65 errorWithDomain:v251 code:15 userInfo:v66];

                    id v55 = v47;
                    if (v67)
                    {
                      id v55 = v67;
                    }
                  }

                  id v68 = v55;
                  id v47 = v68;
                }
                unint64_t v268 = 0;
                v260 = 0;
                while (1)
                {
                  id obja = v47;
                  if (v268 >= [v262 count]) {
                    break;
                  }
                  uint64_t v69 = [v262 objectAtIndexedSubscript:];
                  id v70 = [v69 exitDate];
                  id v71 = [v70 dateByAddingTimeInterval:4838400.0];

                  id v72 = v260;
                  if (!v260 || (id v72 = v260, [v260 compare:v71] == -1))
                  {
                    id v73 = v71;

                    v260 = v73;
                  }
                  uint64_t v74 = [v69 expirationDate];
                  BOOL v75 = [v74 compare:v71] == -1;

                  if (v75)
                  {
                    uint64_t v76 = [RTLearnedVisit alloc];
                    uint64_t v77 = [v69 identifier];
                    __int16 v78 = [v69 location];
                    id v79 = [v69 entryDate];
                    __int16 v80 = [v69 exitDate];
                    id v81 = [v69 creationDate];
                    [v69 placeConfidence];
                    id v83 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v76, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v77, v78, v79, v80, v81, v71, v82, [v69 placeSource]);

                    if (v83) {
                      [v262 setObject:v83 atIndexedSubscript:v268];
                    }
                  }
                  id v271 = v71;
                  *(void *)buf = 0;
                  *(void *)&uint8_t buf[8] = buf;
                  *(void *)&uint8_t buf[16] = 0x3032000000;
                  v317 = __Block_byref_object_copy__36;
                  v318 = __Block_byref_object_dispose__36;
                  id v319 = 0;
                  uint64_t v310 = 0;
                  v311 = (id *)&v310;
                  uint64_t v312 = 0x3032000000;
                  v313 = __Block_byref_object_copy__36;
                  v314 = __Block_byref_object_dispose__36;
                  id v315 = 0;
                  uint64_t v84 = [(RTLearnedLocationEngine *)self learnedLocationStore];
                  uint64_t v85 = [v69 identifier];
                  v282[0] = MEMORY[0x1E4F143A8];
                  v282[1] = 3221225472;
                  v282[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_3;
                  v282[3] = &unk_1E6B93F00;
                  v284 = buf;
                  v285 = &v310;
                  long long v86 = dsemaa;
                  v283 = v86;
                  [v84 fetchTransitionWithDestinationIdentifier:v85 handler:v282];

                  long long v87 = v86;
                  id v88 = [MEMORY[0x1E4F1C9C8] now];
                  dispatch_time_t v89 = dispatch_time(0, 3600000000000);
                  if (!dispatch_semaphore_wait(v87, v89)) {
                    goto LABEL_60;
                  }
                  __int16 v90 = [MEMORY[0x1E4F1C9C8] now];
                  [v90 timeIntervalSinceDate:v88];
                  double v92 = v91;
                  uint64_t v93 = objc_opt_new();
                  id v94 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
                  uint64_t v95 = [MEMORY[0x1E4F29060] callStackSymbols];
                  id v96 = [v95 filteredArrayUsingPredicate:v94];
                  uint64_t v97 = [v96 firstObject];

                  [v93 submitToCoreAnalytics:v97 type:1 duration:v92];
                  id v98 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)v309 = 0;
                    _os_log_fault_impl(&dword_1D9BFA000, v98, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v309, 2u);
                  }

                  uint64_t v99 = (void *)MEMORY[0x1E4F28C58];
                  v322[0] = v252;
                  *(void *)v309 = @"semaphore wait timeout";
                  objc_super v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v309 forKeys:v322 count:1];
                  v101 = [v99 errorWithDomain:v251 code:15 userInfo:v100];

                  if (v101)
                  {
                    id v102 = v101;

                    char v103 = 0;
                  }
                  else
                  {
LABEL_60:
                    char v103 = 1;
                    id v102 = obja;
                  }

                  id v47 = v102;
                  if ((v103 & 1) == 0) {
                    objc_storeStrong(v311 + 5, v102);
                  }
                  if (v311[5] || (uint64_t v105 = *(void **)(*(void *)&buf[8] + 40)) == 0)
                  {
                    uint64_t v104 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v309 = 138412290;
                      *(void *)&v309[4] = v69;
                      _os_log_error_impl(&dword_1D9BFA000, v104, OS_LOG_TYPE_ERROR, "failed to find transition for visit, %@", v309, 0xCu);
                    }
                  }
                  else
                  {
                    id v106 = [v105 expirationDate];
                    BOOL v107 = [v106 compare:v271] == -1;

                    if (v107)
                    {
                      id v108 = [RTLearnedTransition alloc];
                      long long v109 = [*(id *)(*(void *)&buf[8] + 40) identifier];
                      __int16 v110 = [*(id *)(*(void *)&buf[8] + 40) startDate];
                      uint64_t v111 = [*(id *)(*(void *)&buf[8] + 40) stopDate];
                      __int16 v112 = [*(id *)(*(void *)&buf[8] + 40) visitIdentifierOrigin];
                      id v113 = [*(id *)(*(void *)&buf[8] + 40) visitIdentifierDestination];
                      long long v114 = [*(id *)(*(void *)&buf[8] + 40) creationDate];
                      long long v115 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v108, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v109, v110, v111, v112, v113, v114, v271, [*(id *)(*(void *)&buf[8] + 40) predominantMotionActivityType]);

                      if (v115) {
                        [v202 addObject:v115];
                      }
                    }
                    uint64_t v104 = v271;
                    long long v116 = [v69 identifier];
                    v117 = [v249 objectForKeyedSubscript:v116];

                    if (v117)
                    {
                      v118 = [v117 mapItem];
                      v119 = [v118 expirationDate];
                      BOOL v120 = [v119 compare:v104] == -1;

                      if (v120)
                      {
                        long long v121 = [v117 mapItem];
                        v210 = [v121 address];

                        id v208 = objc_alloc(MEMORY[0x1E4F5CD80]);
                        v229 = [v210 identifier];
                        v226 = [v210 geoAddressData];
                        v223 = [v210 subPremises];
                        id objb = [v210 subThoroughfare];
                        v244 = [v210 thoroughfare];
                        v221 = [v210 subLocality];
                        v219 = [v210 locality];
                        v217 = [v210 subAdministrativeArea];
                        v240 = [v210 administrativeArea];
                        v214 = [v210 administrativeAreaCode];
                        v213 = [v210 postalCode];
                        v212 = [v210 country];
                        v236 = [v210 countryCode];
                        v232 = [v210 inlandWater];
                        v211 = [v210 ocean];
                        long long v122 = [v210 areasOfInterest];
                        char v123 = [v210 isIsland];
                        long long v124 = [v210 creationDate];
                        v125 = [v210 iso3166CountryCode];
                        uint64_t v126 = [v210 iso3166SubdivisionCode];
                        LOBYTE(v199) = v123;
                        v209 = objc_msgSend(v208, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v229, v226, v223, objb, v244, v221, v219, v217, v240, v214, v213, v212, v236, v232,
                                         v211,
                                         v122,
                                         v199,
                                         v124,
                                         v104,
                                         v125,
                                         v126);

                        v127 = [v117 mapItem];
                        id v233 = objc_alloc(MEMORY[0x1E4F5CE38]);
                        id v128 = [v127 identifier];
                        id objc = [v127 name];
                        v245 = [v127 category];
                        v241 = [v127 location];
                        uint64_t v230 = [v127 source];
                        uint64_t v227 = [v127 mapItemPlaceType];
                        uint64_t v224 = [v127 muid];
                        uint64_t v129 = [v127 resultProviderID];
                        v237 = [v127 geoMapItemHandle];
                        v130 = [v127 creationDate];
                        uint64_t v131 = [v127 extendedAttributes];
                        uint64_t v132 = [v127 displayLanguage];
                        LOBYTE(v197) = [v127 disputed];
                        v133 = (void *)[v233 initWithIdentifier:v128 name:objc category:v245 address:v209 location:v241 source:v230 mapItemPlaceType:v227 muid:v224 resultProviderID:v129 geoMapItemHandle:v237 creationDate:v130 expirationDate:v104 extendedAttributes:v131 displayLanguage:v132 disputed:v197];

                        id v134 = objc_alloc(MEMORY[0x1E4F5CDF8]);
                        [v117 confidence];
                        v136 = [v134 initWithMapItem:v133 confidence:objc_msgSend(v117, "source") source:v135];
                        uint64_t v137 = [v69 identifier];
                        [v249 setObject:v136 forKeyedSubscript:v137];
                      }
                    }
                  }
                  _Block_object_dispose(&v310, 8);

                  _Block_object_dispose(buf, 8);
                  ++v268;
                }
                uint64_t v138 = v260;
                if (v260)
                {
                  id v269 = v260;
                  id v272 = [oslog objectForKeyedSubscript:v253];
                  v139 = [v272 expirationDate];
                  BOOL v140 = [v139 compare:v269] == -1;

                  if (v140)
                  {
                    v141 = [v272 mapItem];
                    __int16 v142 = [v141 address];

                    id v215 = objc_alloc(MEMORY[0x1E4F5CD80]);
                    dispatch_semaphore_t dsemab = [v142 identifier];
                    v246 = [v142 geoAddressData];
                    v242 = [v142 subPremises];
                    v238 = [v142 subThoroughfare];
                    v234 = [v142 thoroughfare];
                    v231 = [v142 subLocality];
                    v228 = [v142 locality];
                    v225 = [v142 subAdministrativeArea];
                    v222 = [v142 administrativeArea];
                    v220 = [v142 administrativeAreaCode];
                    v218 = [v142 postalCode];
                    id v143 = [v142 country];
                    __int16 v144 = [v142 countryCode];
                    uint64_t v145 = [v142 inlandWater];
                    __int16 v146 = [v142 ocean];
                    id v147 = [v142 areasOfInterest];
                    char v148 = [v142 isIsland];
                    id v149 = [v142 creationDate];
                    uint64_t v150 = [v142 iso3166CountryCode];
                    v151 = [v142 iso3166SubdivisionCode];
                    LOBYTE(v199) = v148;
                    v216 = objc_msgSend(v215, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", dsemab, v246, v242, v238, v234, v231, v228, v225, v222, v220, v218, v143, v144, v145,
                                     v146,
                                     v147,
                                     v199,
                                     v149,
                                     v269,
                                     v150,
                                     v151);

                    uint64_t v152 = [v272 mapItem];
                    id v235 = objc_alloc(MEMORY[0x1E4F5CE38]);
                    dispatch_semaphore_t dsemac = [v152 identifier];
                    v247 = [v152 name];
                    v243 = [v152 category];
                    v239 = [v152 location];
                    uint64_t v153 = [v152 source];
                    uint64_t v154 = [v152 mapItemPlaceType];
                    uint64_t v155 = [v152 muid];
                    uint64_t v156 = [v152 resultProviderID];
                    uint64_t v157 = [v152 geoMapItemHandle];
                    v158 = [v152 creationDate];
                    id v159 = [v152 extendedAttributes];
                    v160 = [v152 displayLanguage];
                    LOBYTE(v198) = [v152 disputed];
                    v161 = (void *)[v235 initWithIdentifier:dsemac name:v247 category:v243 address:v216 location:v239 source:v153 mapItemPlaceType:v154 muid:v155 resultProviderID:v156 geoMapItemHandle:v157 creationDate:v158 expirationDate:v269 extendedAttributes:v159 displayLanguage:v160 disputed:v198];

                    v162 = [RTLearnedPlace alloc];
                    v163 = [v272 identifier];
                    uint64_t v164 = [v272 type];
                    uint64_t v165 = [v272 typeSource];
                    v166 = [v272 customLabel];
                    v167 = [v272 creationDate];
                    v168 = [(RTLearnedPlace *)v162 initWithIdentifier:v163 type:v164 typeSource:v165 mapItem:v161 customLabel:v166 creationDate:v167 expirationDate:v269];

                    if (v168) {
                      [oslog setObject:v168 forKeyedSubscript:v253];
                    }
                  }
                  uint64_t v138 = v260;
                }
              }
              else
              {
                id obja = v47;
              }

              _Block_object_dispose(&v292, 8);
              uint64_t v21 = v207 + 1;
            }
            while (v207 + 1 != v205);
            uint64_t v205 = [v201 countByEnumeratingWithState:&v296 objects:v320 count:16];
          }
          while (v205);
        }
        else
        {
          id obja = 0;
        }

        v169 = dispatch_group_create();
        long long v278 = 0u;
        long long v279 = 0u;
        long long v280 = 0u;
        long long v281 = 0u;
        id v273 = v206;
        uint64_t v170 = [v273 countByEnumeratingWithState:&v278 objects:v308 count:16];
        if (v170)
        {
          uint64_t v171 = *(void *)v279;
          uint64_t v172 = MEMORY[0x1E4F143A8];
          do
          {
            for (uint64_t i = 0; i != v170; ++i)
            {
              if (*(void *)v279 != v171) {
                objc_enumerationMutation(v273);
              }
              uint64_t v174 = *(void *)(*((void *)&v278 + 1) + 8 * i);
              dispatch_group_enter(v169);
              v175 = [(RTLearnedLocationEngine *)self learnedLocationStore];
              v176 = [v273 objectForKeyedSubscript:v174];
              v177 = [oslog objectForKeyedSubscript:v174];
              v276[0] = v172;
              v276[1] = 3221225472;
              v276[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_424;
              v276[3] = &unk_1E6B90840;
              v277 = v169;
              [v175 updateVisits:v176 finerGranularityInferredMapItems:v249 place:v177 handler:v276];
            }
            uint64_t v170 = [v273 countByEnumeratingWithState:&v278 objects:v308 count:16];
          }
          while (v170);
        }

        dispatch_group_wait(v169, 0xFFFFFFFFFFFFFFFFLL);
        v178 = [(RTLearnedLocationEngine *)self learnedLocationStore];
        v274[0] = MEMORY[0x1E4F143A8];
        v274[1] = 3221225472;
        v274[2] = __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_2_425;
        v274[3] = &unk_1E6B90840;
        v179 = v204;
        v275 = v179;
        [v178 updateWritableObjects:v202 handler:v274];

        v180 = v179;
        v181 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v182 = dispatch_time(0, 3600000000000);
        id v183 = obja;
        if (dispatch_semaphore_wait(v180, v182))
        {
          v184 = [MEMORY[0x1E4F1C9C8] now];
          [v184 timeIntervalSinceDate:v181];
          double v186 = v185;
          v187 = objc_opt_new();
          v188 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
          v189 = [MEMORY[0x1E4F29060] callStackSymbols];
          v190 = [v189 filteredArrayUsingPredicate:v188];
          v191 = [v190 firstObject];

          [v187 submitToCoreAnalytics:v191 type:1 duration:v186];
          v192 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v192, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v192, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v193 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v310 = *MEMORY[0x1E4F28568];
          *(void *)buf = @"semaphore wait timeout";
          v194 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v310 count:1];
          v195 = [v193 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v194];

          id v183 = obja;
          if (v195)
          {
            id v183 = v195;
          }
        }

        id v196 = v183;
        [(RTLearnedLocationEngine *)self _harvestVisits:v273 places:oslog];

        goto LABEL_102;
      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: unlabeledVisits", buf, 2u);
  }
LABEL_102:
}

intptr_t __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = [v3 exitDate];
    id v5 = [v4 dateByAddingTimeInterval:4838400.0];

    uint64_t v6 = [v8 expirationDate];
    uint64_t v7 = [v6 compare:v5];

    if (v7 == -1) {
      [*(id *)(a1 + 32) addObject:v8];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

void __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_424(uint64_t a1)
{
}

intptr_t __70__RTLearnedLocationEngine__updateUnlabeledVisitsWithPlaceInformation___block_invoke_2_425(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_processVisits:(id)a3 forLastLearnedVisit:(id)a4 error:(id *)a5
{
  v100[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unint64_t v8 = 0x1E4F1C000uLL;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a3;
  id v11 = [v9 date];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entry" ascending:1];
  uint64_t v99 = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
  int v14 = [v10 sortedArrayUsingDescriptors:v13];

  dispatch_time_t v15 = [(RTLearnedLocationEngine *)self _filterVisits:v14 lastLearnedVisit:v7];

  __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = [v15 count];
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "submitting %lu visits", buf, 0xCu);
  }

  [v15 enumerateObjectsUsingBlock:&__block_literal_global_431];
  if ([v15 count])
  {
    id v17 = [[_RTMap alloc] initWithInput:v15];
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_432;
    v94[3] = &unk_1E6B93F28;
    uint64_t v84 = v11;
    id v18 = v11;
    id v95 = v18;
    uint64_t v19 = [(_RTMap *)v17 withBlock:v94];

    id v85 = v7;
    id v88 = [(RTLearnedLocationEngine *)self _transitionsForVisits:v19 lastLearnedVisit:v7 creationDate:v18];
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    uint64_t v21 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_2;
    v92[3] = &unk_1E6B90840;
    uint64_t v22 = v20;
    uint64_t v93 = v22;
    [v21 storeVisits:v19 handler:v92];

    uint64_t v23 = v22;
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v25 = dispatch_time(0, 3600000000000);
    unint64_t v26 = 0x1E4F28000uLL;
    unint64_t v27 = 0x1E4F29000uLL;
    long long v86 = v15;
    id v83 = (void *)v19;
    if (dispatch_semaphore_wait(v23, v25))
    {
      id v28 = [MEMORY[0x1E4F1C9C8] now];
      [v28 timeIntervalSinceDate:v24];
      double v30 = v29;
      BOOL v31 = objc_opt_new();
      uint64_t v32 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      dispatch_time_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v34 = [v33 filteredArrayUsingPredicate:v32];
      uint64_t v35 = [v34 firstObject];

      [v31 submitToCoreAnalytics:v35 type:1 duration:v30];
      double v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      double v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F5CFE8];
      v100[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v100 count:1];
      id v40 = [v37 errorWithDomain:v38 code:15 userInfo:v39];

      if (v40)
      {
        id v40 = v40;
      }
      dispatch_time_t v15 = v86;
      unint64_t v8 = 0x1E4F1C000;
      unint64_t v27 = 0x1E4F29000;
      unint64_t v26 = 0x1E4F28000;
    }
    else
    {
      id v40 = 0;
    }

    id v41 = v40;
    dispatch_semaphore_t v42 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_435;
    v90[3] = &unk_1E6B90840;
    BOOL v43 = v23;
    double v91 = v43;
    [v42 storeTransitions:v88 handler:v90];

    id v44 = v43;
    [*(id *)(v8 + 2504) now];
    uint64_t v46 = v45 = v8;
    dispatch_time_t v47 = dispatch_time(0, 3600000000000);
    id v48 = v41;
    long long v87 = v44;
    if (dispatch_semaphore_wait(v44, v47))
    {
      uint64_t v49 = [*(id *)(v45 + 2504) now];
      [v49 timeIntervalSinceDate:v46];
      double v51 = v50;
      uint64_t v52 = objc_opt_new();
      uint64_t v53 = [*(id *)(v26 + 3936) predicateWithBlock:&__block_literal_global_1080];
      dispatch_time_t v54 = [*(id *)(v27 + 96) callStackSymbols];
      id v55 = [v54 filteredArrayUsingPredicate:v53];
      uint64_t v56 = [v55 firstObject];

      [v52 submitToCoreAnalytics:v56 type:1 duration:v51];
      double v57 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      double v58 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v59 = *MEMORY[0x1E4F5CFE8];
      v100[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      id v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v100 count:1];
      id v61 = [v58 errorWithDomain:v59 code:15 userInfo:v60];

      id v48 = v41;
      dispatch_time_t v15 = v86;
      id v44 = v87;
      if (v61)
      {
        id v48 = v61;
      }
    }

    id v82 = v48;
    [(RTLearnedLocationEngine *)self _updateUnlabeledVisitsWithPlaceInformation:v83];
    uint64_t v62 = [(RTLearnedLocationEngine *)self trainingMetrics];
    __int16 v63 = [v62 visits];
    [v63 addObjectsFromArray:v83];

    uint64_t v64 = [RTVisitMetrics alloc];
    __int16 v65 = [(RTLearnedLocationEngine *)self distanceCalculator];
    id v66 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    uint64_t v67 = [(RTLearnedLocationEngine *)self locationStore];
    id v68 = [(RTLearnedLocationEngine *)self motionActivityManager];
    uint64_t v69 = [(RTLearnedLocationEngine *)self visitManager];
    id v70 = [(RTVisitMetrics *)v64 initWithDistanceCalculator:v65 learnedLocationStore:v66 locationStore:v67 motionActivityManager:v68 visitManager:v69];

    id v71 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v72 = [v15 firstObject];
    id v73 = [v72 entry];
    uint64_t v74 = [v15 lastObject];
    BOOL v75 = [v74 exit];
    uint64_t v76 = (void *)[v71 initWithStartDate:v73 endDate:v75];

    id v89 = 0;
    BOOL v77 = [(RTVisitMetrics *)v70 collectBatchedMetricsForDateInterval:v76 error:&v89];
    id v78 = v89;
    id v79 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      id v81 = @"NO";
      if (v77) {
        id v81 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v81;
      __int16 v97 = 2112;
      id v98 = v78;
      _os_log_debug_impl(&dword_1D9BFA000, v79, OS_LOG_TYPE_DEBUG, "visit metrics submission, success, %@, error, %@", buf, 0x16u);
    }

    [(RTLearnedLocationEngine *)self submitVisitSettledStateMetricsForVisits:v83 transitions:v88];
    id v11 = v84;
    id v7 = v85;
  }

  return 1;
}

void __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "visit %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

RTLearnedVisit *__68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_432(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [RTLearnedLocation alloc];
  id v5 = [v3 location];
  int v6 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v4, "initWithLocation:dataPointCount:type:", v5, [v3 dataPointCount], 1);

  uint64_t v7 = [*(id *)(a1 + 32) dateByAddingTimeInterval:2419200.0];
  __int16 v8 = [RTLearnedVisit alloc];
  id v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [v3 entry];
  id v11 = [v3 exit];

  id v12 = [(RTLearnedVisit *)v8 initWithIdentifier:v9 location:v6 entryDate:v10 exitDate:v11 creationDate:*(void *)(a1 + 32) expirationDate:v7];

  return v12;
}

void __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "stored all visits with error, %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __68__RTLearnedLocationEngine__processVisits_forLastLearnedVisit_error___block_invoke_435(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "stored all transitions with error, %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_trainVisitsFromDate:(id)a3 toDate:(id)a4 forLastLearnedVisit:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [v13 startTrainingVisits];

  int v14 = (void *)MEMORY[0x1E016D870]();
  id v28 = 0;
  dispatch_time_t v15 = [(RTLearnedLocationEngine *)self _visitsFromDate:v10 toDate:v11 error:&v28];
  id v16 = v28;
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v26 = v12;
    id v27 = 0;
    BOOL v19 = [(RTLearnedLocationEngine *)self _processVisits:v15 forLastLearnedVisit:v12 error:&v27];
    id v20 = v27;
    uint64_t v21 = v20;
    id v18 = 0;
    if (!v19) {
      id v18 = v20;
    }

    id v12 = v26;
  }

  uint64_t v22 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [v22 stopTrainingVisits];

  if (a6) {
    *a6 = v18;
  }
  if (!v18)
  {
    uint64_t v23 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
    [v23 setObject:v24 forKey:@"LearnedLocationEngineTrainVisitsLastAttemptDate"];
  }
  return v18 == 0;
}

- (BOOL)_deferTrainingDueToRecentResetSync
{
  id v3 = [(RTLearnedLocationEngine *)self defaultsManager];
  id v4 = [v3 objectForKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastResetSyncDate"];

  if (v4)
  {
    int v5 = [(RTLearnedLocationEngine *)self defaultsManager];
    id v6 = [v5 objectForKey:@"LearnedLocationEngineTrainVisitsLastAttemptDate"];

    uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-172800.0];
    if (v6 && ([v6 isOnOrBefore:v7] & 1) == 0)
    {
      id v9 = [(RTLearnedLocationEngine *)self defaultsManager];
      id v10 = [v9 objectForKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastImportDate"];

      BOOL v8 = !v10 || ([v10 isAfterDate:v4] & 1) == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_deferTrainingDueToAvailability
{
  v50[1] = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  dispatch_semaphore_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v35 = 0;
  double v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__36;
  uint64_t v39 = __Block_byref_object_dispose__36;
  id v40 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  int v5 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__RTLearnedLocationEngine__deferTrainingDueToAvailability__block_invoke;
  v31[3] = &unk_1E6B908E0;
  dispatch_time_t v33 = &v41;
  id v34 = &v35;
  id v6 = v4;
  uint64_t v32 = v6;
  [v5 fetchAvailabilityWithHandler:v31];

  uint64_t v7 = v6;
  BOOL v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9)) {
    goto LABEL_6;
  }
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  __int16 v13 = objc_opt_new();
  int v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  dispatch_time_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v16 = [v15 filteredArrayUsingPredicate:v14];
  id v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  BOOL v19 = (void *)MEMORY[0x1E4F28C58];
  v50[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v50 count:1];
  uint64_t v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

  if (v21)
  {
    id v22 = v21;

    char v23 = 0;
  }
  else
  {
LABEL_6:
    id v22 = 0;
    char v23 = 1;
  }

  id v24 = v22;
  if ((v23 & 1) == 0) {
    objc_storeStrong(v36 + 5, v22);
  }
  dispatch_time_t v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = +[RTStore availabilityToString:v42[3]];
    id v28 = v36[5];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v26;
    __int16 v46 = 2112;
    dispatch_time_t v47 = v27;
    __int16 v48 = 2112;
    id v49 = v28;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, availability, %@, error, %@", buf, 0x20u);
  }
  BOOL v29 = v42[3] != 2;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);
  return v29;
}

void __58__RTLearnedLocationEngine__deferTrainingDueToAvailability__block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_deferTrainingLOIsDueToCloudStoreNotChangeSinceLastTrainingDate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-172800.0];
  if (v4 && ([v4 isOnOrBefore:v5] & 1) == 0)
  {
    uint64_t v7 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    char v8 = [v7 cloudStoreChangedSinceDate:v4];

    char v6 = v8 ^ 1;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_homeLocationOfInterestExist
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  uint64_t v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__36;
  id v40 = __Block_byref_object_dispose__36;
  id v41 = 0;
  uint64_t v32 = 0;
  dispatch_time_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __55__RTLearnedLocationEngine__homeLocationOfInterestExist__block_invoke;
  v27[3] = &unk_1E6B93F50;
  double v30 = &v36;
  SEL v31 = a2;
  BOOL v29 = &v32;
  char v6 = v4;
  id v28 = v6;
  [v5 fetchLocationsOfInterestWithPlaceType:1 handler:v27];

  uint64_t v7 = v6;
  char v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9)) {
    goto LABEL_6;
  }
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  __int16 v13 = objc_opt_new();
  int v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  dispatch_time_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v16 = [v15 filteredArrayUsingPredicate:v14];
  id v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  BOOL v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v42 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v42 count:1];
  uint64_t v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

  if (v21)
  {
    id v22 = v21;

    char v23 = 0;
  }
  else
  {
LABEL_6:
    id v22 = 0;
    char v23 = 1;
  }

  id v24 = v22;
  if ((v23 & 1) == 0) {
    objc_storeStrong(v37 + 5, v22);
  }
  BOOL v25 = v37[5] || v33[3];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v25;
}

void __55__RTLearnedLocationEngine__homeLocationOfInterestExist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    char v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v12 = 138412802;
    __int16 v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = [v5 count];
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, home LOI count, %lu, errror, %@", (uint8_t *)&v12, 0x20u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 count];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_deferTrainingOnBatteryDueToLackOfLongVisitSinceDate:(id)a3
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    char v8 = [v4 stringFromDate];
    uint64_t v9 = [v5 stringFromDate];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v62 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, input date, %@, current date, %@", buf, 0x20u);
  }
  if (v4 && [v4 isAfterDate:v5])
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    BOOL v11 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = NSStringFromSelector(a2);
      __int16 v13 = [v4 stringFromDate];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, defer, YES, reference date is in the future, %@", buf, 0x16u);

      BOOL v11 = 1;
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v62 = __Block_byref_object_copy__36;
    __int16 v63 = __Block_byref_object_dispose__36;
    id v64 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
    __int16 v16 = v4;
    if (!v4)
    {
      __int16 v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    unint64_t v45 = (void *)[v15 initWithStartDate:v16 endDate:v5];
    if (!v4) {

    }
    id v17 = objc_alloc(MEMORY[0x1E4F5CF58]);
    uint64_t v18 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
    uint64_t v44 = (void *)[v17 initWithAscending:1 confidence:v18 dateInterval:v45 labelVisit:0 limit:0];

    uint64_t v52 = 0;
    uint64_t v53 = &v52;
    uint64_t v54 = 0x2020000000;
    char v55 = 1;
    BOOL v19 = [(RTLearnedLocationEngine *)self visitManager];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __80__RTLearnedLocationEngine__deferTrainingOnBatteryDueToLackOfLongVisitSinceDate___block_invoke;
    v47[3] = &unk_1E6B93F50;
    double v50 = &v52;
    SEL v51 = a2;
    id v49 = buf;
    id v20 = v14;
    __int16 v48 = v20;
    [v19 fetchStoredVisitsWithOptions:v44 handler:v47];

    uint64_t v21 = v20;
    id v22 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v23 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v21, v23)) {
      goto LABEL_16;
    }
    id v24 = [MEMORY[0x1E4F1C9C8] now];
    [v24 timeIntervalSinceDate:v22];
    double v26 = v25;
    id v27 = objc_opt_new();
    id v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    BOOL v29 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v30 = [v29 filteredArrayUsingPredicate:v28];
    SEL v31 = [v30 firstObject];

    [v27 submitToCoreAnalytics:v31 type:1 duration:v26];
    uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v56 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v56, 2u);
    }

    dispatch_time_t v33 = (void *)MEMORY[0x1E4F28C58];
    v65[0] = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v56 = @"semaphore wait timeout";
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v65 count:1];
    uint64_t v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

    if (v35)
    {
      id v36 = v35;

      char v37 = 0;
    }
    else
    {
LABEL_16:
      id v36 = 0;
      char v37 = 1;
    }

    id v10 = v36;
    if ((v37 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&buf[8] + 40), v36);
    }
    uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = NSStringFromSelector(a2);
      id v40 = (void *)v39;
      if (*((unsigned char *)v53 + 24)) {
        id v41 = @"YES";
      }
      else {
        id v41 = @"NO";
      }
      uint64_t v42 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v56 = 138412802;
      *(void *)&v56[4] = v39;
      __int16 v57 = 2112;
      double v58 = v41;
      __int16 v59 = 2112;
      uint64_t v60 = v42;
      _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, defer, %@, error, %@", v56, 0x20u);
    }
    BOOL v11 = *((unsigned char *)v53 + 24) != 0;

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(buf, 8);
  }
  return v11;
}

void __80__RTLearnedLocationEngine__deferTrainingOnBatteryDueToLackOfLongVisitSinceDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v24 = a3;
  uint64_t v25 = a1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v27 = 0;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        BOOL v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = NSStringFromSelector(*(SEL *)(v25 + 56));
          __int16 v13 = [v10 exit];
          dispatch_semaphore_t v14 = [v10 entry];
          [v13 timeIntervalSinceDate:v14];
          *(_DWORD *)buf = 138413058;
          dispatch_time_t v33 = v12;
          __int16 v34 = 2048;
          uint64_t v35 = v27 + i;
          __int16 v36 = 2112;
          char v37 = v10;
          __int16 v38 = 2048;
          uint64_t v39 = v15;
          _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, idx, %lu, visit, %@, duration, %.1f", buf, 0x2Au);
        }
        uint64_t v16 = [v10 exit];
        if (v16)
        {
          id v17 = (void *)v16;
          uint64_t v18 = [v10 entry];
          if (v18)
          {
            BOOL v19 = (void *)v18;
            id v20 = [v10 exit];
            uint64_t v21 = [v10 entry];
            [v20 timeIntervalSinceDate:v21];
            double v23 = v22;

            if (v23 > 900.0)
            {
              *(unsigned char *)(*(void *)(*(void *)(v25 + 48) + 8) + 24) = 0;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
      v27 += i;
    }
    while (v7);
  }
LABEL_15:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v25 + 32));
}

- (BOOL)_deferSubmittingLoiMetricsDueToNoTrainingSinceLastSubmission
{
  id v2 = [(RTLearnedLocationEngine *)self defaultsManager];
  id v3 = [v2 objectForKey:@"RTDefaultsLearnedLocationEngineLocationOfInterestMetricsSubmitted"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_isAuthorized
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = [(RTLearnedLocationEngine *)self locationManager];
    int v7 = [v6 enabled];
    uint64_t v8 = @"NO";
    if (v7) {
      uint64_t v8 = @"YES";
    }
    int v12 = 138412546;
    __int16 v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, training authorized, %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = [(RTLearnedLocationEngine *)self locationManager];
  char v10 = [v9 enabled];

  return v10;
}

- (void)_trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void (**)(id, void *))a5;
  if (![(RTLearnedLocationEngine *)self _isAuthorized])
  {
    __int16 v14 = [(RTLearnedLocationEngine *)self trainingMetrics];
    [v14 setWasDeferred:4];

    uint64_t v46 = *MEMORY[0x1E4F28568];
    v47[0] = @"Deferring training due to not authorized.";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:v11];
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      unint64_t v43 = (unint64_t)v21;
      __int16 v44 = 2112;
      unint64_t v45 = (unint64_t)v12;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  if ([(RTLearnedLocationEngine *)self _deferTrainingDueToAvailability])
  {
    char v10 = [(RTLearnedLocationEngine *)self trainingMetrics];
    [v10 setWasDeferred:2];

    uint64_t v40 = *MEMORY[0x1E4F28568];
    uint64_t v41 = @"Deferring training due to availability of the learned location store.";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v11];
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v43 = (unint64_t)v12;
LABEL_37:
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ([(RTLearnedLocationEngine *)self _deferTrainingDueToRecentResetSync])
  {
    uint64_t v16 = [(RTLearnedLocationEngine *)self trainingMetrics];
    [v16 setWasDeferred:1];

    uint64_t v38 = *MEMORY[0x1E4F28568];
    uint64_t v39 = @"Deferring training due to reset sync after last import.";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v11];
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v43 = (unint64_t)v12;
      goto LABEL_37;
    }
LABEL_10:

LABEL_11:
    v9[2](v9, v12);
    goto LABEL_12;
  }
  id v35 = 0;
  int v12 = [(RTLearnedLocationEngine *)self _lastVisitWithError:&v35];
  id v17 = v35;
  if (v17)
  {
    BOOL v11 = v17;
    v9[2](v9, v17);
  }
  else
  {
    uint64_t v18 = [v12 exitDate];
    BOOL v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    double v22 = v20;

    double v23 = [MEMORY[0x1E4F1C9C8] date];
    if ([v22 isAfterDate:v23])
    {
      uint64_t v36 = *MEMORY[0x1E4F28568];
      id v24 = [NSString stringWithFormat:@"Deferring training due to start date, %@, cannot be later than end date, %@", v22, v23];
      char v37 = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];

      double v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v25];
      uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v43 = (unint64_t)v26;
        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (v9) {
        v9[2](v9, v26);
      }
    }
    else
    {
      if (a4 != 2) {
        goto LABEL_31;
      }
      long long v28 = (void *)MEMORY[0x1E4F1C9C8];
      long long v29 = [v12 exitDate];
      uint64_t v30 = (uint64_t)v29;
      if (!v29)
      {
        uint64_t v30 = [MEMORY[0x1E4F1C9C8] distantPast];
      }
      __int16 v34 = (void *)v30;
      long long v31 = [v28 dateWithTimeInterval:v30 sinceDate:1800.0];
      BOOL v32 = [(RTLearnedLocationEngine *)self _deferTrainingOnBatteryDueToLackOfLongVisitSinceDate:v31];

      if (!v29) {
      if (v32)
      }
      {
        [(RTLearnedLocationEngine *)self setRegisterTrainOnBattery:0];
        v9[2](v9, 0);
      }
      else
      {
LABEL_31:
        [(RTLearnedLocationEngine *)self _trainWithFromDate:v22 ToDate:v23 forLastLearnedVisit:v12 reason:a3 mode:a4 handler:v9];
        if (self->_tripSegmentProvider)
        {
          dispatch_time_t v33 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v43 = a3;
            __int16 v44 = 2048;
            unint64_t v45 = a4;
            _os_log_debug_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEBUG, "RTLearnedLocationEngine:_trainForReason, reason, %lu, mode, %lu, invoking startReconstructTripSegment.", buf, 0x16u);
          }

          [(RTTripSegmentProvider *)self->_tripSegmentProvider startReconstructTripSegmentWithTrainMode:a4];
        }
      }
    }

    BOOL v11 = 0;
  }
LABEL_12:
}

- (void)_trainWithFromDate:(id)a3 ToDate:(id)a4 forLastLearnedVisit:(id)a5 reason:(unint64_t)a6 mode:(unint64_t)a7 handler:(id)a8
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v74 = a5;
  id v73 = (void (**)(id, void *))a8;
  id v17 = NSString;
  uint64_t v18 = (objc_class *)objc_opt_class();
  BOOL v19 = NSStringFromClass(v18);
  id v20 = NSStringFromSelector(a2);
  id v21 = [v17 stringWithFormat:@"%@-%@", v19, v20];
  [v21 UTF8String];
  id v72 = (void *)os_transaction_create();

  double v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v62 = (objc_class *)objc_opt_class();
    __int16 v63 = NSStringFromClass(v62);
    id v64 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v82 = v63;
    __int16 v83 = 2112;
    unint64_t v84 = (unint64_t)v64;
    _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  double v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = NSStringFromSelector(a2);
    uint64_t v25 = [v15 stringFromDate];
    double v26 = [v16 stringFromDate];
    *(_DWORD *)buf = 138413570;
    id v82 = v24;
    __int16 v83 = 2048;
    unint64_t v84 = a6;
    __int16 v85 = 2048;
    unint64_t v86 = a7;
    __int16 v87 = 2112;
    id v88 = v25;
    __int16 v89 = 2112;
    __int16 v90 = v26;
    __int16 v91 = 2112;
    id v92 = v74;
    _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, reason, %lu, mode, %lu, from %@, to %@, last visit, %@", buf, 0x3Eu);
  }
  uint64_t v27 = [(RTLearnedLocationEngine *)self dailyTrainingSessionCounter];
  [v27 increaseCountForMode:a7 reason:a6];

  [(RTLearnedLocationEngine *)self _setupTrainingMetricsFromDate:v15 toDate:v16 mode:a7 reason:a6];
  long long v28 = NSString;
  long long v29 = NSStringFromSelector(a2);
  uint64_t v30 = [v28 stringWithFormat:@"before %@", v29];
  [(RTLearnedLocationEngine *)self _logDatabasesWithReason:v30];

  id v80 = 0;
  LOBYTE(v30) = [(RTLearnedLocationEngine *)self _retrainVisitsWithoutPlaces:&v80];
  id v31 = v80;
  if ((v30 & 1) == 0)
  {
    BOOL v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      __int16 v65 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v82 = v65;
      __int16 v83 = 2112;
      unint64_t v84 = (unint64_t)v31;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, retrainVisitsWithoutPlaces error, %@", buf, 0x16u);
    }
  }
  id v79 = 0;
  BOOL v33 = [(RTLearnedLocationEngine *)self _trainVisitsFromDate:v15 toDate:v16 forLastLearnedVisit:v74 error:&v79];
  id v34 = v79;
  if (!v33)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v66 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v82 = v66;
      __int16 v83 = 2112;
      unint64_t v84 = (unint64_t)v34;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "%@, trainVisits error, %@", buf, 0x16u);
    }
  }
  id v70 = v15;
  id v71 = v31;
  if (a7 == 2)
  {
    uint64_t v36 = v34;
    char v37 = [(RTLearnedLocationEngine *)self defaultsManager];
    uint64_t v38 = [v37 objectForKey:@"LearnedLocationEngineTrainLightweightLastCompletionDate"];

    uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        uint64_t v41 = [v38 stringFromDate];
      }
      else
      {
        uint64_t v41 = @"nil";
      }
      *(_DWORD *)buf = 138412546;
      id v82 = v40;
      __int16 v83 = 2112;
      unint64_t v84 = (unint64_t)v41;
      _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "---------> %@, trainLightweightLastCompletionDate, %@, calling appendVisitsToLocationsOfInterestModel <---------", buf, 0x16u);
      if (v38) {
    }
      }
    id v78 = 0;
    BOOL v52 = [(RTLearnedLocationEngine *)self _appendVisitsToLocationsOfInterestModelWithError:&v78];
    id v51 = v78;
    if (v52)
    {
      uint64_t v53 = [(RTLearnedLocationEngine *)self defaultsManager];
      uint64_t v54 = [MEMORY[0x1E4F1C9C8] date];
      [v53 setObject:v54 forKey:@"LearnedLocationEngineTrainLightweightLastCompletionDate"];

      char v55 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
LABEL_39:

        id v50 = 0;
        id v46 = 0;
        id v43 = 0;
        goto LABEL_40;
      }
      uint64_t v56 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v82 = v56;
      _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_INFO, "---------> %@, appendVisitsToLocationsOfInterestModel finished<---------", buf, 0xCu);
    }
    else
    {
      char v55 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      uint64_t v56 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v82 = v56;
      __int16 v83 = 2112;
      unint64_t v84 = (unint64_t)v51;
      _os_log_error_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_ERROR, "%@, appendVisitsToLocationsOfInterestModel error, %@", buf, 0x16u);
    }

    goto LABEL_39;
  }
  id v77 = 0;
  BOOL v42 = [(RTLearnedLocationEngine *)self _trainLocationsOfInterestModelWithError:&v77];
  id v43 = v77;
  if (!v42)
  {
    __int16 v44 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      uint64_t v67 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v82 = v67;
      __int16 v83 = 2112;
      unint64_t v84 = (unint64_t)v43;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "%@, trainLocationsOfInterestModel error, %@", buf, 0x16u);
    }
  }
  id v76 = 0;
  BOOL v45 = [(RTLearnedLocationEngine *)self _removeUnusedMapItems:&v76];
  id v46 = v76;
  if (!v45)
  {
    dispatch_time_t v47 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      id v68 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v82 = v68;
      __int16 v83 = 2112;
      unint64_t v84 = (unint64_t)v46;
      _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "%@, remove unused map items error, %@", buf, 0x16u);
    }
  }
  uint64_t v36 = v34;
  __int16 v48 = [(RTLearnedLocationEngine *)self pointOfInterestMetricsManager];
  id v75 = 0;
  char v49 = [v48 submitMetricsWithError:&v75];
  id v50 = v75;

  if (v49)
  {
    id v51 = 0;
    goto LABEL_41;
  }
  uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    uint64_t v69 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v82 = v69;
    __int16 v83 = 2112;
    unint64_t v84 = (unint64_t)v50;
    _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, submit metrics error, %@", buf, 0x16u);
  }
  id v51 = 0;
LABEL_40:

LABEL_41:
  __int16 v57 = NSString;
  double v58 = NSStringFromSelector(a2);
  __int16 v59 = [v57 stringWithFormat:@"after %@", v58];
  [(RTLearnedLocationEngine *)self _logDatabasesWithReason:v59];

  [(RTLearnedLocationEngine *)self _teardownTrainingMetrics];
  if (v73)
  {
    uint64_t v60 = _RTSafeArray();
    id v61 = _RTMultiErrorCreate();
    v73[2](v73, v61);
  }
}

- (void)trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5
{
  id v9 = a5;
  char v10 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v11 = [(RTLearnedLocationEngine *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__RTLearnedLocationEngine_trainForReason_mode_handler___block_invoke;
  v14[3] = &unk_1E6B93FA0;
  unint64_t v18 = a3;
  unint64_t v19 = a4;
  id v16 = v9;
  SEL v17 = a2;
  v14[4] = self;
  id v15 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, v14);
}

void __55__RTLearnedLocationEngine_trainForReason_mode_handler___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) defaultsManager];
  id v3 = [v2 objectForKey:@"LearnedLocationEngineTrainVisitsLastAttemptDate"];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v6 = v5;

  int v7 = [*(id *)(a1 + 32) defaultsManager];
  uint64_t v8 = [v7 objectForKey:@"LearnedLocationEngineTrainLocationsOfInterestLastCompletionDate"];

  id v9 = [*(id *)(a1 + 32) defaultsManager];
  char v10 = [v9 objectForKey:@"LearnedLocationEngineTrainLightweightLastCompletionDate"];

  BOOL v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 72);
    id v15 = [v8 stringFromDate];
    id v16 = [v10 stringFromDate];
    *(_DWORD *)buf = 138413314;
    BOOL v33 = v12;
    __int16 v34 = 2048;
    uint64_t v35 = v14;
    __int16 v36 = 2048;
    uint64_t v37 = v13;
    __int16 v38 = 2112;
    uint64_t v39 = v15;
    __int16 v40 = 2112;
    uint64_t v41 = v16;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "--------->%@, start training, reason, %lu, mode, %lu, trainLocationsOfInterestLastCompletionDate (full-training) %@, lastLightweightTrainingCompletionDate %@ <---------", buf, 0x34u);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  SEL v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 72);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __55__RTLearnedLocationEngine_trainForReason_mode_handler___block_invoke_477;
  v25[3] = &unk_1E6B93F78;
  objc_copyWeak(v30, (id *)buf);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(void **)(a1 + 56);
  id v29 = v20;
  v30[1] = v21;
  long long v31 = *(_OWORD *)(a1 + 64);
  id v22 = *(id *)(a1 + 40);
  uint64_t v23 = *(void *)(a1 + 32);
  id v26 = v22;
  uint64_t v27 = v23;
  id v24 = v6;
  id v28 = v24;
  [v17 _trainForReason:v18 mode:v19 handler:v25];

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);
}

void __55__RTLearnedLocationEngine_trainForReason_mode_handler___block_invoke_477(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_9;
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 88);
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
    int v15 = 138413314;
    id v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v3;
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "--------->%@, finished training, reason, %lu, mode, %lu, error, %@, latency, %.2f<---------", (uint8_t *)&v15, 0x34u);
  }
  if (!v3)
  {
    BOOL v11 = *(void **)(a1 + 40);
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:*(void *)(a1 + 48)];
    [v11 didUpdateWithIntervalSinceLastUpdate:];
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13)
  {
    uint64_t v14 = *(void (**)(void))(v13 + 16);
LABEL_9:
    v14();
  }
}

- (BOOL)_trainLocationsOfInterestModelWithError:(id *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(RTLearnedLocationEngine *)self defaultsManager];
  uint64_t v7 = [v6 objectForKey:@"LearnedLocationEngineTrainLocationsOfInterestLastCompletionDate"];

  if (![(RTLearnedLocationEngine *)self _homeLocationOfInterestExist]
    || ![(RTLearnedLocationEngine *)self _deferTrainingLOIsDueToCloudStoreNotChangeSinceLastTrainingDate:v7])
  {
    [(RTLearnedLocationEngine *)self willBeginTraining];
    id v49 = 0;
    BOOL v12 = [(RTLearnedLocationEngine *)self _reconcileLearnedLocationsWithError:&v49];
    id v13 = v49;
    if (!v12)
    {
      [(RTLearnedLocationEngine *)self didFinishTraining];
      uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v51 = v39;
        __int16 v52 = 2112;
        id v53 = v13;
        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, _reconcileLearnedLocationsWithError, error, %@", buf, 0x16u);
      }
      BOOL v11 = 0;
      if (a3) {
        *a3 = v13;
      }
      goto LABEL_41;
    }
    id v48 = 0;
    BOOL v14 = [(RTLearnedLocationEngine *)self _relabelWithError:&v48];
    id v15 = v48;
    if (!v14)
    {
      id v16 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v40 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v51 = v40;
        __int16 v52 = 2112;
        id v53 = v15;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, _relabelWithError, error, %@", buf, 0x16u);
      }
    }
    id v47 = 0;
    BOOL v17 = [(RTLearnedLocationEngine *)self _classifyPlaceTypes:&v47];
    id v18 = v47;
    if (!v17)
    {
      __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v51 = v41;
        __int16 v52 = 2112;
        id v53 = v13;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, _classifyPlaceTypes, error, %@", buf, 0x16u);
      }
    }
    id v46 = 0;
    BOOL v20 = [(RTLearnedLocationEngine *)self _consolidateKnownPlaceTypesWithError:&v46];
    id v21 = v46;
    if (!v20)
    {
      id v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v51 = v42;
        __int16 v52 = 2112;
        id v53 = v21;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, _consolidateKnownPlaceTypesWithError, error, %@", buf, 0x16u);
      }
    }
    if (v13 || v15 || v18 || v21)
    {
      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v43 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413314;
        id v51 = v43;
        __int16 v52 = 2112;
        id v53 = v13;
        __int16 v54 = 2112;
        id v55 = v15;
        __int16 v56 = 2112;
        id v57 = v18;
        __int16 v58 = 2112;
        id v59 = v21;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, skip saving known place type identifiers, reconciliationError, %@, relabelError, %@, classifyPlaceTypesError, %@, consolidateKnownPlaceTypesError, %@", buf, 0x34u);
      }
      id v24 = 0;
    }
    else
    {
      id v45 = 0;
      BOOL v23 = [(RTLearnedLocationEngine *)self _saveIdentifiersOfKnownPlaceTypesWithError:&v45];
      id v24 = v45;
      if (v23)
      {
LABEL_35:
        [(RTLearnedLocationEngine *)self didFinishTraining];
        id v28 = _RTSafeArray();
        id v29 = _RTMultiErrorCreate();

        BOOL v11 = v29 == 0;
        if (v29)
        {
          if (a3) {
            *a3 = v29;
          }
        }
        else
        {
          uint64_t v30 = [(RTLearnedLocationEngine *)self defaultsManager];
          [MEMORY[0x1E4F1C9C8] date];
          id v44 = v24;
          id v31 = v13;
          id v32 = v21;
          BOOL v33 = v7;
          id v34 = v18;
          __int16 v36 = v35 = v15;
          [v30 setObject:v36 forKey:@"LearnedLocationEngineTrainLocationsOfInterestLastCompletionDate"];

          id v15 = v35;
          id v18 = v34;
          uint64_t v7 = v33;
          id v21 = v32;
          id v13 = v31;
          id v24 = v44;

          uint64_t v37 = [(RTLearnedLocationEngine *)self defaultsManager];
          [v37 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsLearnedLocationEngineLocationOfInterestMetricsSubmitted"];
        }
LABEL_41:

        goto LABEL_42;
      }
      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v51 = v26;
        __int16 v52 = 2112;
        id v53 = v24;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, _saveIdentifiersOfKnownPlaceTypesWithError, error, %@", buf, 0x16u);
      }
    }

    goto LABEL_35;
  }
  uint64_t v8 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [v8 setWasDeferred:3];

  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v7 stringFromDate];
    *(_DWORD *)buf = 138412290;
    id v51 = v10;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Deferring training due to no change of cloud store since last training date, %@.", buf, 0xCu);
  }
  BOOL v11 = 0;
  if (a3) {
    *a3 = 0;
  }
LABEL_42:

  return v11;
}

- (void)_submitPlaceTypeClassificationFeatureInputMetrics
{
  v125[1] = *MEMORY[0x1E4F143B8];
  uint64_t v99 = 0;
  objc_super v100 = &v99;
  uint64_t v101 = 0x3032000000;
  id v102 = __Block_byref_object_copy__36;
  char v103 = __Block_byref_object_dispose__36;
  id v104 = 0;
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x3032000000;
  v97[3] = __Block_byref_object_copy__36;
  v97[4] = __Block_byref_object_dispose__36;
  id v98 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v80 = self;
  char v4 = [(RTLearnedLocationEngine *)self contactsManager];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __76__RTLearnedLocationEngine__submitPlaceTypeClassificationFeatureInputMetrics__block_invoke;
  v93[3] = &unk_1E6B93FC8;
  id v95 = v97;
  id v5 = v3;
  id v94 = v5;
  id v96 = &v99;
  [v4 fetchMeCardWithHandler:v93];

  dispatch_semaphore_t dsema = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v7 = dispatch_time(0, 3600000000000);
  intptr_t v8 = dispatch_semaphore_wait(dsema, v7);
  id v9 = (uint64_t *)MEMORY[0x1E4F5CFE8];
  uint64_t v10 = (uint64_t *)MEMORY[0x1E4F28568];
  if (!v8) {
    goto LABEL_6;
  }
  BOOL v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v6];
  double v13 = v12;
  BOOL v14 = objc_opt_new();
  id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  BOOL v17 = [v16 filteredArrayUsingPredicate:v15];
  id v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v119 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v119, 2u);
  }

  BOOL v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v113 = *v10;
  *(void *)v119 = @"semaphore wait timeout";
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:&v113 count:1];
  id v22 = [v20 errorWithDomain:*v9 code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;
  }
  else
  {
LABEL_6:
    id v23 = 0;
  }

  id v81 = v23;
  *(void *)v119 = 0;
  BOOL v120 = v119;
  uint64_t v121 = 0x3032000000;
  long long v122 = __Block_byref_object_copy__36;
  char v123 = __Block_byref_object_dispose__36;
  id v124 = 0;
  uint64_t v113 = 0;
  long long v114 = &v113;
  uint64_t v115 = 0x3032000000;
  long long v116 = __Block_byref_object_copy__36;
  v117 = __Block_byref_object_dispose__36;
  id v118 = 0;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v24 = [(id)v100[5] postalAddresses];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v89 objects:v112 count:16];
  if (v25)
  {
    uint64_t v78 = *(void *)v90;
    id obj = v24;
    uint64_t v74 = *v9;
    uint64_t v75 = *v10;
    do
    {
      uint64_t v79 = v25;
      for (uint64_t i = 0; i != v79; ++i)
      {
        if (*(void *)v90 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        if ([v27 labelType] == 1 || objc_msgSend(v27, "labelType") == 2)
        {
          id v28 = objc_alloc(MEMORY[0x1E4F5CE48]);
          id v29 = (objc_class *)objc_opt_class();
          uint64_t v30 = NSStringFromClass(v29);
          id v31 = (void *)[v28 initWithUseBackgroundTraits:1 analyticsIdentifier:v30];

          id v32 = [(RTLearnedLocationEngine *)v80 mapServiceManager];
          BOOL v33 = [v27 geoDictionaryRepresentation];
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __76__RTLearnedLocationEngine__submitPlaceTypeClassificationFeatureInputMetrics__block_invoke_2;
          v84[3] = &unk_1E6B93FF0;
          id v34 = dsema;
          __int16 v85 = v34;
          unint64_t v86 = v27;
          __int16 v87 = v119;
          id v88 = &v113;
          [v32 fetchMapItemsFromAddressDictionary:v33 options:v31 handler:v84];

          id v35 = v34;
          __int16 v36 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v37 = dispatch_time(0, 3600000000000);
          id v38 = v81;
          if (dispatch_semaphore_wait(v35, v37))
          {
            uint64_t v39 = [MEMORY[0x1E4F1C9C8] now];
            [v39 timeIntervalSinceDate:v36];
            double v41 = v40;
            uint64_t v42 = objc_opt_new();
            id v43 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
            id v44 = [MEMORY[0x1E4F29060] callStackSymbols];
            id v45 = [v44 filteredArrayUsingPredicate:v43];
            id v46 = [v45 firstObject];

            [v42 submitToCoreAnalytics:v46 type:1 duration:v41];
            id v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            id v48 = (void *)MEMORY[0x1E4F28C58];
            v125[0] = v75;
            *(void *)buf = @"semaphore wait timeout";
            id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v125 count:1];
            id v50 = [v48 errorWithDomain:v74 code:15 userInfo:v49];

            id v38 = v81;
            if (v50)
            {
              id v38 = v50;
            }
          }

          id v51 = v38;
          id v81 = v51;
        }
      }
      id v24 = obj;
      uint64_t v25 = [obj countByEnumeratingWithState:&v89 objects:v112 count:16];
    }
    while (v25);
  }

  __int16 v52 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    id v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    id v55 = NSStringFromSelector(a2);
    uint64_t v56 = *((void *)v120 + 5);
    uint64_t v57 = v114[5];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v54;
    __int16 v106 = 2112;
    BOOL v107 = v55;
    __int16 v108 = 2112;
    uint64_t v109 = v56;
    __int16 v110 = 2112;
    uint64_t v111 = v57;
    _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, home map item, %@, work map item, %@", buf, 0x2Au);
  }
  if (*((void *)v120 + 5) && v114[5])
  {
    __int16 v58 = [MEMORY[0x1E4F1C9C8] date];
    id v59 = [v58 dateByAddingTimeInterval:-3628800.0];
    uint64_t v60 = *((void *)v120 + 5);
    uint64_t v61 = v114[5];
    id v82 = 0;
    id v83 = 0;
    uint64_t v62 = [(RTLearnedLocationEngine *)v80 calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate:v59 endDate:v58 homeMapItem:v60 workMapItem:v61 locationsOfOthers:&v83 error:&v82];
    id v63 = v83;
    id v64 = v82;
    if (!v64)
    {
      __int16 v65 = [MEMORY[0x1E4F1C9C8] date];
      id v66 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_INFO, "Start submission of home and work replayable CA metrics.", buf, 2u);
      }

      [(RTLearnedLocationEngine *)v80 calculateNewMetricsAndSubmitAlongWithTheOldMetrics:v62 startDate:v59 endDate:v58 homeMapItem:*((void *)v120 + 5) workMapItem:v114[5] distanceThresholdArray:&unk_1F3452B20 locationsOfOthers:v63];
      uint64_t v67 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        id v68 = [MEMORY[0x1E4F1C9C8] date];
        [v68 timeIntervalSinceDate:v65];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v69;
        _os_log_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_INFO, "End submission of home and work replayable CA metrics, latency, %.2f", buf, 0xCu);
      }
    }
  }
  else
  {
    __int16 v58 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      id v70 = (objc_class *)objc_opt_class();
      NSStringFromClass(v70);
      id v71 = (id)objc_claimAutoreleasedReturnValue();
      id v72 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v71;
      __int16 v106 = 2112;
      BOOL v107 = v72;
      _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_INFO, "%@, %@, submission skipped due to invalid home or work map items", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(v119, 8);

  _Block_object_dispose(v97, 8);
  _Block_object_dispose(&v99, 8);
}

void __76__RTLearnedLocationEngine__submitPlaceTypeClassificationFeatureInputMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __76__RTLearnedLocationEngine__submitPlaceTypeClassificationFeatureInputMetrics__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (!a3)
  {
    if ([*(id *)(a1 + 40) labelType] == 1)
    {
      uint64_t v5 = [v9 firstObject];
      uint64_t v6 = *(void *)(a1 + 48);
    }
    else
    {
      if ([*(id *)(a1 + 40) labelType] != 2) {
        goto LABEL_7;
      }
      uint64_t v5 = [v9 firstObject];
      uint64_t v6 = *(void *)(a1 + 56);
    }
    uint64_t v7 = *(void *)(v6 + 8);
    intptr_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;
  }
LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate:(id)a3 endDate:(id)a4 homeMapItem:(id)a5 workMapItem:(id)a6 locationsOfOthers:(id *)a7 error:(id *)a8
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = v17;
  if (a8)
  {
    if (v14)
    {
      if (v15)
      {
        if (v16)
        {
          if (v17)
          {
            if (a7)
            {
              *(void *)buf = 0;
              uint64_t v62 = buf;
              uint64_t v63 = 0x3032000000;
              id v64 = __Block_byref_object_copy__36;
              __int16 v65 = __Block_byref_object_dispose__36;
              id v66 = 0;
              uint64_t v55 = 0;
              uint64_t v56 = (id *)&v55;
              uint64_t v57 = 0x3032000000;
              __int16 v58 = __Block_byref_object_copy__36;
              id v59 = __Block_byref_object_dispose__36;
              id v60 = 0;
              dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
              BOOL v20 = [(RTLearnedLocationEngine *)self learnedLocationStore];
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v51[2] = __145__RTLearnedLocationEngine_calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate_endDate_homeMapItem_workMapItem_locationsOfOthers_error___block_invoke;
              v51[3] = &unk_1E6B905F0;
              id v53 = buf;
              id v54 = &v55;
              id v21 = v19;
              __int16 v52 = v21;
              [v20 fetchLocationsOfInterestVisitedBetweenStartDate:v14 endDate:v15 handler:v51];

              dispatch_semaphore_t dsema = v21;
              id v49 = [MEMORY[0x1E4F1C9C8] now];
              dispatch_time_t v22 = dispatch_time(0, 3600000000000);
              if (!dispatch_semaphore_wait(dsema, v22)) {
                goto LABEL_27;
              }
              id v23 = [MEMORY[0x1E4F1C9C8] now];
              [v23 timeIntervalSinceDate:v49];
              double v25 = v24;
              id v47 = objc_opt_new();
              id v48 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
              id v26 = [MEMORY[0x1E4F29060] callStackSymbols];
              uint64_t v27 = [v26 filteredArrayUsingPredicate:v48];
              id v46 = [v27 firstObject];

              [v47 submitToCoreAnalytics:v46 type:1 duration:v25];
              id v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)id v68 = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v68, 2u);
              }

              id v29 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v67 = *MEMORY[0x1E4F28568];
              *(void *)id v68 = @"semaphore wait timeout";
              uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
              id v31 = [v29 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v30];

              if (v31)
              {
                id v32 = v31;

                char v33 = 0;
              }
              else
              {
LABEL_27:
                id v32 = 0;
                char v33 = 1;
              }

              id v41 = v32;
              if ((v33 & 1) == 0) {
                objc_storeStrong(v56 + 5, v32);
              }
              id v42 = v56[5];
              if (v42)
              {
                id v35 = 0;
              }
              else
              {
                id v45 = [(RTLearnedLocationEngine *)self learnedLocationStore];
                id v35 = +[RTPlaceDataMetrics generateDictionaryOfOldMetricsWithLearnedLocationStore:v45 locationsOfInterest:*((void *)v62 + 5) homeMapItem:v16 workMapItem:v18 locationsOfOthers:a7];

                id v42 = v56[5];
              }
              *a8 = v42;

              _Block_object_dispose(&v55, 8);
              _Block_object_dispose(buf, 8);

              goto LABEL_36;
            }
            id v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outLocationsOfOthers", buf, 2u);
            }

            _RTErrorInvalidParameterCreate(@"outLocationsOfOthers");
            id v37 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            double v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workMapItem", buf, 2u);
            }

            _RTErrorInvalidParameterCreate(@"workMapItem");
            id v37 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: homeMapItem", buf, 2u);
          }

          _RTErrorInvalidParameterCreate(@"homeMapItem");
          id v37 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        id v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
        }

        _RTErrorInvalidParameterCreate(@"endDate");
        id v37 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      __int16 v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"startDate");
      id v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v35 = 0;
    *a8 = v37;
    goto LABEL_36;
  }
  id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  id v35 = 0;
LABEL_36:

  return v35;
}

void __145__RTLearnedLocationEngine_calculateMetricsToReplayOldHomeWorkInferenceAlgoWithStartDate_endDate_homeMapItem_workMapItem_locationsOfOthers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    intptr_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Error was issued during fetching locationsOfInterest from store. Error: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)calculateNewMetricsAndSubmitAlongWithTheOldMetrics:(id)a3 startDate:(id)a4 endDate:(id)a5 homeMapItem:(id)a6 workMapItem:(id)a7 distanceThresholdArray:(id)a8 locationsOfOthers:(id)a9
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v79 = a5;
  id v75 = a6;
  id v74 = a7;
  id v68 = a8;
  id v72 = v14;
  id v73 = a9;
  uint64_t v78 = v15;
  if (!v14)
  {
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    id v35 = "Invalid parameter not satisfying: dict";
LABEL_27:
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_34;
  }
  if (!v15)
  {
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    id v35 = "Invalid parameter not satisfying: startDate";
    goto LABEL_27;
  }
  if (!v79)
  {
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    id v35 = "Invalid parameter not satisfying: endDate";
    goto LABEL_27;
  }
  if (!v75)
  {
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    id v35 = "Invalid parameter not satisfying: homeMapItem";
    goto LABEL_27;
  }
  if (!v74)
  {
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    id v35 = "Invalid parameter not satisfying: workMapItem";
    goto LABEL_27;
  }
  if (![v68 count])
  {
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    id v35 = "Invalid parameter not satisfying: distanceThresholdArray.count > 0";
    goto LABEL_27;
  }
  if (!v73)
  {
    id v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    id v35 = "Invalid parameter not satisfying: locationsOfOthers";
    goto LABEL_27;
  }
  uint64_t v62 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@", @"entryDate", v15];
  *(void *)buf = 0;
  id v102 = buf;
  uint64_t v103 = 0x3032000000;
  id v104 = __Block_byref_object_copy__36;
  uint64_t v105 = __Block_byref_object_dispose__36;
  id v106 = 0;
  uint64_t v95 = 0;
  id v96 = (id *)&v95;
  uint64_t v97 = 0x3032000000;
  id v98 = __Block_byref_object_copy__36;
  uint64_t v99 = __Block_byref_object_dispose__36;
  id v100 = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  id v17 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __161__RTLearnedLocationEngine_calculateNewMetricsAndSubmitAlongWithTheOldMetrics_startDate_endDate_homeMapItem_workMapItem_distanceThresholdArray_locationsOfOthers___block_invoke;
  v90[3] = &unk_1E6B94018;
  long long v92 = buf;
  uint64_t v93 = &v95;
  void v90[4] = self;
  SEL v94 = a2;
  id v18 = v16;
  long long v91 = v18;
  [v17 fetchVisitsWithPredicate:v62 handler:v90];

  dispatch_semaphore_t dsema = v18;
  dispatch_semaphore_t v19 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v20 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v20))
  {
    id v32 = 0;
LABEL_29:
    char v33 = 1;
    goto LABEL_30;
  }
  id v21 = [MEMORY[0x1E4F1C9C8] now];
  [v21 timeIntervalSinceDate:v19];
  double v23 = v22;
  double v24 = objc_opt_new();
  double v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  id v26 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v27 = [v26 filteredArrayUsingPredicate:v25];
  id v28 = [v27 firstObject];

  [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
  id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)BOOL v107 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v107, 2u);
  }

  uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
  v116[0] = *MEMORY[0x1E4F28568];
  *(void *)BOOL v107 = @"semaphore wait timeout";
  id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v116 count:1];
  id v32 = [v30 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v31];

  if (!v32) {
    goto LABEL_29;
  }
  id v32 = v32;

  char v33 = 0;
LABEL_30:

  id v61 = v32;
  if ((v33 & 1) == 0) {
    objc_storeStrong(v96 + 5, v32);
  }
  if (!v96[5])
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v65 = [&unk_1F3452B38 countByEnumeratingWithState:&v86 objects:v115 count:16];
    if (v65)
    {
      uint64_t v64 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v65; ++i)
        {
          if (*(void *)v87 != v64) {
            objc_enumerationMutation(&unk_1F3452B38);
          }
          id v80 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          context = (void *)MEMORY[0x1E016D870]();
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id obj = v68;
          uint64_t v36 = [obj countByEnumeratingWithState:&v82 objects:v114 count:16];
          if (v36)
          {
            uint64_t v71 = *(void *)v83;
            do
            {
              uint64_t v37 = 0;
              uint64_t v76 = v36;
              do
              {
                if (*(void *)v83 != v71) {
                  objc_enumerationMutation(obj);
                }
                id v38 = *(void **)(*((void *)&v82 + 1) + 8 * v37);
                uint64_t v39 = (void *)MEMORY[0x1E016D870]();
                [v38 doubleValue];
                double v41 = v40;
                id v42 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  id v43 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v43);
                  id v44 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v45 = (id)objc_claimAutoreleasedReturnValue();
                  id v46 = +[RTPlaceDataMetrics DataSourceToString:](RTPlaceDataMetrics, "DataSourceToString:", [v80 unsignedIntValue]);
                  *(_DWORD *)BOOL v107 = 138413058;
                  *(void *)&v107[4] = v44;
                  __int16 v108 = 2112;
                  id v109 = v45;
                  __int16 v110 = 2112;
                  uint64_t v111 = v46;
                  __int16 v112 = 2048;
                  double v113 = v41;
                  _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "%@, %@, submitting metrics, data source, %@, distance threshold, %.3f", v107, 0x2Au);
                }
                id v47 = [RTPlaceDataMetrics alloc];
                uint64_t v48 = *((void *)v102 + 5);
                id v49 = [v75 location];
                id v50 = [v74 location];
                id v51 = [(RTPlaceDataMetrics *)v47 initWithVisitArray:v48 distanceThreshold:v49 locationHome:v50 locationWork:v73 locationsOfOthers:v78 startDateTime:v79 endDateTime:v41];

                [(RTPlaceDataMetrics *)v51 calculateAndSetVisitMetrics];
                [(RTPlaceDataMetrics *)v51 setCurrentInferenceReplayableMetricsFromDict:v72];
                __int16 v52 = [(RTPlaceDataMetrics *)v51 findHomeWorkOthersIntervals];
                if ([v80 unsignedIntValue] == 1)
                {
                  id v53 = +[RTPlaceDataMetrics calculateMLFeatures:v52 startDate:v78 endDate:v79 createBucketedFeatures:0];
                }
                else
                {
                  id v54 = [(RTLearnedLocationEngine *)self biomeManager];
                  id v53 = +[RTPlaceDataMetrics calculateMLFeaturesUsingBiomeManager:v54 intervalDictionary:v52 startDate:v78 endDate:v79 createBucketedFeatures:0];
                }
                -[RTPlaceDataMetrics setMLMetricsFromFeaturesDict:sourceName:](v51, "setMLMetricsFromFeaturesDict:sourceName:", v53, [v80 unsignedIntValue]);
                id v81 = 0;
                [(RTPlaceDataMetrics *)v51 submitMetricsWithError:&v81];
                id v55 = v81;
                if (v55)
                {
                  uint64_t v56 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v57 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v57);
                    id v58 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    id v59 = (id)objc_claimAutoreleasedReturnValue();
                    id v60 = +[RTPlaceDataMetrics DataSourceToString:](RTPlaceDataMetrics, "DataSourceToString:", [v80 unsignedIntValue]);
                    *(_DWORD *)BOOL v107 = 138413058;
                    *(void *)&v107[4] = v58;
                    __int16 v108 = 2112;
                    id v109 = v59;
                    __int16 v110 = 2112;
                    uint64_t v111 = v60;
                    __int16 v112 = 2112;
                    double v113 = *(double *)&v55;
                    _os_log_error_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_ERROR, "%@, %@, error was issued during metrics submission for RTPlaceDataMetrics, data source, %@, error, %@", v107, 0x2Au);
                  }
                }

                ++v37;
              }
              while (v76 != v37);
              uint64_t v36 = [obj countByEnumeratingWithState:&v82 objects:v114 count:16];
            }
            while (v36);
          }
        }
        uint64_t v65 = [&unk_1F3452B38 countByEnumeratingWithState:&v86 objects:v115 count:16];
      }
      while (v65);
    }
  }

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(buf, 8);

  id v34 = v62;
LABEL_34:
}

void __161__RTLearnedLocationEngine_calculateNewMetricsAndSubmitAlongWithTheOldMetrics_startDate_endDate_homeMapItem_workMapItem_distanceThresholdArray_locationsOfOthers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    intptr_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      int v12 = 138412802;
      double v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, error was issued during fetching visits from store, error, %@", (uint8_t *)&v12, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)requestTrainLocationsOfInterestModelWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcActivityManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke_2;
  v4[3] = &unk_1E6B92690;
  dispatch_semaphore_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 unregisterActivityWithIdentifier:@"com.apple.routined.learnedLocationEngine.train-local-model" handler:v4];
}

void __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "error canceling re-train.", buf, 2u);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke_509;
    v6[3] = &unk_1E6B90CE0;
    id v5 = *(void **)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    dispatch_async(v4, v6);
  }
}

uint64_t __75__RTLearnedLocationEngine_requestTrainLocationsOfInterestModelWithHandler___block_invoke_509(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestTrainLocationsOfInterestModelWithHandler:*(void *)(a1 + 40)];
}

- (void)_requestTrainLocationsOfInterestModelWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:1 priority:1 requireNetworkConnectivity:2 requireInexpensiveNetworkConnectivity:0 networkTransferDirection:1 allowBattery:900.0 powerNap:7200.0];
  objc_initWeak(&location, self);
  id v7 = [(RTLearnedLocationEngine *)self xpcActivityManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v9[2] = __76__RTLearnedLocationEngine__requestTrainLocationsOfInterestModelWithHandler___block_invoke;
  v9[3] = &unk_1E6B94068;
  v11[1] = (id)a2;
  id v8 = v5;
  id v10 = v8;
  objc_copyWeak(v11, &location);
  [v7 registerActivityWithIdentifier:@"com.apple.routined.learnedLocationEngine.train-local-model" criteria:v6 handler:v9];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __76__RTLearnedLocationEngine__requestTrainLocationsOfInterestModelWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __76__RTLearnedLocationEngine__requestTrainLocationsOfInterestModelWithHandler___block_invoke_510;
      v12[3] = &unk_1E6B94040;
      uint64_t v15 = *(void *)(a1 + 48);
      double v13 = v5;
      id v14 = *(id *)(a1 + 32);
      [WeakRetained trainLocationsOfInterestModelWithHandler:v12];
    }
    else
    {
      if (v5) {
        v5[2](v5, 0);
      }
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
      }
    }
  }
}

void __76__RTLearnedLocationEngine__requestTrainLocationsOfInterestModelWithHandler___block_invoke_510(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to train, error, %@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)trainLocationsOfInterestModelWithHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  objc_initWeak(&location, self);
  uint64_t v7 = [(RTLearnedLocationEngine *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__RTLearnedLocationEngine_trainLocationsOfInterestModelWithHandler___block_invoke;
  v10[3] = &unk_1E6B94090;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  id v11 = v6;
  id v12 = v5;
  void v10[4] = self;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __68__RTLearnedLocationEngine_trainLocationsOfInterestModelWithHandler___block_invoke(uint64_t a1)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) defaultsManager];
    id v4 = [v3 objectForKey:@"LearnedLocationEngineTrainVisitsLastAttemptDate"];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1C9C8] date];
    }
    __int16 v10 = v6;

    double v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412290;
      id v35 = v14;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "--------->%@, start training locations of interest<---------", buf, 0xCu);
    }
    uint64_t v15 = *(void **)(a1 + 32);
    __int16 v16 = NSString;
    id v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
    __int16 v18 = [v16 stringWithFormat:@"before %@", v17];
    [v15 _logDatabasesWithReason:v18];

    id v19 = *(void **)(a1 + 32);
    id v33 = 0;
    [v19 _trainLocationsOfInterestModelWithError:&v33];
    id v20 = v33;
    id v21 = *(void **)(a1 + 32);
    double v22 = NSString;
    double v23 = NSStringFromSelector(*(SEL *)(a1 + 64));
    double v24 = [v22 stringWithFormat:@"after %@", v23];
    [v21 _logDatabasesWithReason:v24];

    double v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
      [v27 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138412802;
      id v35 = v26;
      __int16 v36 = 2112;
      id v37 = v20;
      __int16 v38 = 2048;
      uint64_t v39 = v28;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "--------->%@, finished training locations of interest, error, %@, latency, %.2f<---------", buf, 0x20u);
    }
    if (!v20)
    {
      id v29 = *(void **)(a1 + 32);
      uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
      [v30 timeIntervalSinceDate:v10];
      [v29 didUpdateWithIntervalSinceLastUpdate:];
    }
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31) {
      (*(void (**)(uint64_t, id))(v31 + 16))(v31, v20);
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F5CFE8];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41[0] = @"swelf was nil";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    __int16 v10 = [v7 errorWithDomain:v8 code:0 userInfo:v9];

    id v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v32 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      id v35 = v32;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v10);
    }
  }
}

- (BOOL)_reconcileLearnedLocationsWithError:(id *)a3
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, started", buf, 0xCu);
  }
  id v58 = [MEMORY[0x1E4F1C9C8] date];
  [(RTLearnedLocationEngine *)self willBeginTraining];
  id v5 = [MEMORY[0x1E4F1C978] array];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Reconciliation algorithm chosen, per device", buf, 2u);
  }

  id v74 = 0;
  uint64_t v7 = [(RTLearnedLocationEngine *)self _performPerDeviceReconiliationWithError:&v74];
  id v61 = v74;

  uint64_t v63 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v7 count]];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v7;
  uint64_t v65 = [obj countByEnumeratingWithState:&v70 objects:v86 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v71;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v71 != v64) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v70 + 1) + 8 * v8);
        __int16 v10 = (void *)MEMORY[0x1E016D870]();
        id v11 = [RTLearnedLocation alloc];
        uint64_t v12 = [v9 visits];
        double v13 = [(RTLearnedLocation *)v11 initWithLearnedVisits:v12];

        if (v13) {
          goto LABEL_12;
        }
        id v14 = [RTLearnedLocation alloc];
        uint64_t v15 = [v9 place];
        __int16 v16 = [v15 mapItem];
        double v13 = [(RTLearnedLocation *)v14 initWithMapItem:v16 type:2];

        if (v13)
        {
LABEL_12:
          id v17 = [RTLearnedLocationOfInterest alloc];
          __int16 v18 = [v9 place];
          id v19 = [v18 identifier];
          id v20 = [v9 place];
          id v21 = [v9 visits];
          double v22 = [v9 transitions];
          double v23 = [(RTLearnedLocationOfInterest *)v17 initWithIdentifier:v19 location:v13 place:v20 visits:v21 transitions:v22];

          if (v23) {
            [v63 addObject:v23];
          }
        }
        else
        {
          double v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            double v24 = [v9 place];
            double v25 = [v9 visits];
            uint64_t v26 = [v25 count];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v26;
            _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "failed to create locationOfInterest for place, %@, with %lu visits", buf, 0x16u);
          }
        }

        ++v8;
      }
      while (v65 != v8);
      uint64_t v27 = [obj countByEnumeratingWithState:&v70 objects:v86 count:16];
      uint64_t v65 = v27;
    }
    while (v27);
  }

  if (v61)
  {
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v61;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "error while running reconciliation, %@", buf, 0xCu);
    }

    BOOL v29 = 0;
    if (a3) {
      *a3 = v61;
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    long long v83 = __Block_byref_object_copy__36;
    long long v84 = __Block_byref_object_dispose__36;
    id v85 = 0;
    dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
    uint64_t v31 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __63__RTLearnedLocationEngine__reconcileLearnedLocationsWithError___block_invoke;
    v66[3] = &unk_1E6B940B8;
    id v67 = v63;
    uint64_t v69 = buf;
    id v32 = v30;
    id v68 = v32;
    [v31 replaceWithLocationsOfInterest:v67 handler:v66];

    id v33 = v32;
    id v34 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v35 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v33, v35)) {
      goto LABEL_31;
    }
    __int16 v36 = [MEMORY[0x1E4F1C9C8] now];
    [v36 timeIntervalSinceDate:v34];
    double v38 = v37;
    uint64_t v39 = objc_opt_new();
    uint64_t v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    double v41 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v42 = [v41 filteredArrayUsingPredicate:v40];
    id v43 = [v42 firstObject];

    [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
    id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v75 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v75, 2u);
    }

    id v45 = (void *)MEMORY[0x1E4F28C58];
    v87[0] = *MEMORY[0x1E4F28568];
    *(void *)id v75 = @"semaphore wait timeout";
    id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v87 count:1];
    id v47 = [v45 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v46];

    if (v47)
    {
      id v48 = v47;

      char v49 = 0;
    }
    else
    {
LABEL_31:
      id v48 = 0;
      char v49 = 1;
    }

    id v50 = v48;
    if ((v49 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&buf[8] + 40), v48);
    }
    id v51 = *(void **)(*(void *)&buf[8] + 40);
    BOOL v29 = v51 == 0;
    if (v51)
    {
      if (a3) {
        *a3 = v51;
      }
    }
    else
    {
      __int16 v52 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        id v53 = (id)objc_claimAutoreleasedReturnValue();
        id v54 = [MEMORY[0x1E4F1C9C8] date];
        [v54 timeIntervalSinceDate:v58];
        *(_DWORD *)id v75 = 138413058;
        *(void *)&v75[4] = v53;
        __int16 v76 = 2112;
        id v77 = @"YES";
        __int16 v78 = 2112;
        uint64_t v79 = 0;
        __int16 v80 = 2048;
        uint64_t v81 = v55;
        _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, finished, success, %@, error, %@, latency, %.2f", v75, 0x2Au);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  return v29;
}

void __63__RTLearnedLocationEngine__reconcileLearnedLocationsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(a1 + 32) count];
      int v11 = 134218242;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "error while replacing locationsOfInterest model, locationsOfInterest, %lu, error, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "replaced locationsOfInterest model, locationsOfInterest, %lu", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
  id v10 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reconcileLearnedLocationsWithHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v6 = 0;
  [(RTLearnedLocationEngine *)self _reconcileLearnedLocationsWithError:&v6];
  id v5 = v6;
  if (v4) {
    v4[2](v4, v5);
  }
}

- (void)reconcileLearnedLocationsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __64__RTLearnedLocationEngine_reconcileLearnedLocationsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__RTLearnedLocationEngine_reconcileLearnedLocationsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconcileLearnedLocationsWithHandler:*(void *)(a1 + 40)];
}

- (id)_performPerVisitReconciliationWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a2);
  id v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = NSStringFromSelector(a2);
  id v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];
  [v10 UTF8String];
  uint64_t v40 = (void *)os_transaction_create();

  int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double v37 = (objc_class *)objc_opt_class();
    double v38 = NSStringFromClass(v37);
    uint64_t v39 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v38;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v39;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  uint64_t v12 = [[RTPowerAssertion alloc] initWithIdentifier:v5 timeout:300.0];
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v53 = __Block_byref_object_copy__36;
  id v54 = __Block_byref_object_dispose__36;
  id v55 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  char v49 = __Block_byref_object_copy__36;
  id v50 = __Block_byref_object_dispose__36;
  id v51 = 0;
  reconcilerPerVisit = self->_reconcilerPerVisit;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  void v42[2] = __67__RTLearnedLocationEngine__performPerVisitReconciliationWithError___block_invoke;
  v42[3] = &unk_1E6B905F0;
  id v44 = buf;
  id v45 = &v46;
  uint64_t v15 = v13;
  id v43 = v15;
  [(RTLearnedLocationReconcilerPerVisit *)reconcilerPerVisit performReconciliationWithHandler:v42];
  __int16 v16 = v15;
  id v17 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18)) {
    goto LABEL_8;
  }
  id v19 = [MEMORY[0x1E4F1C9C8] now];
  [v19 timeIntervalSinceDate:v17];
  double v21 = v20;
  double v22 = objc_opt_new();
  double v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  double v24 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v25 = [v24 filteredArrayUsingPredicate:v23];
  uint64_t v26 = [v25 firstObject];

  [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
  uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v57 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v57, 2u);
  }

  uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v56 = *MEMORY[0x1E4F28568];
  *(void *)uint64_t v57 = @"semaphore wait timeout";
  BOOL v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
  dispatch_semaphore_t v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

  if (v30)
  {
    id v31 = v30;

    char v32 = 0;
  }
  else
  {
LABEL_8:
    id v31 = 0;
    char v32 = 1;
  }

  id v33 = v31;
  if ((v32 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)&buf[8] + 40), v31);
  }

  id v34 = *(void **)(*(void *)&buf[8] + 40);
  if (v34)
  {
    id v35 = 0;
    if (a3) {
      *a3 = v34;
    }
  }
  else
  {
    id v35 = (id)v47[5];
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(buf, 8);

  return v35;
}

void __67__RTLearnedLocationEngine__performPerVisitReconciliationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "error during reconcilation, %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v6 count];
    int v14 = 134217984;
    uint64_t v15 = v13;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "reconciled %lu locations of interest", (uint8_t *)&v14, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_performPerDeviceReconiliationWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a2);
  id v6 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  uint64_t v9 = NSStringFromSelector(a2);
  id v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];
  [v10 UTF8String];
  uint64_t v40 = (void *)os_transaction_create();

  int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double v37 = (objc_class *)objc_opt_class();
    double v38 = NSStringFromClass(v37);
    uint64_t v39 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v38;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v39;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  uint64_t v12 = [[RTPowerAssertion alloc] initWithIdentifier:v5 timeout:300.0];
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v53 = __Block_byref_object_copy__36;
  id v54 = __Block_byref_object_dispose__36;
  id v55 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  char v49 = __Block_byref_object_copy__36;
  id v50 = __Block_byref_object_dispose__36;
  id v51 = 0;
  reconcilerPerDevice = self->_reconcilerPerDevice;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  void v42[2] = __67__RTLearnedLocationEngine__performPerDeviceReconiliationWithError___block_invoke;
  v42[3] = &unk_1E6B905F0;
  id v44 = buf;
  id v45 = &v46;
  uint64_t v15 = v13;
  id v43 = v15;
  [(RTLearnedLocationReconcilerPerDevice *)reconcilerPerDevice performReconciliationWithHandler:v42];
  uint64_t v16 = v15;
  id v17 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18)) {
    goto LABEL_8;
  }
  id v19 = [MEMORY[0x1E4F1C9C8] now];
  [v19 timeIntervalSinceDate:v17];
  double v21 = v20;
  double v22 = objc_opt_new();
  double v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  double v24 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v25 = [v24 filteredArrayUsingPredicate:v23];
  uint64_t v26 = [v25 firstObject];

  [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
  uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v57 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v57, 2u);
  }

  uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v56 = *MEMORY[0x1E4F28568];
  *(void *)uint64_t v57 = @"semaphore wait timeout";
  BOOL v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
  dispatch_semaphore_t v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

  if (v30)
  {
    id v31 = v30;

    char v32 = 0;
  }
  else
  {
LABEL_8:
    id v31 = 0;
    char v32 = 1;
  }

  id v33 = v31;
  if ((v32 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)&buf[8] + 40), v31);
  }

  id v34 = *(void **)(*(void *)&buf[8] + 40);
  if (v34)
  {
    id v35 = 0;
    if (a3) {
      *a3 = v34;
    }
  }
  else
  {
    id v35 = (id)v47[5];
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(buf, 8);

  return v35;
}

void __67__RTLearnedLocationEngine__performPerDeviceReconiliationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "error during per device reconciliation, %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v6 count];
    int v14 = 134217984;
    uint64_t v15 = v13;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "per device reconciled %lu locations of interest", (uint8_t *)&v14, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getNearbyCandidatesAroundLocation:(id)a3 distance:(double)a4 loiIdentifierToCoalescedSourceMap:(id)a5 error:(id *)a6
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  id v77 = a5;
  if (!v76)
  {
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    if (!a6) {
      goto LABEL_30;
    }
    _RTErrorInvalidParameterCreate(@"location");
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (a4 <= 0.0)
  {
    dispatch_semaphore_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distance > 0", buf, 2u);
    }

    if (!a6) {
      goto LABEL_30;
    }
    _RTErrorInvalidParameterCreate(@"distance > 0");
    id v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
    id v32 = 0;
    *a6 = v29;
    goto LABEL_64;
  }
  if (!v77)
  {
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiIdentifierToCoalescedSourceMap", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"loiIdentifierToCoalescedSourceMap");
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_30:
    id v32 = 0;
    goto LABEL_64;
  }
  *(void *)buf = 0;
  id v102 = buf;
  uint64_t v103 = 0x3032000000;
  id v104 = __Block_byref_object_copy__36;
  uint64_t v105 = __Block_byref_object_dispose__36;
  id v106 = 0;
  uint64_t v95 = 0;
  id v96 = (id *)&v95;
  uint64_t v97 = 0x3032000000;
  id v98 = __Block_byref_object_copy__36;
  uint64_t v99 = __Block_byref_object_dispose__36;
  id v100 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  learnedLocationStore = self->_learnedLocationStore;
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __110__RTLearnedLocationEngine_getNearbyCandidatesAroundLocation_distance_loiIdentifierToCoalescedSourceMap_error___block_invoke;
  v91[3] = &unk_1E6B905F0;
  uint64_t v93 = buf;
  SEL v94 = &v95;
  int v11 = v9;
  long long v92 = v11;
  [(RTLearnedLocationStore *)learnedLocationStore fetchLocationsOfInterestWithVisitsWithinDistance:v76 location:v91 handler:a4];
  dispatch_semaphore_t dsema = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v13)) {
    goto LABEL_17;
  }
  int v14 = [MEMORY[0x1E4F1C9C8] now];
  [v14 timeIntervalSinceDate:v12];
  double v16 = v15;
  id v17 = objc_opt_new();
  dispatch_time_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v20 = [v19 filteredArrayUsingPredicate:v18];
  double v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  double v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)__int16 v112 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v112, 2u);
  }

  double v23 = (void *)MEMORY[0x1E4F28C58];
  v115[0] = *MEMORY[0x1E4F28568];
  *(void *)__int16 v112 = @"semaphore wait timeout";
  double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v115 count:1];
  double v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;

    char v27 = 0;
  }
  else
  {
LABEL_17:
    id v26 = 0;
    char v27 = 1;
  }

  id v73 = v26;
  if ((v27 & 1) == 0) {
    objc_storeStrong(v96 + 5, v26);
  }
  if (v96[5])
  {
    id v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v65 = NSStringFromSelector(a2);
      id v66 = v96[5];
      *(_DWORD *)__int16 v112 = 138412546;
      *(void *)&v112[4] = v65;
      __int16 v113 = 2112;
      long long v114 = v66;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, error, %@", v112, 0x16u);
    }
    id v32 = 0;
    if (a6) {
      *a6 = v96[5];
    }
  }
  else
  {
    id v34 = [*((id *)v102 + 5) valueForKeyPath:@"@count.visits"];
    uint64_t v35 = [v34 unsignedIntegerValue];

    __int16 v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v35];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = *((id *)v102 + 5);
    uint64_t v68 = [obj countByEnumeratingWithState:&v87 objects:v111 count:16];
    if (v68)
    {
      uint64_t v69 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v68; ++i)
        {
          if (*(void *)v88 != v69) {
            objc_enumerationMutation(obj);
          }
          double v37 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          double v38 = [v37 identifier];
          long long v72 = [v77 objectForKeyedSubscript:v38];

          if (!v72)
          {
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            uint64_t v39 = [v37 visits];
            uint64_t v40 = 0;
            uint64_t v41 = [v39 countByEnumeratingWithState:&v83 objects:v110 count:16];
            if (v41)
            {
              uint64_t v42 = *(void *)v84;
              do
              {
                for (uint64_t j = 0; j != v41; ++j)
                {
                  if (*(void *)v84 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v40 |= [*(id *)(*((void *)&v83 + 1) + 8 * j) placeSource];
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v83 objects:v110 count:16];
              }
              while (v41);
            }

            id v44 = [NSNumber numberWithUnsignedInteger:v40];
            id v45 = [v37 identifier];
            [v77 setObject:v44 forKeyedSubscript:v45];
          }
          uint64_t v46 = [v37 identifier];
          id v47 = [v77 objectForKeyedSubscript:v46];
          uint64_t v48 = [v47 unsignedIntegerValue];
          char v49 = [v37 place];
          id v50 = [v49 mapItem];
          [v50 setSource:v48];

          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v51 = [v37 visits];
          uint64_t v52 = [v51 countByEnumeratingWithState:&v79 objects:v109 count:16];
          if (v52)
          {
            uint64_t v53 = *(void *)v80;
            while (2)
            {
              for (uint64_t k = 0; k != v52; ++k)
              {
                if (*(void *)v80 != v53) {
                  objc_enumerationMutation(v51);
                }
                uint64_t v55 = *(void *)(*((void *)&v79 + 1) + 8 * k);
                id v56 = objc_alloc(MEMORY[0x1E4F5CE58]);
                uint64_t v57 = [v37 place];
                uint64_t v58 = [v57 mapItem];
                id v59 = (void *)[v56 initWithFirstObject:v55 secondObject:v58];

                if (!v59)
                {
                  id v60 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v107 = *MEMORY[0x1E4F28568];
                  __int16 v108 = @"candidate was nil";
                  id v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
                  uint64_t v62 = [v60 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v61];

                  uint64_t v63 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                  {
                    id v67 = NSStringFromSelector(a2);
                    *(_DWORD *)__int16 v112 = 138412546;
                    *(void *)&v112[4] = v67;
                    __int16 v113 = 2112;
                    long long v114 = v62;
                    _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "%@, error, %@", v112, 0x16u);
                  }
                  if (a6) {
                    *a6 = v62;
                  }

                  id v32 = 0;
                  goto LABEL_62;
                }
                [v36 addObject:v59];
              }
              uint64_t v52 = [v51 countByEnumeratingWithState:&v79 objects:v109 count:16];
              if (v52) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v68 = [obj countByEnumeratingWithState:&v87 objects:v111 count:16];
      }
      while (v68);
    }

    id v32 = v36;
LABEL_62:
  }
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(buf, 8);
LABEL_64:

  return v32;
}

void __110__RTLearnedLocationEngine_getNearbyCandidatesAroundLocation_distance_loiIdentifierToCoalescedSourceMap_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)extractCandidate:(id)a3 fromNearbyCandidates:(id)a4 extractedCandidate:(id *)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  char v49 = v10;
  id v12 = [v10 firstObject];
  dispatch_time_t v13 = [v12 identifier];

  if (!v13)
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate.firstObject.identifier", buf, 2u);
    }

    if (!a6) {
      goto LABEL_34;
    }
    dispatch_semaphore_t v30 = @"candidate.firstObject.identifier";
    goto LABEL_33;
  }
  if (!v11)
  {
    id v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nearbyCandidates", buf, 2u);
    }

    if (!a6) {
      goto LABEL_34;
    }
    dispatch_semaphore_t v30 = @"nearbyCandidates";
    goto LABEL_33;
  }
  if (![v11 count])
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nearbyCandidates.count > 0", buf, 2u);
    }

    if (!a6) {
      goto LABEL_34;
    }
    dispatch_semaphore_t v30 = @"nearbyCandidates.count > 0";
LABEL_33:
    _RTErrorInvalidParameterCreate((uint64_t)v30);
    id v28 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (!a5)
  {
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: extractedCandidate", buf, 2u);
    }

    if (a6)
    {
      dispatch_semaphore_t v30 = @"extractedCandidate";
      goto LABEL_33;
    }
LABEL_34:
    id v28 = 0;
    goto LABEL_43;
  }
  id v44 = a6;
  [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v11 count] - 1];
  uint64_t v46 = v45 = v11;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v60 count:16];
  aSelector = a2;
  if (!v15)
  {

    id v27 = 0;
    uint64_t v17 = 0;
LABEL_37:
    id v34 = [NSString stringWithFormat:@"isEqualCount = %lu, != 1", v17];
    uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F5CFE8];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    id v59 = v34;
    double v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    double v38 = [v35 errorWithDomain:v36 code:0 userInfo:v37];

    uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412546;
      uint64_t v55 = v41;
      __int16 v56 = 2112;
      uint64_t v57 = v38;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (v44) {
      id *v44 = v38;
    }

    id v28 = 0;
    goto LABEL_42;
  }
  uint64_t v16 = v15;
  uint64_t v42 = a5;
  uint64_t v17 = 0;
  id obj = v14;
  id v48 = 0;
  uint64_t v18 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v51 != v18) {
        objc_enumerationMutation(obj);
      }
      double v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      double v21 = [v49 firstObject];
      double v22 = [v21 identifier];
      double v23 = [v20 firstObject];
      double v24 = [v23 identifier];
      int v25 = [v22 isEqual:v24];

      if (v25)
      {
        id v26 = v20;

        ++v17;
        id v48 = v26;
      }
      else
      {
        [v46 addObject:v20];
      }
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  }
  while (v16);

  if (v17 != 1)
  {
    id v27 = v48;
    goto LABEL_37;
  }
  id v27 = v48;
  id *v42 = v27;
  id v28 = v46;
LABEL_42:
  id v11 = v45;

LABEL_43:

  return v28;
}

- (id)getRelabeledInferredMapItemForCandidate:(id)a3 relabeler:(id)a4 loiIdentifierToCoalescedSourceMap:(id)a5 submitMetrics:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = v15;
  if (a7)
  {
    if (v13)
    {
      if (v14)
      {
        if (v15)
        {
          BOOL v47 = v8;
          uint64_t v17 = [v13 firstObject];
          uint64_t v18 = [v17 location];
          id v19 = [v18 location];
          [v14 contextDistanceThreshold];
          id v54 = 0;
          char v49 = v16;
          uint64_t v20 = -[RTLearnedLocationEngine getNearbyCandidatesAroundLocation:distance:loiIdentifierToCoalescedSourceMap:error:](self, "getNearbyCandidatesAroundLocation:distance:loiIdentifierToCoalescedSourceMap:error:", v19, v16, &v54);
          id v21 = v54;

          if (v21)
          {
            id v22 = 0;
            *a7 = v21;
            double v23 = (void *)v20;
            uint64_t v16 = v49;
LABEL_34:

            goto LABEL_35;
          }
          id v52 = 0;
          id v53 = 0;
          id v29 = [(RTLearnedLocationEngine *)self extractCandidate:v13 fromNearbyCandidates:v20 extractedCandidate:&v53 error:&v52];
          id v30 = v53;
          id v31 = v52;
          id v32 = v31;
          double v23 = (void *)v20;
          if (v31)
          {
            id v33 = v30;
            id v22 = 0;
            *a7 = v31;
            uint64_t v16 = v49;
LABEL_33:

            goto LABEL_34;
          }
          uint64_t v46 = v29;
          id v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          uint64_t v16 = v49;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v42 = NSStringFromSelector(a2);
            uint64_t v43 = [v46 count];
            *(_DWORD *)buf = 138412802;
            __int16 v56 = v42;
            __int16 v57 = 2048;
            uint64_t v58 = v43;
            __int16 v59 = 2112;
            uint64_t v60 = 0;
            _os_log_debug_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEBUG, "%@, filteredNearbyCandidates count, %lu, filterError, %@", buf, 0x20u);

            id v21 = 0;
          }

          uint64_t v35 = [[RTRelabelerMetrics alloc] initWithRelabeler:v14];
          id v51 = 0;
          id v44 = [v14 relabelCandidate:v30 usingContextCandidates:v46 metrics:v35 outPriorVector:0 outObservationVector:0 outPosteriorVector:0 error:&v51];
          id v36 = v51;
          [(RTRelabelerMetrics *)v35 setErrorMetrics:v36];
          id v45 = v35;
          if (v47)
          {
            id v48 = v21;
            id v50 = 0;
            BOOL v37 = [(RTRelabelerMetrics *)v35 submitMetricsWithError:&v50];
            id v38 = v50;
            if (!v37)
            {
              id v33 = v30;
              id v40 = v38;
              *a7 = v40;

              id v22 = 0;
              id v21 = v48;
              goto LABEL_31;
            }

            id v21 = v48;
          }
          id v33 = v30;
          if (!v36)
          {
            uint64_t v39 = v44;
            id v22 = v44;
LABEL_32:

            id v29 = v46;
            goto LABEL_33;
          }
          id v22 = 0;
          *a7 = v36;
LABEL_31:
          uint64_t v39 = v44;
          goto LABEL_32;
        }
        id v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiIdentifierToCoalescedSourceMap", buf, 2u);
        }

        id v26 = @"loiIdentifierToCoalescedSourceMap";
      }
      else
      {
        id v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeler", buf, 2u);
        }

        id v26 = @"relabeler";
      }
    }
    else
    {
      int v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
      }

      id v26 = @"candidate";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v26);
    id v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  double v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  id v22 = 0;
LABEL_35:

  return v22;
}

- (id)createRelabeler
{
  id v3 = [[RTRelabelerParameters alloc] initWithDefaultsManager:self->_defaultsManager];
  id v4 = [[RTRelabeler alloc] initWithDistanceCalculator:self->_distanceCalculator parameters:v3];

  return v4;
}

- (id)createRelabelerPersisterWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = [[RTMapItemProviderLearnedPlaceParameters alloc] initWithDefaultsManager:self->_defaultsManager];
    id v6 = [[RTRelabelerParameters alloc] initWithDefaultsManager:self->_defaultsManager];
    [(RTLearnedLocationEngine *)self _enabledMapItemProviders];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v32 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v13 = v12;

      if (!v13) {
        goto LABEL_13;
      }
      id v14 = [[RTRelabelerPersisterMetrics alloc] initWithLoggingEnabled:0];
      id v15 = [RTRelabelerPersister alloc];
      defaultsManager = self->_defaultsManager;
      distanceCalculator = self->_distanceCalculator;
      uint64_t v18 = [(RTStore *)self->_learnedLocationStore persistenceManager];
      id v19 = [(RTRelabelerPersister *)v15 initWithDefaultsManager:defaultsManager distanceCalculator:distanceCalculator learnedPlaceParameters:v5 metrics:v14 persistenceManager:v18 relabelerParameters:v6 reverseGeocodeProvider:v13];
    }
    else
    {
LABEL_10:

LABEL_13:
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F5CFE8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      id v31 = @"reverse geocode provider was nil";
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      double v23 = [v20 errorWithDomain:v21 code:0 userInfo:v22];

      id v13 = v23;
      id v19 = 0;
      *a3 = v13;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v5 = (RTMapItemProviderLearnedPlaceParameters *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, &v5->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    id v19 = 0;
  }

  return v19;
}

- (BOOL)_relabelWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    long long v25 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, started", buf, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [(RTLearnedLocationEngine *)self createRelabeler];
  id v23 = 0;
  uint64_t v10 = [(RTLearnedLocationEngine *)self createRelabelerPersisterWithError:&v23];
  id v11 = v23;
  id v12 = v11;
  if (v11)
  {
    LOBYTE(v13) = 0;
    if (a3) {
      *a3 = v11;
    }
  }
  else
  {
    id v22 = 0;
    BOOL v13 = [(RTLearnedLocationEngine *)self _relabelWithRelabeler:v9 relabelerPersister:v10 error:&v22];
    id v14 = v22;
    id v15 = v14;
    if (a3) {
      *a3 = v14;
    }
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = NSStringFromSelector(a2);
      if (v13) {
        uint64_t v18 = @"YES";
      }
      else {
        uint64_t v18 = @"NO";
      }
      id v19 = [MEMORY[0x1E4F1C9C8] date];
      [v19 timeIntervalSinceDate:v8];
      *(_DWORD *)buf = 138413058;
      long long v25 = v17;
      __int16 v26 = 2112;
      long long v27 = v18;
      __int16 v28 = 2112;
      id v29 = v15;
      __int16 v30 = 2048;
      uint64_t v31 = v20;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, finished, success, %@, error, %@, latency, %.2f", buf, 0x2Au);
    }
  }

  return v13;
}

- (BOOL)_relabelWithRelabeler:(id)a3 relabelerPersister:(id)a4 error:(id *)a5
{
  v121[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    aSelector = a2;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    *(void *)__int16 v108 = 0;
    id v109 = v108;
    uint64_t v110 = 0x3032000000;
    uint64_t v111 = __Block_byref_object_copy__36;
    __int16 v112 = __Block_byref_object_dispose__36;
    id v113 = 0;
    if (v8)
    {
      if (v9)
      {
        [v9 logLocalStoreWithReason:@"before resnapping visits"];
        id v11 = v109;
        id v107 = (id)*((void *)v109 + 5);
        [v9 resnapVisitsWithError:&v107];
        objc_storeStrong((id *)v11 + 5, v107);
        id v12 = _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          BOOL v13 = NSStringFromSelector(aSelector);
          id v14 = (void *)*((void *)v109 + 5);
          *(_DWORD *)buf = 138412546;
          v117 = v13;
          __int16 v118 = 2112;
          id v119 = v14;
          _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, resnapped with error, %@", buf, 0x16u);
        }
        if (*((void *)v109 + 5)) {
          goto LABEL_43;
        }
        [v9 logLocalStoreWithReason:@"before relabeling"];
        long long v84 = [[RTStoredLocationOfInterestEnumerationOptions alloc] initWithAscendingVisitEntryDate:1 batchSize:1 dateInterval:0 singleVisit:1];
        id v15 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412290;
          v117 = v18;
          _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, creating delete operations", buf, 0xCu);
        }
        [v8 enableLogging:0];
        id v19 = [MEMORY[0x1E4F1CA60] dictionary];
        learnedLocationStore = self->_learnedLocationStore;
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = __74__RTLearnedLocationEngine__relabelWithRelabeler_relabelerPersister_error___block_invoke;
        v100[3] = &unk_1E6B940E0;
        id v21 = v9;
        id v101 = v21;
        id v102 = self;
        id v83 = v8;
        id v103 = v83;
        id v22 = v19;
        id v104 = v22;
        id v82 = v15;
        id v105 = v82;
        id v81 = v16;
        id v106 = v81;
        [(RTLearnedLocationStore *)learnedLocationStore enumerateStoredLocationsOfInterestWithOptions:v84 enumerationBlock:v100];
        id v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          double v24 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          v117 = v24;
          __int16 v118 = 2112;
          id v119 = v82;
          _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, created all delete operations, allErrors, %@", buf, 0x16u);
        }
        long long v25 = [NSNumber numberWithUnsignedInteger:[v22 count]];
        __int16 v26 = [v21 metrics];
        long long v27 = [v26 metrics];
        [v27 setObject:v25 forKeyedSubscript:@"numberOfStartingLOIs"];

        __int16 v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412290;
          v117 = v29;
          _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, creating add operations", buf, 0xCu);
        }
        [v83 enableLogging:0];
        __int16 v30 = self->_learnedLocationStore;
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __74__RTLearnedLocationEngine__relabelWithRelabeler_relabelerPersister_error___block_invoke_575;
        v93[3] = &unk_1E6B94108;
        uint64_t v99 = v108;
        id v31 = v81;
        id v94 = v31;
        id v32 = v21;
        id v95 = v32;
        id v96 = self;
        id v97 = v83;
        id v33 = v22;
        id v98 = v33;
        [(RTLearnedLocationStore *)v30 enumerateStoredLocationsOfInterestWithOptions:v84 enumerationBlock:v93];
        id v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          uint64_t v35 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          v117 = v35;
          __int16 v118 = 2112;
          id v119 = v82;
          _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, created all add operations, allErrors, %@", buf, 0x16u);
        }
        if (!*((void *)v109 + 5))
        {
          [v32 logLocalStoreWithReason:@"before collapsing"];
          id v36 = v109;
          id obj = (id)*((void *)v109 + 5);
          [v32 iterativelyCollapseOverlappingRevGeoLOIsWithError:&obj];
          objc_storeStrong((id *)v36 + 5, obj);
          BOOL v37 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            id v38 = NSStringFromSelector(aSelector);
            uint64_t v39 = (void *)*((void *)v109 + 5);
            *(_DWORD *)buf = 138412546;
            v117 = v38;
            __int16 v118 = 2112;
            id v119 = v39;
            _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, cleaned with error, %@", buf, 0x16u);
          }
          id v40 = (id *)(v109 + 40);
          if (!*((void *)v109 + 5))
          {
            id v91 = 0;
            [v32 dedupeLOIsWithError:&v91];
            objc_storeStrong(v40, v91);
            uint64_t v41 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              uint64_t v42 = NSStringFromSelector(aSelector);
              uint64_t v43 = (void *)*((void *)v109 + 5);
              *(_DWORD *)buf = 138412546;
              v117 = v42;
              __int16 v118 = 2112;
              id v119 = v43;
              _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "%@, deduped with error, %@", buf, 0x16u);
            }
            if (!*((void *)v109 + 5))
            {
              [v32 logLocalStoreWithReason:@"before combining sequential"];
              id v44 = v109;
              id v90 = (id)*((void *)v109 + 5);
              [v32 combineSequentialVisitsWithError:&v90];
              objc_storeStrong((id *)v44 + 5, v90);
              id v45 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                uint64_t v46 = NSStringFromSelector(aSelector);
                BOOL v47 = (void *)*((void *)v109 + 5);
                *(_DWORD *)buf = 138412546;
                v117 = v46;
                __int16 v118 = 2112;
                id v119 = v47;
                _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_INFO, "%@, combined sequential visits with error, %@", buf, 0x16u);
              }
              id v48 = (id *)(v109 + 40);
              if (!*((void *)v109 + 5))
              {
                id v89 = 0;
                [v32 fixUnconcreteLOIs:&v89];
                objc_storeStrong(v48, v89);
                char v49 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                {
                  id v50 = NSStringFromSelector(aSelector);
                  id v51 = (void *)*((void *)v109 + 5);
                  *(_DWORD *)buf = 138412546;
                  v117 = v50;
                  __int16 v118 = 2112;
                  id v119 = v51;
                  _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "%@, fixed unconcrete LOIs with error, %@", buf, 0x16u);
                }
                id v52 = (id *)(v109 + 40);
                if (!*((void *)v109 + 5))
                {
                  id v88 = 0;
                  [v32 saveWithError:&v88];
                  objc_storeStrong(v52, v88);
                  id v53 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                  {
                    id v54 = NSStringFromSelector(aSelector);
                    uint64_t v55 = (void *)*((void *)v109 + 5);
                    *(_DWORD *)buf = 138412546;
                    v117 = v54;
                    __int16 v118 = 2112;
                    id v119 = v55;
                    _os_log_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_INFO, "%@, saved with error, %@", buf, 0x16u);
                  }
                  if (!*((void *)v109 + 5)) {
                    [(RTLearnedLocationEngine *)self _logLocalStoreWithReason:@"after saving"];
                  }
                }
              }
            }
          }
        }

        __int16 v56 = v84;
      }
      else
      {
        uint64_t v63 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v114 = *MEMORY[0x1E4F28568];
        uint64_t v115 = @"relabelerPersister was nil";
        uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        uint64_t v65 = [v63 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v64];
        id v66 = (void *)*((void *)v109 + 5);
        *((void *)v109 + 5) = v65;

        id v67 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          long long v79 = NSStringFromSelector(aSelector);
          long long v80 = (void *)*((void *)v109 + 5);
          *(_DWORD *)buf = 138412546;
          v117 = v79;
          __int16 v118 = 2112;
          id v119 = v80;
          _os_log_error_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        __int16 v56 = [0 metrics];
        [v56 setErrorKey:@"persisterWasNil"];
      }
    }
    else
    {
      uint64_t v58 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v120 = *MEMORY[0x1E4F28568];
      v121[0] = @"relabeler was nil";
      __int16 v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:&v120 count:1];
      uint64_t v60 = [v58 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v59];
      uint64_t v61 = (void *)*((void *)v109 + 5);
      *((void *)v109 + 5) = v60;

      uint64_t v62 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        id v77 = NSStringFromSelector(aSelector);
        __int16 v78 = (void *)*((void *)v109 + 5);
        *(_DWORD *)buf = 138412546;
        v117 = v77;
        __int16 v118 = 2112;
        id v119 = v78;
        _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      __int16 v56 = [v9 metrics];
      [v56 setErrorKey:@"relabelerWasNil"];
    }

LABEL_43:
    uint64_t v68 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v69 = NSNumber;
    [v68 timeIntervalSinceDate:v10];
    long long v70 = [v69 numberWithDouble:];
    long long v71 = [v9 metrics];
    uint64_t v72 = [v71 metrics];
    [(id)v72 setObject:v70 forKeyedSubscript:@"runTime"];

    id v73 = [v9 metrics];
    id v87 = 0;
    LOBYTE(v72) = [v73 submitMetricsWithError:&v87];
    id v74 = v87;

    id v75 = v74;
    if ((v72 & 1) != 0 && (id v75 = (void *)*((void *)v109 + 5)) == 0)
    {
      BOOL v57 = 1;
    }
    else
    {
      BOOL v57 = 0;
      *a5 = v75;
    }

    _Block_object_dispose(v108, 8);
    goto LABEL_47;
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int16 v108 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v108, 2u);
  }
  BOOL v57 = 0;
LABEL_47:

  return v57;
}

void __74__RTLearnedLocationEngine__relabelWithRelabeler_relabelerPersister_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 firstObject];
  id v7 = [v5 firstObject];

  id v8 = [v7 visits];
  id v9 = [v8 firstObject];

  uint64_t v10 = [v9 identifier];

  if (!a3 && v10)
  {
    id v11 = [*(id *)(a1 + 32) metrics];
    [v11 tallyKey:@"numberOfStartingVisits"];

    id v12 = objc_alloc(MEMORY[0x1E4F5CE58]);
    BOOL v13 = [v6 place];
    id v14 = [v13 mapItem];
    id v15 = (void *)[v12 initWithFirstObject:v9 secondObject:v14];

    uint64_t v16 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    id v27 = 0;
    id v19 = [v16 getRelabeledInferredMapItemForCandidate:v15 relabeler:v17 loiIdentifierToCoalescedSourceMap:v18 submitMetrics:1 error:&v27];
    id v20 = v27;
    if (v20)
    {
      [*(id *)(a1 + 64) addObject:v20];
      id v21 = *(void **)(a1 + 72);
      id v22 = [v9 identifier];
      [v21 addObject:v22];
    }
    else
    {
      id v23 = *(void **)(a1 + 32);
      id v26 = 0;
      [v23 useRelabeledInferredMapItem:v19 oldCandidate:v15 associate:0 error:&v26];
      id v22 = v26;
      if (v22)
      {
        [*(id *)(a1 + 64) addObject:v22];
        double v24 = *(void **)(a1 + 72);
        long long v25 = [v9 identifier];
        [v24 addObject:v25];
      }
    }
  }
}

void __74__RTLearnedLocationEngine__relabelWithRelabeler_relabelerPersister_error___block_invoke_575(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(*(void *)(a1[9] + 8) + 40))
  {
    *a4 = 1;
  }
  else
  {
    id v6 = a2;
    id v7 = [v6 firstObject];
    id v8 = [v6 firstObject];

    id v9 = [v8 visits];
    uint64_t v10 = [v9 firstObject];

    id v11 = [v10 identifier];

    if (!a3 && v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F5CE58]);
      BOOL v13 = [v7 place];
      id v14 = [v13 mapItem];
      id v15 = (void *)[v12 initWithFirstObject:v10 secondObject:v14];

      uint64_t v16 = (void *)a1[4];
      uint64_t v17 = [v10 identifier];
      uint64_t v18 = [v16 member:v17];

      if (v18)
      {
        id v19 = (void *)a1[5];
        uint64_t v20 = *(void *)(a1[9] + 8);
        id v37 = *(id *)(v20 + 40);
        [v19 restoreToOldCandidate:v15 error:&v37];
        id v21 = v37;
        id v22 = *(id *)(v20 + 40);
        *(void *)(v20 + 40) = v21;
      }
      else
      {
        id v23 = (void *)a1[6];
        uint64_t v24 = a1[7];
        uint64_t v25 = a1[8];
        id v36 = 0;
        id v26 = [v23 getRelabeledInferredMapItemForCandidate:v15 relabeler:v24 loiIdentifierToCoalescedSourceMap:v25 submitMetrics:0 error:&v36];
        id v22 = v36;
        id v27 = (void *)a1[5];
        if (v22)
        {
          uint64_t v28 = *(void *)(a1[9] + 8);
          id v35 = *(id *)(v28 + 40);
          [v27 restoreToOldCandidate:v15 error:&v35];
          id v29 = v35;
          id v30 = *(id *)(v28 + 40);
          *(void *)(v28 + 40) = v29;
        }
        else
        {
          id v34 = 0;
          [v27 useRelabeledInferredMapItem:v26 oldCandidate:v15 associate:1 error:&v34];
          id v30 = v34;
          if (v30)
          {
            id v31 = (void *)a1[5];
            uint64_t v32 = *(void *)(a1[9] + 8);
            id obj = *(id *)(v32 + 40);
            [v31 restoreToOldCandidate:v15 error:&obj];
            objc_storeStrong((id *)(v32 + 40), obj);
          }
        }
      }
    }
  }
}

- (void)relabelWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __46__RTLearnedLocationEngine_relabelWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__RTLearnedLocationEngine_relabelWithHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = 0;
  [v2 _relabelWithError:&v5];
  id v3 = v5;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (void)willBeginTraining
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Learned location engine will begin training.", v5, 2u);
    }

    [WeakRetained learnedLocationEngineWillBeginTraining:self];
  }
}

- (void)didFinishTraining
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained learnedLocationEngineDidFinishTraining:self];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Learned location engine did finish training.", v5, 2u);
    }
  }
}

- (void)didUpdateWithIntervalSinceLastUpdate:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained learnedLocationEngineDidUpdate:self intervalSinceLastUpdate:a3];
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      double v8 = a3;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Learned location engine did update, intervalSinceLastUpdate, %.2f", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)didClear
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained learnedLocationEngineDidClear:self];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Learned location engine did clear", v5, 2u);
    }
  }
}

- (BOOL)_purgeWithReferenceDate:(id)a3 error:(id *)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  double v8 = (void *)[[v6 alloc] initWithCapacity:3];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke;
  v88[3] = &unk_1E6B94130;
  id v11 = v8;
  id v89 = v11;
  SEL v91 = a2;
  id v12 = v9;
  id v90 = v12;
  [v10 removeRecordsExpiredBeforeDate:v7 handler:v88];

  BOOL v13 = v12;
  unint64_t v14 = 0x1E4F1C000uLL;
  id v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  unint64_t v17 = 0x1E4F28000uLL;
  id v77 = self;
  __int16 v78 = a2;
  if (dispatch_semaphore_wait(v13, v16))
  {
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
    [v18 timeIntervalSinceDate:v15];
    double v20 = v19;
    id v21 = objc_opt_new();
    id v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v24 = [v23 filteredArrayUsingPredicate:v22];
    uint64_t v25 = [v24 firstObject];

    [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
    id v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F5CFE8];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v92 count:1];
    id v30 = [v27 errorWithDomain:v28 code:15 userInfo:v29];

    if (v30)
    {
      id v30 = v30;
    }
    self = v77;
    a2 = v78;
    unint64_t v14 = 0x1E4F1C000;
    unint64_t v17 = 0x1E4F28000;
  }
  else
  {
    id v30 = 0;
  }

  id v31 = v30;
  uint64_t v32 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke_593;
  v84[3] = &unk_1E6B94130;
  id v75 = v11;
  id v85 = v75;
  SEL v87 = a2;
  id v33 = v13;
  long long v86 = v33;
  [v32 removeUnreferencedPlacesWithHandler:v84];

  id v34 = v33;
  id v35 = [*(id *)(v14 + 2504) now];
  dispatch_time_t v36 = dispatch_time(0, 3600000000000);
  id v37 = v31;
  if (dispatch_semaphore_wait(v34, v36))
  {
    id v38 = [*(id *)(v14 + 2504) now];
    [v38 timeIntervalSinceDate:v35];
    double v40 = v39;
    uint64_t v41 = objc_opt_new();
    uint64_t v42 = [*(id *)(v17 + 3936) predicateWithBlock:&__block_literal_global_1080];
    uint64_t v43 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v44 = [v43 filteredArrayUsingPredicate:v42];
    id v45 = [v44 firstObject];

    [v41 submitToCoreAnalytics:v45 type:1 duration:v40];
    uint64_t v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    BOOL v47 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = *MEMORY[0x1E4F5CFE8];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    char v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v92 count:1];
    id v50 = [v47 errorWithDomain:v48 code:15 userInfo:v49];

    id v37 = v31;
    self = v77;
    a2 = v78;
    unint64_t v14 = 0x1E4F1C000uLL;
    unint64_t v17 = 0x1E4F28000uLL;
    if (v50)
    {
      id v37 = v50;
    }
  }

  id v51 = v37;
  id v52 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke_594;
  v80[3] = &unk_1E6B94130;
  id v53 = v75;
  id v81 = v53;
  SEL v83 = a2;
  id v54 = v34;
  id v82 = v54;
  [v52 removeUnreferencedMapItems:v80];

  uint64_t v55 = v54;
  __int16 v56 = [*(id *)(v14 + 2504) now];
  dispatch_time_t v57 = dispatch_time(0, 3600000000000);
  id v58 = v51;
  if (dispatch_semaphore_wait(v55, v57))
  {
    long long v79 = [*(id *)(v14 + 2504) now];
    [v79 timeIntervalSinceDate:v56];
    double v60 = v59;
    uint64_t v61 = objc_opt_new();
    uint64_t v62 = [*(id *)(v17 + 3936) predicateWithBlock:&__block_literal_global_1080];
    uint64_t v63 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v64 = [v63 filteredArrayUsingPredicate:v62];
    uint64_t v65 = [v64 firstObject];

    [v61 submitToCoreAnalytics:v65 type:1 duration:v60];
    id v66 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v67 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v68 = *MEMORY[0x1E4F5CFE8];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v92 count:1];
    long long v70 = [v67 errorWithDomain:v68 code:15 userInfo:v69];

    id v58 = v51;
    if (v70)
    {
      id v58 = v70;
    }
  }

  id v71 = v58;
  uint64_t v72 = _RTSafeArray();
  id v73 = _RTMultiErrorCreate();

  if (a4) {
    *a4 = v73;
  }

  return v73 == 0;
}

void __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v6 = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to remove expired records, error, %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke_593(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v6 = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to remove unreferenced places, error, %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __57__RTLearnedLocationEngine__purgeWithReferenceDate_error___block_invoke_594(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v6 = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to remove unreferenced map items, error, %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_classifyPlaceTypes:(id *)a3
{
  v60[1] = *MEMORY[0x1E4F143B8];
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v50 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, started", buf, 0xCu);
  }
  __int16 v8 = [MEMORY[0x1E4F1C9C8] date];
  if ([(RTLearnedLocationEngine *)self _deferTrainingDueToAvailability])
  {
    uint64_t v59 = *MEMORY[0x1E4F28568];
    id v9 = NSString;
    uint64_t v10 = NSStringFromSelector(a2);
    id v11 = [v9 stringWithFormat:@"Deferring %@ due to availability of the learned location store.", v10];
    v60[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];

    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v12];
    unint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412290;
    id v50 = v13;
    goto LABEL_10;
  }
  id v15 = [(RTLearnedLocationEngine *)self defaultsManager];
  uint64_t v16 = [v15 objectForKey:@"ShouldSkipPlaceTypeClassification"];
  if (v16)
  {
    unint64_t v17 = (void *)v16;
    uint64_t v18 = [(RTLearnedLocationEngine *)self defaultsManager];
    double v19 = [v18 objectForKey:@"ShouldSkipPlaceTypeClassification"];
    int v20 = [v19 BOOLValue];

    if (v20)
    {
      uint64_t v57 = *MEMORY[0x1E4F28568];
      id v21 = NSString;
      id v22 = NSStringFromSelector(a2);
      id v23 = [v21 stringWithFormat:@"test only!!! skip %@", v22];
      id v58 = v23;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];

      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v12];
      unint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v50 = v13;
LABEL_10:
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_11:

      if (a3)
      {
        id v13 = v13;
        LOBYTE(v24) = 0;
        *a3 = v13;
      }
      else
      {
        LOBYTE(v24) = 0;
      }
      goto LABEL_23;
    }
  }
  else
  {
  }
  BOOL v47 = v8;
  uint64_t v25 = [(RTLearnedLocationEngine *)self placeTypeClassifierMetricsCalculator];
  [v25 resetStates];

  id v45 = [RTPlaceTypeClassifier alloc];
  id v44 = [(RTLearnedLocationEngine *)self biomeManager];
  uint64_t v43 = [(RTLearnedLocationEngine *)self contactsManager];
  id v26 = [(RTLearnedLocationEngine *)self defaultsManager];
  [(RTLearnedLocationEngine *)self distanceCalculator];
  id v27 = v46 = a3;
  uint64_t v42 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  uint64_t v41 = [(RTLearnedLocationEngine *)self locationManager];
  double v40 = [(RTLearnedLocationEngine *)self mapServiceManager];
  uint64_t v28 = [(RTLearnedLocationEngine *)self mapsSupportManager];
  id v29 = [(RTLearnedLocationEngine *)self placeTypeClassifierMetricsCalculator];
  id v30 = [(RTLearnedLocationEngine *)self platform];
  id v31 = [(RTLearnedLocationEngine *)self queue];
  uint64_t v32 = [(RTLearnedLocationEngine *)self visitManager];
  id v12 = [(RTPlaceTypeClassifier *)v45 initWithBiomeManager:v44 contactsManager:v43 defaultsManager:v26 distanceCalculator:v27 learnedLocationStore:v42 locationManager:v41 mapServiceManager:v40 mapsSupportManager:v28 placeTypeClassifierMetricsCalculator:v29 platform:v30 queue:v31 visitManager:v32];

  id v48 = 0;
  BOOL v24 = [(RTPlaceTypeClassifier *)v12 classifyWithError:&v48];
  id v33 = v48;
  id v13 = v33;
  if (v46) {
    id *v46 = v33;
  }
  id v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  __int16 v8 = v47;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    id v35 = NSStringFromSelector(a2);
    if (v24) {
      dispatch_time_t v36 = @"YES";
    }
    else {
      dispatch_time_t v36 = @"NO";
    }
    id v37 = [MEMORY[0x1E4F1C9C8] date];
    [v37 timeIntervalSinceDate:v47];
    *(_DWORD *)buf = 138413058;
    id v50 = v35;
    __int16 v51 = 2112;
    id v52 = v36;
    __int16 v53 = 2112;
    id v54 = v13;
    __int16 v55 = 2048;
    uint64_t v56 = v38;
    _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, finished, success, %@, error, %@, latency, %.2f", buf, 0x2Au);
  }
LABEL_23:

  return v24;
}

- (void)_classifyPlaceTypesWithHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, id))a3;
  id v11 = 0;
  BOOL v6 = [(RTLearnedLocationEngine *)self _classifyPlaceTypes:&v11];
  id v7 = v11;
  __int16 v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(a2);
    uint64_t v10 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v13 = v9;
    __int16 v14 = 2112;
    if (v6) {
      uint64_t v10 = @"YES";
    }
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, place type classification success, %@, error, %@", buf, 0x20u);
  }
  if (v5) {
    v5[2](v5, v7);
  }
}

- (void)classifyPlaceTypesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __57__RTLearnedLocationEngine_classifyPlaceTypesWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__RTLearnedLocationEngine_classifyPlaceTypesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _classifyPlaceTypesWithHandler:*(void *)(a1 + 40)];
}

- (BOOL)_consolidateKnownPlaceTypesWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = NSStringFromSelector(a2);
      int v17 = 138412290;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, started", (uint8_t *)&v17, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [(RTLearnedLocationEngine *)self createRelabelerPersisterWithError:a3];
    uint64_t v10 = v9;
    if (!*a3
      && [v9 consolidateVisitsToLoisWithKnownPlaceTypesWithError:a3]
      && [v10 combineSequentialVisitsWithError:a3]
      && [v10 cleanUpWithError:a3]
      && [v10 saveWithError:a3])
    {
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = NSStringFromSelector(a2);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:v8];
        int v17 = 138413058;
        uint64_t v18 = v12;
        __int16 v19 = 2112;
        int v20 = @"YES";
        __int16 v21 = 2112;
        uint64_t v22 = 0;
        __int16 v23 = 2048;
        uint64_t v24 = v14;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, finished, success, %@, error, %@, latency, %.2f", (uint8_t *)&v17, 0x2Au);
      }
      BOOL v15 = 1;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", (uint8_t *)&v17, 2u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_saveIdentifiersOfKnownPlaceTypesWithError:(id *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    os_log_t oslog = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v53 = 0;
      _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v53, 2u);
    }
LABEL_27:
    BOOL v32 = 0;
    goto LABEL_28;
  }
  os_log_t oslog = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v44 = [&unk_1F3452B50 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v60;
    uint64_t v39 = *MEMORY[0x1E4F5CFE8];
    uint64_t v40 = *MEMORY[0x1E4F28568];
LABEL_4:
    uint64_t v3 = 0;
    while (1)
    {
      if (*(void *)v60 != v42) {
        objc_enumerationMutation(&unk_1F3452B50);
      }
      id v4 = *(void **)(*((void *)&v59 + 1) + 8 * v3);
      *(void *)__int16 v53 = 0;
      id v54 = v53;
      uint64_t v55 = 0x3032000000;
      uint64_t v56 = __Block_byref_object_copy__36;
      uint64_t v57 = __Block_byref_object_dispose__36;
      id v58 = 0;
      id v5 = objc_opt_new();
      dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
      learnedLocationStore = self->_learnedLocationStore;
      uint64_t v46 = v4;
      uint64_t v8 = [v4 unsignedIntegerValue];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __70__RTLearnedLocationEngine__saveIdentifiersOfKnownPlaceTypesWithError___block_invoke;
      v48[3] = &unk_1E6B94180;
      void v48[4] = self;
      v48[5] = v4;
      __int16 v51 = v53;
      SEL v52 = a2;
      id v9 = v5;
      id v49 = v9;
      uint64_t v10 = v6;
      id v50 = v10;
      [(RTLearnedLocationStore *)learnedLocationStore fetchLocationsOfInterestWithPlaceType:v8 handler:v48];
      id v11 = v10;
      id v12 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v13 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v11, v13)) {
        goto LABEL_12;
      }
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
      [v14 timeIntervalSinceDate:v12];
      double v16 = v15;
      int v17 = objc_opt_new();
      uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
      __int16 v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v20 = [v19 filteredArrayUsingPredicate:v18];
      __int16 v21 = [v20 firstObject];

      [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
      uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      __int16 v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = v40;
      *(void *)buf = @"semaphore wait timeout";
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v64 count:1];
      uint64_t v25 = [v23 errorWithDomain:v39 code:15 userInfo:v24];

      if (v25)
      {
        id v26 = v25;

        char v27 = 0;
      }
      else
      {
LABEL_12:
        id v26 = 0;
        char v27 = 1;
      }

      id v28 = v26;
      if ((v27 & 1) == 0) {
        objc_storeStrong((id *)v54 + 5, v26);
      }
      id v29 = (void *)*((void *)v54 + 5);
      if (v29)
      {
        *a3 = v29;
      }
      else if ([v9 count])
      {
        [oslog setObject:v9 forKey:v46];
      }

      _Block_object_dispose(v53, 8);
      if (v29) {
        goto LABEL_27;
      }
      if (v44 == ++v3)
      {
        uint64_t v44 = [&unk_1F3452B50 countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (v44) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  id v47 = 0;
  id v30 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:oslog requiringSecureCoding:1 error:&v47];
  id v31 = v47;
  BOOL v32 = v31 == 0;
  if (!v31)
  {
    id v33 = [(RTLearnedLocationEngine *)self defaultsManager];
    [v33 setObject:v30 forKey:@"KnownPlaceIdentifiers"];

    id v34 = [(RTLearnedLocationEngine *)self defaultsManager];
    id v35 = [MEMORY[0x1E4F1C9C8] now];
    [v34 setObject:v35 forKey:@"KnownPlaceIdentifiersLastUpdateDate"];
  }
  id v36 = v31;
  *a3 = v36;

LABEL_28:
  return v32;
}

void __70__RTLearnedLocationEngine__saveIdentifiersOfKnownPlaceTypesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v11 = [v5 count];
    uint64_t v12 = [*(id *)(a1 + 40) unsignedIntegerValue];
    *(_DWORD *)buf = 138413314;
    __int16 v21 = v9;
    __int16 v22 = 2112;
    __int16 v23 = v10;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    __int16 v26 = 2048;
    uint64_t v27 = v12;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched location of interest count, %lu, placeType, %lu, error, %@", buf, 0x34u);
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
  id v15 = v6;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__RTLearnedLocationEngine__saveIdentifiersOfKnownPlaceTypesWithError___block_invoke_612;
  v17[3] = &unk_1E6B94158;
  uint64_t v16 = *(void *)(a1 + 72);
  v17[4] = *(void *)(a1 + 32);
  uint64_t v19 = v16;
  id v18 = *(id *)(a1 + 48);
  [v5 enumerateObjectsUsingBlock:v17];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __70__RTLearnedLocationEngine__saveIdentifiersOfKnownPlaceTypesWithError___block_invoke_612(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v12 = [v5 identifier];
    int v13 = 138413058;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = a3;
    __int16 v19 = 2112;
    int v20 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, %@, idx, %lu, location of interest identifier, %@", (uint8_t *)&v13, 0x2Au);
  }
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v5 identifier];
  [v7 addObject:v8];
}

- (void)_onContactsManagerNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    int v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@", buf, 0x16u);
  }
  uint64_t v8 = [v5 name];
  id v9 = +[RTNotification notificationName];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    id v16 = 0;
    BOOL v11 = [(RTLearnedLocationEngine *)self _classifyPlaceTypes:&v16];
    uint64_t v12 = v16;
    int v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = @"NO";
      if (v11) {
        uint64_t v14 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      int v20 = v12;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "classify place types, success, %@, error, %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = NSStringFromSelector(a2);
    __int16 v15 = [v5 name];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    int v20 = v15;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", buf, 0x16u);

LABEL_10:
  }
}

- (void)onContactsManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __57__RTLearnedLocationEngine_onContactsManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__RTLearnedLocationEngine_onContactsManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onContactsManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onMapsSupportManagerNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    __int16 v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@", buf, 0x16u);
  }
  id v8 = [v5 name];
  id v9 = +[RTNotification notificationName];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    BOOL v11 = v5;
    if ([v11 queryType] == 2)
    {
      id v17 = 0;
      BOOL v12 = [(RTLearnedLocationEngine *)self _classifyPlaceTypes:&v17];
      int v13 = v17;
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = @"NO";
        if (v12) {
          __int16 v15 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        __int16 v19 = v15;
        __int16 v20 = 2112;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "classify place types, success, %@, error, %@", buf, 0x16u);
      }
    }
    else
    {
      int v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      uint64_t v14 = NSStringFromSelector(a2);
      id v16 = [v11 name];
      *(_DWORD *)buf = 138412546;
      __int16 v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%@, unhandled notification, %@", buf, 0x16u);
    }
LABEL_11:
  }
}

- (void)onMapsSupportManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __60__RTLearnedLocationEngine_onMapsSupportManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__RTLearnedLocationEngine_onMapsSupportManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMapsSupportManagerNotification:*(void *)(a1 + 40)];
}

- (BOOL)_submitDailyVisitMetrics
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "visit metrics submission, start", buf, 2u);
  }

  id v4 = [(RTLearnedLocationEngine *)self learnedLocationStore];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
    id v6 = [RTVisitMetrics alloc];
    id v7 = [(RTLearnedLocationEngine *)self distanceCalculator];
    id v8 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    id v9 = [(RTLearnedLocationEngine *)self locationStore];
    int v10 = [(RTLearnedLocationEngine *)self motionActivityManager];
    BOOL v11 = [(RTLearnedLocationEngine *)self visitManager];
    BOOL v12 = [(RTVisitMetrics *)v6 initWithDistanceCalculator:v7 learnedLocationStore:v8 locationStore:v9 motionActivityManager:v10 visitManager:v11];

    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 duration:86400.0];
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v5;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "visit metrics submission, start, %@, interval %@", buf, 0x16u);
    }

    id v20 = 0;
    BOOL v15 = [(RTVisitMetrics *)v12 collectRealtimeMetricsForDateInterval:v13 error:&v20];
    id v16 = v20;
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = @"NO";
      if (v15) {
        __int16 v19 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "visit metrics submission, success, %@, error, %@", buf, 0x16u);
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (void)onLearnedLocationStoreNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __62__RTLearnedLocationEngine_onLearnedLocationStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__RTLearnedLocationEngine_onLearnedLocationStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onLearnedLocationStoreNotification:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8 && [v5 availability] == 2)
  {
    if ([(RTLearnedLocationEngine *)self shouldRecoverKnownPlaceTypes]) {
      BOOL v9 = [(RTLearnedLocationEngine *)self _homeLocationOfInterestExist];
    }
    else {
      BOOL v9 = 1;
    }
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = (objc_class *)objc_opt_class();
      BOOL v12 = NSStringFromClass(v11);
      int v13 = NSStringFromSelector(a2);
      BOOL v14 = [(RTLearnedLocationEngine *)self shouldRecoverKnownPlaceTypes];
      BOOL v15 = @"NO";
      *(_DWORD *)buf = 138413058;
      uint64_t v38 = v12;
      if (v14) {
        id v16 = @"YES";
      }
      else {
        id v16 = @"NO";
      }
      if (v9) {
        BOOL v15 = @"YES";
      }
      __int16 v39 = 2112;
      id v40 = v13;
      __int16 v41 = 2112;
      uint64_t v42 = v16;
      __int16 v43 = 2112;
      uint64_t v44 = v15;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, shouldRecoverKnownPlaceTypes, %@, homeExist, %@", buf, 0x2Au);
    }
    if ([(RTLearnedLocationEngine *)self shouldRecoverKnownPlaceTypes] && !v9)
    {
      aSelector = a2;
      id v17 = [(RTLearnedLocationEngine *)self placeTypeClassifierMetricsCalculator];
      [v17 resetStates];

      id v34 = [RTPlaceTypeClassifier alloc];
      id v35 = [(RTLearnedLocationEngine *)self biomeManager];
      BOOL v32 = [(RTLearnedLocationEngine *)self contactsManager];
      id v33 = [(RTLearnedLocationEngine *)self defaultsManager];
      id v29 = [(RTLearnedLocationEngine *)self distanceCalculator];
      id v31 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      uint64_t v30 = [(RTLearnedLocationEngine *)self locationManager];
      __int16 v28 = [(RTLearnedLocationEngine *)self mapServiceManager];
      uint64_t v27 = [(RTLearnedLocationEngine *)self mapsSupportManager];
      uint64_t v18 = [(RTLearnedLocationEngine *)self placeTypeClassifierMetricsCalculator];
      __int16 v19 = [(RTLearnedLocationEngine *)self platform];
      uint64_t v20 = [(RTLearnedLocationEngine *)self queue];
      uint64_t v21 = [(RTLearnedLocationEngine *)self visitManager];
      uint64_t v22 = [(RTPlaceTypeClassifier *)v34 initWithBiomeManager:v35 contactsManager:v32 defaultsManager:v33 distanceCalculator:v29 learnedLocationStore:v31 locationManager:v30 mapServiceManager:v28 mapsSupportManager:v27 placeTypeClassifierMetricsCalculator:v18 platform:v19 queue:v20 visitManager:v21];

      id v36 = 0;
      LOBYTE(v20) = [(RTLearnedLocationEngine *)self _recoverKnownPlaceTypesWithPlaceTypeClassifier:v22 outError:&v36];
      id v23 = v36;
      if (v20)
      {
        [(RTLearnedLocationEngine *)self setShouldRecoverKnownPlaceTypes:0];
      }
      else
      {
        id v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          uint64_t v38 = v25;
          __int16 v39 = 2112;
          id v40 = v23;
          _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, _recoverKnownPlaceTypesWithError, error, %@", buf, 0x16u);
        }
      }
    }
  }
}

- (BOOL)_recoverKnownPlaceTypesWithPlaceTypeClassifier:(id)a3 outError:(id *)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  uint64_t v63 = self;
  id v5 = [(RTLearnedLocationEngine *)self defaultsManager];
  __int16 v53 = [v5 objectForKey:@"KnownPlaceIdentifiers"];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  SEL v52 = [v6 setWithObjects:v7, v8, v9, objc_opt_class(), nil];
  id v76 = 0;
  id v54 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v52 fromData:v53 error:&v76];
  id v49 = v76;
  int v10 = [(RTLearnedLocationEngine *)v63 defaultsManager];
  __int16 v51 = [v10 objectForKey:@"KnownPlaceIdentifiersLastUpdateDate"];

  BOOL v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = (objc_class *)objc_opt_class();
    int v13 = NSStringFromClass(v12);
    BOOL v14 = NSStringFromSelector(a2);
    uint64_t v15 = [v54 count];
    id v16 = [v51 stringFromDate];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2048;
    __int16 v78 = (uint64_t (*)(uint64_t, uint64_t))v15;
    LOWORD(v79) = 2112;
    *(void *)((char *)&v79 + 2) = v16;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, previous known place count, %lu, saved date, %@", buf, 0x2Au);
  }
  if ([v54 count])
  {
    uint64_t v55 = objc_opt_new();
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v54;
    uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v61)
    {
      uint64_t v60 = *(void *)v73;
      uint64_t v56 = *MEMORY[0x1E4F5CFE8];
      uint64_t v57 = *MEMORY[0x1E4F28568];
      while (2)
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v73 != v60) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          __int16 v19 = [obj objectForKey:v18];
          if ([v19 count])
          {
            dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
            *(void *)buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            __int16 v78 = __Block_byref_object_copy__36;
            *(void *)&long long v79 = __Block_byref_object_dispose__36;
            *((void *)&v79 + 1) = 0;
            uint64_t v21 = objc_opt_new();
            uint64_t v22 = [(RTLearnedLocationEngine *)v63 learnedLocationStore];
            id v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
            v66[0] = MEMORY[0x1E4F143A8];
            v66[1] = 3221225472;
            v66[2] = __83__RTLearnedLocationEngine__recoverKnownPlaceTypesWithPlaceTypeClassifier_outError___block_invoke;
            v66[3] = &unk_1E6B941D0;
            SEL v71 = a2;
            void v66[4] = v63;
            v66[5] = v18;
            id v62 = v19;
            id v67 = v62;
            long long v70 = buf;
            id v24 = v21;
            id v68 = v24;
            uint64_t v25 = v20;
            uint64_t v69 = v25;
            [v22 fetchPlacesWithIdentifiers:v23 handler:v66];

            __int16 v26 = v25;
            uint64_t v27 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v28 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v26, v28)) {
              goto LABEL_15;
            }
            id v29 = [MEMORY[0x1E4F1C9C8] now];
            [v29 timeIntervalSinceDate:v27];
            double v31 = v30;
            BOOL v32 = objc_opt_new();
            id v33 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
            id v34 = [MEMORY[0x1E4F29060] callStackSymbols];
            id v35 = [v34 filteredArrayUsingPredicate:v33];
            id v36 = [v35 firstObject];

            [v32 submitToCoreAnalytics:v36 type:1 duration:v31];
            id v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)id v82 = 0;
              _os_log_fault_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v82, 2u);
            }

            uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v81 = v57;
            *(void *)id v82 = @"semaphore wait timeout";
            __int16 v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:&v81 count:1];
            id v40 = [v38 errorWithDomain:v56 code:15 userInfo:v39];

            if (v40)
            {
              id v41 = v40;

              char v42 = 0;
            }
            else
            {
LABEL_15:
              id v41 = 0;
              char v42 = 1;
            }

            id v43 = v41;
            if ((v42 & 1) == 0) {
              objc_storeStrong((id *)(*(void *)&buf[8] + 40), v41);
            }
            uint64_t v44 = *(void **)(*(void *)&buf[8] + 40);
            if (v44)
            {
              if (a4) {
                *a4 = v44;
              }
            }
            else if ([v24 count])
            {
              [v55 addObjectsFromArray:v24];
            }

            _Block_object_dispose(buf, 8);
            if (v44)
            {

              BOOL v47 = 0;
              goto LABEL_38;
            }
          }
          else
          {
          }
        }
        uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }

    if ([v55 count])
    {
      id v65 = 0;
      [v50 updatePlaces:v55 error:&v65];
      id v45 = v65;
      uint64_t v46 = v45;
      if (a4) {
        *a4 = v45;
      }
      BOOL v47 = v46 == 0;
    }
    else
    {
      if (a4) {
        *a4 = 0;
      }
      BOOL v47 = 1;
    }
LABEL_38:
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    BOOL v47 = 1;
  }

  return v47;
}

void __83__RTLearnedLocationEngine__recoverKnownPlaceTypesWithPlaceTypeClassifier_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = NSStringFromSelector(*(SEL *)(a1 + 80));
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 48) count];
    int v13 = [*(id *)(a1 + 48) firstObject];
    *(_DWORD *)buf = 138413826;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = v11;
    __int16 v27 = 2048;
    uint64_t v28 = v12;
    __int16 v29 = 2112;
    double v30 = v13;
    __int16 v31 = 2048;
    uint64_t v32 = [v5 count];
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, place type, %@, identifier count, %lu, first identifier, %@, fetched place count, %lu, error, %@", buf, 0x48u);
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v6;
  id v16 = v6;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__RTLearnedLocationEngine__recoverKnownPlaceTypesWithPlaceTypeClassifier_outError___block_invoke_623;
  v17[3] = &unk_1E6B941A8;
  int8x16_t v18 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v20 = *(void *)(a1 + 80);
  id v19 = *(id *)(a1 + 56);
  [v5 enumerateObjectsUsingBlock:v17];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __83__RTLearnedLocationEngine__recoverKnownPlaceTypesWithPlaceTypeClassifier_outError___block_invoke_623(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [RTLearnedPlace alloc];
  id v6 = [v4 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) unsignedIntValue];
  uint64_t v8 = [v4 typeSource];
  uint64_t v9 = [v4 mapItem];
  int v10 = [v4 customLabel];
  uint64_t v11 = [v4 creationDate];
  uint64_t v12 = [v4 expirationDate];

  int v13 = [(RTLearnedPlace *)v5 initWithIdentifier:v6 type:v7 typeSource:v8 mapItem:v9 customLabel:v10 creationDate:v11 expirationDate:v12];
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138413058;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v17;
    __int16 v23 = 2048;
    uint64_t v24 = a3;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, idx, %lu, recovered place, %@", buf, 0x2Au);
  }
  if (v13) {
    [*(id *)(a1 + 48) addObject:v13];
  }
}

- (id)_getDailyTrainingMetrics
{
  v118[1] = *MEMORY[0x1E4F143B8];
  id v71 = (id)objc_opt_new();
  long long v70 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  id v2 = [(RTLearnedLocationEngine *)self learnedLocationStore];

  if (v2)
  {
    uint64_t v3 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v69 = [v3 predicateForVisitsFromEntryDate:v70 exitDate:v4];

    id v5 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    uint64_t v68 = [v5 predicateForObjectsFromCurrentDevice];

    id v6 = (void *)v68;
    if (v69 && v68)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
      v117[0] = v69;
      v117[1] = v68;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
      id v67 = [v7 andPredicateWithSubpredicates:v8];

      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      uint64_t v101 = 0;
      id v102 = &v101;
      uint64_t v103 = 0x3032000000;
      id v104 = __Block_byref_object_copy__36;
      id v105 = __Block_byref_object_dispose__36;
      id v106 = 0;
      uint64_t v95 = 0;
      id v96 = &v95;
      uint64_t v97 = 0x3032000000;
      id v98 = __Block_byref_object_copy__36;
      uint64_t v99 = __Block_byref_object_dispose__36;
      id v100 = 0;
      int v10 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __51__RTLearnedLocationEngine__getDailyTrainingMetrics__block_invoke;
      v91[3] = &unk_1E6B905F0;
      uint64_t v93 = &v95;
      uint64_t v94 = &v101;
      uint64_t v11 = v9;
      uint64_t v92 = v11;
      [v10 fetchVisitsWithPredicate:v67 handler:v91];

      uint64_t v12 = (id *)(v102 + 5);
      id v13 = (id)v102[5];
      dispatch_semaphore_t dsema = v11;
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v15 = dispatch_time(0, 3600000000000);
      intptr_t v16 = dispatch_semaphore_wait(dsema, v15);
      id v17 = (void *)MEMORY[0x1E4F28568];
      if (v16)
      {
        int8x16_t v18 = [MEMORY[0x1E4F1C9C8] now];
        [v18 timeIntervalSinceDate:v14];
        double v20 = v19;
        __int16 v21 = objc_opt_new();
        uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
        __int16 v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v24 = [v23 filteredArrayUsingPredicate:v22];
        __int16 v25 = [v24 firstObject];

        [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
        uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
        *(void *)id v107 = *v17;
        *(void *)buf = @"semaphore wait timeout";
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v107 count:1];
        __int16 v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

        if (v29)
        {
          id v13 = v29;
        }
      }

      objc_storeStrong(v12, v13);
      double v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v32 = [(id)v96[5] count];
        __int16 v33 = (uint64_t (*)(uint64_t, uint64_t))v102[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v32;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v114 = v33;
        _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, fetched %lu of learned visit entries in past day, error, %@", buf, 0x20u);
      }
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      uint64_t v114 = __Block_byref_object_copy__36;
      uint64_t v115 = __Block_byref_object_dispose__36;
      id v116 = 0;
      id v76 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id obj = (id)v96[5];
      uint64_t v34 = [obj countByEnumeratingWithState:&v87 objects:v112 count:16];
      if (v34)
      {
        uint64_t v75 = *(void *)v88;
        uint64_t v73 = *MEMORY[0x1E4F5CFE8];
        uint64_t v74 = *v17;
        do
        {
          uint64_t v79 = v34;
          for (uint64_t i = 0; i != v79; ++i)
          {
            if (*(void *)v88 != v75) {
              objc_enumerationMutation(obj);
            }
            uint64_t v36 = *(void *)(*((void *)&v87 + 1) + 8 * i);
            dispatch_semaphore_t v37 = dispatch_semaphore_create(0);

            uint64_t v38 = [(RTLearnedLocationEngine *)self learnedLocationStore];
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __51__RTLearnedLocationEngine__getDailyTrainingMetrics__block_invoke_625;
            v81[3] = &unk_1E6B941F8;
            id v39 = v76;
            id v85 = buf;
            SEL v86 = a2;
            id v82 = v39;
            uint64_t v83 = v36;
            id v40 = v37;
            long long v84 = v40;
            [v38 fetchPlaceOfVisit:v36 handler:v81];

            id v41 = (id *)(*(void *)&buf[8] + 40);
            id v42 = *(id *)(*(void *)&buf[8] + 40);
            dispatch_semaphore_t dsema = v40;
            id v43 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v44 = dispatch_time(0, 3600000000000);
            if (dispatch_semaphore_wait(dsema, v44))
            {
              id v45 = [MEMORY[0x1E4F1C9C8] now];
              [v45 timeIntervalSinceDate:v43];
              double v47 = v46;
              id v48 = objc_opt_new();
              id v49 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
              id v50 = [MEMORY[0x1E4F29060] callStackSymbols];
              __int16 v51 = [v50 filteredArrayUsingPredicate:v49];
              SEL v52 = [v51 firstObject];

              [v48 submitToCoreAnalytics:v52 type:1 duration:v47];
              __int16 v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)id v107 = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v107, 2u);
              }

              id v54 = (void *)MEMORY[0x1E4F28C58];
              v118[0] = v74;
              *(void *)id v107 = @"semaphore wait timeout";
              uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v118 count:1];
              uint64_t v56 = [v54 errorWithDomain:v73 code:15 userInfo:v55];

              if (v56)
              {
                id v42 = v56;
              }
            }

            objc_storeStrong(v41, v42);
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v87 objects:v112 count:16];
        }
        while (v34);
      }

      uint64_t v57 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v59 = [v76 count];
        uint64_t v60 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)id v107 = 138412802;
        *(void *)&v107[4] = v58;
        __int16 v108 = 2048;
        uint64_t v109 = v59;
        __int16 v110 = 2112;
        uint64_t v111 = v60;
        _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_INFO, "%@, fetched %lu of learned places in past day, error, %@", v107, 0x20u);
      }
      [v71 setObject:&unk_1F3453708 forKeyedSubscript:@"_intervalSinceLastAttempt"];
      uint64_t v61 = [NSNumber numberWithInt:[v96[5] count]];
      [v71 setObject:v61 forKeyedSubscript:@"_visitCountTrainingEvent"];

      id v62 = [NSNumber numberWithInt:[v76 count]];
      [v71 setObject:v62 forKeyedSubscript:@"_placeCountTrainingEvent"];

      id v63 = v71;
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v95, 8);
      _Block_object_dispose(&v101, 8);

      id v6 = (void *)v68;
    }
    else
    {
      id v65 = v71;
    }
  }
  else
  {
    id v64 = v71;
  }

  return v71;
}

void __51__RTLearnedLocationEngine__getDailyTrainingMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__RTLearnedLocationEngine__getDailyTrainingMetrics__block_invoke_625(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 identifier];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 identifier];
    [v8 addObject:v9];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v14 = 138413058;
    dispatch_time_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, fetched place, %@, visit, %@, error, %@", (uint8_t *)&v14, 0x2Au);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_submitDailyTrainingSessionCount
{
  id v2 = [(RTLearnedLocationEngine *)self dailyTrainingSessionCounter];
  [v2 submitMetrics];
}

- (void)_submitDailyTrainingMetrics
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [(RTLearnedLocationEngine *)self _getDailyTrainingMetrics];
  if ([v4 count])
  {
    id v5 = [NSString alloc];
    id v6 = [v5 initWithCString:RTAnalyticsEventTraining encoding:1];
    log_analytics_submission(v6, v4);
    uint64_t v7 = [NSString stringWithFormat:@"com.apple.%@", v6];
    AnalyticsSendEvent();
LABEL_5:

    goto LABEL_6;
  }
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, failure to submit daily notification metrics, training metrics not established", buf, 0xCu);
    goto LABEL_5;
  }
LABEL_6:

  [(RTLearnedLocationEngine *)self _submitDailyTrainingSessionCount];
}

- (void)_onDailyMetricsNotification:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  char v7 = [v6 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [v5 name];
      *(_DWORD *)buf = 138412802;
      id v31 = v26;
      __int16 v32 = 2080;
      __int16 v33 = "-[RTLearnedLocationEngine _onDailyMetricsNotification:]";
      __int16 v34 = 1024;
      int v35 = 5051;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v31 = v10;
    __int16 v32 = 2112;
    __int16 v33 = (const char *)v5;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, received notification, %@", buf, 0x16u);
  }
  id v11 = [v5 name];
  char v12 = [v11 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if (v12)
  {
    if ([(RTLearnedLocationEngine *)self _deferSubmittingLoiMetricsDueToNoTrainingSinceLastSubmission])
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_20:

        uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          __int16 v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          id v31 = v25;
          _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, perform daily transit analytics", buf, 0xCu);
        }
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __55__RTLearnedLocationEngine__onDailyMetricsNotification___block_invoke;
        v28[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
        v28[4] = a2;
        [(RTLearnedLocationEngine *)self performTransitAnalyticsWithHandler:v28];
        [(RTLearnedLocationEngine *)self _submitDailyTrainingMetrics];
        [(RTLearnedLocationEngine *)self _submitDailyVisitMetrics];
        [(RTLearnedLocationEngine *)self _submitPlaceTypeClassificationFeatureInputMetrics];
        goto LABEL_23;
      }
      NSStringFromSelector(a2);
      int v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v31 = (__CFString *)v14;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, skip submitting LOI metrics due to no training since last submission", buf, 0xCu);
    }
    else
    {
      __int16 v16 = [RTLocationOfInterestMetrics alloc];
      id v17 = [(RTLearnedLocationEngine *)self defaultsManager];
      __int16 v18 = [(RTLearnedLocationEngine *)self distanceCalculator];
      uint64_t v19 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      __int16 v20 = [(RTLearnedLocationEngine *)self locationStore];
      uint64_t v13 = [(RTLocationOfInterestMetrics *)v16 initWithDefaultsManager:v17 distanceCalculator:v18 learnedLocationStore:v19 locationStore:v20];

      id v29 = 0;
      int v21 = [v13 collectMetricsWithError:&v29];
      int v14 = (char *)v29;
      uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = @"NO";
        if (v21) {
          __int16 v23 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        id v31 = v23;
        __int16 v32 = 2112;
        __int16 v33 = v14;
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "LOI metrics submission, success, %@, error, %@", buf, 0x16u);
      }
    }
    goto LABEL_20;
  }
  dispatch_time_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = [v5 name];
    *(_DWORD *)buf = 138412290;
    id v31 = v27;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
  }
LABEL_23:
}

void __55__RTLearnedLocationEngine__onDailyMetricsNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    char v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, transit analytics completed, error, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __54__RTLearnedLocationEngine_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __54__RTLearnedLocationEngine_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDailyMetricsNotification:*(void *)(a1 + 40)];
}

- (void)setMonitorFingerprints:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_monitorFingerprints != a3)
  {
    self->_BOOL monitorFingerprints = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_monitorFingerprints) {
        id v5 = @"YES";
      }
      else {
        id v5 = @"NO";
      }
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "monitor fingerprints, %@", (uint8_t *)&v9, 0xCu);
    }

    BOOL monitorFingerprints = self->_monitorFingerprints;
    char v7 = [(RTLearnedLocationEngine *)self fingerprintManager];
    +[RTNotification notificationName];
    if (monitorFingerprints) {
      id v8 = {;
    }
      [v7 addObserver:self selector:sel_onFingerprintManagerNotification_ name:v8];
    }
    else {
      id v8 = {;
    }
      [v7 removeObserver:self fromNotification:v8];
    }
  }
}

- (void)_onFingerprintManagerNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = NSStringFromSelector(a2);
      uint64_t v10 = [v4 name];
      int v11 = 138412546;
      char v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)onFingerprintManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __60__RTLearnedLocationEngine_onFingerprintManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __60__RTLearnedLocationEngine_onFingerprintManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onFingerprintManagerNotification:*(void *)(a1 + 40)];
}

- (BOOL)_momentsdOnBoarding
{
  CFBooleanRef v2 = (const __CFBoolean *)CFPreferencesCopyValue(@"MOSensedEventCombinedSwitchLocation", @"com.apple.momentsd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v2) {
    LOBYTE(v2) = CFBooleanGetValue(v2) != 0;
  }
  return (char)v2;
}

- (BOOL)_enableTrainOnBatteryForTripSegments
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(RTLearnedLocationEngine *)self defaultsManager];
  id v4 = [v3 objectForKey:@"RTDefaultsTripSegmentGenerationEnabled"];

  if (v4) {
    int v5 = [v4 BOOLValue];
  }
  else {
    int v5 = 0;
  }
  id v6 = [(RTLearnedLocationEngine *)self defaultsManager];
  char v7 = [v6 objectForKey:@"RTDefaultsTripSegmentEnableTrainOnBattery"];

  if (v7) {
    int v8 = [v7 BOOLValue];
  }
  else {
    int v8 = 0;
  }
  int v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109376;
    v11[1] = v5;
    __int16 v12 = 1024;
    int v13 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "LearnedLocationEngine:_enableTrainOnBatteryForTripSegments, tripSegmentGenerationIsEnabled, %d, tripSegmentEnableTrainOnBattery, %d.", (uint8_t *)v11, 0xEu);
  }

  return v5 & v8;
}

- (void)_onVisitManagerNotification:(id)a3
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  char v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = v5;
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = NSStringFromSelector(a2);
      __int16 v12 = [v9 visitIncident];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, lowConfidenceVisit, %@", buf, 0x16u);
    }
    int v13 = [v9 visitIncident];
    [(RTLearnedLocationEngine *)self _updateMonitorFingerprintsWithVisit:v13];
  }
  else
  {
    uint64_t v14 = [v5 name];
    uint64_t v15 = +[RTNotification notificationName];
    int v16 = [v14 isEqualToString:v15];

    if (v16)
    {
      id v17 = v5;
      __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = NSStringFromSelector(a2);
        __int16 v20 = [v17 visitIncident];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, leechedVisit, %@", buf, 0x16u);
      }
      int v21 = [v17 visitIncident];
      [(RTLearnedLocationEngine *)self _updateMonitorFingerprintsWithVisit:v21];

      uint64_t v22 = [(RTLearnedLocationEngine *)self defaultsManager];
      __int16 v23 = [v22 objectForKey:@"DisableXPCActivityForTrainOnBattery"];
      if (v23)
      {
        uint64_t v24 = [(RTLearnedLocationEngine *)self defaultsManager];
        __int16 v25 = [v24 objectForKey:@"DisableXPCActivityForTrainOnBattery"];
        int v26 = [v25 BOOLValue];

        int v27 = v26 ^ 1;
      }
      else
      {
        int v27 = 1;
      }

      BOOL v53 = [(RTLearnedLocationEngine *)self _momentsdOnBoarding];
      BOOL v54 = [(RTLearnedLocationEngine *)self _enableTrainOnBatteryForTripSegments];
      uint64_t v55 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v81 = NSStringFromSelector(a2);
        if (v53) {
          id v67 = @"YES";
        }
        else {
          id v67 = @"NO";
        }
        if (v54) {
          uint64_t v68 = @"YES";
        }
        else {
          uint64_t v68 = @"NO";
        }
        __int16 v78 = (uint64_t (*)(uint64_t, uint64_t))v68;
        uint64_t v79 = v67;
        if (v27) {
          uint64_t v69 = @"NO";
        }
        else {
          uint64_t v69 = @"YES";
        }
        id v77 = v69;
        id v82 = [(RTLearnedLocationEngine *)self platform];
        int v70 = [v82 iPhoneDevice];
        id v71 = @"NO";
        if (v70) {
          id v71 = @"YES";
        }
        long long v80 = [v17 visitIncident:v71];
        long long v72 = [v80 exit];
        uint64_t v73 = @"NO";
        if (v72) {
          uint64_t v73 = @"YES";
        }
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v81;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v79;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v95 = v78;
        *(_WORD *)id v96 = 2112;
        *(void *)&v96[2] = v77;
        *(_WORD *)&v96[10] = 2112;
        *(void *)&v96[12] = v76;
        __int16 v97 = 2112;
        id v98 = v73;
        _os_log_debug_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_DEBUG, "%@, momentsdOnBoarding, %@, enableForTripSegments, %@, disableXPCActivityForTrainOnBattery, %@, iPhoneDevice, %@, exit, %@", buf, 0x3Eu);
      }
      if (v27)
      {
        if (v53)
        {
          uint64_t v56 = [(RTLearnedLocationEngine *)self platform];
          if ([v56 iPhoneDevice])
          {
            uint64_t v57 = [v17 visitIncident];
            id v58 = [v57 exit];
            BOOL v59 = v58 == 0;

            if (!v59) {
              [(RTLearnedLocationEngine *)self setRegisterTrainOnBattery:1];
            }
          }
          else
          {
          }
        }
        if (v54)
        {
          id v63 = [(RTLearnedLocationEngine *)self platform];
          if ([v63 iPhoneDevice])
          {
            id v64 = [v17 visitIncident];
            id v65 = [v64 entry];
            BOOL v66 = v65 == 0;

            if (!v66) {
              [(RTLearnedLocationEngine *)self setRegisterTrainOnBattery:1];
            }
          }
          else
          {
          }
        }
      }
    }
    else
    {
      uint64_t v28 = [v5 name];
      id v29 = +[RTNotification notificationName];
      int v30 = [v28 isEqualToString:v29];

      if (v30)
      {
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        uint64_t v95 = __Block_byref_object_copy__36;
        *(void *)id v96 = __Block_byref_object_dispose__36;
        *(void *)&v96[8] = 0;
        uint64_t v87 = 0;
        long long v88 = (id *)&v87;
        uint64_t v89 = 0x3032000000;
        long long v90 = __Block_byref_object_copy__36;
        SEL v91 = __Block_byref_object_dispose__36;
        id v92 = 0;
        dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __55__RTLearnedLocationEngine__onVisitManagerNotification___block_invoke;
        v83[3] = &unk_1E6B91B58;
        id v85 = &v87;
        SEL v86 = buf;
        __int16 v32 = v31;
        long long v84 = v32;
        [(RTLearnedLocationEngine *)self _fetchLatestVisitWithHandler:v83];
        __int16 v33 = v32;
        __int16 v34 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v35 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v33, v35)) {
          goto LABEL_26;
        }
        uint64_t v36 = [MEMORY[0x1E4F1C9C8] now];
        [v36 timeIntervalSinceDate:v34];
        double v38 = v37;
        id v39 = objc_opt_new();
        id v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
        id v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v42 = [v41 filteredArrayUsingPredicate:v40];
        id v43 = [v42 firstObject];

        [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
        dispatch_time_t v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v93 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v93, 2u);
        }

        id v45 = (void *)MEMORY[0x1E4F28C58];
        v99[0] = *MEMORY[0x1E4F28568];
        *(void *)uint64_t v93 = @"semaphore wait timeout";
        double v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v99 count:1];
        double v47 = [v45 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v46];

        if (v47)
        {
          id v48 = v47;

          char v49 = 0;
        }
        else
        {
LABEL_26:
          id v48 = 0;
          char v49 = 1;
        }

        id v60 = v48;
        if ((v49 & 1) == 0) {
          objc_storeStrong(v88 + 5, v48);
        }
        if (v88[5])
        {
          uint64_t v61 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            id v74 = v88[5];
            *(_DWORD *)uint64_t v93 = 138412290;
            *(void *)&void v93[4] = v74;
            _os_log_error_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_ERROR, "When trying to fetch the last visit at start-up, got error %@", v93, 0xCu);
          }
        }
        else
        {
          id v62 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v75 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v93 = 138412290;
            *(void *)&void v93[4] = v75;
            _os_log_debug_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_DEBUG, "Start up LLE with last visit %@", v93, 0xCu);
          }

          [(RTLearnedLocationEngine *)self _updateMonitorFingerprintsWithVisit:*(void *)(*(void *)&buf[8] + 40)];
        }

        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v50 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          __int16 v51 = NSStringFromSelector(a2);
          SEL v52 = [v5 name];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v51;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v52;
          _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", buf, 0x16u);
        }
      }
    }
  }
}

void __55__RTLearnedLocationEngine__onVisitManagerNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_updateMonitorFingerprintsWithVisit:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 type] != 1 && objc_msgSend(v5, "type") != 2)
  {
    int v13 = self;
    uint64_t v14 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = [v5 placeInference];
  char v7 = [v6 mapItem];

  if (v7)
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    id v8 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    id v9 = [v5 placeInference];
    uint64_t v10 = [v9 mapItem];
    id v19 = 0;
    char v11 = [v8 placeTypeForMapItem:v10 placeType:&v21 placeTypeSource:&v20 error:&v19];
    id v12 = v19;

    if (v11)
    {
      if (!v21)
      {

        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = NSStringFromSelector(a2);
        id v17 = [v5 placeInference];
        __int16 v18 = [v17 mapItem];
        *(_DWORD *)buf = 138412802;
        __int16 v23 = v16;
        __int16 v24 = 2112;
        __int16 v25 = v18;
        __int16 v26 = 2112;
        id v27 = v12;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, failed to fetch placeType for mapItem, %@, error, %@", buf, 0x20u);
      }
    }
    [(RTLearnedLocationEngine *)self setMonitorFingerprints:0];

    goto LABEL_14;
  }
LABEL_7:
  int v13 = self;
  uint64_t v14 = 1;
LABEL_9:
  [(RTLearnedLocationEngine *)v13 setMonitorFingerprints:v14];
LABEL_14:
}

- (void)onVisitManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationEngine *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __54__RTLearnedLocationEngine_onVisitManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __54__RTLearnedLocationEngine_onVisitManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVisitManagerNotification:*(void *)(a1 + 40)];
}

+ (int64_t)periodicPurgePolicy
{
  return 3;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  char v11 = [(RTLearnedLocationEngine *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E6B908B8;
  id v16 = v10;
  int64_t v17 = a3;
  block[4] = self;
  id v15 = v9;
  SEL v18 = a2;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);
}

void __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) willBeginTraining];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_2;
  v31[3] = &unk_1E6B92690;
  void v31[4] = *(void *)(a1 + 32);
  id v32 = *(id *)(a1 + 48);
  uint64_t v2 = MEMORY[0x1E016DB00](v31);
  id v3 = (void (**)(void, void))v2;
  uint64_t v4 = *(void *)(a1 + 56);
  switch(v4)
  {
    case 0:
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v27 = 0;
      [v8 _purgeWithReferenceDate:v9 error:&v27];
      id v7 = v27;
      ((void (**)(void, id))v3)[2](v3, v7);
      goto LABEL_13;
    case 3:
      id v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:@"RefreshMapItems"];
      if ([v10 BOOLValue])
      {
        char v11 = NSString;
        id v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 64));
        id v15 = [v11 stringWithFormat:@"%@-%@", v13, v14];
        [v15 UTF8String];
        id v16 = (void *)os_transaction_create();

        int64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = (objc_class *)objc_opt_class();
          __int16 v23 = NSStringFromClass(v22);
          __int16 v24 = NSStringFromSelector(*(SEL *)(a1 + 64));
          *(_DWORD *)buf = 138412546;
          __int16 v34 = v23;
          __int16 v35 = 2112;
          uint64_t v36 = v24;
          _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
        }
        id v18 = *(id *)(*(void *)(a1 + 32) + 144);
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void **)(v19 + 104);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_667;
        v25[3] = &unk_1E6B94248;
        void v25[4] = v19;
        id v26 = v18;
        id v21 = v18;
        id v7 = [v20 refreshMapItemsWithEnumerationBlock:v25];
      }
      else
      {
        id v7 = 0;
      }
      ((void (**)(void, id))v3)[2](v3, v7);

      goto LABEL_13;
    case 1:
      id v5 = [MEMORY[0x1E4F1C9C8] date];
      id v6 = [*(id *)(a1 + 32) learnedLocationStore];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_3;
      v28[3] = &unk_1E6B94220;
      v28[4] = *(void *)(a1 + 32);
      id v29 = v5;
      int v30 = v3;
      id v7 = v5;
      [v6 clearWithHandler:v28];

LABEL_13:
      goto LABEL_14;
  }
  (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
LABEL_14:
}

void __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) didFinishTraining];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_4;
  v8[3] = &unk_1E6B91490;
  id v9 = v3;
  id v5 = a1[5];
  id v6 = a1[4];
  id v10 = v5;
  id v11 = v6;
  id v12 = a1[6];
  id v7 = v3;
  dispatch_async(v4, v8);
}

uint64_t __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "cleared learned locations, error, %@, latency, %.2f", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 48) didClear];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

id __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_667(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v46 = 0;
  double v47 = &v46;
  uint64_t v48 = 0x3032000000;
  char v49 = __Block_byref_object_copy__36;
  id v50 = __Block_byref_object_dispose__36;
  id v51 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__36;
  dispatch_time_t v44 = __Block_byref_object_dispose__36;
  id v45 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = objc_alloc(MEMORY[0x1E4F5CE48]);
  id v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  uint64_t v8 = (void *)[v5 initWithUseBackgroundTraits:1 analyticsIdentifier:v7];

  __int16 v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v3 geoMapItemHandle];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  __int16 v35 = __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_2_668;
  uint64_t v36 = &unk_1E6B920F0;
  double v38 = &v46;
  id v39 = &v40;
  uint64_t v11 = v4;
  uint64_t v37 = v11;
  [v9 fetchMapItemFromHandle:v10 options:v8 handler:&v33];

  id v12 = v11;
  id v13 = [MEMORY[0x1E4F1C9C8] now:v33, v34, v35, v36];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_6;
  }
  id v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  id v18 = objc_opt_new();
  uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v21 = [v20 filteredArrayUsingPredicate:v19];
  uint64_t v22 = [v21 firstObject];

  [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  __int16 v24 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v53 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v53 count:1];
  id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;
  }
  else
  {
LABEL_6:
    id v27 = 0;
  }

  id v28 = v27;
  uint64_t v29 = v41[5];
  if (v29 && !v47[5])
  {
    v52[0] = @"source";
    v52[1] = @"extendedAttributes";
    dispatch_semaphore_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    id v30 = [v3 mergeWithMapItem:v29 preservingProperties:v31];
  }
  else
  {
    id v30 = v3;
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v30;
}

void __71__RTLearnedLocationEngine_performPurgeOfType_referenceDate_completion___block_invoke_2_668(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setupTrainingMetricsFromDate:(id)a3 toDate:(id)a4 mode:(unint64_t)a5 reason:(unint64_t)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v46 = a4;
  id v8 = objc_opt_new();
  [(RTLearnedLocationEngine *)self setTrainingMetrics:v8];

  id v9 = [(RTLearnedLocationEngine *)self defaultsManager];
  uint64_t v10 = [v9 objectForKey:@"LearnedLocationEngineTrainVisitsLastAttemptDate"];

  if (v10)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;
  }
  else
  {
    double v12 = INFINITY;
  }
  id v13 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [v13 setIntervalSinceLastAttempt:v12];

  if (v10) {
  uint64_t v55 = 0;
  }
  uint64_t v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  uint64_t v51 = 0;
  SEL v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0x7FF0000000000000;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  id v15 = [RTLocationStoreMetricOptions alloc];
  double v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v45 endDate:v46];
  dispatch_time_t v44 = [(RTLocationStoreMetricOptions *)v15 initWithDateInterval:v16 uncertaintyThreshold:1.79769313e308];

  double v17 = [(RTLearnedLocationEngine *)self locationStore];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  void v47[2] = __76__RTLearnedLocationEngine__setupTrainingMetricsFromDate_toDate_mode_reason___block_invoke;
  v47[3] = &unk_1E6B94270;
  char v49 = &v55;
  id v50 = &v51;
  id v18 = v14;
  uint64_t v48 = v18;
  [v17 fetchMetricsWithOptions:v44 handler:v47];

  uint64_t v19 = v18;
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v21 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v19, v21)) {
    goto LABEL_11;
  }
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
  [v22 timeIntervalSinceDate:v20];
  double v24 = v23;
  __int16 v25 = objc_opt_new();
  id v26 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  id v27 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v28 = [v27 filteredArrayUsingPredicate:v26];
  uint64_t v29 = [v28 firstObject];

  [v25 submitToCoreAnalytics:v29 type:1 duration:v24];
  id v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  dispatch_semaphore_t v31 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v59 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v59 count:1];
  uint64_t v33 = [v31 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v32];

  if (v33)
  {
    id v34 = v33;
  }
  else
  {
LABEL_11:
    id v34 = 0;
  }

  id v35 = v34;
  uint64_t v36 = v56[3];
  uint64_t v37 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [v37 setLocationsProcessed:v36];

  double v38 = v52[3];
  id v39 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [v39 setMaxIntervalBetweenLocations:v38];

  uint64_t v40 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [v40 setMode:a5];

  id v41 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [v41 setReason:a6];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
}

intptr_t __76__RTLearnedLocationEngine__setupTrainingMetricsFromDate_toDate_mode_reason___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = [v3 count];
  [v3 maxIntervalBetweenLocations];
  uint64_t v5 = v4;

  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
  uint64_t v6 = a1[4];

  return dispatch_semaphore_signal(v6);
}

- (void)_teardownTrainingMetrics
{
  v30[1] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke;
  v27[3] = &unk_1E6B94298;
  void v27[4] = self;
  uint64_t v5 = v3;
  id v28 = v5;
  [v4 fetchMetricsWithHandler:v27];

  uint64_t v6 = v5;
  int v7 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v8 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    id v9 = [MEMORY[0x1E4F1C9C8] now];
    [v9 timeIntervalSinceDate:v7];
    double v11 = v10;
    double v12 = objc_opt_new();
    id v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    dispatch_semaphore_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v15 = [v14 filteredArrayUsingPredicate:v13];
    double v16 = [v15 firstObject];

    [v12 submitToCoreAnalytics:v16 type:1 duration:v11];
    double v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    v30[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v30 count:1];
    dispatch_time_t v21 = [v18 errorWithDomain:v19 code:15 userInfo:v20];

    if (v21) {
  }
    }

  uint64_t v22 = [(RTLearnedLocationEngine *)self trainingMetrics];
  [(RTLearnedLocationEngine *)self setTrainingMetrics:0];
  if (v22)
  {
    double v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "submitting metrics, %@", buf, 0xCu);
    }

    double v24 = [(RTLearnedLocationEngine *)self metricManager];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_680;
    v25[3] = &unk_1E6B91350;
    void v25[4] = self;
    id v26 = v22;
    [v24 fetchDiagnosticsEnabled:v25];
  }
}

intptr_t __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 visitCountDevice];
  uint64_t v5 = [*(id *)(a1 + 32) trainingMetrics];
  [v5 setVisitCountDevice:v4];

  uint64_t v6 = [v3 visitCountTotal];
  int v7 = [*(id *)(a1 + 32) trainingMetrics];
  [v7 setVisitCountTotal:v6];

  uint64_t v8 = [v3 placeCountDevice];
  id v9 = [*(id *)(a1 + 32) trainingMetrics];
  [v9 setPlaceCountDevice:v8];

  uint64_t v10 = [v3 placeCountTotal];
  double v11 = [*(id *)(a1 + 32) trainingMetrics];
  [v11 setPlaceCountTotal:v10];

  double v12 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v12);
}

void __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_680(uint64_t a1, char a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_2;
  block[3] = &unk_1E6B91328;
  char v10 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, block);
}

void __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4FB8CA8]) initWithLearnedLocationEngineMetrics:*(void *)(a1 + 32)];
    id v3 = [*(id *)(a1 + 40) metricManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_3;
    v7[3] = &unk_1E6B90840;
    id v8 = v2;
    id v4 = v2;
    [v3 submitMetric:v4 withHandler:v7];

    id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Submitting Learned Location Engine Training CoreAnalytics Metrics", v6, 2u);
    }

    [*(id *)(a1 + 32) submitToCoreAnalytics];
  }
}

void __51__RTLearnedLocationEngine__teardownTrainingMetrics__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "submitted metrics, %@, error, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_logCloudStoreWithReason:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __52__RTLearnedLocationEngine__logCloudStoreWithReason___block_invoke;
  v25[3] = &unk_1E6B90CB8;
  SEL v27 = a2;
  __int16 v8 = v6;
  id v26 = v8;
  [v7 logCloudStoreWithReason:v5 handler:v25];

  id v9 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    double v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSinceDate:v10];
    double v14 = v13;
    id v15 = objc_opt_new();
    double v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    double v17 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v18 = [v17 filteredArrayUsingPredicate:v16];
    uint64_t v19 = [v18 firstObject];

    [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    dispatch_time_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F5CFE8];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v28 count:1];
    double v24 = [v21 errorWithDomain:v22 code:15 userInfo:v23];

    if (v24) {
  }
    }
}

void __52__RTLearnedLocationEngine__logCloudStoreWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to log cloud stores, %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_logLocalStoreWithReason:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __52__RTLearnedLocationEngine__logLocalStoreWithReason___block_invoke;
  v25[3] = &unk_1E6B90CB8;
  SEL v27 = a2;
  __int16 v8 = v6;
  id v26 = v8;
  [v7 logLocalStoreWithReason:v5 handler:v25];

  id v9 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    double v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSinceDate:v10];
    double v14 = v13;
    id v15 = objc_opt_new();
    double v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    double v17 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v18 = [v17 filteredArrayUsingPredicate:v16];
    uint64_t v19 = [v18 firstObject];

    [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    dispatch_time_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F5CFE8];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v28 count:1];
    double v24 = [v21 errorWithDomain:v22 code:15 userInfo:v23];

    if (v24) {
  }
    }
}

void __52__RTLearnedLocationEngine__logLocalStoreWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to log local stores, %@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_logDatabasesWithReason:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "start logging databases with reason, %@", (uint8_t *)&v7, 0xCu);
  }

  [(RTLearnedLocationEngine *)self _logCloudStoreWithReason:0];
  [(RTLearnedLocationEngine *)self _logLocalStoreWithReason:0];
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "end logging databases with reason, %@", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)_retrainVisitsWithoutPlaces:(id *)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  id v65 = __Block_byref_object_copy__36;
  BOOL v66 = __Block_byref_object_dispose__36;
  id v67 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v50 = self;
  int v7 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __55__RTLearnedLocationEngine__retrainVisitsWithoutPlaces___block_invoke;
  v57[3] = &unk_1E6B942C0;
  SEL v61 = a2;
  id v8 = v5;
  id v58 = v8;
  id v60 = &v62;
  uint64_t v9 = v6;
  uint64_t v59 = v9;
  [v7 fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:v57 limit:0];

  uint64_t v10 = v9;
  dispatch_time_t v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_6;
  }
  double v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  double v16 = objc_opt_new();
  double v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
  id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v19 = [v18 filteredArrayUsingPredicate:v17];
  uint64_t v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  dispatch_time_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
  *(void *)uint64_t v75 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v75 count:1];
  double v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;
  }
  else
  {
LABEL_6:
    id v25 = 0;
  }

  id v26 = v25;
  SEL v27 = (void *)v63[5];
  if (v27)
  {
    BOOL v28 = 0;
    if (a3) {
      *a3 = v27;
    }
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v69 = buf;
    uint64_t v70 = 0x3032000000;
    id v71 = __Block_byref_object_copy__36;
    long long v72 = __Block_byref_object_dispose__36;
    id v73 = 0;

    dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
    uint64_t v30 = [(RTLearnedLocationEngine *)v50 learnedLocationStore];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    void v52[2] = __55__RTLearnedLocationEngine__retrainVisitsWithoutPlaces___block_invoke_682;
    v52[3] = &unk_1E6B942C0;
    SEL v56 = a2;
    id v31 = v8;
    id v53 = v31;
    uint64_t v55 = buf;
    id v32 = v29;
    uint64_t v54 = v32;
    [v30 fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:v52];

    uint64_t v10 = v32;
    uint64_t v33 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v34 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v10, v34)) {
      goto LABEL_16;
    }
    id v35 = [MEMORY[0x1E4F1C9C8] now];
    [v35 timeIntervalSinceDate:v33];
    double v37 = v36;
    double v38 = objc_opt_new();
    id v39 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v41 = [v40 filteredArrayUsingPredicate:v39];
    uint64_t v42 = [v41 firstObject];

    [v38 submitToCoreAnalytics:v42 type:1 duration:v37];
    id v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v75 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v75, 2u);
    }

    dispatch_time_t v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    *(void *)uint64_t v75 = @"semaphore wait timeout";
    id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
    id v46 = [v44 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v45];

    if (v46)
    {
      id v47 = v46;
    }
    else
    {
LABEL_16:
      id v47 = 0;
    }

    id v26 = v47;
    uint64_t v48 = (void *)*((void *)v69 + 5);
    BOOL v28 = v48 == 0;
    if (v48)
    {
      if (a3) {
        *a3 = v48;
      }
    }
    else
    {
      [(RTLearnedLocationEngine *)v50 _updateUnlabeledVisitsWithPlaceInformation:v31];
    }

    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v62, 8);
  return v28;
}

void __55__RTLearnedLocationEngine__retrainVisitsWithoutPlaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v12 = 138412546;
    double v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = [v5 count];
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %lu visits without places", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(a1 + 32) addObjectsFromArray:v5];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__RTLearnedLocationEngine__retrainVisitsWithoutPlaces___block_invoke_682(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v12 = 138412546;
    double v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = [v5 count];
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %lu visits with incomplete places", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(a1 + 32) addObjectsFromArray:v5];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_removeUnusedMapItems:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  dispatch_semaphore_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__36;
  id v32 = __Block_byref_object_dispose__36;
  id v33 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __49__RTLearnedLocationEngine__removeUnusedMapItems___block_invoke;
  v25[3] = &unk_1E6B90728;
  SEL v27 = &v28;
  int v7 = v5;
  id v26 = v7;
  [v6 removeUnreferencedMapItems:v25];

  id v8 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v8, v10))
  {
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    [v11 timeIntervalSinceDate:v9];
    double v13 = v12;
    __int16 v14 = objc_opt_new();
    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v17 = [v16 filteredArrayUsingPredicate:v15];
    id v18 = [v17 firstObject];

    [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    dispatch_time_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v34 count:1];
    uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

    if (v22) {
  }
    }

  double v23 = (void *)v29[5];
  if (a3 && v23) {
    *a3 = v23;
  }

  _Block_object_dispose(&v28, 8);
  return v23 == 0;
}

void __49__RTLearnedLocationEngine__removeUnusedMapItems___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_appendVisitsToLocationsOfInterestModelWithError:(id *)a3
{
  v110[1] = *MEMORY[0x1E4F143B8];
  uint64_t v89 = 0;
  long long v90 = &v89;
  uint64_t v91 = 0x3032000000;
  id v92 = __Block_byref_object_copy__36;
  uint64_t v93 = __Block_byref_object_dispose__36;
  id v94 = 0;
  uint64_t v83 = 0;
  long long v84 = &v83;
  uint64_t v85 = 0x3032000000;
  SEL v86 = __Block_byref_object_copy__36;
  uint64_t v87 = __Block_byref_object_dispose__36;
  id v88 = 0;
  uint64_t v77 = 0;
  __int16 v78 = (id *)&v77;
  uint64_t v79 = 0x3032000000;
  long long v80 = __Block_byref_object_copy__36;
  uint64_t v81 = __Block_byref_object_dispose__36;
  id v82 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v5 = [(RTLearnedLocationEngine *)self learnedLocationStore];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke;
  v71[3] = &unk_1E6B942E8;
  uint64_t v74 = &v89;
  uint64_t v75 = &v77;
  id v6 = v4;
  long long v72 = v6;
  id v73 = self;
  uint64_t v76 = &v83;
  [v5 fetchLocationOfInterestVisitedLastWithHandler:v71];

  int v7 = v6;
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    dispatch_time_t v10 = [MEMORY[0x1E4F1C9C8] now];
    [v10 timeIntervalSinceDate:v8];
    double v12 = v11;
    double v13 = objc_opt_new();
    __int16 v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v16 = [v15 filteredArrayUsingPredicate:v14];
    double v17 = [v16 firstObject];

    [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v104 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v104 count:1];
    id v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

    if (v21)
    {
      id v21 = v21;

      char v22 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v21 = 0;
  }
  char v22 = 1;
LABEL_8:

  id v23 = v21;
  if ((v22 & 1) == 0) {
    objc_storeStrong(v78 + 5, v21);
  }
  double v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = NSStringFromSelector(a2);
    uint64_t v26 = v90[5];
    SEL v27 = (void *)v84[5];
    id v28 = v78[5];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v25;
    __int16 v96 = 2112;
    uint64_t v97 = v26;
    __int16 v98 = 2112;
    uint64_t v99 = v27;
    __int16 v100 = 2112;
    uint64_t v101 = v28;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, LOI graph, last visit, %@, last transition, %@, error, %@", buf, 0x2Au);
  }
  id v29 = v78[5];
  if (v29)
  {
    BOOL v30 = 0;
    if (a3) {
      *a3 = v29;
    }
  }
  else
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v32 = [(id)v90[5] exitDate];
    id v33 = v32;
    if (!v32)
    {
      id v33 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    uint64_t v34 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v64 = (void *)[v31 initWithStartDate:v33 endDate:v34];

    if (!v32) {
    dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
    }

    uint64_t v104 = 0;
    id v105 = &v104;
    uint64_t v106 = 0x3032000000;
    id v107 = __Block_byref_object_copy__36;
    __int16 v108 = __Block_byref_object_dispose__36;
    id v109 = 0;
    uint64_t v36 = [(RTLearnedLocationEngine *)self learnedLocationStore];
    double v37 = [(RTLearnedLocationStore *)self->_learnedLocationStore predicateForObjectsFromCurrentDevice];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke_684;
    v67[3] = &unk_1E6B905F0;
    uint64_t v69 = &v77;
    uint64_t v70 = &v104;
    double v38 = v35;
    uint64_t v68 = v38;
    [v36 fetchVisitsWithPredicate:v37 ascending:1 dateInterval:v64 limit:0 handler:v67];

    int v7 = v38;
    id v39 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v40 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v7, v40)) {
      goto LABEL_25;
    }
    id v41 = [MEMORY[0x1E4F1C9C8] now];
    [v41 timeIntervalSinceDate:v39];
    double v43 = v42;
    dispatch_time_t v44 = objc_opt_new();
    id v45 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1080];
    id v46 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v47 = [v46 filteredArrayUsingPredicate:v45];
    uint64_t v48 = [v47 firstObject];

    [v44 submitToCoreAnalytics:v48 type:1 duration:v43];
    char v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v50 = (void *)MEMORY[0x1E4F28C58];
    v110[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v110 count:1];
    SEL v52 = [v50 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v51];

    if (v52)
    {
      id v53 = v52;

      char v54 = 0;
    }
    else
    {
LABEL_25:
      char v54 = 1;
      id v53 = v23;
    }

    id v55 = v53;
    if ((v54 & 1) == 0) {
      objc_storeStrong(v78 + 5, v53);
    }
    SEL v56 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v57 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v58 = [(id)v105[5] count];
      uint64_t v59 = [(id)v105[5] firstObject];
      id v60 = [(id)v105[5] lastObject];
      id v61 = v78[5];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v57;
      __int16 v96 = 2048;
      uint64_t v97 = v58;
      __int16 v98 = 2112;
      uint64_t v99 = v59;
      __int16 v100 = 2112;
      uint64_t v101 = v60;
      __int16 v102 = 2112;
      id v103 = v61;
      _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "%@, new visit count, %lu, first visit, %@, last visit, %@, error, %@", buf, 0x34u);
    }
    id v62 = v78[5];
    if (v62)
    {
      BOOL v30 = 0;
      if (a3) {
        *a3 = v62;
      }
    }
    else if ([(id)v105[5] count])
    {
      BOOL v30 = [(RTLearnedLocationEngine *)self _appendVisits:v105[5] lastVisit:v90[5] lastTransition:v84[5] outError:a3];
    }
    else
    {
      BOOL v30 = 1;
    }

    _Block_object_dispose(&v104, 8);
    id v23 = v55;
  }

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);
  return v30;
}

void __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  int v7 = [a2 visits];
  uint64_t v8 = [v7 lastObject];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    double v11 = [*(id *)(a1 + 40) learnedLocationStore];
    double v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v13[2] = __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke_2;
    v13[3] = &unk_1E6B93F00;
    long long v15 = *(_OWORD *)(a1 + 56);
    id v14 = *(id *)(a1 + 32);
    [v11 fetchTransitionWithOriginIdentifier:v12 handler:v13];

    goto LABEL_6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_6:
}

void __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __76__RTLearnedLocationEngine__appendVisitsToLocationsOfInterestModelWithError___block_invoke_684(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = a3;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_appendVisits:(id)a3 lastVisit:(id)a4 lastTransition:(id)a5 outError:(id *)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v44 = a4;
  id v43 = a5;
  if ([v10 count])
  {
    aSelector = a2;
    double v42 = objc_opt_new();
    id v39 = objc_opt_new();
    double v38 = objc_opt_new();
    id v41 = objc_opt_new();
    dispatch_time_t v40 = objc_opt_new();
    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x3032000000;
    id v71 = __Block_byref_object_copy__36;
    long long v72 = __Block_byref_object_dispose__36;
    id v73 = 0;
    double v11 = dispatch_group_create();
    for (unint64_t i = 0; i < [v10 count]; ++i)
    {
      double v13 = [v10 objectAtIndexedSubscript:i];
      dispatch_group_enter(v11);
      id v14 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      long long v15 = [v13 identifier];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke;
      void v60[3] = &unk_1E6B94310;
      BOOL v66 = &v68;
      unint64_t v67 = i;
      id v61 = v44;
      id v62 = v43;
      id v16 = v13;
      id v63 = v16;
      id v64 = v42;
      double v17 = v11;
      id v65 = v17;
      [v14 fetchTransitionWithDestinationIdentifier:v15 handler:v60];

      dispatch_group_enter(v17);
      id v18 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_2;
      v51[3] = &unk_1E6B94360;
      uint64_t v59 = &v68;
      SEL v52 = v17;
      id v53 = v39;
      id v19 = v16;
      id v54 = v19;
      id v55 = self;
      id v56 = v38;
      id v57 = v41;
      id v58 = v40;
      [v18 fetchPlaceOfVisit:v19 handler:v51];
    }
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v20 = (void *)v69[5];
    if (v20)
    {
      BOOL v21 = 0;
      if (a6) {
        *a6 = v20;
      }
    }
    else
    {
      char v22 = [(RTLearnedLocationEngine *)self _updateLocationOfInterestsWithVisits:v41 visitToTransitionMapping:v42 visitToLocationOfInterestMapping:v38];
      id v23 = [(RTLearnedLocationEngine *)self _createLocationOfInterestsWithVisits:v40 visitToTransitionMapping:v42 visitToPlaceMapping:v39];
      double v24 = dispatch_group_create();
      dispatch_group_enter(v24);
      id v25 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_4;
      v48[3] = &unk_1E6B90728;
      id v50 = &v68;
      uint64_t v26 = v24;
      char v49 = v26;
      [v25 updateLocationsOfInterest:v22 handler:v48];

      dispatch_group_enter(v26);
      SEL v27 = [(RTLearnedLocationEngine *)self learnedLocationStore];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_5;
      v45[3] = &unk_1E6B90728;
      id v47 = &v68;
      id v28 = v26;
      id v46 = v28;
      [v27 storeLocationsOfInterest:v23 handler:v45];

      dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      id v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(aSelector);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v31 = [v22 count];
        uint64_t v32 = [v23 count];
        uint64_t v33 = v69[5];
        *(_DWORD *)buf = 138413058;
        id v75 = v30;
        __int16 v76 = 2048;
        uint64_t v77 = v31;
        __int16 v78 = 2048;
        uint64_t v79 = v32;
        __int16 v80 = 2112;
        uint64_t v81 = v33;
        _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, updated locationOfInterest count, %lu, new locationOfInterest count, %lu, error, %@", buf, 0x2Au);
      }
      uint64_t v34 = (void *)v69[5];
      BOOL v21 = v34 == 0;
      if (a6 && v34) {
        *a6 = v34;
      }
    }
    _Block_object_dispose(&v68, 8);
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
  if (*(void *)(a1 + 80) || !*(void *)(a1 + 32))
  {
    id v6 = v21;
  }
  else
  {
    if (v21) {
      uint64_t v7 = [v21 predominantMotionActivityType];
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = *(void **)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = [v8 predominantMotionActivityType];
      if (v9 != [v21 predominantMotionActivityType]) {
        uint64_t v7 = 0;
      }
    }
    uint64_t v20 = [RTLearnedTransition alloc];
    id v10 = [MEMORY[0x1E4F29128] UUID];
    double v11 = [*(id *)(a1 + 32) exitDate];
    double v12 = [*(id *)(a1 + 48) entryDate];
    double v13 = [*(id *)(a1 + 32) identifier];
    id v14 = [*(id *)(a1 + 48) identifier];
    long long v15 = [MEMORY[0x1E4F1C9C8] now];
    id v16 = [*(id *)(a1 + 48) expirationDate];
    uint64_t v17 = [(RTLearnedTransition *)v20 initWithIdentifier:v10 startDate:v11 stopDate:v12 visitIdentifierOrigin:v13 visitIdentifierDestination:v14 creationDate:v15 expirationDate:v16 predominantMotionActivityType:v7];

    id v6 = (id)v17;
  }
  id v22 = v6;
  if (v6)
  {
    id v18 = *(void **)(a1 + 56);
    id v19 = [*(id *)(a1 + 48) identifier];
    [v18 setObject:v22 forKey:v19];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = [v5 mapItem];

    if (v7)
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = [*(id *)(a1 + 48) identifier];
      [v8 setObject:v5 forKey:v9];

      id v10 = [*(id *)(a1 + 56) learnedLocationStore];
      double v11 = [v5 mapItem];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_3;
      v12[3] = &unk_1E6B94338;
      uint64_t v18 = *(void *)(a1 + 88);
      id v13 = *(id *)(a1 + 64);
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 72);
      id v16 = *(id *)(a1 + 80);
      id v17 = *(id *)(a1 + 32);
      [v10 fetchLocationOfInterestWithMapItem:v11 handler:v12];

      goto LABEL_6;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_6:
}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v10)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) identifier];
    [v7 setObject:v10 forKey:v8];

    uint64_t v9 = (id *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v9 = (id *)(a1 + 56);
  }
  [*v9 addObject:v6];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __75__RTLearnedLocationEngine__appendVisits_lastVisit_lastTransition_outError___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_updateLocationOfInterestsWithVisits:(id)a3 visitToTransitionMapping:(id)a4 visitToLocationOfInterestMapping:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v35 = a4;
  id v34 = a5;
  id v31 = (id)objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v7;
  uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v36)
  {
    uint64_t v33 = *(void *)v38;
    *(void *)&long long v8 = 138412802;
    long long v29 = v8;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        double v11 = [v10 identifier:v29];
        double v12 = [v34 objectForKey:v11];

        id v13 = [v10 identifier];
        id v14 = [v35 objectForKey:v13];

        if (v12)
        {
          id v15 = (void *)MEMORY[0x1E4F1CA48];
          id v16 = [v12 visits];
          id v17 = [v15 arrayWithArray:v16];

          [v17 addObject:v10];
          uint64_t v18 = (void *)MEMORY[0x1E4F1CA48];
          id v19 = [v12 transitions];
          uint64_t v20 = [v18 arrayWithArray:v19];

          if (v14) {
            [v20 addObject:v14];
          }
          id v21 = [RTLearnedLocationOfInterest alloc];
          id v22 = [v12 identifier];
          id v23 = [v12 location];
          double v24 = [v12 place];
          id v25 = [(RTLearnedLocationOfInterest *)v21 initWithIdentifier:v22 location:v23 place:v24 visits:v17 transitions:v20];

          uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            SEL v27 = NSStringFromSelector(a2);
            *(_DWORD *)buf = v29;
            double v42 = v27;
            __int16 v43 = 2112;
            id v44 = v12;
            __int16 v45 = 2112;
            id v46 = v25;
            _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, LOI, %@, updated LOI, %@", buf, 0x20u);
          }
          if (v25) {
            [v31 addObject:v25];
          }
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v36);
  }

  return v31;
}

- (id)_createLocationOfInterestsWithVisits:(id)a3 visitToTransitionMapping:(id)a4 visitToPlaceMapping:(id)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v81 = a5;
  uint64_t v82 = objc_opt_new();
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v7;
  uint64_t v83 = [obj countByEnumeratingWithState:&v86 objects:v100 count:16];
  if (v83)
  {
    uint64_t v80 = *(void *)v87;
    *(void *)&long long v9 = 138412802;
    long long v67 = v9;
    id v79 = v8;
    do
    {
      for (uint64_t i = 0; i != v83; ++i)
      {
        if (*(void *)v87 != v80) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(RTLearnedLocationOfInterest **)(*((void *)&v86 + 1) + 8 * i);
        double v12 = [(RTLearnedLocationOfInterest *)v11 identifier];
        id v13 = [v81 objectForKey:v12];

        if (v13)
        {
          id v14 = [v13 identifier];
          id v15 = [v82 objectForKey:v14];

          id v16 = [(RTLearnedLocationOfInterest *)v11 identifier];
          uint64_t v17 = [v8 objectForKey:v16];

          if (v15)
          {
            uint64_t v18 = (void *)MEMORY[0x1E4F1CA48];
            id v19 = [(RTLearnedLocationOfInterest *)v15 visits];
            uint64_t v20 = [v18 arrayWithArray:v19];

            long long v84 = v20;
            [v20 addObject:v11];
            id v21 = (void *)MEMORY[0x1E4F1CA48];
            id v22 = [(RTLearnedLocationOfInterest *)v15 transitions];
            id v23 = [v21 arrayWithArray:v22];

            if (v17) {
              [(RTLearnedLocation *)v23 addObject:v17];
            }
            double v24 = (void *)v17;
            id v25 = [RTLearnedLocationOfInterest alloc];
            uint64_t v26 = [(RTLearnedLocationOfInterest *)v15 identifier];
            SEL v27 = [(RTLearnedLocationOfInterest *)v15 location];
            [(RTLearnedLocationOfInterest *)v15 place];
            v29 = id v28 = v15;
            id v30 = [(RTLearnedLocationOfInterest *)v25 initWithIdentifier:v26 location:v27 place:v29 visits:v84 transitions:v23];

            id v31 = v28;
            uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              uint64_t v33 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138413058;
              uint64_t v91 = v33;
              __int16 v92 = 2112;
              uint64_t v93 = v28;
              __int16 v94 = 2112;
              uint64_t v95 = v30;
              __int16 v96 = 2112;
              uint64_t v97 = v11;
              _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, LOI, %@, updated LOI, %@, visit, %@", buf, 0x2Au);
            }
            id v34 = v24;
            if (v30)
            {
              id v35 = [v13 identifier];
              [v82 setObject:v30 forKey:v35];
              id v8 = v79;
              goto LABEL_22;
            }
            id v8 = v79;
          }
          else
          {
            id v73 = objc_alloc(MEMORY[0x1E4F5CE00]);
            uint64_t v85 = [(RTLearnedLocationOfInterest *)v11 location];
            uint64_t v77 = [v85 location];
            [v77 latitude];
            double v37 = v36;
            __int16 v76 = [(RTLearnedLocationOfInterest *)v11 location];
            id v75 = [v76 location];
            [v75 longitude];
            double v39 = v38;
            uint64_t v74 = [(RTLearnedLocationOfInterest *)v11 location];
            long long v72 = [v74 location];
            [v72 horizontalUncertainty];
            double v41 = v40;
            id v71 = [(RTLearnedLocationOfInterest *)v11 location];
            uint64_t v70 = [v71 location];
            [v70 altitude];
            double v43 = v42;
            uint64_t v69 = [(RTLearnedLocationOfInterest *)v11 location];
            id v44 = [v69 location];
            [v44 verticalUncertainty];
            double v46 = v45;
            id v47 = [(RTLearnedLocationOfInterest *)v11 location];
            uint64_t v48 = [v47 location];
            uint64_t v49 = [v48 referenceFrame];
            [(RTLearnedLocationOfInterest *)v11 location];
            v51 = id v50 = (void *)v17;
            SEL v52 = [v51 location];
            uint64_t v53 = [v73 initWithLatitude:0 longitude:v49 horizontalUncertainty:objc_msgSend(v52, "sourceAccuracy") altitude:v37 verticalUncertainty:v39 date:v41 referenceFrame:v43 speed:v46 sourceAccuracy:0.0];

            id v34 = v50;
            id v54 = [RTLearnedLocation alloc];
            id v55 = [(RTLearnedLocationOfInterest *)v11 location];
            id v56 = [v55 location];
            long long v84 = (void *)v53;
            id v23 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v54, "initWithLocation:dataPointCount:type:", v53, [v56 sourceAccuracy] == 2, 2);

            id v57 = [RTLearnedLocationOfInterest alloc];
            id v58 = [v13 identifier];
            uint64_t v99 = v11;
            uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
            if (v34)
            {
              __int16 v98 = v34;
              id v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
              id v30 = [(RTLearnedLocationOfInterest *)v57 initWithIdentifier:v58 location:v23 place:v13 visits:v59 transitions:v60];
            }
            else
            {
              id v30 = [(RTLearnedLocationOfInterest *)v57 initWithIdentifier:v58 location:v23 place:v13 visits:v59 transitions:0];
            }

            id v61 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            id v8 = v79;
            id v31 = 0;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
            {
              id v62 = NSStringFromSelector(a2);
              *(_DWORD *)buf = v67;
              uint64_t v91 = v62;
              __int16 v92 = 2112;
              uint64_t v93 = v30;
              __int16 v94 = 2112;
              uint64_t v95 = v11;
              _os_log_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_INFO, "%@, create new LOI, %@, visit, %@", buf, 0x20u);
            }
            if (v30)
            {
              id v35 = [v13 identifier];
              [v82 setObject:v30 forKey:v35];
LABEL_22:
            }
          }
        }
      }
      uint64_t v83 = [obj countByEnumeratingWithState:&v86 objects:v100 count:16];
    }
    while (v83);
  }

  id v63 = (void *)MEMORY[0x1E4F1C978];
  id v64 = [v82 allValues];
  id v65 = [v63 arrayWithArray:v64];

  return v65;
}

- (void)performTransitAnalyticsWithHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(RTLearnedLocationEngine *)self transitMetricManager];

  if (v4)
  {
    id v5 = [(RTLearnedLocationEngine *)self transitMetricManager];
    [v5 performTransitAnalyticsWithHandler:v6];
  }
}

+ (id)computeVisitLabelingMetricsForLabelingRetried:(BOOL)a3 labelingSkipped:(BOOL)a4 revGeoCalled:(BOOL)a5 bluePOICalled:(BOOL)a6 unlabeledVisit:(BOOL)a7 visitAge:(double)a8 error:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  BOOL v14 = a3;
  id v15 = a9;
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  [v16 setObject:&unk_1F34502A0 forKeyedSubscript:@"visitLabelingAttempt"];
  uint64_t v17 = [NSNumber numberWithBool:v14];
  [v16 setObject:v17 forKeyedSubscript:@"visitLabelingRetried"];

  uint64_t v18 = [NSNumber numberWithBool:v15 == 0];
  [v16 setObject:v18 forKeyedSubscript:@"visitLabelingSucceeded"];

  id v19 = [NSNumber numberWithBool:v13];
  [v16 setObject:v19 forKeyedSubscript:@"visitLabelingSkipped"];

  uint64_t v20 = [NSNumber numberWithBool:v10];
  [v16 setObject:v20 forKeyedSubscript:@"unlabeledVisit"];

  id v21 = [NSNumber numberWithBool:v11];
  [v16 setObject:v21 forKeyedSubscript:@"bluePOICalled"];

  id v22 = [NSNumber numberWithBool:v12];
  [v16 setObject:v22 forKeyedSubscript:@"revGeoCalled"];

  id v23 = [NSNumber numberWithDouble:a8];
  [v16 setObject:v23 forKeyedSubscript:@"visitAge"];

  if (v15)
  {
    double v24 = [v15 domain];
    [v16 setObject:v24 forKeyedSubscript:@"errorDomain"];

    id v25 = [NSNumber numberWithInteger:[v15 code]];
    [v16 setObject:v25 forKeyedSubscript:@"errorCode"];

    uint64_t v26 = [v15 userInfo];
    uint64_t v27 = *MEMORY[0x1E4F63EB0];
    id v28 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F63EB0]];

    if (v28)
    {
      long long v29 = [v15 userInfo];
      id v30 = [v29 objectForKeyedSubscript:v27];
      [v16 setObject:v30 forKeyedSubscript:@"errorHTTPStatus"];
    }
  }

  return v16;
}

+ (void)submitVisitLabelingMetricsForLabelingRetried:(BOOL)a3 labelingSkipped:(BOOL)a4 revGeoCalled:(BOOL)a5 bluePOICalled:(BOOL)a6 unlabeledVisit:(BOOL)a7 visitAge:(double)a8 error:(id)a9
{
  id v16 = a9;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __145__RTLearnedLocationEngine_submitVisitLabelingMetricsForLabelingRetried_labelingSkipped_revGeoCalled_bluePOICalled_unlabeledVisit_visitAge_error___block_invoke;
  v28[3] = &unk_1E6B94388;
  BOOL v32 = a3;
  BOOL v33 = a4;
  BOOL v34 = a5;
  BOOL v35 = a6;
  BOOL v36 = a7;
  double v31 = a8;
  id v29 = v16;
  id v30 = a1;
  id v17 = v16;
  uint64_t v18 = (void *)MEMORY[0x1E016DB00](v28);
  id v19 = [NSString alloc];
  uint64_t v20 = (void *)[v19 initWithCString:RTAnalyticsEventVisitLabelingAttempt encoding:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __145__RTLearnedLocationEngine_submitVisitLabelingMetricsForLabelingRetried_labelingSkipped_revGeoCalled_bluePOICalled_unlabeledVisit_visitAge_error___block_invoke_2;
  v25[3] = &unk_1E6B943B0;
  id v26 = v20;
  id v27 = v18;
  id v21 = v20;
  id v22 = v18;
  id v23 = (void *)MEMORY[0x1E016DB00](v25);
  double v24 = [NSString stringWithFormat:@"com.apple.%@", v21];
  AnalyticsSendEventLazy();
}

uint64_t __145__RTLearnedLocationEngine_submitVisitLabelingMetricsForLabelingRetried_labelingSkipped_revGeoCalled_bluePOICalled_unlabeledVisit_visitAge_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) computeVisitLabelingMetricsForLabelingRetried:*(unsigned __int8 *)(a1 + 56) labelingSkipped:*(unsigned __int8 *)(a1 + 57) revGeoCalled:*(unsigned __int8 *)(a1 + 58) bluePOICalled:*(unsigned __int8 *)(a1 + 59) unlabeledVisit:*(unsigned __int8 *)(a1 + 60) visitAge:*(void *)(a1 + 32) error:*(double *)(a1 + 48)];
}

id __145__RTLearnedLocationEngine_submitVisitLabelingMetricsForLabelingRetried_labelingSkipped_revGeoCalled_bluePOICalled_unlabeledVisit_visitAge_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

- (RTLearnedLocationEngineProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTLearnedLocationEngineProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)registerTrainOnBattery
{
  return self->_registerTrainOnBattery;
}

- (BOOL)shouldRecoverKnownPlaceTypes
{
  return self->_shouldRecoverKnownPlaceTypes;
}

- (void)setShouldRecoverKnownPlaceTypes:(BOOL)a3
{
  self->_shouldRecoverKnownPlaceTypes = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTAccountManager)accountManager
{
  return self->_accountManager;
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTDailyTrainingSessionCounter)dailyTrainingSessionCounter
{
  return self->_dailyTrainingSessionCounter;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (RTElevationManager)elevationManager
{
  return self->_elevationManager;
}

- (RTEventManager)eventManager
{
  return self->_eventManager;
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore
{
  return self->_learnedPlaceTypeInferenceStore;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator
{
  return self->_placeTypeClassifierMetricsCalculator;
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (RTPointOfInterestMetricsManager)pointOfInterestMetricsManager
{
  return self->_pointOfInterestMetricsManager;
}

- (RTPersonalizationPortraitManager)portraitManager
{
  return self->_portraitManager;
}

- (RTLearnedLocationEngineTrainingMetrics)trainingMetrics
{
  return self->_trainingMetrics;
}

- (void)setTrainingMetrics:(id)a3
{
}

- (RTLearnedLocationReconcilerPerVisit)reconcilerPerVisit
{
  return self->_reconcilerPerVisit;
}

- (RTLearnedLocationReconcilerPerDevice)reconcilerPerDevice
{
  return self->_reconcilerPerDevice;
}

- (RTSettledStateTransitionStore)settledStateTransitionStore
{
  return self->_settledStateTransitionStore;
}

- (RTTransitMetricManager)transitMetricManager
{
  return self->_transitMetricManager;
}

- (RTTripSegmentProvider)tripSegmentProvider
{
  return self->_tripSegmentProvider;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (BOOL)monitorFingerprints
{
  return self->_monitorFingerprints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_tripSegmentProvider, 0);
  objc_storeStrong((id *)&self->_transitMetricManager, 0);
  objc_storeStrong((id *)&self->_settledStateTransitionStore, 0);
  objc_storeStrong((id *)&self->_reconcilerPerDevice, 0);
  objc_storeStrong((id *)&self->_reconcilerPerVisit, 0);
  objc_storeStrong((id *)&self->_trainingMetrics, 0);
  objc_storeStrong((id *)&self->_portraitManager, 0);
  objc_storeStrong((id *)&self->_pointOfInterestMetricsManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_learnedPlaceTypeInferenceStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_elevationManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dailyTrainingSessionCounter, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end