@interface CRCarplayCapabilitiesStateMachine
- (BOOL)_vehicleSatisfiesConfiguration:(id)a3 propertyHits:(int64_t *)a4;
- (BOOL)isReady;
- (CRCarPlayCapabilities)carCapabilities;
- (CRCarplayCapabilitiesStateMachine)init;
- (NSMutableArray)delayedTasks;
- (NSString)plistVersion;
- (OS_dispatch_queue)workerQueue;
- (id)_configurationValueForSafeKey:(id)a3;
- (id)nextMetadataKey;
- (id)responseBlock;
- (void)_ignoreEvent:(int64_t)a3;
- (void)_transitionToState:(int64_t)a3 forEvent:(int64_t)a4;
- (void)assignCarCapabilities:(id)a3 valuesFromDictionary:(id)a4;
- (void)dealloc;
- (void)handleEvent:(int64_t)a3;
- (void)initializeStateMachine;
- (void)lookupCarcapabilitiesForSession:(id)a3 plistURL:(id)a4 completionHandler:(id)a5;
- (void)performDoneCaptureResult;
- (void)performEnterReadyState;
- (void)performLoadingPlistData:(int64_t)a3;
- (void)performLookup:(int64_t)a3;
- (void)performPostResponseAndReleaseData;
- (void)setCarCapabilities:(id)a3;
- (void)setDelayedTasks:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setPlistVersion:(id)a3;
- (void)setResponseBlock:(id)a3;
- (void)setSession:(id)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation CRCarplayCapabilitiesStateMachine

- (CRCarplayCapabilitiesStateMachine)init
{
  v11.receiver = self;
  v11.super_class = (Class)CRCarplayCapabilitiesStateMachine;
  v2 = [(CRCarplayCapabilitiesStateMachine *)&v11 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_plistVersion, CRCapabilitiesDefaultVersion);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.carkitd.carcapabilities.statemachine", v4);
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)v5;

    v3->_isReady = 1;
    uint64_t v7 = objc_opt_new();
    delayedTasks = v3->_delayedTasks;
    v3->_delayedTasks = (NSMutableArray *)v7;
  }
  v9 = CarGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000732D0();
  }

  return v3;
}

