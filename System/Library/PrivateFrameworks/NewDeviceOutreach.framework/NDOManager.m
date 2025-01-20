@interface NDOManager
+ (void)postCAEventFor:(id)a3 eventDict:(id)a4;
- (BOOL)checkIsAvailableInStore:(id)a3;
- (BOOL)isAPSSupportedOverrideWithServerValue:(BOOL)a3;
- (NDOManager)init;
- (id)agentConnection;
- (id)clientConfiguration;
- (id)defaultDevice;
- (id)getDefaultDeviceInfoUsingForceCachedPolicy;
- (id)getDeviceInfoUsingForceCachedPolicyForSerialNumber:(id)a3;
- (id)pairedBTDevices;
- (id)pairedWatches;
- (id)payloadDictionaryForDeviceInfo:(id)a3 atIndex:(int64_t)a4;
- (id)payloadFrom:(id)a3 atIndex:(int64_t)a4 device:(id)a5;
- (void)_getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 completionBlock:(id)a6;
- (void)appSupportDictionaryWithReply:(id)a3;
- (void)appleAccountAddedWithReply:(id)a3;
- (void)apsSupportedOverride:(id)a3;
- (void)clearAllUserInitiatedFollowUpDismissalsWithReply:(id)a3;
- (void)clearUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 withReply:(id)a4;
- (void)dismissFollowUpForSerialNumber:(id)a3 completion:(id)a4;
- (void)dismissNotificationForSerialNumber:(id)a3 completion:(id)a4;
- (void)getAllFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5;
- (void)getBTDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5;
- (void)getBTPioneerDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5;
- (void)getDecodedParamsForPath:(id)a3 withReply:(id)a4;
- (void)getDefaultDeviceInfoUsingPolicy:(unint64_t)a3 withReply:(id)a4;
- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 sessionID:(id)a5 params:(id)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8;
- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 withReply:(id)a5;
- (void)getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 completionBlock:(id)a5;
- (void)getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 policy:(unint64_t)a5 params:(id)a6 salesReplyOnly:(BOOL)a7 salesInfoReply:(id)a8 deviceInfoReply:(id)a9 completionBlock:(id)a10;
- (void)getPrimaryFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5;
- (void)getWarrantyUsingPolicy:(unint64_t)a3 withReply:(id)a4;
- (void)scheduleOutreachAfter:(double)a3 withReply:(id)a4;
- (void)storeUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 withReply:(id)a4;
- (void)ulWebURLOverride:(id)a3;
- (void)webURLOverride:(id)a3;
@end

@implementation NDOManager

- (NDOManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)NDOManager;
  v2 = [(NDOManager *)&v7 init];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.newdeviceoutreach.ndoagent.devicelist", v3);
  workingQueue = v2->workingQueue;
  v2->workingQueue = (OS_dispatch_queue *)v4;

  return v2;
}

- (void)appleAccountAddedWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(NDOManager *)self agentConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__NDOManager_appleAccountAddedWithReply___block_invoke;
  v14[3] = &unk_264E26028;
  id v6 = v5;
  id v15 = v6;
  id v7 = v4;
  id v16 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__NDOManager_appleAccountAddedWithReply___block_invoke_2;
  v11[3] = &unk_264E26050;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 appleAccountAddedWithReply:v11];
}

void __41__NDOManager_appleAccountAddedWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __41__NDOManager_appleAccountAddedWithReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __41__NDOManager_appleAccountAddedWithReply___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)scheduleOutreachAfter:(double)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = [(NDOManager *)self agentConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke;
  v16[3] = &unk_264E26028;
  id v8 = v7;
  id v17 = v8;
  id v9 = v6;
  id v18 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_4;
  v13[3] = &unk_264E26050;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 scheduleOutreachAfter:v13 withReply:a3];
}

void __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_23C013000, v4, OS_LOG_TYPE_DEFAULT, "Result %d", (uint8_t *)v6, 8u);
  }

  [*(id *)(a1 + 32) invalidate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getWarrantyUsingPolicy:(unint64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__NDOManager_getWarrantyUsingPolicy_withReply___block_invoke;
  v8[3] = &unk_264E26078;
  id v9 = v6;
  id v7 = v6;
  [(NDOManager *)self getDefaultDeviceInfoUsingPolicy:a3 withReply:v8];
}

void __47__NDOManager_getWarrantyUsingPolicy_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 warranty];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)checkIsAvailableInStore:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(NDOManager *)self agentConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__NDOManager_checkIsAvailableInStore___block_invoke;
  v10[3] = &unk_264E260A0;
  id v6 = v5;
  id v11 = v6;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__NDOManager_checkIsAvailableInStore___block_invoke_6;
  v9[3] = &unk_264E260C8;
  v9[4] = &v12;
  [v7 checkIsAvailableInStore:v4 withReply:v9];

  LOBYTE(v7) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v7;
}

