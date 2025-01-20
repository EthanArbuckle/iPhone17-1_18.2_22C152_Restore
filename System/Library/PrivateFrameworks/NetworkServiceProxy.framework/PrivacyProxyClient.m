@interface PrivacyProxyClient
+ (BOOL)currentProcessShouldUseOpaqueProxying;
+ (id)getServerConnection;
+ (void)getAppStatuses:(id)a3 completionHandler:(id)a4;
+ (void)getEffectiveUserTier:(id)a3 completionHandler:(id)a4;
+ (void)getForceFallback:(id)a3 completionHandler:(id)a4;
+ (void)getGeohashSharingPreference:(id)a3 completionHandler:(id)a4;
+ (void)getOverriddeIngressProxy:(id)a3 completionHandler:(id)a4;
+ (void)getPreferredProxy:(id)a3 completionHandler:(id)a4;
+ (void)getPreferredResolver:(id)a3 completionHandler:(id)a4;
+ (void)getPrivacyProxyAccountType:(id)a3 completionHandler:(id)a4;
+ (void)getPrivacyProxyAccountTypeExtended:(id)a3 completionHandler:(id)a4;
+ (void)getPrivateAccessTokensEnabled:(id)a3 completionHandler:(id)a4;
+ (void)getServiceStatus:(id)a3 completionHandler:(id)a4;
+ (void)getServiceStatusTimeline:(id)a3 completionHandler:(id)a4;
+ (void)getStatus:(id)a3 completionHandler:(id)a4;
+ (void)getTrafficState:(id)a3 completionandler:(id)a4;
+ (void)getUserTier:(id)a3 completionHandler:(id)a4;
+ (void)getUserTierExtended:(id)a3 completionHandler:(id)a4;
+ (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5 queue:(id)a6 completionHandler:(id)a7;
+ (void)overridePreferredProxy:(id)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)overridePreferredResolver:(id)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)reportCellularNetworkStatus:(BOOL)a3 networkName:(id)a4 queue:(id)a5 completionHandler:(id)a6;
+ (void)reportWiFiNetworkStatus:(BOOL)a3 networkName:(id)a4 queue:(id)a5 completionHandler:(id)a6;
+ (void)setAppStatus:(unint64_t)a3 bundleIdentifier:(id)a4 queue:(id)a5 completionHandler:(id)a6;
+ (void)setAppStatus:(unint64_t)a3 path:(id)a4 queue:(id)a5 completionHandler:(id)a6;
+ (void)setEnabled:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)setForceFallback:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)setFreeUserTierUntilTomorrow:(id)a3 completionHandler:(id)a4;
+ (void)setGeohashSharingPreference:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)setPrivateAccessTokensEnabled:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)setTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6;
+ (void)setUserTier:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5;
@end

@implementation PrivacyProxyClient

uint64_t __41__PrivacyProxyClient_getServerConnection__block_invoke()
{
  qword_1EB53BDA8 = (uint64_t)-[NSPServerClient initWithCallbackQueue:]([NSPServerClient alloc], 0);
  return MEMORY[0x1F41817F8]();
}

void __67__PrivacyProxyClient_getPrivacyProxyAccountType_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__PrivacyProxyClient_getPrivacyProxyAccountType_completionHandler___block_invoke_2;
      block[3] = &unk_1E5A3B8A8;
      id v11 = v8;
      uint64_t v12 = a2;
      id v10 = v6;
      dispatch_async(v7, block);
    }
  }
}

void __52__PrivacyProxyClient_getUserTier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PrivacyProxyClient_getUserTier_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B8A8;
  v7 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = a2;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __55__PrivacyProxyClient_getTrafficState_completionandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PrivacyProxyClient_getTrafficState_completionandler___block_invoke_2;
  block[3] = &unk_1E5A3B8A8;
  id v6 = *(NSObject **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __59__PrivacyProxyClient_currentProcessShouldUseOpaqueProxying__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v0 bundleIdentifier];

  if (v4)
  {
    v1 = objc_msgSend(&unk_1EF43BE68, "objectForKeyedSubscript:");
    v2 = v1;
    if (v1) {
      qword_1EB53BDB8 = [v1 unsignedLongLongValue];
    }
  }
  return MEMORY[0x1F4181820]();
}

