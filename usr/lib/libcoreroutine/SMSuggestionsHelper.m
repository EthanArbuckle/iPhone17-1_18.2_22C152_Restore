@interface SMSuggestionsHelper
+ (BOOL)isContactBlocked:(id)a3 error:(id *)a4;
+ (BOOL)isValidDistance:(double)a3;
+ (id)createMasqueradingReferenceLocationFromFenceInfo:(id)a3 placeInference:(id)a4 error:(id *)a5;
+ (id)createMasqueradingReferenceLocationFromFenceRadius:(double)a3 location:(id)a4 error:(id *)a5;
+ (id)dedupeSessionConfigurations:(id)a3;
+ (id)getSMContactInformationFromSMHandle:(id)a3;
+ (id)getSMHandlesFromFAFamilyMembers:(id)a3 error:(id *)a4;
+ (id)getSMHandlesFromRTContact:(id)a3 error:(id *)a4;
+ (id)getSMHandlesFromRTContacts:(id)a3 error:(id *)a4;
+ (id)placeInferenceFromNPLOI:(id)a3;
- (BOOL)routineEnabled;
- (RTAuthorizationManager)authorizationManager;
- (RTContactsManager)contactsManager;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (RTDistanceCalculator)distanceCalculator;
- (RTHealthKitManager)healthKitManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocation)latestLocationOfTheDevice;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTNavigationManager)navigationManager;
- (SMEligibilityChecker)eligibilityChecker;
- (SMSessionStore)sessionStore;
- (SMSuggestionsHelper)initWithAuthorizationManager:(id)a3 contactsManager:(id)a4 deviceLocationPredictor:(id)a5 distanceCalculator:(id)a6 healthKitManager:(id)a7 learnedLocationStore:(id)a8 learnedLocationManager:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 navigationManager:(id)a12 sessionStore:(id)a13 eligibilityChecker:(id)a14;
- (id)_dedupePlaceInferencesWithOrder:(id)a3;
- (id)_placeInferenceFromLOI:(id)a3;
- (id)_submitMetricForFetchMostLikelyReceiverHandlesDidComplete:(BOOL)a3 didFetchSessionConfigurations:(BOOL)a4 didFetchEmergencyContacts:(BOOL)a5 didFetchICloudFamily:(BOOL)a6 didFetchFavorites:(BOOL)a7 timeout:(double)a8;
- (id)_submitMetricForFetchMostLikelySessionDestinationsWithRefreshedLocationDidComplete:(BOOL)a3 didFetchNavigationRouteSummary:(BOOL)a4 didFetchLOIs:(BOOL)a5 didFetchNPLOIs:(BOOL)a6 didFetchSessionConfigurations:(BOOL)a7 timeout:(double)a8;
- (id)canonicalizeHandles:(id)a3;
- (void)_computeMostlikelySessionDestinations:(id)a3 closestHome:(id)a4 distanceToClosestHome:(double)a5 nploisWithValidDistanceAndHighConfidence:(id)a6 fenceSizeForMapItem:(id)a7 placeInferences:(id)a8 errors:(id)a9 handler:(id)a10;
- (void)_fetchMostLikelyReceiverHandlesWithHandler:(id)a3;
- (void)_fetchMostLikelyReceiverHandlesWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchMostLikelySessionDestinationsWithHandler:(id)a3;
- (void)_fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler:(id)a3;
- (void)_filterHandles:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_getFAFamilyMembersFromAAAFamilyWithHandler:(id)a3;
- (void)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 handler:(id)a6;
- (void)_getSessionConfigurationsWithOptions:(id)a3 handler:(id)a4;
- (void)_onAuthorizationNotification:(id)a3;
- (void)_refreshCurrentLocationWithHandler:(id)a3;
- (void)fetchMostLikelyReceiverHandlesWithHandler:(id)a3;
- (void)fetchMostLikelyReceiverHandlesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchMostLikelySessionDestinationsWithHandler:(id)a3;
- (void)fetchNumEmergencyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4;
- (void)fetchNumFavoriteRecipientsWithReceiverHandles:(id)a3 handler:(id)a4;
- (void)fetchNumiCloudFamilyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4;
- (void)getEmergencyHandles:(id)a3;
- (void)getFavoriteContactHandles:(id)a3;
- (void)getFavoriteHandles:(id)a3;
- (void)getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 handler:(id)a6;
- (void)getSessionConfigurationsWithOptions:(id)a3 handler:(id)a4;
- (void)getiCloudFamilyHandles:(id)a3;
- (void)onAuthorizationNotification:(id)a3;
- (void)refreshCurrentLocationWithHandler:(id)a3;
- (void)setEligibilityChecker:(id)a3;
- (void)setLatestLocationOfTheDevice:(id)a3;
- (void)setRoutineEnabled:(BOOL)a3;
- (void)setSessionStore:(id)a3;
@end

@implementation SMSuggestionsHelper

- (SMSuggestionsHelper)initWithAuthorizationManager:(id)a3 contactsManager:(id)a4 deviceLocationPredictor:(id)a5 distanceCalculator:(id)a6 healthKitManager:(id)a7 learnedLocationStore:(id)a8 learnedLocationManager:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 navigationManager:(id)a12 sessionStore:(id)a13 eligibilityChecker:(id)a14
{
  id v55 = a3;
  id v42 = a4;
  id v19 = a4;
  id v48 = a5;
  id v43 = a6;
  id v47 = a6;
  id v44 = a7;
  id v20 = a7;
  id v45 = a8;
  id v21 = a8;
  id v50 = a9;
  id v54 = a10;
  id v53 = a11;
  id v52 = a12;
  id v51 = a13;
  id v22 = a14;
  v49 = v22;
  if (!v55)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v34 = 0;
    v35 = 0;
    v23 = v19;
    v24 = v47;
    v25 = v48;
    v26 = v21;
    goto LABEL_22;
  }
  v23 = v19;
  if (!v19)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = v47;
    v25 = v48;
    v26 = v21;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactsManager", buf, 2u);
    }

    v34 = 0;
    v35 = v55;
LABEL_22:
    v27 = v50;
LABEL_45:
    v33 = self;
    goto LABEL_46;
  }
  v24 = v47;
  v25 = v48;
  v26 = v21;
  if (!v48)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = v50;
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: deviceLocationPredictor";
LABEL_43:
    _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, v39, buf, 2u);
    goto LABEL_44;
  }
  v27 = v50;
  if (!v47)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_43;
  }
  if (!v20)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_43;
  }
  if (!v26)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_43;
  }
  if (!v50)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_43;
  }
  if (!v54)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_43;
  }
  if (!v53)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_43;
  }
  if (!v52)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_43;
  }
  if (!v51)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_43;
  }
  if (!v22)
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v39 = "Invalid parameter not satisfying: eligibilityChecker";
      goto LABEL_43;
    }
LABEL_44:

    v34 = 0;
    v35 = v55;
    goto LABEL_45;
  }
  v56.receiver = self;
  v56.super_class = (Class)SMSuggestionsHelper;
  v28 = [(RTNotifier *)&v56 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_authorizationManager, a3);
    objc_storeStrong((id *)&v29->_contactsManager, v42);
    objc_storeStrong((id *)&v29->_deviceLocationPredictor, a5);
    objc_storeStrong((id *)&v29->_distanceCalculator, v43);
    objc_storeStrong((id *)&v29->_healthKitManager, v44);
    objc_storeStrong((id *)&v29->_learnedLocationStore, v45);
    objc_storeStrong((id *)&v29->_learnedLocationManager, a9);
    objc_storeStrong((id *)&v29->_locationManager, a10);
    objc_storeStrong((id *)&v29->_mapServiceManager, a11);
    objc_storeStrong((id *)&v29->_navigationManager, a12);
    objc_storeStrong((id *)&v29->_sessionStore, a13);
    objc_storeStrong((id *)&v29->_eligibilityChecker, a14);
    latestLocationOfTheDevice = v29->_latestLocationOfTheDevice;
    v29->_latestLocationOfTheDevice = 0;
  }
  v31 = [(SMSuggestionsHelper *)v29 authorizationManager];
  v32 = +[RTNotification notificationName];
  [v31 addObserver:v29 selector:sel_onAuthorizationNotification_ name:v32];

  v33 = v29;
  v34 = v33;
  v35 = v55;
  v27 = v50;
LABEL_46:

  return v34;
}

- (void)_getFAFamilyMembersFromAAAFamilyWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = objc_alloc_init(MEMORY[0x1E4F61858]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__SMSuggestionsHelper__getFAFamilyMembersFromAAAFamilyWithHandler___block_invoke;
    v7[3] = &unk_1E6B95008;
    id v8 = v4;
    id v9 = v3;
    id v6 = v4;
    [v5 startRequestWithCompletionHandler:v7];
  }
  else
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[SMSuggestionsHelper _getFAFamilyMembersFromAAAFamilyWithHandler:]";
      __int16 v12 = 1024;
      int v13 = 139;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __67__SMSuggestionsHelper__getFAFamilyMembersFromAAAFamilyWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = [a2 members];
    [v5 addObjectsFromArray:v6];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)fetchMostLikelyReceiverHandlesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__SMSuggestionsHelper_fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[SMSuggestionsHelper fetchMostLikelyReceiverHandlesWithOptions:handler:]";
      __int16 v15 = 1024;
      int v16 = 160;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __73__SMSuggestionsHelper_fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMostLikelyReceiverHandlesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchMostLikelyReceiverHandlesWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__SMSuggestionsHelper_fetchMostLikelyReceiverHandlesWithHandler___block_invoke;
    v7[3] = &unk_1E6B90CE0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[SMSuggestionsHelper fetchMostLikelyReceiverHandlesWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 174;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __65__SMSuggestionsHelper_fetchMostLikelyReceiverHandlesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMostLikelyReceiverHandlesWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchMostLikelyReceiverHandlesWithHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F998B8];
  id v5 = a3;
  id v6 = [v4 defaultOptions];
  [(SMSuggestionsHelper *)self _fetchMostLikelyReceiverHandlesWithOptions:v6 handler:v5];
}