- (void)dealloc
{
  [(CUStateMachine *)self->_underlyingStateMachine invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRCarplayCapabilitiesStateMachine;
  [(CRCarplayCapabilitiesStateMachine *)&v3 dealloc];
}

- (void)lookupCarcapabilitiesForSession:(id)a3 plistURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = self;
  objc_sync_enter(v11);
  if ([(CRCarplayCapabilitiesStateMachine *)v11 isReady])
  {
    [(CRCarplayCapabilitiesStateMachine *)v11 setIsReady:0];
    objc_sync_exit(v11);

    v12 = CarGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[CRCarplayCapabilitiesStateMachine lookupCarcapabilitiesForSession:plistURL:completionHandler:]";
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Lookup request starting using %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v11->_plistURL, a4);
    [(CRCarplayCapabilitiesStateMachine *)v11 setResponseBlock:v10];
    v13 = [(CRCarplayCapabilitiesStateMachine *)v11 workerQueue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100034DC4;
    v25[3] = &unk_1000BD3A8;
    v25[4] = v11;
    id v26 = v8;
    dispatch_async(v13, v25);
  }
  else
  {
    objc_sync_exit(v11);

    v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100073344(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    v22 = objc_opt_new();
    [v22 setResponseBlock:v10];
    [v22 setPlistURL:v9];
    [v22 setSession:v8];
    v23 = v11;
    objc_sync_enter(v23);
    v24 = [(CRCarplayCapabilitiesStateMachine *)v23 delayedTasks];
    [v24 addObject:v22];

    objc_sync_exit(v23);
  }
}

- (void)setSession:(id)a3
{
  dispatch_queue_t v5 = (CARSession *)a3;
  if (self->_session != v5)
  {
    underlyingStateMachine = self->_underlyingStateMachine;
    id v7 = [objc_alloc((Class)CUStateEvent) initWithName:@"Reset" userInfo:0];
    [(CUStateMachine *)underlyingStateMachine dispatchEvent:v7];

    objc_storeStrong((id *)&self->_session, a3);
  }
  id v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000733BC(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v16 = self->_underlyingStateMachine;
  id v17 = [objc_alloc((Class)CUStateEvent) initWithName:@"Start" userInfo:0];
  [(CUStateMachine *)v16 dispatchEvent:v17];
}

- (void)initializeStateMachine
{
  underlyingStateMachine = self->_underlyingStateMachine;
  if (underlyingStateMachine)
  {
    [(CUStateMachine *)underlyingStateMachine invalidate];
    v4 = self->_underlyingStateMachine;
    self->_underlyingStateMachine = 0;
  }
  dispatch_queue_t v5 = (CUStateMachine *)objc_alloc_init((Class)CUStateMachine);
  v6 = self->_underlyingStateMachine;
  self->_underlyingStateMachine = v5;

  id v7 = [objc_alloc((Class)CUState) initWithName:@"Root" parent:0];
  [v7 setEventHandler:&stru_1000BE250];
  objc_initWeak(&location, self);
  id v8 = [objc_alloc((Class)CUState) initWithName:@"Ready" parent:v7];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000353E4;
  v22[3] = &unk_1000BE278;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  [v8 setEventHandler:v22];
  id v9 = [objc_alloc((Class)CUState) initWithName:@"Loading" parent:v7];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100035534;
  v20[3] = &unk_1000BE2A0;
  objc_copyWeak(&v21, &location);
  [v9 setEventHandler:v20];
  id v10 = [objc_alloc((Class)CUState) initWithName:@"Searching" parent:v7];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000356EC;
  v18[3] = &unk_1000BE278;
  objc_copyWeak(&v19, &location);
  v18[4] = self;
  [v10 setEventHandler:v18];
  id v11 = [objc_alloc((Class)CUState) initWithName:@"Done" parent:v7];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003586C;
  v16[3] = &unk_1000BE278;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  [v11 setEventHandler:v16];
  v26[0] = @"Ready";
  v26[1] = @"Loading";
  v27[0] = v8;
  v27[1] = v9;
  v26[2] = @"Searching";
  v26[3] = @"Done";
  v27[2] = v10;
  v27[3] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  stateForStateName = self->_stateForStateName;
  self->_stateForStateName = v12;

  uint64_t v14 = self->_underlyingStateMachine;
  v25[0] = v7;
  v25[1] = v8;
  v25[2] = v9;
  v25[3] = v10;
  v25[4] = v11;
  uint64_t v15 = +[NSArray arrayWithObjects:v25 count:5];
  [(CUStateMachine *)v14 setStates:v15];

  [(CUStateMachine *)self->_underlyingStateMachine setInitialState:v8];
  [(CUStateMachine *)self->_underlyingStateMachine start];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)handleEvent:(int64_t)a3
{
  dispatch_queue_t v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100073718();
  }

  underlyingStateMachine = self->_underlyingStateMachine;
  id v7 = objc_alloc((Class)CUStateEvent);
  if ((unint64_t)(a3 + 1) > 4) {
    CFStringRef v8 = @"Start";
  }
  else {
    CFStringRef v8 = off_1000BE358[a3 + 1];
  }
  id v9 = [v7 initWithName:v8 userInfo:0];
  [(CUStateMachine *)underlyingStateMachine dispatchEvent:v9];
}

- (void)_transitionToState:(int64_t)a3 forEvent:(int64_t)a4
{
  stateForStateName = self->_stateForStateName;
  if ((unint64_t)(a3 + 1) > 4) {
    CFStringRef v7 = @"Ready";
  }
  else {
    CFStringRef v7 = off_1000BE330[a3 + 1];
  }
  CFStringRef v8 = -[NSDictionary objectForKey:](stateForStateName, "objectForKey:", v7, a4);
  id v9 = CarGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000737A8();
  }

  [(CUStateMachine *)self->_underlyingStateMachine transitionToState:v8];
  self->_currentState = a3;
}

- (void)_ignoreEvent:(int64_t)a3
{
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10007381C();
  }
}

- (id)nextMetadataKey
{
  p_configurationKeys = &self->_configurationKeys;
  unint64_t metadaKeyIndex = self->_metadaKeyIndex;
  if (metadaKeyIndex >= (unint64_t)[(NSMutableArray *)self->_configurationKeys count])
  {
    v6 = 0;
  }
  else
  {
    configurationKeys = self->_configurationKeys;
    ++self->_metadaKeyIndex;
    v6 = -[NSMutableArray objectAtIndex:](configurationKeys, "objectAtIndex:");
    CFStringRef v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000738AC((id *)p_configurationKeys, (uint64_t)v6, v7);
    }
  }

  return v6;
}