+ (void)getServiceStatus:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getServiceStatus:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getServiceStatus:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PrivacyProxyClient_getServiceStatus_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B858;
  uint64_t v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyServiceStatusWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

+ (void)getPrivacyProxyAccountType:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPrivacyProxyAccountType:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPrivacyProxyAccountType:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PrivacyProxyClient_getPrivacyProxyAccountType_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B948;
  uint64_t v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyAccountTypeWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

+ (void)getTrafficState:(id)a3 completionandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getTrafficState:completionandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getTrafficState:completionandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PrivacyProxyClient_getTrafficState_completionandler___block_invoke;
  v11[3] = &unk_1E5A3B920;
  uint64_t v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyTrafficStateWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

+ (id)getServerConnection
{
  self;
  if (qword_1EB53BDB0 != -1) {
    dispatch_once(&qword_1EB53BDB0, &__block_literal_global_5);
  }
  v0 = (void *)qword_1EB53BDA8;
  return v0;
}

void __57__PrivacyProxyClient_getServiceStatus_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PrivacyProxyClient_getServiceStatus_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B830;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

+ (BOOL)currentProcessShouldUseOpaqueProxying
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1EB53BDC0 != -1) {
    dispatch_once(&qword_1EB53BDC0, &__block_literal_global_13);
  }
  if (!qword_1EB53BDB8) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_35);
  if (currentProcessShouldUseOpaqueProxying_reverseProxyToken == -1)
  {
    uint32_t v2 = notify_register_check("networkserviceproxy-reverse-proxy", &currentProcessShouldUseOpaqueProxying_reverseProxyToken);
    if (v2)
    {
      uint32_t v3 = v2;
      currentProcessShouldUseOpaqueProxying_reverseProxyToken = -1;
      uint64_t v4 = nplog_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "networkserviceproxy-reverse-proxy";
        __int16 v13 = 1024;
        int v14 = v3;
        _os_log_error_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", buf, 0x12u);
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_35);
  if (currentProcessShouldUseOpaqueProxying_reverseProxyToken < 0) {
    return 0;
  }
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(currentProcessShouldUseOpaqueProxying_reverseProxyToken, &state64);
  if (state)
  {
    uint32_t v6 = state;
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "networkserviceproxy-reverse-proxy";
      __int16 v13 = 1024;
      int v14 = currentProcessShouldUseOpaqueProxying_reverseProxyToken;
      __int16 v15 = 1024;
      uint32_t v16 = v6;
      _os_log_error_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_ERROR, "Failed to get the state of notification %s, token %d: %u", buf, 0x18u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_35);
    notify_cancel(currentProcessShouldUseOpaqueProxying_reverseProxyToken);
    currentProcessShouldUseOpaqueProxying_reverseProxyToken = -1;
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_35);
    return 0;
  }
  if ((qword_1EB53BDB8 & state64) == 0) {
    return 0;
  }
  id v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_INFO, "Should use opaque proxying (from notify status)", buf, 2u);
  }

  return 1;
}

+ (void)getUserTier:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "+[PrivacyProxyClient getUserTier:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "+[PrivacyProxyClient getUserTier:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PrivacyProxyClient_getUserTier_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B8D0;
  id v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyUserTierWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

uint64_t __67__PrivacyProxyClient_getPrivacyProxyAccountType_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __57__PrivacyProxyClient_getServiceStatus_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __55__PrivacyProxyClient_getTrafficState_completionandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __52__PrivacyProxyClient_getUserTier_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

+ (void)setEnabled:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = +[PrivacyProxyClient getServerConnection]();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PrivacyProxyClient_setEnabled_queue_completionHandler___block_invoke;
  v12[3] = &unk_1E5A3B7B8;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 setPrivacyProxyStatus:v6 completionHandler:v12];
}

