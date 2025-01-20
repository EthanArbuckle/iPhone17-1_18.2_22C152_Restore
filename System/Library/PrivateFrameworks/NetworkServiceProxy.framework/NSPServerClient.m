@interface NSPServerClient
+ (id)getErrorFromDict:(uint64_t)a1;
- (BOOL)checkOriginAllowedAsThirdParty:(id)a3;
- (BOOL)removePrivacyProxyPolicy;
- (id)getConnection;
- (id)getTokenFetchConnection;
- (id)initWithCallbackQueue:(id)a1;
- (void)addAuxiliaryAuthenticationData:(id)a3 type:(unint64_t)a4 label:(id)a5 cacheKey:(id)a6;
- (void)addToken:(id)a3 toCacheForFetcher:(id)a4;
- (void)convertPrivacyProxyConfigurationWithCompletionHandler:(id)a3 completionHandler:(id)a4;
- (void)dumpPrivacyProxyTokenEventsWithCompletionHandler:(id)a3 mostRecent:(BOOL)a4 limit:(unint64_t)a5 dumpStats:(BOOL)a6 completionHandler:(id)a7;
- (void)establishTrustWithEdgeSetForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchAppRuleForLabel:(id)a3 completionHandler:(id)a4;
- (void)fetchAuxiliaryAuthenticationDataFromCacheForType:(unint64_t)a3 label:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6;
- (void)fetchCurrentConfigurationWithCompletionHandler:(id)a3;
- (void)fetchEdgeSetForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchKnownPrivateAccessTokenKeyWithFetcher:(id)a3 completionHandler:(id)a4;
- (void)fetchPrivateAccessTokenPairWithFetcher:(id)a3 completionHandler:(id)a4;
- (void)fetchPrivateAccessTokenWithFetcher:(id)a3 completionHandler:(id)a4;
- (void)fetchStateForClient:(id)a3 withPeerEndpoint:(id)a4 completionHandler:(id)a5;
- (void)getForceFallbackWithCompletionHandler:(id)a3;
- (void)getGeohashSharingPreferenceWithCompletionHandler:(id)a3;
- (void)getOverrideIngressProxyWithCompletionHandler:(id)a3;
- (void)getOverrideProxiedContentMapEnabled:(id)a3 completionHandler:(id)a4;
- (void)getPreferredObliviousProxyWithCompletionHandler:(id)a3;
- (void)getPreferredProxyWithCompletionHandler:(id)a3;
- (void)getPreferredResolverWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyAccountTypeWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyAppStatusesWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyConfiguration:(id)a3;
- (void)getPrivacyProxyDomainFilters:(id)a3;
- (void)getPrivacyProxyEffectiveUserTierWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyInfoWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyPolicyWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyServiceStatusTimelineWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyServiceStatusWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyStatusWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyTrafficStateWithCompletionHandler:(id)a3;
- (void)getPrivacyProxyUserTierWithCompletionHandler:(id)a3;
- (void)getPrivateAccessTokensEnabledWithCompletionHandler:(id)a3;
- (void)locationAuthorizationStatusWithCompletionHandler:(id)a3;
- (void)mergePrivacyProxyPolicy:(id)a3;
- (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5 completionHandler:(id)a6;
- (void)overridePreferredObliviousProxy:(id)a3 completionHandler:(id)a4;
- (void)overridePreferredProxy:(id)a3 completionHandler:(id)a4;
- (void)overridePreferredResolver:(id)a3 completionHandler:(id)a4;
- (void)overrideProxiedContentMap:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5;
- (void)privateAccessTokensAllowTools:(BOOL)a3 completionHandler:(id)a4;
- (void)refreshWaldoNowWithCompletionHandler:(id)a3;
- (void)reportPrivacyProxyNetworkStatus:(id)a3 completionHandler:(id)a4;
- (void)reportPrivacyProxyServiceStatus:(unint64_t)a3 completionHandler:(id)a4;
- (void)reportUsage:(id)a3 fromClient:(id)a4;
- (void)sendRTCReport:(int64_t)a3 errorCode:(int64_t)a4 url:(id)a5 completionHandler:(id)a6;
- (void)setAppRule:(id)a3 forLabel:(id)a4 completionHandler:(id)a5;
- (void)setCurrentConfiguration:(id)a3 withCompletionHandler:(id)a4;
- (void)setCurrentLatitude:(double)a3 longitude:(double)a4 timestamp:(id)a5 forClient:(id)a6;
- (void)setEdgeSet:(id)a3 forIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setForceFallback:(BOOL)a3 completionHandler:(id)a4;
- (void)setFreeUserTierUntilTomorrowWithCompletionHandler:(id)a3;
- (void)setGeohashOverride:(id)a3 completionHandler:(id)a4;
- (void)setGeohashSharingPreference:(BOOL)a3 completionHandler:(id)a4;
- (void)setInProcessFlowDivert:(BOOL)a3 completionHandler:(id)a4;
- (void)setLocationMonitorInterval:(double)a3;
- (void)setPreferredPathRoutingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setPrivacyProxyAppStatus:(unint64_t)a3 bundleIdentifier:(id)a4 path:(id)a5 completionHandler:(id)a6;
- (void)setPrivacyProxyConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setPrivacyProxyPolicy:(id)a3 completionHandler:(id)a4;
- (void)setPrivacyProxyStatus:(BOOL)a3 completionHandler:(id)a4;
- (void)setPrivacyProxyTokenEventsProactiveTokenFetchParams:(id)a3 lowerTokenCountThresholdStr:(id)a4 lowerTokenCountProbabilityStr:(id)a5 statsDurationStr:(id)a6 upperLWMCountThresholdStr:(id)a7 upperLWMCountProbabilityOffsetStr:(id)a8 completionHandler:(id)a9;
- (void)setPrivacyProxyTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4 completionHandler:(id)a5;
- (void)setPrivacyProxyUserTier:(unint64_t)a3 completionHandler:(id)a4;
- (void)setPrivateAccessTokensEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setProxiedContentMapDoHBootstrapEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setTestLatencyMap:(id)a3 completionHandler:(id)a4;
- (void)startLocationMonitor;
- (void)startProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3;
- (void)stopLocationMonitor;
- (void)stopProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3;
@end

@implementation NSPServerClient

- (id)initWithCallbackQueue:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NSPServerClient;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      if (v3) {
        dispatch_queue_t v4 = (dispatch_queue_t)v3;
      }
      else {
        dispatch_queue_t v4 = dispatch_queue_create("NSPServerClient queue", 0);
      }
      v5 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v4;

      *((_DWORD *)a1 + 2) = 0;
    }
  }

  return a1;
}

void __67__NSPServerClient_getPrivacyProxyAccountTypeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "NSPServerPrivacyProxyAccountType");
  BOOL v5 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyAccountUnlimited");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, BOOL, id))(v6 + 16))(v6, uint64, v5, v7);
  }
}

void __64__NSPServerClient_getPrivacyProxyUserTierWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id v3 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, xdict);
  if (xdict && MEMORY[0x1A622BC50](xdict) == MEMORY[0x1E4F14590])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "NSPServerPrivacyProxyUserTier");
    BOOL v5 = xpc_dictionary_get_BOOL(xdict, "NSPServerPrivacyProxySetUntilTomorrow");
  }
  else
  {
    uint64_t uint64 = 0;
    BOOL v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, BOOL, void *))(v6 + 16))(v6, uint64, v5, v3);
  }
}

void __68__NSPServerClient_getPrivacyProxyTrafficStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id v3 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, xdict);
  if (xdict && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590]) {
    uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "NSPServerPrivacyProxyTraffic");
  }
  else {
    uint64_t uint64 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, uint64, v3);
  }
}

- (void)getPrivacyProxyServiceStatusWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Requesting get privacy proxy service status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 33);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_getPrivacyProxyServiceStatusWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

- (void)getPrivacyProxyTrafficStateWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Get privacy proxy traffic state", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 22);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__NSPServerClient_getPrivacyProxyTrafficStateWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __69__NSPServerClient_getPrivacyProxyServiceStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  size_t length = 0;
  data = xpc_dictionary_get_data(v3, "NSPServerPrivacyProxyServiceStatus", &length);

  uint64_t v6 = 0;
  if (data && length)
  {
    xpc_object_t v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", data);
    uint64_t v6 = [[PrivacyProxyServiceStatus alloc] initWithData:v7];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, PrivacyProxyServiceStatus *, void *))(v8 + 16))(v8, v6, v4);
  }
}

- (void)getPrivacyProxyAccountTypeWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Get Privacy Proxy account type", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 41);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_getPrivacyProxyAccountTypeWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, void, xpc_object_t))v4 + 2))(v4, 0, 0, v7);
  }
}

- (id)getConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v4 = (id *)(a1 + 24);
    id v3 = *(id *)(a1 + 24);
    if (!v3)
    {
      uint64_t v5 = (const char *)[@"com.apple.networkserviceproxy" UTF8String];
      Property = objc_getProperty((id)a1, v6, 16, 1);
      xpc_connection_t mach_service = xpc_connection_create_mach_service(v5, Property, 0);
      xpc_connection_t v9 = mach_service;
      if (mach_service)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __32__NSPServerClient_getConnection__block_invoke;
        v14[3] = &unk_1E5A3B5D0;
        v14[4] = a1;
        id v10 = mach_service;
        uint64_t v15 = v10;
        xpc_connection_set_event_handler(v10, v14);
        xpc_connection_resume(v10);
        objc_storeStrong(v4, v9);
      }
      else
      {
        v11 = nplog_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v17 = [@"com.apple.networkserviceproxy" UTF8String];
          _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to create an XPC connection to %s", buf, 0xCu);
        }
      }
      id v3 = *v4;
    }
    id v12 = v3;
    os_unfair_lock_unlock(v2);
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

+ (id)getErrorFromDict:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (!v2)
  {
    uint64_t v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "+[NSPServerClient getErrorFromDict:]";
      _os_log_fault_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_FAULT, "%s called with null dict", buf, 0xCu);
    }

    goto LABEL_3;
  }
  if (MEMORY[0x1A622BC50](v2) != MEMORY[0x1E4F14590])
  {
LABEL_3:
    int64 = 0;
    goto LABEL_9;
  }
  int64 = (void *)xpc_dictionary_get_int64(v2, "NSPServerErrorCode");
  string = (char *)xpc_dictionary_get_string(v2, "NSPServerErrorString");
  if (string) {
    string = (char *)[[NSString alloc] initWithUTF8String:string];
  }
  if (int64)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = *MEMORY[0x1E4F28588];
    id v10 = string;
    SEL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    int64 = (void *)[v5 initWithDomain:@"privacyProxyErrorDomain" code:int64 userInfo:v6];
  }
LABEL_9:

  return int64;
}

- (void)getPrivacyProxyUserTierWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Get user tier", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  SEL v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 20);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __64__NSPServerClient_getPrivacyProxyUserTierWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    uint64_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, void, xpc_object_t))v4 + 2))(v4, 0, 0, v7);
  }
}

void __32__NSPServerClient_getConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3 && MEMORY[0x1A622BC50](v3) == MEMORY[0x1E4F145A8])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 24);
    }
    else {
      uint64_t v6 = 0;
    }
    if (v6 == *(void *)(a1 + 40))
    {
      xpc_object_t v7 = nplog_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
        int v9 = 136315138;
        id v10 = string;
        _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_INFO, "Got an error on the XPC connection: %s", (uint8_t *)&v9, 0xCu);
      }

      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        objc_storeStrong((id *)(v5 + 24), 0);
        uint64_t v5 = *(void *)(a1 + 32);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  }
}

uint64_t __50__NSPServerClient_isAllowedToUseFetchTokenService__block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  if (!result) {
    _MergedGlobals_33 = 1;
  }
  return result;
}

- (id)getTokenFetchConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (qword_1EB53BD68 != -1) {
      dispatch_once(&qword_1EB53BD68, &__block_literal_global_3);
    }
    if (_MergedGlobals_33)
    {
      id v2 = (os_unfair_lock_s *)(a1 + 8);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      uint64_t v5 = (id *)(a1 + 32);
      id v4 = *(id *)(a1 + 32);
      if (!v4)
      {
        Property = objc_getProperty((id)a1, v3, 16, 1);
        xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.networkserviceproxy.fetch-token", Property, 0);
        xpc_connection_t v8 = mach_service;
        if (mach_service)
        {
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __42__NSPServerClient_getTokenFetchConnection__block_invoke;
          v14[3] = &unk_1E5A3B5D0;
          v14[4] = a1;
          int v9 = mach_service;
          uint64_t v15 = v9;
          xpc_connection_set_event_handler(v9, v14);
          xpc_connection_resume(v9);
          objc_storeStrong(v5, v8);
          id v10 = nplog_obj();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v17 = "com.apple.networkserviceproxy.fetch-token";
            _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "Created an XPC connection to %s", buf, 0xCu);
          }
        }
        else
        {
          id v12 = nplog_obj();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v17 = "com.apple.networkserviceproxy.fetch-token";
            _os_log_error_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_ERROR, "Failed to create an XPC connection to %s", buf, 0xCu);
          }
        }
        id v4 = *v5;
      }
      id v11 = v4;
      os_unfair_lock_unlock(v2);
    }
    else
    {
      -[NSPServerClient getConnection](a1);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

void __42__NSPServerClient_getTokenFetchConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3 && MEMORY[0x1A622BC50](v3) == MEMORY[0x1E4F145A8])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 32);
    }
    else {
      uint64_t v6 = 0;
    }
    if (v6 == *(void *)(a1 + 40))
    {
      xpc_object_t v7 = nplog_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
        int v9 = 136315138;
        id v10 = string;
        _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_INFO, "Got an error on the XPC connection: %s", (uint8_t *)&v9, 0xCu);
      }

      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        objc_storeStrong((id *)(v5 + 32), 0);
        uint64_t v5 = *(void *)(a1 + 32);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  }
}

- (void)fetchCurrentConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Requesting fetch configuration", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 1);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __66__NSPServerClient_fetchCurrentConfigurationWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v10 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __66__NSPServerClient_fetchCurrentConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7 && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v5 = get_nsdata_from_xpc_object(v7, "NSPServerConfiguration");
    if (v5)
    {
      id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v4 fromData:v5 error:0];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v3);
  }
}

- (void)setCurrentConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_connection_t v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Requesting set configuration", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  int v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 2);
    set_nsobject_in_xpc_object(v10, "NSPServerConfiguration", (uint64_t)v6);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __65__NSPServerClient_setCurrentConfiguration_withCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, __CFString *))v7 + 2))(v7, @"IPC failed");
  }
}

void __65__NSPServerClient_setCurrentConfiguration_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string) {
      string = (char *)[[NSString alloc] initWithUTF8String:string];
    }
  }
  else
  {
    string = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);
  }
}

- (void)fetchEdgeSetForIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  xpc_connection_t v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Requesting fetch edge set for %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  int v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 3);
    id v11 = v6;
    if (v11)
    {
      id v12 = v10;
      xpc_dictionary_set_string(v12, "NSPServerEdgeSetIdentifier", (const char *)[v11 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v13, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __63__NSPServerClient_fetchEdgeSetForIdentifier_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __63__NSPServerClient_fetchEdgeSetForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9 && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    id v7 = get_nsdata_from_xpc_object(v9, "NSPServerWaldoInfos");
    if (v7)
    {
      id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v7 error:0];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v3);
  }
}

- (void)setEdgeSet:(id)a3 forIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_debug_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEBUG, "Requesting set edge set for %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v13, "NSPServerCommandType", 4);
    id v14 = v9;
    if (v14)
    {
      id v15 = v13;
      xpc_dictionary_set_string(v15, "NSPServerEdgeSetIdentifier", (const char *)[v14 UTF8String]);
    }
    set_nsobject_in_xpc_object(v13, "NSPServerWaldoInfo", (uint64_t)v8);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v16, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __62__NSPServerClient_setEdgeSet_forIdentifier_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v18 = v10;
    xpc_connection_send_message_with_reply(v12, v13, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, __CFString *))v10 + 2))(v10, @"IPC failed");
  }
}

void __62__NSPServerClient_setEdgeSet_forIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string) {
      string = (char *)[[NSString alloc] initWithUTF8String:string];
    }
  }
  else
  {
    string = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);
  }
}

- (void)fetchAppRuleForLabel:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Requesting fetch app rule for %@:", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 5);
    id v11 = v6;
    if (v11)
    {
      id v12 = v10;
      xpc_dictionary_set_string(v12, "NSPServerAppLabel", (const char *)[v11 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v13, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__NSPServerClient_fetchAppRuleForLabel_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __58__NSPServerClient_fetchAppRuleForLabel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9 && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    id v7 = get_nsdata_from_xpc_object(v9, "NSPServerAppRules");
    if (v7)
    {
      id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v7 error:0];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v3);
  }
}

- (void)setAppRule:(id)a3 forLabel:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_debug_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEBUG, "Requesting set app rule for %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v13, "NSPServerCommandType", 6);
    id v14 = v9;
    if (v14)
    {
      id v15 = v13;
      xpc_dictionary_set_string(v15, "NSPServerAppLabel", (const char *)[v14 UTF8String]);
    }
    set_nsobject_in_xpc_object(v13, "NSPServerAppRule", (uint64_t)v8);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v16, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__NSPServerClient_setAppRule_forLabel_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v18 = v10;
    xpc_connection_send_message_with_reply(v12, v13, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, __CFString *))v10 + 2))(v10, @"IPC failed");
  }
}

void __57__NSPServerClient_setAppRule_forLabel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string) {
      string = (char *)[[NSString alloc] initWithUTF8String:string];
    }
  }
  else
  {
    string = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);
  }
}

- (void)establishTrustWithEdgeSetForIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Requesting establish trust with edge set %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 7);
    id v11 = v6;
    if (v11)
    {
      id v12 = v10;
      xpc_dictionary_set_string(v12, "NSPServerEdgeSetIdentifier", (const char *)[v11 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v13, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __76__NSPServerClient_establishTrustWithEdgeSetForIdentifier_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, __CFString *))v7 + 2))(v7, @"IPC failed");
  }
}

void __76__NSPServerClient_establishTrustWithEdgeSetForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string) {
      string = (char *)[[NSString alloc] initWithUTF8String:string];
    }
  }
  else
  {
    string = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);
  }
}

- (void)refreshWaldoNowWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Requesting waldo refresh", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 11);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__NSPServerClient_refreshWaldoNowWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v10 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __56__NSPServerClient_refreshWaldoNowWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEBUG, "got reply for waldo refresh", buf, 2u);
  }

  if (v3 && MEMORY[0x1A622BC50](v3) == MEMORY[0x1E4F14590])
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v3, "NSPServerResponseData", &length);
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    if (data && length)
    {
      id v9 = data;
      id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v11 = (void *)[v10 initWithBytesNoCopy:v9 length:length freeWhenDone:0];
      id v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        xpc_object_t v13 = [v12 objectForKeyedSubscript:@"MessageResult"];
        uint64_t v5 = [v12 objectForKeyedSubscript:@"RequestLog"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v6 = [v13 BOOLValue];
        }
        else {
          uint64_t v6 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v5 = 0;
        }
      }
      else
      {
        uint64_t v5 = 0;
        uint64_t v6 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v6, v5);
  }
}

