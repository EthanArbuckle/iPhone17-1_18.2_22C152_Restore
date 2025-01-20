@interface MONowPlayingMediaManager
- (BMStream)stream;
- (BMSyncService)syncService;
- (BOOL)_needRefreshAppInfo:(id)a3;
- (BOOL)_persistMediaAppInfoPlistFile:(id)a3 withData:(id)a4;
- (BOOL)streamNowPlayingEventsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6 processEvent:(id)a7;
- (MOConfigurationManager)configurationManager;
- (MOEventStore)momentStore;
- (MONowPlayingMediaManager)initWithNowPlayingStream:(id)a3 momentStore:(id)a4;
- (MONowPlayingMediaManager)initWithUniverse:(id)a3;
- (NSDateFormatter)dateFormatter;
- (NSMutableDictionary)bundleIdAppInfoMappings;
- (NSMutableDictionary)bundleIdCategoryMappings;
- (NSSet)firstPartyBundleIdSet;
- (NSSet)leisureMediaBundleIdSet;
- (NSSet)mediaBundleDeniedIdSet;
- (NSSet)thirdPartyMediaBundleIdSet;
- (NSURL)plistAppInfoFileURL;
- (NSURL)plistFileURL;
- (OS_dispatch_queue)queue;
- (double)countTotalPlayTime:(id)a3;
- (float)kMediaInfoRefreshInterval;
- (id)_calculateEndDateFromMediaPlaySessions:(id)a3;
- (id)_calculateStartDateFromMediaPlaySessions:(id)a3;
- (id)_createEventFromMediaPlayGroupsByDayTitle:(id)a3;
- (id)_createEventFromMediaPlaySessions:(id)a3;
- (id)_createNewLeisureMediaEventsFromMediaPlays:(id)a3 storedEvents:(id)a4;
- (id)_createNewMediaPlayEventsFromMediaPlays:(id)a3 storedEvents:(id)a4;
- (id)_filterMediaSessionsBasedOnApps:(id)a3;
- (id)_filterMediaSessionsBasedOnMusicApps:(id)a3;
- (id)_findUnrehdyratedEventsFromStoredEvents:(id)a3 rehydratedEvents:(id)a4;
- (id)_generateMediaPlayGroupsByDayTitle:(id)a3;
- (id)_generateMediaPlaySessionGroupsByDay:(id)a3;
- (id)_generateMediaPlaySessionsFrom:(id)a3;
- (id)_getMediaAppCategoryPlistFileURL;
- (id)_getMediaAppInfoPlistFileURL;
- (id)_groupMediaPlayGroupsByTitle:(id)a3;
- (id)_groupMediaPlaySessionsByDay:(id)a3;
- (id)_groupMediaPlaySessionsByTitle:(id)a3;
- (id)_groupMediaPlaySessionsByTitleDay:(id)a3;
- (id)_providerIdOfStartDate:(id)a3 endDate:(id)a4;
- (id)_readMediaAppInfoPlistFile:(id)a3;
- (id)_rehydratedMediaEvents:(id)a3 usingNowPlayingEvents:(id)a4;
- (id)_rehydratedMediaSessionsForEvents:(id)a3 usingNowPlayingEvents:(id)a4;
- (id)getStringFromBMDeviceType:(int64_t)a3;
- (id)groupDevicesBaseOnType:(id)a3;
- (id)rehydratedMediaPlayEvents:(id)a3;
- (unint64_t)makeDuplicationHashForEvent:(id)a3;
- (void)_fetchAppCateogryByBundleIds:(id)a3;
- (void)_fetchMediaPlayEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_fetchNowPlayingEventsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)_getMediaAppCategoryPlistFileURL;
- (void)_getMediaAppInfoPlistFileURL;
- (void)_rehydratedMediaPlayEvents:(id)a3 handler:(id)a4;
- (void)_removeOldMediaAppCategoryPlistFile:(id)a3;
- (void)_saveMediaPlayGroupsByDayTitle:(id)a3 startDate:(id)a4 handler:(id)a5;
- (void)_saveMediaPlaySessionsEvents:(id)a3 handler:(id)a4;
- (void)_setDynamicProperties:(id)a3 mediaPlay:(id)a4;
- (void)_updateLearnFromAppStatusTable:(id)a3;
- (void)_updateMediaPlayEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)_updateMediaPlaySessionEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)fetchAndSaveMediaPlayEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchMediaPlayEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)rehydratedMediaPlayEvents:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setKMediaInfoRefreshInterval:(float)a3;
- (void)updateMediaPlayEventsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)waitForQueueEmpty;
@end

@implementation MONowPlayingMediaManager

- (MONowPlayingMediaManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 getService:v6];
  configurationManager = self->_configurationManager;
  self->_configurationManager = v7;

  v9 = BiomeLibrary();
  v10 = [v9 Media];
  v11 = [v10 NowPlaying];

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v4 getService:v13];

  v15 = [(MONowPlayingMediaManager *)self initWithNowPlayingStream:v11 momentStore:v14];
  return v15;
}

- (MONowPlayingMediaManager)initWithNowPlayingStream:(id)a3 momentStore:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v37 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:]();
    }

    v38 = +[NSAssertionHandler currentHandler];
    [v38 handleFailureInMethod:a2 object:self file:@"MONowPlayingMediaManager.m" lineNumber:105 description:@"Invalid parameter not satisfying: momentStore"];

    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    v36 = 0;
    goto LABEL_10;
  }
  v40.receiver = self;
  v40.super_class = (Class)MONowPlayingMediaManager;
  v10 = [(MONowPlayingMediaManager *)&v40 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_stream, a3);
    uint64_t v12 = objc_opt_new();
    syncService = v11->_syncService;
    v11->_syncService = (BMSyncService *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("MONowPlayingMediaManager", v14);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v11->_momentStore, a4);
    id v17 = objc_alloc((Class)NSSet);
    v18 = (NSSet *)[v17 initWithArray:kFirstPartyMediaBundleId[0]];
    firstPartyBundleIdSet = v11->_firstPartyBundleIdSet;
    v11->_firstPartyBundleIdSet = v18;

    id v20 = objc_alloc((Class)NSSet);
    v21 = (NSSet *)[v20 initWithArray:kMediaBundleIdDenyList];
    mediaBundleDeniedIdSet = v11->_mediaBundleDeniedIdSet;
    v11->_mediaBundleDeniedIdSet = v21;

    v23 = +[NSCalendar currentCalendar];
    v24 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    [(NSDateFormatter *)v24 setCalendar:v23];
    [(NSDateFormatter *)v24 setDateFormat:@"yyyy-MM-dd"];
    dateFormatter = v11->_dateFormatter;
    v11->_dateFormatter = v24;
    v26 = v24;

    uint64_t v27 = [(MONowPlayingMediaManager *)v11 _getMediaAppCategoryPlistFileURL];
    plistFileURL = v11->_plistFileURL;
    v11->_plistFileURL = (NSURL *)v27;

    uint64_t v29 = [(MONowPlayingMediaManager *)v11 _getMediaAppInfoPlistFileURL];
    plistAppInfoFileURL = v11->_plistAppInfoFileURL;
    v11->_plistAppInfoFileURL = (NSURL *)v29;

    [(MONowPlayingMediaManager *)v11 _removeOldMediaAppCategoryPlistFile:v11->_plistFileURL];
    uint64_t v31 = [(MONowPlayingMediaManager *)v11 _readMediaAppInfoPlistFile:v11->_plistAppInfoFileURL];
    bundleIdAppInfoMappings = v11->_bundleIdAppInfoMappings;
    v11->_bundleIdAppInfoMappings = (NSMutableDictionary *)v31;

    [(MOConfigurationManagerBase *)v11->_configurationManager getDoubleSettingForKey:@"kMOMediaAMSAppInfoRefreshInterval" withFallback:604800.0];
    double v34 = v33;

    float v35 = v34;
    v11->_kMediaInfoRefreshInterval = v35;
  }
  self = v11;
  v36 = self;
LABEL_10:

  return v36;
}

- (BOOL)streamNowPlayingEventsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6 processEvent:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  [v12 timeIntervalSinceReferenceDate];
  double v16 = v15;
  [v13 timeIntervalSinceReferenceDate];
  double v18 = v17;
  double v19 = CFAbsoluteTimeGetCurrent() + -864000.0;
  if (v16 <= v19) {
    double v16 = v19;
  }
  if (v11)
  {
    id v20 = [v11 name];
    -[MONowPlayingMediaManager getStringFromBMDeviceType:](self, "getStringFromBMDeviceType:", [v11 platform]);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 < v18)
    {
      stream = self->_stream;
      id v52 = v11;
      v23 = +[NSArray arrayWithObjects:&v52 count:1];
      char v34 = 0;
LABEL_8:
      v24 = +[NSNumber numberWithDouble:v16];
      v25 = +[NSNumber numberWithDouble:v18];
      BYTE1(v33) = v11 == 0;
      LOBYTE(v33) = 0;
      v26 = -[BMStream publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](stream, "publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", v23, @"Moments", v24, v25, 0, 0, v33, &__block_literal_global_47);

      if (v11) {
      uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(double *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        v49 = (uint64_t (*)(uint64_t, uint64_t))v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Call publishersForDevices with startTime, %f, endTime, %f, device, %@", buf, 0x20u);
      }

      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      char v47 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v49 = __Block_byref_object_copy__40;
      v50 = __Block_byref_object_dispose__40;
      id v51 = 0;
      v28 = [v26 merge];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke_149;
      v43[3] = &unk_1002D2300;
      v43[4] = &v44;
      v43[5] = buf;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke_2;
      v36[3] = &unk_1002D2328;
      id v37 = v12;
      id v38 = v13;
      id v20 = v20;
      v39 = v20;
      char v42 = v34;
      id v21 = v21;
      id v40 = v21;
      id v41 = v14;
      id v29 = [v28 sinkWithCompletion:v43 receiveInput:v36];

      if (a6) {
        *a6 = *(id *)(*(void *)&buf[8] + 40);
      }
      BOOL v30 = *((unsigned char *)v45 + 24) != 0;

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v44, 8);

      goto LABEL_19;
    }
  }
  else
  {
    id v21 = 0;
    if (v16 < v18)
    {
      stream = self->_stream;
      v23 = &__NSArray0__struct;
      char v34 = 1;
      id v20 = @"local";
      goto LABEL_8;
    }
    id v20 = @"local";
  }
  uint64_t v31 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    *(double *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    v49 = (uint64_t (*)(uint64_t, uint64_t))v20;
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Stop calling publishersForDevices due to inverted start/end timestamp, startTime, %f, endTime, %f, device, %@", buf, 0x20u);
  }

  (*((void (**)(id, void))v14 + 2))(v14, 0);
  BOOL v30 = 1;
LABEL_19:

  return v30;
}

BPSPublisher *__cdecl __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke(id a1, BMBookmarkablePublisher *a2)
{
  v2 = a2;

  return v2;
}