void __57__PrivacyProxyClient_setEnabled_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __57__PrivacyProxyClient_setEnabled_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5A3B790;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __57__PrivacyProxyClient_setEnabled_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getStatus:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "+[PrivacyProxyClient getStatus:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "+[PrivacyProxyClient getStatus:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__PrivacyProxyClient_getStatus_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B808;
  id v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyStatusWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __50__PrivacyProxyClient_getStatus_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PrivacyProxyClient_getStatus_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B7E0;
  id v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __50__PrivacyProxyClient_getStatus_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (void)getServiceStatusTimeline:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "+[PrivacyProxyClient getServiceStatusTimeline:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "+[PrivacyProxyClient getServiceStatusTimeline:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PrivacyProxyClient_getServiceStatusTimeline_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B880;
  char v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyServiceStatusTimelineWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __65__PrivacyProxyClient_getServiceStatusTimeline_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PrivacyProxyClient_getServiceStatusTimeline_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B830;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __65__PrivacyProxyClient_getServiceStatusTimeline_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)reportWiFiNetworkStatus:(BOOL)a3 networkName:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (!v9)
  {
    nplog_obj();
    id v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportWiFiNetworkStatus:networkName:queue:completionHandler:]";
    __int16 v15 = "%s called with null networkName";
LABEL_12:
    _os_log_fault_impl(&dword_1A0FEE000, &v13->super, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v10)
  {
    nplog_obj();
    id v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportWiFiNetworkStatus:networkName:queue:completionHandler:]";
    __int16 v15 = "%s called with null queue";
    goto LABEL_12;
  }
  if (!v11)
  {
    nplog_obj();
    id v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportWiFiNetworkStatus:networkName:queue:completionHandler:]";
    __int16 v15 = "%s called with null completionHandler";
    goto LABEL_12;
  }
  id v13 = [[PrivacyProxyNetworkStatus alloc] initWithStatus:v8 type:1 name:v9];
  id v14 = +[PrivacyProxyClient getServerConnection]();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__PrivacyProxyClient_reportWiFiNetworkStatus_networkName_queue_completionHandler___block_invoke;
  v16[3] = &unk_1E5A3B7B8;
  id v17 = v10;
  id v18 = v12;
  [v14 reportPrivacyProxyNetworkStatus:v13 completionHandler:v16];

LABEL_5:
}

void __82__PrivacyProxyClient_reportWiFiNetworkStatus_networkName_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PrivacyProxyClient_reportWiFiNetworkStatus_networkName_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A3B790;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __82__PrivacyProxyClient_reportWiFiNetworkStatus_networkName_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)reportCellularNetworkStatus:(BOOL)a3 networkName:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (!v9)
  {
    nplog_obj();
    id v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportCellularNetworkStatus:networkName:queue:completionHandler:]";
    __int16 v15 = "%s called with null networkName";
LABEL_12:
    _os_log_fault_impl(&dword_1A0FEE000, &v13->super, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v10)
  {
    nplog_obj();
    id v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportCellularNetworkStatus:networkName:queue:completionHandler:]";
    __int16 v15 = "%s called with null queue";
    goto LABEL_12;
  }
  if (!v11)
  {
    nplog_obj();
    id v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportCellularNetworkStatus:networkName:queue:completionHandler:]";
    __int16 v15 = "%s called with null completionHandler";
    goto LABEL_12;
  }
  id v13 = [[PrivacyProxyNetworkStatus alloc] initWithStatus:v8 type:2 name:v9];
  id v14 = +[PrivacyProxyClient getServerConnection]();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__PrivacyProxyClient_reportCellularNetworkStatus_networkName_queue_completionHandler___block_invoke;
  v16[3] = &unk_1E5A3B7B8;
  id v17 = v10;
  id v18 = v12;
  [v14 reportPrivacyProxyNetworkStatus:v13 completionHandler:v16];

