@interface MOSharedWithYouManager
- (BOOL)_sharedWithYouEnabled;
- (BOOL)highlightsCacheNotificationPending;
- (MOConfigurationManager)configurationManager;
- (MOEventStore)momentStore;
- (MOSharedWithYouManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)swySemaphore;
- (SWHighlightCenter)swHighlightCenter;
- (id)createEventFromHighlight:(id)a3;
- (id)redactURL:(id)a3;
- (id)rehydratedSharedContentEvents:(id)a3;
- (void)_updateSharedContentsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)fetchAndSaveSharedContentBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchSharedContentBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)highlightCenterHighlightsDidChange:(id)a3;
- (void)saveHighlights:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setHighlightsCacheNotificationPending:(BOOL)a3;
- (void)setMomentStore:(id)a3;
- (void)setSwHighlightCenter:(id)a3;
- (void)setSwySemaphore:(id)a3;
- (void)updateSharedContentsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)waitForQueueEmpty;
@end

@implementation MOSharedWithYouManager

- (MOSharedWithYouManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  if (!v8)
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MOSharedWithYouManager initWithUniverse:](v24);
    }

    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MOSharedWithYouManager.m" lineNumber:71 description:@"Invalid parameter not satisfying: [universe getService:NSStringFromClass([MOEventStore class])]"];
    goto LABEL_13;
  }
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v5 getService:v10];

  if (!v11)
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MOSummarizationParameters initWithConfigurationManager:](v25);
    }

    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"MOSharedWithYouManager.m" lineNumber:73 description:@"Invalid parameter not satisfying: configurationManager"];

LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  v28.receiver = self;
  v28.super_class = (Class)MOSharedWithYouManager;
  v12 = [(MOSharedWithYouManager *)&v28 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("MOSharedWithYouManager", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    uint64_t v18 = [v5 getService:v17];
    momentStore = v12->_momentStore;
    v12->_momentStore = (MOEventStore *)v18;

    objc_storeStrong((id *)&v12->_configurationManager, v11);
    if ([(MOSharedWithYouManager *)v12 _sharedWithYouEnabled])
    {
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      swySemaphore = v12->_swySemaphore;
      v12->_swySemaphore = (OS_dispatch_semaphore *)v20;

      v12->_highlightsCacheNotificationPending = 1;
      swHighlightCenter = v12->_swHighlightCenter;
      v12->_swHighlightCenter = 0;
    }
  }
  self = v12;
  v23 = self;
LABEL_14:

  return v23;
}

- (BOOL)_sharedWithYouEnabled
{
  BOOL v2 = 0;
  if ([(MOConfigurationManagerBase *)self->_configurationManager getBoolSettingForKey:@"EventManagerOverrideSwitchSharedWithYou" withFallback:0])
  {
    v3 = (void *)CFPreferencesCopyAppValue(@"SharedWithYouEnabled", @"com.apple.SocialLayer");
    v4 = v3;
    if (v3 && ([v3 BOOLValue] & 1) != 0)
    {
      id v5 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
      BOOL v2 = 1;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#swy,sharedWithYou enabled!", v7, 2u);
      }
    }
    else
    {
      id v5 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#swy,sharedWithYou not enabled!", buf, 2u);
      }
      BOOL v2 = 0;
    }
  }
  return v2;
}

- (SWHighlightCenter)swHighlightCenter
{
  if (SharedWithYouLibraryCore() && !self->_swHighlightCenter)
  {
    v3 = (SWHighlightCenter *)[objc_alloc((Class)getSWHighlightCenterClass()) init];
    swHighlightCenter = self->_swHighlightCenter;
    self->_swHighlightCenter = v3;

    [(SWHighlightCenter *)self->_swHighlightCenter setDelegate:self];
  }
  id v5 = self->_swHighlightCenter;

  return v5;
}