void __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke_149(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 state])
  {
    if ([v6 state] == (id)1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      uint64_t v3 = [v6 error];
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_alloc((Class)NSDate);
  [v11 timestamp];
  id v4 = [v3 initWithTimeIntervalSinceReferenceDate:x0];
  if ([v4 isOnOrAfter:*(void *)(a1 + 32)]
    && [v4 isOnOrBefore:*(void *)(a1 + 40)])
  {
    v5 = [MONowPlayingEvent alloc];
    id v6 = [v11 eventBody];
    BOOL v7 = *(unsigned char *)(a1 + 72) == 0;
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    [v11 timestamp];
    v10 = -[MONowPlayingEvent initWithNowPlayingEvent:name:isRemote:deviceSource:timestamp:](v5, "initWithNowPlayingEvent:name:isRemote:deviceSource:timestamp:", v6, v8, v7, v9);

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_fetchNowPlayingEventsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MONowPlayingMediaManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v15[3] = &unk_1002CB898;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__40;
  v59[4] = __Block_byref_object_dispose__40;
  id v60 = +[NSMutableSet set];
  v43 = objc_opt_new();
  uint64_t v44 = +[NSMutableArray array];
  id v3 = [*(id *)(a1 + 32) syncService];
  id v58 = 0;
  id v4 = [v3 remoteDevicesWithError:&v58];
  id v5 = v58;

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v40 = 0;
  }
  else
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_2(v75, (uint64_t)[v4 count], v6);
    }

    id v40 = [*(id *)(a1 + 32) groupDevicesBaseOnType:v4];
    *(void *)v71 = 0;
    *(void *)&v71[8] = v71;
    *(void *)&v71[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__40;
    v73 = __Block_byref_object_dispose__40;
    id v74 = (id)objc_opt_new();
    BOOL v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v56[6] = v71;
    id v57 = 0;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_156;
    v56[3] = &unk_1002D2350;
    v56[4] = v7;
    v56[5] = v59;
    unsigned int v10 = [v7 streamNowPlayingEventsFromSource:0 startDate:v8 endDate:v9 error:&v57 processEvent:v56];
    id v11 = v57;
    if (v10)
    {
      id v12 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [*(id *)(*(void *)&v71[8] + 40) count];
        *(_DWORD *)buf = 134217984;
        id v64 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Successfully fetched %ld NowPlaying events from Biome local device", buf, 0xCu);
      }

      if ([*(id *)(*(void *)&v71[8] + 40) count]) {
        [v43 addObjectsFromArray:*(void *)(*(void *)&v71[8] + 40)];
      }
    }
    else
    {
      id v14 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1();
      }

      [*(id *)(*(void *)&v71[8] + 40) removeAllObjects];
      [v44 addObject:v11];
    }
    _Block_object_dispose(v71, 8);
  }
  if (!v5)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [v40 allKeys];
    id v39 = [obj countByEnumeratingWithState:&v52 objects:v70 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v53;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v53 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          uint64_t v42 = v15;
          id v16 = [v40 objectForKeyedSubscript:];
          id v17 = [v16 countByEnumeratingWithState:&v48 objects:v69 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v49;
            id v45 = v16;
            do
            {
              double v19 = 0;
              do
              {
                if (*(void *)v49 != v18) {
                  objc_enumerationMutation(v45);
                }
                id v20 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v19);
                *(void *)v71 = 0;
                *(void *)&v71[8] = v71;
                *(void *)&v71[16] = 0x3032000000;
                v72 = __Block_byref_object_copy__40;
                v73 = __Block_byref_object_dispose__40;
                id v74 = (id)objc_opt_new();
                v22 = *(void **)(a1 + 32);
                uint64_t v23 = *(void *)(a1 + 40);
                uint64_t v24 = *(void *)(a1 + 48);
                v46[6] = v71;
                id v47 = 0;
                v46[0] = _NSConcreteStackBlock;
                v46[1] = 3221225472;
                v46[2] = __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_158;
                v46[3] = &unk_1002D2350;
                v46[4] = v22;
                v46[5] = v59;
                unsigned int v25 = [v22 streamNowPlayingEventsFromSource:v20 startDate:v23 endDate:v24 error:&v47 processEvent:v46];
                id v26 = v47;
                if (v25)
                {
                  uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    id v28 = [*(id *)(*(void *)&v71[8] + 40) count];
                    id v29 = [v20 description];
                    *(_DWORD *)buf = 134218498;
                    id v64 = v28;
                    __int16 v65 = 2112;
                    uint64_t v66 = v42;
                    __int16 v67 = 2112;
                    v68 = v29;
                    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Successfully fetched %ld NowPlaying events from Biome iCloud device with source type, %@, device, %@", buf, 0x20u);
                  }
                  if ([*(id *)(*(void *)&v71[8] + 40) count]) {
                    [v43 addObjectsFromArray:*(void *)(*(void *)&v71[8] + 40)];
                  }
                }
                else
                {
                  BOOL v30 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v64 = v26;
                    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "completionHandler not called due to biome query error: %@", buf, 0xCu);
                  }

                  [*(id *)(*(void *)&v71[8] + 40) removeAllObjects];
                  [v44 addObject:v26];
                }

                _Block_object_dispose(v71, 8);
                double v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v16 = v45;
              id v17 = [v45 countByEnumeratingWithState:&v48 objects:v69 count:16];
            }
            while (v17);
          }
        }
        id v39 = [obj countByEnumeratingWithState:&v52 objects:v70 count:16];
      }
      while (v39);
    }

    if ([v44 count])
    {
      v61[0] = NSLocalizedFailureErrorKey;
      v61[1] = NSMultipleUnderlyingErrorsKey;
      v62[0] = @"Failed to fetch NowPlaying events from Biome";
      v62[1] = v44;
      uint64_t v31 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
      v32 = +[NSError errorWithDomain:@"MomentsFetchErrorDomain" code:50897 userInfo:v31];
    }
    else
    {
      v32 = 0;
    }
    if (*(void *)(a1 + 56))
    {
      uint64_t v33 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = [v43 count];
        uint64_t v35 = *(void *)(a1 + 40);
        v36 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 48);
        *(_DWORD *)v71 = 134218498;
        *(void *)&v71[4] = v34;
        *(_WORD *)&v71[12] = 2112;
        *(void *)&v71[14] = v35;
        *(_WORD *)&v71[22] = 2112;
        v72 = v36;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Fetched %ld NowPlaying events from Biome all devices, startDate, %@, endDate, %@", v71, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  _Block_object_dispose(v59, 8);
}

uint64_t __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_156(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v7 = v3;
    id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) makeDuplicationHashForEvent:v3]);
    if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v5] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];

    id v4 = v7;
  }

  return _objc_release_x1(v3, v4);
}

uint64_t __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_158(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v7 = v3;
    id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) makeDuplicationHashForEvent:v3]);
    if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v5] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
    }

    id v4 = v7;
  }

  return _objc_release_x1(v3, v4);
}

- (unint64_t)makeDuplicationHashForEvent:(id)a3
{
  id v3 = a3;
  [v3 timestamp];
  double v5 = floor(v4 / 60.0);
  id v6 = +[BSHashBuilder builder];
  id v7 = [v3 bundleID];
  uint64_t v8 = [v6 appendString:v7];
  uint64_t v9 = [v3 title];
  unsigned int v10 = [v8 appendString:v9];
  id v11 = [v10 appendInteger:[v3 playbackState]];
  id v12 = [v3 iTunesStoreIdentifier];

  id v13 = [v11 appendString:v12];
  id v14 = [v13 appendDouble:v5];
  id v15 = [v14 hash];

  return (unint64_t)v15;
}

- (id)groupDevicesBaseOnType:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [[self getStringFromBMDeviceType:objc_msgSend(v11, "platform", (void)v18)];
        if (v13)
        {
          id v14 = [v5 objectForKeyedSubscript:v13];

          if (!v14)
          {
            id v15 = objc_opt_new();
            [v5 setObject:v15 forKeyedSubscript:v13];
          }
          id v16 = [v5 objectForKeyedSubscript:v13];
          [v16 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)getStringFromBMDeviceType:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return @"Unknown";
  }
  else {
    return off_1002D2480[a3];
  }
}

- (id)_groupMediaPlaySessionsByDay:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        dateFormatter = self->_dateFormatter;
        id v13 = [v11 startDate:v19];
        id v14 = [(NSDateFormatter *)dateFormatter stringFromDate:v13];

        id v15 = [v5 objectForKeyedSubscript:v14];

        if (!v15)
        {
          id v16 = objc_opt_new();
          [v5 setObject:v16 forKeyedSubscript:v14];
        }
        id v17 = [v5 objectForKeyedSubscript:v14];
        [v17 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_needRefreshAppInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_bundleIdAppInfoMappings objectForKey:v4];
  if (v5
    && (id v6 = (void *)v5,
        [(NSMutableDictionary *)self->_bundleIdAppInfoMappings objectForKey:v4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [(NSMutableDictionary *)self->_bundleIdAppInfoMappings objectForKeyedSubscript:v4];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"date"];
    unsigned int v10 = v9;
    if (v9 && ([v9 isEqualToString:&stru_1002D2AC8] & 1) == 0)
    {
      id v12 = [(NSDateFormatter *)self->_dateFormatter dateFromString:v10];
      double Current = CFAbsoluteTimeGetCurrent();
      [v12 timeIntervalSinceReferenceDate];
      BOOL v11 = Current - v14 > self->_kMediaInfoRefreshInterval;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)_fetchAppCateogryByBundleIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    bundleIdAppInfoMappings = self->_bundleIdAppInfoMappings;
    if (bundleIdAppInfoMappings && [(NSMutableDictionary *)bundleIdAppInfoMappings count])
    {
      id v7 = objc_opt_new();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v28 = v5;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v34;
        do
        {
          id v12 = 0;
          do
          {
            if (*(void *)v34 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v12);
            id v15 = +[NSCharacterSet whitespaceCharacterSet];
            id v16 = [v13 stringByTrimmingCharactersInSet:v15];

            if ([(MONowPlayingMediaManager *)self _needRefreshAppInfo:v16]) {
              [v7 addObject:v16];
            }

            id v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v10);
      }

      uint64_t v5 = v28;
      if (!v7) {
        goto LABEL_25;
      }
    }
    else
    {
      id v7 = +[NSMutableSet setWithSet:v5];
      if (!v7)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    if ([v7 count])
    {
      id v17 = +[AMSBag bagForProfile:@"MomentsUIService" profileVersion:@"1"];
      id v18 = [objc_alloc((Class)AMSMediaTask) initWithType:0 clientIdentifier:@"com.apple.momentsd" clientVersion:@"1" bag:v17];
      long long v19 = [v7 allObjects];
      [v18 setBundleIdentifiers:v19];
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      long long v21 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Start to fetch category info with bundleIds, %@", buf, 0xCu);
      }

      long long v22 = [v18 perform];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = __57__MONowPlayingMediaManager__fetchAppCateogryByBundleIds___block_invoke;
      v30[3] = &unk_1002D2378;
      v30[4] = self;
      id v31 = v7;
      uint64_t v23 = v20;
      v32 = v23;
      [v22 addFinishBlock:v30];
      uint64_t v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/NowPlaying/MONowPlayingMediaManager.m", 476, "-[MONowPlayingMediaManager _fetchAppCateogryByBundleIds:]");
      id v29 = 0;
      BOOL v25 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v23, &v29, v24, 120.0);
      id v26 = v29;
      if (!v25)
      {
        uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
        }
      }
    }
    goto LABEL_25;
  }
LABEL_26:
}

void __57__MONowPlayingMediaManager__fetchAppCateogryByBundleIds___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [a2 responseDataItems];
    long long v54 = v7;
    uint64_t v55 = a1;
    if ([v7 count])
    {
      uint64_t v8 = 0;
      while (1)
      {
        id v9 = [v7 objectAtIndexedSubscript:v8];
        id v10 = [v9 objectForKey:@"attributes"];
        uint64_t v11 = v10;
        if (v10) {
          break;
        }
LABEL_22:

        if ((unint64_t)[v7 count] <= ++v8) {
          goto LABEL_26;
        }
      }
      id v12 = [v10 objectForKey:@"genreDisplayName"];
      v62 = [v11 objectForKey:@"name"];
      id v13 = [v11 objectForKey:@"platformAttributes"];
      double v14 = v13;
      if (!v13)
      {
LABEL_21:

        goto LABEL_22;
      }
      id v60 = v12;
      id v15 = [v13 objectForKey:@"ios"];
      id v16 = v15;
      if (!v15)
      {
LABEL_20:

        id v12 = v60;
        goto LABEL_21;
      }
      id v17 = [v15 objectForKey:@"bundleId"];
      id v18 = objc_opt_new();
      long long v19 = +[NSCharacterSet whitespaceCharacterSet];
      id v58 = v17;
      dispatch_semaphore_t v20 = [v17 stringByTrimmingCharactersInSet:v19];

      [v18 setObject:v60 forKey:@"category"];
      long long v21 = [*(id *)(a1 + 32) dateFormatter];
      long long v22 = objc_opt_new();
      uint64_t v23 = [v21 stringFromDate:v22];
      [v18 setObject:v23 forKey:@"date"];

      uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v70 = v60;
        __int16 v71 = 2112;
        v72 = v58;
        __int16 v73 = 2112;
        id v74 = v62;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Successfully fetched category name, %@, %@, %@", buf, 0x20u);
      }

      BOOL v25 = [v16 objectForKey:@"artwork"];
      id v26 = v25;
      if (!v25)
      {
        [v18 setObject:&stru_1002D2AC8 forKey:@"bkColor"];
        uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v70 = v58;
          __int16 v71 = 2112;
          v72 = v62;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Unable to fetch background color due to empty artwork, %@, %@", buf, 0x16u);
        }
        goto LABEL_19;
      }
      uint64_t v27 = [v25 objectForKey:@"bgColor"];
      if (v27)
      {
        [v18 setObject:v27 forKey:@"bkColor"];
        id v28 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v70 = v27;
          __int16 v71 = 2112;
          v72 = v58;
          __int16 v73 = 2112;
          id v74 = v62;
          id v29 = v28;
          BOOL v30 = "Successfully fetched background color, %@, %@, %@";
          uint32_t v31 = 32;
LABEL_25:
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, v30, buf, v31);
        }
      }
      else
      {
        [v18 setObject:&stru_1002D2AC8 forKey:@"bkColor"];
        id v28 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v70 = v58;
          __int16 v71 = 2112;
          v72 = v62;
          id v29 = v28;
          BOOL v30 = "Unable to fetch background color due to empty bkColor, %@, %@";
          uint32_t v31 = 22;
          goto LABEL_25;
        }
      }

LABEL_19:
      v32 = [*(id *)(v55 + 32) bundleIdAppInfoMappings];
      [v32 setObject:v18 forKey:v20];

      a1 = v55;
      id v7 = v54;
      goto LABEL_20;
    }
LABEL_26:
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = *(id *)(a1 + 40);
    id v61 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (!v61) {
      goto LABEL_40;
    }
    uint64_t v59 = *(void *)v65;
    CFStringRef v33 = @"category";