void __38__NDOManager_checkIsAvailableInStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __38__NDOManager_checkIsAvailableInStore___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"AppAvailabilityType"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4 == 0;

  v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)appSupportDictionaryWithReply:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  void v16[4] = __Block_byref_object_dispose_;
  id v18 = @"AppAvailabilityType";
  v19[0] = &unk_26EFA4ED0;
  id v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v5 = [(NDOManager *)self agentConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__NDOManager_appSupportDictionaryWithReply___block_invoke;
  v12[3] = &unk_264E260F0;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  id v14 = v7;
  char v15 = v16;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__NDOManager_appSupportDictionaryWithReply___block_invoke_10;
  v10[3] = &unk_264E26118;
  id v9 = v7;
  id v11 = v9;
  [v8 appSupportAvailability:@"com.apple.supportapp" withReply:v10];

  _Block_object_dispose(v16, 8);
}

void __44__NDOManager_appSupportDictionaryWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __44__NDOManager_appSupportDictionaryWithReply___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)webURLOverride:(id)a3
{
  id v4 = a3;
  v5 = [(NDOManager *)self agentConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __29__NDOManager_webURLOverride___block_invoke;
  v11[3] = &unk_264E260A0;
  id v12 = v5;
  id v6 = v5;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__NDOManager_webURLOverride___block_invoke_11;
  v9[3] = &unk_264E26140;
  id v10 = v4;
  id v8 = v4;
  [v7 readWebURLOverride:v9];
}

void __29__NDOManager_webURLOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __29__NDOManager_webURLOverride___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_23C013000, v4, OS_LOG_TYPE_DEFAULT, "webURLOverride : %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)ulWebURLOverride:(id)a3
{
  id v4 = a3;
  int v5 = [(NDOManager *)self agentConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __31__NDOManager_ulWebURLOverride___block_invoke;
  v11[3] = &unk_264E260A0;
  id v12 = v5;
  id v6 = v5;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__NDOManager_ulWebURLOverride___block_invoke_13;
  v9[3] = &unk_264E26140;
  id v10 = v4;
  id v8 = v4;
  [v7 readULWebURLOverride:v9];
}

void __31__NDOManager_ulWebURLOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __31__NDOManager_ulWebURLOverride___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_23C013000, v4, OS_LOG_TYPE_DEFAULT, "ulWebURLOverride : %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)apsSupportedOverride:(id)a3
{
  id v4 = a3;
  int v5 = [(NDOManager *)self agentConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __35__NDOManager_apsSupportedOverride___block_invoke;
  v11[3] = &unk_264E260A0;
  id v12 = v5;
  id v6 = v5;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__NDOManager_apsSupportedOverride___block_invoke_14;
  v9[3] = &unk_264E26140;
  id v10 = v4;
  id v8 = v4;
  [v7 readAPSSupportedOverride:v9];
}

void __35__NDOManager_apsSupportedOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __35__NDOManager_apsSupportedOverride___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_23C013000, v4, OS_LOG_TYPE_DEFAULT, "apsSupportedOverride : %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)isAPSSupportedOverrideWithServerValue:(BOOL)a3
{
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy_;
  v16[3] = __Block_byref_object_dispose_;
  id v17 = 0;
  if (+[NDOUtilities isInternal])
  {
    CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"isAPSSupported", @"com.apple.NewDeviceOutreach");
    id v6 = *(void **)(v16[0] + 40);
    *(void *)(v16[0] + 40) = v5;

    if (!*(void *)(v16[0] + 40))
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __52__NDOManager_isAPSSupportedOverrideWithServerValue___block_invoke;
      v12[3] = &unk_264E26168;
      id v14 = &v15;
      id v8 = v7;
      id v13 = v8;
      [(NDOManager *)self apsSupportedOverride:v12];
      dispatch_time_t v9 = dispatch_time(0, 2000000000);
      dispatch_semaphore_wait(v8, v9);
    }
  }
  if (*(void *)(v16[0] + 40))
  {
    id v10 = _NDOLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[NDOManager isAPSSupportedOverrideWithServerValue:]((uint64_t)v16, v10);
    }

    a3 = [*(id *)(v16[0] + 40) isEqualToString:@"1"];
  }
  _Block_object_dispose(&v15, 8);

  return a3;
}

void __52__NDOManager_isAPSSupportedOverrideWithServerValue___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getDecodedParamsForPath:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NDOManager *)self agentConnection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __48__NDOManager_getDecodedParamsForPath_withReply___block_invoke;
  v19[3] = &unk_264E26028;
  id v9 = v8;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v19];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__NDOManager_getDecodedParamsForPath_withReply___block_invoke_28;
  v15[3] = &unk_264E26190;
  id v16 = v6;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v6;
  [v11 getDecodedParamsForPath:v14 withReply:v15];
}