- (void)fetchSharedContentBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  if ([(MOSharedWithYouManager *)self _sharedWithYouEnabled]
    && ([(MOSharedWithYouManager *)self swHighlightCenter],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#swy,fetchSharedContentBetweenStartDate", buf, 2u);
    }
    v44 = v10;

    if (self->_highlightsCacheNotificationPending)
    {
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/SharedWithYou/MOSharedWithYouManager.m", 139, "-[MOSharedWithYouManager fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:]");
      swySemaphore = self->_swySemaphore;
      id v54 = 0;
      BOOL v15 = MOSemaphoreWaitAndFaultIfTimeout_Internal(swySemaphore, &v54, v13, 5.0);
      id v43 = v54;
      if (!v15)
      {
        v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[MOSharedWithYouManager fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:]((uint64_t)v13, v16, v17, v18, v19, v20, v21, v22);
        }
      }
    }
    else
    {
      id v43 = 0;
    }
    v23 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v24 = [(MOSharedWithYouManager *)self swHighlightCenter];
    v25 = [v24 highlights];

    id v49 = [v25 countByEnumeratingWithState:&v50 objects:v61 count:16];
    if (v49)
    {
      uint64_t v26 = *(void *)v51;
      v45 = v23;
      id v46 = v8;
      uint64_t v48 = *(void *)v51;
      do
      {
        for (i = 0; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(v25);
          }
          objc_super v28 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v29 = [v28 slHighlight];
          v30 = [v29 timestamp];
          unsigned int v31 = [v30 betweenDate:v8 andDate:v9];

          if (v31)
          {
            v32 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v47 = [v28 URL];
              v33 = [v47 absoluteString];
              v34 = [v28 slHighlight];
              v35 = [v34 identifier];
              v36 = [v28 slHighlight];
              [v36 timestamp];
              v37 = v25;
              v39 = id v38 = v9;
              *(_DWORD *)buf = 138412802;
              id v56 = v33;
              __int16 v57 = 2112;
              v58 = v35;
              __int16 v59 = 2112;
              v60 = v39;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#swy,found highlight within timeperiod,url,%@,identifier,%@,timestamp,%@", buf, 0x20u);

              id v9 = v38;
              v25 = v37;

              id v8 = v46;
              v23 = v45;
            }
            id v40 = [v28 copy];
            [v23 addObject:v40];

            uint64_t v26 = v48;
          }
        }
        id v49 = [v25 countByEnumeratingWithState:&v50 objects:v61 count:16];
      }
      while (v49);
    }

    v41 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      id v42 = [v23 count];
      *(_DWORD *)buf = 134217984;
      id v56 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "#swy,highlights returned from fetch,%lu", buf, 0xCu);
    }

    v10 = v44;
    v44[2](v44, v23, 0);
  }
  else
  {
    v10[2](v10, &__NSArray0__struct, 0);
  }
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#swy,highlightCenterHighlightsDidChange", v6, 2u);
  }

  swySemaphore = self->_swySemaphore;
  if (swySemaphore)
  {
    if (self->_highlightsCacheNotificationPending)
    {
      self->_highlightsCacheNotificationPending = 0;
      dispatch_semaphore_signal(swySemaphore);
    }
  }
}

- (id)createEventFromHighlight:(id)a3
{
  id v4 = a3;
  id v5 = [MOEvent alloc];
  v6 = +[NSUUID UUID];
  v7 = [v4 timestamp];
  id v8 = [v4 timestamp];
  id v9 = +[NSDate date];
  v10 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v8 creationDate:v9 provider:11 category:9];

  v11 = [v4 timestamp];
  v12 = [(MOSharedWithYouManager *)self configurationManager];
  LODWORD(v13) = 1242802176;
  [v12 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v13];
  BOOL v15 = [v11 dateByAddingTimeInterval:v14];
  [(MOEvent *)v10 setExpirationDate:v15];

  v16 = [v4 slHighlight];

  uint64_t v17 = [v16 identifier];
  [(MOEvent *)v10 setIdentifierFromProvider:v17];

  uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [(MOEvent *)v10 identifierFromProvider];
    uint64_t v20 = [(MOEvent *)v10 startDate];
    uint64_t v21 = [(MOEvent *)v10 endDate];
    int v23 = 138412802;
    v24 = v19;
    __int16 v25 = 2112;
    uint64_t v26 = v20;
    __int16 v27 = 2112;
    objc_super v28 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#swy,identifierFromProvider, %@, startDate, %@, endDate,%@,", (uint8_t *)&v23, 0x20u);
  }

  return v10;
}