- (void)_fetchMostLikelyReceiverHandlesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v28 = a4;
  if (v28)
  {
    id v7 = dispatch_group_create();
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      __int16 v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, starting", buf, 0x16u);
    }
    int v12 = objc_opt_new();
    id v13 = objc_alloc(MEMORY[0x1E4F99920]);
    LOBYTE(v27) = 0;
    oslog = [v13 initWithBatchSize:*MEMORY[0x1E4F99C08] fetchLimit:*MEMORY[0x1E4F99C08] sortBySessionStartDate:1 ascending:0 sessionTypes:0 timeInADayInterval:0 pickOneConfigInTimeInADayInterval:v27 dateInterval:0 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v67 = 0;
    dispatch_group_enter(v7);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke;
    v61[3] = &unk_1E6B94B80;
    v61[4] = self;
    v64 = buf;
    uint64_t v14 = v7;
    v62 = v14;
    SEL v65 = a2;
    id v15 = v12;
    id v63 = v15;
    [(SMSuggestionsHelper *)self _getSessionConfigurationsWithOptions:oslog handler:v61];
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    char v60 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    char v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    char v56 = 0;
    int v16 = objc_opt_new();
    uint64_t v17 = objc_opt_new();
    v18 = objc_opt_new();
    if (([v30 requireOnlyPastSessionRecipients] & 1) == 0)
    {
      dispatch_group_enter(v14);
      if ([v30 requireOnlyFavoritedHandles])
      {
        id v19 = v54;
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_55;
        v54[3] = &unk_1E6B94A68;
        v54[6] = v59;
        v54[4] = v16;
        v54[5] = v14;
        [(SMSuggestionsHelper *)self getFavoriteHandles:v54];
      }
      else
      {
        id v19 = v53;
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_2_56;
        v53[3] = &unk_1E6B94A68;
        v53[6] = v59;
        v53[4] = v16;
        v53[5] = v14;
        [(SMSuggestionsHelper *)self getFavoriteContactHandles:v53];
      }

      dispatch_group_enter(v14);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_3;
      v49[3] = &unk_1E6B94A68;
      id v52 = v57;
      id v50 = v17;
      id v20 = v14;
      id v51 = v20;
      [(SMSuggestionsHelper *)self getEmergencyHandles:v49];
      dispatch_group_enter(v20);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_4;
      v45[3] = &unk_1E6B94A68;
      id v48 = v55;
      id v46 = v18;
      id v47 = v20;
      [(SMSuggestionsHelper *)self getiCloudFamilyHandles:v45];
    }
    id v21 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_5;
    block[3] = &unk_1E6B950A8;
    v32 = v14;
    v33 = self;
    v40 = buf;
    v41 = v57;
    id v42 = v55;
    id v43 = v59;
    SEL v44 = a2;
    id v34 = v15;
    id v35 = v17;
    id v36 = v18;
    id v37 = v16;
    id v38 = v30;
    id v39 = v28;
    id v22 = v16;
    id v23 = v18;
    id v24 = v17;
    id v25 = v15;
    v26 = v14;
    dispatch_async(v21, block);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(v57, 8);
    _Block_object_dispose(v59, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    oslog = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSuggestionsHelper _fetchMostLikelyReceiverHandlesWithOptions:handler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 193;
      _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E6B95030;
  uint64_t v18 = *(void *)(a1 + 56);
  id v13 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  uint64_t v19 = *(void *)(a1 + 64);
  id v16 = v5;
  id v17 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  if (*(void *)(a1 + 32))
  {
    v2 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v2);
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 80));
      uint64_t v7 = [*(id *)(a1 + 56) count];
      *(_DWORD *)buf = 138412802;
      id v42 = v5;
      __int16 v43 = 2112;
      SEL v44 = v6;
      __int16 v45 = 2048;
      uint64_t v46 = v7;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, %@, fetched sessionConfigurations count, %lu", buf, 0x20u);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v35 = a1;
    id v8 = *(id *)(a1 + 56);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      id v34 = v8;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
          id v14 = (void *)MEMORY[0x1E016D870]();
          uint64_t v15 = [v13 conversation];

          if (v15)
          {
            id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              id v24 = (objc_class *)objc_opt_class();
              id v25 = NSStringFromClass(v24);
              v26 = NSStringFromSelector(*(SEL *)(v35 + 80));
              uint64_t v27 = [v13 conversation];
              id v28 = [v27 receiverHandles];
              *(_DWORD *)buf = 138412802;
              id v42 = v25;
              __int16 v43 = 2112;
              SEL v44 = v26;
              __int16 v45 = 2112;
              uint64_t v46 = (uint64_t)v28;
              _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@, %@, sessionConfig handles, %@", buf, 0x20u);

              id v8 = v34;
            }

            id v17 = [v13 conversation];
            uint64_t v18 = [v17 receiverHandles];
            unint64_t v19 = [v18 count];

            if (v19 <= 1)
            {
              id v20 = *(void **)(v35 + 64);
              id v21 = [v13 conversation];
              id v22 = [v21 receiverHandles];
              id v23 = [v22 firstObject];
              [v20 addObject:v23];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v10);
    }

    v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      v32 = NSStringFromSelector(*(SEL *)(v35 + 80));
      uint64_t v33 = [*(id *)(v35 + 64) count];
      *(_DWORD *)buf = 138412802;
      id v42 = v31;
      __int16 v43 = 2112;
      SEL v44 = v32;
      __int16 v45 = 2048;
      uint64_t v46 = v33;
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, %@, session configuration handles count, %lu", buf, 0x20u);
    }
    dispatch_group_leave(*(dispatch_group_t *)(v35 + 40));
  }
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v6 && [v6 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_2_56(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v6 && [v6 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v6 && [v6 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (v6 && [v6 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_5(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  BOOL v4 = dispatch_group_wait(v2, v3) == 0;
  id v5 = [*(id *)(a1 + 40) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  long long v6 = *(_OWORD *)(a1 + 112);
  long long v16 = *(_OWORD *)(a1 + 96);
  v9[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_6;
  v9[3] = &unk_1E6B95080;
  uint64_t v7 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  BOOL v20 = v4;
  long long v17 = v6;
  uint64_t v8 = *(void *)(a1 + 128);
  uint64_t v18 = 0x4014000000000000;
  uint64_t v19 = v8;
  id v10 = v7;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 80);
  id v15 = *(id *)(a1 + 88);
  dispatch_async(v5, v9);
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_6(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _submitMetricForFetchMostLikelyReceiverHandlesDidComplete:*(unsigned __int8 *)(a1 + 136) didFetchSessionConfigurations:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) didFetchEmergencyContacts:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) didFetchICloudFamily:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) didFetchFavorites:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) timeout:*(double *)(a1 + 120)];
  if (!*(unsigned char *)(a1 + 136))
  {
    dispatch_time_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      uint64_t v27 = NSStringFromSelector(*(SEL *)(a1 + 128));
      *(_DWORD *)buf = 138412802;
      long long v38 = v26;
      __int16 v39 = 2112;
      v40 = v27;
      __int16 v41 = 2112;
      id v42 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@, %@, timed out waiting for completion, metric, %@", buf, 0x20u);
    }
  }
  BOOL v4 = objc_opt_new();
  [v4 addObjectsFromArray:*(void *)(a1 + 40)];
  [v4 addObjectsFromArray:*(void *)(a1 + 48)];
  [v4 addObjectsFromArray:*(void *)(a1 + 56)];
  [v4 addObjectsFromArray:*(void *)(a1 + 64)];
  id v5 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1E016D870]();
        id v13 = [v11 canonicalizedHandle];
        if (v13) {
          [v5 addObject:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }

  id v14 = objc_opt_new();
  id v15 = objc_opt_new();
  if ([v5 count])
  {
    unint64_t v16 = 0;
    do
    {
      long long v17 = (void *)MEMORY[0x1E016D870]();
      uint64_t v18 = [v5 objectAtIndexedSubscript:v16];
      char v19 = [v15 containsObject:v18];

      if ((v19 & 1) == 0)
      {
        BOOL v20 = [v5 objectAtIndexedSubscript:v16];
        [v15 addObject:v20];

        id v21 = [v5 objectAtIndexedSubscript:v16];
        [v14 addObject:v21];
      }
      ++v16;
    }
    while (v16 < [v5 count]);
  }
  id v22 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_58;
  v28[3] = &unk_1E6B95058;
  uint64_t v31 = *(void *)(a1 + 128);
  v28[4] = v22;
  id v29 = v14;
  uint64_t v23 = *(void *)(a1 + 72);
  id v30 = *(id *)(a1 + 80);
  id v24 = v14;
  [v22 _filterHandles:v24 options:v23 handler:v28];
}

void __74__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithOptions_handler___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v8 = [*(id *)(a1 + 40) count];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, deduped handles count, %lu", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = (void *)[v3 copy];

  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
}

- (void)_filterHandles:(id)a3 options:(id)a4 handler:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id, void))a5;
  long long v36 = v9;
  long long v35 = v8;
  if ([v9 hasNoFilters])
  {
    v10[2](v10, v8, 0);
  }
  else
  {
    long long v34 = v10;
    int v11 = dispatch_group_create();
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__53;
    v74 = __Block_byref_object_dispose__53;
    id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = v8;
    if ([v9 requireEligibility])
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      obuint64_t j = v8;
      uint64_t v13 = [obj countByEnumeratingWithState:&v66 objects:v84 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v67 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v66 + 1) + 8 * i);
            dispatch_group_enter(v11);
            uint64_t v17 = [(SMSuggestionsHelper *)self eligibilityChecker];
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke;
            v62[3] = &unk_1E6B950F8;
            v62[4] = self;
            v62[5] = v16;
            v64 = &v70;
            SEL v65 = a2;
            id v63 = v11;
            [v17 checkReceiverEligibility:v16 handler:v62];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v66 objects:v84 count:16];
        }
        while (v13);
      }

      id v12 = v8;
    }
    if ([v36 requireContact])
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obja = v12;
      uint64_t v18 = [obja countByEnumeratingWithState:&v58 objects:v83 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v59 != v19) {
              objc_enumerationMutation(obja);
            }
            id v21 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            dispatch_group_enter(v11);
            id v22 = [(SMSuggestionsHelper *)self contactsManager];
            uint64_t v23 = [v21 primaryHandle];
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_61;
            v54[3] = &unk_1E6B95148;
            v54[4] = self;
            v54[5] = v21;
            char v56 = &v70;
            SEL v57 = a2;
            id v55 = v11;
            [v22 fetchContactsFromEmailOrPhoneNumberString:v23 handler:v54];
          }
          uint64_t v18 = [obja countByEnumeratingWithState:&v58 objects:v83 count:16];
        }
        while (v18);
      }

      id v12 = v35;
    }
    if ([v36 requireNonBlockedContact])
    {
      dispatch_group_enter(v11);
      long long v53 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v50 = 0u;
      id v37 = v12;
      uint64_t v24 = [v37 countByEnumeratingWithState:&v50 objects:v82 count:16];
      if (v24)
      {
        id objb = *(id *)v51;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(id *)v51 != objb) {
              objc_enumerationMutation(v37);
            }
            uint64_t v26 = *(void *)(*((void *)&v50 + 1) + 8 * k);
            uint64_t v27 = +[SMSuggestionsHelper getSMContactInformationFromSMHandle:v26];
            id v49 = 0;
            BOOL v28 = +[SMSuggestionsHelper isContactBlocked:v27 error:&v49];
            id v29 = v49;
            id v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v31 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v77 = v31;
              __int16 v78 = 2112;
              uint64_t v79 = v26;
              __int16 v80 = 1024;
              BOOL v81 = v28;
              _os_log_debug_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEBUG, "%@, handle, %@, isContactBlocked, %{Bool}d", buf, 0x1Cu);
            }
            if (v28) {
              [(id)v71[5] addObject:v26];
            }
          }
          uint64_t v24 = [v37 countByEnumeratingWithState:&v50 objects:v82 count:16];
        }
        while (v24);
      }

      dispatch_group_leave(v11);
      id v12 = v35;
    }
    long long v32 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_64;
    block[3] = &unk_1E6B95198;
    uint64_t v43 = v11;
    SEL v44 = self;
    SEL v48 = a2;
    id v46 = v34;
    id v45 = v12;
    uint64_t v47 = &v70;
    long long v33 = v11;
    dispatch_async(v32, block);

    _Block_object_dispose(&v70, 8);
    uint64_t v10 = (void (**)(id, id, void))v34;
  }
}

void __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_2;
  block[3] = &unk_1E6B950D0;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v16 = a2;
  void block[4] = v8;
  id v13 = v6;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v11;
  long long v14 = v11;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138413058;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, handle, %@, eligibility, %ld, error, %@", (uint8_t *)&v7, 0x2Au);
  }
  if (*(void *)(a1 + 72) != 1) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_61(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_2_62;
  block[3] = &unk_1E6B95120;
  uint64_t v11 = *(void *)(a1 + 64);
  void block[4] = *(void *)(a1 + 40);
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_2_62(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) firstObject];
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = v6 != 0;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, handle, %@, isContact, %{Bool}d", (uint8_t *)&v7, 0x1Cu);
  }
  id v3 = [*(id *)(a1 + 40) firstObject];

  if (!v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_64(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  BOOL v4 = dispatch_group_wait(v2, v3) == 0;
  uint64_t v5 = [*(id *)(a1 + 40) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_2_65;
  v9[3] = &unk_1E6B95170;
  BOOL v14 = v4;
  uint64_t v6 = *(void *)(a1 + 72);
  v9[4] = *(void *)(a1 + 40);
  uint64_t v13 = v6;
  id v11 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  id v10 = v7;
  uint64_t v12 = v8;
  dispatch_async(v5, v9);
}

void __54__SMSuggestionsHelper__filterHandles_options_handler___block_invoke_2_65(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    id v6 = (id)[*(id *)(a1 + 40) mutableCopy];
    [v6 removeObjectsInArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v3 = (objc_class *)objc_opt_class();
      BOOL v4 = NSStringFromClass(v3);
      uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%@, %@, timed out waiting for completion", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (id)getSMContactInformationFromSMHandle:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    BOOL v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      uint64_t v17 = "+[SMSuggestionsHelper getSMContactInformationFromSMHandle:]";
      __int16 v18 = 1024;
      int v19 = 486;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F99888];
  id v6 = [v3 primaryHandle];
  uint64_t v7 = [v5 getSMHandleTypeWithHandle:v6];

  if (v7 == 1)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F99830]);
    __int16 v9 = [v3 primaryHandle];
    id v10 = v13;
    uint64_t v11 = 0;
    uint64_t v12 = v9;
    goto LABEL_9;
  }
  if (v7 == 2)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F99830]);
    __int16 v9 = [v3 primaryHandle];
    id v10 = v8;
    uint64_t v11 = v9;
    uint64_t v12 = 0;
LABEL_9:
    BOOL v14 = (void *)[v10 initWithEmail:v11 phoneNumber:v12];

    goto LABEL_11;
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

+ (BOOL)isContactBlocked:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 email];

    if (v8)
    {
      uint64_t v11 = [v7 email];
      uint64_t v9 = CMFItemCreateWithEmailAddress();

      int IsItemBlocked = CMFBlockListIsItemBlocked();
      LOBYTE(v11) = IsItemBlocked != 0;
      uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = (objc_class *)objc_opt_class();
        BOOL v14 = NSStringFromClass(v13);
        uint64_t v15 = NSStringFromSelector(a2);
        int v16 = (void *)v15;
        uint64_t v17 = @"NO";
        int v33 = 138413058;
        long long v34 = v14;
        __int16 v35 = 2112;
        if (IsItemBlocked) {
          uint64_t v17 = @"YES";
        }
        uint64_t v36 = v15;
        __int16 v37 = 2112;
        uint64_t v38 = v9;
        __int16 v39 = 2112;
        v40 = v17;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, email, %@, isBlocked, %@", (uint8_t *)&v33, 0x2Au);
      }
      __int16 v18 = (const void *)v9;
LABEL_18:
      CFRelease(v18);
      goto LABEL_20;
    }
    uint64_t v11 = [v7 phoneNumber];

    if (v11)
    {
      uint64_t v20 = (__CFString *)CPPhoneNumberCopyHomeCountryCode();
      id v21 = [v7 phoneNumber];
      id v22 = [v7 phoneNumber];
      [v22 containsString:@"+"];
      uint64_t v23 = CFPhoneNumberCreate();

      uint64_t v24 = (const void *)CMFItemCreateWithPhoneNumber();
      int v25 = CMFBlockListIsItemBlocked();
      LOBYTE(v11) = v25 != 0;
      uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = (objc_class *)objc_opt_class();
        BOOL v28 = NSStringFromClass(v27);
        uint64_t v29 = NSStringFromSelector(a2);
        id v30 = (void *)v29;
        int v33 = 138413314;
        uint64_t v31 = @"NO";
        long long v34 = v28;
        __int16 v35 = 2112;
        if (v25) {
          uint64_t v31 = @"YES";
        }
        uint64_t v36 = v29;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v24;
        __int16 v39 = 2112;
        v40 = v20;
        __int16 v41 = 2112;
        id v42 = v31;
        _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, %@, phoneNumber, %@, countryCode, %@, isBlocked, %@", (uint8_t *)&v33, 0x34u);
      }
      CFRelease(v20);
      CFRelease(v24);
      __int16 v18 = (const void *)v23;
      goto LABEL_18;
    }
  }
  else
  {
    int v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactInformation", (uint8_t *)&v33, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"contactInformation");
      LOBYTE(v11) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
LABEL_20:

  return (char)v11;
}

- (void)getFavoriteHandles:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_opt_new();
    uint64_t v7 = [(SMSuggestionsHelper *)self contactsManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__SMSuggestionsHelper_getFavoriteHandles___block_invoke;
    v9[3] = &unk_1E6B92168;
    v9[4] = self;
    id v11 = v5;
    SEL v12 = a2;
    id v10 = v6;
    id v8 = v6;
    [v7 fetchFavoriteHandlesWithHandler:v9];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v14 = "-[SMSuggestionsHelper getFavoriteHandles:]";
      __int16 v15 = 1024;
      int v16 = 549;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __42__SMSuggestionsHelper_getFavoriteHandles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__SMSuggestionsHelper_getFavoriteHandles___block_invoke_2;
  v13[3] = &unk_1E6B92140;
  id v14 = v6;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v18 = v8;
  uint64_t v19 = v9;
  id v10 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v5;
  id v17 = v10;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, v13);
}

void __42__SMSuggestionsHelper_getFavoriteHandles___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v7 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138412802;
      int v25 = v5;
      __int16 v26 = 2112;
      uint64_t v27 = v6;
      __int16 v28 = 2048;
      uint64_t v29 = v7;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, %@, fetched favorite handles count, %lu", buf, 0x20u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      uint64_t v12 = MEMORY[0x1E4F1CBF0];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v15 = objc_alloc(MEMORY[0x1E4F99888]);
          id v16 = [v15 initWithPrimaryHandle:v14 secondaryHandles:v12, v19];
          [*(id *)(a1 + 56) addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    uint64_t v17 = *(void *)(a1 + 64);
    id v18 = (void *)[*(id *)(a1 + 56) copy];
    (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, 0);
  }
}

- (void)getFavoriteContactHandles:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_opt_new();
    uint64_t v7 = [(SMSuggestionsHelper *)self contactsManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__SMSuggestionsHelper_getFavoriteContactHandles___block_invoke;
    v9[3] = &unk_1E6B92168;
    v9[4] = self;
    id v11 = v5;
    SEL v12 = a2;
    id v10 = v6;
    id v8 = v6;
    [v7 fetchFavoriteContactsWithHandler:v9];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[SMSuggestionsHelper getFavoriteContactHandles:]";
      __int16 v15 = 1024;
      int v16 = 579;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __49__SMSuggestionsHelper_getFavoriteContactHandles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__SMSuggestionsHelper_getFavoriteContactHandles___block_invoke_2;
  v13[3] = &unk_1E6B92140;
  id v14 = v6;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v18 = v8;
  uint64_t v19 = v9;
  id v10 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v5;
  id v17 = v10;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, v13);
}

void __49__SMSuggestionsHelper_getFavoriteContactHandles___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v7 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138412802;
      long long v20 = v5;
      __int16 v21 = 2112;
      long long v22 = v6;
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, %@, fetched favorite contacts count, %lu", buf, 0x20u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v18 = 0;
    uint64_t v9 = +[SMSuggestionsHelper getSMHandlesFromRTContacts:v8 error:&v18];
    id v10 = v18;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v15 = [v9 count];
      *(_DWORD *)buf = 138412802;
      long long v20 = v13;
      __int16 v21 = 2112;
      long long v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, favorites contacts handles count, %lu", buf, 0x20u);
    }
    if (v10)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      if (v9 && [v9 count]) {
        [*(id *)(a1 + 56) addObjectsFromArray:v9];
      }
      uint64_t v16 = *(void *)(a1 + 64);
      id v17 = (void *)[*(id *)(a1 + 56) copy];
      (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);
    }
  }
}

- (void)getEmergencyHandles:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_opt_new();
    uint64_t v7 = [(SMSuggestionsHelper *)self healthKitManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__SMSuggestionsHelper_getEmergencyHandles___block_invoke;
    v9[3] = &unk_1E6B92168;
    v9[4] = self;
    id v11 = v5;
    SEL v12 = a2;
    id v10 = v6;
    uint64_t v8 = v6;
    [v7 fetchEmergencyContactsWithHandler:v9];
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[SMSuggestionsHelper getEmergencyHandles:]";
      __int16 v15 = 1024;
      int v16 = 624;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __43__SMSuggestionsHelper_getEmergencyHandles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__SMSuggestionsHelper_getEmergencyHandles___block_invoke_2;
  v13[3] = &unk_1E6B92140;
  id v14 = v6;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v18 = v8;
  uint64_t v19 = v9;
  id v10 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v5;
  id v17 = v10;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, v13);
}