void __48__NDOManager_getDecodedParamsForPath_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __48__NDOManager_getDecodedParamsForPath_withReply___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136446722;
    id v7 = "-[NDOManager getDecodedParamsForPath:withReply:]_block_invoke";
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_23C013000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:  %{public}@ : %{public}@", (uint8_t *)&v6, 0x20u);
  }

  [*(id *)(a1 + 40) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)clientConfiguration
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v2 = [(NDOManager *)self agentConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__NDOManager_clientConfiguration__block_invoke;
  v9[3] = &unk_264E260A0;
  id v3 = v2;
  id v10 = v3;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__NDOManager_clientConfiguration__block_invoke_29;
  v8[3] = &unk_264E260C8;
  void v8[4] = &v11;
  [v4 getClientConfigurationWithReply:v8];

  uint64_t v5 = [NDOClientConfiguration alloc];
  int v6 = [(NDOClientConfiguration *)v5 initWithConfigDictionary:v12[5]];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __33__NDOManager_clientConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __33__NDOManager_clientConfiguration__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __33__NDOManager_clientConfiguration__block_invoke_29(uint64_t a1, void *a2)
{
}

- (id)defaultDevice
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v2 = [(NDOManager *)self agentConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __27__NDOManager_defaultDevice__block_invoke;
  v10[3] = &unk_264E260A0;
  id v3 = v2;
  id v11 = v3;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__NDOManager_defaultDevice__block_invoke_31;
  v9[3] = &unk_264E261B8;
  void v9[4] = &v12;
  [v4 defaultDevice:v9];

  uint64_t v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138477827;
    uint64_t v19 = v6;
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "default device: %{private}@", buf, 0xCu);
  }

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __27__NDOManager_defaultDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __27__NDOManager_defaultDevice__block_invoke_31(uint64_t a1, void *a2)
{
}

- (id)pairedWatches
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v2 = [(NDOManager *)self agentConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __27__NDOManager_pairedWatches__block_invoke;
  v10[3] = &unk_264E260A0;
  id v3 = v2;
  id v11 = v3;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__NDOManager_pairedWatches__block_invoke_33;
  v9[3] = &unk_264E261E0;
  void v9[4] = &v12;
  [v4 pairedWatches:v9];

  uint64_t v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138477827;
    uint64_t v19 = v6;
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "paired watches : %{private}@", buf, 0xCu);
  }

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __27__NDOManager_pairedWatches__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __27__NDOManager_pairedWatches__block_invoke_33(uint64_t a1, void *a2)
{
}

- (id)pairedBTDevices
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v2 = [(NDOManager *)self agentConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __29__NDOManager_pairedBTDevices__block_invoke;
  v10[3] = &unk_264E260A0;
  id v3 = v2;
  id v11 = v3;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__NDOManager_pairedBTDevices__block_invoke_35;
  v9[3] = &unk_264E261E0;
  void v9[4] = &v12;
  [v4 pairedBTDevices:v9];

  uint64_t v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v13[5];
    *(_DWORD *)buf = 138477827;
    uint64_t v19 = v6;
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "paired BTDevices : %{private}@", buf, 0xCu);
  }

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __29__NDOManager_pairedBTDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __29__NDOManager_pairedBTDevices__block_invoke_35(uint64_t a1, void *a2)
{
}