LABEL_28:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v65 != v59) {
        objc_enumerationMutation(obj);
      }
      uint64_t v35 = *(void *)(*((void *)&v64 + 1) + 8 * v34);
      long long v36 = [*(id *)(a1 + 32) bundleIdAppInfoMappings];
      uint64_t v37 = [v36 objectForKey:v35];
      uint64_t v63 = v35;
      if (v37)
      {
        uint64_t v38 = (void *)v37;
        id v39 = [*(id *)(a1 + 32) bundleIdAppInfoMappings];
        id v40 = [v39 objectForKey:v35];
        [v40 objectForKeyedSubscript:v33];
        v42 = CFStringRef v41 = v33;
        if (v42)
        {
          v43 = [*(id *)(a1 + 32) bundleIdAppInfoMappings];
          uint64_t v44 = [v43 objectForKey:v35];
          id v45 = [v44 objectForKeyedSubscript:v41];
          unsigned __int8 v57 = [v45 isEqualToString:&stru_1002D2AC8];

          a1 = v55;
          CFStringRef v33 = v41;
          if ((v57 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }

        CFStringRef v33 = v41;
      }

LABEL_37:
      uint64_t v46 = objc_opt_new();
      [v46 setObject:&stru_1002D2AC8 forKey:v33];
      [v46 setObject:&stru_1002D2AC8 forKey:@"date"];
      [v46 setObject:&stru_1002D2AC8 forKey:@"bkColor"];
      id v47 = [*(id *)(a1 + 32) dateFormatter];
      long long v48 = objc_opt_new();
      long long v49 = [v47 stringFromDate:v48];
      [v46 setObject:v49 forKey:@"date"];

      long long v50 = [*(id *)(a1 + 32) bundleIdAppInfoMappings];
      [v50 setObject:v46 forKey:v63];

LABEL_38:
      if (v61 == (id)++v34)
      {
        id v61 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
        if (!v61)
        {
LABEL_40:

          long long v51 = *(void **)(a1 + 32);
          long long v52 = [v51 plistAppInfoFileURL];
          long long v53 = [*(id *)(a1 + 32) bundleIdAppInfoMappings];
          [v51 _persistMediaAppInfoPlistFile:v52 withData:v53];

          id v5 = 0;
          id v6 = v54;
          goto LABEL_41;
        }
        goto LABEL_28;
      }
    }
  }
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __57__MONowPlayingMediaManager__fetchAppCateogryByBundleIds___block_invoke_cold_1();
  }
LABEL_41:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)_getMediaAppCategoryPlistFileURL
{
  v2 = +[MOPersistenceManager userCacheDirectoryPath];
  if (v2)
  {
    id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
    id v4 = [v3 URLByAppendingPathComponent:@"mediaAppCategory.plist"];
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MONowPlayingMediaManager _getMediaAppCategoryPlistFileURL]();
    }

    id v4 = 0;
  }

  return v4;
}

- (id)_getMediaAppInfoPlistFileURL
{
  v2 = +[MOPersistenceManager userCacheDirectoryPath];
  if (v2)
  {
    id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
    id v4 = [v3 URLByAppendingPathComponent:@"mediaAppInfo.plist"];
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MONowPlayingMediaManager _getMediaAppInfoPlistFileURL]();
    }

    id v4 = 0;
  }

  return v4;
}

- (void)_removeOldMediaAppCategoryPlistFile:(id)a3
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
        -[MONowPlayingMediaManager _removeOldMediaAppCategoryPlistFile:](v7);
      }

      uint64_t v8 = [v3 path];
      id v11 = 0;
      [v4 removeItemAtPath:v8 error:&v11];
      id v9 = v11;

      if (v9)
      {
        id v10 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[MONowPlayingMediaManager _removeOldMediaAppCategoryPlistFile:]();
        }
      }
    }
  }
}

- (id)_readMediaAppInfoPlistFile:(id)a3
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
        -[MONowPlayingMediaManager _readMediaAppInfoPlistFile:](v7);
      }

      id v16 = 0;
      id v8 = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfURL:v3 error:&v16];
      id v9 = v16;
      id v10 = +[NSMutableDictionary dictionaryWithDictionary:v8];

      if (v9)
      {
        id v11 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[MONowPlayingMediaManager _readMediaAppInfoPlistFile:]();
        }

        id v12 = 0;
      }
      else
      {
        id v12 = v10;
      }
    }
    else
    {
      id v13 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No media app info plist found at path.", v15, 2u);
      }

      id v12 = objc_alloc_init((Class)NSMutableDictionary);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)_persistMediaAppInfoPlistFile:(id)a3 withData:(id)a4
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
      id v9 = v16;
      id v13 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      id v10 = v13;
      if (!v9 && (v12 & 1) != 0)
      {
        BOOL v11 = 1;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Media app info was successfully written to plist.", (uint8_t *)v15, 2u);
        }
        id v9 = v10;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[MONowPlayingMediaManager _persistMediaAppInfoPlistFile:withData:]();
      }
    }
    else
    {
      id v9 = v7;
      id v10 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MONowPlayingMediaManager _persistMediaAppInfoPlistFile:withData:]();
      }
    }

    BOOL v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  unsigned int v6 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MONowPlayingMediaManager _persistMediaAppInfoPlistFile:withData:]();
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (id)_groupMediaPlaySessionsByTitleDay:(id)a3
{
  id v3 = a3;
  uint64_t v44 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
  id v40 = v4;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v57;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v11 = [v9 startDate];
        if (v11)
        {
          unsigned __int8 v12 = (void *)v11;
          uint64_t v13 = [v9 title];
          if (v13)
          {
            double v14 = (void *)v13;
            id v15 = [v9 bundleId];

            if (!v15) {
              goto LABEL_13;
            }
            dateFormatter = self->_dateFormatter;
            id v17 = [v9 startDate];
            unsigned __int8 v12 = [(NSDateFormatter *)dateFormatter stringFromDate:v17];

            id v18 = [v9 title];
            long long v19 = [v18 stringByAppendingString:v12];

            dispatch_semaphore_t v20 = [v9 bundleId];
            long long v21 = [v20 stringByAppendingString:v19];

            long long v22 = [v44 objectForKeyedSubscript:v21];

            if (!v22)
            {
              uint64_t v23 = objc_opt_new();
              [v44 setObject:v23 forKeyedSubscript:v21];
            }
            uint64_t v24 = [v44 objectForKeyedSubscript:v21];
            [v24 addObject:v9];

            id v4 = v40;
          }
        }
LABEL_13:
      }
      id v6 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v6);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  BOOL v25 = v44;
  id obj = [v44 allKeys];
  id v43 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v53;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v26;
        uint64_t v27 = *(void *)(*((void *)&v52 + 1) + 8 * v26);
        id v28 = [v25 objectForKeyedSubscript:v27];
        id v29 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          BOOL v30 = +[MOMediaPlaySession redactString:v27];
          *(_DWORD *)buf = 138412290;
          v62 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Media sessions grouped for title and day: %@", buf, 0xCu);
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v31 = v28;
        id v32 = [v31 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v49;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v49 != v34) {
                objc_enumerationMutation(v31);
              }
              long long v36 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
              uint64_t v37 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                uint64_t v38 = [v36 description];
                *(_DWORD *)buf = 138412290;
                v62 = v38;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "TitleAndDayGrouping: media session with description: %@", buf, 0xCu);
              }
            }
            id v33 = [v31 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v33);
        }

        uint64_t v26 = v46 + 1;
        BOOL v25 = v44;
      }
      while ((id)(v46 + 1) != v43);
      id v43 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v43);
  }

  return v25;
}

- (id)_groupMediaPlaySessionsByTitle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 title:v16];
        unsigned __int8 v12 = [v4 objectForKeyedSubscript:v11];

        if (!v12)
        {
          uint64_t v13 = objc_opt_new();
          [v4 setObject:v13 forKeyedSubscript:v11];
        }
        double v14 = [v4 objectForKeyedSubscript:v11];
        [v14 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_groupMediaPlayGroupsByTitle:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 title:v17];
        uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        unsigned __int8 v12 = [v10 title];

        if (!v12)
        {

          uint64_t v11 = &stru_1002D2AC8;
        }
        uint64_t v13 = [v4 objectForKeyedSubscript:v11];

        if (!v13)
        {
          double v14 = objc_opt_new();
          [v4 setObject:v14 forKeyedSubscript:v11];
        }
        id v15 = [v4 objectForKeyedSubscript:v11];
        [v15 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_calculateStartDateFromMediaPlaySessions:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[NSDate distantFuture];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = [v10 startDate:v16];
          unsigned __int8 v12 = [v11 earlierDate:v4];
          uint64_t v13 = [v10 startDate];

          if (v12 == v13)
          {
            uint64_t v14 = [v10 startDate];

            id v4 = (void *)v14;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_calculateEndDateFromMediaPlaySessions:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[NSDate distantPast];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = [v10 endDate:v16];
          unsigned __int8 v12 = [v11 laterDate:v4];
          uint64_t v13 = [v10 endDate];

          if (v12 == v13)
          {
            uint64_t v14 = [v10 endDate];

            id v4 = (void *)v14;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_generateMediaPlaySessionsFrom:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 count])
  {
    id v6 = [(MONowPlayingMediaManager *)self _groupMediaPlayGroupsByTitle:v4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __59__MONowPlayingMediaManager__generateMediaPlaySessionsFrom___block_invoke;
    v11[3] = &unk_1002D23A0;
    v11[4] = self;
    id v7 = v5;
    id v12 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v8 = v12;
    id v9 = v7;
  }

  return v5;
}

void __59__MONowPlayingMediaManager__generateMediaPlaySessionsFrom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v48;
    id v9 = NSAssertionHandler_ptr;
    uint64_t v33 = *(void *)v48;
    id v34 = v4;
    while (1)
    {
      id v10 = 0;
      id v35 = v6;
      do
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v10);
        if ([v11 playbackState] != (id)5)
        {
          if (v7
            && [v7 playbackState] == (id)1
            && ([v11 playbackState] == (id)3
             || [v11 playbackState] == (id)2
             || [v11 playbackState] == (id)4))
          {
            [v7 timestamp];
            double v14 = v13;
            [v11 timestamp];
            double v16 = v15;
            id v17 = [objc_alloc((Class)v9[9]) initWithTimeIntervalSinceReferenceDate:v14];
            id v18 = [objc_alloc((Class)v9[9]) initWithTimeIntervalSinceReferenceDate:v16];
            [v18 timeIntervalSinceDate:v17];
            if (v19 > 30.0)
            {
              double v20 = v19;
              if ([v11 duration]
                && v20 > (double)(3 * [v11 duration])
                && ([v11 isRemote] & 1) != 0)
              {

LABEL_23:
                goto LABEL_24;
              }
              id v41 = v18;
              long long v21 = *(void **)(*(void *)(a1 + 32) + 104);
              long long v22 = [v7 bundleID];
              uint64_t v23 = +[NSCharacterSet whitespaceCharacterSet];
              uint64_t v24 = [v22 stringByTrimmingCharactersInSet:v23];
              BOOL v25 = [v21 objectForKeyedSubscript:v24];

              id v40 = v25;
              if (v25)
              {
                uint64_t v46 = [v25 objectForKeyedSubscript:@"bkColor"];
              }
              else
              {
                uint64_t v46 = &stru_1002D2AC8;
              }
              id v39 = *(void **)(a1 + 40);
              uint64_t v38 = [MOMediaPlaySession alloc];
              id v45 = [v7 title];
              uint64_t v44 = [v7 album];
              id v43 = [v7 bundleID];
              uint64_t v37 = [v7 iTunesStoreIdentifier];
              uint64_t v26 = [v7 mediaType];
              long long v36 = [v7 artist];
              unsigned int v27 = [v7 duration];
              unsigned __int8 v28 = [v7 isRemote];
              id v29 = [v7 deviceSource];
              BYTE4(v31) = v28;
              LODWORD(v31) = v27;
              id v18 = v41;
              BOOL v30 = -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:](v38, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:", v45, v44, v43, v37, &stru_1002D2AC8, v26, v36, v17, v41, v31, v29, v46);
              [v39 addObject:v30];

              uint64_t v8 = v33;
              id v4 = v34;
              id v9 = NSAssertionHandler_ptr;
              id v6 = v35;
            }
          }
          id v17 = v7;
          id v7 = v11;
          goto LABEL_23;
        }
LABEL_24:
        id v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      id v6 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (!v6) {
        goto LABEL_28;
      }
    }
  }
  id v7 = 0;
LABEL_28:
}

- (void)_updateLearnFromAppStatusTable:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 bundleId];

        if (v11)
        {
          id v12 = [v10 bundleId];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    double v13 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "start to update LFTA status.", v14, 2u);
    }

    +[MOEventBundleProcessor updateLearnedFromTheAppDictionary:v4];
  }
}

