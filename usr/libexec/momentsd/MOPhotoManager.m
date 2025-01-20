@interface MOPhotoManager
- (BOOL)_deletePhotoMemoryPlistFile:(id)a3;
- (BOOL)_doesAssetHaveFaceProcessing:(id)a3;
- (BOOL)_doesAssetHaveSceneProcessing:(id)a3;
- (BOOL)_persistPhotoMemoryPlistFile:(id)a3 withData:(id)a4;
- (BOOL)isCandidateForMemoryEvent:(id)a3;
- (BOOL)isDesirableCategoryOrTrigger:(id)a3;
- (GDEntityTaggingService)entityTaggingSerice;
- (GDVisualIdentifierView)visualIdentifierView;
- (MOConfigurationManager)configurationManager;
- (MOEventStore)eventStore;
- (MOPhotoManager)initWithUniverse:(id)a3;
- (NSString)suggestedMePersonIdentifier;
- (OS_dispatch_queue)queue;
- (PHPerson)mePerson;
- (PHPhotoLibrary)photoLibrary;
- (PHPhotoLibrary)syndicationPhotoLibrary;
- (id)_calculateDistanceBetweenUserLocation:(id)a3 PhotoLocation:(id)a4;
- (id)_createEventFromAsset:(id)a3;
- (id)_createEventFromPhotoMemory:(id)a3;
- (id)_fetchCuratedAssetsForPhotoMemory:(id)a3;
- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 photoMemories:(id)a4;
- (id)_getPhotoMemoryPlistFileURL;
- (id)_getPhotosByAssetProperties:(id)a3 UserLocations:(id)a4 IsLocationCheckMandatory:(BOOL)a5 MinDistance:(double)a6;
- (id)_readPhotoMemoryPlistFile:(id)a3;
- (id)_sceneLabelsForSceneClassifications:(id)a3;
- (id)getClassificationInfo:(id)a3;
- (id)getPersonsInAsset:(id)a3;
- (id)initializeVisualIdentifierView;
- (id)intializeEntityTaggingService;
- (unint64_t)gmsAvailabilityStatus;
- (void)_buildCuratedAssetMap:(id)a3 handler:(id)a4;
- (void)_createNewEventsFromPhotoMemories:(id)a3 storedEvents:(id)a4 handler:(id)a5;
- (void)_fetchCuratedPhotosFromHighlights:(id)a3 StartDate:(id)a4 EndDate:(id)a5 BundleInterfaceType:(unint64_t)a6 Locations:(id)a7 IsLocationCheckMandatory:(BOOL)a8 handler:(id)a9;
- (void)_fetchPhotoMemoriesBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)_fetchPhotoMemoryEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_fetchPhotosTraitsFromAssets:(id)a3 StartDate:(id)a4 EndDate:(id)a5 handler:(id)a6;
- (void)_fetchSharedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)_fetchUnprocessedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 Locations:(id)a5 IsLocationCheckMandatory:(BOOL)a6 handler:(id)a7;
- (void)_getPhotoMemoryPlistFileURL;
- (void)_rehydratePhotoMemories:(id)a3 handler:(id)a4;
- (void)_rehydrateSharedPhotos:(id)a3 handler:(id)a4;
- (void)_rehydrateStoredEvents:(id)a3 fromPhotoMemories:(id)a4 fetchResult:(id)a5 handler:(id)a6;
- (void)_saveEvents:(id)a3 category:(unint64_t)a4 handler:(id)a5;
- (void)_scheduleMediaAnalysisDeferredProcessing:(id)a3;
- (void)_setDynamicPropertiesForMemoryEvent:(id)a3 fromMemory:(id)a4 keyAsset:(id)a5;
- (void)_updatePhotoEventsDeletedAtSource:(id)a3 library:(id)a4 handler:(id)a5;
- (void)_updatePhotoMemoriesDeletedAtSource:(id)a3 library:(id)a4 handler:(id)a5;
- (void)deletePhotoMemoryPlistFile;
- (void)fetchAndSavePhotoMemoriesStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchAndSaveSharedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchAssetUsingID:(id)a3 handler:(id)a4;
- (void)fetchPhotoMemoryEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)fetchPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 SuggestionID:(id)a5 BundleInterfaceType:(unint64_t)a6 Locations:(id)a7 IsLocationCheckMandatory:(BOOL)a8 handler:(id)a9;
- (void)intializeEntityTaggingService;
- (void)rehydratePhotoMemories:(id)a3 handler:(id)a4;
- (void)rehydrateSharedPhotos:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setMePerson:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setSuggestedMePersonIdentifier:(id)a3;
- (void)setSyndicationPhotoLibrary:(id)a3;
- (void)updatePhotoMemoriesEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)updateSharedPhotoEventsDeletedAtSource:(id)a3 handler:(id)a4;
@end

@implementation MOPhotoManager

- (MOPhotoManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  if (v8)
  {
    +[PHPhotoLibrary enableMultiLibraryMode];
    id v43 = 0;
    v9 = +[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:1 error:&v43];
    id v10 = v43;
    if (v10)
    {
      v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager initWithUniverse:].cold.6();
      }
    }
    id v42 = v10;
    v12 = +[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:3 error:&v42];
    id v13 = v42;

    if (v13)
    {
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager initWithUniverse:].cold.5();
      }
    }
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v5 getService:v16];

    if (v17)
    {
      if (!v9 || !v12)
      {
        v38 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[MOPhotoManager initWithUniverse:].cold.4();
        }

        exit(1);
      }
      id v41 = v13;
      v18 = [v9 suggestedMePersonIdentifierWithError:&v41];
      id v19 = v41;

      if (v19)
      {
        v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[MOPhotoManager initWithUniverse:]();
        }
      }
      v21 = v12;
      v22 = [v9 librarySpecificFetchOptions:v19];
      v23 = +[PHPerson fetchMePersonWithOptions:v22];
      v24 = [v23 firstObject];

      v25 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Me person from Photos: %@", buf, 0xCu);
      }

      v40.receiver = self;
      v40.super_class = (Class)MOPhotoManager;
      v26 = [(MOPhotoManager *)&v40 init];
      v12 = v21;
      if (v26)
      {
        v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v28 = dispatch_queue_create("MOPhotoManager", v27);
        queue = v26->_queue;
        v26->_queue = (OS_dispatch_queue *)v28;

        objc_storeStrong((id *)&v26->_photoLibrary, v9);
        objc_storeStrong((id *)&v26->_syndicationPhotoLibrary, v21);
        objc_storeStrong((id *)&v26->_eventStore, v17);
        objc_storeStrong((id *)&v26->_configurationManager, v8);
        objc_storeStrong((id *)&v26->_suggestedMePersonIdentifier, v18);
        objc_storeStrong((id *)&v26->_mePerson, v24);
        uint64_t v30 = [(MOPhotoManager *)v26 initializeVisualIdentifierView];
        visualIdentifierView = v26->_visualIdentifierView;
        v26->_visualIdentifierView = (GDVisualIdentifierView *)v30;

        uint64_t v32 = [(MOPhotoManager *)v26 intializeEntityTaggingService];
        entityTaggingSerice = v26->_entityTaggingSerice;
        v26->_entityTaggingSerice = (GDEntityTaggingService *)v32;
      }
      self = v26;

      id v13 = v39;
      v34 = self;
    }
    else
    {
      v36 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MORoutineServiceManager initWithUniverse:]();
      }

      v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"MOPhotoManager.m" lineNumber:124 description:@"Invalid parameter not satisfying: eventStore"];
      v34 = 0;
    }
  }
  else
  {
    v35 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore initWithUniverse:]();
    }

    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MOPhotoManager.m" lineNumber:103 description:@"Invalid parameter not satisfying: configurationManager"];
    v34 = 0;
  }

  return v34;
}

- (unint64_t)gmsAvailabilityStatus
{
  v2 = self;
  objc_sync_enter(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39__MOPhotoManager_gmsAvailabilityStatus__block_invoke;
  block[3] = &unk_1002C98B8;
  block[4] = v2;
  if (gmsAvailabilityStatus_onceToken != -1) {
    dispatch_once(&gmsAvailabilityStatus_onceToken, block);
  }
  objc_sync_exit(v2);

  v3 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t gmsAvailabilityStatus = v2->_gmsAvailabilityStatus;
    *(_DWORD *)buf = 134217984;
    unint64_t v8 = gmsAvailabilityStatus;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "gmsAvailabilityStatus,%lu", buf, 0xCu);
  }

  return v2->_gmsAvailabilityStatus;
}

unint64_t __39__MOPhotoManager_gmsAvailabilityStatus__block_invoke(uint64_t a1)
{
  unint64_t result = +[MOPlatformInfo generativeModelsAvailabilityStatus];
  *(void *)(*(void *)(a1 + 32) + 8) = result;
  return result;
}

- (id)_sceneLabelsForSceneClassifications:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = objc_alloc_init((Class)PFSceneTaxonomy);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v5 nodeRefForSceneClassId:[v11 sceneIdentifier:v20]];
        uint64_t v13 = PFSceneTaxonomyNodeNetworkId();
        if (v12) {
          BOOL v14 = v13 == 1;
        }
        else {
          BOOL v14 = 0;
        }
        if (v14)
        {
          [v11 confidence];
          double v16 = v15;
          PFSceneTaxonomyNodeSearchThreshold();
          if (v16 >= v17)
          {
            v18 = PFSceneTaxonomyNodeName();
            if (v18) {
              [v4 addObject:v18];
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)initializeVisualIdentifierView
{
  v2 = +[GDViewService defaultService];
  id v10 = 0;
  id v3 = [v2 visualIdentifierViewWithError:&v10];
  id v4 = v10;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v8 = v3;
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#megadome failed to get visualIdentifierView with error: %@", buf, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)intializeEntityTaggingService
{
  id v9 = 0;
  v2 = objc_opt_new();
  id v3 = [objc_alloc((Class)GDEntityTaggingService) initWithConfig:v2 error:&v9];
  id v4 = v3;
  if (v9) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    BOOL v6 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MOPhotoManager *)&v9 intializeEntityTaggingService];
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (void)fetchPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 SuggestionID:(id)a5 BundleInterfaceType:(unint64_t)a6 Locations:(id)a7 IsLocationCheckMandatory:(BOOL)a8 handler:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  long long v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v16;
    __int16 v37 = 2112;
    id v38 = v17;
    __int16 v39 = 2048;
    unint64_t v40 = a6;
    __int16 v41 = 1024;
    BOOL v42 = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetchPhotosBetweenStartDate, startDate, %@, endDate, %@, suggestionID, %@, interfaceType, %lu, isLocationCheckMandatory, %d", buf, 0x30u);
  }

  long long v21 = [(MOPhotoManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke;
  block[3] = &unk_1002D13E8;
  block[4] = self;
  id v27 = v15;
  id v28 = v16;
  id v29 = v18;
  BOOL v32 = v9;
  id v30 = v19;
  unint64_t v31 = a6;
  id v22 = v19;
  id v23 = v18;
  id v24 = v16;
  id v25 = v15;
  dispatch_async(v21, block);
}

void __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = [v2 librarySpecificFetchOptions];

  [v3 setShouldPrefetchCount:1];
  id v4 = +[NSPredicate predicateWithFormat:@"%K >= %@ && %K <= %@", @"endDate", *(void *)(a1 + 40), @"startDate", *(void *)(a1 + 48)];
  [v3 setPredicate:v4];

  BOOL v5 = +[PHAssetCollection fetchAssetCollectionsWithType:6 subtype:1000000301 options:v3];
  BOOL v6 = v5;
  if (!v5 || ([v5 fetchError], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      v11 = [v6 fetchError];
      *(_DWORD *)buf = 138412802;
      *(void *)v75 = v9;
      *(_WORD *)&v75[8] = 2112;
      *(void *)&v75[10] = v10;
      *(_WORD *)&v75[18] = 2112;
      *(void *)&v75[20] = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetch highlight from photo library failed, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(unsigned __int8 *)(a1 + 80);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_303;
    v72[3] = &unk_1002D1398;
    id v73 = *(id *)(a1 + 64);
    [v12 _fetchUnprocessedPhotosBetweenStartDate:v13 EndDate:v14 Locations:v15 IsLocationCheckMandatory:v16 handler:v72];
    id v17 = v73;
LABEL_6:

    goto LABEL_7;
  }
  id v18 = [v6 fetchedObjects];
  id v19 = [v18 count];

  long long v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (!v19)
  {
    if (v21)
    {
      uint64_t v43 = *(void *)(a1 + 40);
      uint64_t v44 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(void *)v75 = v43;
      *(_WORD *)&v75[8] = 2112;
      *(void *)&v75[10] = v44;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetch highlight from photo library successful, but fetched object count is invalid, start date, %@, end date, %@", buf, 0x16u);
    }

    v45 = *(void **)(a1 + 32);
    uint64_t v46 = *(void *)(a1 + 40);
    uint64_t v47 = *(void *)(a1 + 48);
    uint64_t v48 = *(void *)(a1 + 56);
    uint64_t v49 = *(unsigned __int8 *)(a1 + 80);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_305;
    v70[3] = &unk_1002D1398;
    id v71 = *(id *)(a1 + 64);
    [v45 _fetchUnprocessedPhotosBetweenStartDate:v46 EndDate:v47 Locations:v48 IsLocationCheckMandatory:v49 handler:v70];
    id v17 = v71;
    goto LABEL_6;
  }
  uint64_t v50 = a1;
  if (v21)
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v75 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetch highlight from photo library successful, highlightcount, %lu", buf, 0xCu);
  }
  v52 = v3;

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v51 = v6;
  id v22 = v6;
  id v23 = [v22 countByEnumeratingWithState:&v66 objects:v94 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v67;
    uint64_t v26 = 1;
    id v53 = v22;
    do
    {
      id v27 = 0;
      do
      {
        if (*(void *)v67 != v25) {
          objc_enumerationMutation(v22);
        }
        id v28 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v27);
        id v29 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          int v30 = v26 + v27;
          unint64_t v31 = [v28 localIdentifier];
          v61 = [v28 localStartDate];
          v60 = [v28 localEndDate];
          id v59 = [v28 assetsCount];
          unsigned int v58 = [v28 type];
          unsigned int v57 = [v28 category];
          unsigned int v56 = [v28 sharingComposition];
          [v28 promotionScore];
          uint64_t v33 = v32;
          unsigned int v55 = [v28 isEnriched];
          unsigned int v54 = [v28 enrichmentState];
          uint64_t v34 = v26;
          unsigned int v35 = [v28 visibilityState];
          unsigned int v36 = [v28 kind];
          *(_DWORD *)buf = 67112194;
          *(_DWORD *)v75 = v30;
          *(_WORD *)&v75[4] = 2112;
          *(void *)&v75[6] = v31;
          *(_WORD *)&v75[14] = 2112;
          *(void *)&v75[16] = v61;
          *(_WORD *)&v75[24] = 2112;
          *(void *)&v75[26] = v60;
          __int16 v76 = 2048;
          id v77 = v59;
          __int16 v78 = 1024;
          unsigned int v79 = v58;
          __int16 v80 = 1024;
          unsigned int v81 = v57;
          __int16 v82 = 1024;
          unsigned int v83 = v56;
          __int16 v84 = 2048;
          uint64_t v85 = v33;
          __int16 v86 = 1024;
          unsigned int v87 = v55;
          __int16 v88 = 1024;
          unsigned int v89 = v54;
          __int16 v90 = 1024;
          unsigned int v91 = v35;
          uint64_t v26 = v34;
          id v22 = v53;
          __int16 v92 = 1024;
          unsigned int v93 = v36;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "highlight[%d] info, id, %@, start date, %@, end date, %@, assetsCount, %lu, type, %hu, category, %hu, sharingComposition, %hu, promotionScore, %f, isEnriched, %d, enrichmentState, %hu, visibilityState, %hu, kind, %hu", buf, 0x64u);
        }
        id v27 = (char *)v27 + 1;
      }
      while (v24 != v27);
      id v24 = [v22 countByEnumeratingWithState:&v66 objects:v94 count:16];
      uint64_t v26 = (v26 + v27);
    }
    while (v24);
  }

  id v38 = *(void **)(v50 + 32);
  __int16 v37 = *(void **)(v50 + 40);
  uint64_t v39 = *(void *)(v50 + 72);
  uint64_t v40 = *(void *)(v50 + 48);
  uint64_t v41 = *(void *)(v50 + 56);
  uint64_t v42 = *(unsigned __int8 *)(v50 + 80);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_306;
  v62[3] = &unk_1002D13C0;
  v62[4] = v38;
  id v63 = v37;
  id v64 = *(id *)(v50 + 48);
  id v65 = *(id *)(v50 + 64);
  [v38 _fetchCuratedPhotosFromHighlights:v22 StartDate:v63 EndDate:v40 BundleInterfaceType:v39 Locations:v41 IsLocationCheckMandatory:v42 handler:v62];

  BOOL v6 = v51;
  id v3 = v52;
LABEL_7:
}

uint64_t __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_303(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_305(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_306(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)a1;
  if ([*(id *)(a1 + 32) gmsAvailabilityStatus] == (id)1)
  {
    id v32 = v12;
    id v33 = v11;
    id v34 = v10;
    id v35 = v9;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v10;
    id v14 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v19 = (void *)v13[4];
          long long v20 = [v18 sceneClassifications:v32];
          BOOL v21 = [v19 _sceneLabelsForSceneClassifications:v20];

          id v22 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            id v23 = [v18 uuid];
            id v24 = [v18 localIdentifier];
            *(_DWORD *)buf = 138412802;
            uint64_t v42 = v23;
            __int16 v43 = 2112;
            uint64_t v44 = v24;
            __int16 v45 = 2112;
            uint64_t v46 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "fetchPhotosBetweenStartDate, #scenes, shortlisted assets with uuid %@ and localIdentifier %@ and scenes %@", buf, 0x20u);
          }
        }
        id v15 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v15);
    }

    uint64_t v25 = +[PHSceneClassification fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:obj];
    uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = (void *)v13[5];
      id v28 = (void *)v13[6];
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v27;
      __int16 v43 = 2112;
      uint64_t v44 = v28;
      __int16 v45 = 2112;
      uint64_t v46 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "fetchPhotosBetweenStartDate, #scenes, startDate, %@, endDate, %@, scenes, %@", buf, 0x20u);
    }

    id v29 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    id v9 = v35;
    id v11 = v33;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v30 = (void *)v13[5];
      unint64_t v31 = (void *)v13[6];
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v30;
      __int16 v43 = 2112;
      uint64_t v44 = v31;
      __int16 v45 = 2112;
      uint64_t v46 = v33;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "fetchPhotosBetweenStartDate, #traits, startDate, %@, endDate, %@, traits, %@", buf, 0x20u);
    }

    id v10 = v34;
    id v12 = v32;
  }
  (*(void (**)(void))(v13[7] + 16))();
}

