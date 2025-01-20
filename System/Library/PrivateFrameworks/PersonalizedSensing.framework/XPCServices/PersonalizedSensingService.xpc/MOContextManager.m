@interface MOContextManager
- (BOOL)requestBackgroundProcessAccessForDB;
- (MOBundleContentExtractor)extractor;
- (MOClientRequestStore)clientRequestStore;
- (MOContextConfigurationManager)configurationManager;
- (MOContextManager)initWithClientID:(id)a3;
- (MOContextPersistenceManager)persistenceManager;
- (MOContextStore)contextStore;
- (MOLabelBasedContextBuilder)labelBasedContextBuilder;
- (MOPromptManager)promptManager;
- (MOTemplateBasedContextBuilder)templateBasedContextBuilder;
- (MOTemplateStore)templatesStore;
- (NSString)clientBundleId;
- (OS_dispatch_queue)queue;
- (id)_createContextsWithStringDictArray:(id)a3 bundleContents:(id)a4;
- (unint64_t)_getActionTypeForBundleContent:(id)a3;
- (void)_addMetaDataToContext:(id)a3 bundleContent:(id)a4;
- (void)_addMusicMetaDataToContext:(id)a3 bundleContent:(id)a4;
- (void)_fetchStoredContextsWithOption:(id)a3 request:(id)a4 handler:(id)a5;
- (void)_generateContextWithOption:(id)a3 request:(id)a4 handler:(id)a5;
- (void)_retrievePersonalizedContextWithOption:(id)a3 handler:(id)a4;
- (void)_storeNewContexts:(id)a3 withRequest:(id)a4;
- (void)refreshMomentsContextWithReply:(id)a3;
- (void)retrievePersonalizedContextWithOption:(id)a3 handler:(id)a4;
- (void)setClientRequestStore:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setContextStore:(id)a3;
- (void)setExtractor:(id)a3;
- (void)setLabelBasedContextBuilder:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setTemplateBasedContextBuilder:(id)a3;
- (void)setTemplatesStore:(id)a3;
@end

@implementation MOContextManager

- (MOContextManager)initWithClientID:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MOContextManager;
  v6 = [(MOContextManager *)&v33 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("MOContextManager", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_clientBundleId, a3);
    v10 = [[MOContextPersistenceManager alloc] initWithClientID:v6->_clientBundleId];
    persistenceManager = v6->_persistenceManager;
    v6->_persistenceManager = v10;

    v12 = [[MOContextStore alloc] initWithPersistenceManager:v6->_persistenceManager];
    contextStore = v6->_contextStore;
    v6->_contextStore = v12;

    v14 = objc_alloc_init(MOContextConfigurationManager);
    configurationManager = v6->_configurationManager;
    v6->_configurationManager = v14;

    v16 = [[MOTemplateStore alloc] initWithPersistenceManager:v6->_persistenceManager configurationManager:v6->_configurationManager];
    templatesStore = v6->_templatesStore;
    v6->_templatesStore = v16;

    v18 = [[MOTemplateBasedContextBuilder alloc] initWithTemplateStore:v6->_templatesStore ConfigurationManager:v6->_configurationManager];
    templateBasedContextBuilder = v6->_templateBasedContextBuilder;
    v6->_templateBasedContextBuilder = v18;

    v20 = objc_alloc_init(MOLabelBasedContextBuilder);
    labelBasedContextBuilder = v6->_labelBasedContextBuilder;
    v6->_labelBasedContextBuilder = v20;

    v22 = v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __37__MOContextManager_initWithClientID___block_invoke;
    block[3] = &unk_1000A7360;
    id v32 = v5;
    dispatch_async(v22, block);
    v23 = [[MOClientRequestStore alloc] initWithPersistenceManager:v6->_persistenceManager];
    clientRequestStore = v6->_clientRequestStore;
    v6->_clientRequestStore = v23;

    v25 = (MOPromptManager *)objc_alloc_init((Class)MOPromptManager);
    promptManager = v6->_promptManager;
    v6->_promptManager = v25;

    if (!v6->_promptManager)
    {
      v27 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[MOContextManager initWithClientID:]();
      }
    }
    v28 = [[MOBundleContentExtractor alloc] initWithConfigurationManager:v6->_configurationManager promptManager:v6->_promptManager];
    extractor = v6->_extractor;
    v6->_extractor = v28;
  }
  return v6;
}