LABEL_5:
}

void __86__PrivacyProxyClient_reportCellularNetworkStatus_networkName_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PrivacyProxyClient_reportCellularNetworkStatus_networkName_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A3B790;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __86__PrivacyProxyClient_reportCellularNetworkStatus_networkName_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)setUserTier:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[PrivacyProxyClient getServerConnection]();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PrivacyProxyClient_setUserTier_queue_completionHandler___block_invoke;
  v12[3] = &unk_1E5A3B7B8;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 setPrivacyProxyUserTier:a3 completionHandler:v12];
}

void __58__PrivacyProxyClient_setUserTier_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __58__PrivacyProxyClient_setUserTier_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5A3B790;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __58__PrivacyProxyClient_setUserTier_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)setFreeUserTierUntilTomorrow:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PrivacyProxyClient getServerConnection]();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PrivacyProxyClient_setFreeUserTierUntilTomorrow_completionHandler___block_invoke;
  v10[3] = &unk_1E5A3B7B8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 setFreeUserTierUntilTomorrowWithCompletionHandler:v10];
}

void __69__PrivacyProxyClient_setFreeUserTierUntilTomorrow_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __69__PrivacyProxyClient_setFreeUserTierUntilTomorrow_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5A3B790;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __69__PrivacyProxyClient_setFreeUserTierUntilTomorrow_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getUserTierExtended:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "+[PrivacyProxyClient getUserTierExtended:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "+[PrivacyProxyClient getUserTierExtended:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PrivacyProxyClient_getUserTierExtended_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B8D0;
  id v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyUserTierWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __60__PrivacyProxyClient_getUserTierExtended_completionHandler___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__PrivacyProxyClient_getUserTierExtended_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5A3B8F8;
  id v8 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = a2;
  char v14 = a3;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);
}

uint64_t __60__PrivacyProxyClient_getUserTierExtended_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
}

+ (void)setTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = +[PrivacyProxyClient getServerConnection]();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PrivacyProxyClient_setTrafficState_proxyTraffic_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E5A3B7B8;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 setPrivacyProxyTrafficState:a3 proxyTraffic:a4 completionHandler:v14];
}

void __75__PrivacyProxyClient_setTrafficState_proxyTraffic_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __75__PrivacyProxyClient_setTrafficState_proxyTraffic_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5A3B790;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __75__PrivacyProxyClient_setTrafficState_proxyTraffic_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)setGeohashSharingPreference:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = +[PrivacyProxyClient getServerConnection]();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PrivacyProxyClient_setGeohashSharingPreference_queue_completionHandler___block_invoke;
  v12[3] = &unk_1E5A3B7B8;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 setGeohashSharingPreference:v6 completionHandler:v12];
}

void __74__PrivacyProxyClient_setGeohashSharingPreference_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __74__PrivacyProxyClient_setGeohashSharingPreference_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5A3B790;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __74__PrivacyProxyClient_setGeohashSharingPreference_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getGeohashSharingPreference:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getGeohashSharingPreference:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getGeohashSharingPreference:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PrivacyProxyClient_getGeohashSharingPreference_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B808;
  id v12 = v5;
  id v13 = v7;
  [v8 getGeohashSharingPreferenceWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __68__PrivacyProxyClient_getGeohashSharingPreference_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__PrivacyProxyClient_getGeohashSharingPreference_completionHandler___block_invoke_2;
      block[3] = &unk_1E5A3B7E0;
      id v10 = v7;
      char v11 = a2;
      id v9 = v5;
      dispatch_async(v6, block);
    }
  }
}