- (id)getClassificationInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#megadome,getClassificationInfo,personLocalIdentifier, %@", buf, 0xCu);
  }

  if (!v4)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#megadome,personLocalIdentifier is nil", buf, 2u);
    }
    id v15 = 0;
    goto LABEL_57;
  }
  BOOL v6 = [(GDVisualIdentifierView *)self->_visualIdentifierView personForIdentifier:v4];
  id v7 = v6;
  if (!v6)
  {
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOPhotoManager getClassificationInfo:]();
    }
    id v15 = 0;
    goto LABEL_56;
  }
  id v8 = [v6 entityIdentifier];
  id v9 = [v8 stringValue];

  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#megadome,personLocalIdentifierMD, %@", buf, 0xCu);
  }

  if (!v9)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#megadome,could not get MD identifier for personLocalIdentifier %@", buf, 0xCu);
    }
    id v14 = 0;
    id v15 = 0;
    goto LABEL_55;
  }
  id v11 = [objc_alloc((Class)GDPersonTaggingOptions) initWithTagThresholds:&off_1002F9A78];
  entityTaggingSerice = self->_entityTaggingSerice;
  id v41 = 0;
  uint64_t v13 = [(GDEntityTaggingService *)entityTaggingSerice entityTagsForIdentifier:v9 options:v11 error:&v41];
  id v14 = v41;
  if (v14)
  {
    id obj = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[MOPhotoManager getClassificationInfo:]();
    }
LABEL_11:
    id v15 = 0;
    goto LABEL_54;
  }
  if (!v13)
  {
    id obj = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[MOPhotoManager getClassificationInfo:]();
    }
    goto LABEL_11;
  }
  id v33 = v11;
  id v34 = v9;
  id v35 = v4;
  id v32 = v13;
  uint64_t v16 = [v13 scoredPersonEntityTags];
  id v15 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v16;
  id v17 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (!v17) {
    goto LABEL_51;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v38;
  do
  {
    for (i = 0; i != v18; i = (char *)i + 1)
    {
      if (*(void *)v38 != v19) {
        objc_enumerationMutation(obj);
      }
      BOOL v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      id v22 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = [v21 tag];
        [v21 score];
        *(_DWORD *)buf = 134218240;
        id v43 = v23;
        __int16 v44 = 2048;
        uint64_t v45 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "#megadome,personTag,%ld,score,%f", buf, 0x16u);
      }

      if ([v21 tag] == (id)4)
      {
        uint64_t v25 = 4;
      }
      else if ([v21 tag] == (id)22)
      {
        uint64_t v25 = 22;
      }
      else if ([v21 tag] == (id)21)
      {
        uint64_t v25 = 21;
      }
      else if ([v21 tag] == (id)26)
      {
        uint64_t v25 = 26;
      }
      else if ([v21 tag] == (id)15)
      {
        uint64_t v25 = 15;
      }
      else if ([v21 tag] == (id)3)
      {
        uint64_t v25 = 3;
      }
      else if ([v21 tag] == (id)27)
      {
        uint64_t v25 = 27;
      }
      else if ([v21 tag] == (id)28)
      {
        uint64_t v25 = 28;
      }
      else
      {
        if ([v21 tag] != (id)29) {
          continue;
        }
        uint64_t v25 = 29;
      }
      uint64_t v26 = [MOPersonRelationship alloc];
      [v21 score];
      id v27 = -[MOPersonRelationship initWithRelationship:score:source:](v26, "initWithRelationship:score:source:", v25, &stru_1002D2AC8);
      if (v27)
      {
        id v28 = v27;
        id v29 = [(MOPersonRelationship *)v27 copy];
        [v15 addObject:v29];
      }
    }
    id v18 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  }
  while (v18);
LABEL_51:

  int v30 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#megadome,classification, %@", buf, 0xCu);
  }

  id v4 = v35;
  id v11 = v33;
  id v9 = v34;
  uint64_t v13 = v32;
  id v14 = 0;
LABEL_54:

LABEL_55:
LABEL_56:

LABEL_57:

  return v15;
}

- (id)getPersonsInAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:v4];
  [v5 setPersonContext:0];
  [v5 setIncludedDetectionTypes:&off_1002F9410];
  id v64 = v4;
  v61 = v5;
  BOOL v6 = +[PHPerson fetchPersonsInAsset:v4 options:v5];
  id v62 = +[NSMutableSet set];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v6;
  id v74 = [obj countByEnumeratingWithState:&v81 objects:v103 count:16];
  if (v74)
  {
    uint64_t v73 = *(void *)v82;
    v75 = self;
    do
    {
      for (i = 0; i != v74; i = (char *)i + 1)
      {
        if (*(void *)v82 != v73) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if ([v8 type] == (id)-1)
        {
          id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            id v77 = [v64 localIdentifier];
            loga = v9;
            id v42 = [v8 type];
            id v43 = [v8 contactMatchingDictionary];
            __int16 v44 = [v43 description];
            uint64_t v45 = [v8 displayName];
            uint64_t v46 = [v8 personUri];
            id v47 = [v8 faceCount];
            unsigned int v48 = [v8 isVerified];
            id v49 = [v8 verifiedType];
            unsigned int v50 = [v8 detectionType];
            *(_DWORD *)buf = 138414338;
            __int16 v86 = v77;
            __int16 v87 = 2048;
            id v88 = v42;
            id v9 = loga;
            __int16 v89 = 2112;
            __int16 v90 = v44;
            __int16 v91 = 2112;
            *(void *)__int16 v92 = v45;
            *(_WORD *)&v92[8] = 2112;
            *(void *)&v92[10] = v46;
            *(_WORD *)&v92[18] = 2048;
            *(void *)&v92[20] = v47;
            *(_WORD *)&v92[28] = 1024;
            *(_DWORD *)&v92[30] = v48;
            __int16 v93 = 2048;
            id v94 = v49;
            __int16 v95 = 1024;
            unsigned int v96 = v50;
            _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "Asset : %@, skipping as type : %ld, contactMatchingDictionary : %@, displayName : %@, personURI : %@, faceCount : %ld, verified : %d, verifiedType : %ld, detectionType : %hd", buf, 0x54u);

            self = v75;
          }
        }
        else
        {
          id v9 = [v8 displayName];
          id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          os_log_t log = v9;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            id v71 = [v64 localIdentifier];
            id v70 = [v8 type];
            v72 = [v8 contactMatchingDictionary];
            long long v69 = [v72 description];
            unsigned int v68 = [v8 isMe];
            id v11 = [v8 name];
            id v12 = [v8 displayName];
            uint64_t v13 = [v8 personUri];
            id v67 = [v8 faceCount];
            unsigned int v66 = [v8 isVerified];
            id v14 = [v8 verifiedType];
            unsigned int v15 = [v8 detectionType];
            uint64_t v16 = [v8 localIdentifier];
            *(_DWORD *)buf = 138415106;
            __int16 v86 = v71;
            __int16 v87 = 2048;
            id v88 = v70;
            __int16 v89 = 2112;
            __int16 v90 = v69;
            __int16 v91 = 1024;
            *(_DWORD *)__int16 v92 = v68;
            *(_WORD *)&v92[4] = 2112;
            *(void *)&v92[6] = v11;
            *(_WORD *)&v92[14] = 2112;
            *(void *)&v92[16] = v12;
            *(_WORD *)&v92[24] = 2112;
            *(void *)&v92[26] = v13;
            __int16 v93 = 2048;
            id v94 = v67;
            __int16 v95 = 1024;
            unsigned int v96 = v66;
            __int16 v97 = 2048;
            id v98 = v14;
            __int16 v99 = 1024;
            unsigned int v100 = v15;
            self = v75;
            __int16 v101 = 2112;
            v102 = v16;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Asset : %@, type : %ld, contactMatchingDictionary : %@, isMe : %d, name : %@, displayName : %@, personURI : %@, faceCount : %ld, verified : %d, verifiedType : %ld, detectionType : %hd, localIdentifier : %@", buf, 0x6Eu);

            id v9 = log;
          }

          unsigned int v76 = [v8 isMe];
          if (v76)
          {
            id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              id v18 = [v8 localIdentifier];
              *(_DWORD *)buf = 138412290;
              __int16 v86 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "got current person as me person from Photos, localIdentifier : %@", buf, 0xCu);
            }
          }
          uint64_t v19 = [(MOPhotoManager *)self mePerson];

          if (v19)
          {
            long long v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              BOOL v21 = [(MOPhotoManager *)self mePerson];
              id v22 = [v21 localIdentifier];
              *(_DWORD *)buf = 138412290;
              __int16 v86 = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "got me person from Photo person localIdentifier :  %@", buf, 0xCu);
            }
            id v23 = [v8 localIdentifier];
            uint64_t v24 = [(MOPhotoManager *)self mePerson];
            uint64_t v25 = [v24 localIdentifier];

            if (v23 == v25)
            {
              uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Current person matched with the me Person", buf, 2u);
              }

              unsigned int v76 = 1;
            }
          }
          id v27 = [(MOPhotoManager *)self suggestedMePersonIdentifier];

          if (v27)
          {
            id v28 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              id v29 = [(MOPhotoManager *)self suggestedMePersonIdentifier];
              *(_DWORD *)buf = 138412290;
              __int16 v86 = v29;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "got inferred me person from Photos, localIdentifier : %@", buf, 0xCu);
            }
            int v30 = [(MOPhotoManager *)self suggestedMePersonIdentifier];
            unint64_t v31 = [v8 localIdentifier];
            unsigned int v32 = [v30 isEqualToString:v31];

            if (v32)
            {
              id v33 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Current PHPerson matched as the inferred Me Person, setting it as mePerson", buf, 2u);
              }

              unsigned int v76 = 1;
            }
          }
          if ([v9 length])
          {
            id v34 = [v8 localIdentifier];
            id v35 = [(MOPhotoManager *)self getClassificationInfo:v34];

            unsigned int v36 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v86 = v35;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "people relationships : %@", buf, 0xCu);
            }

            long long v37 = [MOPerson alloc];
            long long v38 = [v8 localIdentifier];
            long long v39 = [v8 personUri];
            id v40 = [v39 length];
            if (v40)
            {
              uint64_t v41 = [v8 personUri];
              id v63 = (void *)v41;
            }
            else
            {
              uint64_t v41 = 0;
            }
            id v51 = [v8 type];
            v52 = [(MOPhotoManager *)v75 suggestedMePersonIdentifier];
            if (((v52 == 0) & ~v76) != 0)
            {
              BOOL v78 = v51 == (id)1;
              unsigned int v54 = [(MOPhotoManager *)v75 mePerson];
              LOBYTE(v60) = v54 != 0;
              id v53 = [(MOPerson *)v37 initWithLocalIdentifier:v38 name:log contactIdentifier:v41 family:0 isPHPersonTypeImportant:v78 isMePerson:0 mePersonIdentified:0.0 personRelationships:0.0 priorityScore:v60 significanceScore:v35];
            }
            else
            {
              LOBYTE(v60) = 1;
              id v53 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](v37, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", v38, log, v41, 0, v51 == (id)1, 0.0, 0.0, v60, v35);
            }

            if (v40) {
            [(MOPerson *)v53 setSourceEventAccessType:4];
            }
            [v62 addObject:v53];

            self = v75;
            id v9 = log;
          }
        }
      }
      id v74 = [obj countByEnumeratingWithState:&v81 objects:v103 count:16];
    }
    while (v74);
  }

  id v55 = [v62 count];
  unsigned int v56 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);
  if (v55)
  {
    if (v57)
    {
      unsigned int v58 = [v62 allObjects];
      *(_DWORD *)buf = 138412290;
      __int16 v86 = v58;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "people names from current asset : %@ ", buf, 0xCu);
    }
  }
  else if (v57)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "got no people from current asset", buf, 2u);
  }

  return v62;
}

- (void)_fetchCuratedPhotosFromHighlights:(id)a3 StartDate:(id)a4 EndDate:(id)a5 BundleInterfaceType:(unint64_t)a6 Locations:(id)a7 IsLocationCheckMandatory:(BOOL)a8 handler:(id)a9
{
  BOOL v62 = a8;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v64 = a7;
  id v65 = a9;
  unsigned int v15 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#photoscuration, fetchCuratedPhotosFromHighlights, startDate, %@, endDate, %@", buf, 0x16u);
  }

  long long v81 = objc_opt_new();
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v12;
  id v73 = [obj countByEnumeratingWithState:&v105 objects:v120 count:16];
  if (v73)
  {
    uint64_t v72 = *(void *)v106;
    uint64_t v71 = PHAssetPropertySetSceneAnalysis;
    uint64_t v70 = PHAssetPropertySetMediaAnalysis;
    uint64_t v69 = PHAssetPropertySetAesthetic;
    uint64_t v68 = PHAssetPropertySetSceneprint;
    uint64_t v67 = PHAssetPropertySetUserActivity;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v106 != v72)
        {
          uint64_t v17 = v16;
          objc_enumerationMutation(obj);
          uint64_t v16 = v17;
        }
        uint64_t v75 = v16;
        id v18 = *(void **)(*((void *)&v105 + 1) + 8 * v16);
        uint64_t v19 = [(MOPhotoManager *)self photoLibrary];
        unsigned int v79 = [v19 librarySpecificFetchOptions];

        [v79 setIncludeGuestAssets:1];
        v119[0] = v71;
        v119[1] = v70;
        v119[2] = v69;
        v119[3] = v68;
        v119[4] = v67;
        long long v20 = +[NSArray arrayWithObjects:v119 count:5];
        [v79 setFetchPropertySets:v20];

        [v79 setShouldPrefetchCount:1];
        [v79 setHighlightCurationType:1];
        id v104 = 0;
        id v77 = +[PHAsset fetchSummaryCurationForHighlight:v18 fetchOptions:v79 allowsOnDemand:1 error:&v104];
        unint64_t v76 = (unint64_t)v104;
        uint64_t v21 = [v77 fetchError];
        BOOL v22 = (v21 | v76) != 0;

        if (v22)
        {
          id v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = [v18 localIdentifier];
            uint64_t v25 = [v77 fetchError];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#photoscuration, fetching curated assets for highlight, %@, hit error, %@", buf, 0x16u);
          }
        }
        else
        {
          BOOL v26 = [v77 count] == 0;
          id v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          BOOL v27 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          if (v26)
          {
            if (v27)
            {
              long long v39 = [v18 localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v39;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "#photoscuration, fetching curated assets for highlight, %@, asset count is 0", buf, 0xCu);
            }
          }
          else
          {
            if (v27)
            {
              id v28 = [v18 localIdentifier];
              id v29 = [v77 count];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v28;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v29;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "#photoscuration, fetching curated assets successful for highlight, %@, asset count, %lu", buf, 0x16u);
            }
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v23 = v77;
            id v30 = [v23 countByEnumeratingWithState:&v100 objects:v118 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v101;
              do
              {
                for (i = 0; i != v30; i = (char *)i + 1)
                {
                  if (*(void *)v101 != v31) {
                    objc_enumerationMutation(v23);
                  }
                  id v33 = *(void **)(*((void *)&v100 + 1) + 8 * i);
                  [v33 fetchPropertySetsIfNeeded];
                  id v34 = [v33 creationDate];
                  unsigned int v35 = [v34 betweenDate:v13 andDate:v14];

                  if (v35)
                  {
                    [v81 addObject:v33];
                    unsigned int v36 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                    {
                      long long v37 = [v33 localIdentifier];
                      long long v38 = [v33 creationDate];
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v37;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v38;
                      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "#photoscuration, fetched asset within timerange identifier, %@, creationDate, %@", buf, 0x16u);
                    }
                  }
                }
                id v30 = [v23 countByEnumeratingWithState:&v100 objects:v118 count:16];
              }
              while (v30);
            }
          }
        }

        uint64_t v16 = v75 + 1;
      }
      while ((id)(v75 + 1) != v73);
      id v73 = [obj countByEnumeratingWithState:&v105 objects:v120 count:16];
    }
    while (v73);
  }

  if ([v81 count])
  {
    id v40 = [(MOPhotoManager *)self configurationManager];
    uint64_t v41 = v40;
    if (a6 == 7) {
      [v40 getDoubleSettingForKey:@"Photos_DistanceFromHomeThreshold" withFallback:75.0];
    }
    else {
      [v40 getDoubleSettingForKey:@"Photos_DistanceFromDefaultThreshold" withFallback:200.0];
    }
    BOOL v78 = -[MOPhotoManager _getPhotosByAssetProperties:UserLocations:IsLocationCheckMandatory:MinDistance:](self, "_getPhotosByAssetProperties:UserLocations:IsLocationCheckMandatory:MinDistance:", v81, v64, v62);

    __int16 v44 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      id v45 = [v78 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "#photoscuration, total filtered photos count, %lu", buf, 0xCu);
    }

    uint64_t v46 = objc_opt_new();
    __int16 v80 = objc_opt_new();
    if ([v78 count])
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v47 = v78;
      id v48 = [v47 countByEnumeratingWithState:&v96 objects:v115 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v97;
        do
        {
          for (j = 0; j != v48; j = (char *)j + 1)
          {
            if (*(void *)v97 != v49) {
              objc_enumerationMutation(v47);
            }
            id v51 = *(void **)(*((void *)&v96 + 1) + 8 * (void)j);
            if ([(MOPhotoManager *)self _doesAssetHaveSceneProcessing:v51]
              || [(MOPhotoManager *)self _doesAssetHaveFaceProcessing:v51])
            {
              [v46 addObject:v51];
            }
            else
            {
              [v80 addObject:v51];
              v52 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                id v53 = [v51 uuid];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v53;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "#photoscuration, asset has not completed scene or face processing yet, %@", buf, 0xCu);
              }
            }
          }
          id v48 = [v47 countByEnumeratingWithState:&v96 objects:v115 count:16];
        }
        while (v48);
      }
    }
    unsigned int v54 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      id v55 = [v80 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v55;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "#photoscuration, total photos which need to request MAD process count, %lu", buf, 0xCu);
    }

    unsigned int v56 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      id v57 = [v46 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v57;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "#photoscuration, total final assets for bundling count, %lu", buf, 0xCu);
    }

    [(MOPhotoManager *)self _scheduleMediaAnalysisDeferredProcessing:v80];
    if ([v46 count])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v110 = __Block_byref_object_copy__34;
      v111 = __Block_byref_object_dispose__34;
      id v112 = (id)objc_opt_new();
      uint64_t v90 = 0;
      __int16 v91 = &v90;
      uint64_t v92 = 0x3032000000;
      __int16 v93 = __Block_byref_object_copy__34;
      id v94 = __Block_byref_object_dispose__34;
      id v95 = (id)objc_opt_new();
      uint64_t v84 = 0;
      uint64_t v85 = &v84;
      uint64_t v86 = 0x3032000000;
      __int16 v87 = __Block_byref_object_copy__34;
      id v88 = __Block_byref_object_dispose__34;
      id v89 = (id)objc_opt_new();
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = __133__MOPhotoManager__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke;
      v83[3] = &unk_1002D1410;
      v83[4] = buf;
      v83[5] = &v90;
      [(MOPhotoManager *)self _buildCuratedAssetMap:v46 handler:v83];
      if ((id)[(MOPhotoManager *)self gmsAvailabilityStatus] == (id)1
        || _os_feature_enabled_impl())
      {
        uint64_t v58 = v91[5];
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = __133__MOPhotoManager__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_2;
        v82[3] = &unk_1002CB180;
        v82[4] = &v84;
        [(MOPhotoManager *)self _fetchPhotosTraitsFromAssets:v58 StartDate:v13 EndDate:v14 handler:v82];
      }
      (*((void (**)(id, void, uint64_t, uint64_t, void))v65 + 2))(v65, *(void *)(*(void *)&buf[8] + 40), v91[5], v85[5], 0);
      _Block_object_dispose(&v84, 8);

      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      NSErrorUserInfoKey v113 = NSLocalizedDescriptionKey;
      CFStringRef v114 = @"#photoscuration, no curated filtered assets available";
      id v59 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      uint64_t v60 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v59];

      v61 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        v110 = v60;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "#photoscuration, fetchCuratedPhotosFromHighlights, start date, %@, end date, %@, error, %@", buf, 0x20u);
      }

      (*((void (**)(id, void, void, void, uint64_t (*)(uint64_t, uint64_t)))v65 + 2))(v65, 0, 0, 0, v60);
    }
  }
  else
  {
    NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
    CFStringRef v117 = @"#photoscuration, no curated highlights assets fetched from photos";
    id v42 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
    BOOL v78 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v42];

    id v43 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v110 = (uint64_t (*)(uint64_t, uint64_t))v78;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "#photoscuration, fetchCuratedPhotosFromHighlights, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }

    (*((void (**)(id, void, void, void, void *))v65 + 2))(v65, 0, 0, 0, v78);
  }
}