void __37__MOContextManager_initWithClientID___block_invoke(uint64_t a1)
{
  id v2 = +[MOApprovedApplicationsManager sharedInstance];
  [v2 registerClientsForDataAccess:*(void *)(a1 + 32)];
}

- (void)retrievePersonalizedContextWithOption:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__MOContextManager_retrievePersonalizedContextWithOption_handler___block_invoke;
  block[3] = &unk_1000A53C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __66__MOContextManager_retrievePersonalizedContextWithOption_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __66__MOContextManager_retrievePersonalizedContextWithOption_handler___block_invoke_2;
  v3[3] = &unk_1000A7538;
  id v4 = *(id *)(a1 + 48);
  [v1 _retrievePersonalizedContextWithOption:v2 handler:v3];
}

uint64_t __66__MOContextManager_retrievePersonalizedContextWithOption_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_retrievePersonalizedContextWithOption:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 contextRetrieval];
  id v9 = [MOClientRequest alloc];
  id v10 = +[NSUUID UUID];
  v11 = +[NSDate now];
  if (v8 == (id)2)
  {
    id v12 = [(MOClientRequest *)v9 initWithRequestIdentifier:v10 requestType:2 creationDate:v11];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __67__MOContextManager__retrievePersonalizedContextWithOption_handler___block_invoke;
    v21[3] = &unk_1000A7560;
    id v13 = &v23;
    v14 = (id *)&v22;
    v22 = v12;
    id v23 = v6;
    v15 = (MOClientRequest *)v6;
    v16 = v12;
    [(MOContextManager *)self _generateContextWithOption:v7 request:v16 handler:v21];
  }
  else
  {
    v17 = [(MOClientRequest *)v9 initWithRequestIdentifier:v10 requestType:1 creationDate:v11];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __67__MOContextManager__retrievePersonalizedContextWithOption_handler___block_invoke_2;
    v18[3] = &unk_1000A7588;
    id v13 = &v20;
    v14 = (id *)&v19;
    v19 = v17;
    id v20 = v6;
    v15 = v17;
    v16 = (MOClientRequest *)v6;
    [(MOContextManager *)self _fetchStoredContextsWithOption:v7 request:v15 handler:v18];
  }
}

uint64_t __67__MOContextManager__retrievePersonalizedContextWithOption_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32), a4);
}

uint64_t __67__MOContextManager__retrievePersonalizedContextWithOption_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32), 0);
}

- (void)_generateContextWithOption:(id)a3 request:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  extractor = self->_extractor;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __63__MOContextManager__generateContextWithOption_request_handler___block_invoke;
  v12[3] = &unk_1000A75D8;
  id v13 = v7;
  id v14 = v8;
  v12[4] = self;
  id v10 = v7;
  id v11 = v8;
  [(MOBundleContentExtractor *)extractor extractContentsFromBundlesWithHandler:v12];
}

void __63__MOContextManager__generateContextWithOption_request_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__MOContextManager__generateContextWithOption_request_handler___block_invoke_cold_2();
    }

    id v8 = (void (*)(void))*((void *)a1[6] + 2);
LABEL_5:
    v8();
    goto LABEL_16;
  }
  if (![v5 count])
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "no content is extracted", buf, 2u);
    }

    id v8 = (void (*)(void))*((void *)a1[6] + 2);
    goto LABEL_5;
  }
  id v9 = objc_opt_new();
  id v10 = [a1[4] persistenceManager];
  unsigned int v11 = [v10 available];

  if (v11)
  {
    id v12 = [a1[4] templateBasedContextBuilder];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __63__MOContextManager__generateContextWithOption_request_handler___block_invoke_109;
    v20[3] = &unk_1000A75B0;
    id v13 = v9;
    id v14 = a1[4];
    id v21 = v13;
    id v22 = v14;
    id v23 = v5;
    id v24 = a1[5];
    id v25 = a1[6];
    [v12 generateContextStringsFromBundleContents:v23 WithHandler:v20];

    v15 = v21;
  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __63__MOContextManager__generateContextWithOption_request_handler___block_invoke_cold_1();
    }

    v18 = (void (**)(id, void, void *, id))a1[6];
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    CFStringRef v28 = @"MOContextManager: The context db is not available.";
    v15 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v19 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:769 userInfo:v15];
    v18[2](v18, 0, v19, v5);
  }