- (void)saveHighlights:(id)a3 handler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = +[NSDate distantFuture];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        float v14 = [v13 timestamp];
        unsigned int v15 = [v8 isAfterDate:v14];

        if (v15)
        {
          uint64_t v16 = [v13 timestamp];

          id v8 = (void *)v16;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v10);
  }

  uint64_t v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = __Block_byref_object_copy__17;
  v38[3] = __Block_byref_object_dispose__17;
  id v39 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__17;
  v35[4] = __Block_byref_object_dispose__17;
  id v36 = 0;
  uint64_t v17 = [(MOSharedWithYouManager *)self momentStore];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke;
  v34[3] = &unk_1002CAC98;
  v34[4] = &v37;
  v34[5] = v35;
  [v17 fetchEventsWithStartDateAfter:v8 Category:9 CompletionHandler:v34];

  if (*(void *)(v38[0] + 40))
  {
    uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MOSharedWithYouManager saveHighlights:handler:]((uint64_t)v38, v18, v19, v20, v21, v22, v23, v24);
    }

    __int16 v25 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#swy,no shared content will be saved this round", buf, 2u);
    }

    if (v7) {
      v7[2](v7, *(void *)(v38[0] + 40), &__NSDictionary0__struct);
    }
  }
  else
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_135;
    v33[3] = &unk_1002CD358;
    v33[4] = self;
    v33[5] = v35;
    uint64_t v26 = [v9 _pas_mappedArrayWithTransform:v33];
    __int16 v27 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[MOSharedWithYouManager saveHighlights:handler:](buf, (uint64_t)[v26 count], v27);
    }

    momentStore = self->_momentStore;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_137;
    v30[3] = &unk_1002CACE8;
    id v29 = v26;
    id v31 = v29;
    v32 = v7;
    [(MOEventStore *)momentStore storeEvents:v29 CompletionHandler:v30];
  }
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
}

void __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  id v7 = a2;
  id v8 = objc_alloc((Class)NSSet);
  [v7 _pas_mappedArrayWithTransform:&__block_literal_global_17];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [v8 initWithArray:v12];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

id __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_2(id a1, MOEvent *a2)
{
  return [(MOEvent *)a2 identifierFromProvider];
}

id __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_135(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [v3 slHighlight];
  id v6 = [v5 identifier];
  LOBYTE(v4) = [v4 containsObject:v6];

  if (v4)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) createEventFromHighlight:v3];
  }

  return v7;
}

void __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_137_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v15 = [*(id *)(a1 + 32) count];
    int v17 = 134217984;
    id v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#swy,saved shared contents, count, %lu", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
}

- (void)fetchAndSaveSharedContentBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MOSharedWithYouManager *)self _sharedWithYouEnabled])
  {
    uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, " #swy,fetchAndSaveSharedContentBetweenStartDate,%@,endDate,%@", buf, 0x16u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __84__MOSharedWithYouManager_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler___block_invoke;
    v14[3] = &unk_1002CAD10;
    v14[4] = self;
    id v15 = v10;
    [(MOSharedWithYouManager *)self fetchSharedContentBetweenStartDate:v8 EndDate:v9 CompletionHandler:v14];
    uint64_t v12 = v15;
  }
  else
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    CFStringRef v21 = @"SWY not enabled";
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v12 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v13];

    (*((void (**)(id, void *, void))v10 + 2))(v10, v12, 0);
  }
}

void __84__MOSharedWithYouManager_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v6, 0);
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __84__MOSharedWithYouManager_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler___block_invoke_2;
    v9[3] = &unk_1002C9A50;
    id v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v8 saveHighlights:v5 handler:v9];
  }
}

uint64_t __84__MOSharedWithYouManager_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)rehydratedSharedContentEvents:(id)a3
{
  id v4 = a3;
  if ([(MOSharedWithYouManager *)self _sharedWithYouEnabled])
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#swy,rehydratedSharedContentEvents", buf, 2u);
    }

    id v6 = [v4 getDurationOfMOEventArray];
    *(void *)buf = 0;
    __int16 v18 = buf;
    uint64_t v19 = 0x3032000000;
    NSErrorUserInfoKey v20 = __Block_byref_object_copy__17;
    CFStringRef v21 = __Block_byref_object_dispose__17;
    id v22 = (id)objc_opt_new();
    uint64_t v7 = [v6 startDate];
    id v8 = [v7 dateByAddingTimeInterval:-1.0];
    id v9 = [v6 endDate];
    id v10 = [v9 dateByAddingTimeInterval:1.0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __56__MOSharedWithYouManager_rehydratedSharedContentEvents___block_invoke;
    v16[3] = &unk_1002CB180;
    v16[4] = buf;
    [(MOSharedWithYouManager *)self fetchSharedContentBetweenStartDate:v8 EndDate:v10 CompletionHandler:v16];

    [(MOSharedWithYouManager *)self waitForQueueEmpty];
    if (*((void *)v18 + 5))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __56__MOSharedWithYouManager_rehydratedSharedContentEvents___block_invoke_145;
      v14[3] = &unk_1002CD380;
      v14[4] = self;
      void v14[5] = buf;
      uint64_t v11 = [v4 _pas_mappedArrayWithTransform:v14];
    }
    else
    {
      uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#swy,nil query result from shared content fetching, no events rehydrated.", v15, 2u);
      }

      uint64_t v11 = &__NSArray0__struct;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = &__NSArray0__struct;
  }

  return v11;
}