void __133__MOPhotoManager__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __133__MOPhotoManager__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)_fetchPhotosTraitsFromAssets:(id)a3 StartDate:(id)a4 EndDate:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id, void))a6;
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = v11;
    __int16 v45 = 2112;
    id v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets, startDate, %@, endDate, %@", buf, 0x16u);
  }

  unsigned int v15 = objc_opt_new();
  if ([v10 count])
  {
    id v33 = self;
    id v34 = v13;
    id v35 = v12;
    id v36 = v11;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v37 = v10;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          BOOL v22 = [v21 uuid];
          [v15 addObject:v22];

          id v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = [v21 uuid];
            *(_DWORD *)buf = 138412290;
            id v44 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets, asset uuid, %@", buf, 0xCu);
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v18);
    }

    photoLibrary = v33->_photoLibrary;
    id v38 = 0;
    BOOL v26 = [(PHPhotoLibrary *)photoLibrary requestPersonalTraitsForAssetsWithUUIDs:v15 error:&v38];
    id v27 = v38;
    if (v27)
    {
      NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
      CFStringRef v50 = @"#traits, no traits";
      id v28 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      id v29 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v28];

      id v30 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      id v12 = v35;
      id v11 = v36;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v44 = v36;
        __int16 v45 = 2112;
        id v46 = v35;
        __int16 v47 = 2112;
        id v48 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets, start date, %@, end date, %@, error, %@", buf, 0x20u);
      }

      id v13 = v34;
      ((void (**)(id, id, id))v34)[2](v34, 0, v27);
    }
    else
    {
      unsigned int v32 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      id v12 = v35;
      id v11 = v36;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v44 = v36;
        __int16 v45 = 2112;
        id v46 = v35;
        __int16 v47 = 2112;
        id v48 = v26;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets, startDate, %@, endDate, %@, traits, %@", buf, 0x20u);
      }

      id v29 = [v26 copy];
      v13[2](v13, v29, 0);
    }
    id v10 = v37;
  }
  else
  {
    uint64_t v31 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets early exit because asset count is zero", buf, 2u);
    }

    v13[2](v13, 0, 0);
  }
}

- (void)_fetchUnprocessedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 Locations:(id)a5 IsLocationCheckMandatory:(BOOL)a6 handler:(id)a7
{
  BOOL v75 = a6;
  id v82 = a3;
  id v83 = a4;
  id v78 = a5;
  id v81 = a7;
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v82;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v83;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#customcuration,fetchUnprocessedPhotosBetweenStartDate,startDate,%@, endDate,%@", buf, 0x16u);
  }

  id v12 = [(MOPhotoManager *)self photoLibrary];
  uint64_t v86 = [v12 librarySpecificFetchOptions];

  v113[0] = PHAssetPropertySetSceneAnalysis;
  v113[1] = PHAssetPropertySetMediaAnalysis;
  v113[2] = PHAssetPropertySetAesthetic;
  v113[3] = PHAssetPropertySetSceneprint;
  id v13 = +[NSArray arrayWithObjects:v113 count:4];
  [v86 setFetchPropertySets:v13];

  [v86 setShouldPrefetchCount:1];
  [v86 setIncludeGuestAssets:1];
  id v14 = +[NSPredicate predicateWithFormat:@"%K >= %@ && %K <= %@", @"creationDate", v82, @"creationDate", v83];
  [v86 setPredicate:v14];

  uint64_t v84 = +[PHAsset fetchAssetsWithOptions:v86];
  unsigned int v15 = [v84 fetchError];

  BOOL v16 = v15 == 0;
  id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  id v18 = v17;
  if (!v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v74 = [v84 fetchError];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v82;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v83;
      *(_WORD *)&buf[22] = 2112;
      id v104 = v74;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#customcuration,fetchUnprocessedPhotosBetweenStartDate, start date, %@, end date, %@, fetching assets hit error, %@", buf, 0x20u);
    }
    __int16 v87 = [v84 fetchError];
    (*((void (**)(id, void, void, void *))v81 + 2))(v81, 0, 0, v87);
    goto LABEL_77;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v19 = [v84 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#customcuration,fetchUnprocessedPhotosBetweenStartDate,count %lu", buf, 0xCu);
  }

  if ([v84 count])
  {
    __int16 v87 = objc_opt_new();
    uint64_t v85 = objc_opt_new();
    __int16 v80 = objc_opt_new();
    id v77 = objc_opt_new();
    unint64_t v76 = objc_opt_new();
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v20 = v84;
    id v21 = [v20 countByEnumeratingWithState:&v99 objects:v110 count:16];
    if (!v21) {
      goto LABEL_37;
    }
    uint64_t v22 = *(void *)v100;
    while (1)
    {
      id v23 = 0;
      do
      {
        if (*(void *)v100 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void **)(*((void *)&v99 + 1) + 8 * (void)v23);
        [v24 fetchPropertySetsIfNeeded];
        if (([v24 mediaSubtypes] & 4) == 0
          && ([v24 mediaSubtypes] & 0x80000) == 0
          && ([v24 mediaSubtypes] & 0x20000) == 0
          && [v24 mediaType] != (id)3)
        {
          uint64_t v25 = [v24 importProperties];
          if ([v25 importedBy] == (id)2) {
            goto LABEL_24;
          }
          BOOL v26 = [v24 importProperties];
          if ([v26 importedBy] == (id)1) {
            goto LABEL_23;
          }
          id v27 = [v24 importProperties];
          if ([v27 importedBy] == (id)8)
          {

LABEL_23:
LABEL_24:
          }
          else
          {
            id v36 = [v24 importProperties];
            BOOL v79 = [v36 importedBy] == (id)12;

            if (!v79) {
              goto LABEL_32;
            }
          }
          unsigned __int8 v28 = [v24 isFavorite];
          id v29 = v87;
          if ((v28 & 1) == 0)
          {
            id v30 = [v24 assetUserActivityProperties];
            BOOL v31 = (uint64_t)[v30 shareCount] > 0;

            id v29 = v85;
            if (!v31)
            {
              unsigned int v32 = [v24 assetUserActivityProperties];
              BOOL v33 = (uint64_t)[v32 viewCount] > 2;

              id v29 = v80;
              if (!v33)
              {
                id v34 = [v24 mediaAnalysisProperties];
                BOOL v35 = [v34 faceCount] == 0;

                if (v35) {
                  id v29 = v76;
                }
                else {
                  id v29 = v77;
                }
              }
            }
          }
          [v29 addObject:v24];
        }
LABEL_32:
        id v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v37 = [v20 countByEnumeratingWithState:&v99 objects:v110 count:16];
      id v21 = v37;
      if (!v37)
      {
LABEL_37:

        id v38 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v39 = [v87 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu favorite photo", buf, 0xCu);
        }

        long long v40 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          id v41 = [v85 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu shared photo", buf, 0xCu);
        }

        long long v42 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          id v43 = [v80 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu viewed photo", buf, 0xCu);
        }

        id v44 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          id v45 = [v77 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu people photo", buf, 0xCu);
        }

        id v46 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          id v47 = [v76 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v47;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu sortedRest photo", buf, 0xCu);
        }

        id v48 = objc_opt_new();
        [v48 addObjectsFromArray:v87];
        [v48 addObjectsFromArray:v85];
        [v48 addObjectsFromArray:v80];
        [v48 addObjectsFromArray:v77];
        [v48 addObjectsFromArray:v76];
        NSErrorUserInfoKey v49 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          id v50 = [v48 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "#customcuration,total asset count before location filtering,%lu", buf, 0xCu);
        }

        id v51 = [(MOPhotoManager *)self _getPhotosByAssetProperties:v48 UserLocations:v78 IsLocationCheckMandatory:v75 MinDistance:200.0];
        v52 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          id v53 = [v51 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v53;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "#customcuration,total filtered photos count,%lu", buf, 0xCu);
        }

        unsigned int v54 = objc_opt_new();
        id v55 = objc_opt_new();
        if ([v51 count])
        {
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v56 = v51;
          id v57 = [v56 countByEnumeratingWithState:&v95 objects:v109 count:16];
          if (v57)
          {
            uint64_t v58 = *(void *)v96;
            do
            {
              for (i = 0; i != v57; i = (char *)i + 1)
              {
                if (*(void *)v96 != v58) {
                  objc_enumerationMutation(v56);
                }
                uint64_t v60 = *(void *)(*((void *)&v95 + 1) + 8 * i);
                unsigned __int8 v61 = [(MOPhotoManager *)self _doesAssetHaveSceneProcessing:v60];
                BOOL v62 = v54;
                if ((v61 & 1) == 0)
                {
                  if ([(MOPhotoManager *)self _doesAssetHaveFaceProcessing:v60]) {
                    BOOL v62 = v54;
                  }
                  else {
                    BOOL v62 = v55;
                  }
                }
                [v62 addObject:v60];
              }
              id v57 = [v56 countByEnumeratingWithState:&v95 objects:v109 count:16];
            }
            while (v57);
          }
        }
        id v63 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          id v64 = [v55 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v64;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "#customcuration,total photos which need to request process count,%lu", buf, 0xCu);
        }

        id v65 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          id v66 = [v54 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v66;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "#customcuration,total final assets for bundling count,%lu", buf, 0xCu);
        }

        [(MOPhotoManager *)self _scheduleMediaAnalysisDeferredProcessing:v55];
        if ([v54 count])
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          id v104 = __Block_byref_object_copy__34;
          long long v105 = __Block_byref_object_dispose__34;
          id v106 = (id)objc_opt_new();
          uint64_t v89 = 0;
          uint64_t v90 = &v89;
          uint64_t v91 = 0x3032000000;
          uint64_t v92 = __Block_byref_object_copy__34;
          __int16 v93 = __Block_byref_object_dispose__34;
          id v94 = (id)objc_opt_new();
          v88[0] = _NSConcreteStackBlock;
          v88[1] = 3221225472;
          v88[2] = __109__MOPhotoManager__fetchUnprocessedPhotosBetweenStartDate_EndDate_Locations_IsLocationCheckMandatory_handler___block_invoke;
          v88[3] = &unk_1002D1410;
          v88[4] = buf;
          v88[5] = &v89;
          [(MOPhotoManager *)self _buildCuratedAssetMap:v54 handler:v88];
          id v67 = [*(id *)(*(void *)&buf[8] + 40) copy];
          id v68 = [(id)v90[5] copy];
          (*((void (**)(id, id, id, void))v81 + 2))(v81, v67, v68, 0);

          _Block_object_dispose(&v89, 8);
          _Block_object_dispose(buf, 8);
        }
        else
        {
          NSErrorUserInfoKey v107 = NSLocalizedDescriptionKey;
          CFStringRef v108 = @"#customcuration,no filtered curated photos inside the time range";
          uint64_t v71 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
          uint64_t v72 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v71];

          id v73 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v82;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v83;
            *(_WORD *)&buf[22] = 2112;
            id v104 = v72;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "#customcuration,no photo assets to bundle after filtering, start date, %@, end date, %@, error, %@", buf, 0x20u);
          }

          (*((void (**)(id, void, void, uint64_t (*)(uint64_t, uint64_t)))v81 + 2))(v81, 0, 0, v72);
        }

        goto LABEL_77;
      }
    }
  }
  NSErrorUserInfoKey v111 = NSLocalizedDescriptionKey;
  CFStringRef v112 = @"#customcuration,no unprocessed photos inside the time range";
  uint64_t v69 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
  __int16 v87 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v69];

  uint64_t v70 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v82;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v83;
    *(_WORD *)&buf[22] = 2112;
    id v104 = (uint64_t (*)(uint64_t, uint64_t))v87;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "#customcuration,fetchUnprocessedPhotosBetweenStartDate, start date, %@, end date, %@, error, %@", buf, 0x20u);
  }

  (*((void (**)(id, void, void, void *))v81 + 2))(v81, 0, 0, v87);
LABEL_77:
}

void __109__MOPhotoManager__fetchUnprocessedPhotosBetweenStartDate_EndDate_Locations_IsLocationCheckMandatory_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)_buildCuratedAssetMap:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v78 = (void (**)(id, id, id))a4;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#assetscore, buildCuratedAssetMap", buf, 2u);
  }

  id v80 = objc_alloc_init((Class)NSMutableDictionary);
  id v83 = objc_alloc_init((Class)NSMutableArray);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v104 objects:v118 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v105;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v105 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = [v11 uuid];
          [v11 curationScore];
          *(_DWORD *)buf = 138412546;
          id v111 = v13;
          __int16 v112 = 2048;
          NSErrorUserInfoKey v113 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#assetscore, asset, %@, score, %f", buf, 0x16u);
        }
        [v11 curationScore];
        if (v15 <= 2.22044605e-16)
        {
          BOOL v16 = [v11 uuid];
          [v83 addObject:v16];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v104 objects:v118 count:16];
    }
    while (v8);
  }

  id v17 = objc_alloc_init((Class)NSDictionary);
  id v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [v83 count];
    *(_DWORD *)buf = 134217984;
    id v111 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#assetscore, assetUUID count, %lu", buf, 0xCu);
  }

  id v20 = [v83 count];
  id v21 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  id v23 = v80;
  if (v20)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "#assetscore, assetUUIDs to request on demand score", buf, 2u);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v24 = v83;
    id v25 = [v24 countByEnumeratingWithState:&v100 objects:v117 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v101;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v101 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v100 + 1) + 8 * (void)j);
          id v30 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v111 = v29;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#assetscore, assetUUID, %@", buf, 0xCu);
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v100 objects:v117 count:16];
      }
      while (v26);
    }

    BOOL v31 = [(PHPhotoLibrary *)self->_photoLibrary photoAnalysisClient];
    id v99 = 0;
    unsigned int v32 = [v31 requestCurationScoreByAssetUUIDForAssetUUIDs:v24 error:&v99];
    id v33 = v99;

    id v34 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    id v21 = v34;
    if (v33)
    {
      id v23 = v80;
      id v76 = v33;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager _buildCuratedAssetMap:handler:]();
      }
    }
    else
    {
      id v23 = v80;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "#assetscore, requestCurationScoreByAssetUUIDForAssetUUIDs, successful", buf, 2u);
      }
      id v76 = 0;
    }
  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "#assetscore, no need to invoke requestCurationScoreByAssetUUIDForAssetUUIDs SPI", buf, 2u);
    }
    id v76 = 0;
    unsigned int v32 = v17;
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v84 = obj;
  id v35 = [v84 countByEnumeratingWithState:&v95 objects:v116 count:16];
  id obja = v32;
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v96;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(void *)v96 != v37) {
          objc_enumerationMutation(v84);
        }
        id v39 = *(void **)(*((void *)&v95 + 1) + 8 * (void)k);
        [v39 curationScore:v76];
        if (v40 <= 2.22044605e-16)
        {
          if (v32)
          {
            id v46 = [v39 uuid];
            long long v42 = [v32 objectForKeyedSubscript:v46];

            id v47 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            id v48 = v47;
            if (v42)
            {
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                NSErrorUserInfoKey v49 = [v39 uuid];
                id v50 = [v39 localIdentifier];
                [v42 floatValue];
                *(_DWORD *)buf = 138412802;
                id v111 = v49;
                __int16 v112 = 2112;
                NSErrorUserInfoKey v113 = v50;
                __int16 v114 = 2048;
                double v115 = v51;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "#assetscore, onDemandCurationScore for asset with uuid %@ and localIdentifier %@ is %f", buf, 0x20u);

                id v23 = v80;
              }

              [v23 setObject:v42 forKey:v39];
            }
            else
            {
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                v52 = [v39 uuid];
                id v53 = [v39 localIdentifier];
                *(_DWORD *)buf = 138412546;
                id v111 = v52;
                __int16 v112 = 2112;
                NSErrorUserInfoKey v113 = v53;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#assetscore, buildCuratedAssetMap, invalid score recieved for asset with uuid %@ and localIdentifier %@", buf, 0x16u);
              }
            }
            unsigned int v32 = obja;
          }
          else
          {
            long long v42 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "#assetscore, curationScoreByAssetUUID is nil", buf, 2u);
            }
          }
        }
        else
        {
          [v39 curationScore];
          id v41 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v23 setObject:v41 forKey:v39];

          long long v42 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            id v43 = [v39 uuid];
            id v44 = [v39 localIdentifier];
            [v39 curationScore];
            *(_DWORD *)buf = 138412802;
            id v111 = v43;
            __int16 v112 = 2112;
            NSErrorUserInfoKey v113 = v44;
            __int16 v114 = 2048;
            double v115 = v45;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "#assetscore, persistedCurationScore for asset with uuid %@ and localIdentifier %@ is %f", buf, 0x20u);

            unsigned int v32 = obja;
          }
        }
      }
      id v36 = [v84 countByEnumeratingWithState:&v95 objects:v116 count:16];
    }
    while (v36);
  }

  unsigned int v54 = [v23 keysSortedByValueUsingComparator:&__block_literal_global_43];
  if ((unint64_t)[v54 count] <= 0xD) {
    uint64_t v55 = (uint64_t)[v54 count];
  }
  else {
    uint64_t v55 = 13;
  }
  id v81 = v54;
  BOOL v79 = [v54 subarrayWithRange:0, v55, v76];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v56 = v23;
  id v57 = [v56 countByEnumeratingWithState:&v91 objects:v109 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v92;
    do
    {
      for (m = 0; m != v58; m = (char *)m + 1)
      {
        if (*(void *)v92 != v59) {
          objc_enumerationMutation(v56);
        }
        unsigned __int8 v61 = *(void **)(*((void *)&v91 + 1) + 8 * (void)m);
        BOOL v62 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          id v63 = [v61 localIdentifier];
          id v64 = [v56 objectForKey:v61];
          *(_DWORD *)buf = 138412546;
          id v111 = v63;
          __int16 v112 = 2112;
          NSErrorUserInfoKey v113 = v64;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "#assetscore, buildCuratedAssetMap, assetsInfo, asset.localIdentifier=%@ score=%@", buf, 0x16u);
        }
      }
      id v58 = [v56 countByEnumeratingWithState:&v91 objects:v109 count:16];
    }
    while (v58);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v65 = v79;
  id v66 = [v65 countByEnumeratingWithState:&v87 objects:v108 count:16];
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v88;
    do
    {
      for (n = 0; n != v67; n = (char *)n + 1)
      {
        if (*(void *)v88 != v68) {
          objc_enumerationMutation(v65);
        }
        uint64_t v70 = *(void **)(*((void *)&v87 + 1) + 8 * (void)n);
        uint64_t v71 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          uint64_t v72 = [v70 localIdentifier];
          id v73 = [v70 uuid];
          *(_DWORD *)buf = 138412546;
          id v111 = v72;
          __int16 v112 = 2112;
          NSErrorUserInfoKey v113 = v73;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "#assetscore, buildCuratedAssetMap, sortedKeysSubArray, asset.localIdentifier=%@, asset.uuid=%@", buf, 0x16u);
        }
      }
      id v67 = [v65 countByEnumeratingWithState:&v87 objects:v108 count:16];
    }
    while (v67);
  }

  id v74 = [v56 copy];
  id v75 = [v65 copy];
  v78[2](v78, v74, v75);
}