LABEL_16:
}

void __63__MOContextManager__generateContextWithOption_request_handler___block_invoke_109(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  id v7 = [*(id *)(a1 + 40) _createContextsWithStringDictArray:*(void *)(a1 + 32) bundleContents:*(void *)(a1 + 48)];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    id v10 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "context count generated %ld", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 40) _storeNewContexts:v7 withRequest:*(void *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (id)_createContextsWithStringDictArray:(id)a3 bundleContents:(id)a4
{
  id v33 = a3;
  id v5 = a4;
  id v31 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  id v34 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v41;
    *(void *)&long long v6 = 138412290;
    long long v29 = v6;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v7);
        int v9 = [MOContext alloc];
        id v10 = +[NSUUID UUID];
        unsigned int v11 = +[NSDate now];
        id v12 = [(MOContext *)v9 initWithContextIdentifier:v10 contextCreationTimestamp:v11];

        id v13 = [v8 associatedBundleID];
        id v14 = [v13 UUIDString];
        [(MOContext *)v12 setAssociatedBundleID:v14];

        v15 = [v8 associatedSuggestionID];
        v16 = [v15 UUIDString];
        [(MOContext *)v12 setAssociatedSuggestionID:v16];

        [(MOContext *)v12 setActionType:[(MOContextManager *)self _getActionTypeForBundleContent:v8]];
        v17 = [v8 bundleContentIdentifier];
        [(MOContext *)v12 setBundleContentIdentifier:v17];

        v18 = objc_opt_new();
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v19 = v33;
        id v20 = [v19 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v37;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v37 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              id v25 = objc_msgSend(v8, "bundleContentIdentifier", v29);
              v26 = [v24 objectForKey:v25];

              if ([v26 count]) {
                [v18 addObjectsFromArray:v26];
              }
            }
            id v21 = [v19 countByEnumeratingWithState:&v36 objects:v46 count:16];
          }
          while (v21);
        }

        if ([v18 count])
        {
          [(MOContext *)v12 setContextStrings:v18];
          [(MOContextManager *)self _addMetaDataToContext:v12 bundleContent:v8];
          NSErrorUserInfoKey v27 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v29;
            v45 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "create context %@", buf, 0xCu);
          }

          [v31 addObject:v12];
        }

        id v7 = (char *)v7 + 1;
      }
      while (v7 != v34);
      id v34 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v34);
  }

  return v31;
}

- (void)_addMetaDataToContext:(id)a3 bundleContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 contextStrings];
  id v9 = [v8 count];

  if (v9)
  {
    id v33 = self;
    id v34 = v6;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [v6 contextStrings];
    id v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v10)
    {
      id v11 = v10;
      id v12 = 0;
      id v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v37;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (([v18 contentType] & 4) != 0 && !v15)
          {
            uint64_t v15 = [v7 placeName];
          }
          if (([v18 contentType] & 8) != 0 && !v14)
          {
            uint64_t v14 = [v7 cityName];
          }
          if (([v18 contentType] & 1) != 0 && !v13)
          {
            id v19 = [v7 personNames];
            id v13 = [v19 firstObject];
          }
          if (([v18 contentType] & 0x4000) != 0 && !v12)
          {
            id v20 = [v7 timeReference];
            id v12 = [v20 capitalizedString];
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v11);
    }
    else
    {
      id v12 = 0;
      id v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }

    if (v15 | v14
      && (id v21 = [[MOContextLocationMetaData alloc] initWithPlace:v15 city:v14]) != 0)
    {
      uint64_t v22 = v21;
      id v23 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      id v6 = v34;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[MOContextManager _addMetaDataToContext:bundleContent:]();
      }

      id v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v22, 0);
      [v34 setAssociatedLocations:v24];

      if (!v13) {
        goto LABEL_35;
      }
    }
    else
    {
      id v6 = v34;
      [v34 setAssociatedLocations:0];
      uint64_t v22 = 0;
      if (!v13) {
        goto LABEL_35;
      }
    }
    id v25 = [[MOContextContactMetaData alloc] initWithContactName:v13];
    if (v25)
    {
      v26 = v25;
      NSErrorUserInfoKey v27 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[MOContextManager _addMetaDataToContext:bundleContent:]();
      }

      CFStringRef v28 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, 0);
      [v6 setAssociatedContacts:v28];

      if (!v12) {
        goto LABEL_40;
      }
