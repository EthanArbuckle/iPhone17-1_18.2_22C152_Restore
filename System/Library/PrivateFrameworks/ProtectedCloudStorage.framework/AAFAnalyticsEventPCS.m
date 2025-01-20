@interface AAFAnalyticsEventPCS
+ (BOOL)isAAAFoundationAvailable;
+ (BOOL)isAuthKitAvailable;
+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3;
- (AAFAnalyticsEvent)event;
- (AAFAnalyticsEventPCS)initWithPCSMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10;
- (BOOL)areTestsEnabled;
- (BOOL)canSendMetrics;
- (BOOL)isAAAFoundationAvailable;
- (BOOL)isAuthKitAvailable;
- (BOOL)permittedToSendMetrics;
- (OS_dispatch_queue)queue;
- (void)addMetrics:(id)a3;
- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3;
- (void)setAreTestsEnabled:(BOOL)a3;
- (void)setCanSendMetrics:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setIsAAAFoundationAvailable:(BOOL)a3;
- (void)setIsAuthKitAvailable:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation AAFAnalyticsEventPCS

+ (BOOL)isAAAFoundationAvailable
{
  if (isAAAFoundationAvailable_onceToken != -1) {
    dispatch_once(&isAAAFoundationAvailable_onceToken, &__block_literal_global_17);
  }
  return isAAAFoundationAvailable_available;
}

void __48__AAFAnalyticsEventPCS_isAAAFoundationAvailable__block_invoke()
{
  if (AAAFoundationLibraryCore())
  {
    isAAAFoundationAvailable_available = 1;
  }
  else
  {
    v0 = pcsLogObjForScope("aafanalyticsevent-pcs");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __48__AAFAnalyticsEventPCS_isAAAFoundationAvailable__block_invoke_cold_1(v0);
    }
  }
}

+ (BOOL)isAuthKitAvailable
{
  if (isAuthKitAvailable_onceToken != -1) {
    dispatch_once(&isAuthKitAvailable_onceToken, &__block_literal_global_25);
  }
  return isAuthKitAvailable_available;
}

void __42__AAFAnalyticsEventPCS_isAuthKitAvailable__block_invoke()
{
  if (AuthKitLibraryCore())
  {
    isAuthKitAvailable_available = 1;
  }
  else
  {
    v0 = pcsLogObjForScope("aafanalyticsevent-pcs");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __42__AAFAnalyticsEventPCS_isAuthKitAvailable__block_invoke_cold_1(v0);
    }
  }
}

- (BOOL)permittedToSendMetrics
{
  if (![(AAFAnalyticsEventPCS *)self isAAAFoundationAvailable]
    || ![(AAFAnalyticsEventPCS *)self isAuthKitAvailable]
    || [(AAFAnalyticsEventPCS *)self areTestsEnabled])
  {
    return 0;
  }
  return [(AAFAnalyticsEventPCS *)self canSendMetrics];
}