- (id)getDefaultDeviceInfoUsingForceCachedPolicy
{
  uint64_t v2 = [(NDOManager *)self agentConnection];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__NDOManager_getDefaultDeviceInfoUsingForceCachedPolicy__block_invoke;
  v8[3] = &unk_264E260A0;
  id v3 = v2;
  id v9 = v3;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__NDOManager_getDefaultDeviceInfoUsingForceCachedPolicy__block_invoke_36;
  v7[3] = &unk_264E26208;
  v7[4] = &v10;
  [v4 getDefaultDeviceInfoUsingPolicy:1 withReply:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __56__NDOManager_getDefaultDeviceInfoUsingForceCachedPolicy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __56__NDOManager_getDefaultDeviceInfoUsingForceCachedPolicy__block_invoke_36(uint64_t a1, void *a2)
{
}

- (void)getDefaultDeviceInfoUsingPolicy:(unint64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = [(NDOManager *)self agentConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__NDOManager_getDefaultDeviceInfoUsingPolicy_withReply___block_invoke;
  v14[3] = &unk_264E26028;
  id v15 = v7;
  id v8 = v6;
  id v16 = v8;
  id v9 = v7;
  uint64_t v10 = [v9 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__NDOManager_getDefaultDeviceInfoUsingPolicy_withReply___block_invoke_37;
  v12[3] = &unk_264E26078;
  id v13 = v8;
  id v11 = v8;
  [v10 getDefaultDeviceInfoUsingPolicy:a3 withReply:v12];
}

void __56__NDOManager_getDefaultDeviceInfoUsingPolicy_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __56__NDOManager_getDefaultDeviceInfoUsingPolicy_withReply___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getDeviceInfoUsingForceCachedPolicyForSerialNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(NDOManager *)self agentConnection];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__NDOManager_getDeviceInfoUsingForceCachedPolicyForSerialNumber___block_invoke;
  v11[3] = &unk_264E260A0;
  id v6 = v5;
  id v12 = v6;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__NDOManager_getDeviceInfoUsingForceCachedPolicyForSerialNumber___block_invoke_38;
  v10[3] = &unk_264E26208;
  void v10[4] = &v13;
  [v7 getDeviceInfoForSerialNumber:v4 usingPolicy:1 withReply:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __65__NDOManager_getDeviceInfoUsingForceCachedPolicyForSerialNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
}

void __65__NDOManager_getDeviceInfoUsingForceCachedPolicyForSerialNumber___block_invoke_38(uint64_t a1, void *a2)
{
}

- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 withReply:(id)a5
{
}

- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 sessionID:(id)a5 params:(id)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v18 = [(NDOManager *)self agentConnection];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __103__NDOManager_getDeviceInfoForSerialNumber_usingPolicy_sessionID_params_andForcePostFollowup_withReply___block_invoke;
  v25[3] = &unk_264E26028;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  id v20 = v18;
  id v21 = [v20 remoteObjectProxyWithErrorHandler:v25];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __103__NDOManager_getDeviceInfoForSerialNumber_usingPolicy_sessionID_params_andForcePostFollowup_withReply___block_invoke_39;
  v23[3] = &unk_264E26078;
  id v24 = v19;
  id v22 = v19;
  [v21 getDeviceInfoForSerialNumber:v17 usingPolicy:a4 sessionID:v16 params:v15 andForcePostFollowup:v8 withReply:v23];
}

void __103__NDOManager_getDeviceInfoForSerialNumber_usingPolicy_sessionID_params_andForcePostFollowup_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __103__NDOManager_getDeviceInfoForSerialNumber_usingPolicy_sessionID_params_andForcePostFollowup_withReply___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 completionBlock:(id)a5
{
}

- (id)payloadFrom:(id)a3 atIndex:(int64_t)a4 device:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 serialNumber];
  id v11 = [(NDOManager *)self defaultDevice];
  id v12 = [v11 serialNumber];
  v47 = (void *)v10;
  uint64_t v13 = [v12 isEqualToString:v10];

  id v14 = [v8 acOfferEligibleUntil];

  if (v14)
  {
    id v15 = [v8 acOfferEligibleUntil];
    uint64_t v16 = +[NDOUtilities daysFromDate:v15];
  }
  else
  {
    uint64_t v16 = 1;
  }
  id v17 = _NDOLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [(NDOManager *)self defaultDevice];
    id v19 = [v18 serialNumber];
    id v20 = [v8 acOfferEligibleUntil];
    *(_DWORD *)buf = 136446978;
    v51 = "-[NDOManager payloadFrom:atIndex:device:]";
    __int16 v52 = 2112;
    v53 = v19;
    __int16 v54 = 2112;
    uint64_t v55 = v10;
    __int16 v56 = 2112;
    v57 = v20;
    _os_log_impl(&dword_23C013000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: sn: %@ sn2: %@ %@", buf, 0x2Au);
  }
  v49[0] = v10;
  v48[0] = @"serialNum";
  v48[1] = @"currentDevice";
  v46 = [NSNumber numberWithBool:v13];
  v49[1] = v46;
  v48[2] = @"deviceSeq";
  v45 = [NSNumber numberWithInteger:a4];
  v49[2] = v45;
  v48[3] = @"deviceName";
  id v21 = [v9 name];
  v49[3] = v21;
  v48[4] = @"deviceImageUrl";
  id v22 = [v9 deviceImageUrl];

  v23 = v22;
  if (!v22)
  {
    uint64_t v24 = [v8 deviceImageUrl];
    uint64_t v43 = v24;
    if (v24) {
      v23 = (__CFString *)v24;
    }
    else {
      v23 = &stru_26EF9F650;
    }
  }
  v49[4] = v23;
  v48[5] = @"deviceDesc";
  uint64_t v25 = objc_msgSend(v8, "deviceDesc", v43);
  id v26 = (void *)v25;
  if (v25) {
    id v27 = (__CFString *)v25;
  }
  else {
    id v27 = &stru_26EF9F650;
  }
  v49[5] = v27;
  v48[6] = @"eligibilityRemainingInDays";
  v28 = [NSNumber numberWithUnsignedInt:v16];
  v49[6] = v28;
  v48[7] = @"sgId";
  uint64_t v29 = [v8 sgId];
  v30 = (void *)v29;
  if (v29) {
    v31 = (__CFString *)v29;
  }
  else {
    v31 = &stru_26EF9F650;
  }
  v49[7] = v31;
  v48[8] = @"pfcId";
  uint64_t v32 = [v8 pfcId];
  v33 = (void *)v32;
  if (v32) {
    v34 = (__CFString *)v32;
  }
  else {
    v34 = &stru_26EF9F650;
  }
  v49[8] = v34;
  v48[9] = @"pgfId";
  uint64_t v35 = [v8 pgfId];
  v36 = (void *)v35;
  if (v35) {
    v37 = (__CFString *)v35;
  }
  else {
    v37 = &stru_26EF9F650;
  }
  v49[9] = v37;
  v48[10] = @"parentId";
  uint64_t v38 = [v8 parentId];
  v39 = (void *)v38;
  if (v38) {
    v40 = (__CFString *)v38;
  }
  else {
    v40 = &stru_26EF9F650;
  }
  v49[10] = v40;
  v41 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:11];

  if (!v22) {
  return v41;
  }
}