- (void)reportUsage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Reporting usage", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 12);
    uint64_t v17 = 0;
    id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v17];
    if (v11)
    {
      id v12 = v10;
      xpc_object_t v13 = _CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v12, "NSPServerUsageData", v13);
    }
    else
    {
      xpc_object_t v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_ERROR, "Failed to serialize the usage report", v16, 2u);
      }
    }

    id v14 = v7;
    if (v14)
    {
      id v15 = v10;
      xpc_dictionary_set_string(v15, "NSPServerSigningIdentifier", (const char *)[v14 UTF8String]);
    }
    xpc_connection_send_message(v9, v10);
  }
}

- (void)setCurrentLatitude:(double)a3 longitude:(double)a4 timestamp:(id)a5 forClient:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = nplog_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEBUG, "Requesting set latitude and longitude", v18, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v14, "NSPServerCommandType", 13);
    xpc_dictionary_set_double(v14, "NSPServerLatitude", a3);
    xpc_dictionary_set_double(v14, "NSPServerLongtitude", a4);
    [v10 timeIntervalSince1970];
    xpc_dictionary_set_double(v14, "NSPServerTimestamp", v15);
    id v16 = v11;
    if (v16)
    {
      id v17 = v14;
      xpc_dictionary_set_string(v17, "NSPServerSigningIdentifier", (const char *)[v16 UTF8String]);
    }
    xpc_connection_send_message(v13, v14);
  }
}

- (void)fetchStateForClient:(id)a3 withPeerEndpoint:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v8;
    _os_log_debug_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEBUG, "Requesting current state for %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v13, "NSPServerCommandType", 14);
    id v14 = v8;
    if (v14)
    {
      id v15 = v13;
      xpc_dictionary_set_string(v15, "NSPServerSigningIdentifier", (const char *)[v14 UTF8String]);
    }
    id v16 = v9;
    if (v16)
    {
      id v17 = v13;
      xpc_dictionary_set_string(v17, "NSPServerEndpoint", (const char *)[v16 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v18, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __74__NSPServerClient_fetchStateForClient_withPeerEndpoint_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v20 = v10;
    xpc_connection_send_message_with_reply(v12, v13, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  }
}

void __74__NSPServerClient_fetchStateForClient_withPeerEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    xpc_object_t xdict = v3;
    BOOL v4 = MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590];
    id v3 = xdict;
    if (v4)
    {
      uint64_t v5 = get_nsdictionary_from_xpc_object(xdict, "NSPServerWaldoState");
      string = (char *)xpc_dictionary_get_string(xdict, "NSPServerTelemetryService");
      if (string) {
        string = (char *)[[NSString alloc] initWithUTF8String:string];
      }
      id v7 = (char *)xpc_dictionary_get_string(xdict, "NSPServerTelemetryURL");
      if (v7 && (id v7 = (char *)[[NSString alloc] initWithUTF8String:v7]) != 0) {
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];
      }
      else {
        id v8 = 0;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        (*(void (**)(uint64_t, void *, char *, void *))(v9 + 16))(v9, v5, string, v8);
      }

      id v3 = xdict;
    }
  }
}

- (void)setTestLatencyMap:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Requesting set test latency map", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 15);
    if (v6)
    {
      id v12 = v10;
      xpc_object_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v12, "NSPServerTestLatencyMap", v13);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __55__NSPServerClient_setTestLatencyMap_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __55__NSPServerClient_setTestLatencyMap_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    xpc_object_t xdict = v3;
    if (MEMORY[0x1A622BC50](v3) == MEMORY[0x1E4F14590])
    {
      BOOL v4 = xpc_dictionary_get_BOOL(xdict, "NSPServerCommandResult");
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        (*(void (**)(uint64_t, BOOL, xpc_object_t))(v5 + 16))(v5, v4, xdict);
      }
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)getPrivacyProxyConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "get privacy proxy configuration called", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NSPServerClient_getPrivacyProxyConfiguration___block_invoke;
  v7[3] = &unk_1E5A3B620;
  id v8 = v4;
  id v6 = v4;
  [(NSPServerClient *)self fetchCurrentConfigurationWithCompletionHandler:v7];
}