void __43__SMSuggestionsHelper_getEmergencyHandles___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v7 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138412802;
      long long v20 = v5;
      __int16 v21 = 2112;
      long long v22 = v6;
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, %@, fetched emergency contacts count, %lu", buf, 0x20u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v18 = 0;
    uint64_t v9 = +[SMSuggestionsHelper getSMHandlesFromRTContacts:v8 error:&v18];
    id v10 = v18;
    id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v15 = [v9 count];
      *(_DWORD *)buf = 138412802;
      long long v20 = v13;
      __int16 v21 = 2112;
      long long v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, emergency contacts handles count, %lu", buf, 0x20u);
    }
    if (v10)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      if (v9 && [v9 count]) {
        [*(id *)(a1 + 56) addObjectsFromArray:v9];
      }
      uint64_t v16 = *(void *)(a1 + 64);
      id v17 = (void *)[*(id *)(a1 + 56) copy];
      (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);
    }
  }
}

- (void)getiCloudFamilyHandles:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_opt_new();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__SMSuggestionsHelper_getiCloudFamilyHandles___block_invoke;
    v8[3] = &unk_1E6B92168;
    v8[4] = self;
    SEL v11 = a2;
    id v9 = v6;
    id v10 = v5;
    uint64_t v7 = v6;
    [(SMSuggestionsHelper *)self _getFAFamilyMembersFromAAAFamilyWithHandler:v8];
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[SMSuggestionsHelper getiCloudFamilyHandles:]";
      __int16 v14 = 1024;
      int v15 = 670;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __46__SMSuggestionsHelper_getiCloudFamilyHandles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SMSuggestionsHelper_getiCloudFamilyHandles___block_invoke_2;
  block[3] = &unk_1E6B90C68;
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v8;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v12;
  long long v18 = v12;
  id v16 = v5;
  id v17 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __46__SMSuggestionsHelper_getiCloudFamilyHandles___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      __int16 v26 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      __int16 v35 = v25;
      __int16 v36 = 2112;
      __int16 v37 = v26;
      __int16 v38 = 2112;
      uint64_t v39 = v27;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%@, %@, iCloud family query errored, %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v3 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (![v9 memberType] && (objc_msgSend(v9, "isMe") & 1) == 0) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v6);
    }

    id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (objc_class *)objc_opt_class();
      long long v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v14 = [v3 count];
      *(_DWORD *)buf = 138412802;
      __int16 v35 = v12;
      __int16 v36 = 2112;
      __int16 v37 = v13;
      __int16 v38 = 2048;
      uint64_t v39 = v14;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, Adult iCloud family members count, %lu", buf, 0x20u);
    }
    id v28 = 0;
    uint64_t v15 = +[SMSuggestionsHelper getSMHandlesFromFAFamilyMembers:v3 error:&v28];
    id v16 = v28;
    id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      long long v20 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v21 = [v15 count];
      *(_DWORD *)buf = 138412802;
      __int16 v35 = v19;
      __int16 v36 = 2112;
      __int16 v37 = v20;
      __int16 v38 = 2048;
      uint64_t v39 = v21;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, iCloud family handles count, %lu", buf, 0x20u);
    }
    if (v16)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      if (v15 && [v15 count]) {
        [*(id *)(a1 + 56) addObjectsFromArray:v15];
      }
      uint64_t v22 = *(void *)(a1 + 64);
      __int16 v23 = (void *)[*(id *)(a1 + 56) copy];
      (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);
    }
  }
}

- (id)canonicalizeHandles:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) canonicalizedHandle:v12];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)fetchNumFavoriteRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__SMSuggestionsHelper_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke;
  v11[3] = &unk_1E6B951C0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v7;
  id v10 = v8;
  [(SMSuggestionsHelper *)self getFavoriteContactHandles:v11];
}

void __77__SMSuggestionsHelper_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (!v5 || ![v5 count])
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_9;
  }
  id v8 = [*(id *)(a1 + 32) canonicalizeHandles:*(void *)(a1 + 40)];
  id v9 = [*(id *)(a1 + 32) canonicalizeHandles:v5];
  id v10 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v10 intersectSet:v11];
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = (objc_class *)objc_opt_class();
    SEL v14 = NSStringFromClass(v13);
    long long v15 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v16 = 138412802;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    __int16 v20 = 2048;
    uint64_t v21 = [v10 count];
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, Common handle count between receiverHandles & favorite handles: %lu", (uint8_t *)&v16, 0x20u);
  }
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v10 count], 0);

LABEL_10:
}

- (void)fetchNumEmergencyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__SMSuggestionsHelper_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke;
  v11[3] = &unk_1E6B951C0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v7;
  id v10 = v8;
  [(SMSuggestionsHelper *)self getEmergencyHandles:v11];
}

void __78__SMSuggestionsHelper_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (!v5 || ![v5 count])
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_9;
  }
  id v8 = [*(id *)(a1 + 32) canonicalizeHandles:*(void *)(a1 + 40)];
  id v9 = [*(id *)(a1 + 32) canonicalizeHandles:v5];
  id v10 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v10 intersectSet:v11];
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = (objc_class *)objc_opt_class();
    SEL v14 = NSStringFromClass(v13);
    long long v15 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v16 = 138412802;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    __int16 v20 = 2048;
    uint64_t v21 = [v10 count];
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, Common handle count between receiverHandles & emergency handles: %lu", (uint8_t *)&v16, 0x20u);
  }
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v10 count], 0);

LABEL_10:
}

- (void)fetchNumiCloudFamilyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__SMSuggestionsHelper_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke;
  v11[3] = &unk_1E6B951C0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v7;
  id v10 = v8;
  [(SMSuggestionsHelper *)self getiCloudFamilyHandles:v11];
}

void __81__SMSuggestionsHelper_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (!v5 || ![v5 count])
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_9;
  }
  id v8 = [*(id *)(a1 + 32) canonicalizeHandles:*(void *)(a1 + 40)];
  id v9 = [*(id *)(a1 + 32) canonicalizeHandles:v5];
  id v10 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v10 intersectSet:v11];
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = (objc_class *)objc_opt_class();
    SEL v14 = NSStringFromClass(v13);
    long long v15 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v16 = 138412802;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    __int16 v20 = 2048;
    uint64_t v21 = [v10 count];
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, Common handle count between receiverHandles & iCloud family handles: %lu", (uint8_t *)&v16, 0x20u);
  }
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v10 count], 0);

LABEL_10:
}

- (id)_submitMetricForFetchMostLikelyReceiverHandlesDidComplete:(BOOL)a3 didFetchSessionConfigurations:(BOOL)a4 didFetchEmergencyContacts:(BOOL)a5 didFetchICloudFamily:(BOOL)a6 didFetchFavorites:(BOOL)a7 timeout:(double)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  v25[6] = *MEMORY[0x1E4F143B8];
  v24[0] = @"didComplete";
  id v13 = [NSNumber numberWithBool:a3];
  v25[0] = v13;
  v24[1] = @"didFetchSessionConfigurations";
  SEL v14 = [NSNumber numberWithBool:v12];
  v25[1] = v14;
  v24[2] = @"didFetchEmergencyContacts";
  long long v15 = [NSNumber numberWithBool:v11];
  v25[2] = v15;
  v24[3] = @"didFetchICloudFamily";
  int v16 = [NSNumber numberWithBool:v10];
  v25[3] = v16;
  v24[4] = @"didFetchFavorites";
  uint64_t v17 = [NSNumber numberWithBool:v9];
  v25[4] = v17;
  v24[5] = @"timeout";
  __int16 v18 = [NSNumber numberWithDouble:a8];
  v25[5] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:6];

  id v20 = [NSString alloc];
  uint64_t v21 = (void *)[v20 initWithCString:RTAnalyticsEventSafetyMonitorFetchMostLikelyReceiverHandlesCompletion encoding:1];
  log_analytics_submission(v21, v19);
  uint64_t v22 = [NSString stringWithFormat:@"com.apple.%@", v21];
  AnalyticsSendEvent();

  return v19;
}

- (void)fetchMostLikelySessionDestinationsWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__SMSuggestionsHelper_fetchMostLikelySessionDestinationsWithHandler___block_invoke;
    v7[3] = &unk_1E6B90CE0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v10 = "-[SMSuggestionsHelper fetchMostLikelySessionDestinationsWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 858;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __69__SMSuggestionsHelper_fetchMostLikelySessionDestinationsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMostLikelySessionDestinationsWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchMostLikelySessionDestinationsWithHandler:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if ([(SMSuggestionsHelper *)self routineEnabled])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithHandler___block_invoke;
      v15[3] = &unk_1E6B951E8;
      v15[4] = self;
      SEL v17 = a2;
      id v16 = v5;
      [(SMSuggestionsHelper *)self _refreshCurrentLocationWithHandler:v15];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F5CFE8];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25[0] = @"Significant Locations disabled";
      BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      BOOL v10 = [v7 errorWithDomain:v8 code:2 userInfo:v9];

      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
        SEL v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v19 = v13;
        __int16 v20 = 2112;
        uint64_t v21 = v14;
        __int16 v22 = 2112;
        __int16 v23 = @"Significant Locations disabled";
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, authorization error, %@", buf, 0x20u);
      }
      (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, MEMORY[0x1E4F1CBF0], v10);
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[SMSuggestionsHelper _fetchMostLikelySessionDestinationsWithHandler:]";
      __int16 v20 = 1024;
      LODWORD(v21) = 872;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __70__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithHandler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v6;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v13 = v9;
  id v8 = v4;
  dispatch_async(v5, block);
}

void __70__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      BOOL v10 = v6;
      __int16 v11 = 2112;
      id v12 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@, %@, location error, %@", (uint8_t *)&v7, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) _fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler:*(void *)(a1 + 48)];
  }
}

- (void)_fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler:(id)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  if (v37)
  {
    id v5 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v126 = __Block_byref_object_copy__53;
    v127 = __Block_byref_object_dispose__53;
    id v128 = 0;
    uint64_t v6 = objc_opt_new();
    int v7 = objc_opt_new();
    v122[0] = 0;
    v122[1] = v122;
    v122[2] = 0x3032000000;
    v122[3] = __Block_byref_object_copy__53;
    v122[4] = __Block_byref_object_dispose__53;
    id v123 = 0;
    v120[0] = 0;
    v120[1] = v120;
    v120[2] = 0x3032000000;
    v120[3] = __Block_byref_object_copy__53;
    v120[4] = __Block_byref_object_dispose__53;
    id v121 = 0;
    v118[0] = 0;
    v118[1] = v118;
    v118[2] = 0x3032000000;
    v118[3] = __Block_byref_object_copy__53;
    v118[4] = __Block_byref_object_dispose__53;
    id v119 = 0;
    v116[0] = 0;
    v116[1] = v116;
    v116[2] = 0x2020000000;
    char v117 = 0;
    dispatch_group_enter(v5);
    id v8 = [(SMSuggestionsHelper *)self navigationManager];
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke;
    v107[3] = &unk_1E6B95238;
    v107[4] = self;
    v111 = v116;
    v112 = v122;
    v113 = v120;
    SEL v115 = a2;
    id v39 = v7;
    id v108 = v39;
    id v38 = v6;
    id v109 = v38;
    v114 = v118;
    __int16 v9 = v5;
    v110 = v9;
    [v8 fetchNavigationRouteSummaryWithHandler:v107];
    SEL v40 = a2;
    __int16 v41 = self;

    v106[0] = 0;
    v106[1] = v106;
    v106[2] = 0x2020000000;
    v106[3] = 0x7FEFFFFFFFFFFFFFLL;
    v104[0] = 0;
    v104[1] = v104;
    v104[2] = 0x3032000000;
    v104[3] = __Block_byref_object_copy__53;
    v104[4] = __Block_byref_object_dispose__53;
    id v105 = 0;
    uint64_t v100 = 0;
    v101 = &v100;
    uint64_t v102 = 0x2020000000;
    int v103 = 0;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v10 = [&unk_1F3452D00 countByEnumeratingWithState:&v96 objects:v124 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v97 != v11) {
            objc_enumerationMutation(&unk_1F3452D00);
          }
          uint64_t v13 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          SEL v14 = (void *)MEMORY[0x1E016D870]();
          uint64_t v90 = 0;
          v91 = &v90;
          uint64_t v92 = 0x3032000000;
          v93 = __Block_byref_object_copy__53;
          v94 = __Block_byref_object_dispose__53;
          id v95 = 0;
          ++*((_DWORD *)v101 + 6);
          dispatch_group_enter(v9);
          long long v15 = [(SMSuggestionsHelper *)v41 learnedLocationManager];
          uint64_t v16 = [v13 unsignedIntegerValue];
          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3221225472;
          v79[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_125;
          v79[3] = &unk_1E6B95288;
          v79[4] = v41;
          v84 = &v100;
          uint64_t v85 = buf;
          v86 = &v90;
          SEL v89 = a2;
          id v80 = v39;
          BOOL v81 = v9;
          v82 = v13;
          v87 = v106;
          v88 = v104;
          id v83 = v38;
          [v15 fetchLocationsOfInterestWithPlaceType:v16 handler:v79];

          _Block_object_dispose(&v90, 8);
        }
        uint64_t v10 = [&unk_1F3452D00 countByEnumeratingWithState:&v96 objects:v124 count:16];
      }
      while (v10);
    }
    uint64_t v90 = 0;
    v91 = &v90;
    uint64_t v92 = 0x3032000000;
    v93 = __Block_byref_object_copy__53;
    v94 = __Block_byref_object_dispose__53;
    id v95 = (id)objc_opt_new();
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x2020000000;
    char v78 = 0;
    dispatch_group_enter(v9);
    SEL v17 = [(SMSuggestionsHelper *)v41 latestLocationOfTheDevice];
    __int16 v18 = [MEMORY[0x1E4F1C9C8] date];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_129;
    v70[3] = &unk_1E6B952D8;
    v70[4] = v41;
    v74 = v77;
    SEL v76 = a2;
    id v19 = v39;
    id v71 = v19;
    id v20 = v38;
    id v72 = v20;
    id v75 = &v90;
    uint64_t v21 = v9;
    v73 = v21;
    [(SMSuggestionsHelper *)v41 _getNPLOIsWithOnlyHighConfidence:0 location:v17 date:v18 handler:v70];

    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    char v69 = 0;
    dispatch_group_enter(v21);
    id v22 = objc_alloc(MEMORY[0x1E4F99920]);
    LOBYTE(v36) = 0;
    uint64_t v23 = [v22 initWithBatchSize:*MEMORY[0x1E4F99C08] fetchLimit:*MEMORY[0x1E4F99C08] sortBySessionStartDate:1 ascending:0 sessionTypes:&unk_1F3452D18 timeInADayInterval:0 pickOneConfigInTimeInADayInterval:v36 dateInterval:0 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy__53;
    v66[4] = __Block_byref_object_dispose__53;
    id v67 = 0;
    uint64_t v24 = objc_opt_new();
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_136;
    v58[3] = &unk_1E6B953A0;
    v58[4] = v41;
    id v63 = v66;
    SEL v65 = v40;
    id v25 = v19;
    id v59 = v25;
    id v26 = v20;
    id v60 = v26;
    id v27 = v24;
    id v61 = v27;
    id v28 = v21;
    v62 = v28;
    v64 = v68;
    [(SMSuggestionsHelper *)v41 _getSessionConfigurationsWithOptions:v23 handler:v58];
    long long v29 = (void *)v23;
    long long v30 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_146;
    block[3] = &unk_1E6B953F0;
    uint64_t v43 = v28;
    SEL v44 = v41;
    long long v50 = &v100;
    long long v51 = v77;
    long long v52 = v68;
    long long v53 = v118;
    id v54 = v104;
    id v55 = v106;
    char v56 = &v90;
    SEL v57 = v40;
    id v45 = v27;
    id v46 = v26;
    id v49 = v116;
    id v47 = v25;
    id v48 = v37;
    id v31 = v25;
    id v32 = v26;
    id v33 = v27;
    long long v34 = v28;
    dispatch_async(v30, block);

    _Block_object_dispose(v66, 8);
    _Block_object_dispose(v68, 8);

    _Block_object_dispose(v77, 8);
    _Block_object_dispose(&v90, 8);

    _Block_object_dispose(&v100, 8);
    _Block_object_dispose(v104, 8);

    _Block_object_dispose(v106, 8);
    _Block_object_dispose(v116, 8);
    _Block_object_dispose(v118, 8);

    _Block_object_dispose(v120, 8);
    _Block_object_dispose(v122, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSuggestionsHelper _fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 913;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2;
  block[3] = &unk_1E6B95210;
  long long v22 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  id v16 = v5;
  id v17 = v6;
  __int16 v9 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 96);
  uint64_t v23 = v8;
  uint64_t v25 = v10;
  id v19 = v9;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 88);
  id v20 = v11;
  uint64_t v24 = v12;
  id v21 = *(id *)(a1 + 56);
  id v13 = v6;
  id v14 = v5;
  dispatch_async(v7, block);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2(uint64_t a1)
{
  v119[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(a1 + 40));
  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    v1 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      id v80 = (objc_class *)objc_opt_class();
      BOOL v81 = NSStringFromClass(v80);
      v82 = NSStringFromSelector(*(SEL *)(a1 + 112));
      id v83 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v81;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v82;
      *(_WORD *)&buf[22] = 2112;
      v116 = v83;
      _os_log_error_impl(&dword_1D9BFA000, v1, OS_LOG_TYPE_ERROR, "%@, %@, navigation error, %@", buf, 0x20u);
    }
    [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
  }
  id v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 112));
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2048;
    v116 = (uint64_t (*)(uint64_t, uint64_t))v6;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, %@, route summaries count, %lu", buf, 0x20u);
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v92 = [obj countByEnumeratingWithState:&v106 objects:v118 count:16];
  if (v92)
  {
    uint64_t v91 = *(void *)v107;
    uint64_t v85 = *MEMORY[0x1E4F5CFE8];
    uint64_t v86 = *MEMORY[0x1E4F28568];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v107 != v91) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v106 + 1) + 8 * v7);
        context = (void *)MEMORY[0x1E016D870]();
        __int16 v9 = [*(id *)(a1 + 48) distanceCalculator];
        uint64_t v10 = [*(id *)(a1 + 48) latestLocationOfTheDevice];
        id v11 = [v8 destinationMapItem];
        uint64_t v12 = [v11 location];
        id v105 = 0;
        [v9 distanceFromLocation:v10 toLocation:v12 error:&v105];
        double v14 = v13;
        long long v15 = (uint64_t (*)(uint64_t, uint64_t))v105;

        if (v15)
        {
          id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            SEL v65 = (objc_class *)objc_opt_class();
            long long v66 = NSStringFromClass(v65);
            id v67 = NSStringFromSelector(*(SEL *)(a1 + 112));
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v66;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v67;
            *(_WORD *)&buf[22] = 2112;
            v116 = v15;
            _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, %@, distanceToRouteSummaryDestinationError, %@", buf, 0x20u);
          }
          [*(id *)(a1 + 56) addObject:v15];
        }
        else
        {
          id v17 = [*(id *)(a1 + 48) latestLocationOfTheDevice];
          if (!v17) {
            goto LABEL_24;
          }
          uint64_t v18 = [v8 destinationMapItem];
          id v19 = [v18 location];
          BOOL v20 = v19 == 0;

          if (v20)
          {
LABEL_24:
            uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 112));
              id v88 = (id)objc_claimAutoreleasedReturnValue();
              if (v14 == 1.79769313e308)
              {
                id v26 = @"DBL_MAX";
              }
              else
              {
                [NSString stringWithFormat:@"%.3f", *(void *)&v14];
                v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
                id v26 = v87;
              }
              v62 = [*(id *)(a1 + 48) latestLocationOfTheDevice];
              id v63 = [v8 destinationMapItem];
              v64 = [v63 location];
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v25;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v88;
              *(_WORD *)&buf[22] = 2112;
              v116 = (uint64_t (*)(uint64_t, uint64_t))v26;
              *(_WORD *)char v117 = 2112;
              *(void *)&v117[2] = v62;
              *(_WORD *)&v117[10] = 2112;
              *(void *)&v117[12] = v64;
              _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, routeSummary.destinationMapItem.location, %@", buf, 0x34u);

              if (v14 != 1.79769313e308) {
            }
              }
            goto LABEL_53;
          }
          BOOL v21 = v14 == 1.79769313e308 || v14 < 0.0;
          long long v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          uint64_t v23 = v22;
          if (v21)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              long long v68 = (objc_class *)objc_opt_class();
              NSStringFromClass(v68);
              id v69 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 112));
              id v70 = (id)objc_claimAutoreleasedReturnValue();
              id v71 = @"DBL_MAX";
              if (v14 != 1.79769313e308)
              {
                [NSString stringWithFormat:@"%.3f", v14];
                v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
                id v71 = v84;
              }
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v69;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v70;
              *(_WORD *)&buf[22] = 2112;
              v116 = (uint64_t (*)(uint64_t, uint64_t))v71;
              _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@, %@, invalid distance value, %@", buf, 0x20u);
              if (v14 != 1.79769313e308) {
            }
              }