- (void)performEnterReadyState
{
  objc_super v3 = (NSMutableDictionary *)objc_opt_new();
  configurationValues = self->_configurationValues;
  self->_configurationValues = v3;

  dispatch_queue_t v5 = (NSMutableArray *)objc_opt_new();
  configurationKeys = self->_configurationKeys;
  self->_configurationKeys = v5;

  CFStringRef v7 = (NSMutableDictionary *)objc_opt_new();
  searchHitsByProperty = self->_searchHitsByProperty;
  self->_searchHitsByProperty = v7;

  self->_unint64_t metadaKeyIndex = 0;
  plistData = self->_plistData;
  self->_plistData = 0;

  self->_propertyValueLookupTable = (NSMutableDictionary *)objc_opt_new();

  _objc_release_x1();
}

- (void)performPostResponseAndReleaseData
{
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100073958(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id v11 = [(CRCarplayCapabilitiesStateMachine *)self responseBlock];

  if (v11)
  {
    uint64_t v12 = [(CRCarplayCapabilitiesStateMachine *)self responseBlock];
    uint64_t v13 = [(CRCarplayCapabilitiesStateMachine *)self carCapabilities];
    ((void (**)(void, void *, void))v12)[2](v12, v13, 0);
  }
  session = self->_session;
  self->_session = 0;

  configurationValues = self->_configurationValues;
  self->_configurationValues = 0;

  configurationKeys = self->_configurationKeys;
  self->_configurationKeys = 0;

  searchHitsByProperty = self->_searchHitsByProperty;
  self->_searchHitsByProperty = 0;

  id responseBlock = self->_responseBlock;
  self->_id responseBlock = 0;

  plistData = self->_plistData;
  self->_plistData = 0;

  propertyValueLookupTable = self->_propertyValueLookupTable;
  self->_propertyValueLookupTable = 0;

  id v21 = self;
  objc_sync_enter(v21);
  [(CRCarplayCapabilitiesStateMachine *)v21 setIsReady:1];
  v22 = [(CRCarplayCapabilitiesStateMachine *)v21 delayedTasks];
  id v23 = [v22 popFirstObject];

  objc_sync_exit(v21);
  if (v23)
  {
    v24 = dispatch_get_global_queue(9, 0);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100035F38;
    v30[3] = &unk_1000BD3A8;
    v30[4] = v21;
    id v31 = v23;
    dispatch_async(v24, v30);
  }
  else
  {
    uint64_t v25 = [(CRCarplayCapabilitiesStateMachine *)v21 plistVersion];
    if (v25)
    {
      id v26 = (void *)v25;
      v27 = [(CRCarplayCapabilitiesStateMachine *)v21 plistVersion];
      unsigned __int8 v28 = [v27 isEqualToString:CRCapabilitiesDefaultVersion];

      if ((v28 & 1) == 0)
      {
        __int16 v29 = [(CRCarplayCapabilitiesStateMachine *)v21 plistVersion];
        +[CRCarPlayCapabilities setCapabilitiesVersion:v29];
      }
    }
  }
}

- (void)performLoadingPlistData:(int64_t)a3
{
  plistURL = self->_plistURL;
  id v48 = 0;
  uint64_t v5 = +[NSDictionary dictionaryWithContentsOfURL:plistURL error:&v48];
  id v6 = v48;
  plistData = self->_plistData;
  self->_plistData = v5;

  if (v6)
  {
    [(CRCarplayCapabilitiesStateMachine *)self handleEvent:2];
  }
  else
  {
    uint64_t v8 = [(NSDictionary *)self->_plistData objectForKeyedSubscript:@"version"];
    uint64_t v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = CRCapabilitiesDefaultVersion;
    }
    [(CRCarplayCapabilitiesStateMachine *)self setPlistVersion:v10];

    id v11 = [(NSDictionary *)self->_plistData objectForKeyedSubscript:@"properties"];
    uint64_t v30 = [(CARSession *)self->_session configuration];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v11;
    id v12 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v45;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          id v17 = -[CRCarplayCapabilitiesStateMachine _configurationValueForSafeKey:](self, "_configurationValueForSafeKey:", v16, v30);
          if (v17)
          {
            [(NSMutableArray *)self->_configurationKeys addObject:v16];
            [(NSMutableDictionary *)self->_configurationValues setObject:v17 forKeyedSubscript:v16];
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v13);
    }

    uint64_t v18 = CarGeneralLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      configurationValues = self->_configurationValues;
      *(_DWORD *)buf = 136315394;
      v52 = "-[CRCarplayCapabilitiesStateMachine performLoadingPlistData:]";
      __int16 v53 = 2112;
      v54 = configurationValues;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Found configuration values for search: %@", buf, 0x16u);
    }

    [(NSDictionary *)self->_plistData objectForKeyedSubscript:@"vehicles"];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    id v34 = [v32 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v41;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v41 != v33) {
            objc_enumerationMutation(v32);
          }
          id v21 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v22 = obj;
          id v23 = [v22 countByEnumeratingWithState:&v36 objects:v49 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v37;
            do
            {
              for (k = 0; k != v24; k = (char *)k + 1)
              {
                if (*(void *)v37 != v25) {
                  objc_enumerationMutation(v22);
                }
                v27 = [v21 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * (void)k), v30];
                if (v27)
                {
                  id v28 = [(NSMutableDictionary *)self->_propertyValueLookupTable objectForKeyedSubscript:v27];
                  if (!v28)
                  {
                    id v28 = objc_alloc_init((Class)NSMutableArray);
                    [(NSMutableDictionary *)self->_propertyValueLookupTable setObject:v28 forKeyedSubscript:v27];
                  }
                  [v28 addObject:v21];
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v36 objects:v49 count:16];
            }
            while (v24);
          }
        }
        id v34 = [v32 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v34);
    }
    if ([(NSMutableDictionary *)self->_configurationValues count]) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = 2;
    }
    [(CRCarplayCapabilitiesStateMachine *)self handleEvent:v29];

    id v6 = 0;
  }
}