int64_t __48__MOPhotoManager__buildCuratedAssetMap_handler___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

- (void)_scheduleMediaAnalysisDeferredProcessing:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v84 objects:v97 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v85;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v85 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        if ([(MOPhotoManager *)self _doesAssetHaveSceneProcessing:v13]
          || (unsigned int v14 = [(MOPhotoManager *)self _doesAssetHaveFaceProcessing:v13],
              double v15 = v7,
              v14))
        {
          unsigned int v16 = [(MOPhotoManager *)self _doesAssetHaveSceneProcessing:v13];
          double v15 = v5;
          if (v16)
          {
            unsigned __int8 v17 = [(MOPhotoManager *)self _doesAssetHaveFaceProcessing:v13];
            double v15 = v6;
            if (v17) {
              continue;
            }
          }
        }
        [v15 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v84 objects:v97 count:16];
    }
    while (v10);
  }

  id v18 = +[VCPMediaAnalysisService analysisService];
  id v67 = v8;
  uint64_t v68 = v6;
  id v66 = v18;
  id v65 = v5;
  if ([v7 count])
  {
    id v19 = +[VCPMediaAnalysisService defaultDeferredProcessingTypes];
    id v20 = [v19 mutableCopy];

    id v83 = 0;
    BOOL v62 = v20;
    unsigned int v21 = [v18 requestDeferredProcessingTypes:v20 assets:v7 error:&v83];
    id v22 = v83;
    id v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v7 count];
      *(_DWORD *)buf = 134218498;
      id v92 = v24;
      __int16 v93 = 1024;
      unsigned int v94 = v21;
      __int16 v95 = 2112;
      id v96 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "#MADRequest, sceneAndFaceAnalysisPending count, %ld, result, %d, error, %@", buf, 0x1Cu);
    }
    uint64_t v59 = v22;

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v25 = v7;
    id v26 = [v25 countByEnumeratingWithState:&v79 objects:v90 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v80;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v80 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
          BOOL v31 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            unsigned int v32 = [v30 localIdentifier];
            *(_DWORD *)buf = 138412290;
            id v92 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#MADRequest, sceneAndFaceAnalysisPending, asset, %@", buf, 0xCu);
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v79 objects:v90 count:16];
      }
      while (v27);
    }

    id v8 = v67;
    id v6 = v68;
    id v18 = v66;
    id v5 = v65;
  }
  if ([v5 count])
  {
    id v33 = +[NSMutableIndexSet indexSet];
    [v33 addIndex:MADDeferredProcessingTypeScene];
    id v78 = 0;
    id v63 = v33;
    unsigned int v34 = [v18 requestDeferredProcessingTypes:v33 assets:v5 error:&v78];
    id v35 = v78;
    id v36 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = [v5 count];
      *(_DWORD *)buf = 134218498;
      id v92 = v37;
      __int16 v93 = 1024;
      unsigned int v94 = v34;
      __int16 v95 = 2112;
      id v96 = v35;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "#MADRequest, sceneAnalysisPending count, %ld, result, %d, error, %@", buf, 0x1Cu);
    }
    uint64_t v60 = v35;

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v38 = v5;
    id v39 = [v38 countByEnumeratingWithState:&v74 objects:v89 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v75;
      do
      {
        for (k = 0; k != v40; k = (char *)k + 1)
        {
          if (*(void *)v75 != v41) {
            objc_enumerationMutation(v38);
          }
          id v43 = *(void **)(*((void *)&v74 + 1) + 8 * (void)k);
          id v44 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            double v45 = [v43 localIdentifier];
            *(_DWORD *)buf = 138412290;
            id v92 = v45;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "#MADRequest, sceneAnalysisPending, asset, %@", buf, 0xCu);
          }
        }
        id v40 = [v38 countByEnumeratingWithState:&v74 objects:v89 count:16];
      }
      while (v40);
    }

    id v8 = v67;
    id v6 = v68;
    id v18 = v66;
    id v5 = v65;
  }
  if ([v6 count])
  {
    id v46 = +[NSMutableIndexSet indexSet];
    [v46 addIndex:MADDeferredProcessingTypeQuickFaceIdentification];
    id v73 = 0;
    id v64 = v46;
    unsigned int v47 = [v18 requestDeferredProcessingTypes:v46 assets:v6 error:&v73];
    id v48 = v73;
    NSErrorUserInfoKey v49 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      id v50 = [v6 count];
      *(_DWORD *)buf = 134218498;
      id v92 = v50;
      __int16 v93 = 1024;
      unsigned int v94 = v47;
      __int16 v95 = 2112;
      id v96 = v48;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "#MADRequest, faceAnalysisPending count, %ld, result, %d, error, %@", buf, 0x1Cu);
    }
    unsigned __int8 v61 = v48;

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v51 = v6;
    id v52 = [v51 countByEnumeratingWithState:&v69 objects:v88 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v70;
      do
      {
        for (m = 0; m != v53; m = (char *)m + 1)
        {
          if (*(void *)v70 != v54) {
            objc_enumerationMutation(v51);
          }
          id v56 = *(void **)(*((void *)&v69 + 1) + 8 * (void)m);
          id v57 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            id v58 = [v56 localIdentifier];
            *(_DWORD *)buf = 138412290;
            id v92 = v58;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "#MADRequest, faceAnalysisPending, asset, %@", buf, 0xCu);
          }
        }
        id v53 = [v51 countByEnumeratingWithState:&v69 objects:v88 count:16];
      }
      while (v53);
    }

    id v8 = v67;
    id v6 = v68;
    id v18 = v66;
    id v5 = v65;
  }
}

- (BOOL)_doesAssetHaveSceneProcessing:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sceneAnalysisProperties];
  unsigned int v5 = [v4 sceneAnalysisVersion];
  if (VCPPhotosSceneProcessingVersion == v5)
  {
    id v6 = [v4 sceneAnalysisTimestamp];
    id v7 = [v3 adjustmentVersion];
    unsigned __int8 v8 = [v6 isEqualToDate:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_doesAssetHaveFaceProcessing:(id)a3
{
  id v3 = a3;
  id v4 = [v3 faceAdjustmentVersion];
  unsigned int v5 = +[PHAsset quickClassificationFaceAdjustmentVersion];
  if ([v4 isEqualToDate:v5])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    id v7 = [v3 faceAdjustmentVersion];
    unsigned __int8 v8 = [v3 adjustmentVersion];
    unsigned __int8 v6 = [v7 isEqualToDate:v8];
  }
  return v6;
}

- (id)_calculateDistanceBetweenUserLocation:(id)a3 PhotoLocation:(id)a4
{
  unsigned int v5 = 0;
  if (a3 && a4)
  {
    [a3 distanceFromLocation:a4];
    unsigned int v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    uint64_t v4 = vars8;
  }
  return v5;
}

- (id)_getPhotosByAssetProperties:(id)a3 UserLocations:(id)a4 IsLocationCheckMandatory:(BOOL)a5 MinDistance:(double)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v133 = a4;
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v171 = [v133 count];
    __int16 v172 = 1024;
    *(_DWORD *)v173 = v7;
    *(_WORD *)&v173[4] = 2048;
    *(double *)&v173[6] = a6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#assetfilter, user location count, %lu, isLocationCheckMandatory, %d, minDistance, %f", buf, 0x1Cu);
  }
  BOOL v126 = v7;

  v127 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  v136 = objc_opt_new();
  v130 = objc_opt_new();
  id v135 = (id)objc_opt_new();
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v163 objects:v188 count:16];
  v137 = v11;
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v164;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v164 != v14) {
          objc_enumerationMutation(obj);
        }
        unsigned int v16 = *(void **)(*((void *)&v163 + 1) + 8 * i);
        if ([v16 mediaType] != (id)3
          && ([v16 mediaSubtypes] & 4) == 0
          && ([v16 mediaSubtypes] & 0x80000) == 0
          && ([v16 mediaSubtypes] & 0x20000) == 0)
        {
          unsigned __int8 v17 = [v16 importProperties];
          if ([v17 importedBy] == (id)2) {
            goto LABEL_17;
          }
          id v18 = [v16 importProperties];
          if ([v18 importedBy] == (id)1) {
            goto LABEL_16;
          }
          id v19 = [v16 importProperties];
          if ([v19 importedBy] == (id)8)
          {

            uint64_t v11 = v137;
LABEL_16:

LABEL_17:
LABEL_18:
            [v127 addObject:v16];
            id v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
              goto LABEL_24;
            }
            unsigned int v21 = [v16 localIdentifier];
            id v22 = [v16 creationDate];
            id v23 = [v16 mediaType];
            id v24 = [v16 mediaSubtypes];
            id v25 = [v16 importProperties];
            id v26 = [v25 importedBy];
            *(_DWORD *)buf = 138413314;
            v171 = v21;
            __int16 v172 = 2112;
            *(void *)v173 = v22;
            *(_WORD *)&v173[8] = 2048;
            *(void *)&v173[10] = v23;
            uint64_t v11 = v137;
            __int16 v174 = 2048;
            id v175 = v24;
            __int16 v176 = 2048;
            id v177 = v26;
            id v27 = v20;
            uint64_t v28 = "#assetfilter, Accepted curated asset by properties, localIdentifier, %@, creationDate, %@, mediaType, "
                  "%lu, mediaSubtypes, %lu, importProperties.importedBy, %lu";
            goto LABEL_23;
          }
          id v29 = [v16 importProperties];
          id v30 = [v29 importedBy];

          uint64_t v11 = v137;
          if (v30 == (id)12) {
            goto LABEL_18;
          }
        }
        id v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          goto LABEL_24;
        }
        unsigned int v21 = [v16 localIdentifier];
        id v22 = [v16 creationDate];
        id v31 = [v16 mediaType];
        id v32 = [v16 mediaSubtypes];
        id v25 = [v16 importProperties];
        id v33 = [v25 importedBy];
        *(_DWORD *)buf = 138413314;
        v171 = v21;
        __int16 v172 = 2112;
        *(void *)v173 = v22;
        *(_WORD *)&v173[8] = 2048;
        *(void *)&v173[10] = v31;
        uint64_t v11 = v137;
        __int16 v174 = 2048;
        id v175 = v32;
        __int16 v176 = 2048;
        id v177 = v33;
        id v27 = v20;
        uint64_t v28 = "#assetfilter, Denied curated asset by properties, localIdentifier, %@, creationDate, %@, mediaType, %lu, m"
              "ediaSubtypes, %lu, importProperties.importedBy, %lu";
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v28, buf, 0x34u);

LABEL_24:
      }
      id v13 = [obj countByEnumeratingWithState:&v163 objects:v188 count:16];
    }
    while (v13);
  }

  id v34 = [v133 count];
  os_log_t log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  BOOL v35 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v34)
  {
    if (v35)
    {
      id v36 = [v133 count];
      *(_DWORD *)buf = 134217984;
      v171 = v36;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "#assetfilter, User location(s) available for checking, count, %lu", buf, 0xCu);
    }

    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    os_log_t log = v127;
    id v37 = v130;
    id v132 = [log countByEnumeratingWithState:&v159 objects:v187 count:16];
    if (v132)
    {
      uint64_t v131 = *(void *)v160;
      double v38 = 1000.0;
      do
      {
        for (j = 0; j != v132; j = (char *)j + 1)
        {
          if (*(void *)v160 != v131) {
            objc_enumerationMutation(log);
          }
          id v40 = *(void **)(*((void *)&v159 + 1) + 8 * (void)j);
          uint64_t v41 = [v40 location];

          if (v41)
          {
            v134 = j;
            id v42 = objc_alloc((Class)RTLocation);
            id v43 = [v40 location];
            [v43 coordinate];
            double v45 = v44;
            id v46 = [v40 location];
            [v46 coordinate];
            double v48 = v47;
            NSErrorUserInfoKey v49 = [v40 location];
            [v49 horizontalAccuracy];
            id v51 = [v42 initWithLatitude:0 longitude:v45 horizontalUncertainty:v48 date:v50];

            long long v157 = 0u;
            long long v158 = 0u;
            long long v155 = 0u;
            long long v156 = 0u;
            id v141 = v133;
            id v52 = self;
            id v142 = [v141 countByEnumeratingWithState:&v155 objects:v186 count:16];
            if (!v142) {
              goto LABEL_66;
            }
            uint64_t v53 = *(void *)v156;
            uint64_t v139 = *(void *)v156;
            while (1)
            {
              for (k = 0; k != v142; k = (char *)k + 1)
              {
                if (*(void *)v156 != v53) {
                  objc_enumerationMutation(v141);
                }
                uint64_t v55 = *(void **)(*((void *)&v155 + 1) + 8 * (void)k);
                if ([v11 containsObject:v40])
                {
                  id v56 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                  if (!os_log_type_enabled(v56, OS_LOG_TYPE_INFO)) {
                    goto LABEL_64;
                  }
                  id v57 = [v40 localIdentifier];
                  *(_DWORD *)buf = 138412290;
                  v171 = v57;
                  id v58 = v56;
                  uint64_t v59 = "#assetfilter, Photo asset, %@, has already passed location check";
                  uint32_t v60 = 12;
LABEL_50:
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, v59, buf, v60);
                  goto LABEL_51;
                }
                id v56 = [(MOPhotoManager *)v52 _calculateDistanceBetweenUserLocation:v55 PhotoLocation:v51];
                if (!v56)
                {
                  id v57 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    id v58 = v57;
                    uint64_t v59 = "#assetfilter, Photo asset, distanceInMeters is nil";
                    uint32_t v60 = 2;
                    goto LABEL_50;
                  }
LABEL_51:

                  goto LABEL_64;
                }
                [v55 horizontalUncertainty];
                double v62 = a6;
                if (v61 + v61 > a6)
                {
                  [v55 horizontalUncertainty];
                  double v62 = v63 + v63;
                }
                id v64 = [(MOPhotoManager *)v52 configurationManager];
                [v64 getDoubleSettingForKey:@"Photos_DistanceFromDefaultMaxThreshold" withFallback:v38];
                if (v62 < v65)
                {
                  [v55 horizontalUncertainty];
                  double v68 = a6;
                  if (v69 + v69 > a6)
                  {
                    [v55 horizontalUncertainty];
                    double v68 = v70 + v70;
                  }
                }
                else
                {
                  id v66 = [(MOPhotoManager *)v52 configurationManager];
                  [v66 getDoubleSettingForKey:@"Photos_DistanceFromDefaultMaxThreshold" withFallback:v38];
                  double v68 = v67;
                }
                long long v71 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                {
                  [v55 latitude];
                  v138 = v72;
                  [v55 longitude];
                  double v73 = a6;
                  double v74 = v38;
                  uint64_t v76 = v75;
                  [v55 horizontalUncertainty];
                  uint64_t v78 = v77;
                  long long v79 = [v40 localIdentifier];
                  long long v80 = [v40 location];
                  [v80 coordinate];
                  long long v82 = v81;
                  id v83 = [v40 location];
                  [v83 coordinate];
                  uint64_t v85 = v84;
                  long long v86 = [v40 location];
                  [v86 horizontalAccuracy];
                  uint64_t v88 = v87;
                  [v56 doubleValue];
                  *(_DWORD *)buf = 134220034;
                  v171 = v138;
                  __int16 v172 = 2048;
                  *(void *)v173 = v76;
                  double v38 = v74;
                  a6 = v73;
                  *(_WORD *)&v173[8] = 2048;
                  *(void *)&v173[10] = v78;
                  __int16 v174 = 2112;
                  id v175 = v79;
                  __int16 v176 = 2048;
                  id v177 = v82;
                  __int16 v178 = 2048;
                  uint64_t v179 = v85;
                  __int16 v180 = 2048;
                  uint64_t v181 = v88;
                  __int16 v182 = 2048;
                  uint64_t v183 = v89;
                  __int16 v184 = 2048;
                  double v185 = v68;
                  _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "#assetfilter, userLocation, lat, %f, lon, %f, horizontalUncertainty, %f, Photo asset, %@, lat %f, lon, %f, horizontalAccuracy, %f, distanceInMeters, %f, distanceThreshold, %f", buf, 0x5Cu);

                  id v52 = self;
                  uint64_t v11 = v137;
                }
                [v56 doubleValue];
                uint64_t v53 = v139;
                if (v90 < v68)
                {
                  if (([v11 containsObject:v40] & 1) == 0) {
                    [v11 addObject:v40];
                  }
                  id v57 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                  {
                    long long v91 = [v40 localIdentifier];
                    [v56 doubleValue];
                    *(_DWORD *)buf = 138412802;
                    v171 = v91;
                    __int16 v172 = 2048;
                    *(void *)v173 = v92;
                    *(_WORD *)&v173[8] = 2048;
                    *(double *)&v173[10] = v68;
                    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "#assetfilter, Adding photo asset, %@, since distanceInMeters, %f is cleared, distanceThreshold, %f", buf, 0x20u);

                    id v52 = self;
                  }
                  goto LABEL_51;
                }
                __int16 v93 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
                {
                  unsigned int v94 = [v40 localIdentifier];
                  [v56 doubleValue];
                  *(_DWORD *)buf = 138412802;
                  v171 = v94;
                  __int16 v172 = 2048;
                  *(void *)v173 = v95;
                  *(_WORD *)&v173[8] = 2048;
                  *(double *)&v173[10] = v68;
                  _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "#assetfilter, Photo asset, %@, not added since distanceInMeters, %f is out of range, distanceThreshold, %f", buf, 0x20u);

                  id v52 = self;
                }

                [v136 addObject:v40];
LABEL_64:
              }
              id v142 = [v141 countByEnumeratingWithState:&v155 objects:v186 count:16];
              if (!v142)
              {
LABEL_66:

                id v37 = v130;
                j = v134;
                goto LABEL_69;
              }
            }
          }
          id v51 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            id v96 = [v40 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v171 = v96;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "#assetfilter, Filtering out, %@, location object is nil", buf, 0xCu);
          }
LABEL_69:
        }
        id v132 = [log countByEnumeratingWithState:&v159 objects:v187 count:16];
      }
      while (v132);
    }
  }
  else
  {
    if (v35)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "#assetfilter, No user location available for checking", buf, 2u);
    }
    id v37 = v130;
  }

  if (v126) {
    goto LABEL_93;
  }
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v97 = v127;
  id v98 = [v97 countByEnumeratingWithState:&v151 objects:v169 count:16];
  if (!v98) {
    goto LABEL_92;
  }
  id v99 = v98;
  uint64_t v100 = *(void *)v152;
  do
  {
    for (m = 0; m != v99; m = (char *)m + 1)
    {
      if (*(void *)v152 != v100) {
        objc_enumerationMutation(v97);
      }
      long long v102 = *(void **)(*((void *)&v151 + 1) + 8 * (void)m);
      long long v103 = [v102 location];
      if (v103 && [v133 count])
      {

        continue;
      }
      long long v104 = [v102 importProperties];
      if ([v104 importedBy] == (id)2)
      {
      }
      else
      {
        long long v105 = [v102 importProperties];
        id v106 = [v105 importedBy];

        uint64_t v11 = v137;
        if (v106 != (id)1) {
          continue;
        }
      }
      long long v107 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
      {
        CFStringRef v108 = [v102 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v171 = v108;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_INFO, "#assetfilter, Photo asset, %@, adding photo as fallback", buf, 0xCu);
      }
      [v130 addObject:v102];
    }
    id v99 = [v97 countByEnumeratingWithState:&v151 objects:v169 count:16];
  }
  while (v99);