LABEL_36:
      long long v29 = [[MOContextTimeMetaData alloc] initWithTimeReferenceString:v12];
      if (v29)
      {
        v30 = v29;
        id v31 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          -[MOContextManager _addMetaDataToContext:bundleContent:]();
        }

        uint64_t v32 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v30, 0);
        [v6 setAssociatedTime:v32];

        goto LABEL_41;
      }
LABEL_40:
      [v6 setAssociatedTime:0];
LABEL_41:
      [(MOContextManager *)v33 _addMusicMetaDataToContext:v6 bundleContent:v7];

      goto LABEL_42;
    }
LABEL_35:
    [v6 setAssociatedContacts:0];
    v26 = 0;
    if (!v12) {
      goto LABEL_40;
    }
    goto LABEL_36;
  }
LABEL_42:
}

- (void)_addMusicMetaDataToContext:(id)a3 bundleContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 musicSuggestionSongTitle];
  if (v8)
  {

LABEL_4:
    uint64_t v10 = [(MOTemplateBasedContextBuilder *)self->_templateBasedContextBuilder songTitleAndArtistStringsForBundleContent:v7];
    goto LABEL_5;
  }
  id v9 = [v7 musicSuggestionArtistName];

  if (v9) {
    goto LABEL_4;
  }
  uint64_t v10 = [(MOTemplateBasedContextBuilder *)self->_templateBasedContextBuilder musicMoodStringsForBundleContent:v7];
LABEL_5:
  id v11 = (void *)v10;
  id v12 = objc_opt_new();
  if ([v11 count])
  {
    id v21 = v7;
    id v22 = v6;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v11;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [[MOContextMusicMetaData alloc] initWithMusicString:*(void *)(*((void *)&v23 + 1) + 8 * (void)v17)];
          if (v18)
          {
            id v19 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v28 = v18;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "add music metadata: %@", buf, 0xCu);
            }

            [v12 addObject:v18];
          }

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v15);
    }

    id v7 = v21;
    id v6 = v22;
    id v11 = v20;
  }
  [v6 setAssociatedMusic:v12];
}

- (unint64_t)_getActionTypeForBundleContent:(id)a3
{
  id v3 = a3;
  if ([v3 activityType])
  {
    unint64_t v4 = 7;
  }
  else
  {
    id v5 = (char *)[v3 bundleType];
    if ((unint64_t)(v5 - 1) >= 6) {
      unint64_t v4 = 0;
    }
    else {
      unint64_t v4 = (unint64_t)v5;
    }
  }

  return v4;
}

- (void)_fetchStoredContextsWithOption:(id)a3 request:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MOContextManager *)self persistenceManager];
  unsigned int v10 = [v9 available];

  if (v10)
  {
    id v11 = [(MOContextManager *)self clientRequestStore];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __67__MOContextManager__fetchStoredContextsWithOption_request_handler___block_invoke;
    v16[3] = &unk_1000A7600;
    v16[4] = self;
    id v17 = v8;
    [v11 fetchMostRecentClientRequestWithHandler:v16];

    id v12 = [(MOContextManager *)self clientRequestStore];
    [v12 storeClientRequest:v7 handler:&__block_literal_global_6];
  }
  else
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOContextManager _fetchStoredContextsWithOption:request:handler:]();
    }

    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"MOContextManager:_fetchStoredContextsWithOption, fail to fetch context as db is not available";
    id v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v15 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:769 userInfo:v14];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v15);
  }
}