void __48__NSPServerClient_getPrivacyProxyConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v25 = v3;
  if (v3)
  {
    id v4 = [v3 proxyConfiguration];
    uint64_t v5 = [v4 dictionaryRepresentation];

    id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
    id v7 = [v25 enabled];
    [v6 setValue:v7 forKey:@"privacyProxyEnabled"];

    id v8 = [v25 configServerHost];
    [v6 setValue:v8 forKey:@"configServer"];

    uint64_t v9 = [v25 configServerEnabled];
    [v6 setValue:v9 forKey:@"configFetchEnabled"];

    xpc_object_t v10 = [v25 userTier];
    uint64_t v11 = [v10 intValue];
    if (v11 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = off_1E5A3B640[(int)v11];
    }

    [v6 setValue:v12 forKey:@"userTier"];
    xpc_object_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v25, "ignoreInvalidCerts"));
    [v6 setValue:v13 forKey:@"ingoreInvalidCerts"];

    id v14 = (void *)MEMORY[0x1E4F28C10];
    id v15 = [v25 configurationFetchDate];
    id v16 = [v14 localizedStringFromDate:v15 dateStyle:1 timeStyle:2];
    [v6 setValue:v16 forKey:@"configFetchDate"];

    id v17 = [v25 proxyTrafficState];
    uint64_t v18 = +[NSPConfiguration proxyTrafficStateToString:v17];
    [v6 setValue:v18 forKey:@"proxyTraffic"];

    uint64_t v19 = [v5 objectForKey:@"trustedNetworkDiscoveredProxies"];
    if (v19)
    {
      id v20 = (void *)v19;
      uint64_t v21 = [v5 objectForKey:@"trustedNetworkDiscoveredProxies"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v23 = [v5 objectForKey:@"trustedNetworkDiscoveredProxies"];
        [v6 setValue:v23 forKey:@"trustedNetworkDiscoveredProxies"];
      }
    }
    v24 = [v25 cloudSubscriptionCheckEnabled];
    [v6 setValue:v24 forKey:@"cloudSubscriptionCheckEnabled"];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setPrivacyProxyConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2, a3, a4);
  id v6 = v5;
  selfa = (id)v4;
  uint64_t v806 = *MEMORY[0x1E4F143B8];
  id v8 = v7;
  id v9 = v6;
  xpc_object_t v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "Requesting set proxy configuration", buf, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v631 = (void (**)(void, void))v9;
    v639 = objc_alloc_init(NSPPrivacyProxyConfiguration);
    uint64_t v11 = [v8 objectForKeyedSubscript:@"version"];
    if (v11)
    {
      id v12 = (void *)v11;
      xpc_object_t v13 = [v8 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v15 = [v8 objectForKeyedSubscript:@"version"];
        -[NSPPrivacyProxyConfiguration setVersion:](v639, "setVersion:", [v15 unsignedIntValue]);
      }
    }
    uint64_t v16 = [v8 objectForKeyedSubscript:@"enabled"];
    if (v16)
    {
      id v17 = (void *)v16;
      uint64_t v18 = [v8 objectForKeyedSubscript:@"enabled"];
      objc_opt_class();
      char v19 = objc_opt_isKindOfClass();

      if (v19)
      {
        id v20 = [v8 objectForKeyedSubscript:@"enabled"];
        -[NSPPrivacyProxyConfiguration setEnabled:](v639, "setEnabled:", [v20 BOOLValue]);
      }
    }
    uint64_t v21 = [v8 objectForKeyedSubscript:@"disableUntil"];
    if (v21)
    {
      id v22 = (void *)v21;
      uint64_t v23 = [v8 objectForKeyedSubscript:@"disableUntil"];
      objc_opt_class();
      char v24 = objc_opt_isKindOfClass();

      if (v24)
      {
        id v25 = [v8 objectForKeyedSubscript:@"disableUntil"];
        -[NSPPrivacyProxyConfiguration setDisableUntil:](v639, "setDisableUntil:", [v25 unsignedLongValue]);
      }
    }
    v638 = objc_alloc_init(NSPPrivacyProxyAuthenticationInfo);
    -[NSPPrivacyProxyConfiguration setAuthInfo:](v639, "setAuthInfo:");
    uint64_t v26 = [v8 objectForKeyedSubscript:@"authInfo"];
    id v635 = v8;
    if (v26)
    {
      v27 = (void *)v26;
      v28 = [v8 objectForKeyedSubscript:@"authInfo"];
      objc_opt_class();
      char v29 = objc_opt_isKindOfClass();

      if (v29)
      {
        v30 = [v8 objectForKeyedSubscript:@"authInfo"];
        uint64_t v31 = [v30 objectForKeyedSubscript:@"authURL"];
        if (v31)
        {
          v32 = (void *)v31;
          v33 = [v30 objectForKeyedSubscript:@"authURL"];
          objc_opt_class();
          char v34 = objc_opt_isKindOfClass();

          if (v34)
          {
            v35 = [v30 objectForKeyedSubscript:@"authURL"];
            [(NSPPrivacyProxyAuthenticationInfo *)v638 setAuthURL:v35];
          }
        }
        uint64_t v36 = [v30 objectForKeyedSubscript:@"accessTokenURL"];
        if (v36)
        {
          v37 = (void *)v36;
          v38 = [v30 objectForKeyedSubscript:@"accessTokenURL"];
          objc_opt_class();
          char v39 = objc_opt_isKindOfClass();

          if (v39)
          {
            v40 = [v30 objectForKeyedSubscript:@"accessTokenURL"];
            [(NSPPrivacyProxyAuthenticationInfo *)v638 setAccessTokenURL:v40];
          }
        }
        uint64_t v41 = [v30 objectForKeyedSubscript:@"accessTokenTypes"];
        v630 = v30;
        if (v41)
        {
          v42 = (void *)v41;
          v43 = [v30 objectForKeyedSubscript:@"accessTokenTypes"];
          objc_opt_class();
          char v44 = objc_opt_isKindOfClass();

          if (v44)
          {
            [v30 objectForKeyedSubscript:@"accessTokenTypes"];
            long long v774 = 0u;
            long long v775 = 0u;
            long long v776 = 0u;
            long long v777 = 0u;
            id v45 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v46 = [v45 countByEnumeratingWithState:&v774 objects:v805 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v775;
              do
              {
                for (uint64_t i = 0; i != v47; ++i)
                {
                  if (*(void *)v775 != v48) {
                    objc_enumerationMutation(v45);
                  }
                  v50 = *(void **)(*((void *)&v774 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    -[NSPPrivacyProxyAuthenticationInfo addAccessTokenTypes:](v638, "addAccessTokenTypes:", [v50 unsignedIntValue]);
                  }
                }
                uint64_t v47 = [v45 countByEnumeratingWithState:&v774 objects:v805 count:16];
              }
              while (v47);
            }

            v30 = v630;
          }
        }
        uint64_t v51 = [v30 objectForKeyedSubscript:@"accessTokenKnownOrigins"];
        if (v51)
        {
          v52 = (void *)v51;
          v53 = [v30 objectForKeyedSubscript:@"accessTokenKnownOrigins"];
          objc_opt_class();
          char v54 = objc_opt_isKindOfClass();

          if (v54)
          {
            [v30 objectForKeyedSubscript:@"accessTokenKnownOrigins"];
            long long v770 = 0u;
            long long v771 = 0u;
            long long v772 = 0u;
            long long v773 = 0u;
            id v55 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v56 = [v55 countByEnumeratingWithState:&v770 objects:v804 count:16];
            if (v56)
            {
              uint64_t v57 = v56;
              uint64_t v58 = *(void *)v771;
              do
              {
                for (uint64_t j = 0; j != v57; ++j)
                {
                  if (*(void *)v771 != v58) {
                    objc_enumerationMutation(v55);
                  }
                  uint64_t v60 = *(void *)(*((void *)&v770 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [(NSPPrivacyProxyAuthenticationInfo *)v638 addAccessTokenKnownOrigins:v60];
                  }
                }
                uint64_t v57 = [v55 countByEnumeratingWithState:&v770 objects:v804 count:16];
              }
              while (v57);
            }

            v30 = v630;
          }
        }
        uint64_t v61 = [v30 objectForKeyedSubscript:@"accessTokenBlockedIssuers"];
        if (v61)
        {
          v62 = (void *)v61;
          v63 = [v30 objectForKeyedSubscript:@"accessTokenBlockedIssuers"];
          objc_opt_class();
          char v64 = objc_opt_isKindOfClass();

          if (v64)
          {
            [v30 objectForKeyedSubscript:@"accessTokenBlockedIssuers"];
            long long v766 = 0u;
            long long v767 = 0u;
            long long v768 = 0u;
            long long v769 = 0u;
            id v65 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v66 = [v65 countByEnumeratingWithState:&v766 objects:v803 count:16];
            if (v66)
            {
              uint64_t v67 = v66;
              uint64_t v68 = *(void *)v767;
              do
              {
                for (uint64_t k = 0; k != v67; ++k)
                {
                  if (*(void *)v767 != v68) {
                    objc_enumerationMutation(v65);
                  }
                  uint64_t v70 = *(void *)(*((void *)&v766 + 1) + 8 * k);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [(NSPPrivacyProxyAuthenticationInfo *)v638 addAccessTokenBlockedIssuers:v70];
                  }
                }
                uint64_t v67 = [v65 countByEnumeratingWithState:&v766 objects:v803 count:16];
              }
              while (v67);
            }

            v30 = v630;
          }
        }
        uint64_t v71 = [v30 objectForKeyedSubscript:@"authType"];
        if (v71)
        {
          v72 = (void *)v71;
          v73 = [v30 objectForKeyedSubscript:@"authType"];
          objc_opt_class();
          char v74 = objc_opt_isKindOfClass();

          if (v74)
          {
            id v75 = [v30 objectForKeyedSubscript:@"authType"];
            if ([v75 isEqualToString:@"UNKNOWN"])
            {
              uint64_t v76 = 0;
            }
            else if ([v75 isEqualToString:@"BAA"])
            {
              uint64_t v76 = 1;
            }
            else if ([v75 isEqualToString:@"ANISETTE"])
            {
              uint64_t v76 = 2;
            }
            else if ([v75 isEqualToString:@"BAA_ANISETTE"])
            {
              uint64_t v76 = 3;
            }
            else if ([v75 isEqualToString:@"TOKEN"])
            {
              uint64_t v76 = 4;
            }
            else
            {
              uint64_t v76 = 0;
            }

            [(NSPPrivacyProxyAuthenticationInfo *)v638 setAuthType:v76];
            v30 = v630;
          }
        }
        uint64_t v78 = [v30 objectForKeyedSubscript:@"nonDefaultAttesters"];
        if (v78)
        {
          v79 = (void *)v78;
          v80 = [v30 objectForKeyedSubscript:@"nonDefaultAttesters"];
          objc_opt_class();
          char v81 = objc_opt_isKindOfClass();

          if (v81)
          {
            [v30 objectForKeyedSubscript:@"nonDefaultAttesters"];
            long long v762 = 0u;
            long long v763 = 0u;
            long long v764 = 0u;
            long long v765 = 0u;
            id v82 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v83 = [v82 countByEnumeratingWithState:&v762 objects:v802 count:16];
            if (v83)
            {
              uint64_t v84 = v83;
              uint64_t v636 = *(void *)v763;
              id v633 = v82;
              do
              {
                uint64_t v85 = 0;
                uint64_t v634 = v84;
                do
                {
                  if (*(void *)v763 != v636) {
                    objc_enumerationMutation(v82);
                  }
                  uint64_t v637 = v85;
                  v86 = *(void **)(*((void *)&v762 + 1) + 8 * v85);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v641 = objc_alloc_init(NSPPrivacyProxyTokenAttester);
                    -[NSPPrivacyProxyAuthenticationInfo addNonDefaultAttesters:](v638, "addNonDefaultAttesters:");
                    uint64_t v87 = [v86 objectForKeyedSubscript:@"authType"];
                    if (v87)
                    {
                      v88 = (void *)v87;
                      v89 = [v86 objectForKeyedSubscript:@"authType"];
                      objc_opt_class();
                      char v90 = objc_opt_isKindOfClass();

                      if (v90)
                      {
                        id v91 = [v86 objectForKeyedSubscript:@"authType"];
                        if ([v91 isEqualToString:@"UNKNOWN"])
                        {
                          uint64_t v92 = 0;
                        }
                        else if ([v91 isEqualToString:@"BAA"])
                        {
                          uint64_t v92 = 1;
                        }
                        else if ([v91 isEqualToString:@"ANISETTE"])
                        {
                          uint64_t v92 = 2;
                        }
                        else if ([v91 isEqualToString:@"BAA_ANISETTE"])
                        {
                          uint64_t v92 = 3;
                        }
                        else if ([v91 isEqualToString:@"TOKEN"])
                        {
                          uint64_t v92 = 4;
                        }
                        else
                        {
                          uint64_t v92 = 0;
                        }

                        [(NSPPrivacyProxyTokenAttester *)v641 setAuthType:v92];
                      }
                    }
                    uint64_t v93 = [v86 objectForKeyedSubscript:@"attesterURL"];
                    if (v93)
                    {
                      v94 = (void *)v93;
                      v95 = [v86 objectForKeyedSubscript:@"attesterURL"];
                      objc_opt_class();
                      char v96 = objc_opt_isKindOfClass();

                      if (v96)
                      {
                        v97 = [v86 objectForKeyedSubscript:@"attesterURL"];
                        [(NSPPrivacyProxyTokenAttester *)v641 setAttesterURL:v97];
                      }
                    }
                    uint64_t v98 = [v86 objectForKeyedSubscript:@"associatedIssuers"];
                    if (v98)
                    {
                      v99 = (void *)v98;
                      v100 = [v86 objectForKeyedSubscript:@"associatedIssuers"];
                      objc_opt_class();
                      char v101 = objc_opt_isKindOfClass();

                      if (v101)
                      {
                        v102 = [v86 objectForKeyedSubscript:@"associatedIssuers"];
                        long long v758 = 0u;
                        long long v759 = 0u;
                        long long v760 = 0u;
                        long long v761 = 0u;
                        obuint64_t j = v102;
                        uint64_t v103 = [obj countByEnumeratingWithState:&v758 objects:v801 count:16];
                        if (v103)
                        {
                          uint64_t v104 = v103;
                          uint64_t v105 = *(void *)v759;
                          uint64_t v640 = *(void *)v759;
                          do
                          {
                            uint64_t v106 = 0;
                            uint64_t v643 = v104;
                            do
                            {
                              if (*(void *)v759 != v105) {
                                objc_enumerationMutation(obj);
                              }
                              v107 = *(void **)(*((void *)&v758 + 1) + 8 * v106);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                uint64_t v648 = v106;
                                v656 = objc_alloc_init(NSPPrivacyProxyTokenIssuer);
                                -[NSPPrivacyProxyTokenAttester addAssociatedIssuers:](v641, "addAssociatedIssuers:");
                                uint64_t v108 = [v107 objectForKeyedSubscript:@"issuerName"];
                                v651 = v107;
                                if (v108)
                                {
                                  v109 = (void *)v108;
                                  v110 = [v107 objectForKeyedSubscript:@"issuerName"];
                                  objc_opt_class();
                                  char v111 = objc_opt_isKindOfClass();

                                  if (v111)
                                  {
                                    v112 = [v107 objectForKeyedSubscript:@"issuerName"];
                                    [(NSPPrivacyProxyTokenIssuer *)v656 setIssuerName:v112];
                                  }
                                }
                                uint64_t v113 = [v107 objectForKeyedSubscript:@"tokenKeys"];
                                if (v113)
                                {
                                  v114 = (void *)v113;
                                  v115 = [v107 objectForKeyedSubscript:@"tokenKeys"];
                                  objc_opt_class();
                                  char v116 = objc_opt_isKindOfClass();

                                  if (v116)
                                  {
                                    v117 = [v107 objectForKeyedSubscript:@"tokenKeys"];
                                    long long v754 = 0u;
                                    long long v755 = 0u;
                                    long long v756 = 0u;
                                    long long v757 = 0u;
                                    id v662 = v117;
                                    uint64_t v118 = [v662 countByEnumeratingWithState:&v754 objects:v800 count:16];
                                    if (v118)
                                    {
                                      uint64_t v119 = v118;
                                      uint64_t v120 = *(void *)v755;
                                      do
                                      {
                                        for (uint64_t m = 0; m != v119; ++m)
                                        {
                                          if (*(void *)v755 != v120) {
                                            objc_enumerationMutation(v662);
                                          }
                                          v122 = *(void **)(*((void *)&v754 + 1) + 8 * m);
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            v123 = objc_alloc_init(NSPPrivacyProxyTokenKey);
                                            [(NSPPrivacyProxyTokenIssuer *)v656 addTokenKeys:v123];
                                            uint64_t v124 = [v122 objectForKeyedSubscript:@"key"];
                                            if (v124)
                                            {
                                              v125 = (void *)v124;
                                              v126 = [v122 objectForKeyedSubscript:@"key"];
                                              objc_opt_class();
                                              char v127 = objc_opt_isKindOfClass();

                                              if (v127)
                                              {
                                                v128 = [v122 objectForKeyedSubscript:@"key"];
                                                [(NSPPrivacyProxyTokenKey *)v123 setKey:v128];
                                              }
                                            }
                                            uint64_t v129 = [v122 objectForKeyedSubscript:@"expiration"];
                                            if (v129)
                                            {
                                              v130 = (void *)v129;
                                              v131 = [v122 objectForKeyedSubscript:@"expiration"];
                                              objc_opt_class();
                                              char v132 = objc_opt_isKindOfClass();

                                              if (v132)
                                              {
                                                v133 = [v122 objectForKeyedSubscript:@"expiration"];
                                                -[NSPPrivacyProxyTokenKey setExpiration:](v123, "setExpiration:", [v133 unsignedLongLongValue]);
                                              }
                                            }
                                            uint64_t v134 = [v122 objectForKeyedSubscript:@"rotation"];
                                            if (v134)
                                            {
                                              v135 = (void *)v134;
                                              v136 = [v122 objectForKeyedSubscript:@"rotation"];
                                              objc_opt_class();
                                              char v137 = objc_opt_isKindOfClass();

                                              if (v137)
                                              {
                                                v138 = [v122 objectForKeyedSubscript:@"rotation"];
                                                -[NSPPrivacyProxyTokenKey setRotation:](v123, "setRotation:", [v138 unsignedLongLongValue]);
                                              }
                                            }
                                          }
                                        }
                                        uint64_t v119 = [v662 countByEnumeratingWithState:&v754 objects:v800 count:16];
                                      }
                                      while (v119);
                                    }

                                    v107 = v651;
                                  }
                                }
                                uint64_t v139 = [v107 objectForKeyedSubscript:@"transparencyKeyBundle"];
                                if (v139)
                                {
                                  v140 = (void *)v139;
                                  v141 = [v107 objectForKeyedSubscript:@"transparencyKeyBundle"];
                                  objc_opt_class();
                                  char v142 = objc_opt_isKindOfClass();

                                  v107 = v651;
                                  if (v142)
                                  {
                                    v143 = [v651 objectForKeyedSubscript:@"transparencyKeyBundle"];
                                    [(NSPPrivacyProxyTokenIssuer *)v656 setTransparencyKeyBundle:v143];
                                  }
                                }
                                uint64_t v144 = [v107 objectForKeyedSubscript:@"transparencyProof"];
                                if (v144)
                                {
                                  v145 = (void *)v144;
                                  v146 = [v107 objectForKeyedSubscript:@"transparencyProof"];
                                  objc_opt_class();
                                  char v147 = objc_opt_isKindOfClass();

                                  v107 = v651;
                                  if (v147)
                                  {
                                    v148 = [v651 objectForKeyedSubscript:@"transparencyProof"];
                                    [(NSPPrivacyProxyTokenIssuer *)v656 setTransparencyProof:v148];
                                  }
                                }
                                uint64_t v149 = [v107 objectForKeyedSubscript:@"transparencyInternalProof"];
                                if (v149)
                                {
                                  v150 = (void *)v149;
                                  v151 = [v107 objectForKeyedSubscript:@"transparencyInternalProof"];
                                  objc_opt_class();
                                  char v152 = objc_opt_isKindOfClass();

                                  if (v152)
                                  {
                                    v153 = [v651 objectForKeyedSubscript:@"transparencyInternalProof"];
                                    [(NSPPrivacyProxyTokenIssuer *)v656 setTransparencyInternalProof:v153];
                                  }
                                }

                                uint64_t v105 = v640;
                                uint64_t v104 = v643;
                                uint64_t v106 = v648;
                              }
                              ++v106;
                            }
                            while (v106 != v104);
                            uint64_t v104 = [obj countByEnumeratingWithState:&v758 objects:v801 count:16];
                          }
                          while (v104);
                        }

                        id v82 = v633;
                      }
                    }

                    uint64_t v84 = v634;
                    id v8 = v635;
                  }
                  uint64_t v85 = v637 + 1;
                }
                while (v637 + 1 != v84);
                uint64_t v84 = [v82 countByEnumeratingWithState:&v762 objects:v802 count:16];
              }
              while (v84);
            }

            v30 = v630;
          }
        }
      }
    }
    uint64_t v154 = [v8 objectForKeyedSubscript:@"policyTierMap"];
    if (v154)
    {
      v155 = (void *)v154;
      v156 = [v8 objectForKeyedSubscript:@"policyTierMap"];
      objc_opt_class();
      char v157 = objc_opt_isKindOfClass();

      if (v157)
      {
        [v8 objectForKeyedSubscript:@"policyTierMap"];
        long long v750 = 0u;
        long long v751 = 0u;
        long long v752 = 0u;
        long long v753 = 0u;
        id v158 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v159 = [v158 countByEnumeratingWithState:&v750 objects:v799 count:16];
        if (v159)
        {
          uint64_t v160 = v159;
          uint64_t v161 = *(void *)v751;
          id obja = v158;
          uint64_t v652 = *(void *)v751;
          do
          {
            uint64_t v162 = 0;
            uint64_t v657 = v160;
            do
            {
              if (*(void *)v751 != v161) {
                objc_enumerationMutation(v158);
              }
              v163 = *(void **)(*((void *)&v750 + 1) + 8 * v162);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v663 = objc_alloc_init(NSPPrivacyProxyPolicyTierMap);
                -[NSPPrivacyProxyConfiguration addPolicyTierMap:](v639, "addPolicyTierMap:");
                uint64_t v164 = [v163 objectForKeyedSubscript:@"tier"];
                if (v164)
                {
                  v165 = (void *)v164;
                  v166 = [v163 objectForKeyedSubscript:@"tier"];
                  objc_opt_class();
                  char v167 = objc_opt_isKindOfClass();

                  if (v167)
                  {
                    id v168 = [v163 objectForKeyedSubscript:@"tier"];
                    if ([v168 isEqualToString:@"UNKNOWN"])
                    {
                      uint64_t v169 = 0;
                    }
                    else if ([v168 isEqualToString:@"FREE"])
                    {
                      uint64_t v169 = 1;
                    }
                    else if ([v168 isEqualToString:@"SUBSCRIBER"])
                    {
                      uint64_t v169 = 2;
                    }
                    else
                    {
                      uint64_t v169 = 0;
                    }

                    [(NSPPrivacyProxyPolicyTierMap *)v663 setTier:v169];
                  }
                }
                uint64_t v170 = [v163 objectForKeyedSubscript:@"policy"];
                if (v170)
                {
                  v171 = (void *)v170;
                  v172 = [v163 objectForKeyedSubscript:@"policy"];
                  objc_opt_class();
                  char v173 = objc_opt_isKindOfClass();

                  if (v173)
                  {
                    v174 = [v163 objectForKeyedSubscript:@"policy"];
                    uint64_t v175 = [v174 objectForKeyedSubscript:@"conditions"];
                    if (v175)
                    {
                      v176 = (void *)v175;
                      [v174 objectForKeyedSubscript:@"conditions"];
                      v177 = v649 = v174;
                      objc_opt_class();
                      char v178 = objc_opt_isKindOfClass();

                      v174 = v649;
                      if (v178)
                      {
                        v179 = objc_alloc_init(NSPPrivacyProxyPolicy);
                        [(NSPPrivacyProxyPolicyTierMap *)v663 setPolicy:v179];
                        long long v749 = 0u;
                        long long v748 = 0u;
                        long long v747 = 0u;
                        long long v746 = 0u;
                        v180 = [v649 objectForKeyedSubscript:@"conditions"];
                        uint64_t v181 = [v180 countByEnumeratingWithState:&v746 objects:v798 count:16];
                        if (v181)
                        {
                          uint64_t v182 = v181;
                          uint64_t v183 = *(void *)v747;
                          do
                          {
                            for (uint64_t n = 0; n != v182; ++n)
                            {
                              if (*(void *)v747 != v183) {
                                objc_enumerationMutation(v180);
                              }
                              id v185 = *(id *)(*((void *)&v746 + 1) + 8 * n);
                              if ([v185 isEqualToString:@"UNKNOWN"])
                              {
                                uint64_t v186 = 0;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_UNENCRYPTED"])
                              {
                                uint64_t v186 = 1;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_DNS"])
                              {
                                uint64_t v186 = 2;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_TRACKER"])
                              {
                                uint64_t v186 = 3;
                              }
                              else if ([v185 isEqualToString:@"MAIL_TRACKER"])
                              {
                                uint64_t v186 = 4;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_ALL"])
                              {
                                uint64_t v186 = 5;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_HTTP"])
                              {
                                uint64_t v186 = 6;
                              }
                              else if ([v185 isEqualToString:@"ANY_UNENCRYPTED"])
                              {
                                uint64_t v186 = 7;
                              }
                              else if ([v185 isEqualToString:@"ANY_DNS"])
                              {
                                uint64_t v186 = 8;
                              }
                              else if ([v185 isEqualToString:@"ANY_KNOWN_TRACKER"])
                              {
                                uint64_t v186 = 9;
                              }
                              else if ([v185 isEqualToString:@"ANY_APP_TRACKER"])
                              {
                                uint64_t v186 = 10;
                              }
                              else if ([v185 isEqualToString:@"NEWS_URL_RESOLUTION"])
                              {
                                uint64_t v186 = 11;
                              }
                              else if ([v185 isEqualToString:@"EXPOSURE_NOTIFICATIONS"])
                              {
                                uint64_t v186 = 12;
                              }
                              else if ([v185 isEqualToString:@"APPLE_CERTIFICATES"])
                              {
                                uint64_t v186 = 13;
                              }
                              else if ([v185 isEqualToString:@"NETWORK_TOOLS"])
                              {
                                uint64_t v186 = 14;
                              }
                              else if ([v185 isEqualToString:@"METRICS_UPLOAD"])
                              {
                                uint64_t v186 = 15;
                              }
                              else if ([v185 isEqualToString:@"BRANDED_CALLING"])
                              {
                                uint64_t v186 = 16;
                              }
                              else if ([v185 isEqualToString:@"NEWS_EMBEDDED_CONTENT"])
                              {
                                uint64_t v186 = 17;
                              }
                              else if ([v185 isEqualToString:@"APP_METRICS"])
                              {
                                uint64_t v186 = 18;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_PRIVATE_UNENCRYPTED"])
                              {
                                uint64_t v186 = 19;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_PRIVATE_DNS"])
                              {
                                uint64_t v186 = 20;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_PRIVATE_ALL"])
                              {
                                uint64_t v186 = 21;
                              }
                              else if ([v185 isEqualToString:@"SAFARI_METRICS"])
                              {
                                uint64_t v186 = 22;
                              }
                              else if ([v185 isEqualToString:@"PROMOTED_CONTENT"])
                              {
                                uint64_t v186 = 23;
                              }
                              else if ([v185 isEqualToString:@"POSTBACK_FETCH"])
                              {
                                uint64_t v186 = 24;
                              }
                              else if ([v185 isEqualToString:@"PM_PR_ICON_FETCHING"])
                              {
                                uint64_t v186 = 25;
                              }
                              else if ([v185 isEqualToString:@"LAUNCH_WARNING_DETAILS"])
                              {
                                uint64_t v186 = 26;
                              }
                              else
                              {
                                uint64_t v186 = 0;
                              }

                              [(NSPPrivacyProxyPolicy *)v179 addConditions:v186];
                            }
                            uint64_t v182 = [v180 countByEnumeratingWithState:&v746 objects:v798 count:16];
                          }
                          while (v182);
                        }

                        id v8 = v635;
                        id v158 = obja;
                        v174 = v649;
                      }
                    }
                  }
                }

                uint64_t v161 = v652;
                uint64_t v160 = v657;
              }
              ++v162;
            }
            while (v162 != v160);
            uint64_t v160 = [v158 countByEnumeratingWithState:&v750 objects:v799 count:16];
          }
          while (v160);
        }
      }
    }
    uint64_t v187 = [v8 objectForKeyedSubscript:@"proxies"];
    if (v187)
    {
      v188 = (void *)v187;
      v189 = [v8 objectForKeyedSubscript:@"proxies"];
      objc_opt_class();
      char v190 = objc_opt_isKindOfClass();

      if (v190)
      {
        v191 = [v8 objectForKeyedSubscript:@"proxies"];
        long long v742 = 0u;
        long long v743 = 0u;
        long long v744 = 0u;
        long long v745 = 0u;
        id v664 = v191;
        uint64_t v192 = [v664 countByEnumeratingWithState:&v742 objects:v797 count:16];
        if (v192)
        {
          uint64_t v193 = v192;
          uint64_t v194 = *(void *)v743;
          uint64_t v653 = *(void *)v743;
          do
          {
            uint64_t v195 = 0;
            uint64_t v658 = v193;
            do
            {
              if (*(void *)v743 != v194) {
                objc_enumerationMutation(v664);
              }
              v196 = *(void **)(*((void *)&v742 + 1) + 8 * v195);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v197 = objc_alloc_init(NSPPrivacyProxyProxyInfo);
                [(NSPPrivacyProxyConfiguration *)v639 addProxies:v197];
                uint64_t v198 = [v196 objectForKeyedSubscript:@"proxyHop"];
                if (v198)
                {
                  v199 = (void *)v198;
                  v200 = [v196 objectForKeyedSubscript:@"proxyHop"];
                  objc_opt_class();
                  char v201 = objc_opt_isKindOfClass();

                  if (v201)
                  {
                    id v202 = [v196 objectForKeyedSubscript:@"proxyHop"];
                    if ([v202 isEqualToString:@"UNKNOWN"])
                    {
                      uint64_t v203 = 0;
                    }
                    else if ([v202 isEqualToString:@"INGRESS_ONLY"])
                    {
                      uint64_t v203 = 1;
                    }
                    else if ([v202 isEqualToString:@"EGRESS_ONLY"])
                    {
                      uint64_t v203 = 2;
                    }
                    else if ([v202 isEqualToString:@"ANY"])
                    {
                      uint64_t v203 = 3;
                    }
                    else
                    {
                      uint64_t v203 = 0;
                    }

                    [(NSPPrivacyProxyProxyInfo *)v197 setProxyHop:v203];
                  }
                }
                uint64_t v204 = [v196 objectForKeyedSubscript:@"proxyURL"];
                if (v204)
                {
                  v205 = (void *)v204;
                  v206 = [v196 objectForKeyedSubscript:@"proxyURL"];
                  objc_opt_class();
                  char v207 = objc_opt_isKindOfClass();

                  if (v207)
                  {
                    v208 = [v196 objectForKeyedSubscript:@"proxyURL"];
                    [(NSPPrivacyProxyProxyInfo *)v197 setProxyURL:v208];
                  }
                }
                uint64_t v209 = [v196 objectForKeyedSubscript:@"proxyKeyInfo"];
                if (v209)
                {
                  v210 = (void *)v209;
                  v211 = [v196 objectForKeyedSubscript:@"proxyKeyInfo"];
                  objc_opt_class();
                  char v212 = objc_opt_isKindOfClass();

                  if (v212)
                  {
                    v213 = [v196 objectForKeyedSubscript:@"proxyKeyInfo"];
                    long long v738 = 0u;
                    long long v739 = 0u;
                    long long v740 = 0u;
                    long long v741 = 0u;
                    id v214 = v213;
                    uint64_t v215 = [v214 countByEnumeratingWithState:&v738 objects:v796 count:16];
                    if (v215)
                    {
                      uint64_t v216 = v215;
                      uint64_t v217 = *(void *)v739;
                      do
                      {
                        for (iuint64_t i = 0; ii != v216; ++ii)
                        {
                          if (*(void *)v739 != v217) {
                            objc_enumerationMutation(v214);
                          }
                          uint64_t v219 = *(void *)(*((void *)&v738 + 1) + 8 * ii);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            [(NSPPrivacyProxyProxyInfo *)v197 addProxyKeyInfo:v219];
                          }
                        }
                        uint64_t v216 = [v214 countByEnumeratingWithState:&v738 objects:v796 count:16];
                      }
                      while (v216);
                    }
                  }
                }
                uint64_t v220 = [v196 objectForKeyedSubscript:@"tokenKeyInfo"];
                if (v220)
                {
                  v221 = (void *)v220;
                  v222 = [v196 objectForKeyedSubscript:@"tokenKeyInfo"];
                  objc_opt_class();
                  char v223 = objc_opt_isKindOfClass();

                  if (v223)
                  {
                    v224 = [v196 objectForKeyedSubscript:@"tokenKeyInfo"];
                    [(NSPPrivacyProxyProxyInfo *)v197 setTokenKeyInfo:v224];
                  }
                }
                uint64_t v225 = [v196 objectForKeyedSubscript:@"supportsFallback"];
                if (v225)
                {
                  v226 = (void *)v225;
                  v227 = [v196 objectForKeyedSubscript:@"supportsFallback"];
                  objc_opt_class();
                  char v228 = objc_opt_isKindOfClass();

                  if (v228)
                  {
                    v229 = [v196 objectForKeyedSubscript:@"supportsFallback"];
                    -[NSPPrivacyProxyProxyInfo setSupportsFallback:](v197, "setSupportsFallback:", [v229 BOOLValue]);
                  }
                }
                uint64_t v230 = [v196 objectForKeyedSubscript:@"vendor"];
                if (v230)
                {
                  v231 = (void *)v230;
                  v232 = [v196 objectForKeyedSubscript:@"vendor"];
                  objc_opt_class();
                  char v233 = objc_opt_isKindOfClass();

                  if (v233)
                  {
                    v234 = [v196 objectForKeyedSubscript:@"vendor"];
                    [(NSPPrivacyProxyProxyInfo *)v197 setVendor:v234];
                  }
                }
                uint64_t v235 = [v196 objectForKeyedSubscript:@"tcpProxyFqdn"];
                if (v235)
                {
                  v236 = (void *)v235;
                  v237 = [v196 objectForKeyedSubscript:@"tcpProxyFqdn"];
                  objc_opt_class();
                  char v238 = objc_opt_isKindOfClass();

                  if (v238)
                  {
                    v239 = [v196 objectForKeyedSubscript:@"tcpProxyFqdn"];
                    [(NSPPrivacyProxyProxyInfo *)v197 setTcpProxyFqdn:v239];
                  }
                }
                uint64_t v240 = [v196 objectForKeyedSubscript:@"preferredPathConfigUri"];
                if (v240)
                {
                  v241 = (void *)v240;
                  v242 = [v196 objectForKeyedSubscript:@"preferredPathConfigUri"];
                  objc_opt_class();
                  char v243 = objc_opt_isKindOfClass();

                  if (v243)
                  {
                    v244 = [v196 objectForKeyedSubscript:@"preferredPathConfigUri"];
                    [(NSPPrivacyProxyProxyInfo *)v197 setPreferredPathConfigUri:v244];
                  }
                }
                uint64_t v245 = [v196 objectForKeyedSubscript:@"proxyVersion"];
                if (v245)
                {
                  v246 = (void *)v245;
                  v247 = [v196 objectForKeyedSubscript:@"proxyVersion"];
                  objc_opt_class();
                  char v248 = objc_opt_isKindOfClass();

                  if (v248)
                  {
                    v249 = [v196 objectForKeyedSubscript:@"proxyVersion"];
                    [(NSPPrivacyProxyProxyInfo *)v197 setProxyVersion:v249];
                  }
                }
                uint64_t v250 = [v196 objectForKeyedSubscript:@"supportsResumption"];
                if (v250)
                {
                  v251 = (void *)v250;
                  v252 = [v196 objectForKeyedSubscript:@"supportsResumption"];
                  objc_opt_class();
                  char v253 = objc_opt_isKindOfClass();

                  if (v253)
                  {
                    v254 = [v196 objectForKeyedSubscript:@"supportsResumption"];
                    -[NSPPrivacyProxyProxyInfo setSupportsResumption:](v197, "setSupportsResumption:", [v254 BOOLValue]);
                  }
                }
                uint64_t v255 = [v196 objectForKeyedSubscript:@"fallbackSupportsUDPProxying"];
                if (v255)
                {
                  v256 = (void *)v255;
                  v257 = [v196 objectForKeyedSubscript:@"fallbackSupportsUDPProxying"];
                  objc_opt_class();
                  char v258 = objc_opt_isKindOfClass();

                  if (v258)
                  {
                    v259 = [v196 objectForKeyedSubscript:@"fallbackSupportsUDPProxying"];
                    -[NSPPrivacyProxyProxyInfo setFallbackSupportsUDPProxying:](v197, "setFallbackSupportsUDPProxying:", [v259 BOOLValue]);
                  }
                }
                uint64_t v260 = [v196 objectForKeyedSubscript:@"bootstrapAddresses"];
                if (v260)
                {
                  v261 = (void *)v260;
                  v262 = [v196 objectForKeyedSubscript:@"bootstrapAddresses"];
                  objc_opt_class();
                  char v263 = objc_opt_isKindOfClass();

                  if (v263)
                  {
                    v264 = [v196 objectForKeyedSubscript:@"bootstrapAddresses"];
                    long long v734 = 0u;
                    long long v735 = 0u;
                    long long v736 = 0u;
                    long long v737 = 0u;
                    id v265 = v264;
                    uint64_t v266 = [v265 countByEnumeratingWithState:&v734 objects:v795 count:16];
                    if (v266)
                    {
                      uint64_t v267 = v266;
                      uint64_t v268 = *(void *)v735;
                      do
                      {
                        for (juint64_t j = 0; jj != v267; ++jj)
                        {
                          if (*(void *)v735 != v268) {
                            objc_enumerationMutation(v265);
                          }
                          uint64_t v270 = *(void *)(*((void *)&v734 + 1) + 8 * jj);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            [(NSPPrivacyProxyProxyInfo *)v197 addBootstrapAddresses:v270];
                          }
                        }
                        uint64_t v267 = [v265 countByEnumeratingWithState:&v734 objects:v795 count:16];
                      }
                      while (v267);
                    }
                  }
                }
                uint64_t v271 = [v196 objectForKeyedSubscript:@"allowedNextHops"];
                if (v271)
                {
                  v272 = (void *)v271;
                  v273 = [v196 objectForKeyedSubscript:@"allowedNextHops"];
                  objc_opt_class();
                  char v274 = objc_opt_isKindOfClass();

                  if (v274)
                  {
                    v275 = [v196 objectForKeyedSubscript:@"allowedNextHops"];
                    long long v730 = 0u;
                    long long v731 = 0u;
                    long long v732 = 0u;
                    long long v733 = 0u;
                    id v276 = v275;
                    uint64_t v277 = [v276 countByEnumeratingWithState:&v730 objects:v794 count:16];
                    if (v277)
                    {
                      uint64_t v278 = v277;
                      uint64_t v279 = *(void *)v731;
                      do
                      {
                        for (kuint64_t k = 0; kk != v278; ++kk)
                        {
                          if (*(void *)v731 != v279) {
                            objc_enumerationMutation(v276);
                          }
                          uint64_t v281 = *(void *)(*((void *)&v730 + 1) + 8 * kk);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            [(NSPPrivacyProxyProxyInfo *)v197 addAllowedNextHops:v281];
                          }
                        }
                        uint64_t v278 = [v276 countByEnumeratingWithState:&v730 objects:v794 count:16];
                      }
                      while (v278);
                    }
                  }
                }
                uint64_t v282 = [v196 objectForKeyedSubscript:@"tokenChallenge"];
                if (v282)
                {
                  v283 = (void *)v282;
                  v284 = [v196 objectForKeyedSubscript:@"tokenChallenge"];
                  objc_opt_class();
                  char v285 = objc_opt_isKindOfClass();

                  if (v285)
                  {
                    v286 = [v196 objectForKeyedSubscript:@"tokenChallenge"];
                    [(NSPPrivacyProxyProxyInfo *)v197 setTokenChallenge:v286];
                  }
                }
                uint64_t v287 = [v196 objectForKeyedSubscript:@"preferredPathPatterns"];
                if (v287)
                {
                  v288 = (void *)v287;
                  v289 = [v196 objectForKeyedSubscript:@"preferredPathPatterns"];
                  objc_opt_class();
                  char v290 = objc_opt_isKindOfClass();

                  if (v290)
                  {
                    v291 = [v196 objectForKeyedSubscript:@"preferredPathPatterns"];
                    long long v726 = 0u;
                    long long v727 = 0u;
                    long long v728 = 0u;
                    long long v729 = 0u;
                    id v292 = v291;
                    uint64_t v293 = [v292 countByEnumeratingWithState:&v726 objects:v793 count:16];
                    if (v293)
                    {
                      uint64_t v294 = v293;
                      uint64_t v295 = *(void *)v727;
                      do
                      {
                        for (muint64_t m = 0; mm != v294; ++mm)
                        {
                          if (*(void *)v727 != v295) {
                            objc_enumerationMutation(v292);
                          }
                          uint64_t v297 = *(void *)(*((void *)&v726 + 1) + 8 * mm);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            [(NSPPrivacyProxyProxyInfo *)v197 addPreferredPathPatterns:v297];
                          }
                        }
                        uint64_t v294 = [v292 countByEnumeratingWithState:&v726 objects:v793 count:16];
                      }
                      while (v294);
                    }
                  }
                }
                uint64_t v298 = [v196 objectForKeyedSubscript:@"algorithm"];
                if (v298)
                {
                  v299 = (void *)v298;
                  v300 = [v196 objectForKeyedSubscript:@"algorithm"];
                  objc_opt_class();
                  char v301 = objc_opt_isKindOfClass();

                  if (v301)
                  {
                    id v302 = [v196 objectForKeyedSubscript:@"algorithm"];
                    if ([v302 isEqualToString:@"NOT_SET"])
                    {
                      uint64_t v303 = 0;
                    }
                    else if ([v302 isEqualToString:@"P384"])
                    {
                      uint64_t v303 = 1;
                    }
                    else if ([v302 isEqualToString:@"X25519"])
                    {
                      uint64_t v303 = 2;
                    }
                    else
                    {
                      uint64_t v303 = 0;
                    }

                    [(NSPPrivacyProxyProxyInfo *)v197 setAlgorithm:v303];
                  }
                }

                uint64_t v194 = v653;
                uint64_t v193 = v658;
              }
              ++v195;
            }
            while (v195 != v193);
            uint64_t v193 = [v664 countByEnumeratingWithState:&v742 objects:v797 count:16];
          }
          while (v193);
        }

        id v8 = v635;
      }
    }
    uint64_t v304 = [v8 objectForKeyedSubscript:@"pathWeights"];
    if (v304)
    {
      v305 = (void *)v304;
      v306 = [v8 objectForKeyedSubscript:@"pathWeights"];
      objc_opt_class();
      char v307 = objc_opt_isKindOfClass();

      if (v307)
      {
        v308 = [v8 objectForKeyedSubscript:@"pathWeights"];
        long long v722 = 0u;
        long long v723 = 0u;
        long long v724 = 0u;
        long long v725 = 0u;
        id v309 = v308;
        uint64_t v310 = [v309 countByEnumeratingWithState:&v722 objects:v792 count:16];
        if (v310)
        {
          uint64_t v311 = v310;
          uint64_t v312 = *(void *)v723;
          do
          {
            for (nuint64_t n = 0; nn != v311; ++nn)
            {
              if (*(void *)v723 != v312) {
                objc_enumerationMutation(v309);
              }
              v314 = *(void **)(*((void *)&v722 + 1) + 8 * nn);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v315 = objc_alloc_init(NSPPrivacyProxyProxyPathWeight);
                [(NSPPrivacyProxyConfiguration *)v639 addPathWeights:v315];
                uint64_t v316 = [v314 objectForKeyedSubscript:@"weight"];
                if (v316)
                {
                  v317 = (void *)v316;
                  v318 = [v314 objectForKeyedSubscript:@"weight"];
                  objc_opt_class();
                  char v319 = objc_opt_isKindOfClass();

                  if (v319)
                  {
                    v320 = [v314 objectForKeyedSubscript:@"weight"];
                    -[NSPPrivacyProxyProxyPathWeight setWeight:](v315, "setWeight:", [v320 unsignedIntValue]);
                  }
                }
                uint64_t v321 = [v314 objectForKeyedSubscript:@"proxies"];
                if (v321)
                {
                  v322 = (void *)v321;
                  v323 = [v314 objectForKeyedSubscript:@"proxies"];
                  objc_opt_class();
                  char v324 = objc_opt_isKindOfClass();

                  if (v324)
                  {
                    v325 = [v314 objectForKeyedSubscript:@"proxies"];
                    long long v718 = 0u;
                    long long v719 = 0u;
                    long long v720 = 0u;
                    long long v721 = 0u;
                    id v326 = v325;
                    uint64_t v327 = [v326 countByEnumeratingWithState:&v718 objects:v791 count:16];
                    if (v327)
                    {
                      uint64_t v328 = v327;
                      uint64_t v329 = *(void *)v719;
                      do
                      {
                        for (uint64_t i1 = 0; i1 != v328; ++i1)
                        {
                          if (*(void *)v719 != v329) {
                            objc_enumerationMutation(v326);
                          }
                          -[NSPPrivacyProxyProxyPathWeight addProxies:](v315, "addProxies:", [*(id *)(*((void *)&v718 + 1) + 8 * i1) unsignedIntValue]);
                        }
                        uint64_t v328 = [v326 countByEnumeratingWithState:&v718 objects:v791 count:16];
                      }
                      while (v328);
                    }
                  }
                }
              }
            }
            uint64_t v311 = [v309 countByEnumeratingWithState:&v722 objects:v792 count:16];
          }
          while (v311);
        }

        id v8 = v635;
      }
    }
    uint64_t v331 = [v8 objectForKeyedSubscript:@"resolvers"];
    if (v331)
    {
      v332 = (void *)v331;
      v333 = [v8 objectForKeyedSubscript:@"resolvers"];
      objc_opt_class();
      char v334 = objc_opt_isKindOfClass();

      if (v334)
      {
        v335 = [v8 objectForKeyedSubscript:@"resolvers"];
        long long v714 = 0u;
        long long v715 = 0u;
        long long v716 = 0u;
        long long v717 = 0u;
        id v665 = v335;
        uint64_t v336 = [v665 countByEnumeratingWithState:&v714 objects:v790 count:16];
        if (v336)
        {
          uint64_t v337 = v336;
          uint64_t v338 = *(void *)v715;
          do
          {
            uint64_t v339 = 0;
            uint64_t v659 = v337;
            do
            {
              if (*(void *)v715 != v338) {
                objc_enumerationMutation(v665);
              }
              v340 = *(void **)(*((void *)&v714 + 1) + 8 * v339);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v341 = objc_alloc_init(NSPPrivacyProxyResolverInfo);
                [(NSPPrivacyProxyConfiguration *)v639 addResolvers:v341];
                uint64_t v342 = [v340 objectForKeyedSubscript:@"dohURL"];
                if (v342)
                {
                  v343 = (void *)v342;
                  v344 = [v340 objectForKeyedSubscript:@"dohURL"];
                  objc_opt_class();
                  char v345 = objc_opt_isKindOfClass();

                  if (v345)
                  {
                    v346 = [v340 objectForKeyedSubscript:@"dohURL"];
                    [(NSPPrivacyProxyResolverInfo *)v341 setDohURL:v346];
                  }
                }
                uint64_t v347 = [v340 objectForKeyedSubscript:@"obliviousDoHConfig"];
                if (v347)
                {
                  v348 = (void *)v347;
                  v349 = [v340 objectForKeyedSubscript:@"obliviousDoHConfig"];
                  objc_opt_class();
                  char v350 = objc_opt_isKindOfClass();

                  if (v350)
                  {
                    v351 = [v340 objectForKeyedSubscript:@"obliviousDoHConfig"];
                    [(NSPPrivacyProxyResolverInfo *)v341 setObliviousDoHConfig:v351];
                  }
                }
                uint64_t v352 = [v340 objectForKeyedSubscript:@"weight"];
                if (v352)
                {
                  v353 = (void *)v352;
                  v354 = [v340 objectForKeyedSubscript:@"weight"];
                  objc_opt_class();
                  char v355 = objc_opt_isKindOfClass();

                  if (v355)
                  {
                    v356 = [v340 objectForKeyedSubscript:@"weight"];
                    -[NSPPrivacyProxyResolverInfo setWeight:](v341, "setWeight:", [v356 unsignedIntValue]);
                  }
                }
                uint64_t v357 = [v340 objectForKeyedSubscript:@"proxyIndex"];
                uint64_t v337 = v659;
                if (v357)
                {
                  v358 = (void *)v357;
                  v359 = [v340 objectForKeyedSubscript:@"proxyIndex"];
                  objc_opt_class();
                  char v360 = objc_opt_isKindOfClass();

                  if (v360)
                  {
                    v361 = [v340 objectForKeyedSubscript:@"proxyIndex"];
                    -[NSPPrivacyProxyResolverInfo setProxyIndex:](v341, "setProxyIndex:", [v361 unsignedIntValue]);
                  }
                }
              }
              ++v339;
            }
            while (v337 != v339);
            uint64_t v337 = [v665 countByEnumeratingWithState:&v714 objects:v790 count:16];
          }
          while (v337);
        }

        id v8 = v635;
      }
    }
    uint64_t v362 = [v8 objectForKeyedSubscript:@"bootstrapResolver"];
    if (v362)
    {
      v363 = (void *)v362;
      v364 = [v8 objectForKeyedSubscript:@"bootstrapResolver"];
      objc_opt_class();
      char v365 = objc_opt_isKindOfClass();

      if (v365)
      {
        v366 = [v8 objectForKeyedSubscript:@"bootstrapResolver"];
        v367 = objc_alloc_init(NSPPrivacyProxyResolverInfo);
        uint64_t v368 = [v366 objectForKeyedSubscript:@"dohURL"];
        if (v368)
        {
          v369 = (void *)v368;
          v370 = [v366 objectForKeyedSubscript:@"dohURL"];
          objc_opt_class();
          char v371 = objc_opt_isKindOfClass();

          if (v371)
          {
            v372 = [v366 objectForKeyedSubscript:@"dohURL"];
            [(NSPPrivacyProxyResolverInfo *)v367 setDohURL:v372];
          }
        }
        uint64_t v373 = [v366 objectForKeyedSubscript:@"obliviousDoHConfig"];
        if (v373)
        {
          v374 = (void *)v373;
          v375 = [v366 objectForKeyedSubscript:@"obliviousDoHConfig"];
          objc_opt_class();
          char v376 = objc_opt_isKindOfClass();

          if (v376)
          {
            v377 = [v366 objectForKeyedSubscript:@"obliviousDoHConfig"];
            [(NSPPrivacyProxyResolverInfo *)v367 setObliviousDoHConfig:v377];
          }
        }
        uint64_t v378 = [v366 objectForKeyedSubscript:@"weight"];
        if (v378)
        {
          v379 = (void *)v378;
          v380 = [v366 objectForKeyedSubscript:@"weight"];
          objc_opt_class();
          char v381 = objc_opt_isKindOfClass();

          if (v381)
          {
            v382 = [v366 objectForKeyedSubscript:@"weight"];
            -[NSPPrivacyProxyResolverInfo setWeight:](v367, "setWeight:", [v382 unsignedIntValue]);
          }
        }
        uint64_t v383 = [v366 objectForKeyedSubscript:@"proxyIndex"];
        if (v383)
        {
          v384 = (void *)v383;
          v385 = [v366 objectForKeyedSubscript:@"proxyIndex"];
          objc_opt_class();
          char v386 = objc_opt_isKindOfClass();

          if (v386)
          {
            v387 = [v366 objectForKeyedSubscript:@"proxyIndex"];
            -[NSPPrivacyProxyResolverInfo setProxyIndex:](v367, "setProxyIndex:", [v387 unsignedIntValue]);
          }
        }
        [(NSPPrivacyProxyConfiguration *)v639 setBootstrapResolver:v367];
      }
    }
    uint64_t v388 = [v8 objectForKeyedSubscript:@"dnsProbe"];
    if (v388)
    {
      v389 = (void *)v388;
      v390 = [v8 objectForKeyedSubscript:@"dnsProbe"];
      objc_opt_class();
      char v391 = objc_opt_isKindOfClass();

      if (v391)
      {
        v392 = [v8 objectForKeyedSubscript:@"dnsProbe"];
        [(NSPPrivacyProxyConfiguration *)v639 setDnsProbe:v392];
      }
    }
    uint64_t v393 = [v8 objectForKeyedSubscript:@"obliviousConfigs"];
    if (v393)
    {
      v394 = (void *)v393;
      v395 = [v8 objectForKeyedSubscript:@"obliviousConfigs"];
      objc_opt_class();
      char v396 = objc_opt_isKindOfClass();

      if (v396)
      {
        v397 = [v8 objectForKeyedSubscript:@"obliviousConfigs"];
        long long v710 = 0u;
        long long v711 = 0u;
        long long v712 = 0u;
        long long v713 = 0u;
        id v398 = v397;
        uint64_t v399 = [v398 countByEnumeratingWithState:&v710 objects:v789 count:16];
        if (v399)
        {
          uint64_t v400 = v399;
          unint64_t v401 = 0x1E5A3A000uLL;
          uint64_t v402 = *(void *)v711;
          uint64_t v642 = *(void *)v711;
          id v644 = v398;
          do
          {
            uint64_t v403 = 0;
            id objb = (id)v400;
            do
            {
              if (*(void *)v711 != v402) {
                objc_enumerationMutation(v398);
              }
              v404 = *(void **)(*((void *)&v710 + 1) + 8 * v403);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v650 = v403;
                id v654 = objc_alloc_init(*(Class *)(v401 + 3256));
                -[NSPPrivacyProxyConfiguration addObliviousConfigs:](v639, "addObliviousConfigs:");
                uint64_t v405 = [v404 objectForKeyedSubscript:@"obliviousHTTPConfig"];
                if (v405)
                {
                  v406 = (void *)v405;
                  v407 = [v404 objectForKeyedSubscript:@"obliviousHTTPConfig"];
                  objc_opt_class();
                  char v408 = objc_opt_isKindOfClass();

                  if (v408)
                  {
                    v409 = [v404 objectForKeyedSubscript:@"obliviousHTTPConfig"];
                    [v654 setObliviousHTTPConfig:v409];
                  }
                }
                uint64_t v410 = [v404 objectForKeyedSubscript:@"obliviousHTTPType"];
                if (v410)
                {
                  v411 = (void *)v410;
                  v412 = [v404 objectForKeyedSubscript:@"obliviousHTTPType"];
                  objc_opt_class();
                  char v413 = objc_opt_isKindOfClass();

                  if (v413)
                  {
                    id v414 = [v404 objectForKeyedSubscript:@"obliviousHTTPType"];
                    if ([v414 isEqualToString:@"DEFAULT"])
                    {
                      uint64_t v415 = 0;
                    }
                    else if ([v414 isEqualToString:@"CHUNKED"])
                    {
                      uint64_t v415 = 1;
                    }
                    else if ([v414 isEqualToString:@"CONTEXT"])
                    {
                      uint64_t v415 = 2;
                    }
                    else
                    {
                      uint64_t v415 = 0;
                    }

                    [v654 setObliviousHTTPType:v415];
                  }
                }
                uint64_t v416 = [v404 objectForKeyedSubscript:@"transparencyKeyBundle"];
                if (v416)
                {
                  v417 = (void *)v416;
                  v418 = [v404 objectForKeyedSubscript:@"transparencyKeyBundle"];
                  objc_opt_class();
                  char v419 = objc_opt_isKindOfClass();

                  if (v419)
                  {
                    v420 = [v404 objectForKeyedSubscript:@"transparencyKeyBundle"];
                    [v654 setTransparencyKeyBundle:v420];
                  }
                }
                uint64_t v421 = [v404 objectForKeyedSubscript:@"transparencyProof"];
                if (v421)
                {
                  v422 = (void *)v421;
                  v423 = [v404 objectForKeyedSubscript:@"transparencyProof"];
                  objc_opt_class();
                  char v424 = objc_opt_isKindOfClass();

                  if (v424)
                  {
                    v425 = [v404 objectForKeyedSubscript:@"transparencyProof"];
                    [v654 setTransparencyProof:v425];
                  }
                }
                uint64_t v426 = [v404 objectForKeyedSubscript:@"transparencyInternalProof"];
                if (v426)
                {
                  v427 = (void *)v426;
                  v428 = [v404 objectForKeyedSubscript:@"transparencyInternalProof"];
                  objc_opt_class();
                  char v429 = objc_opt_isKindOfClass();

                  if (v429)
                  {
                    v430 = [v404 objectForKeyedSubscript:@"transparencyInternalProof"];
                    [v654 setTransparencyInternalProof:v430];
                  }
                }
                uint64_t v431 = [v404 objectForKeyedSubscript:@"obliviousTargets"];
                if (v431)
                {
                  v432 = (void *)v431;
                  v433 = [v404 objectForKeyedSubscript:@"obliviousTargets"];
                  objc_opt_class();
                  char v434 = objc_opt_isKindOfClass();

                  if (v434)
                  {
                    v435 = [v404 objectForKeyedSubscript:@"obliviousTargets"];
                    long long v706 = 0u;
                    long long v707 = 0u;
                    long long v708 = 0u;
                    long long v709 = 0u;
                    id v666 = v435;
                    uint64_t v436 = [v666 countByEnumeratingWithState:&v706 objects:v788 count:16];
                    if (v436)
                    {
                      uint64_t v437 = v436;
                      uint64_t v438 = *(void *)v707;
                      do
                      {
                        uint64_t v439 = 0;
                        uint64_t v660 = v437;
                        do
                        {
                          if (*(void *)v707 != v438) {
                            objc_enumerationMutation(v666);
                          }
                          v440 = *(void **)(*((void *)&v706 + 1) + 8 * v439);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v441 = objc_alloc_init(NSPPrivacyProxyObliviousTargetInfo);
                            [v654 addObliviousTargets:v441];
                            uint64_t v442 = [v440 objectForKeyedSubscript:@"targetHost"];
                            if (v442)
                            {
                              v443 = (void *)v442;
                              v444 = [v440 objectForKeyedSubscript:@"targetHost"];
                              objc_opt_class();
                              char v445 = objc_opt_isKindOfClass();

                              if (v445)
                              {
                                v446 = [v440 objectForKeyedSubscript:@"targetHost"];
                                [(NSPPrivacyProxyObliviousTargetInfo *)v441 setTargetHost:v446];
                              }
                            }
                            uint64_t v447 = [v440 objectForKeyedSubscript:@"proxyURLPath"];
                            if (v447)
                            {
                              v448 = (void *)v447;
                              v449 = [v440 objectForKeyedSubscript:@"proxyURLPath"];
                              objc_opt_class();
                              char v450 = objc_opt_isKindOfClass();

                              if (v450)
                              {
                                v451 = [v440 objectForKeyedSubscript:@"proxyURLPath"];
                                [(NSPPrivacyProxyObliviousTargetInfo *)v441 setProxyURLPath:v451];
                              }
                            }
                            uint64_t v452 = [v440 objectForKeyedSubscript:@"proxyIndex"];
                            if (v452)
                            {
                              v453 = (void *)v452;
                              v454 = [v440 objectForKeyedSubscript:@"proxyIndex"];
                              objc_opt_class();
                              char v455 = objc_opt_isKindOfClass();

                              if (v455)
                              {
                                v456 = [v440 objectForKeyedSubscript:@"proxyIndex"];
                                -[NSPPrivacyProxyObliviousTargetInfo setProxyIndex:](v441, "setProxyIndex:", [v456 unsignedIntValue]);
                              }
                            }
                            uint64_t v457 = [v440 objectForKeyedSubscript:@"weight"];
                            if (v457)
                            {
                              v458 = (void *)v457;
                              v459 = [v440 objectForKeyedSubscript:@"weight"];
                              objc_opt_class();
                              char v460 = objc_opt_isKindOfClass();

                              if (v460)
                              {
                                v461 = [v440 objectForKeyedSubscript:@"weight"];
                                -[NSPPrivacyProxyObliviousTargetInfo setWeight:](v441, "setWeight:", [v461 unsignedIntValue]);
                              }
                            }
                            uint64_t v462 = [v440 objectForKeyedSubscript:@"processes"];
                            if (v462)
                            {
                              v463 = (void *)v462;
                              v464 = [v440 objectForKeyedSubscript:@"processes"];
                              objc_opt_class();
                              char v465 = objc_opt_isKindOfClass();

                              if (v465)
                              {
                                v466 = [v440 objectForKeyedSubscript:@"processes"];
                                long long v702 = 0u;
                                long long v703 = 0u;
                                long long v704 = 0u;
                                long long v705 = 0u;
                                id v467 = v466;
                                uint64_t v468 = [v467 countByEnumeratingWithState:&v702 objects:v787 count:16];
                                if (v468)
                                {
                                  uint64_t v469 = v468;
                                  uint64_t v470 = *(void *)v703;
                                  do
                                  {
                                    for (uint64_t i2 = 0; i2 != v469; ++i2)
                                    {
                                      if (*(void *)v703 != v470) {
                                        objc_enumerationMutation(v467);
                                      }
                                      uint64_t v472 = *(void *)(*((void *)&v702 + 1) + 8 * i2);
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass()) {
                                        [(NSPPrivacyProxyObliviousTargetInfo *)v441 addProcesses:v472];
                                      }
                                    }
                                    uint64_t v469 = [v467 countByEnumeratingWithState:&v702 objects:v787 count:16];
                                  }
                                  while (v469);
                                }
                              }
                            }

                            uint64_t v437 = v660;
                          }
                          ++v439;
                        }
                        while (v439 != v437);
                        uint64_t v437 = [v666 countByEnumeratingWithState:&v706 objects:v788 count:16];
                      }
                      while (v437);
                    }

                    uint64_t v402 = v642;
                    id v398 = v644;
                    unint64_t v401 = 0x1E5A3A000;
                  }
                }

                uint64_t v400 = (uint64_t)objb;
                uint64_t v403 = v650;
              }
              ++v403;
            }
            while (v403 != v400);
            uint64_t v400 = [v398 countByEnumeratingWithState:&v710 objects:v789 count:16];
          }
          while (v400);
        }

        id v8 = v635;
      }
    }
    uint64_t v473 = [v8 objectForKeyedSubscript:@"preferredPathEnabledPercentage"];
    if (v473)
    {
      v474 = (void *)v473;
      v475 = [v8 objectForKeyedSubscript:@"preferredPathEnabledPercentage"];
      objc_opt_class();
      char v476 = objc_opt_isKindOfClass();

      if (v476)
      {
        v477 = [v8 objectForKeyedSubscript:@"preferredPathEnabledPercentage"];
        -[NSPPrivacyProxyConfiguration setPreferredPathEnabledPercentage:](v639, "setPreferredPathEnabledPercentage:", [v477 unsignedIntValue]);
      }
    }
    uint64_t v478 = [v8 objectForKeyedSubscript:@"proxiedContentMaps"];
    if (v478)
    {
      v479 = (void *)v478;
      v480 = [v8 objectForKeyedSubscript:@"proxiedContentMaps"];
      objc_opt_class();
      char v481 = objc_opt_isKindOfClass();

      if (v481)
      {
        v482 = [v8 objectForKeyedSubscript:@"proxiedContentMaps"];
        long long v698 = 0u;
        long long v699 = 0u;
        long long v700 = 0u;
        long long v701 = 0u;
        id v667 = v482;
        uint64_t v483 = [v667 countByEnumeratingWithState:&v698 objects:v786 count:16];
        if (v483)
        {
          uint64_t v484 = v483;
          v485 = @"enabled";
          uint64_t v486 = *(void *)v699;
          uint64_t v655 = *(void *)v699;
          do
          {
            uint64_t v487 = 0;
            uint64_t v661 = v484;
            do
            {
              if (*(void *)v699 != v486) {
                objc_enumerationMutation(v667);
              }
              v488 = *(void **)(*((void *)&v698 + 1) + 8 * v487);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v489 = objc_alloc_init(NSPPrivacyProxyProxiedContentMap);
                [(NSPPrivacyProxyConfiguration *)v639 addProxiedContentMaps:v489];
                uint64_t v490 = [v488 objectForKeyedSubscript:v485];
                v491 = v485;
                if (v490)
                {
                  v492 = (void *)v490;
                  v493 = [v488 objectForKeyedSubscript:v485];
                  objc_opt_class();
                  char v494 = objc_opt_isKindOfClass();

                  if (v494)
                  {
                    v495 = [v488 objectForKeyedSubscript:v485];
                    -[NSPPrivacyProxyProxiedContentMap setEnabled:](v489, "setEnabled:", [v495 BOOLValue]);
                  }
                }
                uint64_t v496 = [v488 objectForKeyedSubscript:@"systemProcessOnly"];
                if (v496)
                {
                  v497 = (void *)v496;
                  v498 = [v488 objectForKeyedSubscript:@"systemProcessOnly"];
                  objc_opt_class();
                  char v499 = objc_opt_isKindOfClass();

                  if (v499)
                  {
                    v500 = [v488 objectForKeyedSubscript:@"systemProcessOnly"];
                    -[NSPPrivacyProxyProxiedContentMap setSystemProcessOnly:](v489, "setSystemProcessOnly:", [v500 BOOLValue]);
                  }
                }
                uint64_t v501 = [v488 objectForKeyedSubscript:@"supportsReverseProxying"];
                if (v501)
                {
                  v502 = (void *)v501;
                  v503 = [v488 objectForKeyedSubscript:@"supportsReverseProxying"];
                  objc_opt_class();
                  char v504 = objc_opt_isKindOfClass();

                  if (v504)
                  {
                    v505 = [v488 objectForKeyedSubscript:@"supportsReverseProxying"];
                    -[NSPPrivacyProxyProxiedContentMap setSupportsReverseProxying:](v489, "setSupportsReverseProxying:", [v505 BOOLValue]);
                  }
                }
                uint64_t v506 = [v488 objectForKeyedSubscript:@"percentEnabled"];
                if (v506)
                {
                  v507 = (void *)v506;
                  v508 = [v488 objectForKeyedSubscript:@"percentEnabled"];
                  objc_opt_class();
                  char v509 = objc_opt_isKindOfClass();

                  if (v509)
                  {
                    v510 = [v488 objectForKeyedSubscript:@"percentEnabled"];
                    -[NSPPrivacyProxyProxiedContentMap setPercentEnabled:](v489, "setPercentEnabled:", [v510 unsignedIntValue]);
                  }
                }
                uint64_t v511 = [v488 objectForKeyedSubscript:@"resolver"];
                if (v511)
                {
                  v512 = (void *)v511;
                  v513 = [v488 objectForKeyedSubscript:@"resolver"];
                  objc_opt_class();
                  char v514 = objc_opt_isKindOfClass();

                  if (v514)
                  {
                    v515 = [v488 objectForKeyedSubscript:@"resolver"];
                    -[NSPPrivacyProxyProxiedContentMap setResolver:](v489, "setResolver:", [v515 unsignedIntValue]);
                  }
                }
                uint64_t v516 = [v488 objectForKeyedSubscript:@"identifier"];
                if (v516)
                {
                  v517 = (void *)v516;
                  v518 = [v488 objectForKeyedSubscript:@"identifier"];
                  objc_opt_class();
                  char v519 = objc_opt_isKindOfClass();

                  if (v519)
                  {
                    v520 = [v488 objectForKeyedSubscript:@"identifier"];
                    [(NSPPrivacyProxyProxiedContentMap *)v489 setIdentifier:v520];
                  }
                }
                uint64_t v521 = [v488 objectForKeyedSubscript:@"proxies"];
                if (v521)
                {
                  v522 = (void *)v521;
                  v523 = [v488 objectForKeyedSubscript:@"proxies"];
                  objc_opt_class();
                  char v524 = objc_opt_isKindOfClass();

                  if (v524)
                  {
                    v525 = [v488 objectForKeyedSubscript:@"proxies"];
                    long long v694 = 0u;
                    long long v695 = 0u;
                    long long v696 = 0u;
                    long long v697 = 0u;
                    id v526 = v525;
                    uint64_t v527 = [v526 countByEnumeratingWithState:&v694 objects:v785 count:16];
                    if (v527)
                    {
                      uint64_t v528 = v527;
                      uint64_t v529 = *(void *)v695;
                      do
                      {
                        for (uint64_t i3 = 0; i3 != v528; ++i3)
                        {
                          if (*(void *)v695 != v529) {
                            objc_enumerationMutation(v526);
                          }
                          v531 = *(void **)(*((void *)&v694 + 1) + 8 * i3);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            -[NSPPrivacyProxyProxiedContentMap addProxies:](v489, "addProxies:", [v531 unsignedIntValue]);
                          }
                        }
                        uint64_t v528 = [v526 countByEnumeratingWithState:&v694 objects:v785 count:16];
                      }
                      while (v528);
                    }
                  }
                }
                uint64_t v532 = [v488 objectForKeyedSubscript:@"hostnames"];
                if (v532)
                {
                  v533 = (void *)v532;
                  v534 = [v488 objectForKeyedSubscript:@"hostnames"];
                  objc_opt_class();
                  char v535 = objc_opt_isKindOfClass();

                  if (v535)
                  {
                    v536 = [v488 objectForKeyedSubscript:@"hostnames"];
                    long long v690 = 0u;
                    long long v691 = 0u;
                    long long v692 = 0u;
                    long long v693 = 0u;
                    id v537 = v536;
                    uint64_t v538 = [v537 countByEnumeratingWithState:&v690 objects:v784 count:16];
                    if (v538)
                    {
                      uint64_t v539 = v538;
                      uint64_t v540 = *(void *)v691;
                      do
                      {
                        for (uint64_t i4 = 0; i4 != v539; ++i4)
                        {
                          if (*(void *)v691 != v540) {
                            objc_enumerationMutation(v537);
                          }
                          uint64_t v542 = *(void *)(*((void *)&v690 + 1) + 8 * i4);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            [(NSPPrivacyProxyProxiedContentMap *)v489 addHostnames:v542];
                          }
                        }
                        uint64_t v539 = [v537 countByEnumeratingWithState:&v690 objects:v784 count:16];
                      }
                      while (v539);
                    }
                  }
                }
                uint64_t v543 = [v488 objectForKeyedSubscript:@"processes"];
                if (v543)
                {
                  v544 = (void *)v543;
                  v545 = [v488 objectForKeyedSubscript:@"processes"];
                  objc_opt_class();
                  char v546 = objc_opt_isKindOfClass();

                  if (v546)
                  {
                    v547 = [v488 objectForKeyedSubscript:@"processes"];
                    long long v686 = 0u;
                    long long v687 = 0u;
                    long long v688 = 0u;
                    long long v689 = 0u;
                    id v548 = v547;
                    uint64_t v549 = [v548 countByEnumeratingWithState:&v686 objects:v783 count:16];
                    if (v549)
                    {
                      uint64_t v550 = v549;
                      uint64_t v551 = *(void *)v687;
                      do
                      {
                        for (uint64_t i5 = 0; i5 != v550; ++i5)
                        {
                          if (*(void *)v687 != v551) {
                            objc_enumerationMutation(v548);
                          }
                          uint64_t v553 = *(void *)(*((void *)&v686 + 1) + 8 * i5);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            [(NSPPrivacyProxyProxiedContentMap *)v489 addProcesses:v553];
                          }
                        }
                        uint64_t v550 = [v548 countByEnumeratingWithState:&v686 objects:v783 count:16];
                      }
                      while (v550);
                    }
                  }
                }
                uint64_t v554 = [v488 objectForKeyedSubscript:@"urls"];
                if (v554)
                {
                  v555 = (void *)v554;
                  v556 = [v488 objectForKeyedSubscript:@"urls"];
                  objc_opt_class();
                  char v557 = objc_opt_isKindOfClass();

                  if (v557)
                  {
                    v558 = [v488 objectForKeyedSubscript:@"urls"];
                    long long v682 = 0u;
                    long long v683 = 0u;
                    long long v684 = 0u;
                    long long v685 = 0u;
                    id v559 = v558;
                    uint64_t v560 = [v559 countByEnumeratingWithState:&v682 objects:v782 count:16];
                    if (v560)
                    {
                      uint64_t v561 = v560;
                      uint64_t v562 = *(void *)v683;
                      do
                      {
                        for (uint64_t i6 = 0; i6 != v561; ++i6)
                        {
                          if (*(void *)v683 != v562) {
                            objc_enumerationMutation(v559);
                          }
                          uint64_t v564 = *(void *)(*((void *)&v682 + 1) + 8 * i6);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            [(NSPPrivacyProxyProxiedContentMap *)v489 addUrls:v564];
                          }
                        }
                        uint64_t v561 = [v559 countByEnumeratingWithState:&v682 objects:v782 count:16];
                      }
                      while (v561);
                    }
                  }
                }
                uint64_t v565 = [v488 objectForKeyedSubscript:@"matchExactHostnames"];
                if (v565)
                {
                  v566 = (void *)v565;
                  v567 = [v488 objectForKeyedSubscript:@"matchExactHostnames"];
                  objc_opt_class();
                  char v568 = objc_opt_isKindOfClass();

                  if (v568)
                  {
                    v569 = [v488 objectForKeyedSubscript:@"matchExactHostnames"];
                    -[NSPPrivacyProxyProxiedContentMap setMatchExactHostnames:](v489, "setMatchExactHostnames:", [v569 BOOLValue]);
                  }
                }
                uint64_t v570 = [v488 objectForKeyedSubscript:@"isPrivacyProxy"];
                if (v570)
                {
                  v571 = (void *)v570;
                  v572 = [v488 objectForKeyedSubscript:@"isPrivacyProxy"];
                  objc_opt_class();
                  char v573 = objc_opt_isKindOfClass();

                  if (v573)
                  {
                    v574 = [v488 objectForKeyedSubscript:@"isPrivacyProxy"];
                    -[NSPPrivacyProxyProxiedContentMap setIsPrivacyProxy:](v489, "setIsPrivacyProxy:", [v574 BOOLValue]);
                  }
                }

                v485 = v491;
                uint64_t v486 = v655;
                uint64_t v484 = v661;
              }
              ++v487;
            }
            while (v487 != v484);
            uint64_t v484 = [v667 countByEnumeratingWithState:&v698 objects:v786 count:16];
          }
          while (v484);
        }

        id v8 = v635;
      }
    }
    uint64_t v575 = [v8 objectForKeyedSubscript:@"maxTokenNum"];
    if (v575)
    {
      v576 = (void *)v575;
      v577 = [v8 objectForKeyedSubscript:@"maxTokenNum"];
      objc_opt_class();
      char v578 = objc_opt_isKindOfClass();

      if (v578)
      {
        v579 = [v8 objectForKeyedSubscript:@"maxTokenNum"];
        -[NSPPrivacyProxyConfiguration setMaxTokenNum:](v639, "setMaxTokenNum:", [v579 unsignedIntValue]);
      }
    }
    uint64_t v580 = [v8 objectForKeyedSubscript:@"regionId"];
    if (v580)
    {
      v581 = (void *)v580;
      v582 = [v8 objectForKeyedSubscript:@"regionId"];
      objc_opt_class();
      char v583 = objc_opt_isKindOfClass();

      if (v583)
      {
        v584 = [v8 objectForKeyedSubscript:@"regionId"];
        [(NSPPrivacyProxyConfiguration *)v639 setRegionId:v584];
      }
    }
    uint64_t v585 = [v8 objectForKeyedSubscript:@"fallbackPathWeights"];
    if (v585)
    {
      v586 = (void *)v585;
      v587 = [v8 objectForKeyedSubscript:@"fallbackPathWeights"];
      objc_opt_class();
      char v588 = objc_opt_isKindOfClass();

      if (v588)
      {
        v589 = [v8 objectForKeyedSubscript:@"fallbackPathWeights"];
        long long v678 = 0u;
        long long v679 = 0u;
        long long v680 = 0u;
        long long v681 = 0u;
        id v590 = v589;
        uint64_t v591 = [v590 countByEnumeratingWithState:&v678 objects:v781 count:16];
        if (v591)
        {
          uint64_t v592 = v591;
          uint64_t v593 = *(void *)v679;
          do
          {
            for (uint64_t i7 = 0; i7 != v592; ++i7)
            {
              if (*(void *)v679 != v593) {
                objc_enumerationMutation(v590);
              }
              v595 = *(void **)(*((void *)&v678 + 1) + 8 * i7);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v596 = objc_alloc_init(NSPPrivacyProxyProxyPathWeight);
                [(NSPPrivacyProxyConfiguration *)v639 addFallbackPathWeights:v596];
                uint64_t v597 = [v595 objectForKeyedSubscript:@"weight"];
                if (v597)
                {
                  v598 = (void *)v597;
                  v599 = [v595 objectForKeyedSubscript:@"weight"];
                  objc_opt_class();
                  char v600 = objc_opt_isKindOfClass();

                  if (v600)
                  {
                    v601 = [v595 objectForKeyedSubscript:@"weight"];
                    -[NSPPrivacyProxyProxyPathWeight setWeight:](v596, "setWeight:", [v601 unsignedIntValue]);
                  }
                }
                uint64_t v602 = [v595 objectForKeyedSubscript:@"proxies"];
                if (v602)
                {
                  v603 = (void *)v602;
                  v604 = [v595 objectForKeyedSubscript:@"proxies"];
                  objc_opt_class();
                  char v605 = objc_opt_isKindOfClass();

                  if (v605)
                  {
                    v606 = [v595 objectForKeyedSubscript:@"proxies"];
                    long long v674 = 0u;
                    long long v675 = 0u;
                    long long v676 = 0u;
                    long long v677 = 0u;
                    id v607 = v606;
                    uint64_t v608 = [v607 countByEnumeratingWithState:&v674 objects:v780 count:16];
                    if (v608)
                    {
                      uint64_t v609 = v608;
                      uint64_t v610 = *(void *)v675;
                      do
                      {
                        for (uint64_t i8 = 0; i8 != v609; ++i8)
                        {
                          if (*(void *)v675 != v610) {
                            objc_enumerationMutation(v607);
                          }
                          -[NSPPrivacyProxyProxyPathWeight addProxies:](v596, "addProxies:", [*(id *)(*((void *)&v674 + 1) + 8 * i8) unsignedIntValue]);
                        }
                        uint64_t v609 = [v607 countByEnumeratingWithState:&v674 objects:v780 count:16];
                      }
                      while (v609);
                    }
                  }
                }
              }
            }
            uint64_t v592 = [v590 countByEnumeratingWithState:&v678 objects:v781 count:16];
          }
          while (v592);
        }

        id v8 = v635;
      }
    }
    uint64_t v612 = [v8 objectForKeyedSubscript:@"trustedNetworkDiscoveredProxies"];
    if (v612)
    {
      v613 = (void *)v612;
      v614 = [v8 objectForKeyedSubscript:@"trustedNetworkDiscoveredProxies"];
      objc_opt_class();
      char v615 = objc_opt_isKindOfClass();

      if (v615)
      {
        [v8 objectForKeyedSubscript:@"trustedNetworkDiscoveredProxies"];
        long long v670 = 0u;
        long long v671 = 0u;
        long long v672 = 0u;
        long long v673 = 0u;
        id v616 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v617 = [v616 countByEnumeratingWithState:&v670 objects:v779 count:16];
        if (v617)
        {
          uint64_t v618 = v617;
          uint64_t v619 = *(void *)v671;
          do
          {
            for (uint64_t i9 = 0; i9 != v618; ++i9)
            {
              if (*(void *)v671 != v619) {
                objc_enumerationMutation(v616);
              }
              [(NSPPrivacyProxyConfiguration *)v639 addTrustedNetworkDiscoveredProxies:*(void *)(*((void *)&v670 + 1) + 8 * i9)];
            }
            uint64_t v618 = [v616 countByEnumeratingWithState:&v670 objects:v779 count:16];
          }
          while (v618);
        }
      }
    }
    v621 = [(NSPPrivacyProxyConfiguration *)v639 data];
    -[NSPServerClient getConnection]((uint64_t)selfa);
    v622 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v622)
    {
      xpc_object_t v623 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v623, "NSPServerCommandType", 16);
      if (v621)
      {
        id v625 = v623;
        v626 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v625, "NSPServerConfiguration", v626);
      }
      id Property = selfa;
      if (selfa) {
        id Property = objc_getProperty(selfa, v624, 16, 1);
      }
      v628 = Property;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __66__NSPServerClient_setPrivacyProxyConfiguration_completionHandler___block_invoke;
      handler[3] = &unk_1E5A3B5F8;
      v669 = v631;
      xpc_connection_send_message_with_reply(v622, v623, v628, handler);

      id v9 = v631;
    }
    else
    {
      v629 = nplog_obj();
      if (os_log_type_enabled(v629, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0FEE000, v629, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
      }

      id v9 = v631;
      ((void (**)(void, __CFString *))v631)[2](v631, @"IPC failed");
    }
  }
  else
  {
    v77 = nplog_obj();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v77, OS_LOG_TYPE_ERROR, "Failed to set the NSP configuration: configuration parameter is invalid", buf, 2u);
    }

    (*((void (**)(id, __CFString *))v9 + 2))(v9, @"invalid config dictionary");
  }
}