uint64_t __68__PrivacyProxyClient_getGeohashSharingPreference_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (void)getPrivacyProxyAccountTypeExtended:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getPrivacyProxyAccountTypeExtended:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getPrivacyProxyAccountTypeExtended:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PrivacyProxyClient_getPrivacyProxyAccountTypeExtended_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B948;
  id v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyAccountTypeWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __75__PrivacyProxyClient_getPrivacyProxyAccountTypeExtended_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = *(NSObject **)(a1 + 32);
  if (v8)
  {
    id v9 = *(void **)(a1 + 40);
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __75__PrivacyProxyClient_getPrivacyProxyAccountTypeExtended_completionHandler___block_invoke_2;
      v10[3] = &unk_1E5A3B970;
      id v12 = v9;
      uint64_t v13 = a2;
      uint64_t v14 = a3;
      id v11 = v7;
      dispatch_async(v8, v10);
    }
  }
}

uint64_t __75__PrivacyProxyClient_getPrivacyProxyAccountTypeExtended_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

+ (void)getEffectiveUserTier:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getEffectiveUserTier:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getEffectiveUserTier:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PrivacyProxyClient_getEffectiveUserTier_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B920;
  id v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyEffectiveUserTierWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __61__PrivacyProxyClient_getEffectiveUserTier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PrivacyProxyClient_getEffectiveUserTier_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B8A8;
  id v6 = *(NSObject **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __61__PrivacyProxyClient_getEffectiveUserTier_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

+ (void)setPrivateAccessTokensEnabled:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v17 = "+[PrivacyProxyClient setPrivateAccessTokensEnabled:queue:completionHandler:]";
    id v12 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_FAULT, v12, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v8)
  {
    uint64_t v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v17 = "+[PrivacyProxyClient setPrivateAccessTokensEnabled:queue:completionHandler:]";
    id v12 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v10 = +[PrivacyProxyClient getServerConnection]();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PrivacyProxyClient_setPrivateAccessTokensEnabled_queue_completionHandler___block_invoke;
  v13[3] = &unk_1E5A3B7B8;
  uint64_t v14 = v7;
  id v15 = v9;
  [v10 setPrivateAccessTokensEnabled:v6 completionHandler:v13];

  uint64_t v11 = v14;
LABEL_4:
}

void __76__PrivacyProxyClient_setPrivateAccessTokensEnabled_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __76__PrivacyProxyClient_setPrivateAccessTokensEnabled_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5A3B790;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __76__PrivacyProxyClient_setPrivateAccessTokensEnabled_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getPrivateAccessTokensEnabled:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getPrivateAccessTokensEnabled:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getPrivateAccessTokensEnabled:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PrivacyProxyClient_getPrivateAccessTokensEnabled_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B808;
  id v12 = v5;
  id v13 = v7;
  [v8 getPrivateAccessTokensEnabledWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __70__PrivacyProxyClient_getPrivateAccessTokensEnabled_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__PrivacyProxyClient_getPrivateAccessTokensEnabled_completionHandler___block_invoke_2;
      block[3] = &unk_1E5A3B7E0;
      id v10 = v7;
      char v11 = a2;
      id v9 = v5;
      dispatch_async(v6, block);
    }
  }
}

uint64_t __70__PrivacyProxyClient_getPrivateAccessTokensEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (void)setAppStatus:(unint64_t)a3 bundleIdentifier:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (!v9)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:bundleIdentifier:queue:completionHandler:]";
    id v15 = "%s called with null bundleIdentifier";
LABEL_12:
    _os_log_fault_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v10)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:bundleIdentifier:queue:completionHandler:]";
    id v15 = "%s called with null queue";
    goto LABEL_12;
  }
  if (!v11)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:bundleIdentifier:queue:completionHandler:]";
    id v15 = "%s called with null completionHandler";
    goto LABEL_12;
  }
  id v13 = +[PrivacyProxyClient getServerConnection]();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PrivacyProxyClient_setAppStatus_bundleIdentifier_queue_completionHandler___block_invoke;
  v16[3] = &unk_1E5A3B7B8;
  id v17 = v10;
  id v18 = v12;
  [v13 setPrivacyProxyAppStatus:a3 bundleIdentifier:v9 path:0 completionHandler:v16];

  uint64_t v14 = v17;