LABEL_92:

  id v37 = v130;
LABEL_93:
  if ([v11 count])
  {
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v109 = v11;
    id v110 = [v109 countByEnumeratingWithState:&v147 objects:v168 count:16];
    if (v110)
    {
      id v111 = v110;
      uint64_t v112 = *(void *)v148;
      do
      {
        for (n = 0; n != v111; n = (char *)n + 1)
        {
          if (*(void *)v148 != v112) {
            objc_enumerationMutation(v109);
          }
          __int16 v114 = *(void **)(*((void *)&v147 + 1) + 8 * (void)n);
          double v115 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
          {
            NSErrorUserInfoKey v116 = [v114 localIdentifier];
            *(_DWORD *)buf = 138412290;
            v171 = v116;
            _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_INFO, "#assetfilter, filteredInAsset, %@", buf, 0xCu);
          }
          [v135 addObject:v114];
        }
        id v111 = [v109 countByEnumeratingWithState:&v147 objects:v168 count:16];
      }
      while (v111);
    }

    uint64_t v11 = v137;
    id v37 = v130;
  }
  if ([v37 count])
  {
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v117 = v37;
    id v118 = [v117 countByEnumeratingWithState:&v143 objects:v167 count:16];
    if (v118)
    {
      id v119 = v118;
      uint64_t v120 = *(void *)v144;
      do
      {
        for (ii = 0; ii != v119; ii = (char *)ii + 1)
        {
          if (*(void *)v144 != v120) {
            objc_enumerationMutation(v117);
          }
          v122 = *(void **)(*((void *)&v143 + 1) + 8 * (void)ii);
          if (([v135 containsObject:v122] & 1) == 0)
          {
            v123 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
            {
              v124 = [v122 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v171 = v124;
              _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "#assetfilter, fallbackResult, %@", buf, 0xCu);
            }
            [v135 addObject:v122];
          }
        }
        id v119 = [v117 countByEnumeratingWithState:&v143 objects:v167 count:16];
      }
      while (v119);
    }

    uint64_t v11 = v137;
    id v37 = v130;
  }

  return v135;
}

- (void)_fetchSharedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = objc_opt_new();
  id v39 = self;
  [v11 setPhotoLibrary:self->_syndicationPhotoLibrary];
  id v12 = +[NSPredicate predicateWithFormat:@"dateCreated > %@", v8];
  v53[0] = v12;
  id v13 = +[NSPredicate predicateWithFormat:@"additionalAttributes.importedByBundleIdentifier == %@", @"com.apple.MobileSMS"];
  v53[1] = v13;
  uint64_t v14 = +[NSArray arrayWithObjects:v53 count:2];
  double v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];
  [v11 setInternalPredicate:v15];

  unsigned int v16 = +[PHAsset fetchAssetsWithOptions:v11];
  unsigned __int8 v17 = v16;
  if (v16)
  {
    id v18 = [v16 fetchError];

    id v19 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    id v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v34 = [v17 fetchError];
        *(_DWORD *)buf = 138412802;
        id v46 = v34;
        __int16 v47 = 2112;
        id v48 = v8;
        __int16 v49 = 2112;
        id v50 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "fetch shared photos from photo library hit error, %@, start date, %@, end date, %@", buf, 0x20u);
      }
      unsigned int v21 = [v17 fetchError];
      v10[2](v10, 0, v21);
    }
    else
    {
      id v36 = v10;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        id v46 = [v17 countOfAssetCollections];
        __int16 v47 = 2112;
        id v48 = v8;
        __int16 v49 = 2112;
        id v50 = v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetch %lu shared photos from photo library, start date, %@, end date, %@", buf, 0x20u);
      }
      id v37 = v9;
      id v38 = v8;

      unsigned int v21 = objc_opt_new();
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      BOOL v35 = v17;
      id v24 = v17;
      id v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v41;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v41 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            id v30 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              id v31 = [v29 localIdentifier];
              id v32 = [v29 creationDate];
              *(_DWORD *)buf = 138412546;
              id v46 = v31;
              __int16 v47 = 2112;
              id v48 = v32;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, ",shared photo assetid, %@, creation date, %@", buf, 0x16u);
            }
            id v33 = [(MOPhotoManager *)v39 _createEventFromAsset:v29];
            [v21 addObject:v33];
          }
          id v26 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v26);
      }

      id v10 = v36;
      ((void (**)(id, void *, void *))v36)[2](v36, v21, 0);
      id v9 = v37;
      id v8 = v38;
      unsigned __int8 v17 = v35;
    }
  }
  else
  {
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    CFStringRef v52 = @"photo fetch result is nil";
    id v22 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    unsigned int v21 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v22];

    id v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v46 = v8;
      __int16 v47 = 2112;
      id v48 = v9;
      __int16 v49 = 2112;
      id v50 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "fetch result is nil from photo library, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }

    ((void (**)(id, void *, void *))v10)[2](v10, &__NSArray0__struct, v21);
  }
}

- (void)_fetchPhotoMemoriesBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoManager _fetchPhotoMemoriesBetweenStartDate:EndDate:handler:]();
  }

  id v13 = objc_opt_new();
  [v13 setPhotoLibrary:self->_photoLibrary];
  uint64_t v14 = +[NSPredicate predicateWithFormat:@"featuredState == %ul", 1];
  [v13 setInternalPredicate:v14];

  [v13 setIncludePendingMemories:1];
  double v15 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v13];
  unsigned int v16 = v15;
  if (!v15)
  {
    NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
    CFStringRef v61 = @"photo memory fetch result is nil";
    id v20 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    double v45 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v20];

    unsigned int v21 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v51 = v8;
      __int16 v52 = 2112;
      *(void *)uint64_t v53 = v9;
      *(_WORD *)&v53[8] = 2112;
      *(void *)uint64_t v54 = v45;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#PhotoMemory,memories fetch result is nil, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  unsigned __int8 v17 = [v15 fetchError];

  id v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v17)
  {
    if (v19)
    {
      id v36 = [v16 fetchError];
      *(_DWORD *)buf = 138412802;
      id v51 = v36;
      __int16 v52 = 2112;
      *(void *)uint64_t v53 = v8;
      *(_WORD *)&v53[8] = 2112;
      *(void *)uint64_t v54 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#PhotoMemory,fetch memories hit error, %@, start date, %@, end date, %@", buf, 0x20u);
    }
    double v45 = [v16 fetchError];
    v10[2](v10, 0, v45);
    goto LABEL_11;
  }
  if (v19) {
    -[MOPhotoManager _fetchPhotoMemoriesBetweenStartDate:EndDate:handler:](v16);
  }

  if (![v16 count])
  {
    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    CFStringRef v59 = @"photo memory fetch count is invalid";
    id v34 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    double v45 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v34];

    unsigned int v21 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[MOPhotoManager _fetchPhotoMemoriesBetweenStartDate:EndDate:handler:]();
    }
LABEL_10:

    ((void (**)(id, void *, void *))v10)[2](v10, &__NSArray0__struct, v45);
    goto LABEL_11;
  }
  id v38 = v13;
  id v39 = v11;
  long long v40 = v10;
  id v41 = v9;
  id v42 = v8;
  double v45 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v37 = v16;
  id v22 = v16;
  id v23 = [v22 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v47;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        unsigned int v28 = [(MOPhotoManager *)self isCandidateForMemoryEvent:v27];
        id v29 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          double v44 = [v27 localIdentifier];
          unsigned int v43 = [v27 pendingState];
          unsigned int v31 = [v27 isFavorite];
          id v32 = [v27 category];
          *(_DWORD *)buf = 138413314;
          id v51 = v44;
          __int16 v52 = 1024;
          *(_DWORD *)uint64_t v53 = v43;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v31;
          *(_WORD *)uint64_t v54 = 2048;
          *(void *)&v54[2] = v32;
          __int16 v55 = 1024;
          unsigned int v56 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "#PhotoMemory,memoryInfo,id,%@,pendingState,%hu,isFavorite,%d,category,%lu,isCandidateForMemoryEvent,isSelected,%d", buf, 0x28u);
        }
        if (v28)
        {
          id v30 = [(MOPhotoManager *)self _createEventFromPhotoMemory:v27];
          if (v30) {
            [v45 addObject:v30];
          }
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v24);
  }

  id v8 = v42;
  if ((unint64_t)[v45 count] < 4)
  {
    id v35 = v45;
    id v10 = v40;
    id v9 = v41;
    id v13 = v38;
    uint64_t v11 = v39;
  }
  else
  {
    id v10 = v40;
    id v9 = v41;
    id v13 = v38;
    uint64_t v11 = v39;
    if ((unint64_t)[v45 count] <= 3) {
      uint64_t v33 = (uint64_t)[v45 count];
    }
    else {
      uint64_t v33 = 3;
    }
    [v45 subarrayWithRange:0, v33];
    id v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  unsigned int v16 = v37;
  ((void (**)(id, id, void *))v10)[2](v10, v35, 0);

LABEL_11:
}

- (BOOL)isCandidateForMemoryEvent:(id)a3
{
  id v4 = a3;
  if ([(MOPhotoManager *)self isDesirableCategoryOrTrigger:v4])
  {
    +[PHMemory fetchMomentsBackingMemory:v4 options:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v33;
      id v9 = NSAssertionHandler_ptr;
      id v10 = NSAssertionHandler_ptr;
      *(void *)&long long v6 = 138413314;
      long long v27 = v6;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v13 = [v9[9] now:v27];
          uint64_t v14 = [v10[4] currentCalendar];
          double v15 = [v12 localStartDate];
          unsigned int v31 = (void *)v13;
          unsigned int v16 = [v14 components:120 fromDate:v15 toDate:v13 options:0];

          unsigned __int8 v17 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v29 = [v4 localIdentifier];
            id v30 = [v16 minute];
            id v18 = v7;
            uint64_t v19 = v8;
            id v20 = v4;
            id v21 = [v16 hour];
            id v22 = [v16 day];
            id v23 = [v16 month];
            *(_DWORD *)buf = v27;
            id v37 = v29;
            __int16 v38 = 2048;
            id v39 = v30;
            id v10 = NSAssertionHandler_ptr;
            __int16 v40 = 2048;
            id v41 = v21;
            id v4 = v20;
            uint64_t v8 = v19;
            id v7 = v18;
            __int16 v42 = 2048;
            id v43 = v22;
            __int16 v44 = 2048;
            id v45 = v23;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#PhotoMemory,memory,id,%@,Break down: %li min : %li hours : %li days : %li months", buf, 0x34u);

            id v9 = NSAssertionHandler_ptr;
          }

          id v24 = [v16 day];
          if ((unint64_t)v24 < 0x1C)
          {
            BOOL v25 = 1;
            goto LABEL_15;
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v25 = 0;
LABEL_15:
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)isDesirableCategoryOrTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isRejected])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = [v3 category];
    char v6 = (char)v5;
    BOOL v7 = (unint64_t)v5 > 0x18;
    uint64_t v23 = 0;
    v24[0] = &v23;
    v24[1] = 0x2020000000;
    char v25 = 0;
    uint64_t v8 = [v3 triggerTypes];
    char v4 = v7 | (0xD3FF7Fu >> v6);
    if (!v8
      || ([v3 triggerTypes],
          id v9 = objc_claimAutoreleasedReturnValue(),
          BOOL v10 = [v9 count] == 0,
          v9,
          v8,
          v10))
    {
      uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[MOPhotoManager isDesirableCategoryOrTrigger:](v4 & 1, v11);
      }
    }
    else
    {
      uint64_t v11 = objc_alloc_init((Class)NSMutableIndexSet);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = [v3 triggerTypes];
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v20;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v12);
            }
            -[NSObject addIndex:](v11, "addIndex:", [*(id *)(*((void *)&v19 + 1) + 8 * i) unsignedIntegerValue]);
          }
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
        }
        while (v13);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __47__MOPhotoManager_isDesirableCategoryOrTrigger___block_invoke;
      v18[3] = &unk_1002D1458;
      v18[4] = &v23;
      [v11 enumerateIndexesUsingBlock:v18];
      unsigned int v16 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        [(MOPhotoManager *)v4 & 1 isDesirableCategoryOrTrigger:v16];
      }

      char v4 = (v4 & 1) != 0 && *(unsigned char *)(v24[0] + 24) != 0;
    }

    _Block_object_dispose(&v23, 8);
  }

  return v4 & 1;
}

uint64_t __47__MOPhotoManager_isDesirableCategoryOrTrigger___block_invoke(uint64_t result, unint64_t a2, unsigned char *a3)
{
  if (a2 <= 0x19 && ((1 << a2) & 0x38288B4) != 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  *a3 = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
}

- (id)_createEventFromAsset:(id)a3
{
  id v4 = a3;
  id v5 = [MOEvent alloc];
  char v6 = +[NSUUID UUID];
  BOOL v7 = [v4 creationDate];
  uint64_t v8 = [v4 creationDate];
  id v9 = +[NSDate date];
  BOOL v10 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v8 creationDate:v9 provider:2 category:14];

  [(MOEvent *)v10 setPhotoMomentSource:3];
  uint64_t v11 = [v4 localIdentifier];
  [(MOEvent *)v10 setIdentifierFromProvider:v11];

  id v12 = [v4 creationDate];

  id v13 = [(MOPhotoManager *)self configurationManager];
  LODWORD(v14) = 1242802176;
  [v13 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v14];
  unsigned int v16 = [v12 dateByAddingTimeInterval:v15];
  [(MOEvent *)v10 setExpirationDate:v16];

  return v10;
}

- (id)_createEventFromPhotoMemory:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = [v4 localIdentifier];
    int v20 = 138412290;
    long long v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#PhotoMemory,_createEventFromPhotoMemory,%@", (uint8_t *)&v20, 0xCu);
  }
  BOOL v7 = [MOEvent alloc];
  uint64_t v8 = +[NSUUID UUID];
  id v9 = [v4 creationDate];
  BOOL v10 = [v4 creationDate];
  uint64_t v11 = +[NSDate date];
  id v12 = [(MOEvent *)v7 initWithEventIdentifier:v8 startDate:v9 endDate:v10 creationDate:v11 provider:2 category:17];

  id v13 = [v4 localIdentifier];
  [(MOEvent *)v12 setIdentifierFromProvider:v13];

  double v14 = [v4 creationDate];
  float v15 = [(MOPhotoManager *)self configurationManager];
  LODWORD(v16) = 1242802176;
  [v15 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v16];
  id v18 = [v14 dateByAddingTimeInterval:v17];
  [(MOEvent *)v12 setExpirationDate:v18];

  return v12;
}

- (void)fetchAndSaveSharedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __75__MOPhotoManager_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002CAD10;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(MOPhotoManager *)v9 _fetchSharedPhotosBetweenStartDate:a3 EndDate:a4 handler:v8];
}

void __75__MOPhotoManager_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
LABEL_4:
      v8();
    }
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        id v16 = [v5 count];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saving %lu shared photos", buf, 0xCu);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __75__MOPhotoManager_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler___block_invoke_406;
      v13[3] = &unk_1002C9A50;
      uint64_t v11 = *(void **)(a1 + 32);
      id v14 = *(id *)(a1 + 40);
      [v11 _saveEvents:v5 category:14 handler:v13];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no shared photos are fetched", buf, 2u);
      }

      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        uint64_t v8 = *(void (**)(void))(v12 + 16);
        goto LABEL_4;
      }
    }
  }
}

uint64_t __75__MOPhotoManager_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler___block_invoke_406(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchAndSavePhotoMemoriesStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoManager fetchAndSavePhotoMemoriesStartDate:EndDate:handler:]();
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke;
  v13[3] = &unk_1002CAD10;
  void v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [(MOPhotoManager *)self _fetchPhotoMemoriesBetweenStartDate:v8 EndDate:v9 handler:v13];
}

void __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
LABEL_4:
      v8();
    }
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v10) {
        __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_cold_2(v5);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_408;
      v13[3] = &unk_1002C9A50;
      uint64_t v11 = *(void **)(a1 + 32);
      id v14 = *(id *)(a1 + 40);
      [v11 _saveEvents:v5 category:17 handler:v13];
    }
    else
    {
      if (v10) {
        __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_cold_1();
      }

      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        id v8 = *(void (**)(void))(v12 + 16);
        goto LABEL_4;
      }
    }
  }
}

uint64_t __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_408(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_saveEvents:(id)a3 category:(unint64_t)a4 handler:(id)a5
{
  id v6 = a3;
  id v22 = a5;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoManager _saveEvents:category:handler:]();
  }

  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__34;
  id v37 = __Block_byref_object_dispose__34;
  id v38 = 0;
  eventStore = self->_eventStore;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __47__MOPhotoManager__saveEvents_category_handler___block_invoke;
  v32[3] = &unk_1002CADF8;
  v32[4] = &v33;
  [(MOEventStore *)eventStore fetchLastEventOfCategory:a4 CompletionHandler:v32];
  id v9 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v13);
        if (!v34[5]
          || (objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)v13), "startDate", v22),
              float v15 = objc_claimAutoreleasedReturnValue(),
              [(id)v34[5] startDate],
              id v16 = objc_claimAutoreleasedReturnValue(),
              unsigned int v17 = [v15 isAfterDate:v16],
              v16,
              v15,
              v17))
        {
          id v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            long long v19 = [v14 eventIdentifier];
            *(_DWORD *)buf = 134218242;
            unint64_t v40 = a4;
            __int16 v41 = 2112;
            __int16 v42 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "saving category %lu photo,event,%@,", buf, 0x16u);
          }
          [v9 addObject:v14];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v28 objects:v43 count:16];
    }
    while (v11);
  }

  int v20 = self->_eventStore;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __47__MOPhotoManager__saveEvents_category_handler___block_invoke_410;
  v25[3] = &unk_1002D1480;
  unint64_t v27 = a4;
  id v21 = v22;
  id v26 = v21;
  [(MOEventStore *)v20 storeEvents:v9 CompletionHandler:v25];

  _Block_object_dispose(&v33, 8);
}

void __47__MOPhotoManager__saveEvents_category_handler___block_invoke(uint64_t a1, void *a2)
{
}

