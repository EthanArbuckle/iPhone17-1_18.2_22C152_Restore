@interface STRemotePasscodeController
+ (BOOL)isRestrictionsPasscodeSet;
+ (id)_xpcConnection;
+ (void)activateRemotePINUI;
@end

@implementation STRemotePasscodeController

+ (id)_xpcConnection
{
  if (_xpcConnection_onceToken != -1) {
    dispatch_once(&_xpcConnection_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_xpcConnection_connection;

  return v2;
}

uint64_t __44__STRemotePasscodeController__xpcConnection__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F67220] newContactsServiceConnection];
  v1 = (void *)_xpcConnection_connection;
  _xpcConnection_connection = v0;

  v2 = (void *)_xpcConnection_connection;

  return [v2 resume];
}

+ (BOOL)isRestrictionsPasscodeSet
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (_os_feature_enabled_impl())
  {
    id v3 = objc_alloc_init(MEMORY[0x263F67140]);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke;
    v7[3] = &unk_26449BB30;
    v7[4] = &v8;
    [v3 isRestrictionsPasscodeSetWithCompletionHandler:v7];
  }
  else
  {
    id v3 = [a1 _xpcConnection];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_28;
    v6[3] = &unk_26449BB58;
    v6[4] = &v8;
    [MEMORY[0x263F672A0] synchronousProxyFromConnection:v3 proxyHandler:v6];
  }

  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_2;
    v7[3] = &unk_26449BB30;
    v7[4] = *(void *)(a1 + 32);
    [v5 isRestrictionsPasscodeSetWithCompletionHandler:v7];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_28_cold_1();
  }
}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

+ (void)activateRemotePINUI
{
  id v3 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__STRemotePasscodeController_activateRemotePINUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke(uint64_t a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_2;
  activity_block[3] = &__block_descriptor_40_e5_v8__0l;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_21E199000, "STRestrictionsPINController activateRemotePINUI", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_2(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    id v2 = objc_alloc_init(MEMORY[0x263F67140]);
    [v2 presentRemotePINControllerWithCompletionHandler:&__block_literal_global_32];
  }
  else
  {
    id v2 = [*(id *)(a1 + 32) _xpcConnection];
    objc_msgSend(MEMORY[0x263F672A0], "proxyFromConnection:proxyHandler:");
  }
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_2();
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_1();
  }
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    [v4 presentRemotePINControllerWithCompletionHandler:&__block_literal_global_38];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_33_cold_1();
  }
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_2_36(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_2();
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_1();
  }
}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21E199000, &_os_log_internal, v0, "Failed to fetch isRestrictionsPasscodeSet: %{public}@", v1, v2, v3, v4, v5);
}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21E199000, &_os_log_internal, v0, "Failed to create synchronous proxy to fetch isRestrictionsPasscodeSet: %{public}@", v1, v2, v3, v4, v5);
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Successfully activated remote PIN UI.", v0, 2u);
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21E199000, &_os_log_internal, v0, "Failed to activate remote PIN UI: %{public}@", v1, v2, v3, v4, v5);
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_21E199000, &_os_log_internal, v0, "Failed to create proxy to activate remote PIN UI: %{public}@", v1, v2, v3, v4, v5);
}

@end