void __66__NSPServerClient_setPrivacyProxyConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string) {
      string = (char *)[[NSString alloc] initWithUTF8String:string];
    }
  }
  else
  {
    string = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);
  }
}

- (void)convertPrivacyProxyConfigurationWithCompletionHandler:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "converting privacy proxy configuration data into dictionary", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 30);
    if (v6)
    {
      id v12 = v10;
      xpc_object_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v12, "NSPServerConfiguration", v13);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __91__NSPServerClient_convertPrivacyProxyConfigurationWithCompletionHandler_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    id v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v21[0] = @"IPC failed";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    xpc_object_t v10 = (xpc_object_t)[v15 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v16];

    (*((void (**)(id, void, xpc_object_t))v7 + 2))(v7, 0, v10);
  }
}

void __91__NSPServerClient_convertPrivacyProxyConfigurationWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    BOOL v4 = MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590];
    id v3 = v8;
    if (v4)
    {
      uint64_t v5 = get_nsdictionary_from_xpc_object(v8, "NSPServerPrivacyProxyConfigDictionary");
      id v6 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v8);
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, v6);
      }

      id v3 = v8;
    }
  }
}

- (void)overrideProxiedContentMap:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  xpc_object_t v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "override proxied content map enabled called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v12, "NSPServerCommandType", 61);
    if (v8)
    {
      id v13 = v12;
      id v14 = v8;
      xpc_dictionary_set_string(v13, "NSPServerProxiedContentMapIdentifier", (const char *)[v14 UTF8String]);
    }
    xpc_dictionary_set_BOOL(v12, "NSPServerProxiedContentMapEnabled", a4);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v15, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __71__NSPServerClient_overrideProxiedContentMap_enabled_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v20 = v9;
    xpc_connection_send_message_with_reply(v11, v12, &self->super, handler);
  }
  else
  {
    uint64_t v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v23[0] = @"IPC failed";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    xpc_object_t v12 = (xpc_object_t)[v17 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v18];

    (*((void (**)(id, xpc_object_t))v9 + 2))(v9, v12);
  }
}