LABEL_53:

            goto LABEL_54;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            id v27 = (objc_class *)objc_opt_class();
            id v28 = NSStringFromClass(v27);
            long long v29 = NSStringFromSelector(*(SEL *)(a1 + 112));
            [NSString stringWithFormat:@"%.3f", *(void *)&v14];
            long long v30 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = v28;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v29;
            *(_WORD *)&buf[22] = 2112;
            v116 = v30;
            *(_WORD *)char v117 = 2048;
            *(void *)&v117[2] = 0x407F400000000000;
            *(_WORD *)&v117[10] = 2048;
            *(void *)&v117[12] = 0x41124F8000000000;
            _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, %@, navigation route, added, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x34u);
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          v116 = __Block_byref_object_copy__53;
          *(void *)char v117 = __Block_byref_object_dispose__53;
          *(void *)&v117[8] = 0;
          uint64_t v99 = 0;
          uint64_t v100 = &v99;
          uint64_t v101 = 0x3032000000;
          uint64_t v102 = __Block_byref_object_copy__53;
          int v103 = __Block_byref_object_dispose__53;
          id v104 = 0;
          dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
          id v32 = [*(id *)(a1 + 48) learnedLocationStore];
          id v33 = [v8 destinationMapItem];
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_116;
          v95[3] = &unk_1E6B90B28;
          long long v97 = buf;
          long long v98 = &v99;
          long long v34 = v31;
          long long v96 = v34;
          [v32 fetchLocationOfInterestWithMapItem:v33 handler:v95];

          __int16 v35 = v34;
          uint64_t v36 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v37 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v35, v37)) {
            goto LABEL_34;
          }
          SEL v89 = [MEMORY[0x1E4F1C9C8] now];
          [v89 timeIntervalSinceDate:v36];
          double v39 = v38;
          SEL v40 = objc_opt_new();
          __int16 v41 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_365];
          id v42 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v43 = [v42 filteredArrayUsingPredicate:v41];
          SEL v44 = [v43 firstObject];

          [v40 submitToCoreAnalytics:v44 type:1 duration:v39];
          id v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v110 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v110, 2u);
          }

          id v46 = (void *)MEMORY[0x1E4F28C58];
          v119[0] = v86;
          *(void *)v110 = @"semaphore wait timeout";
          id v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v119 count:1];
          id v48 = [v46 errorWithDomain:v85 code:15 userInfo:v47];

          if (v48)
          {
            id v49 = v48;
          }
          else
          {
LABEL_34:
            id v49 = 0;
          }

          id v50 = v49;
          if (v100[5])
          {
            long long v51 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              id v72 = (objc_class *)objc_opt_class();
              NSStringFromClass(v72);
              id v73 = (id)objc_claimAutoreleasedReturnValue();
              v74 = NSStringFromSelector(*(SEL *)(a1 + 112));
              id v75 = (void *)v100[5];
              *(_DWORD *)v110 = 138412802;
              *(void *)&v110[4] = v73;
              __int16 v111 = 2112;
              v112 = v74;
              __int16 v113 = 2112;
              id v114 = v75;
              _os_log_error_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_ERROR, "%@, %@, navigationLOIError, %@", v110, 0x20u);
            }
            [*(id *)(a1 + 56) addObject:v100[5]];
          }
          if (v50)
          {
            long long v52 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              SEL v76 = (objc_class *)objc_opt_class();
              NSStringFromClass(v76);
              id v77 = (id)objc_claimAutoreleasedReturnValue();
              char v78 = NSStringFromSelector(*(SEL *)(a1 + 112));
              *(_DWORD *)v110 = 138412802;
              *(void *)&v110[4] = v77;
              __int16 v111 = 2112;
              v112 = v78;
              __int16 v113 = 2112;
              id v114 = v50;
              _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "%@, %@, navigationLOISemaError, %@", v110, 0x20u);
            }
            [*(id *)(a1 + 56) addObject:v50];
          }
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            long long v53 = [*(id *)(a1 + 48) _placeInferenceFromLOI:];
            if (v53) {
              goto LABEL_65;
            }
          }
          id v54 = objc_alloc(MEMORY[0x1E4F5CE70]);
          id v55 = [v8 destinationMapItem];
          char v56 = [v8 destinationMapItem];
          SEL v57 = [v56 location];
          long long v58 = [MEMORY[0x1E4F29128] UUID];
          long long v53 = (void *)[v54 initWithMapItem:v55 userType:0 userTypeSource:0 placeType:0 referenceLocation:v57 confidence:v58 loiIdentifier:0.0];

          if (v53)
          {
LABEL_65:
            [*(id *)(a1 + 64) addObject:v53];
            uint64_t v59 = *(void *)(*(void *)(a1 + 104) + 8);
            uint64_t v61 = *(void *)(v59 + 40);
            id v60 = (id *)(v59 + 40);
            if (!v61) {
              objc_storeStrong(v60, v53);
            }
          }

          _Block_object_dispose(&v99, 8);
          _Block_object_dispose(buf, 8);
        }