- (id)payloadDictionaryForDeviceInfo:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!v6) {
    goto LABEL_14;
  }
  id v8 = [v6 warranty];
  id v9 = [v8 acOfferDisplayDate];

  uint64_t v10 = [v7 warranty];
  int v11 = [v10 acOfferEligible];
  if (v9)
  {
    if (v11)
    {
      id v12 = [v7 warranty];
      uint64_t v13 = [v12 acOfferDisplayDate];
      [v13 timeIntervalSinceNow];
      if (v14 > 0.0)
      {

        id v15 = 0;
LABEL_12:

        goto LABEL_13;
      }
      id v18 = [v7 warranty];
      id v19 = [v18 acOfferEligibleUntil];
      [v19 timeIntervalSinceNow];
      double v17 = v20;

      goto LABEL_10;
    }
LABEL_8:
    id v15 = 0;
LABEL_13:

    goto LABEL_15;
  }
  if (!v11) {
    goto LABEL_8;
  }
  id v12 = [v7 warranty];
  uint64_t v13 = [v12 acOfferEligibleUntil];
  [v13 timeIntervalSinceNow];
  double v17 = v16;
LABEL_10:

  if (v17 > 0.0)
  {
    uint64_t v10 = [v7 warranty];
    id v12 = [v7 device];
    id v15 = [(NDOManager *)self payloadFrom:v10 atIndex:a4 device:v12];
    goto LABEL_12;
  }
LABEL_14:
  id v15 = 0;
LABEL_15:

  return v15;
}

- (void)getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 policy:(unint64_t)a5 params:(id)a6 salesReplyOnly:(BOOL)a7 salesInfoReply:(id)a8 deviceInfoReply:(id)a9 completionBlock:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke;
  v28[3] = &unk_264E26348;
  v28[4] = self;
  id v29 = v16;
  BOOL v36 = a7;
  id v32 = v21;
  id v33 = v19;
  id v30 = v17;
  id v31 = v18;
  id v34 = v20;
  unint64_t v35 = a5;
  id v22 = v20;
  id v23 = v18;
  id v24 = v17;
  id v25 = v19;
  id v26 = v21;
  id v27 = v16;
  [(NDOManager *)self _getDeviceListForLocalDevices:v27 sessionID:v24 params:v23 completionBlock:v28];
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v54 = a3;
  v57 = v4;
  __int16 v56 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x2020000000;
  char v107 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  char v103 = 0;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  char v99 = 0;
  if (v4 && [v4 count])
  {
    *((unsigned char *)v97 + 24) = 1;
    [v56 addObjectsFromArray:v4];
    *((unsigned char *)v105 + 24) = 1;
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5 && !*(unsigned char *)(a1 + 96)) {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v56);
    }
    id v6 = _NDOLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoRep"
                           "ly:deviceInfoReply:completionBlock:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 423;
      _os_log_impl(&dword_23C013000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d completionBlock", buf, 0x12u);
    }
  }
  else
  {
    id v7 = _NDOLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_cold_1(v7);
    }

    id v8 = [*(id *)(a1 + 32) defaultDevice];
    id v6 = [v8 serialNumber];

    id v9 = [NDODeviceSection alloc];
    uint64_t v10 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    int v11 = [v10 localizedStringForKey:@"THIS_DEVICE" value:&stru_26EF9F650 table:@"Localizable"];
    id v12 = [(NDODeviceSection *)v9 initWithLabel:v11 identifier:@"THIS_DEVICE"];

    uint64_t v13 = [NDODeviceSection alloc];
    double v14 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    id v15 = [v14 localizedStringForKey:@"MORE_DEVICES" value:&stru_26EF9F650 table:@"Localizable"];
    id v16 = [(NDODeviceSection *)v13 initWithLabel:v15 identifier:@"MORE_DEVICES"];

    [v56 addObject:v12];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v92 objects:v123 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v93 != v19) {
            objc_enumerationMutation(v17);
          }
          id v21 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          id v22 = [v21 serialNumber];
          int v23 = [v22 isEqualToString:v6];

          if (v23) {
            id v24 = v12;
          }
          else {
            id v24 = v16;
          }
          [(NDODeviceSection *)v24 addDevice:v21];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v92 objects:v123 count:16];
      }
      while (v18);
    }

    id v25 = [(NDODeviceSection *)v16 deviceList];
    BOOL v26 = [v25 count] == 0;

    if (!v26) {
      [v56 addObject:v16];
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v120 = __Block_byref_object_copy_;
  v121 = __Block_byref_object_dispose_;
  id v27 = v54;
  id v122 = v27;
  dispatch_group_t v52 = dispatch_group_create();
  v53 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  uint64_t v55 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  v28 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v29 = v56;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v88 objects:v118 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v89 != v31) {
          objc_enumerationMutation(v29);
        }
        id v33 = [*(id *)(*((void *)&v88 + 1) + 8 * j) deviceList];
        [v28 addObjectsFromArray:v33];
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v88 objects:v118 count:16];
    }
    while (v30);
  }

  uint64_t v34 = a1;
  if (!*((unsigned char *)v97 + 24) || !*(void *)(a1 + 72)) {
    goto LABEL_38;
  }
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_89;
  v85[3] = &unk_264E26230;
  id v35 = v55;
  uint64_t v36 = *(void *)(a1 + 32);
  id v86 = v35;
  uint64_t v87 = v36;
  [v28 enumerateObjectsUsingBlock:v85];
  *((unsigned char *)v101 + 24) = 1;
  uint64_t v37 = *(void *)(a1 + 72);
  uint64_t v38 = *(void *)(*(void *)&buf[8] + 40);
  id v39 = [v35 count] ? v35 : 0;
  (*(void (**)(uint64_t, uint64_t, id, id))(v37 + 16))(v37, v38, v39, v27);
  v40 = _NDOLogSystem();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v108 = 136316162;
    v109 = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoRep"
           "ly:completionBlock:]_block_invoke_2";
    __int16 v110 = 1024;
    int v111 = 445;
    __int16 v112 = 2112;
    uint64_t v113 = v51;
    __int16 v114 = 2112;
    id v115 = v27;
    __int16 v116 = 2112;
    id v117 = v35;
    _os_log_debug_impl(&dword_23C013000, v40, OS_LOG_TYPE_DEBUG, "%s:%d salesInfoReply salesURL:%@ agsULUrl:%@ %@", v108, 0x30u);
  }

  BOOL v41 = *(unsigned char *)(a1 + 96) == 0;
  uint64_t v34 = a1;
  if (v41)
  {
LABEL_38:
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_92;
    v78[3] = &unk_264E26258;
    id v42 = v53;
    id v79 = v42;
    v83 = &v96;
    id v43 = *(id *)(v34 + 72);
    v84 = buf;
    uint64_t v44 = *(void *)(v34 + 32);
    id v82 = v43;
    uint64_t v80 = v44;
    id v45 = v55;
    id v81 = v45;
    v46 = (void *)MEMORY[0x23ECD9670](v78);
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_2;
    v71[3] = &unk_264E262F8;
    v47 = v52;
    uint64_t v48 = *(void *)(v34 + 32);
    v72 = v47;
    uint64_t v73 = v48;
    uint64_t v77 = *(void *)(a1 + 88);
    id v74 = *(id *)(a1 + 48);
    id v75 = *(id *)(a1 + 56);
    id v49 = v46;
    id v76 = v49;
    [v28 enumerateObjectsUsingBlock:v71];
    v50 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_95;
    block[3] = &unk_264E26320;
    id v64 = *(id *)(a1 + 64);
    v67 = &v104;
    char v70 = *(unsigned char *)(a1 + 96);
    id v60 = v29;
    id v65 = *(id *)(a1 + 72);
    v68 = &v100;
    v69 = buf;
    id v61 = v45;
    id v62 = v27;
    id v66 = *(id *)(a1 + 80);
    id v63 = v42;
    dispatch_group_notify(v47, v50, block);
  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_89(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if ([v7 acOfferEligible])
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) payloadFrom:v7 atIndex:a3 device:v7];
    [v5 addObject:v6];
  }
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_92(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v18 = a3;
  id v7 = a2;
  id v8 = [v18 warranty];
  [v7 updateWithWarranty:v8];

  [*(id *)(a1 + 32) addObject:v18];
  id v9 = v18;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) || !*(void *)(a1 + 56)) {
    goto LABEL_10;
  }
  uint64_t v10 = [v18 warranty];
  int v11 = [v10 agsULURL];
  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);

  id v13 = v18;
  if (!v12)
  {
    uint64_t v10 = [v18 warranty];
    uint64_t v14 = [v10 agsULURL];
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

LABEL_6:
    id v13 = v18;
  }
  id v17 = [*(id *)(a1 + 40) payloadDictionaryForDeviceInfo:v13 atIndex:a4];
  if (v17) {
    [*(id *)(a1 + 48) addObject:v17];
  }

  id v9 = v18;