- (void)performLookup:(int64_t)a3
{
  uint64_t v4 = [(CRCarplayCapabilitiesStateMachine *)self nextMetadataKey];
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_configurationValues objectForKeyedSubscript:v4];
    id v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    v27 = self;
    propertyValueLookupTable = self->_propertyValueLookupTable;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003664C;
    v32[3] = &unk_1000BE2C8;
    id v9 = v5;
    id v33 = v9;
    id v10 = v7;
    id v34 = v10;
    [(NSMutableDictionary *)propertyValueLookupTable enumerateKeysAndObjectsUsingBlock:v32];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v17 = [v16 valueForKey:v4];
          int v18 = sub_1000366B0(v17, v9);

          if (v18) {
            [v6 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v13);
    }

    if ([v6 count]) {
      [(NSMutableDictionary *)v27->_searchHitsByProperty setObject:v6 forKeyedSubscript:v4];
    }
    [(CRCarplayCapabilitiesStateMachine *)v27 handleEvent:0];
  }
  else
  {
    id v19 = CarGeneralLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100073A48(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    [(CRCarplayCapabilitiesStateMachine *)self handleEvent:1];
  }
}

- (void)performDoneCaptureResult
{
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100073AC0((uint64_t)self);
  }

  if ([(NSMutableDictionary *)self->_searchHitsByProperty count]
    && [(NSMutableArray *)self->_configurationKeys count])
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_searchHitsByProperty allKeys];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    int v18 = sub_100036BF4;
    id v19 = sub_100036C04;
    id v20 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100036C0C;
    v16[3] = &unk_1000BE2F0;
    v16[4] = self;
    void v16[5] = buf;
    [v4 enumerateObjectsUsingBlock:v16];
    id v5 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_alloc((Class)CRCarPlayCapabilities);
  uint64_t v7 = [(CRCarplayCapabilitiesStateMachine *)self plistVersion];
  id v8 = [v6 initWithVersion:v7];
  [(CRCarplayCapabilitiesStateMachine *)self setCarCapabilities:v8];

  if (v5)
  {
    id v9 = [v5 valueForKey:@"features"];
    id v10 = CarGeneralLogging();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CRCarplayCapabilitiesStateMachine performDoneCaptureResult]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    id v11 = "%s: matching vehicle for session/plist is: %@";
    goto LABEL_13;
  }
  plistData = self->_plistData;
  if (!plistData) {
    goto LABEL_16;
  }
  id v9 = [(NSDictionary *)plistData valueForKey:@"features"];
  id v10 = CarGeneralLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CRCarplayCapabilitiesStateMachine performDoneCaptureResult]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    id v11 = "%s: no matching vehicle for session/plist, using default values: %@";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);
  }
LABEL_14:

  if (v9)
  {
    id v13 = [(CRCarplayCapabilitiesStateMachine *)self carCapabilities];
    [(CRCarplayCapabilitiesStateMachine *)self assignCarCapabilities:v13 valuesFromDictionary:v9];
  }
LABEL_16:
  uint64_t v14 = [(CRCarplayCapabilitiesStateMachine *)self carCapabilities];

  if (v14) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }
  [(CRCarplayCapabilitiesStateMachine *)self handleEvent:v15];
}