LABEL_54:

        ++v7;
      }
      while (v92 != v7);
      uint64_t v79 = [obj countByEnumeratingWithState:&v106 objects:v118 count:16];
      uint64_t v92 = v79;
    }
    while (v79);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_126;
  block[3] = &unk_1E6B95260;
  long long v24 = *(_OWORD *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 88);
  id v17 = v5;
  id v18 = v6;
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 112);
  uint64_t v25 = v8;
  uint64_t v27 = v10;
  id v20 = v9;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  double v13 = *(void **)(a1 + 64);
  id v21 = v11;
  uint64_t v22 = v12;
  long long v26 = *(_OWORD *)(a1 + 96);
  id v23 = v13;
  id v14 = v6;
  id v15 = v5;
  dispatch_async(v7, block);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_126(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  --*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 104) + 8) + 40), *(id *)(v1 + 40));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(v1 + 104) + 8) + 40);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  uint64_t v80 = v1;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v72 = (objc_class *)objc_opt_class();
      id v73 = NSStringFromClass(v72);
      v74 = NSStringFromSelector(*(SEL *)(v1 + 128));
      id v75 = *(__CFString **)(*(void *)(*(void *)(v80 + 104) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      id v93 = v73;
      __int16 v94 = 2112;
      id v95 = v74;
      __int16 v96 = 2112;
      long long v97 = v75;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, %@, placeTypeError, %@", buf, 0x20u);

      uint64_t v1 = v80;
    }

    [*(id *)(v1 + 56) addObject:*(void *)(*(void *)(*(void *)(v1 + 104) + 8) + 40)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = NSStringFromSelector(*(SEL *)(v1 + 128));
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [*(id *)(v80 + 72) unsignedIntegerValue]);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [*(id *)(*(void *)(*(void *)(v80 + 96) + 8) + 40) count];
      *(_DWORD *)buf = 138413058;
      id v93 = v6;
      __int16 v94 = 2112;
      id v95 = v7;
      __int16 v96 = 2112;
      long long v97 = v8;
      __int16 v98 = 2048;
      uint64_t v99 = v9;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, fetched learned LOIs of type, %@, count, %lu,", buf, 0x2Au);

      uint64_t v1 = v80;
    }

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = *(id *)(*(void *)(*(void *)(v1 + 96) + 8) + 40);
    uint64_t v10 = [obj countByEnumeratingWithState:&v88 objects:v106 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v82 = *(void *)v89;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v89 != v82) {
            objc_enumerationMutation(obj);
          }
          double v13 = *(__CFString **)(*((void *)&v88 + 1) + 8 * v12);
          id v14 = (void *)MEMORY[0x1E016D870]();
          id v15 = [*(id *)(v1 + 48) distanceCalculator];
          id v16 = [*(id *)(v1 + 48) latestLocationOfTheDevice];
          uint64_t v86 = v13;
          id v17 = [(__CFString *)v13 location];
          id v18 = [v17 location];
          id v87 = 0;
          [v15 distanceFromLocation:v16 toLocation:v18 error:&v87];
          double v20 = v19;
          id v21 = (__CFString *)v87;

          uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            id v83 = v14;
            uint64_t v23 = v11;
            long long v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            id v25 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(v1 + 128));
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v27 = v21;
            if (v20 == 1.79769313e308)
            {
              id v28 = @"DBL_MAX";
            }
            else
            {
              [NSString stringWithFormat:@"%.3f", *(void *)&v20];
              id v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
              BOOL v81 = v28;
            }
            long long v29 = [*(id *)(v1 + 48) latestLocationOfTheDevice];
            long long v30 = [(__CFString *)v86 location];
            dispatch_semaphore_t v31 = [v30 location];
            *(_DWORD *)buf = 138413570;
            id v93 = v25;
            __int16 v94 = 2112;
            id v95 = v26;
            __int16 v96 = 2112;
            long long v97 = v28;
            __int16 v98 = 2112;
            uint64_t v99 = (uint64_t)v29;
            __int16 v100 = 2112;
            uint64_t v101 = (uint64_t)v31;
            __int16 v102 = 2112;
            uint64_t v103 = (uint64_t)v27;
            _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, learnedLOI.location.location, %@, error, %@", buf, 0x3Eu);

            if (v20 != 1.79769313e308) {
            uint64_t v1 = v80;
            }
            id v14 = v83;
            id v21 = v27;
            uint64_t v11 = v23;
          }

          if (v21)
          {
            id v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              id v49 = (objc_class *)objc_opt_class();
              NSStringFromClass(v49);
              uint64_t v50 = v11;
              v52 = long long v51 = v21;
              long long v53 = NSStringFromSelector(*(SEL *)(v1 + 128));
              *(_DWORD *)buf = 138412802;
              id v93 = v52;
              __int16 v94 = 2112;
              id v95 = v53;
              __int16 v96 = 2112;
              long long v97 = v51;
              _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, %@, distanceError, %@", buf, 0x20u);

              uint64_t v1 = v80;
              id v21 = v51;
              uint64_t v11 = v50;
            }

            [*(id *)(v1 + 56) addObject:v21];
          }
          else
          {
            id v33 = [(__CFString *)v86 location];
            long long v34 = [v33 location];

            if (v34)
            {
              if (v20 < 0.0 || v20 == 1.79769313e308)
              {
                uint64_t v36 = v11;
                dispatch_time_t v37 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  id v63 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v63);
                  id v64 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(*(SEL *)(v1 + 128));
                  id v65 = (id)objc_claimAutoreleasedReturnValue();
                  long long v66 = @"DBL_MAX";
                  if (v20 != 1.79769313e308)
                  {
                    [NSString stringWithFormat:@"%.3f", *(void *)&v20];
                    SEL v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    long long v66 = v76;
                  }
                  *(_DWORD *)buf = 138412802;
                  id v93 = v64;
                  __int16 v94 = 2112;
                  id v95 = v65;
                  __int16 v96 = 2112;
                  long long v97 = v66;
                  _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, invalid distance value, %@", buf, 0x20u);
                  if (v20 != 1.79769313e308) {
                }
                  }
                id v21 = 0;
                uint64_t v11 = v36;
              }
              else
              {
                double v39 = [*(id *)(v1 + 48) _placeInferenceFromLOI:v86];
                SEL v40 = v39;
                if (v39)
                {
                  id v21 = 0;
                  if ([v39 userType] == 1
                    && v20 < *(double *)(*(void *)(*(void *)(v1 + 112) + 8) + 24))
                  {
                    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40), v40);
                    *(double *)(*(void *)(*(void *)(v1 + 112) + 8) + 24) = v20;
                  }
                  BOOL v41 = +[SMSuggestionsHelper isValidDistance:v20];
                  id v42 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
                  if (v41)
                  {
                    if (v43)
                    {
                      SEL v44 = (objc_class *)objc_opt_class();
                      v84 = NSStringFromClass(v44);
                      char v78 = NSStringFromSelector(*(SEL *)(v1 + 128));
                      id v77 = [(__CFString *)v86 place];
                      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v77 type]);
                      id v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      id v46 = [(__CFString *)v86 identifier];
                      id v47 = [NSString stringWithFormat:@"%.3f", *(void *)&v20];
                      *(_DWORD *)buf = 138413826;
                      id v93 = v84;
                      __int16 v94 = 2112;
                      id v95 = v78;
                      __int16 v96 = 2112;
                      long long v97 = v45;
                      __int16 v98 = 2112;
                      uint64_t v99 = (uint64_t)v46;
                      __int16 v100 = 2112;
                      uint64_t v101 = (uint64_t)v47;
                      __int16 v102 = 2048;
                      uint64_t v103 = 0x407F400000000000;
                      __int16 v104 = 2048;
                      uint64_t v105 = 0x41124F8000000000;
                      _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "%@, %@, learned placeType, %@, LOI with identifier, %@, added, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x48u);

                      uint64_t v1 = v80;
                      id v21 = 0;
                    }
                    [*(id *)(v1 + 80) addObject:v40];
                  }
                  else
                  {
                    if (v43)
                    {
                      id v54 = (objc_class *)objc_opt_class();
                      id v55 = NSStringFromClass(v54);
                      char v56 = NSStringFromSelector(*(SEL *)(v1 + 128));
                      SEL v57 = [(__CFString *)v86 identifier];
                      [NSString stringWithFormat:@"%.3f", *(void *)&v20];
                      uint64_t v85 = v14;
                      v59 = uint64_t v58 = v11;
                      *(_DWORD *)buf = 138413570;
                      id v93 = v55;
                      __int16 v94 = 2112;
                      id v95 = v56;
                      __int16 v96 = 2112;
                      long long v97 = v57;
                      __int16 v98 = 2112;
                      uint64_t v99 = (uint64_t)v59;
                      __int16 v100 = 2048;
                      uint64_t v101 = 0x407F400000000000;
                      __int16 v102 = 2048;
                      uint64_t v103 = 0x41124F8000000000;
                      _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "%@, %@, LOI with identifier, %@, skipped, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x3Eu);

                      uint64_t v11 = v58;
                      id v14 = v85;

                      uint64_t v1 = v80;
                      id v21 = 0;
                    }
                  }
                }
                else
                {
                  id v48 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  id v21 = 0;
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    id v67 = (objc_class *)objc_opt_class();
                    long long v68 = NSStringFromClass(v67);
                    id v69 = NSStringFromSelector(*(SEL *)(v1 + 128));
                    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [*(id *)(v80 + 72) unsignedIntegerValue]);
                    id v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    id v93 = v68;
                    __int16 v94 = 2112;
                    id v95 = v69;
                    __int16 v96 = 2112;
                    long long v97 = v70;
                    __int16 v98 = 2112;
                    uint64_t v99 = (uint64_t)v86;
                    _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "%@, %@, learned place type, %@, placeInference is null, learned LOI, %@", buf, 0x2Au);

                    uint64_t v1 = v80;
                    id v21 = 0;
                  }
                }
              }
            }
            else
            {
              double v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                id v60 = (objc_class *)objc_opt_class();
                uint64_t v61 = NSStringFromClass(v60);
                v62 = NSStringFromSelector(*(SEL *)(v1 + 128));
                *(_DWORD *)buf = 138412802;
                id v93 = v61;
                __int16 v94 = 2112;
                id v95 = v62;
                __int16 v96 = 2112;
                long long v97 = v86;
                _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, %@, location not found in learned LOI, %@", buf, 0x20u);

                uint64_t v1 = v80;
              }

              id v21 = 0;
            }
          }

          ++v12;
        }
        while (v11 != v12);
        uint64_t v71 = [obj countByEnumeratingWithState:&v88 objects:v106 count:16];
        uint64_t v11 = v71;
      }
      while (v71);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 64));
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_130;
  block[3] = &unk_1E6B952B0;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v17 = v6;
  uint64_t v18 = v9;
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v23 = v8;
  uint64_t v25 = v11;
  id v19 = v10;
  id v20 = v5;
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 72);
  id v21 = v12;
  uint64_t v24 = v13;
  id v22 = *(id *)(a1 + 56);
  id v14 = v5;
  id v15 = v6;
  dispatch_async(v7, block);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_130(uint64_t a1)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      long long v53 = (objc_class *)objc_opt_class();
      id v54 = NSStringFromClass(v53);
      id v55 = NSStringFromSelector(*(SEL *)(a1 + 96));
      char v56 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v72 = v54;
      __int16 v73 = 2112;
      id v74 = v55;
      __int16 v75 = 2112;
      SEL v76 = v56;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%@, %@, nploiError, %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v67 objects:v85 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v64 = *(void *)v68;
    id v61 = v3;
    do
    {
      uint64_t v6 = 0;
      uint64_t v63 = v5;
      do
      {
        if (*(void *)v68 != v64) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(__CFString **)(*((void *)&v67 + 1) + 8 * v6);
        uint64_t v65 = MEMORY[0x1E016D870]();
        uint64_t v8 = [*(id *)(a1 + 40) distanceCalculator];
        uint64_t v9 = [*(id *)(a1 + 40) latestLocationOfTheDevice];
        uint64_t v10 = [(__CFString *)v7 locationOfInterest];
        uint64_t v11 = [v10 location];
        id v66 = 0;
        [v8 distanceFromLocation:v9 toLocation:v11 error:&v66];
        double v13 = v12;
        id v14 = (__CFString *)v66;

        if (v14)
        {
          id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            SEL v44 = (objc_class *)objc_opt_class();
            id v45 = NSStringFromClass(v44);
            id v46 = NSStringFromSelector(*(SEL *)(a1 + 96));
            *(_DWORD *)buf = 138412802;
            id v72 = v45;
            __int16 v73 = 2112;
            id v74 = v46;
            __int16 v75 = 2112;
            SEL v76 = v14;
            _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, distanceToNPLOIError, %@", buf, 0x20u);
          }
          [*(id *)(a1 + 48) addObject:v14];
LABEL_14:
          id v16 = (void *)v65;
          goto LABEL_49;
        }
        uint64_t v17 = [*(id *)(a1 + 40) latestLocationOfTheDevice];
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v18 = (void *)v17;
        id v19 = [(__CFString *)v7 locationOfInterest];
        id v20 = [v19 location];

        if (v20)
        {
          BOOL v21 = +[SMSuggestionsHelper isValidDistance:v13];
          id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          if (v21)
          {
            if (v23)
            {
              uint64_t v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              id v60 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 96));
              id v25 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v59 = [(__CFString *)v7 locationOfInterest];
              +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", +[RTPlaceInferenceManager learnedPlaceTypeFromLocationOfInterestType:](RTPlaceInferenceManager, "learnedPlaceTypeFromLocationOfInterestType:", [v59 type]));
              id v26 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              uint64_t v27 = [(__CFString *)v7 locationOfInterest];
              id v28 = [v27 identifier];
              if (v13 == 1.79769313e308)
              {
                long long v29 = @"DBL_MAX";
              }
              else
              {
                [NSString stringWithFormat:@"%.3f", *(void *)&v13];
                SEL v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
                long long v29 = v57;
              }
              *(_DWORD *)buf = 138413826;
              id v72 = v60;
              __int16 v73 = 2112;
              id v74 = v25;
              __int16 v75 = 2112;
              SEL v76 = v26;
              __int16 v77 = 2112;
              char v78 = v28;
              __int16 v79 = 2112;
              uint64_t v80 = (uint64_t)v29;
              __int16 v81 = 2048;
              uint64_t v82 = 0x407F400000000000;
              __int16 v83 = 2048;
              uint64_t v84 = 0x41124F8000000000;
              _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, nploi placeType, %@, LOI with identifier, %@, added, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x48u);
              if (v13 != 1.79769313e308) {
            }
              }
            id v47 = +[SMSuggestionsHelper placeInferenceFromNPLOI:v7];
            if (v47)
            {
              [*(id *)(a1 + 64) addObject:v47];
              [(__CFString *)v7 confidence];
              uint64_t v5 = v63;
              if (v48 == 1.0) {
                [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObject:v7];
              }
            }
            else
            {
              id v49 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              uint64_t v5 = v63;
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                uint64_t v50 = (objc_class *)objc_opt_class();
                long long v51 = NSStringFromClass(v50);
                long long v52 = NSStringFromSelector(*(SEL *)(a1 + 96));
                *(_DWORD *)buf = 138412802;
                id v72 = v51;
                __int16 v73 = 2112;
                id v74 = v52;
                __int16 v75 = 2112;
                SEL v76 = v7;
                _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "%@, %@, placeInference is nil, nploi, %@", buf, 0x20u);
              }
            }

            goto LABEL_14;
          }
          if (v23)
          {
            __int16 v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            id v36 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 96));
            id v37 = (id)objc_claimAutoreleasedReturnValue();
            double v38 = [(__CFString *)v7 locationOfInterest];
            double v39 = [v38 identifier];
            if (v13 == 1.79769313e308)
            {
              SEL v40 = @"DBL_MAX";
            }
            else
            {
              [NSString stringWithFormat:@"%.3f", *(void *)&v13];
              uint64_t v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
              SEL v40 = v58;
            }
            *(_DWORD *)buf = 138413570;
            id v72 = v36;
            __int16 v73 = 2112;
            id v74 = v37;
            __int16 v75 = 2112;
            SEL v76 = v39;
            __int16 v77 = 2112;
            char v78 = v40;
            __int16 v79 = 2048;
            uint64_t v80 = 0x407F400000000000;
            __int16 v81 = 2048;
            uint64_t v82 = 0x41124F8000000000;
            _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, LOI with identifier, %@, skipped, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x3Eu);
            id v16 = (void *)v65;
            if (v13 != 1.79769313e308) {
          }
            }
          else
          {
            id v16 = (void *)v65;
          }

          uint64_t v5 = v63;
        }
        else
        {
LABEL_21:
          long long v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            dispatch_semaphore_t v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 96));
            id v33 = (id)objc_claimAutoreleasedReturnValue();
            if (v13 == 1.79769313e308)
            {
              long long v34 = @"DBL_MAX";
            }
            else
            {
              [NSString stringWithFormat:@"%.3f", *(void *)&v13];
              long long v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v62 = v34;
            }
            BOOL v41 = [*(id *)(a1 + 40) latestLocationOfTheDevice];
            id v42 = [(__CFString *)v7 locationOfInterest];
            BOOL v43 = [v42 location];
            *(_DWORD *)buf = 138413314;
            id v72 = v32;
            __int16 v73 = 2112;
            id v74 = v33;
            __int16 v75 = 2112;
            SEL v76 = v34;
            __int16 v77 = 2112;
            char v78 = v41;
            __int16 v79 = 2112;
            uint64_t v80 = (uint64_t)v43;
            _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, nploi.locationOfInterest.location, %@", buf, 0x34u);

            if (v13 != 1.79769313e308) {
            id v3 = v61;
            }
            uint64_t v5 = v63;
          }
          id v16 = (void *)v65;
        }
LABEL_49:

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v67 objects:v85 count:16];
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_137;
  v16[3] = &unk_1E6B95378;
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v17 = v6;
  uint64_t v18 = v9;
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v24 = v8;
  uint64_t v26 = v11;
  id v19 = v10;
  id v20 = v5;
  id v21 = *(id *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 80);
  id v23 = v12;
  uint64_t v25 = v13;
  id v14 = v5;
  id v15 = v6;
  dispatch_async(v7, v16);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_137(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 88;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(id *)(a1 + 32));
  if (*(void *)(*(void *)(*(void *)v2 + 8) + 40))
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      char v56 = (objc_class *)objc_opt_class();
      SEL v57 = NSStringFromClass(v56);
      uint64_t v58 = NSStringFromSelector(*(SEL *)(a1 + 104));
      uint64_t v59 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v57;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2112;
      long long v89 = v59;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@, %@, sessionConfigError, %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  }
  uint64_t v4 = +[SMSuggestionsHelper dedupeSessionConfigurations:*(void *)(a1 + 56)];
  group = dispatch_group_create();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v4;
  uint64_t v68 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v68)
  {
    uint64_t v67 = *(void *)v85;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v85 != v67) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v84 + 1) + 8 * v5);
        uint64_t v7 = (void *)MEMORY[0x1E016D870]();
        uint64_t v8 = [*(id *)(a1 + 40) distanceCalculator];
        uint64_t v9 = [*(id *)(a1 + 40) latestLocationOfTheDevice];
        uint64_t v10 = [v6 destination];
        uint64_t v11 = [v10 location];
        id v83 = 0;
        [v8 distanceFromLocation:v9 toLocation:v11 error:&v83];
        double v13 = v12;
        id v14 = (uint64_t (*)(uint64_t, uint64_t))v83;

        if (v14)
        {
          id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            __int16 v35 = (objc_class *)objc_opt_class();
            id v36 = NSStringFromClass(v35);
            id v37 = NSStringFromSelector(*(SEL *)(a1 + 104));
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v37;
            *(_WORD *)&buf[22] = 2112;
            long long v89 = v14;
            _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, distanceError, %@", buf, 0x20u);
          }
          [*(id *)(a1 + 48) addObject:v14];
        }
        else
        {
          id v16 = [*(id *)(a1 + 40) latestLocationOfTheDevice];
          if (!v16) {
            goto LABEL_20;
          }
          id v17 = [v6 destination];
          uint64_t v18 = [v17 location];
          BOOL v19 = v18 == 0;

          if (v19)
          {
LABEL_20:
            id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v47 = (objc_class *)objc_opt_class();
              NSStringFromClass(v47);
              id v62 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 104));
              id v61 = (id)objc_claimAutoreleasedReturnValue();
              double v48 = @"DBL_MAX";
              if (v13 != 1.79769313e308)
              {
                [NSString stringWithFormat:@"%.3f", *(void *)&v13];
                id v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
                double v48 = v60;
              }
              id v49 = [*(id *)(a1 + 40) latestLocationOfTheDevice];
              uint64_t v50 = [v6 destination];
              long long v51 = [v50 location];
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v62;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v61;
              *(_WORD *)&buf[22] = 2112;
              long long v89 = (uint64_t (*)(uint64_t, uint64_t))v48;
              *(_WORD *)long long v90 = 2112;
              *(void *)&v90[2] = v49;
              *(_WORD *)&v90[10] = 2112;
              *(void *)&v90[12] = v51;
              _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, sessionConfiguration.destination.location, %@", buf, 0x34u);

              if (v13 != 1.79769313e308) {
            }
              }
            goto LABEL_34;
          }
          BOOL v20 = +[SMSuggestionsHelper isValidDistance:v13];
          id v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
          if (!v20)
          {
            if (v22)
            {
              long long v29 = (objc_class *)objc_opt_class();
              NSStringFromClass(v29);
              id v30 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 104));
              id v31 = (id)objc_claimAutoreleasedReturnValue();
              id v32 = [v6 destination];
              id v33 = [v32 location];
              if (v13 == 1.79769313e308)
              {
                long long v34 = @"DBL_MAX";
              }
              else
              {
                [NSString stringWithFormat:@"%.3f", *(void *)&v13];
                uint64_t v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
                long long v34 = v64;
              }
              *(_DWORD *)buf = 138413570;
              *(void *)&uint8_t buf[4] = v30;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v31;
              *(_WORD *)&buf[22] = 2112;
              long long v89 = v33;
              *(_WORD *)long long v90 = 2112;
              *(void *)&v90[2] = v34;
              *(_WORD *)&v90[10] = 2048;
              *(void *)&v90[12] = 0x407F400000000000;
              __int16 v91 = 2048;
              uint64_t v92 = 0x41124F8000000000;
              _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, location, %@, skipped, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x3Eu);
              if (v13 != 1.79769313e308) {
            }
              }