LABEL_10:
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  if ([v5 deviceType] == 2)
  {
    id v6 = _NDOLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_2_cold_1(v5, v6);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v5 serialNumber];
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_3;
    v14[3] = &unk_264E262D0;
    void v14[4] = *(void *)(a1 + 40);
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 72);
    id v15 = v12;
    uint64_t v20 = v13;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    uint64_t v21 = a3;
    [v7 getDeviceInfoForSerialNumber:v8 usingPolicy:v9 sessionID:v10 params:v11 andForcePostFollowup:0 withReply:v14];
  }
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_4;
  block[3] = &unk_264E262A8;
  id v13 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 80);
  id v14 = v5;
  uint64_t v20 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v8;
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 88);
  id v19 = v9;
  uint64_t v21 = v10;
  id v11 = v3;
  dispatch_async(v4, block);
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) warranty];
  id v3 = v2;
  if (v2)
  {
    int v4 = [v2 acOfferEligible];
    if (v4 == [*(id *)(a1 + 40) acOfferEligible] || *(void *)(a1 + 88) == 2)
    {
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    else
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      id v5 = *(void **)(a1 + 56);
      uint64_t v6 = [*(id *)(a1 + 40) serialNumber];
      uint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = *(void *)(a1 + 72);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_5;
      v11[3] = &unk_264E26280;
      id v14 = *(id *)(a1 + 80);
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 96);
      id v12 = v9;
      uint64_t v15 = v10;
      id v13 = *(id *)(a1 + 48);
      [v5 getDeviceInfoForSerialNumber:v6 usingPolicy:2 sessionID:v7 params:v8 andForcePostFollowup:0 withReply:v11];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

uint64_t __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_95(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 64)
    && !*(unsigned char *)(*(void *)(*(void *)(result + 88) + 8) + 24)
    && !*(unsigned char *)(result + 112))
  {
    uint64_t v2 = _NDOLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      id v9 = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoRep"
           "ly:completionBlock:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 502;
      _os_log_impl(&dword_23C013000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d completionBlock", (uint8_t *)&v8, 0x12u);
    }

    result = (*(uint64_t (**)(void))(*(void *)(v1 + 64) + 16))();
  }
  if (*(void *)(v1 + 72) && !*(unsigned char *)(*(void *)(*(void *)(v1 + 96) + 8) + 24))
  {
    id v3 = _NDOLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      id v9 = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoRep"
           "ly:completionBlock:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 507;
      _os_log_impl(&dword_23C013000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d salesInfoReply", (uint8_t *)&v8, 0x12u);
    }

    uint64_t v4 = *(void *)(v1 + 72);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 104) + 8) + 40);
    if ([*(id *)(v1 + 40) count]) {
      uint64_t v6 = *(void *)(v1 + 40);
    }
    else {
      uint64_t v6 = 0;
    }
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v4 + 16))(v4, v5, v6, *(void *)(v1 + 48));
  }
  if (*(void *)(v1 + 80) && !*(unsigned char *)(v1 + 112))
  {
    uint64_t v7 = _NDOLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      id v9 = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoRep"
           "ly:completionBlock:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 512;
      _os_log_impl(&dword_23C013000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d deviceInfoReply", (uint8_t *)&v8, 0x12u);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 80) + 16))();
  }
  return result;
}