- (void)assignCarCapabilities:(id)a3 valuesFromDictionary:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:@"nowPlayingAlbumArt"];

    id v9 = [v7 objectForKey:@"userInterfaceStyle"];

    id v10 = [v7 objectForKey:@"viewAreaInsets"];

    id v11 = [v7 objectForKey:@"dashboardRoundedCorners"];

    id v12 = [v7 objectForKey:@"userInfo"];

    if (v8)
    {
      id v13 = [v7 valueForKey:@"nowPlayingAlbumArt"];
      [v26 setNowPlayingAlbumArtMode:[v13 integerValue]];

      if ([v26 nowPlayingAlbumArtMode] == (id)1) {
        [v26 setDisabledFeature:((unint64_t)[v26 disabledFeature] | 1)];
      }
    }
    if (v9)
    {
      uint64_t v14 = [v7 valueForKey:@"userInterfaceStyle"];
      [v26 setUserInterfaceStyle:[v14 integerValue]];
    }
    if (v10)
    {
      uint64_t v15 = [v7 valueForKey:@"viewAreaInsets"];
      NSRectFromString(v15);

      uint64_t v16 = [v7 objectForKeyedSubscript:@"rightHandDriveFlip"];
      if ([v16 BOOLValue])
      {
        id v17 = [(CARSession *)self->_session configuration];
        unsigned int v18 = [v17 rightHandDrive];

        if (v18) {
          CRRectRHDFlip();
        }
      }
      else
      {
      }
      CREdgeInsetsFromRect();
      id v19 = +[NSValue valueWithEdgeInsets:](NSValue, "valueWithEdgeInsets:");
      [v26 setViewAreaInsets:v19];
    }
    if (v11)
    {
      id v20 = [v7 valueForKey:@"dashboardRoundedCorners"];
      NSRectFromString(v20);

      CREdgeInsetsFromRect();
      uint64_t v21 = +[NSValue valueWithEdgeInsets:](NSValue, "valueWithEdgeInsets:");
      [v26 setDashboardRoundedCorners:v21];
    }
    if (v12)
    {
      uint64_t v22 = +[NSDictionary dictionary];
      uint64_t v23 = [v7 valueForKey:@"userInfo"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v25 = [v7 valueForKey:@"userInfo"];

        uint64_t v22 = (void *)v25;
      }
      [v26 setUserInfo:v22];
    }
  }
}

- (BOOL)_vehicleSatisfiesConfiguration:(id)a3 propertyHits:(int64_t *)a4
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v20 = a3;
  uint64_t v4 = [v20 allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = 0;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v4);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v12 isEqualToString:@"features"] & 1) == 0)
        {
          id v13 = [(NSMutableDictionary *)self->_configurationValues objectForKeyedSubscript:v12];
          uint64_t v14 = [v20 objectForKeyedSubscript:v12];
          uint64_t v15 = v14;
          if (v13) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16)
          {
            char v7 = sub_1000366B0(v14, v13);
            ++v9;
          }

          if ((v7 & 1) == 0)
          {
            char v7 = 0;
            goto LABEL_19;
          }
          ++v8;
          char v7 = 1;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v7 = 0;
    uint64_t v8 = 0;
    int64_t v9 = 0;
  }
LABEL_19:

  if (a4) {
    *a4 = v9;
  }

  return v7 & (v9 == v8);
}

- (id)_configurationValueForSafeKey:(id)a3
{
  id v4 = a3;
  if (qword_1000E3878 != -1) {
    dispatch_once(&qword_1000E3878, &stru_1000BE310);
  }
  if ([(id)qword_1000E3880 containsObject:v4])
  {
    id v5 = [(CARSession *)self->_session configuration];
    id v6 = [v5 valueForKeyPath:v4];
  }
  else
  {
    char v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100073B48();
    }

    id v6 = 0;
  }

  return v6;
}

- (CRCarPlayCapabilities)carCapabilities
{
  return self->_carCapabilities;
}

- (void)setCarCapabilities:(id)a3
{
}

- (NSString)plistVersion
{
  return self->_plistVersion;
}

- (void)setPlistVersion:(id)a3
{
}

- (id)responseBlock
{
  return self->_responseBlock;
}

- (void)setResponseBlock:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (NSMutableArray)delayedTasks
{
  return self->_delayedTasks;
}

- (void)setDelayedTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedTasks, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_plistVersion, 0);
  objc_storeStrong((id *)&self->_carCapabilities, 0);
  objc_storeStrong((id *)&self->_stateForStateName, 0);
  objc_storeStrong((id *)&self->_searchHitsByProperty, 0);
  objc_storeStrong((id *)&self->_propertyValueLookupTable, 0);
  objc_storeStrong((id *)&self->_configurationValues, 0);
  objc_storeStrong((id *)&self->_configurationKeys, 0);
  objc_storeStrong((id *)&self->_plistData, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);

  objc_storeStrong((id *)&self->_underlyingStateMachine, 0);
}

@end