void __47__MOPhotoManager__saveEvents_category_handler___block_invoke_410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__MOPhotoManager__saveEvents_category_handler___block_invoke_410_cold_1(a1, (uint64_t)v5, v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)rehydrateSharedPhotos:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOPhotoManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__MOPhotoManager_rehydrateSharedPhotos_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __48__MOPhotoManager_rehydrateSharedPhotos_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydrateSharedPhotos:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydrateSharedPhotos:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = objc_opt_new();
  id v9 = objc_opt_new();
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __49__MOPhotoManager__rehydrateSharedPhotos_handler___block_invoke;
  v51[3] = &unk_1002D14A8;
  id v10 = v8;
  id v52 = v10;
  id v45 = v9;
  id v53 = v45;
  [v6 enumerateObjectsUsingBlock:v51];
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v10 count];
    *(_DWORD *)buf = 134217984;
    id v58 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "start rehydrating shared photos with local identifiers, identifier count, %lu", buf, 0xCu);
  }

  if ([v10 count])
  {
    id v13 = objc_opt_new();
    [v13 setPhotoLibrary:self->_syndicationPhotoLibrary];
    id v14 = +[PHAsset fetchAssetsWithLocalIdentifiers:v10 options:v13];
    float v15 = v14;
    if (v14)
    {
      id v16 = [v14 fetchError];

      unsigned int v17 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      id v18 = v17;
      if (!v16)
      {
        __int16 v41 = v13;
        id v42 = v10;
        id v43 = v7;
        id v44 = v6;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v23 = [v15 count];
          *(_DWORD *)buf = 134217984;
          id v58 = v23;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "fetch %lu shared photos from syndication library for rehydration", buf, 0xCu);
        }

        id v19 = objc_alloc_init((Class)NSMutableArray);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        unint64_t v40 = v15;
        id obj = v15;
        id v24 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
        int v20 = v45;
        if (v24)
        {
          id v25 = v24;
          id v26 = &MOLogFacilityPhoto;
          uint64_t v27 = *(void *)v48;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v48 != v27) {
                objc_enumerationMutation(obj);
              }
              long long v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              long long v30 = [v29 localIdentifier];
              long long v31 = [v20 objectForKeyedSubscript:v30];

              if (v31)
              {
                id v32 = [v31 copy];
                [v32 setPhotoAsset:v29];
                uint64_t v33 = _mo_log_facility_get_os_log(v26);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  [v32 photoAsset];
                  id v34 = v19;
                  v36 = uint64_t v35 = v26;
                  id v37 = [v36 localIdentifier];
                  *(_DWORD *)buf = 138412290;
                  id v58 = v37;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "assigning photoassets %@", buf, 0xCu);

                  int v20 = v45;
                  id v26 = v35;
                  id v19 = v34;
                }

                [v19 addObject:v32];
              }
            }
            id v25 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
          }
          while (v25);
        }

        id v38 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = v19;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "shared photos rehydratedEvents %@", buf, 0xCu);
        }

        id v39 = [v19 copy];
        id v7 = v43;
        ((void (**)(id, id, id))v43)[2](v43, v39, 0);

        id v6 = v44;
        id v13 = v41;
        id v10 = v42;
        float v15 = v40;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager _rehydrateSharedPhotos:handler:](v15, v18);
      }

      id v19 = [v15 fetchError];
      v7[2](v7, 0, v19);
    }
    else
    {
      NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
      CFStringRef v56 = @"photo fetch result is nil";
      id v21 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      id v19 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v21];

      id v22 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager _rehydrateSharedPhotos:handler:]();
      }

      ((void (**)(id, void *, id))v7)[2](v7, &__NSArray0__struct, v19);
    }
    int v20 = v45;
LABEL_31:

    goto LABEL_32;
  }
  int v20 = v45;
  if (v7) {
    ((void (**)(id, void *, id))v7)[2](v7, &__NSArray0__struct, 0);
  }
LABEL_32:
}

void __49__MOPhotoManager__rehydrateSharedPhotos_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifierFromProvider];

  if (v4)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v3 identifierFromProvider];
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "adding identifier to assetLocalIdentifiers: %@", (uint8_t *)&v11, 0xCu);
    }
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v3 identifierFromProvider];
    [v7 addObject:v8];

    id v9 = *(void **)(a1 + 40);
    id v10 = [v3 identifierFromProvider];
    [v9 setObject:v3 forKey:v10];
  }
}

- (void)rehydratePhotoMemories:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking rehydratePhotoMemories", buf, 2u);
  }

  id v9 = [(MOPhotoManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__MOPhotoManager_rehydratePhotoMemories_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

id __49__MOPhotoManager_rehydratePhotoMemories_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydratePhotoMemories:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydratePhotoMemories:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.6();
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke;
  v52[3] = &unk_1002CBAD0;
  id v9 = (id)objc_opt_new();
  id v53 = v9;
  [v6 enumerateObjectsUsingBlock:v52];
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.5(v9);
  }

  if ([v9 count])
  {
    id v11 = objc_opt_new();
    id v45 = self;
    [v11 setPhotoLibrary:self->_photoLibrary];
    id v12 = +[NSPredicate predicateWithFormat:@"featuredState == %ul", 1];
    [v11 setInternalPredicate:v12];

    [v11 setIncludePendingMemories:1];
    id v13 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v11];
    id v14 = v13;
    if (v13)
    {
      float v15 = [v13 fetchError];

      id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      unsigned int v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.4(v14, v17);
        }

        id v18 = [v14 fetchError];
        goto LABEL_16;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[MOPhotoManager _rehydratePhotoMemories:handler:](v14);
      }

      if ([v14 count])
      {
        id v39 = v11;
        id v40 = v9;
        id v41 = v7;
        id v42 = v6;
        id v21 = objc_opt_new();
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v38 = v14;
        id v22 = v14;
        id v23 = [v22 countByEnumeratingWithState:&v48 objects:v64 count:16];
        id v24 = v45;
        id v43 = v22;
        id v44 = v21;
        if (v23)
        {
          id v25 = v23;
          uint64_t v26 = *(void *)v49;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v49 != v26) {
                objc_enumerationMutation(v22);
              }
              long long v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              unsigned int v29 = [(MOPhotoManager *)v24 isCandidateForMemoryEvent:v28];
              long long v30 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                long long v31 = [v28 localIdentifier];
                unsigned int v32 = [v28 pendingState];
                unsigned int v33 = [v28 isFavorite];
                id v34 = [v28 category];
                *(_DWORD *)buf = 138413314;
                NSErrorUserInfoKey v55 = v31;
                __int16 v56 = 1024;
                unsigned int v57 = v32;
                __int16 v58 = 1024;
                unsigned int v59 = v33;
                id v22 = v43;
                id v24 = v45;
                __int16 v60 = 2048;
                id v61 = v34;
                __int16 v62 = 1024;
                unsigned int v63 = v29;
                _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "#PhotoMemory,memoryInfo,id,%@,pendingState,%hu,isFavorite,%d,category,%lu,isCandidateForMemoryEvent,isSelected,%d", buf, 0x28u);

                id v21 = v44;
              }

              if (v29) {
                [v21 addObject:v28];
              }
            }
            id v25 = [v22 countByEnumeratingWithState:&v48 objects:v64 count:16];
          }
          while (v25);
        }

        if ((unint64_t)[v21 count] < 4)
        {
          id v37 = v21;
          id v7 = v41;
          id v6 = v42;
          id v11 = v39;
          id v9 = v40;
        }
        else
        {
          id v7 = v41;
          id v6 = v42;
          id v11 = v39;
          id v9 = v40;
          if ((unint64_t)[v21 count] <= 3) {
            uint64_t v35 = (uint64_t)[v21 count];
          }
          else {
            uint64_t v35 = 3;
          }
          [v21 subarrayWithRange:0, v35];
          id v37 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v14 = v38;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke_412;
        v46[3] = &unk_1002CA140;
        id v47 = v7;
        [(MOPhotoManager *)v45 _rehydrateStoredEvents:v6 fromPhotoMemories:v37 fetchResult:v43 handler:v46];

        id v18 = v44;
        goto LABEL_17;
      }
      NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
      CFStringRef v66 = @"photo memory fetch count is invalid";
      id v36 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      id v18 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v36];

      int v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[MOPhotoManager _rehydratePhotoMemories:handler:]();
      }
    }
    else
    {
      NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
      CFStringRef v68 = @"photo memory fetch result is nil";
      id v19 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      id v18 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v19];

      int v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[MOPhotoManager _rehydratePhotoMemories:handler:]();
      }
    }

LABEL_16:
    (*((void (**)(id, void *, void *))v7 + 2))(v7, &__NSArray0__struct, v18);
LABEL_17:

    goto LABEL_18;
  }
  if (v7) {
    (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSArray0__struct, 0);
  }
LABEL_18:
}

void __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifierFromProvider];

  if (v4)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke_cold_1(v3);
    }

    id v6 = *(void **)(a1 + 32);
    id v7 = [v3 identifierFromProvider];
    [v6 addObject:v7];
  }
}

uint64_t __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke_412(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateSharedPhotoEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOPhotoManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__MOPhotoManager_updateSharedPhotoEventsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__MOPhotoManager_updateSharedPhotoEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = v1[4];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __65__MOPhotoManager_updateSharedPhotoEventsDeletedAtSource_handler___block_invoke_2;
  v4[3] = &unk_1002C9A50;
  id v5 = *(id *)(a1 + 48);
  [v1 _updatePhotoEventsDeletedAtSource:v2 library:v3 handler:v4];
}

uint64_t __65__MOPhotoManager_updateSharedPhotoEventsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updatePhotoEventsDeletedAtSource:(id)a3 library:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v70 = a5;
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _updatePhotoEventsDeletedAtSource", buf, 2u);
  }

  id v10 = objc_opt_new();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v89 objects:v99 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v90;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v90 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v89 + 1) + 8 * i) identifierFromProvider];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v89 objects:v99 count:16];
    }
    while (v13);
  }

  unsigned int v17 = objc_opt_new();
  [v17 setPhotoLibrary:v8];
  [v17 setIncludeGuestAssets:1];
  double v69 = v17;
  id v18 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v10 options:v17];
  id v19 = v18;
  if (v18)
  {
    int v20 = [v18 fetchError];

    id v21 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v20)
    {
      id v23 = v70;
      if (v22)
      {
        id v24 = [v19 fetchError];
        *(_DWORD *)buf = 138412290;
        id v96 = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "fetch from photo library for purge hit error, %@", buf, 0xCu);
      }
      [v19 fetchError];
      v26 = id v25 = v19;
      (*((void (**)(id, void *, void *))v70 + 2))(v70, v26, &__NSDictionary0__struct);
    }
    else
    {
      CFStringRef v68 = v19;
      if (v22)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "fetch from photo library for purge succeed", buf, 2u);
      }

      uint64_t v26 = objc_opt_new();
      long long v72 = objc_opt_new();
      id v71 = objc_alloc_init((Class)NSMutableArray);
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v36 = v68;
      id v37 = [v36 countByEnumeratingWithState:&v84 objects:v94 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v85;
        do
        {
          for (j = 0; j != v38; j = (char *)j + 1)
          {
            if (*(void *)v85 != v39) {
              objc_enumerationMutation(v36);
            }
            id v41 = [*(id *)(*((void *)&v84 + 1) + 8 * (void)j) localIdentifier];
            [v26 addObject:v41];
          }
          id v38 = [v36 countByEnumeratingWithState:&v84 objects:v94 count:16];
        }
        while (v38);
      }
      id v66 = v8;

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id obj = v11;
      id v42 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v81;
        do
        {
          for (k = 0; k != v43; k = (char *)k + 1)
          {
            if (*(void *)v81 != v44) {
              objc_enumerationMutation(obj);
            }
            long long v46 = *(void **)(*((void *)&v80 + 1) + 8 * (void)k);
            id v47 = [v46 identifierFromProvider];
            unsigned __int8 v48 = [v26 containsObject:v47];

            long long v49 = (char *)[v46 rehydrationFailCount];
            if (v48)
            {
              if (v49)
              {
                long long v50 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v46 category] provider:[v46 provider] failureCount:[v46 rehydrationFailCount]];
                id v79 = 0;
                [(MORehydrationThresholdMetrics *)v50 submitMetricsWithError:&v79];
                id v51 = v79;
                [v46 setRehydrationFailCount:0];
                [v71 addObject:v46];
              }
            }
            else
            {
              [v46 setRehydrationFailCount:v49 + 1];
              [v72 addObject:v46];
            }
          }
          id v43 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
        }
        while (v43);
      }

      id v52 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        id v53 = [v72 count];
        *(_DWORD *)buf = 134217984;
        id v96 = v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "invalid photo moments count, %lu", buf, 0xCu);
      }

      uint64_t v54 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      id v23 = v70;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        id v55 = [v71 count];
        *(_DWORD *)buf = 134217984;
        id v96 = v55;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "previously rehydration failed photo moments now are found count, %lu", buf, 0xCu);
      }

      id v64 = [MORehydrationMetrics alloc];
      __int16 v56 = [obj firstObject];
      id v57 = [v56 category];
      __int16 v58 = [obj firstObject];
      unsigned int v59 = [[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v64, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v57, [v58 provider], 1, 0, [obj count], 1, (double)(int)[v72 count], (double)(int)[v71 count]);

      id v78 = 0;
      [(MORehydrationMetrics *)v59 submitMetricsWithError:&v78];
      id v60 = v78;
      id v61 = [v72 copy];
      [v71 addObjectsFromArray:v61];

      __int16 v62 = [(MOPhotoManager *)self eventStore];
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke;
      v74[3] = &unk_1002CE280;
      id v75 = v71;
      uint64_t v76 = self;
      id v77 = v70;
      id v63 = v71;
      [v62 storeEvents:v63 CompletionHandler:v74];

      id v25 = v68;
      id v8 = v66;
    }
  }
  else
  {
    id v65 = v8;
    NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
    CFStringRef v98 = @"photo fetch result is nil";
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    uint64_t v26 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v27];

    long long v28 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MOPhotoManager _updatePhotoEventsDeletedAtSource:library:handler:]();
    }

    id v23 = v70;
    (*((void (**)(id, void *, void *))v70 + 2))(v70, v26, &__NSDictionary0__struct);
    unsigned int v29 = [MORehydrationMetrics alloc];
    long long v30 = [v11 firstObject];
    id v31 = [v30 category];
    unsigned int v32 = [v11 firstObject];
    id v33 = [v32 provider];
    id v34 = [v26 description];
    uint64_t v35 = [[MORehydrationMetrics alloc] initWithCategory:v29 provider:v31 spiSuccess:v33 spiError:v34 failCount:[v11 count] successAfterPreFailCount:1 totalCount:[v11 count] rehydrationTrigger:0.0];

    uint64_t v88 = 0;
    [(MORehydrationMetrics *)v35 submitMetricsWithError:&v88];

    id v8 = v65;
    id v25 = 0;
  }
}

void __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [a1[4] count];
    *(_DWORD *)buf = 134217984;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "update photo succeeded, count, %lu", buf, 0xCu);
  }

  id v10 = [a1[5] queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke_415;
  block[3] = &unk_1002D14D0;
  id v11 = a1[6];
  id v16 = v6;
  id v17 = v11;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

uint64_t __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke_415(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updatePhotoMemoriesEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking updatePhotoMemoriesEventsDeletedAtSource", buf, 2u);
  }

  id v9 = [(MOPhotoManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__MOPhotoManager_updatePhotoMemoriesEventsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __67__MOPhotoManager_updatePhotoMemoriesEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = v1[3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __67__MOPhotoManager_updatePhotoMemoriesEventsDeletedAtSource_handler___block_invoke_2;
  v4[3] = &unk_1002C9A50;
  id v5 = *(id *)(a1 + 48);
  [v1 _updatePhotoMemoriesDeletedAtSource:v2 library:v3 handler:v4];
}

uint64_t __67__MOPhotoManager_updatePhotoMemoriesEventsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updatePhotoMemoriesDeletedAtSource:(id)a3 library:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id, void *))a5;
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _updatePhotoMemoriesDeletedAtSource", buf, 2u);
  }

  id v10 = objc_opt_new();
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v100 objects:v110 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v101;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v101 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v100 + 1) + 8 * i) identifierFromProvider];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v100 objects:v110 count:16];
    }
    while (v13);
  }

  id v17 = objc_opt_new();
  [v17 setPhotoLibrary:self->_photoLibrary];
  id v18 = +[NSPredicate predicateWithFormat:@"featuredState == %ul", 1];
  [v17 setInternalPredicate:v18];

  [v17 setIncludePendingMemories:1];
  id v79 = v17;
  id v19 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v17];
  int v20 = v19;
  if (!v19)
  {
    id v78 = 0;
    NSErrorUserInfoKey v108 = NSLocalizedDescriptionKey;
    CFStringRef v109 = @"photo memory fetch result is nil";
    id v33 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
    unsigned int v32 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v33];

    id v34 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v107 = v32;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "#PhotoMemory,memories fetch during purge is nil, error, %@", buf, 0xCu);
    }

    v8[2](v8, v32, &__NSDictionary0__struct);
    uint64_t v35 = [MORehydrationMetrics alloc];
    id v36 = [v11 firstObject];
    id v37 = [v36 category];
    id v38 = [v11 firstObject];
    uint64_t v39 = v8;
    id v40 = [v38 provider];
    id v41 = [(MOMetric *)v32 description];
    double v42 = (double)(int)[v11 count];
    id v43 = [v11 count];
    id v44 = v37;
    long long v30 = v39;
    id v45 = [(MORehydrationMetrics *)v35 initWithCategory:v44 provider:v40 spiSuccess:0 spiError:v41 failCount:v43 successAfterPreFailCount:1 totalCount:v42 rehydrationTrigger:0.0];

    uint64_t v99 = 0;
    [(MORehydrationMetrics *)v45 submitMetricsWithError:&v99];

    goto LABEL_43;
  }
  id v21 = [v19 fetchError];

  BOOL v22 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  id v23 = v22;
  if (!v21)
  {
    uint64_t v76 = self;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v46 = (MORehydrationMetrics *)[v20 count];
      *(_DWORD *)buf = 134217984;
      long long v107 = v46;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "#PhotoMemory,fetch memory result count for purge, %lu", buf, 0xCu);
    }
    id v77 = v8;

    unsigned int v32 = (MORehydrationMetrics *)objc_opt_new();
    long long v81 = objc_opt_new();
    id v80 = objc_alloc_init((Class)NSMutableArray);
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v78 = v20;
    id v47 = v20;
    id v48 = [v47 countByEnumeratingWithState:&v94 objects:v105 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v95;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v95 != v50) {
            objc_enumerationMutation(v47);
          }
          id v52 = [*(id *)(*((void *)&v94 + 1) + 8 * (void)j) localIdentifier];
          [(MORehydrationMetrics *)v32 addObject:v52];
        }
        id v49 = [v47 countByEnumeratingWithState:&v94 objects:v105 count:16];
      }
      while (v49);
    }

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = v11;
    id v53 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v91;
      do
      {
        for (k = 0; k != v54; k = (char *)k + 1)
        {
          if (*(void *)v91 != v55) {
            objc_enumerationMutation(obj);
          }
          id v57 = *(void **)(*((void *)&v90 + 1) + 8 * (void)k);
          __int16 v58 = [v57 identifierFromProvider];
          unsigned __int8 v59 = [(MORehydrationMetrics *)v32 containsObject:v58];

          id v60 = (char *)[v57 rehydrationFailCount];
          if (v59)
          {
            if (v60)
            {
              id v61 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v57 category] provider:[v57 provider] failureCount:[v57 rehydrationFailCount]];
              id v89 = 0;
              [(MORehydrationThresholdMetrics *)v61 submitMetricsWithError:&v89];
              id v62 = v89;
              [v57 setRehydrationFailCount:0];
              [v80 addObject:v57];
            }
          }
          else
          {
            [v57 setRehydrationFailCount:v60 + 1];
            [v81 addObject:v57];
          }
        }
        id v54 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
      }
      while (v54);
    }

    id v63 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      id v64 = (MORehydrationMetrics *)[v81 count];
      *(_DWORD *)buf = 134217984;
      long long v107 = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "invalid photo memories count, %lu", buf, 0xCu);
    }

    id v65 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    long long v30 = v77;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      id v66 = (MORehydrationMetrics *)[v80 count];
      *(_DWORD *)buf = 134217984;
      long long v107 = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "previously rehdyration failed photo memories now are found,  count, %lu", buf, 0xCu);
    }

    id v75 = [MORehydrationMetrics alloc];
    NSErrorUserInfoKey v67 = [obj firstObject];
    id v68 = [v67 category];
    double v69 = [obj firstObject];
    id v70 = [-MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v75, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v68, [v69 provider], 1, 0, [obj count], 1, (double)(int)[v81 count], (double)(int)[v80 count]);

    id v88 = 0;
    [(MORehydrationMetrics *)v70 submitMetricsWithError:&v88];
    id v71 = v88;
    id v72 = [v81 copy];
    [v80 addObjectsFromArray:v72];

    double v73 = [(MOPhotoManager *)v76 eventStore];
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke;
    v84[3] = &unk_1002CE280;
    id v85 = v80;
    long long v86 = v76;
    long long v87 = v77;
    id v74 = v80;
    [v73 storeEvents:v74 CompletionHandler:v84];