LABEL_34:

            goto LABEL_35;
          }
          if (v22)
          {
            id v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 104));
            id v25 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = [v6 destination];
            uint64_t v27 = [v26 location];
            if (v13 == 1.79769313e308)
            {
              id v28 = @"DBL_MAX";
            }
            else
            {
              [NSString stringWithFormat:@"%.3f", *(void *)&v13];
              uint64_t v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
              id v28 = v63;
            }
            *(_DWORD *)buf = 138413570;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            long long v89 = v27;
            *(_WORD *)long long v90 = 2112;
            *(void *)&v90[2] = v28;
            *(_WORD *)&v90[10] = 2048;
            *(void *)&v90[12] = 0x407F400000000000;
            __int16 v91 = 2048;
            uint64_t v92 = 0x41124F8000000000;
            _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, session location, %@, added, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x3Eu);
            if (v13 != 1.79769313e308) {
          }
            }
          dispatch_group_enter(group);
          id v38 = objc_alloc(MEMORY[0x1E4F5CE48]);
          double v39 = (objc_class *)objc_opt_class();
          SEL v40 = NSStringFromClass(v39);
          BOOL v41 = (void *)[v38 initWithUseBackgroundTraits:0 analyticsIdentifier:v40];

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          long long v89 = __Block_byref_object_copy__53;
          *(void *)long long v90 = __Block_byref_object_dispose__53;
          *(void *)&v90[8] = 0;
          v81[0] = 0;
          v81[1] = v81;
          v81[2] = 0x3032000000;
          v81[3] = __Block_byref_object_copy__53;
          v81[4] = __Block_byref_object_dispose__53;
          id v82 = 0;
          id v42 = [*(id *)(a1 + 40) mapServiceManager];
          BOOL v43 = [v6 destination];
          SEL v44 = [v43 destinationMapItem];
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_139;
          v72[3] = &unk_1E6B95350;
          id v45 = *(void **)(a1 + 48);
          v72[4] = *(void *)(a1 + 40);
          char v78 = buf;
          uint64_t v46 = *(void *)(a1 + 104);
          __int16 v79 = v81;
          uint64_t v80 = v46;
          id v73 = v45;
          id v74 = group;
          __int16 v75 = v6;
          id v76 = *(id *)(a1 + 64);
          id v77 = *(id *)(a1 + 72);
          [v42 fetchMapItemFromHandle:v44 options:v41 handler:v72];

          _Block_object_dispose(v81, 8);
          _Block_object_dispose(buf, 8);
        }
LABEL_35:

        ++v5;
      }
      while (v68 != v5);
      uint64_t v52 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
      uint64_t v68 = v52;
    }
    while (v52);
  }

  long long v53 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_145;
  block[3] = &unk_1E6B90E98;
  id v54 = *(id *)(a1 + 80);
  uint64_t v55 = *(void *)(a1 + 96);
  id v70 = v54;
  uint64_t v71 = v55;
  dispatch_group_notify(group, v53, block);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_140;
  block[3] = &unk_1E6B95300;
  long long v23 = *(_OWORD *)(a1 + 80);
  id v15 = v5;
  id v16 = v6;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 96);
  id v18 = v8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void **)(a1 + 64);
  id v19 = v9;
  uint64_t v20 = v10;
  id v21 = v11;
  id v22 = *(id *)(a1 + 72);
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v7, block);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_140(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), *(id *)(a1 + 40));
  if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 112));
      uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      __int16 v35 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%@, %@, mapItemError, %@", buf, 0x20u);
    }
    [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
LABEL_5:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    return;
  }
  BOOL v3 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) == 0;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 112));
      id v21 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      __int16 v35 = v21;
      LOWORD(v36) = 2112;
      *(void *)((char *)&v36 + 2) = v22;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@, %@, error creating mapItem, %@, error, %@", buf, 0x2Au);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    uint64_t v7 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Hydrated mapItem, %@ session configuration, %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v35 = __Block_byref_object_copy__53;
  *(void *)&long long v36 = __Block_byref_object_dispose__53;
  *((void *)&v36 + 1) = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__53;
  v32[4] = __Block_byref_object_dispose__53;
  id v33 = 0;
  uint64_t v8 = [*(id *)(a1 + 48) learnedLocationStore];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_141;
  v23[3] = &unk_1E6B95328;
  uint64_t v10 = *(void **)(a1 + 56);
  v23[4] = *(void *)(a1 + 48);
  long long v29 = v32;
  id v30 = buf;
  uint64_t v31 = *(void *)(a1 + 112);
  id v24 = v10;
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v13 = *(void **)(a1 + 80);
  id v25 = v11;
  uint64_t v26 = v12;
  id v27 = v13;
  id v28 = *(id *)(a1 + 88);
  [v8 fetchLocationOfInterestWithMapItem:v9 handler:v23];

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(buf, 8);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_142;
  block[3] = &unk_1E6B95300;
  long long v23 = *(_OWORD *)(a1 + 80);
  id v15 = v5;
  id v16 = v6;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 96);
  id v18 = v8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = *(void **)(a1 + 64);
  id v19 = v9;
  uint64_t v20 = v10;
  id v21 = v11;
  id v22 = *(id *)(a1 + 72);
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v7, block);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_142(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = (objc_class *)objc_opt_class();
      id v38 = NSStringFromClass(v37);
      double v39 = NSStringFromSelector(*(SEL *)(a1 + 112));
      SEL v40 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      int v46 = 138412802;
      id v47 = v38;
      __int16 v48 = 2112;
      id v49 = v39;
      __int16 v50 = 2112;
      long long v51 = v40;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, %@, sessionConfigLOIError, %@", (uint8_t *)&v46, 0x20u);
    }
    [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
LABEL_5:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 112));
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    id v9 = *(void **)(a1 + 72);
    int v46 = 138413058;
    id v47 = v6;
    __int16 v48 = 2112;
    id v49 = v7;
    __int16 v50 = 2112;
    long long v51 = v8;
    __int16 v52 = 2112;
    long long v53 = v9;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, fetched learned LOI, %@, configuration, %@", (uint8_t *)&v46, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)) {
    goto LABEL_5;
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 112));
    id v14 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) place];
    id v15 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v14 type]);
    id v16 = [*(id *)(a1 + 72) destination];
    uint64_t v17 = [v16 location];
    int v46 = 138413058;
    id v47 = v12;
    __int16 v48 = 2112;
    id v49 = v13;
    __int16 v50 = 2112;
    long long v51 = v15;
    __int16 v52 = 2112;
    long long v53 = v17;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, place type, %@, location, %@", (uint8_t *)&v46, 0x2Au);
  }
  id v18 = [*(id *)(a1 + 48) _placeInferenceFromLOI:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
  id v19 = v18;
  if (!v18
    || ([v18 mapItem], uint64_t v20 = objc_claimAutoreleasedReturnValue(), v20, !v20))
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = (objc_class *)objc_opt_class();
      long long v34 = NSStringFromClass(v33);
      __int16 v35 = NSStringFromSelector(*(SEL *)(a1 + 112));
      long long v36 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      int v46 = 138413058;
      id v47 = v34;
      __int16 v48 = 2112;
      id v49 = v35;
      __int16 v50 = 2112;
      long long v51 = v19;
      __int16 v52 = 2112;
      long long v53 = v36;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, %@, place inference is nill or it doens't have map item, %@, destinationLearnedLOI, %@", (uint8_t *)&v46, 0x2Au);
    }
    goto LABEL_20;
  }
  [*(id *)(a1 + 80) addObject:v19];
  id v21 = *(void **)(a1 + 88);
  id v22 = [v19 mapItem];
  uint64_t v23 = [v21 objectForKey:v22];
  if (!v23)
  {

LABEL_19:
    BOOL v41 = [SMFenceInfo alloc];
    id v32 = [*(id *)(a1 + 72) sessionStartDate];
    id v42 = [*(id *)(a1 + 72) destination];
    [v42 radius];
    BOOL v43 = -[SMFenceInfo initWithDate:fenceRadius:](v41, "initWithDate:fenceRadius:", v32);
    SEL v44 = *(void **)(a1 + 88);
    id v45 = [v19 mapItem];
    [v44 setObject:v43 forKeyedSubscript:v45];

LABEL_20:
    goto LABEL_21;
  }
  uint64_t v24 = (void *)v23;
  id v25 = *(void **)(a1 + 88);
  uint64_t v26 = [v19 mapItem];
  id v27 = [v25 objectForKey:v26];
  id v28 = [v27 date];
  long long v29 = [*(id *)(a1 + 72) sessionStartDate];
  id v30 = [v28 laterDate:v29];
  uint64_t v31 = [*(id *)(a1 + 72) sessionStartDate];

  if (v30 == v31) {
    goto LABEL_19;
  }
LABEL_21:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_145(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_146(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  BOOL v4 = dispatch_group_wait(v2, v3) == 0;
  id v5 = [*(id *)(a1 + 40) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  long long v6 = *(_OWORD *)(a1 + 96);
  long long v15 = *(_OWORD *)(a1 + 80);
  long long v16 = v6;
  long long v7 = *(_OWORD *)(a1 + 128);
  long long v17 = *(_OWORD *)(a1 + 112);
  v10[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_3;
  v10[3] = &unk_1E6B953C8;
  uint64_t v8 = *(void **)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  BOOL v21 = v4;
  uint64_t v9 = *(void *)(a1 + 144);
  uint64_t v19 = 0x4014000000000000;
  uint64_t v20 = v9;
  long long v18 = v7;
  id v11 = v8;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 72);
  dispatch_async(v5, v10);
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _submitMetricForFetchMostLikelySessionDestinationsWithRefreshedLocationDidComplete:*(unsigned __int8 *)(a1 + 152) didFetchNavigationRouteSummary:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) didFetchLOIs:*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 0 didFetchNPLOIs:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) didFetchSessionConfigurations:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) timeout:*(double *)(a1 + 136)];
  if (!*(unsigned char *)(a1 + 152))
  {
    dispatch_time_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      long long v6 = NSStringFromSelector(*(SEL *)(a1 + 144));
      *(_DWORD *)buf = 138412802;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@, %@, timed out waiting for completion, metric, %@", buf, 0x20u);
    }
  }
  [*(id *)(a1 + 32) _computeMostlikelySessionDestinations:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) closestHome:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) distanceToClosestHome:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) nploisWithValidDistanceAndHighConfidence:*(void *)(a1 + 40) fenceSizeForMapItem:*(void *)(a1 + 48) placeInferences:*(void *)(a1 + 56) errors:*(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) handler:*(void *)(a1 + 64)];
}

- (id)_submitMetricForFetchMostLikelySessionDestinationsWithRefreshedLocationDidComplete:(BOOL)a3 didFetchNavigationRouteSummary:(BOOL)a4 didFetchLOIs:(BOOL)a5 didFetchNPLOIs:(BOOL)a6 didFetchSessionConfigurations:(BOOL)a7 timeout:(double)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  v25[6] = *MEMORY[0x1E4F143B8];
  v24[0] = @"didComplete";
  uint64_t v13 = [NSNumber numberWithBool:a3];
  v25[0] = v13;
  v24[1] = @"didFetchNavigationRouteSummary";
  id v14 = [NSNumber numberWithBool:v12];
  v25[1] = v14;
  v24[2] = @"didFetchLOIs";
  long long v15 = [NSNumber numberWithBool:v11];
  void v25[2] = v15;
  v24[3] = @"didFetchNPLOIs";
  long long v16 = [NSNumber numberWithBool:v10];
  v25[3] = v16;
  v24[4] = @"didFetchSessionConfigurations";
  long long v17 = [NSNumber numberWithBool:v9];
  v25[4] = v17;
  v24[5] = @"timeout";
  long long v18 = [NSNumber numberWithDouble:a8];
  v25[5] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:6];

  id v20 = [NSString alloc];
  BOOL v21 = (void *)[v20 initWithCString:RTAnalyticsEventSafetyMonitorFetchMostLikelySessionDestinationsWithRefreshedLocationCompletion encoding:1];
  log_analytics_submission(v21, v19);
  id v22 = [NSString stringWithFormat:@"com.apple.%@", v21];
  AnalyticsSendEvent();

  return v19;
}

- (void)_computeMostlikelySessionDestinations:(id)a3 closestHome:(id)a4 distanceToClosestHome:(double)a5 nploisWithValidDistanceAndHighConfidence:(id)a6 fenceSizeForMapItem:(id)a7 placeInferences:(id)a8 errors:(id)a9 handler:(id)a10
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v111 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v101 = (void (**)(id, void *, void *, void *))a10;
  if (v16)
  {
    BOOL v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      uint64_t v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v124 = v23;
      __int16 v125 = 2112;
      uint64_t v126 = (uint64_t)v24;
      __int16 v127 = 2112;
      uint64_t v128 = (uint64_t)v16;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, setting navigation session destination as mostLikelySessionDestination, %@", buf, 0x20u);
    }
    id v25 = v16;
LABEL_5:
    id v26 = v25;
    goto LABEL_6;
  }
  if (!v17) {
    goto LABEL_60;
  }
  if (+[SMSuggestionsHelper isValidDistance:a5])
  {
    id v83 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      long long v84 = (objc_class *)objc_opt_class();
      long long v85 = NSStringFromClass(v84);
      long long v86 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v124 = v85;
      __int16 v125 = 2112;
      uint64_t v126 = (uint64_t)v86;
      __int16 v127 = 2112;
      uint64_t v128 = (uint64_t)v17;
      __int16 v129 = 2048;
      double v130 = a5;
      _os_log_impl(&dword_1D9BFA000, v83, OS_LOG_TYPE_INFO, "%@, %@, setting closest home as mostLikelySessionDestination, %@, distance to home, %.3f", buf, 0x2Au);
    }
    id v25 = v17;
    goto LABEL_5;
  }
  if ([v18 count])
  {
    long long v87 = [v18 firstObject];
    long long v88 = +[SMSuggestionsHelper placeInferenceFromNPLOI:v87];

    id v26 = v88;
    if (!v26)
    {
      long long v89 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        long long v97 = (objc_class *)objc_opt_class();
        __int16 v98 = NSStringFromClass(v97);
        uint64_t v99 = NSStringFromSelector(a2);
        __int16 v100 = [v18 firstObject];
        *(_DWORD *)buf = 138412802;
        v124 = v98;
        __int16 v125 = 2112;
        uint64_t v126 = (uint64_t)v99;
        __int16 v127 = 2112;
        uint64_t v128 = (uint64_t)v100;
        _os_log_error_impl(&dword_1D9BFA000, v89, OS_LOG_TYPE_ERROR, "%@, %@, placeInference is nil, nploi, %@", buf, 0x20u);
      }
    }
    long long v90 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      __int16 v91 = (objc_class *)objc_opt_class();
      uint64_t v92 = NSStringFromClass(v91);
      id v93 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v124 = v92;
      __int16 v125 = 2112;
      uint64_t v126 = (uint64_t)v93;
      __int16 v127 = 2112;
      uint64_t v128 = (uint64_t)v26;
      _os_log_impl(&dword_1D9BFA000, v90, OS_LOG_TYPE_INFO, "%@, %@, setting first nploi with high confidence as mostLikelySessionDestination, %@", buf, 0x20u);
    }
  }
  else
  {
LABEL_60:
    id v26 = 0;
  }