- (id)_generateMediaPlayGroupsByDayTitle:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 count])
  {
    id v6 = [(MONowPlayingMediaManager *)self _generateMediaPlaySessionsFrom:v4];
    id v7 = [(MONowPlayingMediaManager *)self _filterMediaSessionsBasedOnMusicApps:v6];
    [(MONowPlayingMediaManager *)self countTotalPlayTime:v7];
    double v9 = v8;
    id v10 = [(MONowPlayingMediaManager *)self _filterMediaSessionsBasedOnApps:v7];
    [(MONowPlayingMediaManager *)self _updateLearnFromAppStatusTable:v7];
    [(MONowPlayingMediaManager *)self countTotalPlayTime:v10];
    double v12 = v11;
    double v13 = v11 / v9;
    if (v9 <= 0.0) {
      double v14 = 1.0;
    }
    else {
      double v14 = v13;
    }
    long long v15 = [(MONowPlayingMediaManager *)self _groupMediaPlaySessionsByTitleDay:v10];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __63__MONowPlayingMediaManager__generateMediaPlayGroupsByDayTitle___block_invoke;
    v22[3] = &unk_1002D23C8;
    id v16 = v5;
    id v23 = v16;
    double v24 = v14;
    [v15 enumerateKeysAndObjectsUsingBlock:v22];
    long long v17 = [[MOMediaPlayMetrics alloc] initWithFirstPartyAppRatio:v14 firstPartyAppTime:v12 musciAppTime:v9];
    id v21 = 0;
    [(MOMediaPlayMetrics *)v17 submitMetricsWithError:&v21];
    id v18 = v21;
    id v19 = v16;
  }

  return v5;
}

void __63__MONowPlayingMediaManager__generateMediaPlayGroupsByDayTitle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = [v6 count];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v50;
    double v12 = 0.0;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v16 = [v14 endDate];
        long long v17 = [v14 startDate];
        [v16 timeIntervalSinceDate:v17];
        double v19 = v18;

        double v20 = [v8 firstObject];
        if ([v20 duration])
        {
          id v21 = [v8 firstObject];
          double v22 = (double)[v21 duration];

          if (v19 <= v22) {
            goto LABEL_10;
          }
          double v20 = [v8 firstObject];
          double v19 = (double)[v20 duration];
        }

LABEL_10:
        double v12 = v12 + v19;
      }
      id v10 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (!v10) {
        goto LABEL_14;
      }
    }
  }
  double v12 = 0.0;
LABEL_14:

  id v23 = [v8 firstObject];
  double v24 = [v23 mediaType];
  BOOL v25 = [v8 firstObject];
  uint64_t v26 = [v25 bundleId];
  unsigned int v27 = +[MOMediaPlaySession getMOPlaySessionMediaType:v24 bundleId:v26];
  unsigned int v28 = [v27 unsignedIntValue];

  if (v28 == 1 || v12 >= 60.0)
  {
    id v43 = *(void **)(a1 + 32);
    id v29 = [MOMediaPlay alloc];
    long long v47 = [v8 firstObject];
    long long v48 = [v47 title];
    uint64_t v46 = [v8 firstObject];
    BOOL v30 = [v46 album];
    id v45 = [v8 firstObject];
    id v40 = [v45 bundleId];
    uint64_t v42 = [v8 firstObject];
    uint64_t v31 = [v42 productId];
    id v41 = [v8 firstObject];
    id v39 = [v41 mediaType];
    id v32 = [v8 firstObject];
    uint64_t v33 = [v32 artist];
    unsigned int v34 = v7;
    +[NSNumber numberWithDouble:v12];
    id v35 = v44 = v5;
    long long v36 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
    LODWORD(v38) = v34;
    uint64_t v37 = [(MOMediaPlay *)v29 initWithTitle:v48 album:v30 bundleId:v40 productId:v31 genre:&stru_1002D2AC8 mediaType:v39 artist:v33 sumTimePlayed:v35 repetitions:v38 mediaPlaySessions:v8 firstPartyTimePlayedRatio:v36];
    [v43 addObject:v37];

    id v5 = v44;
  }
}

- (id)_filterMediaSessionsBasedOnMusicApps:(id)a3
{
  id v4 = a3;
  id v53 = (id)objc_opt_new();
  id v5 = objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v65;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v65 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        double v12 = [v11 bundleId];

        if (v12)
        {
          double v13 = [v11 bundleId];
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v8);
  }
  long long v48 = v5;

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v6;
  id v14 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v61;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        firstPartyBundleIdSet = self->_firstPartyBundleIdSet;
        double v20 = [v18 bundleId];
        if ([(NSSet *)firstPartyBundleIdSet containsObject:v20])
        {
          id v21 = [v18 title];
          id v22 = [v21 length];

          if (!v22) {
            continue;
          }
          id v23 = [v18 bundleId];
          unsigned int v24 = [v23 isEqualToString:@"com.apple.MediaPlayer.RemotePlayerService"];

          if (!v24) {
            goto LABEL_21;
          }
          double v20 = [v18 mediaType];
          if ([v20 containsString:@"Music"])
          {
            uint64_t v25 = [v18 productId];
            if (v25)
            {
              uint64_t v26 = (void *)v25;
              unsigned int v27 = [v18 productId];
              unsigned __int8 v28 = [v27 isEqualToString:&stru_1002D2AC8];

              if (v28) {
                continue;
              }
LABEL_21:
              [v53 addObject:v18];
              continue;
            }
          }
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v15);
  }

  id v29 = v48;
  [(MONowPlayingMediaManager *)self _fetchAppCateogryByBundleIds:v48];
  long long v51 = +[MOMediaPlaySession describeCategory:6011];
  long long v50 = +[MOMediaPlaySession describeCategory:6009];
  long long v49 = +[MOMediaPlaySession describeCategory:6016];
  bundleIdAppInfoMappings = self->_bundleIdAppInfoMappings;
  if (bundleIdAppInfoMappings && [(NSMutableDictionary *)bundleIdAppInfoMappings count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v52 = obj;
    id v31 = [v52 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v54 = *(void *)v57;
      do
      {
        for (k = 0; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v57 != v54) {
            objc_enumerationMutation(v52);
          }
          unsigned int v34 = *(void **)(*((void *)&v56 + 1) + 8 * (void)k);
          long long v36 = self->_bundleIdAppInfoMappings;
          uint64_t v37 = v34;
          uint64_t v38 = [v34 bundleId];
          id v39 = +[NSCharacterSet whitespaceCharacterSet];
          id v40 = [v38 stringByTrimmingCharactersInSet:v39];
          id v41 = [(NSMutableDictionary *)v36 objectForKeyedSubscript:v40];

          if (v41)
          {
            uint64_t v42 = [v41 objectForKeyedSubscript:@"category"];
          }
          else
          {
            uint64_t v42 = &stru_1002D2AC8;
          }
          id v43 = self->_firstPartyBundleIdSet;
          id v44 = [v37 bundleId];
          if (![(NSSet *)v43 containsObject:v44]
            && v42
            && (([(__CFString *)v42 isEqualToString:v51] & 1) != 0
             || ([(__CFString *)v42 isEqualToString:v50] & 1) != 0
             || ([(__CFString *)v42 isEqualToString:v49] & 1) != 0))
          {
            mediaBundleDeniedIdSet = self->_mediaBundleDeniedIdSet;
            uint64_t v46 = [v37 bundleId];
            LOBYTE(mediaBundleDeniedIdSet) = [(NSSet *)mediaBundleDeniedIdSet containsObject:v46];

            if ((mediaBundleDeniedIdSet & 1) == 0) {
              [v53 addObject:v37];
            }
          }
          else
          {
          }
        }
        id v32 = [v52 countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v32);
    }

    id v29 = v48;
  }

  return v53;
}

- (id)_filterMediaSessionsBasedOnApps:(id)a3
{
  id v4 = a3;
  id v42 = (id)objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v43 = *(void *)v45;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v45 != v43) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        firstPartyBundleIdSet = self->_firstPartyBundleIdSet;
        uint64_t v11 = [v9 bundleId];
        if (![(NSSet *)firstPartyBundleIdSet containsObject:v11])
        {

LABEL_16:
          id v23 = [v9 endDate];
          unsigned int v24 = [v9 startDate];
          [v23 timeIntervalSinceDate:v24];
          double v26 = v25;

          bundleIdAppInfoMappings = self->_bundleIdAppInfoMappings;
          unsigned __int8 v28 = [v9 bundleId];
          id v29 = +[NSCharacterSet whitespaceCharacterSet];
          BOOL v30 = [v28 stringByTrimmingCharactersInSet:v29];
          id v31 = [(NSMutableDictionary *)bundleIdAppInfoMappings objectForKeyedSubscript:v30];

          if (v31)
          {
            id v32 = [v31 objectForKeyedSubscript:@"category"];
          }
          else
          {
            id v32 = &stru_1002D2AC8;
          }
          uint64_t v33 = [v9 bundleId];
          unsigned int v34 = [v9 mediaType];
          unsigned int v35 = +[MOMediaPlaySession isValidThirdPartyEvent:v33 bundleCategory:v32 mediaTypeString:v34 playTime:v26];

          if (v35)
          {
            long long v36 = [v9 title];

            if (v36) {
              [v42 addObject:v9];
            }
          }

          continue;
        }
        double v12 = [v9 title];
        id v13 = [v12 length];

        if (!v13) {
          goto LABEL_16;
        }
        id v14 = [v9 bundleId];
        unsigned int v15 = [v14 isEqualToString:@"com.apple.Music"];
        if ((v15 & 1) == 0)
        {
          uint64_t v16 = [v9 bundleId];
          id v41 = v16;
          if (([v16 isEqualToString:@"com.apple.podcasts"] & 1) == 0)
          {

LABEL_33:
            [v42 addObject:v9];
            continue;
          }
        }
        id v17 = v5;
        uint64_t v18 = [v9 album];
        if (!v18)
        {
          if (!v15) {
LABEL_24:
          }

LABEL_25:
          id v5 = v17;
          continue;
        }
        double v19 = (void *)v18;
        double v20 = [v9 album];
        if (([v20 isEqualToString:&stru_1002D2AC8] & 1) != 0
          || ([v9 productId], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) == 0))
        {

          if (!v15) {
            goto LABEL_24;
          }
          goto LABEL_25;
        }
        id v22 = (void *)v21;
        id v39 = [v9 productId];
        if ([v39 isEqualToString:&stru_1002D2AC8])
        {
          unsigned __int8 v40 = 1;
        }
        else
        {
          uint64_t v38 = [v9 productId];
          unsigned __int8 v40 = [v38 isEqualToString:@"null"];
        }
        if ((v15 & 1) == 0) {

        }
        id v5 = v17;
        if ((v40 & 1) == 0) {
          goto LABEL_33;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v7);
  }

  return v42;
}

- (double)countTotalPlayTime:(id)a3
{
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 endDate];
        uint64_t v11 = [v9 startDate];
        [v10 timeIntervalSinceDate:v11];
        double v7 = v7 + v12;
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)_generateMediaPlaySessionGroupsByDay:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v6 = [(MONowPlayingMediaManager *)self _generateMediaPlaySessionsFrom:v4];
    double v7 = [(MONowPlayingMediaManager *)self _filterMediaSessionsBasedOnApps:v6];
    id v8 = [(MONowPlayingMediaManager *)self _groupMediaPlaySessionsByDay:v7];
  }
  else
  {
    id v8 = objc_opt_new();
  }

  return v8;
}

- (id)_createEventFromMediaPlayGroupsByDayTitle:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 mediaPlaySessions];
  id v7 = [v6 count];

  if (!v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MONowPlayingMediaManager _createEventFromMediaPlayGroupsByDayTitle:]();
    }

    uint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MONowPlayingMediaManager.m" lineNumber:854 description:@"mediaPlay has no mediaPlaySessions. (in %s:%d)", "-[MONowPlayingMediaManager _createEventFromMediaPlayGroupsByDayTitle:]", 854];
  }
  id v10 = [v5 mediaPlaySessions];
  uint64_t v11 = [(MONowPlayingMediaManager *)self _calculateStartDateFromMediaPlaySessions:v10];

  double v12 = [v5 mediaPlaySessions];

  id v13 = [(MONowPlayingMediaManager *)self _calculateEndDateFromMediaPlaySessions:v12];

  long long v14 = [MOEvent alloc];
  long long v15 = +[NSUUID UUID];
  long long v16 = +[NSDate date];
  long long v17 = [(MOEvent *)v14 initWithEventIdentifier:v15 startDate:v11 endDate:v13 creationDate:v16 provider:3 category:4];

  uint64_t v18 = [(MONowPlayingMediaManager *)self configurationManager];
  LODWORD(v19) = 1242802176;
  [v18 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v19];
  uint64_t v21 = [v13 dateByAddingTimeInterval:v20];
  [(MOEvent *)v17 setExpirationDate:v21];

  return v17;
}