LABEL_43:
    int v20 = v78;
    goto LABEL_44;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[MOPhotoManager _updatePhotoMemoriesDeletedAtSource:library:handler:](v20, v23);
  }

  id v24 = [v20 fetchError];
  v8[2](v8, v24, &__NSDictionary0__struct);

  id obja = [MORehydrationMetrics alloc];
  id v25 = [v11 firstObject];
  id v26 = [v25 category];
  uint64_t v27 = [v11 firstObject];
  id v28 = [v27 provider];
  unsigned int v29 = [v20 fetchError];
  [v29 description];
  v31 = long long v30 = v8;
  unsigned int v32 = [-[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](obja, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v26, v28, 0, v31, [v11 count], 1, (double)(int)objc_msgSend(v11, "count"), 0.0);

  uint64_t v98 = 0;
  [(MORehydrationMetrics *)v32 submitMetricsWithError:&v98];
LABEL_44:
}

void __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [a1[4] count];
    *(_DWORD *)buf = 134217984;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "update photo memories succeeded, count, %lu", buf, 0xCu);
  }

  id v10 = [a1[5] queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke_416;
  block[3] = &unk_1002D14D0;
  id v11 = a1[6];
  id v16 = v6;
  id v17 = v11;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

uint64_t __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke_416(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)fetchAssetUsingID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetchAssetUsingID,identifier,%@", buf, 0xCu);
    }

    id v10 = [(MOPhotoManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke;
    block[3] = &unk_1002CAD38;
    void block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetchAssetUsingID,identifier,is nil", buf, 2u);
    }

    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"identifier is nil";
    id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v12 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v11];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke(void *a1)
{
  uint64_t v2 = objc_opt_new();
  [v2 setPhotoLibrary:*(void *)(a1[4] + 24)];
  [v2 setIncludeGuestAssets:1];
  uint64_t v3 = objc_opt_new();
  [v3 addObject:a1[5]];
  id v4 = +[PHAsset fetchAssetsWithLocalIdentifiers:v3 options:v2];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 fetchError];

    if (v6)
    {
      id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke_cold_2(v5, v7);
      }

      uint64_t v8 = a1[6];
      BOOL v9 = [v5 fetchError];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
    else
    {
      BOOL v9 = [v5 objectAtIndexedSubscript:0];
      id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "fetchAssetUsingID,photoAsset,%@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v13 = a1[6];
      id v14 = [v9 copy];
      (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v14, 0);
    }
  }
  else
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"photo fetch result is nil";
    id v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    BOOL v9 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v10];

    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke_cold_1();
    }

    (*(void (**)(void, void, void *))(a1[6] + 16))(a1[6], 0, v9);
  }
}

- (void)_rehydrateStoredEvents:(id)a3 fromPhotoMemories:(id)a4 fetchResult:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void))a6;
  uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _rehydrateStoredEvents", buf, 2u);
  }

  if ([v9 count])
  {
    if ([v10 count])
    {
      id v49 = v12;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = __79__MOPhotoManager__rehydrateStoredEvents_fromPhotoMemories_fetchResult_handler___block_invoke;
      v65[3] = &unk_1002CBAD0;
      id v14 = (id)objc_opt_new();
      id v66 = v14;
      id v52 = v9;
      [v9 enumerateObjectsUsingBlock:v65];
      id v56 = objc_alloc_init((Class)NSMutableArray);
      id v53 = objc_alloc_init((Class)NSMutableArray);
      id v16 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      id v50 = v11;
      uint64_t v55 = +[PHAsset fetchKeyAssetByMemoryUUIDForMemories:v11 options:v16];

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v51 = v10;
      id obj = v10;
      id v17 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v62;
        do
        {
          int v20 = 0;
          do
          {
            if (*(void *)v62 != v19) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v20);
            id v23 = [v21 localIdentifier];
            id v24 = [v14 objectForKeyedSubscript:v23];

            if (v24)
            {
              id v25 = [v24 copy];
              id v26 = [v21 uuid];
              uint64_t v27 = [v55 objectForKeyedSubscript:v26];

              [(MOPhotoManager *)self _setDynamicPropertiesForMemoryEvent:v25 fromMemory:v21 keyAsset:v27];
              if ([v25 rehydrationFailCount])
              {
                __int16 v58 = [MORehydrationThresholdMetrics alloc];
                id v28 = [v25 category];
                unsigned int v29 = v27;
                long long v30 = v22;
                id v31 = v18;
                uint64_t v32 = v19;
                id v33 = v14;
                id v34 = [v24 provider];
                id v35 = [v25 rehydrationFailCount];
                id v36 = v34;
                id v14 = v33;
                uint64_t v19 = v32;
                id v18 = v31;
                BOOL v22 = v30;
                uint64_t v27 = v29;
                id v37 = [(MORehydrationThresholdMetrics *)v58 initWithCategory:v28 provider:v36 failureCount:v35];
                uint64_t v60 = 0;
                [(MORehydrationThresholdMetrics *)v37 submitMetricsWithError:&v60];
                [v25 setRehydrationFailCount:0];
                [v53 addObject:v25];
              }
              [v56 addObject:v25];
            }
            int v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
        }
        while (v18);
      }
      id v48 = v14;

      id v12 = v49;
      v49[2](v49, v56, 0);
      id v40 = [MORehydrationMetrics alloc];
      id v9 = v52;
      id v41 = [v52 firstObject];
      id v42 = [v41 category];
      id v43 = [v52 firstObject];
      id v44 = [[MORehydrationMetrics alloc] initWithCategory:v40 provider:[v43 provider] spiSuccess:1 spiError:0 failCount:[v52 count] successAfterPreFailCount:[v56 count] totalCount:[v53 count] rehydrationTrigger:(double)(int)([v52 count] - [v56 count])];

      uint64_t v59 = 0;
      [(MORehydrationMetrics *)v44 submitMetricsWithError:&v59];

      id v11 = v50;
      id v10 = v51;
    }
    else
    {
      long long v46 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager _rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:]();
      }

      v12[2](v12, &__NSArray0__struct, 0);
      id v47 = [[MORehydrationMetrics alloc] initWithCategory:17 provider:2 spiSuccess:1 spiError:0 failCount:[v9 count] successAfterPreFailCount:3 totalCount:([v9 count]) rehydrationTrigger:0.0];
      uint64_t v67 = 0;
      [(MORehydrationMetrics *)v47 submitMetricsWithError:&v67];
    }
  }
  else
  {
    id v45 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[MOPhotoManager _rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:]();
    }

    v12[2](v12, &__NSArray0__struct, 0);
  }
}

void __79__MOPhotoManager__rehydrateStoredEvents_fromPhotoMemories_fetchResult_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifierFromProvider];

  if (v4)
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v3 identifierFromProvider];
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "rehydrateEvents:adding identifier to localIdentifierToEventMap: %@", (uint8_t *)&v9, 0xCu);
    }
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v3 identifierFromProvider];
    [v7 setObject:v3 forKey:v8];
  }
}

- (id)_fetchCuratedAssetsForPhotoMemory:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _fetchCuratedAssetsForPhotoMemory", buf, 2u);
  }

  id v6 = objc_opt_new();
  [v6 setPhotoLibrary:self->_photoLibrary];
  [v6 setIncludeGuestAssets:1];
  id v7 = +[PHAsset fetchCustomUserAssetsInMemory:v4 options:v6];
  if (![v7 count])
  {
    uint64_t v8 = +[PHAsset fetchUserCuratedAssetsInMemory:v4 options:v6];

    id v7 = (void *)v8;
  }
  if ([v7 count])
  {
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v9 = +[PHAsset fetchCuratedAssetsInAssetCollection:v4 options:v6];

    id v7 = (void *)v9;
    if (!v9)
    {
LABEL_13:
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      CFStringRef v47 = @"photo memory asset fetch result is nil";
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      id v12 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v13];

      id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager _fetchCuratedAssetsForPhotoMemory:](v4);
      }

LABEL_16:
      int v15 = 0;
      goto LABEL_17;
    }
  }
  if (![v7 count]) {
    goto LABEL_13;
  }
  id v10 = [v7 fetchError];

  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MOPhotoManager _fetchCuratedAssetsForPhotoMemory:](v4, v7);
    }
    goto LABEL_16;
  }
  id v35 = v6;
  id v36 = v4;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v17 = [v7 count];
    *(_DWORD *)buf = 134217984;
    v44[0] = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#PhotoMemory,fetch asset result count, %lu", buf, 0xCu);
  }

  id v12 = objc_alloc_init((Class)NSMutableArray);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v34 = v7;
  id v18 = v7;
  id v19 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v19)
  {
    id v20 = v19;
    int v21 = 0;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v25 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          ++v21;
          *(_DWORD *)buf = 67109378;
          LODWORD(v44[0]) = v21;
          WORD2(v44[0]) = 2112;
          *(void *)((char *)v44 + 6) = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#PhotoMemory,asset,id,%d,asset,%@", buf, 0x12u);
        }

        id v26 = [v24 copy];
        [v12 addObject:v26];
      }
      id v20 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v20);
  }

  id v27 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"curationScore" ascending:0];
  id v42 = v27;
  id v28 = +[NSArray arrayWithObjects:&v42 count:1];
  unsigned int v29 = [v12 sortedArrayUsingDescriptors:v28];

  if ((unint64_t)[v29 count] <= 0xD) {
    uint64_t v30 = (uint64_t)[v29 count];
  }
  else {
    uint64_t v30 = 13;
  }
  id v31 = [v29 subarrayWithRange:0, v30];
  id v32 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"creationDate" ascending:1];
  id v41 = v32;
  id v33 = +[NSArray arrayWithObjects:&v41 count:1];
  int v15 = [v31 sortedArrayUsingDescriptors:v33];

  id v6 = v35;
  id v4 = v36;
  id v7 = v34;
LABEL_17:

  return v15;
}