- (void)_getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NDOManager *)self agentConnection];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke;
  v20[3] = &unk_264E26028;
  v20[4] = self;
  id v15 = v10;
  id v21 = v15;
  uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke_97;
  v18[3] = &unk_264E26370;
  id v19 = v15;
  id v17 = v15;
  [v16 getDeviceListForLocalDevices:v13 sessionID:v12 params:v11 withReply:v18];
}

void __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke_cold_1();
  }

  uint64_t v5 = [*(id *)(a1 + 32) agentConnection];
  [v5 invalidate];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPrimaryFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(NDOManager *)self agentConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__NDOManager_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke;
  v16[3] = &unk_264E26028;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__NDOManager_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_98;
  v14[3] = &unk_264E26398;
  id v15 = v10;
  id v13 = v10;
  [v12 getPrimaryFUPEligibleDeviceInfosUsingPolicy:a3 updateFollowUps:v5 withReply:v14];
}

void __84__NDOManager_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __84__NDOManager_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(NDOManager *)self agentConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__NDOManager_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke;
  v16[3] = &unk_264E26028;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__NDOManager_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_99;
  v14[3] = &unk_264E26398;
  id v15 = v10;
  id v13 = v10;
  [v12 getAllFUPEligibleDeviceInfosUsingPolicy:a3 updateFollowUps:v5 withReply:v14];
}

void __80__NDOManager_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __80__NDOManager_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getBTDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(NDOManager *)self agentConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__NDOManager_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke;
  v16[3] = &unk_264E26028;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__NDOManager_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_100;
  v14[3] = &unk_264E26398;
  id v15 = v10;
  id v13 = v10;
  [v12 getBTDeviceInfosUsingPolicy:a3 updateFollowUps:v5 withReply:v14];
}

void __68__NDOManager_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __68__NDOManager_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getBTPioneerDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(NDOManager *)self agentConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__NDOManager_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke;
  v16[3] = &unk_264E26028;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__NDOManager_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_101;
  v14[3] = &unk_264E26398;
  id v15 = v10;
  id v13 = v10;
  [v12 getBTPioneerDeviceInfosUsingPolicy:a3 updateFollowUps:v5 withReply:v14];
}

void __75__NDOManager_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __75__NDOManager_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissFollowUpForSerialNumber:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NDOManager *)self agentConnection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__NDOManager_dismissFollowUpForSerialNumber_completion___block_invoke;
  v15[3] = &unk_264E26028;
  id v16 = v8;
  id v9 = v6;
  id v17 = v9;
  id v10 = v8;
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__NDOManager_dismissFollowUpForSerialNumber_completion___block_invoke_102;
  v13[3] = &unk_264E263C0;
  id v14 = v9;
  id v12 = v9;
  [v11 dismissFollowUpForSerialNumber:v7 completion:v13];
}

void __56__NDOManager_dismissFollowUpForSerialNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __56__NDOManager_dismissFollowUpForSerialNumber_completion___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissNotificationForSerialNumber:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NDOManager *)self agentConnection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__NDOManager_dismissNotificationForSerialNumber_completion___block_invoke;
  v15[3] = &unk_264E26028;
  id v16 = v8;
  id v9 = v6;
  id v17 = v9;
  id v10 = v8;
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__NDOManager_dismissNotificationForSerialNumber_completion___block_invoke_103;
  v13[3] = &unk_264E263C0;
  id v14 = v9;
  id v12 = v9;
  [v11 dismissNotificationForSerialNumber:v7 completion:v13];
}