uint64_t __71__NSPServerClient_overrideProxiedContentMap_enabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getOverrideProxiedContentMapEnabled:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "get override proxied content map enabled called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 62);
    if (v6)
    {
      id v12 = v10;
      id v13 = v6;
      xpc_dictionary_set_string(v12, "NSPServerProxiedContentMapIdentifier", (const char *)[v13 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __73__NSPServerClient_getOverrideProxiedContentMapEnabled_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    id v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v21[0] = @"IPC failed";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    xpc_object_t v10 = (xpc_object_t)[v15 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v16];

    (*((void (**)(id, void, xpc_object_t))v7 + 2))(v7, 0, v10);
  }
}

void __73__NSPServerClient_getOverrideProxiedContentMapEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = xpc_dictionary_get_BOOL(v3, "NSPServerProxiedContentMapEnabled");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4, v6);
  }
}

- (void)setProxiedContentMapDoHBootstrapEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v4;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Set proxied content map DoH bootstrap enabled to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 65);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyEnabled", v4);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __77__NSPServerClient_setProxiedContentMapDoHBootstrapEnabled_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    uint64_t v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F28588];
    id v17 = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __77__NSPServerClient_setProxiedContentMapDoHBootstrapEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)overridePreferredProxy:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "override preferred proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 37);
    if (v6)
    {
      id v12 = v10;
      id v13 = v6;
      xpc_dictionary_set_string(v12, "NSPServerPrivacyProxyURL", (const char *)[v13 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__NSPServerClient_overridePreferredProxy_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    id v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v21[0] = @"IPC failed";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    xpc_object_t v10 = (xpc_object_t)[v15 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v16];

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }
}

uint64_t __60__NSPServerClient_overridePreferredProxy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getPreferredProxyWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "get preferred proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 38);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__NSPServerClient_getPreferredProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __58__NSPServerClient_getPreferredProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  string = (char *)xpc_dictionary_get_string(v6, "NSPServerPrivacyProxyURL");
  if (string) {
    string = (char *)[[NSString alloc] initWithUTF8String:string];
  }
  id v4 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v6);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, char *, void *))(v5 + 16))(v5, string, v4);
  }
}