LABEL_6:
  id v27 = [v26 mapItem];
  id v28 = [v111 objectForKey:v27];

  uint64_t v105 = v20;
  if (v28)
  {
    long long v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = (objc_class *)objc_opt_class();
      uint64_t v31 = NSStringFromClass(v30);
      id v32 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v124 = v31;
      __int16 v125 = 2112;
      uint64_t v126 = (uint64_t)v32;
      __int16 v127 = 2112;
      uint64_t v128 = (uint64_t)v26;
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, %@, session configuration for mostLikelySessionDestination exists, %@", buf, 0x20u);
    }
    id v121 = 0;
    id v33 = +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceInfo:v28 placeInference:v26 error:&v121];
    id v34 = v121;
    if (v34 || !v33)
    {
      __int16 v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v94 = (objc_class *)objc_opt_class();
        __int16 v113 = NSStringFromClass(v94);
        uint64_t v95 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v124 = v113;
        __int16 v125 = 2112;
        uint64_t v126 = v95;
        __int16 v96 = (void *)v95;
        __int16 v127 = 2112;
        uint64_t v128 = (uint64_t)v26;
        _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "%@, %@, error creating masquerading place inference, defaulting to original, %@", buf, 0x20u);

        id v20 = v105;
      }

      id v36 = v26;
      [v20 addObject:v34];
      id v33 = v36;
    }

    id v26 = v33;
  }
  long long v106 = v26;
  uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    id v38 = (objc_class *)objc_opt_class();
    double v39 = NSStringFromClass(v38);
    SEL v40 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v124 = v39;
    __int16 v125 = 2112;
    uint64_t v126 = (uint64_t)v40;
    __int16 v127 = 2112;
    uint64_t v128 = (uint64_t)v26;
    _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, %@, final mostLikelySessionDestination, %@", buf, 0x20u);
  }
  BOOL v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    id v42 = (objc_class *)objc_opt_class();
    BOOL v43 = NSStringFromClass(v42);
    SEL v44 = NSStringFromSelector(a2);
    uint64_t v45 = [v19 count];
    *(_DWORD *)buf = 138412802;
    v124 = v43;
    __int16 v125 = 2112;
    uint64_t v126 = (uint64_t)v44;
    __int16 v127 = 2048;
    uint64_t v128 = v45;
    _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "%@, %@, final place inferences count, %lu", buf, 0x20u);
  }
  int v46 = [(SMSuggestionsHelper *)self _dedupePlaceInferencesWithOrder:v19];
  id v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    __int16 v48 = (objc_class *)objc_opt_class();
    id v49 = NSStringFromClass(v48);
    __int16 v50 = NSStringFromSelector(a2);
    uint64_t v51 = [v46 count];
    *(_DWORD *)buf = 138412802;
    v124 = v49;
    __int16 v125 = 2112;
    uint64_t v126 = (uint64_t)v50;
    __int16 v127 = 2048;
    uint64_t v128 = v51;
    _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "%@, %@, final deduped place inferences count, %lu", buf, 0x20u);
  }
  __int16 v102 = v19;
  uint64_t v103 = v18;
  __int16 v104 = v17;

  long long v109 = objc_opt_new();
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = v46;
  uint64_t v112 = [obj countByEnumeratingWithState:&v117 objects:v122 count:16];
  if (v112)
  {
    uint64_t v110 = *(void *)v118;
    do
    {
      uint64_t v52 = 0;
      long long v53 = v28;
      do
      {
        if (*(void *)v118 != v110) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = *(void **)(*((void *)&v117 + 1) + 8 * v52);
        uint64_t v55 = (void *)MEMORY[0x1E016D870]();
        char v56 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          SEL v57 = (objc_class *)objc_opt_class();
          uint64_t v58 = NSStringFromClass(v57);
          uint64_t v59 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v124 = v58;
          __int16 v125 = 2112;
          uint64_t v126 = (uint64_t)v59;
          __int16 v127 = 2112;
          uint64_t v128 = (uint64_t)v54;
          _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "%@, %@, deduped place inference, %@", buf, 0x20u);
        }
        id v60 = [v54 mapItem];
        id v28 = [v111 objectForKey:v60];

        id v61 = v54;
        id v62 = v61;
        if (v28)
        {
          uint64_t v63 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            uint64_t v64 = (objc_class *)objc_opt_class();
            uint64_t v65 = NSStringFromClass(v64);
            id v66 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v124 = v65;
            __int16 v125 = 2112;
            uint64_t v126 = (uint64_t)v66;
            __int16 v127 = 2112;
            uint64_t v128 = (uint64_t)v62;
            _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_INFO, "%@, %@, session configuration for place inference exists, %@", buf, 0x20u);
          }
          id v116 = 0;
          uint64_t v67 = +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceInfo:v28 placeInference:v62 error:&v116];
          id v68 = v116;
          if (v68 || !v67)
          {
            long long v69 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              char v78 = (objc_class *)objc_opt_class();
              uint64_t v107 = NSStringFromClass(v78);
              uint64_t v79 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v124 = v107;
              __int16 v125 = 2112;
              uint64_t v126 = v79;
              uint64_t v80 = (void *)v79;
              __int16 v127 = 2112;
              uint64_t v128 = (uint64_t)v106;
              _os_log_error_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_ERROR, "%@, %@, error creating masquerading place inference, defaulting to original, %@", buf, 0x20u);
            }
          }

          if (v67)
          {
LABEL_37:
            [v109 addObject:v67];
            goto LABEL_42;
          }
        }
        else
        {
          uint64_t v67 = v61;
          if (v61) {
            goto LABEL_37;
          }
        }
        id v70 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          __int16 v75 = (objc_class *)objc_opt_class();
          id v76 = NSStringFromClass(v75);
          id v77 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v124 = v76;
          __int16 v125 = 2112;
          uint64_t v126 = (uint64_t)v77;
          _os_log_error_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_ERROR, "%@, %@, finalCandidateSessionDestination is nil", buf, 0x16u);
        }
LABEL_42:
        uint64_t v71 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          id v72 = (objc_class *)objc_opt_class();
          id v73 = NSStringFromClass(v72);
          id v74 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v124 = v73;
          __int16 v125 = 2112;
          uint64_t v126 = (uint64_t)v74;
          __int16 v127 = 2112;
          uint64_t v128 = (uint64_t)v67;
          _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_INFO, "%@, %@, final candidate session destination, %@", buf, 0x20u);
        }
        ++v52;
        long long v53 = v28;
      }
      while (v112 != v52);
      uint64_t v112 = [obj countByEnumeratingWithState:&v117 objects:v122 count:16];
    }
    while (v112);
  }

  __int16 v81 = _RTSafeArray();
  id v82 = _RTMultiErrorCreate();
  v101[2](v101, v106, v109, v82);
}

- (void)onAuthorizationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SMSuggestionsHelper_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__SMSuggestionsHelper_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onAuthorizationNotification:*(void *)(a1 + 40)];
}

- (void)_onAuthorizationNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  long long v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    -[SMSuggestionsHelper setRoutineEnabled:](self, "setRoutineEnabled:", [v5 enabled]);
    BOOL v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [(SMSuggestionsHelper *)self routineEnabled];
      BOOL v11 = @"NO";
      if (v10) {
        BOOL v11 = @"YES";
      }
      int v14 = 138412290;
      long long v15 = v11;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Updated routine enabled %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    BOOL v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      BOOL v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v5 name];
      int v14 = 138412546;
      long long v15 = v12;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)refreshCurrentLocationWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SMSuggestionsHelper_refreshCurrentLocationWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__SMSuggestionsHelper_refreshCurrentLocationWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshCurrentLocationWithHandler:*(void *)(a1 + 40)];
}

- (void)_refreshCurrentLocationWithHandler:(id)a3
{
  id v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__53;
  v20[4] = __Block_byref_object_dispose__53;
  id v21 = 0;
  id v6 = (void *)MEMORY[0x1E016D870]();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__53;
  v18[4] = __Block_byref_object_dispose__53;
  id v19 = 0;
  long long v7 = [RTLocationRequestOptions alloc];
  id v8 = [(RTLocationRequestOptions *)v7 initWithDesiredAccuracy:1 horizontalAccuracy:1 maxAge:*MEMORY[0x1E4F1E6D8] yieldLastLocation:100.0 timeout:60.0 fallback:4.0 fallbackHorizontalAccuracy:100.0 fallbackMaxAge:3600.0];
  BOOL v9 = [(SMSuggestionsHelper *)self locationManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SMSuggestionsHelper__refreshCurrentLocationWithHandler___block_invoke;
  v12[3] = &unk_1E6B95440;
  v12[4] = self;
  long long v15 = v20;
  __int16 v16 = v18;
  SEL v17 = a2;
  BOOL v10 = v8;
  uint64_t v13 = v10;
  id v11 = v5;
  id v14 = v11;
  [v9 fetchCurrentLocationWithOptions:v10 handler:v12];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

void __58__SMSuggestionsHelper__refreshCurrentLocationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SMSuggestionsHelper__refreshCurrentLocationWithHandler___block_invoke_2;
  v11[3] = &unk_1E6B95418;
  long long v17 = *(_OWORD *)(a1 + 56);
  id v12 = v6;
  id v13 = v5;
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 72);
  id v15 = v8;
  id v16 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void __58__SMSuggestionsHelper__refreshCurrentLocationWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      uint64_t v11 = *(void *)(a1 + 56);
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      id v13 = [v12 date];
      [v13 timeIntervalSinceNow];
      int v28 = 138413314;
      long long v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      __int16 v35 = v12;
      __int16 v36 = 2048;
      double v37 = -v14;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, Success, YES, options, %@, location, %@, age, %.3f", (uint8_t *)&v28, 0x34u);
    }
    id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 88));
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      int v28 = 138412802;
      long long v29 = v17;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, %@, setting latestLocationOfTheDevice as fetchedLastLocation, %@", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  }
  else
  {
    if (v7)
    {
      id v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      uint64_t v23 = NSStringFromSelector(*(SEL *)(a1 + 88));
      uint64_t v24 = *(void *)(a1 + 56);
      id v25 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      int v28 = 138413058;
      long long v29 = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v24;
      __int16 v34 = 2112;
      __int16 v35 = v25;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, Success, NO, options, %@, error, %@", (uint8_t *)&v28, 0x2Au);
    }
    uint64_t v20 = 0;
  }
  [*(id *)(a1 + 48) setLatestLocationOfTheDevice:v20];
  uint64_t v26 = *(void *)(a1 + 64);
  id v27 = [*(id *)(a1 + 48) latestLocationOfTheDevice];
  (*(void (**)(uint64_t, void *, void))(v26 + 16))(v26, v27, *(void *)(a1 + 32));
}

- (void)getSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SMSuggestionsHelper_getSessionConfigurationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __67__SMSuggestionsHelper_getSessionConfigurationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSessionConfigurationsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_getSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a4;
  if (!v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[SMSuggestionsHelper _getSessionConfigurationsWithOptions:handler:]";
      __int16 v20 = 1024;
      int v21 = 1787;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

    id v10 = [MEMORY[0x1E4F1C978] array];
    v8[2](v8, v10, 0);
  }
  uint64_t v11 = [(SMSuggestionsHelper *)self sessionStore];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__SMSuggestionsHelper__getSessionConfigurationsWithOptions_handler___block_invoke;
  v14[3] = &unk_1E6B91A68;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  SEL v17 = a2;
  id v12 = v8;
  id v13 = v7;
  [v11 fetchSessionConfigurationsWithOptions:v13 handler:v14];
}

void __68__SMSuggestionsHelper__getSessionConfigurationsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138413570;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = [v5 count];
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, options, %@, session configurations count, %lu, fetched session configurations, %@, fetch error, %@", (uint8_t *)&v12, 0x3Eu);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SMSuggestionsHelper_getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke;
  block[3] = &unk_1E6B922F8;
  BOOL v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __77__SMSuggestionsHelper_getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getNPLOIsWithOnlyHighConfidence:*(unsigned __int8 *)(a1 + 64) location:*(void *)(a1 + 40) date:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 handler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__53;
  v26[4] = __Block_byref_object_dispose__53;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__53;
  v24[4] = __Block_byref_object_dispose__53;
  id v25 = [MEMORY[0x1E4F1C978] array];
  id v14 = [(SMSuggestionsHelper *)self deviceLocationPredictor];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__SMSuggestionsHelper__getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke;
  v17[3] = &unk_1E6B95488;
  id v20 = v24;
  BOOL v21 = v26;
  id v15 = v13;
  id v19 = v15;
  v17[4] = self;
  SEL v22 = a2;
  BOOL v23 = a3;
  id v16 = v11;
  id v18 = v16;
  [v14 fetchNextPredictedLocationsOfInterestFromLocation:v16 startDate:v12 timeInterval:v17 handler:3600.0];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

void __78__SMSuggestionsHelper__getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x1E4F1C978] array];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v11 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_38];
  id v12 = [v10 filteredArrayUsingPredicate:v11];

  id v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_164];
  id v14 = [v12 filteredArrayUsingPredicate:v13];

  id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    id v18 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    uint64_t v19 = [v12 count];
    id v20 = v6;
    if (*(unsigned char *)(a1 + 80)) {
      BOOL v21 = @"YES";
    }
    else {
      BOOL v21 = @"NO";
    }
    uint64_t v22 = [v14 count];
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413826;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    int v28 = v18;
    __int16 v29 = 2048;
    uint64_t v30 = v24;
    __int16 v31 = 2048;
    uint64_t v32 = v19;
    __int16 v33 = 2112;
    __int16 v34 = v21;
    id v6 = v20;
    __int16 v35 = 2048;
    uint64_t v36 = v22;
    __int16 v37 = 2112;
    uint64_t v38 = v23;
    _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, %@, nplois fetched count, %lu, nploisWithoutOnlyVehicleSource count, %lu, only high confidence, %@, nploisWithOnlyHighConfidenceAndWithoutOnlyVehicleSource, %lu, w.r.t the location, %@", buf, 0x48u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __78__SMSuggestionsHelper__getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 sources];
  if ([v3 count] == 1)
  {
    id v4 = [v2 sources];
    id v5 = [v4 firstObject];
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v6 = 1;
  }

  return v6 & 1;
}

BOOL __78__SMSuggestionsHelper__getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 confidence];
  return v2 == 1.0;
}

+ (id)getSMHandlesFromRTContacts:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v35 = "+[SMSuggestionsHelper getSMHandlesFromRTContacts:error:]";
      __int16 v36 = 1024;
      LODWORD(v37) = 1873;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contacts (in %s:%d)", buf, 0x12u);
    }
  }
  id v9 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    aSelector = a2;
    obuint64_t j = v10;
    id v13 = 0;
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      uint64_t v15 = 0;
      id v16 = v13;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * v15);
        id v18 = (void *)MEMORY[0x1E016D870]();
        id v29 = v16;
        uint64_t v19 = [a1 getSMHandlesFromRTContact:v17 error:&v29];
        id v13 = v29;

        if (a4 && v13)
        {
          id v20 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            id v25 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412802;
            __int16 v35 = v25;
            __int16 v36 = 2112;
            __int16 v37 = v26;
            __int16 v38 = 2112;
            id v39 = v13;
            _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
          }
          id v13 = v13;
          *a4 = v13;
          id v21 = v9;

          id v10 = obj;

          goto LABEL_22;
        }
        [v9 addObjectsFromArray:v19];

        ++v15;
        id v16 = v13;
      }
      while (v12 != v15);
      id v10 = obj;
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }

  if (a4) {
    *a4 = v13;
  }
  id v22 = v9;
LABEL_22:

  return v9;
}