void __60__NDOManager_dismissNotificationForSerialNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __60__NDOManager_dismissNotificationForSerialNumber_completion___block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)agentConnection
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ndoagent" options:0];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EFAB3B8];
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  [v3 setClasses:v7 forSelector:sel_getDeviceListForLocalDevices_sessionID_params_withReply_ argumentIndex:0 ofReply:0];

  id v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  [v3 setClasses:v11 forSelector:sel_getDeviceListForLocalDevices_sessionID_params_withReply_ argumentIndex:0 ofReply:1];

  id v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v3 setClasses:v14 forSelector:sel_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply_ argumentIndex:0 ofReply:1];

  id v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  id v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v3 setClasses:v17 forSelector:sel_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply_ argumentIndex:0 ofReply:1];

  id v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v3 setClasses:v20 forSelector:sel_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply_ argumentIndex:0 ofReply:1];

  id v21 = (void *)MEMORY[0x263EFFA08];
  uint64_t v22 = objc_opt_class();
  int v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v3 setClasses:v23 forSelector:sel_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply_ argumentIndex:0 ofReply:1];

  id v24 = (void *)MEMORY[0x263EFFA08];
  uint64_t v25 = objc_opt_class();
  BOOL v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  [v3 setClasses:v26 forSelector:sel_defaultDevice_ argumentIndex:0 ofReply:1];

  id v27 = (void *)MEMORY[0x263EFFA08];
  uint64_t v28 = objc_opt_class();
  id v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  [v3 setClasses:v29 forSelector:sel_pairedWatches_ argumentIndex:0 ofReply:1];

  uint64_t v30 = (void *)MEMORY[0x263EFFA08];
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  id v33 = objc_msgSend(v30, "setWithObjects:", v31, v32, objc_opt_class(), 0);
  [v3 setClasses:v33 forSelector:sel_pairedBTDevices_ argumentIndex:0 ofReply:1];

  [v2 setRemoteObjectInterface:v3];
  [v2 resume];

  return v2;
}

+ (void)postCAEventFor:(id)a3 eventDict:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  AnalyticsSendEventLazy();
}

id __39__NDOManager_postCAEventFor_eventDict___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_23C013000, v2, OS_LOG_TYPE_DEFAULT, "Posting for event: %@ with value: %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = *(void **)(a1 + 40);
  return v5;
}

- (void)clearUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(NDOManager *)self agentConnection];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __75__NDOManager_clearUserInitiatedFollowUpDismissalForSerialNumber_withReply___block_invoke;
  id v15 = &unk_264E26028;
  id v16 = v8;
  id v17 = v6;
  id v9 = v6;
  id v10 = v8;
  uint64_t v11 = [v10 remoteObjectProxyWithErrorHandler:&v12];
  objc_msgSend(v11, "clearUserInitiatedFollowUpDismissalForSerialNumber:completion:", v7, v9, v12, v13, v14, v15);
}

void __75__NDOManager_clearUserInitiatedFollowUpDismissalForSerialNumber_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)clearAllUserInitiatedFollowUpDismissalsWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NDOManager *)self agentConnection];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __63__NDOManager_clearAllUserInitiatedFollowUpDismissalsWithReply___block_invoke;
  uint64_t v12 = &unk_264E26028;
  id v13 = v5;
  id v14 = v4;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:&v9];
  objc_msgSend(v8, "clearAllUserInitiatedFollowUpDismissalsWithCompletion:", v6, v9, v10, v11, v12);
}

void __63__NDOManager_clearAllUserInitiatedFollowUpDismissalsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)storeUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 withReply:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380675;
    uint64_t v20 = "-[NDOManager storeUserInitiatedFollowUpDismissalForSerialNumber:withReply:]";
    _os_log_impl(&dword_23C013000, v8, OS_LOG_TYPE_DEFAULT, "%{private}s", buf, 0xCu);
  }

  uint64_t v9 = [(NDOManager *)self agentConnection];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __75__NDOManager_storeUserInitiatedFollowUpDismissalForSerialNumber_withReply___block_invoke;
  id v16 = &unk_264E26028;
  id v17 = v9;
  id v18 = v6;
  id v10 = v6;
  id v11 = v9;
  uint64_t v12 = [v11 remoteObjectProxyWithErrorHandler:&v13];
  objc_msgSend(v12, "storeUserInitiatedFollowUpDismissalForSerialNumber:completion:", v7, v10, v13, v14, v15, v16);
}

void __75__NDOManager_storeUserInitiatedFollowUpDismissalForSerialNumber_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) invalidate];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void).cxx_destruct
{
}

void __41__NDOManager_appleAccountAddedWithReply___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23C013000, v0, OS_LOG_TYPE_ERROR, "%{public}s: error: %@", (uint8_t *)v1, 0x16u);
}

void __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_23C013000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)isAPSSupportedOverrideWithServerValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_23C013000, a2, OS_LOG_TYPE_DEBUG, "Using overriden value %@", (uint8_t *)&v3, 0xCu);
}

void __33__NDOManager_clientConfiguration__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23C013000, v0, OS_LOG_TYPE_ERROR, "%{public}s error:%@", (uint8_t *)v1, 0x16u);
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23C013000, log, OS_LOG_TYPE_ERROR, "Device list came back empty, falling to summarily call", v1, 2u);
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = [a1 serialNumber];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_23C013000, a2, OS_LOG_TYPE_DEBUG, "%s Skipping APPLEID Device %@", (uint8_t *)v4, 0x16u);
}

void __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_23C013000, v0, v1, "Device list failed with %@, falling to summarily call ", v2, v3, v4, v5, v6);
}

@end