- (void)overridePreferredResolver:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "override preferred resolver called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 43);
    if (v6)
    {
      id v12 = v10;
      id v13 = v6;
      xpc_dictionary_set_string(v12, "NSPServerPrivacyProxyURL", (const char *)[v13 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __63__NSPServerClient_overridePreferredResolver_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    id v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v21[0] = @"IPC failed";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    xpc_object_t v10 = (xpc_object_t)[v15 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v16];

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }
}

uint64_t __63__NSPServerClient_overridePreferredResolver_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getPreferredResolverWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "get preferred resolver called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 44);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __61__NSPServerClient_getPreferredResolverWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __61__NSPServerClient_getPreferredResolverWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  string = (char *)xpc_dictionary_get_string(v6, "NSPServerPrivacyProxyURL");
  if (string) {
    string = (char *)[[NSString alloc] initWithUTF8String:string];
  }
  id v4 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v6);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, char *, void *))(v5 + 16))(v5, string, v4);
  }
}

- (void)overridePreferredObliviousProxy:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "override preferred oblivious proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 68);
    if (v6)
    {
      id v12 = v10;
      id v13 = v6;
      xpc_dictionary_set_string(v12, "NSPServerPrivacyProxyURL", (const char *)[v13 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_overridePreferredObliviousProxy_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    id v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v21[0] = @"IPC failed";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    xpc_object_t v10 = (xpc_object_t)[v15 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v16];

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }
}

uint64_t __69__NSPServerClient_overridePreferredObliviousProxy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getPreferredObliviousProxyWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "get preferred oblivious proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 69);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_getPreferredObliviousProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __67__NSPServerClient_getPreferredObliviousProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  string = (char *)xpc_dictionary_get_string(v6, "NSPServerPrivacyProxyURL");
  if (string) {
    string = (char *)[[NSString alloc] initWithUTF8String:string];
  }
  id v4 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v6);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, char *, void *))(v5 + 16))(v5, string, v4);
  }
}

- (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5 completionHandler:(id)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = nplog_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEBUG, "override ingress proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v16, "NSPServerCommandType", 49);
    id v17 = v10;
    if (v17)
    {
      id v18 = v16;
      xpc_dictionary_set_string(v18, "NSPServerPrivacyProxyURL", (const char *)[v17 UTF8String]);
    }
    id v19 = v11;
    if (v19)
    {
      id v20 = v16;
      xpc_dictionary_set_string(v20, "NSPServerPrivacyProxyFallbackURL", (const char *)[v19 UTF8String]);
    }
    if (v12)
    {
      id v22 = v16;
      uint64_t v23 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v22, "NSPServerPrivacyProxyKey", v23);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v21, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __76__NSPServerClient_overrideIngressProxy_fallbackProxy_key_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v28 = v13;
    xpc_connection_send_message_with_reply(v15, v16, &self->super, handler);
  }
  else
  {
    char v24 = nplog_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v30 = *MEMORY[0x1E4F28588];
    v31[0] = @"IPC failed";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    xpc_object_t v16 = (xpc_object_t)[v25 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v26];

    (*((void (**)(id, xpc_object_t))v13 + 2))(v13, v16);
  }
}