void __56__MOSharedWithYouManager_rehydratedSharedContentEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        id v10 = [v8 slHighlight];
        uint64_t v11 = [v10 identifier];
        [v9 setObject:v8 forKeyedSubscript:v11];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

id __56__MOSharedWithYouManager_rehydratedSharedContentEvents___block_invoke_145(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [v3 identifierFromProvider];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v73 = &__NSArray0__struct;
    goto LABEL_65;
  }
  uint64_t v7 = [*(id *)(a1 + 32) swHighlightCenter];

  if (v7)
  {
    v95 = v3;
    id v8 = [*(id *)(a1 + 32) swHighlightCenter];
    id v9 = [v8 fetchAttributionsForHighlight:v6];

    id v10 = [v9 attributions];
    if (!v10)
    {
      id v73 = &__NSArray0__struct;
      id v3 = v95;
LABEL_63:

      goto LABEL_64;
    }
    uint64_t v96 = a1;
    v94 = v10;
    id v11 = [v95 copy];
    long long v12 = [v9 slHighlight];
    long long v13 = [v12 identifier];
    [v11 setIdentifierFromProvider:v13];

    long long v14 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v103 = v11;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = [v11 eventIdentifier];
      uint64_t v16 = [v11 identifierFromProvider];
      *(_DWORD *)buf = 138412546;
      *(void *)v120 = v15;
      *(_WORD *)&v120[8] = 2112;
      *(void *)&v120[10] = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#swy,rehydrated event,%@,has identifierFromProvider, %@", buf, 0x16u);

      id v11 = v103;
    }

    id v17 = [v9 URL];

    v98 = v9;
    if (v17)
    {
      __int16 v18 = [v9 URL];
      [v11 setItemURL:v18];

      uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        NSErrorUserInfoKey v20 = [v9 slHighlight];
        CFStringRef v21 = [v20 identifier];
        id v22 = *(void **)(a1 + 32);
        uint64_t v23 = [v103 itemURL];
        uint64_t v24 = [v23 absoluteString];
        __int16 v25 = [v22 redactURL:v24];
        *(_DWORD *)buf = 138412546;
        *(void *)v120 = v21;
        *(_WORD *)&v120[8] = 2112;
        *(void *)&v120[10] = v25;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#swy,identifier,%@,has itemURL, %@", buf, 0x16u);

        id v11 = v103;
        id v9 = v98;
      }
    }
    v99 = objc_opt_new();
    v107 = objc_opt_new();
    uint64_t v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v94 count]);
    [v11 setItemAttributionsCount:v26];

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id obj = v94;
    id v102 = [obj countByEnumeratingWithState:&v114 objects:v122 count:16];
    if (v102)
    {
      LOBYTE(v27) = 0;
      int v106 = 0;
      uint64_t v100 = *(void *)v115;
      v101 = 0;
      do
      {
        uint64_t v28 = 0;
        do
        {
          char v105 = v27;
          if (*(void *)v115 != v100) {
            objc_enumerationMutation(obj);
          }
          id v29 = *(void **)(*((void *)&v114 + 1) + 8 * v28);
          v30 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
          uint64_t v104 = v28;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            [v9 slHighlight];
            id v31 = v9;
            v33 = v32 = v29;
            v34 = [v33 identifier];
            v35 = *(void **)(v96 + 32);
            id v36 = [v31 URL];
            uint64_t v37 = [v36 absoluteString];
            id v38 = [v35 redactURL:v37];
            id v39 = [v32 uniqueIdentifier];
            *(_DWORD *)buf = 138413058;
            *(void *)v120 = v34;
            *(_WORD *)&v120[8] = 2112;
            *(void *)&v120[10] = v38;
            *(_WORD *)&v120[18] = 1024;
            LODWORD(v121) = ++v106;
            WORD2(v121) = 2112;
            *(void *)((char *)&v121 + 6) = v39;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#swy, rehydrate,identifier,%@,matchedHighlight.resourceURL,%@,attribution[%d],uniqueIdentifier,%@", buf, 0x26u);

            id v29 = v32;
            id v9 = v31;
            id v11 = v103;
          }
          long long v40 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            long long v41 = [v9 slHighlight];
            long long v42 = [v41 identifier];
            unsigned int v43 = [v29 isPinned];
            unsigned int v44 = [v29 isGroupConversation];
            v45 = [v29 groupDisplayName];
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v120 = v106;
            *(_WORD *)&v120[4] = 2112;
            *(void *)&v120[6] = v42;
            *(_WORD *)&v120[14] = 1024;
            *(_DWORD *)&v120[16] = v43;
            LOWORD(v121) = 1024;
            *(_DWORD *)((char *)&v121 + 2) = v44;
            WORD3(v121) = 2112;
            *((void *)&v121 + 1) = v45;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "#swy, rehydrate,attribution[[%d],identifier,%@,pinned,%d,isGroupConversation,%d,groupDisplayName,%@", buf, 0x28u);
          }
          id v46 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v47 = [v9 slHighlight];
            uint64_t v48 = [v47 identifier];
            unsigned int v49 = [v29 isFromMe];
            long long v50 = [v29 timestamp];
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v120 = v106;
            *(_WORD *)&v120[4] = 2112;
            *(void *)&v120[6] = v48;
            *(_WORD *)&v120[14] = 1024;
            *(_DWORD *)&v120[16] = v49;
            LOWORD(v121) = 2112;
            *(void *)((char *)&v121 + 2) = v50;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "#swy, rehydrate,attribution[[%d],identifier,%@,fromMe,%d,timestamp,%@", buf, 0x22u);
          }
          long long v51 = [v29 sender];

          if (v51)
          {
            long long v52 = [v29 sender];
            long long v53 = [v52 contact];
            id v54 = [v53 identifier];
            [v99 addObject:v54];
          }
          v55 = [v29 relatedPersons];

          if (v55)
          {
            long long v112 = 0u;
            long long v113 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            v109 = v29;
            id v108 = [v29 relatedPersons];
            id v56 = [v108 countByEnumeratingWithState:&v110 objects:v118 count:16];
            if (v56)
            {
              id v57 = v56;
              uint64_t v58 = *(void *)v111;
              do
              {
                for (i = 0; i != v57; i = (char *)i + 1)
                {
                  if (*(void *)v111 != v58) {
                    objc_enumerationMutation(v108);
                  }
                  v60 = *(void **)(*((void *)&v110 + 1) + 8 * i);
                  v61 = [v60 contact];
                  v62 = [v61 identifier];
                  v63 = [v109 sender];
                  v64 = [v63 contact];
                  v65 = [v64 identifier];
                  unsigned __int8 v66 = [v62 isEqualToString:v65];

                  if ((v66 & 1) == 0)
                  {
                    v67 = [v60 contact];
                    v68 = [v67 identifier];
                    [v107 addObject:v68];
                  }
                }
                id v57 = [v108 countByEnumeratingWithState:&v110 objects:v118 count:16];
              }
              while (v57);
            }

            id v9 = v98;
            id v11 = v103;
            id v29 = v109;
          }
          if (v105) {
            unsigned int v27 = 1;
          }
          else {
            unsigned int v27 = [v29 isFromMe];
          }
          if ([v29 isFromMe])
          {
            v69 = [v29 sender];
            v70 = [v69 contact];
            uint64_t v71 = [v70 identifier];

            v101 = (void *)v71;
          }
          if ([v11 itemIsPinned]) {
            uint64_t v72 = 1;
          }
          else {
            uint64_t v72 = (uint64_t)[v29 isPinned];
          }
          [v11 setItemIsPinned:v72];
          uint64_t v28 = v104 + 1;
        }
        while ((id)(v104 + 1) != v102);
        id v102 = [obj countByEnumeratingWithState:&v114 objects:v122 count:16];
      }
      while (v102);
    }
    else
    {
      v101 = 0;
      unsigned int v27 = 0;
    }

    v74 = +[NSSet setWithArray:v99];
    [v99 removeAllObjects];
    v75 = [v74 allObjects];
    [v99 addObjectsFromArray:v75];

    v76 = v107;
    v77 = +[NSSet setWithArray:v107];
    [v107 removeAllObjects];
    v78 = [v77 allObjects];
    [v107 addObjectsFromArray:v78];

    [v11 setItemSenders:v99];
    [v11 setItemRecipients:v107];
    if (v101)
    {
      unsigned int v79 = [v107 containsObject:];
      if (v27 & v79)
      {
        uint64_t v80 = 3;
LABEL_56:
        [v11 setItemShareDirection:v80];
        v81 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          v82 = [v9 slHighlight];
          v83 = [v82 identifier];
          v84 = [v103 itemSenders];
          *(_DWORD *)buf = 138412546;
          *(void *)v120 = v83;
          *(_WORD *)&v120[8] = 2112;
          *(void *)&v120[10] = v84;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "#swy,identifier,%@,has senders, %@", buf, 0x16u);

          id v9 = v98;
          v76 = v107;
        }

        v85 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          v86 = [v9 slHighlight];
          v87 = [v86 identifier];
          v88 = [v103 itemRecipients];
          *(_DWORD *)buf = 138412546;
          *(void *)v120 = v87;
          *(_WORD *)&v120[8] = 2112;
          *(void *)&v120[10] = v88;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "#swy,identifier,%@,has recipients, %@", buf, 0x16u);

          id v9 = v98;
          v76 = v107;
        }

        v89 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          v90 = [v9 slHighlight];
          v91 = [v90 identifier];
          id v92 = [v103 itemShareDirection];
          *(_DWORD *)buf = 138412546;
          *(void *)v120 = v91;
          *(_WORD *)&v120[8] = 2048;
          *(void *)&v120[10] = v92;
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "#swy,identifier,%@,itemShareDirection, %lu", buf, 0x16u);

          v76 = v107;
        }

        id v73 = v103;
        id v10 = v94;
        id v3 = v95;
        goto LABEL_63;
      }
    }
    else
    {
      unsigned int v79 = 0;
    }
    if (v27 ^ 1 | v79) {
      uint64_t v80 = 2;
    }
    else {
      uint64_t v80 = 1;
    }
    goto LABEL_56;
  }
  id v73 = &__NSArray0__struct;
  id v9 = v6;