- (void)_saveMediaPlayGroupsByDayTitle:(id)a3 startDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[NSDate dateWithTimeIntervalSinceNow:-864000.0];
  if ([v9 isBeforeDate:v11])
  {
    id v12 = v9;

    uint64_t v11 = v12;
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__40;
  v23[4] = __Block_byref_object_dispose__40;
  id v24 = 0;
  momentStore = self->_momentStore;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke;
  v22[3] = &unk_1002CB180;
  void v22[4] = v23;
  [(MOEventStore *)momentStore fetchEventsWithStartDateAfter:v11 Category:4 CompletionHandler:v22];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_2;
  v21[3] = &unk_1002D23F0;
  v21[4] = self;
  v21[5] = v23;
  long long v14 = [v8 _pas_mappedArrayWithTransform:v21];
  long long v15 = self->_momentStore;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_3;
  v18[3] = &unk_1002CACE8;
  id v16 = v14;
  id v19 = v16;
  id v17 = v10;
  id v20 = v17;
  [(MOEventStore *)v15 storeEvents:v16 CompletionHandler:v18];

  _Block_object_dispose(v23, 8);
}

void __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke(uint64_t a1, void *a2)
{
}

id __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _createEventFromMediaPlayGroupsByDayTitle:v3];
  if ([v4 category] == (id)4) {
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else {
    id v5 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    id v24 = v3;
    id obj = v6;
    int v9 = 0;
    uint64_t v26 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v13 = *(void **)(a1 + 32);
        long long v14 = [v4 startDate];
        long long v15 = [v4 endDate];
        id v16 = [v13 _providerIdOfStartDate:v14 endDate:v15];

        id v17 = *(void **)(a1 + 32);
        uint64_t v18 = [v11 startDate];
        id v19 = [v11 endDate];
        id v20 = [v17 _providerIdOfStartDate:v18 endDate:v19];

        v9 |= [v16 isEqualToString:v20];
      }
      id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
    uint64_t v21 = obj;

    id v3 = v24;
    if (v9)
    {
      id v22 = 0;
      goto LABEL_15;
    }
  }
  else
  {

    uint64_t v21 = v6;
  }
  id v22 = v4;
LABEL_15:

  return v22;
}

void __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_3_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saved repeated or played media events, count, %lu", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)_saveMediaPlaySessionsEvents:(id)a3 handler:(id)a4
{
  id v38 = a3;
  id v5 = a4;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  long long v50 = __Block_byref_object_copy__40;
  long long v51 = __Block_byref_object_dispose__40;
  id v52 = 0;
  id v6 = [objc_alloc((Class)NSSet) initWithObjects:&off_1002F7AF0];
  momentStore = self->_momentStore;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke;
  v46[3] = &unk_1002CADF8;
  v46[4] = &v47;
  [(MOEventStore *)momentStore fetchLastEventOfCategories:v6 CompletionHandler:v46];
  uint64_t v33 = v6;
  unsigned int v35 = objc_opt_new();
  unsigned int v34 = v5;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = [v38 allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v43;
    id obj = v8;
    do
    {
      int v11 = 0;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v11);
        long long v14 = [v38 objectForKeyedSubscript:v12];
        if ([v14 count])
        {
          long long v15 = [(MONowPlayingMediaManager *)self _createEventFromMediaPlaySessions:v14];
          id v16 = v15;
          if (v48[5]
            && ([v15 startDate],
                id v17 = objc_claimAutoreleasedReturnValue(),
                [(id)v48[5] startDate],
                uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                unsigned int v19 = [v17 isAfterDate:v18],
                v18,
                v17,
                !v19))
          {
            if (v48[5])
            {
              id v20 = [v16 startDate];
              uint64_t v21 = [(id)v48[5] startDate];
              unsigned int v22 = [v20 isEqualToDate:v21];

              if (v22)
              {
                id v23 = [v16 startDate];
                id v24 = [v16 endDate];
                double v25 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v23 endDate:v24];

                uint64_t v26 = [(id)v48[5] startDate];
                long long v27 = [(id)v48[5] endDate];
                long long v28 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v26 endDate:v27];

                if (([v25 isEqualToString:v28] & 1) == 0) {
                  [v35 addObject:v16];
                }
              }
            }
          }
          else
          {
            [v35 addObject:v16];
          }
        }
        int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v8 = obj;
      id v29 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
      id v9 = v29;
    }
    while (v29);
  }

  long long v30 = self->_momentStore;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke_2;
  v39[3] = &unk_1002CACE8;
  id v31 = v35;
  id v40 = v31;
  id v32 = v34;
  id v41 = v32;
  [(MOEventStore *)v30 storeEvents:v31 CompletionHandler:v39];

  _Block_object_dispose(&v47, 8);
}

void __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke(uint64_t a1, void *a2)
{
}

void __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saved mediaPlaySession events, count, %lu", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)fetchAndSaveMediaPlayEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke;
  v9[3] = &unk_1002CAD60;
  uint64_t v10 = self;
  id v11 = a3;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(MONowPlayingMediaManager *)v10 _fetchNowPlayingEventsBetweenStartDate:v8 EndDate:a4 CompletionHandler:v9];
}

void __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Saving media contents.", buf, 2u);
  }

  *(void *)buf = 0;
  long long v42 = buf;
  uint64_t v43 = 0x3032000000;
  long long v44 = __Block_byref_object_copy__40;
  long long v45 = __Block_byref_object_dispose__40;
  id v46 = 0;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__40;
  id v39 = __Block_byref_object_dispose__40;
  id v40 = 0;
  id v8 = (void *)a1[4];
  id v9 = [v8 _generateMediaPlayGroupsByDayTitle:v5];
  uint64_t v10 = a1[5];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke_270;
  v34[3] = &unk_1002D2418;
  v34[4] = buf;
  v34[5] = &v35;
  [v8 _saveMediaPlayGroupsByDayTitle:v9 startDate:v10 handler:v34];

  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Saving mediaPlaySession events.", v28, 2u);
  }

  *(void *)long long v28 = 0;
  id v29 = v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__40;
  id v32 = __Block_byref_object_dispose__40;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  double v25 = __Block_byref_object_copy__40;
  uint64_t v26 = __Block_byref_object_dispose__40;
  id v27 = 0;
  id v12 = (void *)a1[4];
  id v13 = [v12 _generateMediaPlaySessionGroupsByDay:v5];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke_271;
  v21[3] = &unk_1002D2418;
  v21[4] = v28;
  v21[5] = &v22;
  [v12 _saveMediaPlaySessionsEvents:v13 handler:v21];

  if (a1[6])
  {
    long long v14 = (void *)*((void *)v42 + 5);
    if (v14 || (long long v14 = (void *)*((void *)v29 + 5)) != 0) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    CFStringRef v47 = @"resultNumberOfEvents";
    id v16 = [(id)v36[5] objectForKeyedSubscript:@"resultNumberOfEvents"];
    id v17 = (char *)[v16 integerValue];
    uint64_t v18 = [(id)v23[5] objectForKeyedSubscript:@"resultNumberOfEvents"];
    unsigned int v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", &v17[(void)[v18 integerValue]]);
    long long v48 = v19;
    id v20 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];

    (*(void (**)(void))(a1[6] + 16))();
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(buf, 8);
}

void __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke_271(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_createEventFromMediaPlaySessions:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MONowPlayingMediaManager _createEventFromMediaPlaySessions:]();
    }

    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MONowPlayingMediaManager.m" lineNumber:982 description:@"mediaPlaySessions has no sessions. (in %s:%d)", "-[MONowPlayingMediaManager _createEventFromMediaPlaySessions:]", 982];
  }
  id v8 = [(MONowPlayingMediaManager *)self _calculateStartDateFromMediaPlaySessions:v5];
  uint64_t v9 = [(MONowPlayingMediaManager *)self _calculateEndDateFromMediaPlaySessions:v5];

  uint64_t v10 = [MOEvent alloc];
  id v11 = +[NSUUID UUID];
  id v12 = +[NSDate date];
  id v13 = [(MOEvent *)v10 initWithEventIdentifier:v11 startDate:v8 endDate:v9 creationDate:v12 provider:3 category:6];

  long long v14 = [v9 dateByAddingTimeInterval:2419200.0];
  [(MOEvent *)v13 setExpirationDate:v14];

  return v13;
}

- (id)_providerIdOfStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v7 = v6 / 0.01;
  [v5 timeIntervalSinceReferenceDate];
  double v9 = v8;

  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%ld,%ld", (uint64_t)v7, (uint64_t)(v9 / 0.01)];

  return v10;
}

- (void)rehydratedMediaPlayEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(MONowPlayingMediaManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MONowPlayingMediaManager_rehydratedMediaPlayEvents_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __62__MONowPlayingMediaManager_rehydratedMediaPlayEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydratedMediaPlayEvents:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydratedMediaPlayEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if (![v6 count])
  {
    double v8 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "no event to rehydrate, returning nil", buf, 2u);
    }

    v7[2](v7, &__NSArray0__struct, 0);
  }
  id v9 = [v6 getDurationOfMOEventArray];
  id v10 = [v9 startDate];
  id v11 = [v9 endDate];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __63__MONowPlayingMediaManager__rehydratedMediaPlayEvents_handler___block_invoke;
  v14[3] = &unk_1002D10D0;
  id v16 = self;
  id v17 = v7;
  id v15 = v6;
  id v12 = v6;
  id v13 = v7;
  [(MONowPlayingMediaManager *)self _fetchNowPlayingEventsBetweenStartDate:v10 EndDate:v11 CompletionHandler:v14];
}

void __63__MONowPlayingMediaManager__rehydratedMediaPlayEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__MONowPlayingMediaManager__rehydratedMediaPlayEvents_handler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    double v8 = [MORehydrationMetrics alloc];
    id v9 = [*(id *)(a1 + 32) firstObject];
    id v10 = [v9 category];
    id v11 = [*(id *)(a1 + 32) firstObject];
    id v12 = [v11 provider];
    id v13 = [v6 description];
    long long v14 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v8, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v10, v12, 0, v13, [*(id *)(a1 + 32) count], 3, (double)(int)[*(id *)(a1 + 32) count], 0.0);

    uint64_t v23 = 0;
    [(MORehydrationMetrics *)v14 submitMetricsWithError:&v23];
    goto LABEL_14;
  }
  id v15 = [*(id *)(a1 + 32) firstObject];
  id v16 = [v15 category];

  if (v16 == (id)6)
  {
    uint64_t v17 = [*(id *)(a1 + 40) _rehydratedMediaSessionsForEvents:*(void *)(a1 + 32) usingNowPlayingEvents:v5];
  }
  else
  {
    if (v16 != (id)4)
    {
      long long v14 = 0;
      goto LABEL_11;
    }
    uint64_t v17 = [*(id *)(a1 + 40) _rehydratedMediaEvents:*(void *)(a1 + 32) usingNowPlayingEvents:v5];
  }
  long long v14 = (MORehydrationMetrics *)v17;
LABEL_11:
  uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [(MORehydrationMetrics *)v14 count];
    id v20 = [*(id *)(a1 + 32) count];
    uint64_t v21 = [*(id *)(a1 + 32) firstObject];
    uint64_t v22 = [v21 describeCategory];
    *(_DWORD *)buf = 134218498;
    id v25 = v19;
    __int16 v26 = 2048;
    id v27 = v20;
    __int16 v28 = 2112;
    id v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "rehydrated media events count, %lu, stored media events count, %lu, category, %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

- (id)rehydratedMediaPlayEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 getDurationOfMOEventArray];
    *(void *)buf = 0;
    id v15 = buf;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__40;
    uint64_t v18 = __Block_byref_object_dispose__40;
    id v19 = 0;
    id v6 = [v5 startDate];
    id v7 = [v5 endDate];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __54__MONowPlayingMediaManager_rehydratedMediaPlayEvents___block_invoke;
    v13[3] = &unk_1002CB180;
    v13[4] = buf;
    [(MONowPlayingMediaManager *)self _fetchNowPlayingEventsBetweenStartDate:v6 EndDate:v7 CompletionHandler:v13];

    [(MONowPlayingMediaManager *)self waitForQueueEmpty];
    double v8 = [v4 firstObject];
    id v9 = [v8 category];

    if (v9 == (id)6)
    {
      uint64_t v10 = [(MONowPlayingMediaManager *)self _rehydratedMediaSessionsForEvents:v4 usingNowPlayingEvents:*((void *)v15 + 5)];
    }
    else
    {
      if (v9 != (id)4)
      {
        id v11 = 0;
        goto LABEL_11;
      }
      uint64_t v10 = [(MONowPlayingMediaManager *)self _rehydratedMediaEvents:v4 usingNowPlayingEvents:*((void *)v15 + 5)];
    }
    id v11 = (void *)v10;
LABEL_11:
    _Block_object_dispose(buf, 8);

    goto LABEL_12;
  }
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "no event to rehydrate, returning...", buf, 2u);
  }
  id v11 = &__NSArray0__struct;
LABEL_12:

  return v11;
}

void __54__MONowPlayingMediaManager_rehydratedMediaPlayEvents___block_invoke(uint64_t a1, void *a2)
{
}