+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v4 = (void *)getAKAccountManagerClass_softClass_2;
  uint64_t v18 = getAKAccountManagerClass_softClass_2;
  if (!getAKAccountManagerClass_softClass_2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getAKAccountManagerClass_block_invoke_2;
    v14[3] = &unk_1E5E6DDF8;
    v14[4] = &v15;
    __getAKAccountManagerClass_block_invoke_2((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v15, 8);
  v6 = [v5 sharedInstance];
  v7 = v6;
  if (v3)
  {
    id v13 = 0;
    v8 = [v6 authKitAccountWithAltDSID:v3 error:&v13];
    id v9 = v13;
    if (v9)
    {
      v10 = pcsLogObjForScope("aafanalyticsevent-pcs");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[AAFAnalyticsEventPCS fetchDeviceSessionIDFromAuthKit:]((uint64_t)v9, v10);
      }
    }
  }
  else
  {
    v8 = [v6 primaryAuthKitAccount];
  }
  if ([v7 accountAccessTelemetryOptInForAccount:v8])
  {
    v11 = [v7 telemetryDeviceSessionIDForAccount:v8];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (AAFAnalyticsEventPCS)initWithPCSMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10
{
  BOOL v10 = a8;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v39 = a4;
  id v42 = a5;
  id v17 = a6;
  id v40 = a7;
  id v41 = a10;
  if (+[AAFAnalyticsEventPCS isAAAFoundationAvailable]
    && +[AAFAnalyticsEventPCS isAuthKitAvailable]
    && a9
    && !v10)
  {
    v47.receiver = self;
    v47.super_class = (Class)AAFAnalyticsEventPCS;
    uint64_t v18 = [(AAFAnalyticsEventPCS *)&v47 init];
    if (v18)
    {
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v20 = dispatch_queue_create("com.apple.pcs.aafanalyticsevent.queue", v19);
      queue = v18->_queue;
      v18->_queue = (OS_dispatch_queue *)v20;

      v18->_areTestsEnabled = 0;
      v18->_canSendMetrics = a9;
      *(_WORD *)&v18->_isAAAFoundationAvailable = 257;
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2050000000;
      v22 = (void *)getAAFAnalyticsEventClass_softClass;
      uint64_t v57 = getAAFAnalyticsEventClass_softClass;
      if (!getAAFAnalyticsEventClass_softClass)
      {
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        v51 = __getAAFAnalyticsEventClass_block_invoke;
        v52 = &unk_1E5E6DDF8;
        v53 = &v54;
        __getAAFAnalyticsEventClass_block_invoke((uint64_t)&v49);
        v22 = (void *)v55[3];
      }
      v23 = v22;
      _Block_object_dispose(&v54, 8);
      v24 = (void *)[[v23 alloc] initWithEventName:v40 eventCategory:v41 initData:0];
      if (v42 && ([v42 isEqualToString:&stru_1F03DBED0] & 1) == 0)
      {
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x2020000000;
        v25 = (void *)getkAAFFlowIdSymbolLoc_ptr;
        uint64_t v57 = getkAAFFlowIdSymbolLoc_ptr;
        if (!getkAAFFlowIdSymbolLoc_ptr)
        {
          uint64_t v49 = MEMORY[0x1E4F143A8];
          uint64_t v50 = 3221225472;
          v51 = __getkAAFFlowIdSymbolLoc_block_invoke;
          v52 = &unk_1E5E6DDF8;
          v53 = &v54;
          v26 = (void *)AAAFoundationLibrary_0();
          v27 = dlsym(v26, "kAAFFlowId");
          *(void *)(v53[1] + 24) = v27;
          getkAAFFlowIdSymbolLoc_ptr = *(void *)(v53[1] + 24);
          v25 = (void *)v55[3];
        }
        _Block_object_dispose(&v54, 8);
        if (!v25) {
          -[PCSAccountsModel init]();
        }
        [v24 setObject:v42 forKeyedSubscript:*v25];
      }
      if (v17 && ([v17 isEqualToString:&stru_1F03DBED0] & 1) == 0)
      {
        v28 = getkAAFDeviceSessionId();
        [v24 setObject:v17 forKeyedSubscript:v28];
      }
      else
      {
        v28 = +[AAFAnalyticsEventPCS fetchDeviceSessionIDFromAuthKit:](AAFAnalyticsEventPCS, "fetchDeviceSessionIDFromAuthKit:", v39, v39);
        v29 = getkAAFDeviceSessionId();
        [v24 setObject:v28 forKeyedSubscript:v29];
      }
      if (v16)
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        v30 = [v16 allKeys];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v58 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v44 != v32) {
                objc_enumerationMutation(v30);
              }
              uint64_t v34 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              v35 = objc_msgSend(v16, "objectForKeyedSubscript:", v34, v39);
              [v24 setObject:v35 forKeyedSubscript:v34];
            }
            uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v58 count:16];
          }
          while (v31);
        }
      }
      event = v18->_event;
      v18->_event = (AAFAnalyticsEvent *)v24;
    }
  }
  else
  {
    v48.receiver = self;
    v48.super_class = (Class)AAFAnalyticsEventPCS;
    uint64_t v18 = [(AAFAnalyticsEventPCS *)&v48 init];
    if (v18)
    {
      v18->_isAAAFoundationAvailable = +[AAFAnalyticsEventPCS isAAAFoundationAvailable];
      v18->_isAuthKitAvailable = +[AAFAnalyticsEventPCS isAuthKitAvailable];
      v18->_areTestsEnabled = v10;
      v18->_canSendMetrics = a9;
    }
  }
  v37 = v18;

  return v37;
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3
{
  id v4 = a3;
  if ([(AAFAnalyticsEventPCS *)self permittedToSendMetrics])
  {
    id v5 = [(AAFAnalyticsEventPCS *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__AAFAnalyticsEventPCS_populateUnderlyingErrorsStartingWithRootError___block_invoke;
    v6[3] = &unk_1E5E6F540;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __70__AAFAnalyticsEventPCS_populateUnderlyingErrorsStartingWithRootError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) event];
  [v2 populateUnderlyingErrorsStartingWithRootError:*(void *)(a1 + 40)];
}

- (void)addMetrics:(id)a3
{
  id v4 = a3;
  if ([(AAFAnalyticsEventPCS *)self permittedToSendMetrics])
  {
    id v5 = [(AAFAnalyticsEventPCS *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__AAFAnalyticsEventPCS_addMetrics___block_invoke;
    v6[3] = &unk_1E5E6F540;
    id v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);
  }
}

void __35__AAFAnalyticsEventPCS_addMetrics___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        id v9 = [*(id *)(a1 + 40) event];
        [v9 setObject:v8 forKeyedSubscript:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (AAFAnalyticsEvent)event
{
  return (AAFAnalyticsEvent *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvent:(id)a3
{
}

- (BOOL)areTestsEnabled
{
  return self->_areTestsEnabled;
}

- (void)setAreTestsEnabled:(BOOL)a3
{
  self->_areTestsEnabled = a3;
}

- (BOOL)canSendMetrics
{
  return self->_canSendMetrics;
}

- (void)setCanSendMetrics:(BOOL)a3
{
  self->_canSendMetrics = a3;
}

- (BOOL)isAAAFoundationAvailable
{
  return self->_isAAAFoundationAvailable;
}

- (void)setIsAAAFoundationAvailable:(BOOL)a3
{
  self->_isAAAFoundationAvailable = a3;
}

- (BOOL)isAuthKitAvailable
{
  return self->_isAuthKitAvailable;
}

- (void)setIsAuthKitAvailable:(BOOL)a3
{
  self->_isAuthKitAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__AAFAnalyticsEventPCS_isAAAFoundationAvailable__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ACF98000, log, OS_LOG_TYPE_ERROR, "failed to softlink AAAFoundation", v1, 2u);
}

void __42__AAFAnalyticsEventPCS_isAuthKitAvailable__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ACF98000, log, OS_LOG_TYPE_ERROR, "failed to softlink AuthKit", v1, 2u);
}

+ (void)fetchDeviceSessionIDFromAuthKit:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ACF98000, a2, OS_LOG_TYPE_ERROR, "authKitAccountWithAltDSID returned error: %@", (uint8_t *)&v2, 0xCu);
}

@end