LABEL_64:

LABEL_65:

  return v73;
}

- (id)redactURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    unint64_t v5 = (unint64_t)[v4 length];
    if (v5 >> 1 >= 5) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = v5 >> 1;
    }
    uint64_t v7 = [v4 substringToIndex:v6];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%lu", v7, [v4 hash]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (void)updateSharedContentsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MOSharedWithYouManager *)self _sharedWithYouEnabled])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __70__MOSharedWithYouManager_updateSharedContentsDeletedAtSource_handler___block_invoke;
    v8[3] = &unk_1002C9A50;
    id v9 = v7;
    [(MOSharedWithYouManager *)self _updateSharedContentsDeletedAtSource:v6 handler:v8];
    [(MOSharedWithYouManager *)self waitForQueueEmpty];
  }
  else
  {
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
  }
}

uint64_t __70__MOSharedWithYouManager_updateSharedContentsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateSharedContentsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v41 = a3;
  id v38 = a4;
  unint64_t v5 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#swy,_updateSharedContentsDeletedAtSource", buf, 2u);
  }

  long long v40 = [v41 getDurationOfMOEventArray];
  *(void *)buf = 0;
  v62 = buf;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__17;
  v65 = __Block_byref_object_dispose__17;
  id v66 = 0;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__17;
  __int16 v59 = __Block_byref_object_dispose__17;
  id v60 = 0;
  id v6 = [v40 startDate];
  id v7 = [v40 endDate];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke;
  v54[3] = &unk_1002CAC98;
  v54[4] = buf;
  v54[5] = &v55;
  [(MOSharedWithYouManager *)self fetchSharedContentBetweenStartDate:v6 EndDate:v7 CompletionHandler:v54];

  [(MOSharedWithYouManager *)self waitForQueueEmpty];
  if (*((void *)v62 + 5))
  {
    id v43 = objc_alloc_init((Class)NSMutableArray);
    id v42 = objc_alloc_init((Class)NSMutableArray);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v8 = v41;
    id v9 = [v8 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v50;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v13 = (void *)*((void *)v62 + 5);
          long long v14 = [v12 identifierFromProvider:v38];
          long long v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            if ([v12 rehydrationFailCount])
            {
              uint64_t v16 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v12 category] provider:[v12 provider] failureCount:[v12 rehydrationFailCount]];
              id v48 = 0;
              [(MORehydrationThresholdMetrics *)v16 submitMetricsWithError:&v48];
              id v17 = v48;
              [v12 setRehydrationFailCount:0];
              [v43 addObject:v12];
            }
          }
          else
          {
            [v12 setRehydrationFailCount:[v12 rehydrationFailCount] + 1];
            [v42 addObject:v12];
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v49 objects:v69 count:16];
      }
      while (v9);
    }

    __int16 v18 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v42 count];
      *(_DWORD *)v67 = 134217984;
      id v68 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#swy,%ld shared content item(s) failed rehydration, therefore update rehydration failure count.", v67, 0xCu);
    }

    NSErrorUserInfoKey v20 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v43 count];
      *(_DWORD *)v67 = 134217984;
      id v68 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#swy,%ld previously rehydration failed shared content item(s) now are found, therefore change rehydration failure count.", v67, 0xCu);
    }

    id v22 = [MORehydrationMetrics alloc];
    uint64_t v23 = [v8 firstObject];
    id v24 = [v23 category];
    __int16 v25 = [v8 firstObject];
    uint64_t v26 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v22, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v24, [v25 provider], 1, 0, [v8 count], 1, (double)(int)[v42 count], (double)(int)[v43 count]);

    id v47 = 0;
    [(MORehydrationMetrics *)v26 submitMetricsWithError:&v47];
    id v27 = v47;
    id v28 = [v42 copy];
    [v43 addObjectsFromArray:v28];

    id v29 = [(MOSharedWithYouManager *)self momentStore];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke_152;
    v44[3] = &unk_1002CACE8;
    v30 = (MORehydrationMetrics *)v43;
    v45 = v30;
    id v46 = v38;
    [v29 storeEvents:v30 CompletionHandler:v44];
  }
  else
  {
    id v31 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v67 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#swy,nil query result from shared content fetching, no events updated.", v67, 2u);
    }

    if (v38) {
      (*((void (**)(id, uint64_t, void *))v38 + 2))(v38, v56[5], &__NSDictionary0__struct);
    }
    v32 = [MORehydrationMetrics alloc];
    v33 = [v41 firstObject];
    id v34 = [v33 category];
    v35 = [v41 firstObject];
    id v36 = [v35 provider];
    uint64_t v37 = [(id)v56[5] description];
    v30 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v32, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v34, v36, 0, v37, [v41 count], 1, (double)(int)objc_msgSend(v41, "count"), 0.0);

    uint64_t v53 = 0;
    [(MORehydrationMetrics *)v30 submitMetricsWithError:&v53];
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(buf, 8);
}