- (id)_rehydratedMediaSessionsForEvents:(id)a3 usingNowPlayingEvents:(id)a4
{
  id v6 = a3;
  id v38 = self;
  id v34 = a4;
  id v39 = -[MONowPlayingMediaManager _generateMediaPlaySessionGroupsByDay:](self, "_generateMediaPlaySessionGroupsByDay:");
  if ([v39 count])
  {
    id v35 = (id)objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v54;
      uint64_t v36 = *(void *)v54;
      id v37 = v6;
      do
      {
        id v11 = 0;
        id v40 = v8;
        do
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v11);
          if ([v12 category] == (id)6)
          {
            long long v42 = v13;
            uint64_t v43 = v11;
            int v44 = v9;
            dateFormatter = v38->_dateFormatter;
            id v15 = [v12 startDate];
            uint64_t v16 = [(NSDateFormatter *)dateFormatter stringFromDate:v15];

            long long v45 = (void *)v16;
            id v46 = objc_opt_new();
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v47 = [v39 objectForKeyedSubscript:v16];
            id v17 = [v47 countByEnumeratingWithState:&v49 objects:v61 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v50;
              do
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(void *)v50 != v19) {
                    objc_enumerationMutation(v47);
                  }
                  uint64_t v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                  uint64_t v22 = [v21 startDate];
                  uint64_t v23 = [v12 startDate];
                  if ([v22 isOnOrAfter:v23])
                  {
                    uint64_t v24 = [v21 endDate];
                    id v25 = [v12 endDate];
                    unsigned int v26 = [v24 isOnOrBefore:v25];

                    if (v26) {
                      [v46 addObject:v21];
                    }
                  }
                  else
                  {
                  }
                }
                id v18 = [v47 countByEnumeratingWithState:&v49 objects:v61 count:16];
              }
              while (v18);
            }

            id v27 = v46;
            uint64_t v10 = v36;
            id v8 = v40;
            id v13 = v42;
            id v11 = v43;
            if ([v46 count])
            {
              id v28 = [v12 copy];
              [v28 setMediaPlaySessions:v46];
              id v29 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v58 = v45;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "rehydrated mediaPlay sessions for day: %@", buf, 0xCu);
              }

              [v35 addObject:v28];
              id v27 = v46;
            }
            uint64_t v9 = (v44 + 1);

            id v6 = v37;
          }
          id v11 = (char *)v11 + 1;
        }
        while (v11 != v8);
        id v8 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }

    uint64_t v30 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:]([MORehydrationMetrics alloc], "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 6, 3, 1, 0, v9, 3, (double)(int)(v9 - [v35 count]), 0.0);
    uint64_t v48 = 0;
    [(MORehydrationMetrics *)v30 submitMetricsWithError:&v48];
    id v31 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      id v32 = [v35 count];
      *(_DWORD *)buf = 134218240;
      id v58 = v32;
      __int16 v59 = 1024;
      int v60 = v9;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "rehydrated media play session event count, %lu, stored events count, %d", buf, 0x12u);
    }
  }
  else
  {
    _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    uint64_t v30 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v30->super.super, OS_LOG_TYPE_ERROR)) {
      -[MONowPlayingMediaManager _rehydratedMediaSessionsForEvents:usingNowPlayingEvents:]();
    }
    id v35 = &__NSArray0__struct;
  }

  return v35;
}

- (id)_rehydratedMediaEvents:(id)a3 usingNowPlayingEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MONowPlayingMediaManager *)self _generateMediaPlayGroupsByDayTitle:v7];
  if ([v8 count])
  {
    uint64_t v43 = self;
    id v39 = v7;
    id v40 = v6;
    int v44 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v8 count]];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v38 = v8;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v51;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v16 = [v14 mediaPlaySessions];
          id v17 = [(MONowPlayingMediaManager *)v43 _calculateStartDateFromMediaPlaySessions:v16];

          id v18 = [v14 mediaPlaySessions];
          uint64_t v19 = [(MONowPlayingMediaManager *)v43 _calculateEndDateFromMediaPlaySessions:v18];

          id v20 = [(MONowPlayingMediaManager *)v43 _providerIdOfStartDate:v17 endDate:v19];
          [v44 setObject:v14 forKeyedSubscript:v20];
        }
        id v11 = [v9 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v11);
    }

    id v41 = (id)objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v40;
    id v21 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v47;
      id v25 = v43;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(obj);
          }
          id v27 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
          if ([v27 category] == (id)4)
          {
            id v29 = [v27 startDate];
            uint64_t v30 = [v27 endDate];
            id v31 = [(MONowPlayingMediaManager *)v25 _providerIdOfStartDate:v29 endDate:v30];
            id v32 = [v44 objectForKeyedSubscript:v31];

            id v25 = v43;
            if (v32)
            {
              id v33 = [v27 copy];
              [(MONowPlayingMediaManager *)v43 _setDynamicProperties:v33 mediaPlay:v32];
              [v41 addObject:v33];
            }
            uint64_t v23 = (v23 + 1);
          }
        }
        id v22 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v22);
    }
    else
    {
      uint64_t v23 = 0;
    }

    id v34 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:]([MORehydrationMetrics alloc], "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 4, 3, 1, 0, v23, 3, (double)(int)(v23 - [v41 count]), 0.0);
    uint64_t v45 = 0;
    [(MORehydrationMetrics *)v34 submitMetricsWithError:&v45];
    id v35 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    id v8 = v38;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v36 = [v41 count];
      *(_DWORD *)buf = 134218240;
      id v55 = v36;
      __int16 v56 = 1024;
      int v57 = v23;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "rehydrated leisure media event count, %lu, stored events count, %d", buf, 0x12u);
    }

    id v7 = v39;
    id v6 = v40;
  }
  else
  {
    int v44 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[MONowPlayingMediaManager _rehydratedMediaEvents:usingNowPlayingEvents:]();
    }
    id v41 = &__NSArray0__struct;
  }

  return v41;
}

- (void)_setDynamicProperties:(id)a3 mediaPlay:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 title];

  if (v7)
  {
    id v8 = [v6 title];
    [v5 setMediaTitle:v8];

    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.7(v5);
    }
  }
  id v10 = [v6 album];

  if (v10)
  {
    id v11 = [v6 album];
    [v5 setMediaAlbum:v11];

    uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.6(v5);
    }
  }
  id v13 = [v6 bundleId];

  if (v13)
  {
    long long v14 = [v6 bundleId];
    [v5 setMediaPlayerBundleId:v14];

    id v15 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.5(v5);
    }
  }
  uint64_t v16 = [v6 productId];

  if (v16)
  {
    id v17 = [v6 productId];
    [v5 setMediaProductId:v17];
  }
  id v18 = [v6 genre];

  if (v18)
  {
    uint64_t v19 = [v6 genre];
    [v5 setMediaGenre:v19];
  }
  id v20 = [v6 mediaType];

  if (v20)
  {
    id v21 = [v6 mediaType];
    [v5 setMediaType:v21];

    id v22 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.4(v5);
    }
  }
  uint64_t v23 = [v6 artist];

  if (v23)
  {
    uint64_t v24 = [v6 artist];
    [v5 setMediaArtist:v24];
  }
  id v25 = [v6 sumTimePlayed];

  if (v25)
  {
    unsigned int v26 = [v6 sumTimePlayed];
    [v5 setMediaSumTimePlayed:v26];

    id v27 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:](v5);
    }
  }
  if ([v6 repetitions])
  {
    id v28 = [objc_alloc((Class)NSNumber) initWithInt:[v6 repetitions]];
    [v5 setMediaRepetitions:v28];
    id v29 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:](v5);
    }
  }
  uint64_t v30 = [v6 mediaPlaySessions];

  if (v30)
  {
    id v31 = [v6 mediaPlaySessions];
    [v5 setMediaPlaySessions:v31];

    id v32 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:](v5);
    }
  }
  id v33 = [v6 firstPartyTimePlayedRatio];

  if (v33)
  {
    id v34 = [v6 firstPartyTimePlayedRatio];
    id v35 = [v5 mediaEvent];
    [v35 setMediaFirstPartyTimePlayedRatio:v34];
  }
}

- (void)updateMediaPlayEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 firstObject];
  id v9 = [v8 category];

  if (v9 == (id)6)
  {
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = __73__MONowPlayingMediaManager_updateMediaPlayEventsDeletedAtSource_handler___block_invoke_2;
    long long v14 = &unk_1002C9A50;
    id v10 = &v15;
    id v15 = v7;
    [(MONowPlayingMediaManager *)self _updateMediaPlaySessionEventsDeletedAtSource:v6 handler:&v11];
    goto LABEL_5;
  }
  if (v9 == (id)4)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __73__MONowPlayingMediaManager_updateMediaPlayEventsDeletedAtSource_handler___block_invoke;
    v16[3] = &unk_1002C9A50;
    id v10 = &v17;
    id v17 = v7;
    [(MONowPlayingMediaManager *)self _updateMediaPlayEventsDeletedAtSource:v6 handler:v16];
LABEL_5:
  }
  [(MONowPlayingMediaManager *)self waitForQueueEmpty];
}

uint64_t __73__MONowPlayingMediaManager_updateMediaPlayEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73__MONowPlayingMediaManager_updateMediaPlayEventsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateMediaPlaySessionEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v43 = a4;
  uint64_t v45 = v5;
  int v44 = [v5 getDurationOfMOEventArray];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  id v74 = __Block_byref_object_copy__40;
  v75 = __Block_byref_object_dispose__40;
  id v76 = 0;
  uint64_t v65 = 0;
  long long v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__40;
  v69 = __Block_byref_object_dispose__40;
  id v70 = 0;
  id v6 = [v44 startDate];
  id v7 = [v44 endDate];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke;
  v64[3] = &unk_1002D2440;
  v64[4] = self;
  v64[5] = &v71;
  v64[6] = &v65;
  [(MONowPlayingMediaManager *)self _fetchNowPlayingEventsBetweenStartDate:v6 EndDate:v7 CompletionHandler:v64];

  [(MONowPlayingMediaManager *)self waitForQueueEmpty];
  if (v72[5])
  {
    long long v46 = (MORehydrationMetrics *)objc_alloc_init((Class)NSMutableArray);
    long long v47 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = v45;
    id v8 = [obj countByEnumeratingWithState:&v59 objects:v79 count:16];
    if (v8)
    {
      uint64_t v49 = *(void *)v60;
      do
      {
        id v50 = v8;
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v60 != v49) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if ([v10 category] == (id)6)
          {
            uint64_t v12 = [v10 startDate];
            id v13 = [v10 endDate];
            long long v51 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v12 endDate:v13];

            dateFormatter = self->_dateFormatter;
            id v15 = [v10 startDate];
            long long v52 = [(NSDateFormatter *)dateFormatter stringFromDate:v15];

            uint64_t v16 = [(id)v72[5] objectForKeyedSubscript:v52];
            id v17 = [(MONowPlayingMediaManager *)self _calculateStartDateFromMediaPlaySessions:v16];
            id v18 = [(MONowPlayingMediaManager *)self _calculateEndDateFromMediaPlaySessions:v16];
            uint64_t v19 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v17 endDate:v18];
            if ([v51 isEqualToString:v19])
            {
              if ([v10 rehydrationFailCount])
              {
                id v20 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v10 category] provider:[v10 provider] failureCount:[v10 rehydrationFailCount]];
                id v58 = 0;
                [(MORehydrationThresholdMetrics *)v20 submitMetricsWithError:&v58];
                id v21 = v58;
                [v10 setRehydrationFailCount:0];
                [(MORehydrationMetrics *)v46 addObject:v10];
              }
            }
            else
            {
              [v10 setRehydrationFailCount:[v10 rehydrationFailCount] + 1];
              [v47 addObject:v10];
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v59 objects:v79 count:16];
      }
      while (v8);
    }

    id v22 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v47 count];
      *(_DWORD *)buf = 134217984;
      id v78 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%ld previously saved MediaPlayingSessions event(s) had no play sessions, therefore add rehydration failure count.", buf, 0xCu);
    }

    uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = [(MORehydrationMetrics *)v46 count];
      *(_DWORD *)buf = 134217984;
      id v78 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%ld previously rehydration failed MediaPlayingSessions event(s) now have play sessions, therefore change rehydration failure count.", buf, 0xCu);
    }

    unsigned int v26 = [MORehydrationMetrics alloc];
    id v27 = [obj firstObject];
    id v28 = [v27 category];
    id v29 = [obj firstObject];
    uint64_t v30 = [[MORehydrationMetrics alloc] initWithCategory:v26 provider:[v29 provider] spiSuccess:1 spiError:0 failCount:[obj count] successAfterPreFailCount:1 totalCount:[v47 count] rehydrationTrigger:((double)(int)[MORehydrationMetrics count](v46, "count"))];

    id v57 = 0;
    [(MORehydrationMetrics *)v30 submitMetricsWithError:&v57];
    id v31 = v57;
    id v32 = [v47 copy];
    [(MORehydrationMetrics *)v46 addObjectsFromArray:v32];

    id v33 = [(MONowPlayingMediaManager *)self momentStore];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke_280;
    v54[3] = &unk_1002CACE8;
    id v34 = v47;
    id v55 = v34;
    id v56 = v43;
    [v33 storeEvents:v46 CompletionHandler:v54];

    id v35 = v46;
  }
  else
  {
    id v36 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[MONowPlayingMediaManager _updateMediaPlaySessionEventsDeletedAtSource:handler:]();
    }

    if (v43) {
      (*((void (**)(id, uint64_t, void *))v43 + 2))(v43, v66[5], &__NSDictionary0__struct);
    }
    id v37 = [MORehydrationMetrics alloc];
    id v38 = [v45 firstObject];
    id v39 = [v38 category];
    id v40 = [v45 firstObject];
    id v41 = [v40 provider];
    long long v42 = [(id)v66[5] description];
    id v35 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v37, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v39, v41, 0, v42, [v45 count], 1, (double)(int)objc_msgSend(v45, "count"), 0.0);

    uint64_t v63 = 0;
    [(MORehydrationMetrics *)v35 submitMetricsWithError:&v63];
  }

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);
}