void __67__MOContextManager__fetchStoredContextsWithOption_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 contextStore];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __67__MOContextManager__fetchStoredContextsWithOption_request_handler___block_invoke_2;
  v6[3] = &unk_1000A52B0;
  id v7 = *(id *)(a1 + 40);
  [v5 fetchContextsGeneratedFromClientRequest:v4 handler:v6];
}

void __67__MOContextManager__fetchStoredContextsWithOption_request_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "context count from cache %ld", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__MOContextManager__fetchStoredContextsWithOption_request_handler___block_invoke_123(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__MOContextManager__fetchStoredContextsWithOption_request_handler___block_invoke_123_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "store client request succeeded", v5, 2u);
  }
}

- (void)_storeNewContexts:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MOContextManager *)self persistenceManager];
  unsigned int v9 = [v8 available];

  if (v9)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v6;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v14);
          id v17 = [v7 requestIdentifier];
          NSErrorUserInfoKey v18 = [v17 UUIDString];
          [v15 setAssociatedRequestID:v18];

          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    CFStringRef v19 = [(MOContextManager *)self contextStore];
    [v19 removeExpiredContextWithHandler:&__block_literal_global_129];

    id v20 = [(MOContextManager *)self contextStore];
    [v20 storeContexts:v10 handler:&__block_literal_global_132];

    id v21 = [(MOContextManager *)self clientRequestStore];
    [v21 removeExpiredClientRequestsWithHandler:&__block_literal_global_135];

    id v22 = [(MOContextManager *)self clientRequestStore];
    [v22 storeClientRequest:v7 handler:&__block_literal_global_138];
    id v6 = v23;
  }
  else
  {
    id v22 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MOContextManager _storeNewContexts:withRequest:]();
    }
  }
}

void __50__MOContextManager__storeNewContexts_withRequest___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__MOContextManager__storeNewContexts_withRequest___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "remove expired context succeeded", v5, 2u);
  }
}

void __50__MOContextManager__storeNewContexts_withRequest___block_invoke_130(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__MOContextManager__storeNewContexts_withRequest___block_invoke_130_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "store context succeeded", v5, 2u);
  }
}

void __50__MOContextManager__storeNewContexts_withRequest___block_invoke_133(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__MOContextManager__storeNewContexts_withRequest___block_invoke_133_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "remove expired client requests succeeded", v5, 2u);
  }
}

void __50__MOContextManager__storeNewContexts_withRequest___block_invoke_136(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__MOContextManager__fetchStoredContextsWithOption_request_handler___block_invoke_123_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "store client request succeeded", v5, 2u);
  }
}

- (BOOL)requestBackgroundProcessAccessForDB
{
  id v3 = [(MOContextManager *)self persistenceManager];
  id v4 = [v3 acquireBackgroundProcessingPermissionsWithClientID:self->_clientBundleId];

  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4 == (id)1)
  {
    if (v6)
    {
      __int16 v16 = 0;
      id v7 = "Succeed to update background processing assertion";
      int v8 = (uint8_t *)&v16;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, v8, 2u);
    }
  }
  else if (v6)
  {
    __int16 v15 = 0;
    id v7 = "Fail to update background processing assertion";
    int v8 = (uint8_t *)&v15;
    goto LABEL_6;
  }
  BOOL v9 = v4 == (id)1;

  id v10 = [(MOContextManager *)self promptManager];
  [v10 acquireBackgroundProcessingPermissionsForMomentsWithHander:&__block_literal_global_141];

  id v11 = [(MOContextManager *)self persistenceManager];
  id v12 = [v11 available];

  uint64_t v13 = [[MOContextAnalyticsManager alloc] initWithAssertionErrorState:v4 dbAvailability:v12];
  [(MOContextAnalyticsManager *)v13 sendAssertionAnalyticsEvent];

  return v9;
}