uint64_t __76__NSPServerClient_overrideIngressProxy_fallbackProxy_key_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getOverrideIngressProxyWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "get override ingress proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 50);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __64__NSPServerClient_getOverrideIngressProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, void, void, xpc_object_t))v4 + 2))(v4, 0, 0, 0, v7);
  }
}

void __64__NSPServerClient_getOverrideIngressProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  string = (char *)xpc_dictionary_get_string(xdict, "NSPServerPrivacyProxyURL");
  if (string) {
    string = (char *)[[NSString alloc] initWithUTF8String:string];
  }
  id v4 = (char *)xpc_dictionary_get_string(xdict, "NSPServerPrivacyProxyFallbackURL");
  if (v4) {
    id v4 = (char *)[[NSString alloc] initWithUTF8String:v4];
  }
  uint64_t v5 = get_nsdata_from_xpc_object(xdict, "NSPServerPrivacyProxyKey");
  id v6 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, xdict);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, char *, char *, void *, void *))(v7 + 16))(v7, string, v4, v5, v6);
  }
}

- (void)setForceFallback:(BOOL)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "force fallback called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 46);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyForceFallback", a3);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __54__NSPServerClient_setForceFallback_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28588];
    v18[0] = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __54__NSPServerClient_setForceFallback_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getForceFallbackWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "get force fallback called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 47);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__NSPServerClient_getForceFallbackWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __57__NSPServerClient_getForceFallbackWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyForceFallback");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4, v6);
  }
}

- (void)setPrivacyProxyStatus:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  xpc_object_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v14 = @"Disabled";
    if (v4) {
      id v14 = @"Enabled";
    }
    *(_DWORD *)buf = 138412290;
    id v20 = v14;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Setting privacy proxy %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 17);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyEnabled", v4);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __59__NSPServerClient_setPrivacyProxyStatus_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v16 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28588];
    id v18 = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __59__NSPServerClient_setPrivacyProxyStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getPrivacyProxyStatusWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Requesting get privacy proxy status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 18);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __62__NSPServerClient_getPrivacyProxyStatusWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __62__NSPServerClient_getPrivacyProxyStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyEnabled");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4, v6);
  }
}

- (void)getPrivacyProxyServiceStatusTimelineWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Requesting get privacy proxy service status timeline", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 36);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __77__NSPServerClient_getPrivacyProxyServiceStatusTimelineWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __77__NSPServerClient_getPrivacyProxyServiceStatusTimelineWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  xpc_object_t v7 = get_nsdata_from_xpc_object(v3, "NSPServerPrivacyProxyServiceStatusTimeline");

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v7 error:0];
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v10);
  }
}

- (void)reportPrivacyProxyServiceStatus:(unint64_t)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  xpc_object_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Reporting privacy proxy service status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 34);
    xpc_dictionary_set_int64(v9, "NSPServerPrivacyProxyServiceStatus", a3);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_reportPrivacyProxyServiceStatus_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28588];
    v18[0] = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __69__NSPServerClient_reportPrivacyProxyServiceStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)reportPrivacyProxyNetworkStatus:(id)a3 completionHandler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Reporting privacy proxy network status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 35);
    id v12 = [v6 serialize];
    if (v12)
    {
      id v13 = v10;
      id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v13, "NSPServerPrivacyProxyNetworkStatus", v14);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_reportPrivacyProxyNetworkStatus_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v19 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    id v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F28588];
    v22[0] = @"IPC failed";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    xpc_object_t v10 = (xpc_object_t)[v16 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v17];

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }
}

uint64_t __69__NSPServerClient_reportPrivacyProxyNetworkStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getPrivacyProxyAppStatusesWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Requesting get privacy proxy app statuses", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 63);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_getPrivacyProxyAppStatusesWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, void, xpc_object_t))v4 + 2))(v4, 0, 0, v7);
  }
}

void __67__NSPServerClient_getPrivacyProxyAppStatusesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v13);
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v5 = get_nsdata_from_xpc_object(v13, "NSPServerPrivacyProxyAnyAppEnabledDate");
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v4 fromData:v5 error:0];
  }
  else
  {
    id v6 = 0;
  }

  xpc_object_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  xpc_object_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = get_nsdata_from_xpc_object(v13, "NSPServerPrivacyProxyAppStatuses");
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:v10 error:0];
  }
  else
  {
    id v11 = 0;
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, void *, void *, void *))(v12 + 16))(v12, v11, v6, v3);
  }
}

- (void)setPrivacyProxyAppStatus:(unint64_t)a3 bundleIdentifier:(id)a4 path:(id)a5 completionHandler:(id)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = nplog_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEBUG, "Reporting privacy proxy service status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v15, "NSPServerCommandType", 64);
    id v16 = [[PrivacyProxyAppStatus alloc] initWithStatus:a3 bundleID:v10 path:v11 activeDate:0];
    set_nsobject_in_xpc_object(v15, "NSPServerPrivacyProxyAppStatus", (uint64_t)v16);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v17, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __84__NSPServerClient_setPrivacyProxyAppStatus_bundleIdentifier_path_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v22 = v12;
    xpc_connection_send_message_with_reply(v14, v15, &self->super, handler);
  }
  else
  {
    id v18 = nplog_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v25[0] = @"IPC failed";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    xpc_object_t v15 = (xpc_object_t)[v19 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v20];

    (*((void (**)(id, xpc_object_t))v12 + 2))(v12, v15);
  }
}

uint64_t __84__NSPServerClient_setPrivacyProxyAppStatus_bundleIdentifier_path_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setPrivacyProxyUserTier:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  xpc_object_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (a3 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a3);
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = off_1E5A3B640[(int)a3];
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v18;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Setting user tier for privacy proxy %@", buf, 0xCu);
  }
  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 19);
    xpc_dictionary_set_uint64(v9, "NSPServerPrivacyProxyUserTier", a3);
    id v10 = [MEMORY[0x1E4F28B50] mainBundle];
    id v11 = [v10 bundleIdentifier];

    if (v11)
    {
      id v13 = v9;
      id v14 = v11;
      xpc_dictionary_set_string(v13, "NSPServerSigningIdentifier", (const char *)[v14 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v12, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __61__NSPServerClient_setPrivacyProxyUserTier_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v20 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    xpc_object_t v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F28588];
    id v22 = @"IPC failed";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    xpc_object_t v9 = (xpc_object_t)[v16 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v17];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __61__NSPServerClient_setPrivacyProxyUserTier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setFreeUserTierUntilTomorrowWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Set user tier to free until tomorrow", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 19);
    xpc_dictionary_set_uint64(v7, "NSPServerPrivacyProxyUserTier", 1uLL);
    xpc_dictionary_set_BOOL(v7, "NSPServerPrivacyProxySetUntilTomorrow", 1);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_setFreeUserTierUntilTomorrowWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, xpc_object_t))v4 + 2))(v4, v7);
  }
}

uint64_t __69__NSPServerClient_setFreeUserTierUntilTomorrowWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setPrivacyProxyTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  xpc_object_t v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v21 = a3;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, "Setting privacy proxy traffic state for traffic type %llx: %llx", buf, 0x16u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v11, "NSPServerCommandType", 21);
    xpc_dictionary_set_uint64(v11, "NSPServerPrivacyProxyTrafficMask", a3);
    xpc_dictionary_set_uint64(v11, "NSPServerPrivacyProxyTraffic", a4);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v12, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __78__NSPServerClient_setPrivacyProxyTrafficState_proxyTraffic_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v17 = v8;
    xpc_connection_send_message_with_reply(v10, v11, &self->super, handler);
  }
  else
  {
    id v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F28588];
    id v19 = @"IPC failed";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    xpc_object_t v11 = (xpc_object_t)[v14 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v15];

    (*((void (**)(id, xpc_object_t))v8 + 2))(v8, v11);
  }
}

uint64_t __78__NSPServerClient_setPrivacyProxyTrafficState_proxyTraffic_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getPrivacyProxyEffectiveUserTierWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Get effective user tier", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 42);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __73__NSPServerClient_getPrivacyProxyEffectiveUserTierWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    xpc_object_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __73__NSPServerClient_getPrivacyProxyEffectiveUserTierWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, xdict);
  if (xdict && MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590]) {
    uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "NSPServerPrivacyProxyEffectiveUserTier");
  }
  else {
    uint64_t uint64 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, uint64, v3);
  }
}

- (void)getPrivacyProxyDomainFilters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "get privacy proxy domain filters called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 58);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __48__NSPServerClient_getPrivacyProxyDomainFilters___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v11 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __48__NSPServerClient_getPrivacyProxyDomainFilters___block_invoke(uint64_t a1, void *a2)
{
  get_nsdictionary_from_xpc_object(a2, "NSPServerPrivacyProxyDomainFilters");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getPrivacyProxyPolicyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "fetching privacy proxy policy data", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 23);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __62__NSPServerClient_getPrivacyProxyPolicyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v10 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __62__NSPServerClient_getPrivacyProxyPolicyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    BOOL v4 = MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590];
    id v3 = v7;
    if (v4)
    {
      uint64_t v5 = get_nsdictionary_from_xpc_object(v7, "NSPServerPrivacyProxyPolicy");
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
      }

      id v3 = v7;
    }
  }
}

- (void)setPrivacyProxyPolicy:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "setting privacy proxy policy", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 24);
    if (v6)
    {
      id v12 = v10;
      id v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v12, "NSPServerPrivacyProxyPolicy", v13);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __59__NSPServerClient_setPrivacyProxyPolicy_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __59__NSPServerClient_setPrivacyProxyPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    xpc_object_t xdict = v3;
    if (MEMORY[0x1A622BC50](v3) == MEMORY[0x1E4F14590])
    {
      BOOL v4 = xpc_dictionary_get_BOOL(xdict, "NSPServerCommandResult");
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        (*(void (**)(uint64_t, BOOL, xpc_object_t))(v5 + 16))(v5, v4, xdict);
      }
    }
  }
  return MEMORY[0x1F4181820]();
}

- (BOOL)removePrivacyProxyPolicy
{
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)xpc_object_t v10 = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEBUG, "removing privacy proxy policy", v10, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  BOOL v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "NSPServerCommandType", 25);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
    id v7 = v6;
    BOOL v8 = v6 && MEMORY[0x1A622BC50](v6) == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v7, "NSPServerCommandResult");
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)mergePrivacyProxyPolicy:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "merging privacy proxy policy with proxy traffic state", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 31);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__NSPServerClient_mergePrivacyProxyPolicy___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __43__NSPServerClient_mergePrivacyProxyPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    BOOL v4 = MEMORY[0x1A622BC50]() == MEMORY[0x1E4F14590];
    id v3 = v8;
    if (v4)
    {
      xpc_object_t v5 = get_nsdictionary_from_xpc_object(v8, "NSPServerPrivacyProxyPolicy");
      xpc_object_t v6 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v8);
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, v6);
      }

      id v3 = v8;
    }
  }
}

- (void)locationAuthorizationStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "getting location authorization status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 26);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__NSPServerClient_locationAuthorizationStatusWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v10 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __68__NSPServerClient_locationAuthorizationStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (v3 && MEMORY[0x1A622BC50](v3) == MEMORY[0x1E4F14590])
  {
    xpc_dictionary_get_BOOL(xdict, "NSPServerCommandResult");
    uint64_t v6 = *(void *)(a1 + 32);
    if (!v6) {
      goto LABEL_8;
    }
    xpc_object_t v5 = *(void (**)(void))(v6 + 16);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      goto LABEL_8;
    }
    xpc_object_t v5 = *(void (**)(void))(v4 + 16);
  }
  v5();
LABEL_8:
  return MEMORY[0x1F4181820]();
}

- (void)setLocationMonitorInterval:(double)a3
{
  xpc_object_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "setting location monitor time interval", v8, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 27);
    xpc_dictionary_set_double(v7, "NSPServerLocationMonitorInterval", a3);
    xpc_connection_send_message(v6, v7);
  }
}

- (void)startLocationMonitor
{
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEBUG, "starting location monitor", v6, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "NSPServerCommandType", 28);
    xpc_connection_send_message(v4, v5);
  }
}

- (void)stopLocationMonitor
{
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEBUG, "stopping location monitor", v6, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "NSPServerCommandType", 29);
    xpc_connection_send_message(v4, v5);
  }
}

- (void)getPrivacyProxyInfoWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Get privacy proxy info", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 32);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__NSPServerClient_getPrivacyProxyInfoWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __60__NSPServerClient_getPrivacyProxyInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  size_t length = 0;
  data = xpc_dictionary_get_data(v3, "NSPServerPrivacyProxyInfo", &length);

  uint64_t v6 = 0;
  if (data && length)
  {
    xpc_object_t v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", data);
    uint64_t v6 = [[PrivacyProxyInfo alloc] initWithData:v7];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, PrivacyProxyInfo *, void *))(v8 + 16))(v8, v6, v4);
  }
}

- (void)setGeohashSharingPreference:(BOOL)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  xpc_object_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Set Geohash sharing preference", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 39);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyGeohashSharingEnabled", a3);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __65__NSPServerClient_setGeohashSharingPreference_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28588];
    v18[0] = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __65__NSPServerClient_setGeohashSharingPreference_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getGeohashSharingPreferenceWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Get Geohash sharing preference", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 40);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__NSPServerClient_getGeohashSharingPreferenceWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __68__NSPServerClient_getGeohashSharingPreferenceWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyGeohashSharingEnabled");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4, v6);
  }
}

- (void)setGeohashOverride:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Set Geohash override to %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 48);
    if ([v6 length]) {
      xpc_dictionary_set_string(v10, "NSPServerPrivacyProxyGeohash", (const char *)[v6 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__NSPServerClient_setGeohashOverride_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v16 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    id v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28588];
    uint64_t v18 = @"IPC failed";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    xpc_object_t v10 = (xpc_object_t)[v13 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v14];

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }
}

uint64_t __56__NSPServerClient_setGeohashOverride_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setPrivateAccessTokensEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v4;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Set private access tokens enabled state to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 54);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyPrivateAccessTokensEnabled", v4);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_setPrivateAccessTokensEnabled_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F28588];
    uint64_t v17 = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __67__NSPServerClient_setPrivateAccessTokensEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)getPrivateAccessTokensEnabledWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Get private access tokens enabled state", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 55);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __70__NSPServerClient_getPrivateAccessTokensEnabledWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, void, xpc_object_t))v4 + 2))(v4, 0, v7);
  }
}

void __70__NSPServerClient_getPrivateAccessTokensEnabledWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyPrivateAccessTokensEnabled");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4, v6);
  }
}

- (void)privateAccessTokensAllowTools:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  xpc_object_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v4;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Set private access tokens allow tools to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 56);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyPrivateAccessTokensEnabled", v4);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_privateAccessTokensAllowTools_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F28588];
    uint64_t v17 = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __67__NSPServerClient_privateAccessTokensAllowTools_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setInProcessFlowDivert:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  xpc_object_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v4;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Set in-process flow divert enabled to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 59);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyInProcessFlowDivertEnabled", v4);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__NSPServerClient_setInProcessFlowDivert_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F28588];
    uint64_t v17 = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __60__NSPServerClient_setInProcessFlowDivert_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setPreferredPathRoutingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  xpc_object_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v4;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Set preferred path routing enabled to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 57);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyEnabled", v4);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__NSPServerClient_setPreferredPathRoutingEnabled_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F28588];
    uint64_t v17 = @"IPC failed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    xpc_object_t v9 = (xpc_object_t)[v12 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v13];

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }
}

uint64_t __68__NSPServerClient_setPreferredPathRoutingEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)sendRTCReport:(int64_t)a3 errorCode:(int64_t)a4 url:(id)a5 completionHandler:(id)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = nplog_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEBUG, "send RTC report", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v14, "NSPServerCommandType", 45);
    xpc_dictionary_set_int64(v14, "NSPServerPrivacyProxyRTCReportType", a3);
    xpc_dictionary_set_int64(v14, "NSPServerPrivacyProxyRTCReportErrorCode", a4);
    if (v10)
    {
      id v16 = v14;
      id v17 = v10;
      xpc_dictionary_set_string(v16, "NSPServerPrivacyProxyRTCReportURL", (const char *)[v17 UTF8String]);
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v15, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __65__NSPServerClient_sendRTCReport_errorCode_url_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v22 = v11;
    xpc_connection_send_message_with_reply(v13, v14, &self->super, handler);
  }
  else
  {
    uint64_t v18 = nplog_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v25[0] = @"IPC failed";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    xpc_object_t v14 = (xpc_object_t)[v19 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v20];

    (*((void (**)(id, xpc_object_t))v11 + 2))(v11, v14);
  }
}