void __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) _generateMediaPlaySessionGroupsByDay:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke_280(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke_280_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Update %ld MediaPlayingSessions event(s) in database succeeded!", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)_updateMediaPlayEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v55 = a4;
  id v57 = v5;
  id v56 = [v5 getDurationOfMOEventArray];
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__40;
  v89 = __Block_byref_object_dispose__40;
  id v90 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__40;
  v83 = __Block_byref_object_dispose__40;
  id v84 = 0;
  id v6 = [v56 startDate];
  uint64_t v7 = [v56 endDate];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke;
  v78[3] = &unk_1002D2440;
  v78[4] = self;
  v78[5] = &v85;
  v78[6] = &v79;
  [(MONowPlayingMediaManager *)self _fetchNowPlayingEventsBetweenStartDate:v6 EndDate:v7 CompletionHandler:v78];

  [(MONowPlayingMediaManager *)self waitForQueueEmpty];
  if (v86[5])
  {
    id v8 = objc_alloc((Class)NSMutableDictionary);
    long long v62 = (MORehydrationMetrics *)[v8 initWithCapacity:[v86[5] count]];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = (id)v86[5];
    id v9 = [obj countByEnumeratingWithState:&v73 objects:v94 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v74;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v74 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          long long v14 = [(MONowPlayingMediaManager *)self _createEventFromMediaPlayGroupsByDayTitle:v12];
          id v15 = [v14 startDate];
          uint64_t v16 = [v14 endDate];
          id v17 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v15 endDate:v16];
          id v18 = [v14 describeCategory];
          uint64_t v19 = [v17 stringByAppendingString:v18];

          [(MORehydrationMetrics *)v62 setObject:v14 forKeyedSubscript:v19];
        }
        id v9 = [obj countByEnumeratingWithState:&v73 objects:v94 count:16];
      }
      while (v9);
    }

    id v59 = objc_alloc_init((Class)NSMutableArray);
    id v58 = objc_opt_new();
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obja = v57;
    id v20 = [obja countByEnumeratingWithState:&v69 objects:v93 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v70;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v70 != v21) {
            objc_enumerationMutation(obja);
          }
          id v23 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
          id v25 = [v23 startDate];
          unsigned int v26 = [v23 endDate];
          id v27 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v25 endDate:v26];
          id v28 = [v23 describeCategory];
          id v29 = [v27 stringByAppendingString:v28];

          uint64_t v30 = [(MORehydrationMetrics *)v62 objectForKeyedSubscript:v29];
          id v31 = v30;
          if (v30)
          {
            if ([v30 rehydrationFailCount])
            {
              id v32 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v31 category] provider:[v23 provider] failureCount:[v31 rehydrationFailCount]];
              id v68 = 0;
              [(MORehydrationThresholdMetrics *)v32 submitMetricsWithError:&v68];
              id v33 = v68;
              [v31 setRehydrationFailCount:0];
              [v59 addObject:v31];
            }
          }
          else
          {
            [v23 setRehydrationFailCount:((char *)[v23 rehydrationFailCount]) + 1];
            [v58 addObject:v23];
          }
        }
        id v20 = [obja countByEnumeratingWithState:&v69 objects:v93 count:16];
      }
      while (v20);
    }

    id v34 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = [v58 count];
      *(_DWORD *)buf = 134217984;
      id v92 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%ld previously saved nowplaying event(s) not found, therefore add rehydration failure count.", buf, 0xCu);
    }

    id v36 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = [v59 count];
      *(_DWORD *)buf = 134217984;
      id v92 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%ld previously rehydration failed nowplaying event(s) are found, therefore change rehydration failure count.", buf, 0xCu);
    }

    id v38 = [MORehydrationMetrics alloc];
    id v39 = [obja firstObject];
    id v40 = [v39 category];
    id v41 = [obja firstObject];
    long long v42 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v38, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v40, [v41 provider], 1, 0, [obja count], 1, (double)(int)[v58 count], (double)(int)[v59 count]);

    id v67 = 0;
    [(MORehydrationMetrics *)v42 submitMetricsWithError:&v67];
    id v43 = v67;
    id v44 = [v58 copy];
    [v59 addObjectsFromArray:v44];

    uint64_t v45 = [(MONowPlayingMediaManager *)self momentStore];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke_281;
    v64[3] = &unk_1002CACE8;
    id v46 = v58;
    id v65 = v46;
    id v66 = v55;
    [v45 storeEvents:v59 CompletionHandler:v64];

    long long v47 = v62;
  }
  else
  {
    long long v48 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[MONowPlayingMediaManager _updateMediaPlayEventsDeletedAtSource:handler:]();
    }

    if (v55) {
      (*((void (**)(id, uint64_t, void *))v55 + 2))(v55, v80[5], &__NSDictionary0__struct);
    }
    uint64_t v49 = [MORehydrationMetrics alloc];
    id v50 = [v57 firstObject];
    id v51 = [v50 category];
    long long v52 = [v57 firstObject];
    id v53 = [v52 provider];
    long long v54 = [(id)v80[5] description];
    long long v47 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v49, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v51, v53, 0, v54, [v57 count], 1, (double)(int)objc_msgSend(v57, "count"), 0.0);

    uint64_t v77 = 0;
    [(MORehydrationMetrics *)v47 submitMetricsWithError:&v77];
  }

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);
}

void __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) _generateMediaPlayGroupsByDayTitle:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke_281(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke_281_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Update %ld nowplaying event(s) in database succeeded!", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)waitForQueueEmpty
{
}

- (void)fetchMediaPlayEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(MONowPlayingMediaManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __98__MONowPlayingMediaManager_fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  block[3] = &unk_1002CA300;
  block[4] = self;
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

id __98__MONowPlayingMediaManager_fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMediaPlayEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchMediaPlayEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v25 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 4];
  uint64_t v24 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 6];
  long long v14 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 3];
  v33[0] = v25;
  v33[1] = v24;
  id v15 = +[NSArray arrayWithObjects:v33 count:2];
  id v16 = +[NSCompoundPredicate orPredicateWithSubpredicates:v15];

  v32[0] = v16;
  v32[1] = v14;
  id v17 = +[NSArray arrayWithObjects:v32 count:2];
  id v18 = +[NSCompoundPredicate andPredicateWithSubpredicates:v17];

  uint64_t v19 = [v13 filteredArrayUsingPredicate:v18];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __99__MONowPlayingMediaManager__fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v26[3] = &unk_1002CE818;
  id v30 = v11;
  id v31 = v12;
  id v27 = v19;
  id v28 = self;
  id v29 = v10;
  id v20 = v11;
  id v21 = v10;
  id v22 = v19;
  id v23 = v12;
  [(MONowPlayingMediaManager *)self _fetchNowPlayingEventsBetweenStartDate:v21 EndDate:v20 CompletionHandler:v26];
}

void __99__MONowPlayingMediaManager__fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  if (v6)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetching media play sessions from source hit error", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v9 = [MORehydrationMetrics alloc];
    id v10 = [v6 description];
    id v11 = [[MORehydrationMetrics alloc] initWithCategory:v9 provider:3 spiSuccess:0 spiError:0 failCount:v10 successAfterPreFailCount:[*(id *)(a1 + 32) count] totalCount:3.0 rehydrationTrigger:0.0];

    uint64_t v91 = 0;
    [(MORehydrationMetrics *)v11 submitMetricsWithError:&v91];
    goto LABEL_61;
  }
  id v11 = (MORehydrationMetrics *)objc_opt_new();
  id v12 = [*(id *)(a1 + 40) _rehydratedMediaEvents:*(void *)(a1 + 32) usingNowPlayingEvents:v5];
  id v13 = [v12 mutableCopy];

  long long v14 = [*(id *)(a1 + 40) _rehydratedMediaSessionsForEvents:*(void *)(a1 + 32) usingNowPlayingEvents:v5];
  id v61 = [v14 mutableCopy];

  long long v62 = objc_opt_new();
  id v15 = [*(id *)(a1 + 40) _createNewLeisureMediaEventsFromMediaPlays:v5 storedEvents:*(void *)(a1 + 32)];
  id v66 = [v15 mutableCopy];

  id v16 = [*(id *)(a1 + 40) _createNewMediaPlayEventsFromMediaPlays:v5 storedEvents:*(void *)(a1 + 32)];
  id v65 = [v16 mutableCopy];

  if ([v13 count]) {
    [(MORehydrationMetrics *)v11 addObjectsFromArray:v13];
  }
  id v17 = v61;
  if ([v61 count]) {
    [(MORehydrationMetrics *)v11 addObjectsFromArray:v61];
  }
  id v18 = v62;
  if ([v66 count]) {
    [v62 addObjectsFromArray:v66];
  }
  if ([v65 count]) {
    [v62 addObjectsFromArray:v65];
  }
  if ([v13 count] && objc_msgSend(v66, "count"))
  {
    long long v71 = v11;
    uint64_t v54 = a1;
    id v56 = v7;
    id v59 = v5;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v52 = v13;
    id obj = v13;
    id v67 = [obj countByEnumeratingWithState:&v87 objects:v103 count:16];
    if (!v67) {
      goto LABEL_34;
    }
    uint64_t v64 = *(void *)v88;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v88 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v69 = v19;
        id v20 = *(void **)(*((void *)&v87 + 1) + 8 * v19);
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v73 = v66;
        id v21 = [v73 countByEnumeratingWithState:&v83 objects:v102 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v84;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v84 != v23) {
                objc_enumerationMutation(v73);
              }
              id v25 = *(void **)(*((void *)&v83 + 1) + 8 * i);
              unsigned int v26 = [v20 startDate];
              id v27 = [v25 startDate];
              if ([v26 isEqualToDate:v27])
              {
                id v28 = [v20 mediaTitle];
                id v29 = [v25 mediaTitle];
                unsigned int v30 = [v28 isEqualToString:v29];

                if (!v30) {
                  continue;
                }
                [(MORehydrationMetrics *)v71 removeObject:v20];
                unsigned int v26 = [v20 eventIdentifier];
                [v25 setEventIdentifier:v26];
              }
              else
              {
              }
            }
            id v22 = [v73 countByEnumeratingWithState:&v83 objects:v102 count:16];
          }
          while (v22);
        }

        uint64_t v19 = v69 + 1;
      }
      while ((id)(v69 + 1) != v67);
      id v67 = [obj countByEnumeratingWithState:&v87 objects:v103 count:16];
      if (!v67)
      {
LABEL_34:

        id v6 = 0;
        id v5 = v59;
        a1 = v54;
        uint64_t v7 = v56;
        id v11 = v71;
        id v13 = v52;
        id v17 = v61;
        id v18 = v62;
        break;
      }
    }
  }
  if ([v17 count] && objc_msgSend(v65, "count"))
  {
    id v53 = v13;
    uint64_t v55 = a1;
    id v31 = v11;
    id v57 = v7;
    id v58 = v6;
    id v60 = v5;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v68 = v17;
    long long v72 = (char *)[v68 countByEnumeratingWithState:&v79 objects:v101 count:16];
    if (v72)
    {
      uint64_t v70 = *(void *)v80;
      do
      {
        id v32 = 0;
        do
        {
          if (*(void *)v80 != v70) {
            objc_enumerationMutation(v68);
          }
          long long v74 = v32;
          id v33 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v32);
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id v34 = v65;
          id v35 = [v34 countByEnumeratingWithState:&v75 objects:v100 count:16];
          if (v35)
          {
            id v36 = v35;
            uint64_t v37 = *(void *)v76;
            do
            {
              for (j = 0; j != v36; j = (char *)j + 1)
              {
                if (*(void *)v76 != v37) {
                  objc_enumerationMutation(v34);
                }
                id v39 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
                id v40 = [v33 startDate];
                id v41 = [v39 startDate];
                unsigned int v42 = [v40 isEqualToDate:v41];

                if (v42)
                {
                  [(MORehydrationMetrics *)v31 removeObject:v33];
                  id v43 = [v33 eventIdentifier];
                  [v39 setEventIdentifier:v43];
                }
              }
              id v36 = [v34 countByEnumeratingWithState:&v75 objects:v100 count:16];
            }
            while (v36);
          }

          id v32 = v74 + 1;
        }
        while (v74 + 1 != v72);
        long long v72 = (char *)[v68 countByEnumeratingWithState:&v79 objects:v101 count:16];
      }
      while (v72);
    }

    id v6 = v58;
    id v5 = v60;
    a1 = v55;
    uint64_t v7 = v57;
    id v11 = v31;
    id v13 = v53;
    id v17 = v61;
    id v18 = v62;
  }
  if ([(MORehydrationMetrics *)v11 count]) {
    [v7 setObject:v11 forKey:@"rehydratedEvents"];
  }
  if ([v18 count]) {
    [v7 setObject:v18 forKey:@"newEvents"];
  }
  id v44 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    uint64_t v45 = v11;
    id v46 = v13;
    uint64_t v47 = a1;
    uint64_t v48 = *(void *)(a1 + 48);
    uint64_t v49 = *(void *)(a1 + 56);
    id v50 = [(MORehydrationMetrics *)v45 count];
    id v51 = [v62 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v93 = v48;
    id v13 = v46;
    __int16 v94 = 2112;
    uint64_t v95 = v49;
    a1 = v47;
    __int16 v96 = 2048;
    id v97 = v50;
    id v17 = v61;
    __int16 v98 = 2048;
    id v99 = v51;
    id v11 = v45;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated event count, %lu, new event count, %lu", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_61:
}