LABEL_5:
}

void __76__PrivacyProxyClient_setAppStatus_bundleIdentifier_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PrivacyProxyClient_setAppStatus_bundleIdentifier_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A3B790;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __76__PrivacyProxyClient_setAppStatus_bundleIdentifier_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)setAppStatus:(unint64_t)a3 path:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (!v9)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:path:queue:completionHandler:]";
    id v15 = "%s called with null path";
LABEL_12:
    _os_log_fault_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v10)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:path:queue:completionHandler:]";
    id v15 = "%s called with null queue";
    goto LABEL_12;
  }
  if (!v11)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:path:queue:completionHandler:]";
    id v15 = "%s called with null completionHandler";
    goto LABEL_12;
  }
  id v13 = +[PrivacyProxyClient getServerConnection]();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__PrivacyProxyClient_setAppStatus_path_queue_completionHandler___block_invoke;
  v16[3] = &unk_1E5A3B7B8;
  id v17 = v10;
  id v18 = v12;
  [v13 setPrivacyProxyAppStatus:a3 bundleIdentifier:0 path:v9 completionHandler:v16];

  uint64_t v14 = v17;
LABEL_5:
}

void __64__PrivacyProxyClient_setAppStatus_path_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PrivacyProxyClient_setAppStatus_path_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A3B790;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __64__PrivacyProxyClient_setAppStatus_path_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getAppStatuses:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getAppStatuses:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getAppStatuses:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PrivacyProxyClient_getAppStatuses_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B9C0;
  id v12 = v5;
  id v13 = v7;
  [v8 getPrivacyProxyAppStatusesWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __55__PrivacyProxyClient_getAppStatuses_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__PrivacyProxyClient_getAppStatuses_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5A3B998;
  id v10 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v10, v15);
}

uint64_t __55__PrivacyProxyClient_getAppStatuses_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

+ (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  if (!v14)
  {
    id v18 = nplog_obj();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    v24 = "+[PrivacyProxyClient overrideIngressProxy:fallbackProxy:key:queue:completionHandler:]";
    id v19 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_FAULT, v19, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v15)
  {
    id v18 = nplog_obj();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    v24 = "+[PrivacyProxyClient overrideIngressProxy:fallbackProxy:key:queue:completionHandler:]";
    id v19 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v17 = +[PrivacyProxyClient getServerConnection]();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__PrivacyProxyClient_overrideIngressProxy_fallbackProxy_key_queue_completionHandler___block_invoke;
  v20[3] = &unk_1E5A3B7B8;
  uint64_t v21 = v14;
  id v22 = v16;
  [v17 overrideIngressProxy:v11 fallbackProxy:v12 key:v13 completionHandler:v20];

  id v18 = v21;
LABEL_4:
}

void __85__PrivacyProxyClient_overrideIngressProxy_fallbackProxy_key_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PrivacyProxyClient_overrideIngressProxy_fallbackProxy_key_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A3B790;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __85__PrivacyProxyClient_overrideIngressProxy_fallbackProxy_key_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getOverriddeIngressProxy:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getOverriddeIngressProxy:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getOverriddeIngressProxy:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PrivacyProxyClient_getOverriddeIngressProxy_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3BA10;
  id v12 = v5;
  id v13 = v7;
  [v8 getOverrideIngressProxyWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __65__PrivacyProxyClient_getOverriddeIngressProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PrivacyProxyClient_getOverriddeIngressProxy_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B9E8;
  id v13 = *(NSObject **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v23 = v12;
  id v24 = v14;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  dispatch_async(v13, block);
}

uint64_t __65__PrivacyProxyClient_getOverriddeIngressProxy_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

+ (void)overridePreferredProxy:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v8)
  {
    id v12 = nplog_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v18 = "+[PrivacyProxyClient overridePreferredProxy:queue:completionHandler:]";
    id v13 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_FAULT, v13, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v9)
  {
    id v12 = nplog_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v18 = "+[PrivacyProxyClient overridePreferredProxy:queue:completionHandler:]";
    id v13 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v11 = +[PrivacyProxyClient getServerConnection]();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PrivacyProxyClient_overridePreferredProxy_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E5A3B7B8;
  id v15 = v8;
  id v16 = v10;
  [v11 overridePreferredProxy:v7 completionHandler:v14];

  id v12 = v15;
LABEL_4:
}

void __69__PrivacyProxyClient_overridePreferredProxy_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PrivacyProxyClient_overridePreferredProxy_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A3B790;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __69__PrivacyProxyClient_overridePreferredProxy_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getPreferredProxy:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getPreferredProxy:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getPreferredProxy:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PrivacyProxyClient_getPreferredProxy_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3BA38;
  id v12 = v5;
  id v13 = v7;
  [v8 getPreferredProxyWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __58__PrivacyProxyClient_getPreferredProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PrivacyProxyClient_getPreferredProxy_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B830;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __58__PrivacyProxyClient_getPreferredProxy_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)overridePreferredResolver:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v8)
  {
    id v12 = nplog_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v18 = "+[PrivacyProxyClient overridePreferredResolver:queue:completionHandler:]";
    id v13 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_FAULT, v13, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v9)
  {
    id v12 = nplog_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v18 = "+[PrivacyProxyClient overridePreferredResolver:queue:completionHandler:]";
    id v13 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v11 = +[PrivacyProxyClient getServerConnection]();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PrivacyProxyClient_overridePreferredResolver_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E5A3B7B8;
  id v15 = v8;
  id v16 = v10;
  [v11 overridePreferredResolver:v7 completionHandler:v14];

  id v12 = v15;
LABEL_4:
}