uint64_t __65__NSPServerClient_sendRTCReport_errorCode_url_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)fetchPrivateAccessTokenWithFetcher:(id)a3 completionHandler:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(bytes[0]) = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Fetching Private Access Token", (uint8_t *)bytes, 2u);
  }

  -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    selfa = self;
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 51);
    xpc_object_t xarray = xpc_array_create(0, 0);
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      id v13 = objc_getProperty(v6, v11, 56, 1);
      if (v13)
      {
        id v14 = v12;
        id v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v14, "NSPServerPrivateAccessTokenChallenge", v15);
      }
      id v17 = objc_getProperty(v6, v16, 72, 1);
      if (v17)
      {
        id v18 = v12;
        id v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v18, "NSPServerPrivateAccessTokenKey", v19);
      }
      id v21 = objc_getProperty(v6, v20, 80, 1);
      if (v21)
      {
        id v22 = v12;
        unint64_t v23 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v22, "NSPServerPrivateAccessTokenOriginNameKey", v23);
      }
    }
    else
    {
      id v21 = 0;
    }

    xpc_array_append_value(xarray, v12);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v72 = v7;
    v73 = v6;
    xpc_object_t xdict = v10;
    xpc_object_t v69 = v12;
    if (v6) {
      id Property = objc_getProperty(v6, v24, 88, 1);
    }
    else {
      id Property = 0;
    }
    id v26 = Property;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v79;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v79 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(id *)(*((void *)&v78 + 1) + 8 * v30);
          xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
          if (v31)
          {
            id v34 = objc_getProperty(v31, v32, 56, 1);
            if (v34)
            {
              id v35 = v33;
              uint64_t v36 = (void *)_CFXPCCreateXPCObjectFromCFObject();
              xpc_dictionary_set_value(v35, "NSPServerPrivateAccessTokenChallenge", v36);
            }
            id v38 = objc_getProperty(v31, v37, 72, 1);
            if (v38)
            {
              id v39 = v33;
              v40 = (void *)_CFXPCCreateXPCObjectFromCFObject();
              xpc_dictionary_set_value(v39, "NSPServerPrivateAccessTokenKey", v40);
            }
            id v31 = objc_getProperty(v31, v41, 80, 1);
            if (v31)
            {
              id v42 = v33;
              v43 = (void *)_CFXPCCreateXPCObjectFromCFObject();
              xpc_dictionary_set_value(v42, "NSPServerPrivateAccessTokenOriginNameKey", v43);
            }
          }

          xpc_array_append_value(xarray, v33);
          ++v30;
        }
        while (v28 != v30);
        uint64_t v44 = [v26 countByEnumeratingWithState:&v78 objects:v84 count:16];
        uint64_t v28 = v44;
      }
      while (v44);
    }

    id v45 = xdict;
    xpc_dictionary_set_value(xdict, "NSPServerPrivateAccessTokenChallenges", xarray);
    id v6 = v73;
    uint64_t v46 = [v73 selectedOrigin];
    if (v46)
    {
      id v47 = xdict;
      xpc_dictionary_set_string(v47, "NSPServerPrivateAccessTokenOriginName", (const char *)[v46 UTF8String]);
    }
    uint64_t v48 = [v73 bundleID];
    id v7 = v72;
    v49 = v69;
    if (v48)
    {
      id v50 = xdict;
      xpc_dictionary_set_string(v50, "NSPServerSigningIdentifier", (const char *)[v48 UTF8String]);
    }
    if (v73)
    {
      BOOL v51 = !v73[16] && v73[17] == 0;
      BOOL v52 = v51 && v73[18] == 0;
      if (!v52 || v73[19] != 0)
      {
        memset(bytes, 0, sizeof(bytes));
        [v73 auditToken];
        xpc_dictionary_set_data(xdict, "NSPServerEffectiveAuditToken", bytes, 0x20uLL);
      }
    }
    if (objc_msgSend(v73, "systemClient", v69)) {
      xpc_dictionary_set_BOOL(xdict, "NSPServerTokenSystemClient", 1);
    }
    char v54 = [v73 customAttester];

    if (v54)
    {
      id v55 = [v73 customAttester];
      uint64_t v56 = [v55 absoluteString];
      if (v56)
      {
        id v57 = xdict;
        xpc_dictionary_set_string(v57, "NSPServerPrivateAccessTokenCustomAttester", (const char *)[v56 UTF8String]);
      }
      uint64_t v58 = [v73 customAttesterHeaders];
      if (v58)
      {
        id v59 = xdict;
        uint64_t v60 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v59, "NSPServerPrivateAccessTokenCustomAttesterHeaders", v60);
      }
    }
    uint64_t v61 = [v73 auxiliaryAuthenticationCacheKey];

    if (v61)
    {
      v63 = [v73 auxiliaryAuthenticationCacheKey];
      if (v63)
      {
        id v64 = xdict;
        xpc_dictionary_set_string(v64, "NSPServerAuxiliaryAuthenticationCacheKey", (const char *)[v63 UTF8String]);
      }
    }
    if (selfa) {
      id v65 = objc_getProperty(selfa, v62, 16, 1);
    }
    else {
      id v65 = 0;
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __72__NSPServerClient_fetchPrivateAccessTokenWithFetcher_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v76 = v72;
    xpc_connection_send_message_with_reply(v9, xdict, v65, handler);
  }
  else
  {
    uint64_t v66 = nplog_obj();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      LOWORD(bytes[0]) = 0;
      _os_log_error_impl(&dword_1A0FEE000, v66, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", (uint8_t *)bytes, 2u);
    }

    id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v82 = *MEMORY[0x1E4F28588];
    uint64_t v83 = @"IPC failed";
    uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    id v45 = (void *)[v67 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v68];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v45);
  }
}

void __72__NSPServerClient_fetchPrivateAccessTokenWithFetcher_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessToken");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v6, v4);
  }
}

- (void)fetchPrivateAccessTokenPairWithFetcher:(id)a3 completionHandler:(id)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(bytes[0]) = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Fetching Private Access Token Pair", (uint8_t *)bytes, 2u);
  }

  if (v6
    && (id v10 = objc_getProperty(v6, v9, 56, 1)) != 0
    && (xpc_object_t v12 = v10,
        id v13 = objc_getProperty(v6, v11, 64, 1),
        v13,
        v12,
        v13))
  {
    -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
    id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v15, "NSPServerCommandType", 51);
      xpc_object_t xarray = xpc_array_create(0, 0);
      xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
      id v18 = objc_getProperty(v6, v17, 56, 1);
      if (v18)
      {
        id v19 = v16;
        SEL v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v19, "NSPServerPrivateAccessTokenChallenge", v20);
      }
      id v22 = objc_getProperty(v6, v21, 72, 1);
      if (v22)
      {
        id v23 = v16;
        uint64_t v24 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v23, "NSPServerPrivateAccessTokenKey", v24);
      }
      id v26 = objc_getProperty(v6, v25, 80, 1);
      if (v26)
      {
        id v27 = v16;
        uint64_t v28 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v27, "NSPServerPrivateAccessTokenOriginNameKey", v28);
      }
      xpc_array_append_value(xarray, v16);
      xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
      id v31 = objc_getProperty(v6, v30, 64, 1);
      xpc_object_t v32 = v16;
      if (v31)
      {
        id v33 = v29;
        id v34 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v33, "NSPServerPrivateAccessPairedTokenChallenge", v34);

        xpc_object_t v16 = v32;
      }

      xpc_array_append_value(xarray, v29);
      xpc_dictionary_set_value(v15, "NSPServerPrivateAccessTokenChallenges", xarray);
      id v35 = [v6 selectedOrigin];
      if (v35)
      {
        id v36 = v15;
        xpc_dictionary_set_string(v36, "NSPServerPrivateAccessTokenOriginName", (const char *)[v35 UTF8String]);

        xpc_object_t v16 = v32;
      }

      SEL v37 = [v6 bundleID];
      if (v37)
      {
        id v38 = v15;
        xpc_dictionary_set_string(v38, "NSPServerSigningIdentifier", (const char *)[v37 UTF8String]);

        xpc_object_t v16 = v32;
      }

      if (v6[16]) {
        BOOL v39 = 0;
      }
      else {
        BOOL v39 = v6[17] == 0;
      }
      if (!v39 || v6[18] != 0 || v6[19] != 0)
      {
        memset(bytes, 0, sizeof(bytes));
        [v6 auditToken];
        xpc_dictionary_set_data(v15, "NSPServerEffectiveAuditToken", bytes, 0x20uLL);
      }
      if (objc_msgSend(v6, "systemClient", xarray)) {
        xpc_dictionary_set_BOOL(v15, "NSPServerTokenSystemClient", 1);
      }
      xpc_dictionary_set_BOOL(v15, "NSPServerHasPairedTokenChallenges", 1);
      if (self) {
        self = (NSPServerClient *)objc_getProperty(self, v42, 16, 1);
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __76__NSPServerClient_fetchPrivateAccessTokenPairWithFetcher_completionHandler___block_invoke;
      handler[3] = &unk_1E5A3B5F8;
      id v51 = v7;
      xpc_connection_send_message_with_reply(v14, v15, &self->super, handler);
    }
    else
    {
      v43 = nplog_obj();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        LOWORD(bytes[0]) = 0;
        _os_log_error_impl(&dword_1A0FEE000, v43, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", (uint8_t *)bytes, 2u);
      }

      id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v53 = *MEMORY[0x1E4F28588];
      char v54 = @"IPC failed";
      id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      xpc_object_t v15 = (xpc_object_t)[v44 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v45];

      (*((void (**)(id, void, void, void, xpc_object_t))v7 + 2))(v7, 0, 0, 0, v15);
    }
  }
  else
  {
    id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v55 = *MEMORY[0x1E4F28588];
    v56[0] = @"No paired challenges found";
    id v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    id v14 = (_xpc_connection_s *)[v46 initWithDomain:@"privacyProxyErrorDomain" code:1004 userInfo:v47];

    (*((void (**)(id, void, void, void, _xpc_connection_s *))v7 + 2))(v7, 0, 0, 0, v14);
  }
}

void __76__NSPServerClient_fetchPrivateAccessTokenPairWithFetcher_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessTokenPairLongLived");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessTokenPairOneTime");
  uint64_t v5 = get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessTokenPairOneTimeSalt");
  id v6 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, void *, void *, void *))(v7 + 16))(v7, v8, v4, v5, v6);
  }
}

- (void)fetchKnownPrivateAccessTokenKeyWithFetcher:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Fetching Private Access Token key", buf, 2u);
  }

  -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 70);
    if (v6)
    {
      id v12 = objc_getProperty(v6, v11, 56, 1);
      if (v12)
      {
        id v13 = v10;
        id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v13, "NSPServerPrivateAccessTokenChallenge", v14);
      }
    }
    else
    {
      id v12 = 0;
    }

    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v15, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __80__NSPServerClient_fetchKnownPrivateAccessTokenKeyWithFetcher_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v20 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);
  }
  else
  {
    xpc_object_t v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v23[0] = @"IPC failed";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    xpc_object_t v10 = (xpc_object_t)[v17 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v18];

    (*((void (**)(id, void, xpc_object_t))v7 + 2))(v7, 0, v10);
  }
}

void __80__NSPServerClient_fetchKnownPrivateAccessTokenKeyWithFetcher_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessTokenKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v6, v4);
  }
}

- (void)addToken:(id)a3 toCacheForFetcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_INFO, "Adding Private Access Token to cache", buf, 2u);
  }

  -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
  xpc_object_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 71);
    if (v7)
    {
      id v12 = objc_getProperty(v7, v11, 56, 1);
      if (v12)
      {
        id v13 = v10;
        id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v13, "NSPServerPrivateAccessTokenChallenge", v14);
      }
    }
    else
    {
      id v12 = 0;
    }

    if (v6)
    {
      xpc_object_t v15 = v10;
      xpc_object_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v15, "NSPServerPrivateAccessToken", v16);
    }
    xpc_connection_send_message(v9, v10);
  }
  else
  {
    xpc_object_t v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v17 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", v17, 2u);
    }
  }
}

- (void)addAuxiliaryAuthenticationData:(id)a3 type:(unint64_t)a4 label:(id)a5 cacheKey:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = nplog_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_INFO, "Adding auxiliary authentication data to cache", buf, 2u);
  }

  -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
  id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v15, "NSPServerCommandType", 72);
    if (v10)
    {
      xpc_object_t v16 = v15;
      id v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v16, "NSPServerAuxiliaryAuthenticationData", v17);
    }
    id v18 = v11;
    if (v18)
    {
      id v19 = v15;
      xpc_dictionary_set_string(v19, "NSPServerAuxiliaryAuthenticationLabel", (const char *)[v18 UTF8String]);
    }
    id v20 = v12;
    if (v20)
    {
      SEL v21 = v15;
      xpc_dictionary_set_string(v21, "NSPServerAuxiliaryAuthenticationCacheKey", (const char *)[v20 UTF8String]);
    }
    xpc_dictionary_set_int64(v15, "NSPServerAuxiliaryAuthenticationType", a4);
    xpc_connection_send_message(v14, v15);
  }
  else
  {
    xpc_object_t v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", v22, 2u);
    }
  }
}

- (void)fetchAuxiliaryAuthenticationDataFromCacheForType:(unint64_t)a3 label:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = nplog_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_INFO, "Fetching auxiliary authentication data from cache", buf, 2u);
  }

  -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
  id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v15, "NSPServerCommandType", 73);
    id v16 = v10;
    if (v16)
    {
      id v17 = v15;
      xpc_dictionary_set_string(v17, "NSPServerAuxiliaryAuthenticationLabel", (const char *)[v16 UTF8String]);
    }
    id v18 = v11;
    if (v18)
    {
      id v19 = v15;
      xpc_dictionary_set_string(v19, "NSPServerAuxiliaryAuthenticationCacheKey", (const char *)[v18 UTF8String]);
    }
    xpc_dictionary_set_int64(v15, "NSPServerAuxiliaryAuthenticationType", a3);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v20, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __101__NSPServerClient_fetchAuxiliaryAuthenticationDataFromCacheForType_label_cacheKey_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v25 = v12;
    xpc_connection_send_message_with_reply(v14, v15, &self->super, handler);
  }
  else
  {
    SEL v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v27 = *MEMORY[0x1E4F28588];
    v28[0] = @"IPC failed";
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    xpc_object_t v15 = (xpc_object_t)[v22 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v23];

    (*((void (**)(id, void, xpc_object_t))v12 + 2))(v12, 0, v15);
  }
}

void __101__NSPServerClient_fetchAuxiliaryAuthenticationDataFromCacheForType_label_cacheKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  get_nsdata_from_xpc_object(v3, "NSPServerAuxiliaryAuthenticationData");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v6, v4);
  }
}

- (BOOL)checkOriginAllowedAsThirdParty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_INFO, "Checking origin for Private Access Token", buf, 2u);
  }

  -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 60);
    id v8 = v4;
    if (v8)
    {
      xpc_object_t v9 = v7;
      xpc_dictionary_set_string(v9, "NSPServerPrivateAccessTokenOriginName", (const char *)[v8 UTF8String]);
    }
    xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v6, v7);
    BOOL v11 = xpc_dictionary_get_BOOL(v10, "NSPServerPrivateAccessTokenOriginAllowed");
  }
  else
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", v13, 2u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)startProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "send start request to proxy socket based TCP connections to MPTCP converter proxy", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 52);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __72__NSPServerClient_startProxyToMPTCPConverterProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, xpc_object_t))v4 + 2))(v4, v7);
  }
}

uint64_t __72__NSPServerClient_startProxyToMPTCPConverterProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)stopProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "send stop request to proxy socket based TCP connections to MPTCP converter proxy", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 53);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __71__NSPServerClient_stopProxyToMPTCPConverterProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);
  }
  else
  {
    xpc_object_t v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28588];
    v16[0] = @"IPC failed";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    xpc_object_t v7 = (xpc_object_t)[v10 initWithDomain:@"privacyProxyErrorDomain" code:1002 userInfo:v11];

    (*((void (**)(id, xpc_object_t))v4 + 2))(v4, v7);
  }
}

uint64_t __71__NSPServerClient_stopProxyToMPTCPConverterProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)dumpPrivacyProxyTokenEventsWithCompletionHandler:(id)a3 mostRecent:(BOOL)a4 limit:(unint64_t)a5 dumpStats:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  -[NSPServerClient getConnection]((uint64_t)self);
  id v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v15, "NSPServerCommandType", 66);
    id v16 = v12;
    if (v16)
    {
      id v17 = v15;
      xpc_dictionary_set_string(v17, "NSPServerPrivacyProxyTokenEventsVendor", (const char *)[v16 UTF8String]);
    }
    xpc_dictionary_set_BOOL(v15, "NSPServerPrivacyProxyTokenEventsMostRecent", a4);
    xpc_dictionary_set_uint64(v15, "NSPServerPrivacyProxyTokenEventsLimit", a5);
    xpc_dictionary_set_BOOL(v15, "NSPServerPrivacyProxyTokenEventsStats", a6);
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v18, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __113__NSPServerClient_dumpPrivacyProxyTokenEventsWithCompletionHandler_mostRecent_limit_dumpStats_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v20 = v13;
    xpc_connection_send_message_with_reply(v14, v15, &self->super, handler);
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

uint64_t __113__NSPServerClient_dumpPrivacyProxyTokenEventsWithCompletionHandler_mostRecent_limit_dumpStats_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  get_nsarray_from_xpc_object(a2, "NSPServerPrivacyProxyTokenEvents");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setPrivacyProxyTokenEventsProactiveTokenFetchParams:(id)a3 lowerTokenCountThresholdStr:(id)a4 lowerTokenCountProbabilityStr:(id)a5 statsDurationStr:(id)a6 upperLWMCountThresholdStr:(id)a7 upperLWMCountProbabilityOffsetStr:(id)a8 completionHandler:(id)a9
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v37 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v36 = a8;
  id v19 = a9;
  -[NSPServerClient getConnection]((uint64_t)self);
  id v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v21, "NSPServerCommandType", 67);
    id v23 = v15;
    if (v15)
    {
      uint64_t v24 = [v15 caseInsensitiveCompare:@"Yes"];
      if (!v24 || ![v15 caseInsensitiveCompare:@"No"]) {
        xpc_dictionary_set_BOOL(v21, "NSPServerPrivacyProxyTokenEventsEnableProactiveTokenFetch", v24 == 0);
      }
    }
    id v25 = v17;
    if (v17)
    {
      int64_t v26 = [v17 integerValue];
      if (v26 >= 1) {
        xpc_dictionary_set_uint64(v21, "NSPServerPrivacyProxyTokenEventsSetStatsDuration", v26);
      }
    }
    uint64_t v28 = v36;
    uint64_t v27 = v37;
    if (v37)
    {
      int64_t v29 = [v37 integerValue];
      if (v29 >= 1) {
        xpc_dictionary_set_uint64(v21, "NSPServerPrivacyProxyTokenEventsSetLowerTokenCountThreshold", v29);
      }
    }
    if (v16)
    {
      [v16 doubleValue];
      if (v30 >= 0.0 && v30 <= 1.0) {
        xpc_dictionary_set_double(v21, "NSPServerPrivacyProxyTokenEventsSetLowerTokenCountProbability", v30);
      }
    }
    if (v18)
    {
      int64_t v31 = [v18 integerValue];
      if (v31 >= 1) {
        xpc_dictionary_set_uint64(v21, "NSPServerPrivacyProxyTokenEventsSetUpperLWMCountThreshold", v31);
      }
    }
    if (v36)
    {
      [v36 doubleValue];
      if (v32 >= 0.0 && v32 <= 1.0) {
        xpc_dictionary_set_double(v21, "NSPServerPrivacyProxyTokenEventsSetUpperLWMCountProbabilityOffset", v32);
      }
    }
    if (self) {
      self = (NSPServerClient *)objc_getProperty(self, v22, 16, 1);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __224__NSPServerClient_setPrivacyProxyTokenEventsProactiveTokenFetchParams_lowerTokenCountThresholdStr_lowerTokenCountProbabilityStr_statsDurationStr_upperLWMCountThresholdStr_upperLWMCountProbabilityOffsetStr_completionHandler___block_invoke;
    handler[3] = &unk_1E5A3B5F8;
    id v40 = v19;
    xpc_connection_send_message_with_reply(v20, v21, &self->super, handler);
  }
  else
  {
    id v23 = v15;
    id v33 = nplog_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v33, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v41 = *MEMORY[0x1E4F28588];
    v42[0] = @"IPC failed";
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    xpc_object_t v21 = (xpc_object_t)[v34 initWithDomain:@"privacyProxyErrorDomain" code:1004 userInfo:v35];

    (*((void (**)(id, xpc_object_t))v19 + 2))(v19, v21);
    id v25 = v17;
    uint64_t v28 = v36;
    uint64_t v27 = v37;
  }
}

uint64_t __224__NSPServerClient_setPrivacyProxyTokenEventsProactiveTokenFetchParams_lowerTokenCountThresholdStr_lowerTokenCountProbabilityStr_statsDurationStr_upperLWMCountThresholdStr_upperLWMCountProbabilityOffsetStr_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTokenConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end