- (id)_createNewLeisureMediaEventsFromMediaPlays:(id)a3 storedEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_opt_new();
    id v33 = v7;
    if ([v7 count])
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v42;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v42 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            id v15 = [v14 startDate];
            id v16 = [v14 endDate];
            id v17 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v15 endDate:v16];
            [v8 addObject:v17];
          }
          id v11 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
        }
        while (v11);
      }
    }
    id v32 = v6;
    id v18 = [(MONowPlayingMediaManager *)self _generateMediaPlayGroupsByDayTitle:v6];
    id v34 = (id)objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v18;
    id v19 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v36 = *(void *)v38;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v38 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
          uint64_t v24 = [(MONowPlayingMediaManager *)self _createEventFromMediaPlayGroupsByDayTitle:v22];
          id v25 = [v24 startDate];
          unsigned int v26 = [v24 endDate];
          id v27 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v25 endDate:v26];

          if (![v8 count])
          {
            if (!v24) {
              goto LABEL_23;
            }
LABEL_22:
            [(MONowPlayingMediaManager *)self _setDynamicProperties:v24 mediaPlay:v22];
            [v34 addObject:v24];
            goto LABEL_23;
          }
          if ([v8 count])
          {
            unsigned __int8 v28 = [v8 containsObject:v27];
            if (v24)
            {
              if ((v28 & 1) == 0) {
                goto LABEL_22;
              }
            }
          }
LABEL_23:
        }
        id v20 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v20);
    }

    id v29 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = [v34 count];
      *(_DWORD *)buf = 134217984;
      id v46 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "new leisure media event count, %lu", buf, 0xCu);
    }

    id v6 = v32;
    id v7 = v33;
  }
  else
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "no media play are fetched to create new leisure media events", buf, 2u);
    }
    id v34 = 0;
  }

  return v34;
}

- (id)_createNewMediaPlayEventsFromMediaPlays:(id)a3 storedEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_opt_new();
    if ([v6 count])
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v45;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v45 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            long long v14 = [v13 startDate];
            id v15 = [v13 endDate];
            id v16 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v14 endDate:v15];
            [v7 addObject:v16];
          }
          id v10 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
        }
        while (v10);
      }
    }
    id v17 = -[MONowPlayingMediaManager _generateMediaPlaySessionGroupsByDay:](self, "_generateMediaPlaySessionGroupsByDay:", v5, v6, v5);
    id v36 = (id)objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v38 = v17;
    id obj = [v17 allKeys];
    id v18 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
          uint64_t v24 = [v38 objectForKeyedSubscript:v22];
          if ([v24 count])
          {
            id v25 = [(MONowPlayingMediaManager *)self _createEventFromMediaPlaySessions:v24];
            [v25 startDate];
            id v27 = v26 = v7;
            unsigned __int8 v28 = [v25 endDate];
            id v29 = [(MONowPlayingMediaManager *)self _providerIdOfStartDate:v27 endDate:v28];

            id v7 = v26;
            if ([v26 count])
            {
              if (![v26 count]) {
                goto LABEL_24;
              }
              unsigned __int8 v30 = [v26 containsObject:v29];
              if (!v25 || (v30 & 1) != 0) {
                goto LABEL_24;
              }
LABEL_23:
              [v25 setMediaPlaySessions:v24];
              [v36 addObject:v25];
            }
            else if (v25)
            {
              goto LABEL_23;
            }
LABEL_24:
          }
        }
        id v19 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v19);
    }

    id v31 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      id v32 = [v36 count];
      *(_DWORD *)buf = 134217984;
      id v49 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "new media play event count, %lu", buf, 0xCu);
    }

    id v6 = v34;
    id v5 = v35;
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no media play are fetched to create new media play events", buf, 2u);
    }
    id v36 = 0;
  }

  return v36;
}

- (id)_findUnrehdyratedEventsFromStoredEvents:(id)a3 rehydratedEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    if ([v5 count])
    {
      id v7 = (id)objc_opt_new();
      id v8 = objc_opt_new();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v28 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v35;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = [*(id *)(*((void *)&v34 + 1) + 8 * i) eventIdentifier:v28];
            id v15 = [v14 UUIDString];
            [v8 addObject:v15];
          }
          id v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v11);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v29 = v5;
      id v16 = v5;
      id v17 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
            uint64_t v22 = [v21 eventIdentifier:v28];
            uint64_t v23 = [v22 UUIDString];
            unsigned __int8 v24 = [v8 containsObject:v23];

            if ((v24 & 1) == 0)
            {
              [v21 setRehydrationFailCount:((char *)[v21 rehydrationFailCount]) + 1];
              [v7 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v18);
      }

      id v6 = v28;
      id v5 = v29;
    }
    else
    {
      unsigned int v26 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "no stored events for rehydration", buf, 2u);
      }

      id v7 = 0;
    }
  }
  else
  {
    id v25 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "no media events are rehydrated", buf, 2u);
    }

    id v7 = v5;
  }

  return v7;
}

- (BMStream)stream
{
  return self->_stream;
}

- (BMSyncService)syncService
{
  return self->_syncService;
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (NSSet)leisureMediaBundleIdSet
{
  return self->_leisureMediaBundleIdSet;
}

- (NSSet)thirdPartyMediaBundleIdSet
{
  return self->_thirdPartyMediaBundleIdSet;
}

- (NSSet)firstPartyBundleIdSet
{
  return self->_firstPartyBundleIdSet;
}

- (NSSet)mediaBundleDeniedIdSet
{
  return self->_mediaBundleDeniedIdSet;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (NSURL)plistFileURL
{
  return self->_plistFileURL;
}

- (NSURL)plistAppInfoFileURL
{
  return self->_plistAppInfoFileURL;
}

- (NSMutableDictionary)bundleIdCategoryMappings
{
  return self->_bundleIdCategoryMappings;
}

- (NSMutableDictionary)bundleIdAppInfoMappings
{
  return self->_bundleIdAppInfoMappings;
}

- (float)kMediaInfoRefreshInterval
{
  return self->_kMediaInfoRefreshInterval;
}

- (void)setKMediaInfoRefreshInterval:(float)a3
{
  self->_kMediaInfoRefreshInterval = a3;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundleIdAppInfoMappings, 0);
  objc_storeStrong((id *)&self->_bundleIdCategoryMappings, 0);
  objc_storeStrong((id *)&self->_plistAppInfoFileURL, 0);
  objc_storeStrong((id *)&self->_plistFileURL, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_mediaBundleDeniedIdSet, 0);
  objc_storeStrong((id *)&self->_firstPartyBundleIdSet, 0);
  objc_storeStrong((id *)&self->_thirdPartyMediaBundleIdSet, 0);
  objc_storeStrong((id *)&self->_leisureMediaBundleIdSet, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_syncService, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

void __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "completionHandler not called due to biome query error: %@", v2, v3, v4, v5, v6);
}

void __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "number of devices for nowplaying events, %lu", buf, 0xCu);
}

void __57__MONowPlayingMediaManager__fetchAppCateogryByBundleIds___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fail to fetch category info with error:%@", v2, v3, v4, v5, v6);
}

- (void)_getMediaAppCategoryPlistFileURL
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Failed to get cache directory to store media app category plist file, nil cache directory.", v2, v3, v4, v5, v6);
}

- (void)_getMediaAppInfoPlistFileURL
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Failed to get cache directory to store media app info plist file, nil cache directory.", v2, v3, v4, v5, v6);
}

- (void)_removeOldMediaAppCategoryPlistFile:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Could not remove old media app category plist file, error: %@", v2, v3, v4, v5, v6);
}

- (void)_removeOldMediaAppCategoryPlistFile:(os_log_t)log .cold.2(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"mediaAppCategory.plist";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "File %@ found.", (uint8_t *)&v1, 0xCu);
}

- (void)_readMediaAppInfoPlistFile:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Could not read the media app info plist file, error: %@", v2, v3, v4, v5, v6);
}

- (void)_readMediaAppInfoPlistFile:(os_log_t)log .cold.2(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"mediaAppInfo.plist";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "File %@ found.", (uint8_t *)&v1, 0xCu);
}

- (void)_persistMediaAppInfoPlistFile:withData:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid path for media app info plist file.", v2, v3, v4, v5, v6);
}

- (void)_persistMediaAppInfoPlistFile:withData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Media app info serialization to NSData failed or returned nil, %@", v2, v3, v4, v5, v6);
}

- (void)_persistMediaAppInfoPlistFile:withData:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't write to the media app info id plist file, %@", v2, v3, v4, v5, v6);
}

- (void)_createEventFromMediaPlayGroupsByDayTitle:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 854;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "mediaPlay has no mediaPlaySessions. (in %s:%d)", v1, 0x12u);
}

void __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving repeated or played media events into database failed with error, %@", v2, v3, v4, v5, v6);
}

void __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving mediaPlaySession events into database failed with error, %@", v2, v3, v4, v5, v6);
}

- (void)_createEventFromMediaPlaySessions:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 982;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "mediaPlaySessions has no sessions. (in %s:%d)", v1, 0x12u);
}

void __63__MONowPlayingMediaManager__rehydratedMediaPlayEvents_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "no event to rehydrate, returning nil", v2, v3, v4, v5, v6);
}

- (void)_rehydratedMediaSessionsForEvents:usingNowPlayingEvents:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "no result from mediaPlay fetching, no events rehydrated.", v2, v3, v4, v5, v6);
}

- (void)_rehydratedMediaEvents:usingNowPlayingEvents:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "no result from repeatedMedia fetching, no events rehydrated.", v2, v3, v4, v5, v6);
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.1(void *a1)
{
  uint64_t v1 = [a1 mediaPlaySessions];
  [v1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "has media play sessions, %lu", v4, v5, v6, v7, v8);
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.2(void *a1)
{
  uint64_t v1 = [a1 mediaRepetitions];
  [v1 unsignedLongValue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "has repetition, %lu", v4, v5, v6, v7, v8);
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.3(void *a1)
{
  uint64_t v1 = [a1 mediaSumTimePlayed];
  [v1 doubleValue];
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "has sumTimePlayed, %f", v4, v5, v6, v7, 0);
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.4(void *a1)
{
  uint64_t v1 = [a1 mediaType];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "has mediaType, %@", v4, v5, v6, v7, v8);
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.5(void *a1)
{
  uint64_t v1 = [a1 mediaPlayerBundleId];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "has media player bundleID, %@", v4, v5, v6, v7, v8);
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.6(void *a1)
{
  uint64_t v1 = [a1 mediaAlbum];
  uint64_t v2 = +[MOMediaPlaySession redactString:v1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v3, v4, "has album name, %@", v5, v6, v7, v8, v9);
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.7(void *a1)
{
  uint64_t v1 = [a1 mediaTitle];
  uint64_t v2 = +[MOMediaPlaySession redactString:v1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v3, v4, "has title, %@", v5, v6, v7, v8, v9);
}

- (void)_updateMediaPlaySessionEventsDeletedAtSource:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "nil query result from media fetching, no events removed.", v2, v3, v4, v5, v6);
}

void __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke_280_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v1, v2, "Update %ld MediaPlayingSessions event(s) in database failed, error %@", v3, v4, v5, v6, v7);
}

- (void)_updateMediaPlayEventsDeletedAtSource:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "nil query result from media fetching, no events updated.", v2, v3, v4, v5, v6);
}

void __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke_281_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v1, v2, "Update %ld nowplaying event(s) in database failed, error %@", v3, v4, v5, v6, v7);
}

@end