void __72__PrivacyProxyClient_overridePreferredResolver_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PrivacyProxyClient_overridePreferredResolver_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A3B790;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __72__PrivacyProxyClient_overridePreferredResolver_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getPreferredResolver:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getPreferredResolver:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getPreferredResolver:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PrivacyProxyClient_getPreferredResolver_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3BA38;
  id v12 = v5;
  id v13 = v7;
  [v8 getPreferredResolverWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __61__PrivacyProxyClient_getPreferredResolver_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PrivacyProxyClient_getPreferredResolver_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B830;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__PrivacyProxyClient_getPreferredResolver_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)setForceFallback:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (!v7)
  {
    id v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v17 = "+[PrivacyProxyClient setForceFallback:queue:completionHandler:]";
    id v12 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_FAULT, v12, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v8)
  {
    id v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v17 = "+[PrivacyProxyClient setForceFallback:queue:completionHandler:]";
    id v12 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v10 = +[PrivacyProxyClient getServerConnection]();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PrivacyProxyClient_setForceFallback_queue_completionHandler___block_invoke;
  v13[3] = &unk_1E5A3B7B8;
  id v14 = v7;
  id v15 = v9;
  [v10 setForceFallback:v6 completionHandler:v13];

  id v11 = v14;
LABEL_4:
}

void __63__PrivacyProxyClient_setForceFallback_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PrivacyProxyClient_setForceFallback_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5A3B790;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __63__PrivacyProxyClient_setForceFallback_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)getForceFallback:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getForceFallback:completionHandler:]";
    id v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v15 = "+[PrivacyProxyClient getForceFallback:completionHandler:]";
    id v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v8 = +[PrivacyProxyClient getServerConnection]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PrivacyProxyClient_getForceFallback_completionHandler___block_invoke;
  v11[3] = &unk_1E5A3B808;
  id v12 = v5;
  id v13 = v7;
  [v8 getForceFallbackWithCompletionHandler:v11];

  id v9 = v12;
LABEL_4:
}

void __57__PrivacyProxyClient_getForceFallback_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PrivacyProxyClient_getForceFallback_completionHandler___block_invoke_2;
  block[3] = &unk_1E5A3B7E0;
  id v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __57__PrivacyProxyClient_getForceFallback_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

@end