- (void)_setDynamicPropertiesForMemoryEvent:(id)a3 fromMemory:(id)a4 keyAsset:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _setDynamicPropertiesForMemoryEvent", buf, 2u);
  }

  id v12 = [(MOPhotoManager *)self _fetchCuratedAssetsForPhotoMemory:v9];
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  id v51 = v10;
  if (v10)
  {
    if (v15)
    {
      id v16 = [v9 localIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)id v65 = v16;
      *(_WORD *)&v65[8] = 2112;
      *(void *)&v65[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#PhotoMemory, Key asset for memory,%@,is,%@ ", buf, 0x16u);
    }
    [v13 addObject:v10];
  }
  else
  {
    if (v15)
    {
      id v17 = [v9 localIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)id v65 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#PhotoMemory, Key asset is nil for memory,%@", buf, 0xCu);
    }
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v18 = v12;
  id v19 = [v18 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v59;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v59 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        if (([v13 containsObject:v23] & 1) == 0) {
          [v13 addObject:v23];
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v20);
  }

  id v24 = [v9 title];
  uint64_t v25 = [v9 subtitle];
  id v26 = (void *)v25;
  if (v24)
  {
    uint64_t v27 = [v24 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    if (v26)
    {
LABEL_21:
      uint64_t v28 = [v26 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if (v25) {
      goto LABEL_21;
    }
  }
  uint64_t v28 = 0;
LABEL_24:
  id v49 = (void *)v28;
  if (v27 | v28)
  {
    if (v27 && v28)
    {
      +[NSString stringWithFormat:@"%@\n%@", v27, v28];
    }
    else
    {
      if (v27) {
        uint64_t v29 = v27;
      }
      else {
        uint64_t v29 = v28;
      }
      +[NSString stringWithFormat:@"%@", v29, v48];
    uint64_t v30 = };
    [v8 setPhotoMemoryTitle:v30];
  }
  else
  {
    [v8 setPhotoMemoryTitle:&stru_1002D2AC8];
  }
  [v8 setPhotoMemoryCategory:[v9 category]];
  id v31 = [v9 subcategory];
  id v32 = [v8 photoEvent];
  [v32 setPhotoMemorySubCategory:v31];

  id v50 = (void *)v27;
  if ((unint64_t)[v13 count] <= 0xD) {
    uint64_t v33 = (uint64_t)[v13 count];
  }
  else {
    uint64_t v33 = 13;
  }
  id v34 = [v13 subarrayWithRange:0, v33];
  [v8 setPhotoMemoryAssets:v34];

  id v35 = [v9 isFavorite];
  id v36 = [v8 photoEvent];
  [v36 setPhotoMemoryIsFavorite:v35];

  id v52 = v9;
  [v9 currentRelevanceScore];
  double v38 = v37;
  long long v39 = [v8 photoEvent];
  [v39 setPhotoMemoryRelevanceScore:v38];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v53 = v8;
  long long v40 = [v8 photoMemoryAssets];
  id v41 = [v40 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v41)
  {
    id v42 = v41;
    int v43 = 0;
    uint64_t v44 = *(void *)v55;
    do
    {
      for (j = 0; j != v42; j = (char *)j + 1)
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(v40);
        }
        uint64_t v46 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
        CFStringRef v47 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          ++v43;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v65 = v43;
          *(_WORD *)&void v65[4] = 2112;
          *(void *)&v65[6] = v46;
          _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "#PhotoMemory,sortedasset,id,%d,asset,%@", buf, 0x12u);
        }
      }
      id v42 = [v40 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v42);
  }
}

- (void)fetchPhotoMemoryEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MOPhotoManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __90__MOPhotoManager_fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  block[3] = &unk_1002CA300;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

id __90__MOPhotoManager_fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPhotoMemoryEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchPhotoMemoryEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v43 = a3;
  id v44 = a4;
  id v40 = a5;
  double v38 = (void (**)(id, void *, void *))a6;
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v43;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v44;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#PhotoMemory,fetchPhotoMemoriesBetweenStartDate,startDate,%@,endDate,%@", buf, 0x16u);
  }

  id v42 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 17];
  id v41 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 2];
  v75[0] = v42;
  v75[1] = v41;
  id v10 = +[NSArray arrayWithObjects:v75 count:2];
  long long v39 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

  id v45 = [v40 filteredArrayUsingPredicate:v39];
  uint64_t v48 = objc_opt_new();
  [v48 setPhotoLibrary:self->_photoLibrary];
  id v11 = +[NSPredicate predicateWithFormat:@"featuredState == %ul", 1];
  [v48 setInternalPredicate:v11];

  [v48 setIncludePendingMemories:1];
  [v48 setFetchLimit:3];
  uint64_t v46 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v48];
  id v13 = [v46 fetchError];

  if (v13)
  {
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v46 fetchError];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v43;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&long long v72 = v44;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#PhotoMemory,fetch memories hit error, %@, start date, %@, end date, %@", buf, 0x20u);
    }
    id v16 = [v46 fetchError];
    v38[2](v38, v16, &__NSDictionary0__struct);

    id v17 = [MORehydrationMetrics alloc];
    id v18 = [v46 fetchError];
    id v19 = [v18 description];
    id v20 = [-MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v17, 17, 2, 0, v19, [v45 count], 3, (double)(int)objc_msgSend(v45, "count"), 0.0);

    uint64_t v70 = 0;
    [(MORehydrationMetrics *)v20 submitMetricsWithError:&v70];
  }
  else
  {
    id v21 = objc_opt_new();
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v46;
    id v22 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v67;
LABEL_9:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v67 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v66 + 1) + 8 * v24);
        unsigned int v26 = [(MOPhotoManager *)self isCandidateForMemoryEvent:v25];
        uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = [v25 localIdentifier];
          unsigned int v29 = [v25 pendingState];
          unsigned int v30 = [v25 isFavorite];
          id v31 = [v25 category];
          *(_DWORD *)buf = 138413314;
          *(void *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v29;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v30;
          LOWORD(v72) = 2048;
          *(void *)((char *)&v72 + 2) = v31;
          WORD5(v72) = 1024;
          HIDWORD(v72) = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "#PhotoMemory,memoryInfo,id,%@,pendingState,%hu,isFavorite,%d,category,%lu,isCandidateForMemoryEvent,isSelected,%d", buf, 0x28u);
        }
        if (v26) {
          [v21 addObject:v25];
        }
        if ((unint64_t)[v21 count] > 2) {
          break;
        }
        if (v22 == (id)++v24)
        {
          id v22 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
          if (v22) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    id v32 = v21;
    uint64_t v33 = dispatch_group_create();
    dispatch_group_enter(v33);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    *(void *)&long long v72 = __Block_byref_object_copy__34;
    *((void *)&v72 + 1) = __Block_byref_object_dispose__34;
    id v73 = 0;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
    v63[3] = &unk_1002C9D68;
    id v65 = buf;
    id v34 = v33;
    long long v64 = v34;
    [(MOPhotoManager *)self _rehydrateStoredEvents:v45 fromPhotoMemories:v32 fetchResult:obj handler:v63];
    dispatch_group_enter(v34);
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x3032000000;
    v61[3] = __Block_byref_object_copy__34;
    v61[4] = __Block_byref_object_dispose__34;
    id v62 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2;
    v58[3] = &unk_1002C9D68;
    long long v60 = v61;
    id v35 = v34;
    long long v59 = v35;
    [(MOPhotoManager *)self _createNewEventsFromPhotoMemories:v32 storedEvents:v45 handler:v58];
    id v36 = [(MOPhotoManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3;
    block[3] = &unk_1002D14F8;
    void block[4] = self;
    id v51 = v45;
    id v52 = v32;
    id v53 = v43;
    id v54 = v44;
    long long v56 = buf;
    long long v57 = v61;
    long long v55 = v38;
    id v37 = v32;
    dispatch_group_notify(v35, v36, block);

    _Block_object_dispose(v61, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) _findUnrehydratedEventsWithStoredEvents:*(void *)(a1 + 40) photoMemories:*(void *)(a1 + 48)];
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 56);
    id v6 = *(void **)(a1 + 64);
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
    id v9 = [v3 count];
    id v10 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138413570;
    long long v58 = v5;
    __int16 v59 = 2112;
    long long v60 = v6;
    __int16 v61 = 2048;
    id v62 = v7;
    __int16 v63 = 2048;
    id v64 = v8;
    __int16 v65 = 2048;
    id v66 = v9;
    __int16 v67 = 2048;
    id v68 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated memory events count, %lu, new memory event counts, %lu, unrehydrated memory events count, %lu, stored memory events.count, %lu", buf, 0x3Eu);
  }

  uint64_t v41 = a1;
  id v40 = v3;
  if (v3)
  {
    [v2 setObject:v3 forKey:@"unrehydratedEvents"];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v11 = v3;
    id v12 = [v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v51;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v51 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = [v16 eventIdentifier];
            id v19 = [v16 identifierFromProvider];
            *(_DWORD *)buf = 138412546;
            long long v58 = v18;
            __int16 v59 = 2112;
            long long v60 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#PhotoMemory,unrehydratedEvents,event id,%@,memory id,%@,", buf, 0x16u);
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v13);
    }

    a1 = v41;
    id v3 = v40;
  }
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v20)
  {
    [v2 setObject:v20 forKey:@"newEvents"];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v21 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    id v22 = [v21 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v47;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          unsigned int v26 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
          uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            uint64_t v28 = [v26 eventIdentifier];
            unsigned int v29 = [v26 identifierFromProvider];
            *(_DWORD *)buf = 138412546;
            long long v58 = v28;
            __int16 v59 = 2112;
            long long v60 = v29;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "#PhotoMemory,newEvents,event id,%@,memory id,%@,", buf, 0x16u);
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v23);
    }

    a1 = v41;
    id v3 = v40;
  }
  uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v30)
  {
    [v2 setObject:v30 forKey:@"rehydratedEvents"];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v31 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    id v32 = [v31 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v43;
      do
      {
        for (k = 0; k != v33; k = (char *)k + 1)
        {
          if (*(void *)v43 != v34) {
            objc_enumerationMutation(v31);
          }
          id v36 = *(void **)(*((void *)&v42 + 1) + 8 * (void)k);
          id v37 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            double v38 = [v36 eventIdentifier];
            long long v39 = [v36 identifierFromProvider];
            *(_DWORD *)buf = 138412546;
            long long v58 = v38;
            __int16 v59 = 2112;
            long long v60 = v39;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "#PhotoMemory,rehydratedEvents,event id,%@,memory id,%@,", buf, 0x16u);
          }
        }
        id v33 = [v31 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }
      while (v33);
    }

    a1 = v41;
    id v3 = v40;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)_createNewEventsFromPhotoMemories:(id)a3 storedEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _createNewEventsFromPhotoMemories", buf, 2u);
  }

  id v12 = objc_opt_new();
  [v12 setPhotoLibrary:self->_photoLibrary];
  id v13 = +[NSPredicate predicateWithFormat:@"featuredState == %ul", 1];
  [v12 setInternalPredicate:v13];

  [v12 setIncludePendingMemories:1];
  id v15 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v12];
  id v16 = [v15 fetchError];

  if (v16)
  {
    id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MOPhotoManager _createNewEventsFromPhotoMemories:storedEvents:handler:](v15, v17);
    }
  }
  id v18 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v79 = +[PHAsset fetchKeyAssetByMemoryUUIDForMemories:v15 options:v18];

  if ([v8 count])
  {
    id v74 = v15;
    id v75 = v12;
    id v76 = v10;
    id v77 = v9;
    id v19 = objc_opt_new();
    uint64_t v20 = [(MOPhotoManager *)self _getPhotoMemoryPlistFileURL];
    long long v84 = self;
    id v21 = [(MOPhotoManager *)self _readPhotoMemoryPlistFile:v20];
    id v22 = objc_opt_new();
    id v80 = v19;
    id v78 = v8;
    id v73 = (void *)v20;
    long long v83 = v21;
    if (v20 && v21)
    {
      id v81 = [v21 mutableCopy];

      id v23 = objc_opt_new();
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id obj = [v21 allKeys];
      id v24 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v90;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v90 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void **)(*((void *)&v89 + 1) + 8 * i);
            unsigned int v29 = [v83 objectForKeyedSubscript:v28];
            uint64_t v30 = [v29 objectForKeyedSubscript:@"photoMemoryID"];
            id v31 = [v29 objectForKeyedSubscript:@"photoMemoryIDFirstPersistTime"];
            [v31 doubleValue];
            double v33 = v32;

            uint64_t v34 = [(MOPhotoManager *)v84 configurationManager];
            [v34 getDoubleSettingForKey:@"PhotoMemoryIDPersistDuration" withFallback:7257600.0];
            double v36 = v35;

            id v37 = +[NSDate date];
            [v37 timeIntervalSinceReferenceDate];
            double v39 = v38 - v33;

            if (v39 >= v36)
            {
              [v81 removeObjectForKey:v28];
              id v40 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v94 = v28;
                __int16 v95 = 2048;
                *(double *)long long v96 = v36;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Removing %@ entries in photo as it is stored more than %f seconds ago", buf, 0x16u);
              }
            }
            else
            {
              [v23 addObject:v30];
            }
          }
          id v25 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
        }
        while (v25);
      }

      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v41 = v8;
      id v42 = [v41 countByEnumeratingWithState:&v85 objects:v99 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v86;
        do
        {
          for (j = 0; j != v43; j = (char *)j + 1)
          {
            if (*(void *)v86 != v44) {
              objc_enumerationMutation(v41);
            }
            long long v46 = *(void **)(*((void *)&v85 + 1) + 8 * (void)j);
            long long v47 = [v46 localIdentifier];
            unsigned __int8 v48 = [v23 containsObject:v47];

            if ((v48 & 1) == 0) {
              [v19 addObject:v46];
            }
          }
          id v43 = [v41 countByEnumeratingWithState:&v85 objects:v99 count:16];
        }
        while (v43);
      }

      long long v49 = v81;
    }
    else
    {
      [v19 addObjectsFromArray:v8];
      long long v49 = v22;
    }
    long long v51 = objc_opt_new();
    long long v52 = v49;
    long long v53 = [v49 allKeys];
    id v54 = (char *)[v53 count];

    if ([v19 count])
    {
      long long v55 = v19;
      unint64_t v56 = 0;
      do
      {
        long long v57 = [v55 objectAtIndex:v56];
        long long v58 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          __int16 v59 = [v57 localIdentifier];
          unsigned int v60 = [v57 pendingState];
          unsigned int v61 = [v57 isFavorite];
          id v62 = [v57 category];
          *(_DWORD *)buf = 138413058;
          id v94 = v59;
          __int16 v95 = 1024;
          *(_DWORD *)long long v96 = v60;
          *(_WORD *)&v96[4] = 1024;
          *(_DWORD *)&v96[6] = v61;
          __int16 v97 = 2048;
          id v98 = v62;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "#PhotoMemory,memoryInfo,id,%@,pendingState,%hu,isFavorite,%d,category,%lu", buf, 0x22u);
        }
        __int16 v63 = [(MOPhotoManager *)v84 _createEventFromPhotoMemory:v57];
        if (v63)
        {
          id v64 = [v57 uuid];
          __int16 v65 = [v79 objectForKeyedSubscript:v64];

          [(MOPhotoManager *)v84 _setDynamicPropertiesForMemoryEvent:v63 fromMemory:v57 keyAsset:v65];
          [v51 addObject:v63];
          id v66 = objc_opt_new();
          __int16 v67 = [v57 localIdentifier];
          [v66 setObject:v67 forKey:@"photoMemoryID"];

          id v68 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
          [v66 setObject:v68 forKey:@"photoMemoryIDFirstPersistTime"];

          long long v69 = +[NSString stringWithFormat:@"%@_%d", @"photoMemory", &v54[v56]];
          [v52 setObject:v66 forKey:v69];
        }
        ++v56;
        long long v55 = v80;
      }
      while ((unint64_t)[v80 count] > v56);
    }
    uint64_t v70 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      id v71 = [v51 count];
      *(_DWORD *)buf = 134217984;
      id v94 = v71;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "#PhotoMemory, create %lu new memory events", buf, 0xCu);
    }

    long long v72 = v52;
    [(MOPhotoManager *)v84 _persistPhotoMemoryPlistFile:v73 withData:v52];
    id v10 = v76;
    (*((void (**)(id, void *, void))v76 + 2))(v76, v51, 0);

    id v9 = v77;
    id v8 = v78;
    id v15 = v74;
    id v12 = v75;
  }
  else
  {
    long long v50 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "#PhotoMemory,result of fetched memories contains no memory to create new events", buf, 2u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 photoMemories:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _findUnrehydratedEventsWithStoredEvents", buf, 2u);
  }

  if ([v5 count])
  {
    if ([v6 count])
    {
      id v8 = objc_opt_new();
      id v9 = objc_alloc_init((Class)NSMutableArray);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v35 = v6;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v41;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v41 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = [*(id *)(*((void *)&v40 + 1) + 8 * i) localIdentifier];
            [v8 addObject:v15];
          }
          id v12 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v12);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v16 = v5;
      id v17 = [v16 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v37;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v37 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
            id v22 = [v21 identifierFromProvider];
            unsigned __int8 v23 = [v8 containsObject:v22];

            if ((v23 & 1) == 0)
            {
              [v21 setRehydrationFailCount:[v21 rehydrationFailCount] + 1];
              [v9 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v36 objects:v48 count:16];
        }
        while (v18);
      }

      id v24 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v9 count];
        *(_DWORD *)buf = 134217984;
        id v51 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "#PhotoMemory,unrehydrated photo memories count, %lu", buf, 0xCu);
      }

      id v6 = v35;
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v27 = v5;
      id v28 = [v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v45;
        do
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * (void)k) setRehydrationFailCount:[*(id *)(*((void *)&v44 + 1) + 8 * (void)k) rehydrationFailCount] + 1];
          }
          id v29 = [v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v29);
      }

      double v32 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = [v27 count];
        *(_DWORD *)buf = 134217984;
        id v51 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#PhotoMemory,result of fetched memories contains no memory, so all stored events are unRehydrated, count, %lu", buf, 0xCu);
      }

      id v9 = v27;
    }
  }
  else
  {
    uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "#PhotoMemory, no stored photo memeory events for finding unrehydrated events", buf, 2u);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)_getPhotoMemoryPlistFileURL
{
  uint64_t v2 = +[MOPersistenceManager userCacheDirectoryPath];
  if (v2)
  {
    id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
    id v4 = [v3 URLByAppendingPathComponent:@"photoMemoryID.plist"];
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MOPhotoManager _getPhotoMemoryPlistFileURL]();
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_readPhotoMemoryPlistFile:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    id v5 = [v3 path];
    unsigned int v6 = [v4 fileExistsAtPath:v5];

    if (v6)
    {
      id v7 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        [(MOPhotoManager *)v7 _readPhotoMemoryPlistFile:v9];
      }

      id v17 = 0;
      id v10 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v3 error:&v17];
      id v11 = v17;
      if (v11)
      {
        id v12 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[MOPhotoManager _readPhotoMemoryPlistFile:]();
        }

        id v13 = 0;
      }
      else
      {
        id v13 = v10;
      }
    }
    else
    {
      uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No photo memory idplist found at path.", v16, 2u);
      }

      id v13 = objc_alloc_init((Class)NSDictionary);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)_persistPhotoMemoryPlistFile:(id)a3 withData:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v17 = 0;
    unsigned int v6 = +[NSPropertyListSerialization dataWithPropertyList:a4 format:100 options:0 error:&v17];
    id v7 = v17;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v16 = 0;
      unsigned __int8 v12 = [v6 writeToURL:v5 options:805306369 error:&v16];
      uint64_t v9 = v16;
      id v13 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      id v10 = v13;
      if (!v9 && (v12 & 1) != 0)
      {
        BOOL v11 = 1;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "photo memory id was successfully written to plist.", (uint8_t *)v15, 2u);
        }
        uint64_t v9 = v10;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager _persistPhotoMemoryPlistFile:withData:]();
      }
    }
    else
    {
      uint64_t v9 = v7;
      id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MOPhotoManager _persistPhotoMemoryPlistFile:withData:]();
      }
    }

    BOOL v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  unsigned int v6 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MOPhotoManager _persistPhotoMemoryPlistFile:withData:]();
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_deletePhotoMemoryPlistFile:(id)a3
{
  return [(MOPhotoManager *)self _persistPhotoMemoryPlistFile:a3 withData:&__NSDictionary0__struct];
}

- (void)deletePhotoMemoryPlistFile
{
  id v3 = [(MOPhotoManager *)self _getPhotoMemoryPlistFileURL];
  [(MOPhotoManager *)self _deletePhotoMemoryPlistFile:v3];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)syndicationPhotoLibrary
{
  return self->_syndicationPhotoLibrary;
}

- (void)setSyndicationPhotoLibrary:(id)a3
{
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (NSString)suggestedMePersonIdentifier
{
  return self->_suggestedMePersonIdentifier;
}

- (void)setSuggestedMePersonIdentifier:(id)a3
{
}

- (PHPerson)mePerson
{
  return self->_mePerson;
}

- (void)setMePerson:(id)a3
{
}

- (GDVisualIdentifierView)visualIdentifierView
{
  return self->_visualIdentifierView;
}

- (GDEntityTaggingService)entityTaggingSerice
{
  return self->_entityTaggingSerice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityTaggingSerice, 0);
  objc_storeStrong((id *)&self->_visualIdentifierView, 0);
  objc_storeStrong((id *)&self->_mePerson, 0);
  objc_storeStrong((id *)&self->_suggestedMePersonIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_syndicationPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithUniverse:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error getting suggested me person from the photo library: %@", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Photo library unavailable, killing momentsd.", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error opening syndication photo library: %@", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error opening user photo library: %@", v2, v3, v4, v5, v6);
}

- (void)intializeEntityTaggingService
{
  uint64_t v3 = [*a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, v4, "#megadome,GDEntityTaggingService init failed,error,%@", v5);
}

- (void)getClassificationInfo:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Visual Identifier returned a nil mdPerson", v2, v3, v4, v5, v6);
}

- (void)getClassificationInfo:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "#megadome,GDRankedPersonEntityTags tags are nil", v2, v3, v4, v5, v6);
}

- (void)getClassificationInfo:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "#megadome,GDRankedPersonEntityTags fetch hit error, %@", v2, v3, v4, v5, v6);
}

- (void)_buildCuratedAssetMap:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "#assetscore, requestCurationScoreByAssetUUIDForAssetUUIDs, photoQueryError, %@", v2, v3, v4, v5, v6);
}

- (void)_fetchPhotoMemoriesBetweenStartDate:EndDate:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,memories fetch count during collect is invalid,%@", v2);
}

- (void)_fetchPhotoMemoriesBetweenStartDate:(void *)a1 EndDate:handler:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "#PhotoMemory,fetch result count, %lu", v3, v4, v5, v6, v7);
}

- (void)_fetchPhotoMemoriesBetweenStartDate:EndDate:handler:.cold.3()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,fetchPhotoMemoriesBetweenStartDate,startDate,%@,endDate,%@");
}

- (void)isDesirableCategoryOrTrigger:(char)a1 .cold.1(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#PhotoMemory,isDesirableCategory,%d", (uint8_t *)v2, 8u);
}

- (void)isDesirableCategoryOrTrigger:(os_log_t)log .cold.2(char a1, uint64_t a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(*(void *)a2 + 24);
  v4[0] = 67109376;
  v4[1] = a1 & 1;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#PhotoMemory,isDesirableCategory,%d,isDesirableTrigger,%d", (uint8_t *)v4, 0xEu);
}

- (void)fetchAndSavePhotoMemoriesStartDate:EndDate:handler:.cold.1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,fetchAndSavePhotoMemoriesStartDate,startDate,%@,endDate,%@");
}

void __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#PhotoMemory,no photo memories are fetched", v1, 2u);
}

void __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_cold_2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "#PhotoMemory,saving %lu photo memories", v3, v4, v5, v6, v7);
}

- (void)_saveEvents:category:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, v0, v1, "saveEvents,category,%lu", v2);
}

void __47__MOPhotoManager__saveEvents_category_handler___block_invoke_410_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "saving category %lu photo events into database failed, error %@", (uint8_t *)&v4, 0x16u);
}

- (void)_rehydrateSharedPhotos:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch result is nil from syndication library for rehydration,error, %@", v2, v3, v4, v5, v6);
}

- (void)_rehydrateSharedPhotos:(void *)a1 handler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fetchError];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, v4, "fetch shared photo for rehydration from syndication library hit error, %@", v5);
}

- (void)_rehydratePhotoMemories:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,memories fetch during rehydration is nil, error, %@", v2);
}

- (void)_rehydratePhotoMemories:handler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,memories fetch count during rehydration is nil,%@", v2);
}

- (void)_rehydratePhotoMemories:(void *)a1 handler:.cold.3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "#PhotoMemory,fetch memory result count, %lu", v3, v4, v5, v6, v7);
}

- (void)_rehydratePhotoMemories:(void *)a1 handler:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fetchError];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, v4, "#PhotoMemory,rehydrate memories hit error, %@,", v5);
}

- (void)_rehydratePhotoMemories:(void *)a1 handler:.cold.5(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "#PhotoMemory,start rehydrating photo memories with local identifiers, identifier count, %lu", v3, v4, v5, v6, v7);
}

- (void)_rehydratePhotoMemories:handler:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#PhotoMemory,_rehydratePhotoMemories", v1, 2u);
}

void __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 identifierFromProvider];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "#PhotoMemory,adding identifier to assetLocalIdentifiers: %@", v4, v5, v6, v7, v8);
}

- (void)_updatePhotoEventsDeletedAtSource:library:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch result is nil from photo library for purge, error, %@", v2, v3, v4, v5, v6);
}

void __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to update photo, error, %@", v2, v3, v4, v5, v6);
}

- (void)_updatePhotoMemoriesDeletedAtSource:(void *)a1 library:(NSObject *)a2 handler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fetchError];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, v4, "#PhotoMemory,fetch memories hit error, %@,", v5);
}

void __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "failed to update photo memories, error, %@", v2, v3, v4, v5, v6);
}

void __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch result is nil from photo library for fetchAssetUsingID,error, %@", v2, v3, v4, v5, v6);
}

void __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fetchError];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, v4, "fetch error for fetchAssetUsingID, %@", v5);
}

- (void)_rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "rehydrateEvents:no input events for rehydrating photo memory events", v2, v3, v4, v5, v6);
}

- (void)_rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "rehydrateEvents:no photo memory fecthed for rehydrating photo memory events", v2, v3, v4, v5, v6);
}

- (void)_fetchCuratedAssetsForPhotoMemory:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 localIdentifier];
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v2, v3, "#PhotoMemory,photo memory asset fetch result is nil for memory: %@, error, %@", v4, v5, v6, v7, 2u);
}

- (void)_fetchCuratedAssetsForPhotoMemory:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v3 = [a1 localIdentifier];
  id v10 = [a2 fetchError];
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v4, v5, "#PhotoMemory,photo memory asset fetch for memory: %@  hit error, %@", v6, v7, v8, v9, 2u);
}

- (void)_createNewEventsFromPhotoMemories:(void *)a1 storedEvents:(NSObject *)a2 handler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fetchError];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, a2, v4, "#PhotoMemory,fetch memories hit error,keyasset not inferred, %@", v5);
}

- (void)_getPhotoMemoryPlistFileURL
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Failed to get cache directory to store photo memory id plist file, nil cache directory.", v2, v3, v4, v5, v6);
}

- (void)_readPhotoMemoryPlistFile:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Could not read the photo memory id plist file, error: %@", v2, v3, v4, v5, v6);
}

- (void)_readPhotoMemoryPlistFile:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  CFStringRef v4 = @"photoMemoryID.plist";
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, a1, a3, "File %@ found.", (uint8_t *)&v3);
}

- (void)_persistPhotoMemoryPlistFile:withData:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid path for photo memory id plist file.", v2, v3, v4, v5, v6);
}

- (void)_persistPhotoMemoryPlistFile:withData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "photo memory id serialization to NSData failed or returned nil, %@", v2, v3, v4, v5, v6);
}

- (void)_persistPhotoMemoryPlistFile:withData:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't write to the photo memory id plist file, %@", v2, v3, v4, v5, v6);
}

@end