void __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        long long v13 = [v11 slHighlight];
        long long v14 = [v13 identifier];
        [v12 setObject:v11 forKeyedSubscript:v14];
      }
      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v6;
}

void __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke_152_cold_1(a1, (uint64_t)v5, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#swy,update %ld shared content event(s) in database succeeded!", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)waitForQueueEmpty
{
}

- (OS_dispatch_semaphore)swySemaphore
{
  return self->_swySemaphore;
}

- (void)setSwySemaphore:(id)a3
{
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (void)setMomentStore:(id)a3
{
}

- (void)setSwHighlightCenter:(id)a3
{
}

- (BOOL)highlightsCacheNotificationPending
{
  return self->_highlightsCacheNotificationPending;
}

- (void)setHighlightsCacheNotificationPending:(BOOL)a3
{
  self->_highlightsCacheNotificationPending = a3;
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
  objc_storeStrong((id *)&self->_swHighlightCenter, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);

  objc_storeStrong((id *)&self->_swySemaphore, 0);
}

- (void)initWithUniverse:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [universe getService:NSStringFromClass([MOEventStore class])]", v1, 2u);
}

- (void)fetchSharedContentBetweenStartDate:(uint64_t)a3 EndDate:(uint64_t)a4 CompletionHandler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveHighlights:(os_log_t)log handler:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#swy,eventsToSave count,%ld", buf, 0xCu);
}

- (void)saveHighlights:(uint64_t)a3 handler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_137_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke_152_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 32) count];
  int v6 = 134218242;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "#swy,update %ld shared content event(s) in database failed, error %@", (uint8_t *)&v6, 0x16u);
}

@end