+ (id)getSMHandlesFromRTContact:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v51 = "+[SMSuggestionsHelper getSMHandlesFromRTContact:error:]";
      __int16 v52 = 1024;
      LODWORD(v53) = 1892;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contact (in %s:%d)", buf, 0x12u);
    }
  }
  char v6 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  __int16 v37 = v4;
  id v7 = [v4 phoneNumbers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x1E016D870]();
        uint64_t v14 = [MEMORY[0x1E4F6E6D8] validateAndCleanupID:v12];
        if (v14)
        {
          id v15 = objc_alloc(MEMORY[0x1E4F99888]);
          id v16 = [MEMORY[0x1E4F1C978] array];
          uint64_t v17 = (void *)[v15 initWithPrimaryHandle:v14 secondaryHandles:v16];
          [v6 addObject:v17];
        }
        else
        {
          id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            __int16 v38 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v19 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            uint64_t v51 = v38;
            __int16 v52 = 2112;
            uint64_t v53 = v19;
            id v20 = (void *)v19;
            __int16 v54 = 2112;
            uint64_t v55 = v12;
            _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v9);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v21 = [v37 emailAddresses];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v42;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v42 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v41 + 1) + 8 * v25);
        __int16 v27 = (void *)MEMORY[0x1E016D870]();
        int v28 = [MEMORY[0x1E4F6E6D8] validateAndCleanupID:v26];
        if (v28)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F99888]);
          long long v30 = [MEMORY[0x1E4F1C978] array];
          long long v31 = (void *)[v29 initWithPrimaryHandle:v28 secondaryHandles:v30];
          [v6 addObject:v31];
        }
        else
        {
          long long v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            long long v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            id v39 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v33 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            uint64_t v51 = v39;
            __int16 v52 = 2112;
            uint64_t v53 = v33;
            __int16 v34 = (void *)v33;
            __int16 v54 = 2112;
            uint64_t v55 = v26;
            _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);
          }
        }

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v23);
  }

  if (a4) {
    *a4 = 0;
  }

  return v6;
}

+ (id)getSMHandlesFromFAFamilyMembers:(id)a3 error:(id *)a4
{
  uint64_t v58 = a4;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v82 = "+[SMSuggestionsHelper getSMHandlesFromFAFamilyMembers:error:]";
      __int16 v83 = 1024;
      LODWORD(v84) = 1933;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: familyMembers (in %s:%d)", buf, 0x12u);
    }
  }
  char v6 = objc_opt_new();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v76;
    uint64_t v59 = *(void *)v76;
    do
    {
      uint64_t v10 = 0;
      uint64_t v60 = v8;
      do
      {
        if (*(void *)v76 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v75 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1E016D870]();
        if (([v11 isMe] & 1) == 0)
        {
          uint64_t v64 = v12;
          id v13 = [v11 contact];

          if (v13)
          {
            uint64_t v62 = v10;
            uint64_t v63 = [v11 contact];
            uint64_t v14 = [v63 phoneNumbers];
            id v15 = [v14 valueForKey:@"value"];

            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v16 = v15;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v71 objects:v80 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v72;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v72 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  id v21 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                  uint64_t v22 = [v21 stringValue:v58];

                  if (v22)
                  {
                    uint64_t v23 = (void *)MEMORY[0x1E4F6E6D8];
                    uint64_t v24 = [v21 stringValue];
                    uint64_t v25 = [v23 validateAndCleanupID:v24];

                    if (v25)
                    {
                      id v26 = objc_alloc(MEMORY[0x1E4F99888]);
                      __int16 v27 = [MEMORY[0x1E4F1C978] array];
                      int v28 = (void *)[v26 initWithPrimaryHandle:v25 secondaryHandles:v27];
                      [v6 addObject:v28];
                    }
                    else
                    {
                      __int16 v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        id v29 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v29);
                        long long v30 = (char *)objc_claimAutoreleasedReturnValue();
                        long long v31 = NSStringFromSelector(a2);
                        long long v32 = [v21 stringValue];
                        *(_DWORD *)buf = 138412802;
                        id v82 = v30;
                        __int16 v83 = 2112;
                        uint64_t v84 = (uint64_t)v31;
                        __int16 v85 = 2112;
                        long long v86 = v32;
                        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);
                      }
                    }
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v71 objects:v80 count:16];
              }
              while (v18);
            }

            uint64_t v33 = [v63 emailAddresses];
            __int16 v34 = [v33 valueForKey:@"value"];

            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v35 = v34;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v67 objects:v79 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v68;
              do
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v68 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  SEL v40 = *(void **)(*((void *)&v67 + 1) + 8 * j);
                  if (v40)
                  {
                    long long v41 = [MEMORY[0x1E4F6E6D8] validateAndCleanupID:*(void *)(*((void *)&v67 + 1) + 8 * j)];
                    if (v41)
                    {
                      id v42 = objc_alloc(MEMORY[0x1E4F99888]);
                      long long v43 = [MEMORY[0x1E4F1C978] array];
                      long long v44 = (void *)[v42 initWithPrimaryHandle:v41 secondaryHandles:v43];
                      [v6 addObject:v44];
                    }
                    else
                    {
                      long long v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        long long v45 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v45);
                        uint64_t v65 = (char *)objc_claimAutoreleasedReturnValue();
                        uint64_t v46 = NSStringFromSelector(a2);
                        *(_DWORD *)buf = 138412802;
                        id v82 = v65;
                        __int16 v83 = 2112;
                        uint64_t v84 = v46;
                        long long v47 = (void *)v46;
                        __int16 v85 = 2112;
                        long long v86 = v40;
                        _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);
                      }
                    }
                  }
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v67 objects:v79 count:16];
              }
              while (v37);
            }

            uint64_t v9 = v59;
            uint64_t v8 = v60;
            uint64_t v10 = v62;
            long long v48 = v63;
          }
          else
          {
            id v49 = (void *)MEMORY[0x1E4F6E6D8];
            __int16 v50 = [v11 appleID];
            long long v48 = [v49 validateAndCleanupID:v50];

            if (v48)
            {
              id v51 = objc_alloc(MEMORY[0x1E4F99888]);
              id v16 = [MEMORY[0x1E4F1C978] array];
              __int16 v52 = (void *)[v51 initWithPrimaryHandle:v48 secondaryHandles:v16];
              [v6 addObject:v52];
            }
            else
            {
              id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                uint64_t v53 = (objc_class *)objc_opt_class();
                NSStringFromClass(v53);
                __int16 v54 = (char *)objc_claimAutoreleasedReturnValue();
                uint64_t v55 = NSStringFromSelector(a2);
                char v56 = [v11 appleID];
                *(_DWORD *)buf = 138412802;
                id v82 = v54;
                __int16 v83 = 2112;
                uint64_t v84 = (uint64_t)v55;
                __int16 v85 = 2112;
                long long v86 = v56;
                _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);
              }
              long long v48 = 0;
            }
          }

          uint64_t v12 = v64;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v8);
  }

  if (v58) {
    *uint64_t v58 = 0;
  }

  return v6;
}

+ (BOOL)isValidDistance:(double)a3
{
  return a3 <= 300000.0 && a3 >= 500.0;
}

+ (id)placeInferenceFromNPLOI:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F5CE70];
  id v4 = a3;
  id v19 = [v3 alloc];
  id v20 = [v4 locationOfInterest];
  id v5 = [v20 mapItem];
  char v6 = [v4 locationOfInterest];
  unint64_t v7 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLocationOfInterestType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLocationOfInterestType:", [v6 type]);
  uint64_t v8 = [v4 locationOfInterest];
  unint64_t v9 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLocationOfInterestTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLocationOfInterestTypeSource:", [v8 typeSource]);
  uint64_t v10 = [v4 locationOfInterest];
  uint64_t v11 = [v10 location];
  uint64_t v12 = [v4 locationOfInterest];
  [v12 confidence];
  double v14 = v13;
  id v15 = [v4 locationOfInterest];

  id v16 = [v15 identifier];
  uint64_t v17 = (void *)[v19 initWithMapItem:v5 userType:v7 userTypeSource:v9 placeType:0 referenceLocation:v11 confidence:v16 loiIdentifier:v14];

  return v17;
}

+ (id)createMasqueradingReferenceLocationFromFenceInfo:(id)a3 placeInference:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fenceInfo", buf, 2u);
    }

    if (a5)
    {
      double v13 = @"fenceInfo";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (!v9)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeInference", buf, 2u);
    }

    if (a5)
    {
      double v13 = @"placeInference";
      goto LABEL_16;
    }
LABEL_17:
    id v16 = 0;
    goto LABEL_25;
  }
  [v8 fenceRadius];
  if (v11 < 0.0)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fenceInfo.fenceRadius >= 0", buf, 2u);
    }

    if (a5)
    {
      double v13 = @"fenceInfo.fenceRadius >= 0";
LABEL_16:
      _RTErrorInvalidParameterCreate((uint64_t)v13);
      id v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_17;
  }
  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    id v20 = NSStringFromSelector(a2);
    [v8 fenceRadius];
    uint64_t v22 = v21;
    uint64_t v23 = [v8 date];
    *(_DWORD *)buf = 138413314;
    long long v45 = v19;
    __int16 v46 = 2112;
    long long v47 = v20;
    __int16 v48 = 2112;
    id v49 = v10;
    __int16 v50 = 2048;
    uint64_t v51 = v22;
    __int16 v52 = 2112;
    uint64_t v53 = v23;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, adjusting place inference, %@, with fence radius, %f, from session configuration date, %@", buf, 0x34u);
  }
  [v8 fenceRadius];
  double v25 = v24;
  id v26 = [v10 referenceLocation];
  id v43 = 0;
  __int16 v27 = +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceRadius:v26 location:&v43 error:v25];
  id v28 = v43;

  if (v28)
  {
    id v16 = 0;
    if (a5) {
      *a5 = v28;
    }
  }
  else
  {
    id v29 = objc_alloc(MEMORY[0x1E4F5CE70]);
    uint64_t v30 = [v10 mapItem];
    long long v31 = [v10 finerGranularityMapItem];
    uint64_t v42 = [v10 userType];
    uint64_t v32 = [v10 userTypeSource];
    uint64_t v33 = [v10 placeType];
    [v10 confidence];
    double v35 = v34;
    [v10 finerGranularityMapItemConfidence];
    double v37 = v36;
    uint64_t v38 = [v10 loiIdentifier];
    id v39 = v29;
    SEL v40 = (void *)v30;
    id v16 = (void *)[v39 initWithMapItem:v30 finerGranularityMapItem:v31 userType:v42 userTypeSource:v32 placeType:v33 referenceLocation:v27 confidence:v35 finerGranularityMapItemConfidence:v37 loiIdentifier:v38];
  }
LABEL_25:

  return v16;
}

+ (id)createMasqueradingReferenceLocationFromFenceRadius:(double)a3 location:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8)
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", (uint8_t *)&v24, 2u);
    }

    if (a5)
    {
      uint64_t v10 = @"location";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  if (a3 < 0.0)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fenceRadius >= 0", (uint8_t *)&v24, 2u);
    }

    if (a5)
    {
      uint64_t v10 = @"fenceRadius >= 0";
LABEL_11:
      _RTErrorInvalidParameterCreate((uint64_t)v10);
      uint64_t v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [v8 latitude];
  double v15 = v14;
  [v8 longitude];
  double v17 = v16;
  uint64_t v18 = [v8 date];
  uint64_t v12 = [v13 initWithLatitude:v18 longitude:objc_msgSend(v8, "referenceFrame") horizontalUncertainty:v15 date:v17 referenceFrame:a3];

  id v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    uint64_t v22 = NSStringFromSelector(a2);
    int v24 = 138412802;
    double v25 = v21;
    __int16 v26 = 2112;
    __int16 v27 = v22;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@, %@, masquerading location, %@", (uint8_t *)&v24, 0x20u);
  }
LABEL_16:

  return v12;
}

+ (id)dedupeSessionConfigurations:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v41;
    *(void *)&long long v6 = 138412802;
    long long v30 = v6;
    uint64_t v32 = *(void *)v41;
    uint64_t v33 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v34 = v7;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        double v11 = (void *)MEMORY[0x1E016D870]();
        uint64_t v12 = [v10 destination];
        id v13 = [v12 destinationMapItem];

        if (!v13)
        {
          int v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            double v25 = (objc_class *)objc_opt_class();
            __int16 v26 = NSStringFromClass(v25);
            __int16 v27 = NSStringFromSelector(a2);
            *(_DWORD *)buf = v30;
            long long v45 = v26;
            __int16 v46 = 2112;
            long long v47 = v27;
            __int16 v48 = 2112;
            id v49 = v10;
            _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, %@, session configuration doesn't have destination map item, %@", buf, 0x20u);

            goto LABEL_14;
          }
LABEL_15:

          goto LABEL_16;
        }
        double v14 = [v10 destination];
        double v15 = [v14 destinationMapItem];
        uint64_t v16 = [v4 objectForKey:v15];
        if (!v16)
        {

LABEL_13:
          int v24 = [v10 destination];
          __int16 v26 = [v24 destinationMapItem];
          [v4 setObject:v10 forKeyedSubscript:v26];
LABEL_14:

          goto LABEL_15;
        }
        double v17 = (void *)v16;
        id v39 = [v10 destination];
        uint64_t v38 = [v39 destinationMapItem];
        uint64_t v18 = [v4 objectForKey:v38];
        id v19 = [v18 sessionStartDate];
        id v20 = [v10 sessionStartDate];
        [v19 laterDate:v20];
        v22 = uint64_t v21 = v11;
        [v10 sessionStartDate];
        uint64_t v23 = v37 = v14;
        int v36 = [v22 isEqualToDate:v23];

        double v11 = v21;
        id v4 = v33;

        uint64_t v7 = v34;
        uint64_t v8 = v32;

        if (v36) {
          goto LABEL_13;
        }
LABEL_16:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v7);
  }

  __int16 v28 = [v4 allValues];

  return v28;
}

- (id)_placeInferenceFromLOI:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F5CE70];
  id v4 = a3;
  id v18 = [v3 alloc];
  id v19 = [v4 place];
  uint64_t v5 = [v19 mapItem];
  long long v6 = [v4 place];
  unint64_t v7 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLearnedPlaceType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLearnedPlaceType:", [v6 type]);
  uint64_t v8 = [v4 place];
  unint64_t v9 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:", [v8 typeSource]);
  uint64_t v10 = [v4 location];
  double v11 = [v10 location];
  uint64_t v12 = [v4 location];
  [v12 confidence];
  double v14 = v13;
  double v15 = [v4 identifier];

  uint64_t v16 = (void *)[v18 initWithMapItem:v5 userType:v7 userTypeSource:v9 placeType:0 referenceLocation:v11 confidence:v15 loiIdentifier:v14];

  return v16;
}

- (id)_dedupePlaceInferencesWithOrder:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        double v11 = (void *)MEMORY[0x1E016D870]();
        uint64_t v12 = [v10 loiIdentifier];

        if (v12)
        {
          double v13 = [v10 loiIdentifier];
          double v14 = [v4 objectForKey:v13];

          if (v14) {
            goto LABEL_12;
          }
          double v15 = [v10 loiIdentifier];
          [v4 setObject:v10 forKeyedSubscript:v15];
        }
        else
        {
          double v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = (objc_class *)objc_opt_class();
            double v17 = NSStringFromClass(v16);
            id v18 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            __int16 v27 = v17;
            __int16 v28 = 2112;
            id v29 = v18;
            __int16 v30 = 2112;
            long long v31 = v10;
            _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, place inference doesn't have LOI identifier, %@", buf, 0x20u);
          }
        }

LABEL_12:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v7);
  }

  id v19 = [v4 allValues];

  return v19;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (RTLocation)latestLocationOfTheDevice
{
  return self->_latestLocationOfTheDevice;
}

- (void)setLatestLocationOfTheDevice:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (SMEligibilityChecker)eligibilityChecker
{
  return self->_eligibilityChecker;
}

- (void)setEligibilityChecker:(id)a3
{
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_latestLocationOfTheDevice, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);

  objc_storeStrong((id *)&self->_authorizationManager, 0);
}

@end