void __55__MOContextManager_requestBackgroundProcessAccessForDB__block_invoke(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Succeed to update background processing assertion for bundle DB", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __55__MOContextManager_requestBackgroundProcessAccessForDB__block_invoke_cold_1();
  }
}

- (void)refreshMomentsContextWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(MOContextManager *)self promptManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __51__MOContextManager_refreshMomentsContextWithReply___block_invoke;
  v7[3] = &unk_1000A7728;
  id v8 = v4;
  id v6 = v4;
  [v5 softRefreshEventsWithRefreshVariant:512 andIgnoreLastTrigger:0 andHandler:v7];
}

void __51__MOContextManager_refreshMomentsContextWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__MOContextManager_refreshMomentsContextWithReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MOBundleContentExtractor)extractor
{
  return self->_extractor;
}

- (void)setExtractor:(id)a3
{
}

- (MOTemplateBasedContextBuilder)templateBasedContextBuilder
{
  return self->_templateBasedContextBuilder;
}

- (void)setTemplateBasedContextBuilder:(id)a3
{
}

- (MOContextStore)contextStore
{
  return self->_contextStore;
}

- (void)setContextStore:(id)a3
{
}

- (MOContextPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (MOTemplateStore)templatesStore
{
  return self->_templatesStore;
}

- (void)setTemplatesStore:(id)a3
{
}

- (MOLabelBasedContextBuilder)labelBasedContextBuilder
{
  return self->_labelBasedContextBuilder;
}

- (void)setLabelBasedContextBuilder:(id)a3
{
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (MOClientRequestStore)clientRequestStore
{
  return self->_clientRequestStore;
}

- (void)setClientRequestStore:(id)a3
{
}

- (MOContextConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (MOPromptManager)promptManager
{
  return self->_promptManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_clientRequestStore, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_labelBasedContextBuilder, 0);
  objc_storeStrong((id *)&self->_templatesStore, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_templateBasedContextBuilder, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithClientID:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "promptManager failed to be initiated", v1, 2u);
}

void __63__MOContextManager__generateContextWithOption_request_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v0, v1, "DB is not available", v2, v3, v4, v5, v6);
}

void __63__MOContextManager__generateContextWithOption_request_handler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "extract content hits error, %@", v2, v3, v4, v5, v6);
}

- (void)_addMetaDataToContext:bundleContent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "add time metadata: %@", v2, v3, v4, v5, v6);
}

- (void)_addMetaDataToContext:bundleContent:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "add contact metadata: %@", v2, v3, v4, v5, v6);
}

- (void)_addMetaDataToContext:bundleContent:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "add location metadata: %@", v2, v3, v4, v5, v6);
}

- (void)_fetchStoredContextsWithOption:request:handler:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v0, v1, "fail to fetch context as db is not available", v2, v3, v4, v5, v6);
}

void __67__MOContextManager__fetchStoredContextsWithOption_request_handler___block_invoke_123_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "store client request hit error, %@", v2, v3, v4, v5, v6);
}

- (void)_storeNewContexts:withRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v0, v1, "fail to store new context and request as db is not available", v2, v3, v4, v5, v6);
}

void __50__MOContextManager__storeNewContexts_withRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "remove expired context hit error, %@", v2, v3, v4, v5, v6);
}

void __50__MOContextManager__storeNewContexts_withRequest___block_invoke_130_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "store context hit error, %@", v2, v3, v4, v5, v6);
}

void __50__MOContextManager__storeNewContexts_withRequest___block_invoke_133_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "remove expired client requests hit error, %@", v2, v3, v4, v5, v6);
}

void __55__MOContextManager_requestBackgroundProcessAccessForDB__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v0, v1, "Failed to update background processing assertion for bundle DB", v2, v3, v4, v5, v6);
}

void __51__MOContextManager_refreshMomentsContextWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "calling soft refresh , error, %@", v2, v3, v4, v5, v6);
}

@end