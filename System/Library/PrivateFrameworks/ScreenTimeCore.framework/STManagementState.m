@interface STManagementState
- (BOOL)applyDefaultUserPoliciesWithError:(id *)a3;
- (BOOL)cachedIsRestrictionsPasscodeSet;
- (BOOL)cachedShouldRequestMoreTime;
- (BOOL)clearRestrictionsPasscodeWithError:(id *)a3;
- (BOOL)contactsEditable;
- (BOOL)enableRemoteManagementForDSID:(id)a3 error:(id *)a4;
- (BOOL)enableScreenTimeForDSID:(id)a3 error:(id *)a4;
- (BOOL)isRestrictionsPasscodeSet;
- (BOOL)needsToSetRestrictionsPasscode;
- (BOOL)performMigrationFromMCXSettings:(id)a3 error:(id *)a4;
- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5;
- (BOOL)setScreenTimeEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)shouldRequestMoreTime;
- (BOOL)triggerDowngradeMigrationWithOutError:(id *)a3;
- (NSXPCConnection)connection;
- (STManagementState)init;
- (STPrivateServiceClient)privateServiceClient;
- (id)communicationPoliciesWithError:(id *)a3;
- (id)primaryiCloudCardDAVAccountIdentifierWithError:(id *)a3;
- (id)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 error:(id *)a4;
- (id)shouldAllowOneMoreMinuteForWebDomain:(id)a3 error:(id *)a4;
- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4;
- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4;
- (void)communicationPoliciesWithCompletionHandler:(id)a3;
- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)enableWebContentFilterWithCompletionHandler:(id)a3;
- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4;
- (void)isExplicitContentRestricted:(id)a3;
- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4;
- (void)isRestrictionsPasscodeSet;
- (void)isRestrictionsPasscodeSet:(id)a3;
- (void)isWebContentRestricted:(id)a3;
- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)needsToSetRestrictionsPasscode;
- (void)postNotificationForContext:(id)a3;
- (void)requestToManageContactsForDSID:(id)a3 completionHandler:(id)a4;
- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3;
- (void)screenTimeStateWithCompletionHandler:(id)a3;
- (void)screenTimeSyncStateWithCompletionHandler:(id)a3;
- (void)setCachedIsRestrictionsPasscodeSet:(BOOL)a3;
- (void)setCachedShouldRequestMoreTime:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setManageContactsEnabled:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setPrivateServiceClient:(id)a3;
- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4;
- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)shouldRequestMoreTime;
- (void)shouldRequestMoreTime:(id)a3;
@end

@implementation STManagementState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)communicationPoliciesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = [(STManagementState *)self privateServiceClient];
    [v5 communicationPoliciesWithCompletionHandler:v4];
  }
  else
  {
    v6 = [(STManagementState *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__STManagementState_communicationPoliciesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E6BC7058;
    id v7 = v4;
    id v12 = v7;
    v8 = [v6 remoteObjectProxyWithErrorHandler:v11];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__STManagementState_communicationPoliciesWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E6BC7BE8;
    v9[4] = self;
    id v10 = v7;
    [v8 communicationPoliciesWithCompletionHandler:v9];
  }
}

- (BOOL)isRestrictionsPasscodeSet
{
  v3 = +[STLog ask];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[STManagementState isRestrictionsPasscodeSet]();
  }

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (_os_feature_enabled_impl())
  {
    id v4 = [(STManagementState *)self privateServiceClient];
    id v13 = 0;
    char v5 = [v4 isRestrictionsPasscodeSetWithError:&v13];
    id v6 = v13;
    *((unsigned char *)v15 + 24) = v5;
  }
  else
  {
    id v7 = [(STManagementState *)self connection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__STManagementState_isRestrictionsPasscodeSet__block_invoke;
    v12[3] = &unk_1E6BC7A80;
    v12[4] = self;
    v12[5] = &v14;
    v12[6] = v18;
    id v6 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_21;
    v11[3] = &unk_1E6BC7AA8;
    void v11[4] = self;
    v11[5] = &v14;
    v11[6] = v18;
    [v6 isRestrictionsPasscodeSetWithCompletionHandler:v11];
  }

  v8 = +[STLog ask];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[STManagementState isRestrictionsPasscodeSet]();
  }

  char v9 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  return v9;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (STManagementState)init
{
  v8.receiver = self;
  v8.super_class = (Class)STManagementState;
  v2 = [(STManagementState *)&v8 init];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_alloc_init(STPrivateServiceClient);
      privateServiceClient = v2->_privateServiceClient;
      v2->_privateServiceClient = v3;
    }
    else
    {
      char v5 = +[STScreenTimeAgentPrivateConnection newConnection];
      connection = v2->_connection;
      v2->_connection = v5;

      [(NSXPCConnection *)v2->_connection resume];
    }
  }
  return v2;
}

uint64_t __64__STManagementState_communicationPoliciesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(NSXPCConnection *)self->_connection invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)STManagementState;
  [(STManagementState *)&v3 dealloc];
}

void __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog ask];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_21_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) cachedIsRestrictionsPasscodeSet];
    char v7 = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    [*(id *)(a1 + 32) setCachedIsRestrictionsPasscodeSet:a2];
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
}

- (void)setCachedIsRestrictionsPasscodeSet:(BOOL)a3
{
  self->_cachedIsRestrictionsPasscodeSet = a3;
}

- (BOOL)shouldRequestMoreTime
{
  objc_super v3 = +[STLog ask];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[STManagementState shouldRequestMoreTime]();
  }

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (_os_feature_enabled_impl())
  {
    id v4 = [(STManagementState *)self privateServiceClient];
    id v15 = 0;
    char v5 = [v4 shouldRequestMoreTimeWithError:&v15];
    id v6 = v15;
    *((unsigned char *)v17 + 24) = v5;

    if (v6)
    {
      char v7 = +[STLog ask];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[STManagementState shouldRequestMoreTime]();
      }
    }
  }
  else
  {
    objc_super v8 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__STManagementState_shouldRequestMoreTime__block_invoke;
    v14[3] = &unk_1E6BC7A80;
    v14[4] = self;
    v14[5] = &v16;
    v14[6] = v20;
    char v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__STManagementState_shouldRequestMoreTime__block_invoke_7;
    v13[3] = &unk_1E6BC7AA8;
    v13[4] = self;
    v13[5] = &v16;
    v13[6] = v20;
    [v9 shouldRequestMoreTimeWithCompletionHandler:v13];
  }
  id v10 = +[STLog ask];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[STManagementState shouldRequestMoreTime]();
  }

  char v11 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
  return v11;
}

void __42__STManagementState_shouldRequestMoreTime__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog ask];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__STManagementState_shouldRequestMoreTime__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) cachedShouldRequestMoreTime];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __42__STManagementState_shouldRequestMoreTime__block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog ask];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__STManagementState_shouldRequestMoreTime__block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) cachedShouldRequestMoreTime];
    char v7 = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    [*(id *)(a1 + 32) setCachedShouldRequestMoreTime:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
}

- (void)shouldRequestMoreTime:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog ask];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STManagementState shouldRequestMoreTime:]();
  }

  if (_os_feature_enabled_impl())
  {
    id v6 = [(STManagementState *)self privateServiceClient];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __43__STManagementState_shouldRequestMoreTime___block_invoke;
    v17[3] = &unk_1E6BC7AD0;
    char v7 = &v18;
    id v18 = v4;
    id v8 = v4;
    [v6 shouldRequestMoreTimeWithCompletionHandler:v17];
  }
  else
  {
    char v9 = [(STManagementState *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__STManagementState_shouldRequestMoreTime___block_invoke_19;
    v15[3] = &unk_1E6BC7AF8;
    char v7 = &v16;
    id v10 = v4;
    v15[4] = self;
    id v16 = v10;
    char v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__STManagementState_shouldRequestMoreTime___block_invoke_20;
    v13[3] = &unk_1E6BC7B20;
    v13[4] = self;
    id v14 = v10;
    id v12 = v10;
    [v11 shouldRequestMoreTimeWithCompletionHandler:v13];
  }
}

void __43__STManagementState_shouldRequestMoreTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog ask];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __43__STManagementState_shouldRequestMoreTime___block_invoke_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
}

void __43__STManagementState_shouldRequestMoreTime___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog ask];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__STManagementState_shouldRequestMoreTime__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, [*(id *)(a1 + 32) cachedShouldRequestMoreTime]);
  }
}

void __43__STManagementState_shouldRequestMoreTime___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog ask];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __43__STManagementState_shouldRequestMoreTime___block_invoke_20_cold_1();
    }

    a2 = [*(id *)(a1 + 32) cachedShouldRequestMoreTime];
  }
  else
  {
    [*(id *)(a1 + 32) setCachedShouldRequestMoreTime:a2];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
}

void __46__STManagementState_isRestrictionsPasscodeSet__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog ask];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) cachedIsRestrictionsPasscodeSet];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

- (BOOL)clearRestrictionsPasscodeWithError:(id *)a3
{
  uint64_t v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x3032000000;
  v21[2] = __Block_byref_object_copy__11;
  v21[3] = __Block_byref_object_dispose__11;
  id v22 = 0;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(STManagementState *)self privateServiceClient];
    id v6 = (id *)(v21[0] + 40);
    id obj = *(id *)(v21[0] + 40);
    [v5 clearRestrictionsPasscodeWithError:&obj];
    objc_storeStrong(v6, obj);
  }
  else
  {
    uint64_t v7 = [(STManagementState *)self connection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__STManagementState_clearRestrictionsPasscodeWithError___block_invoke;
    void v18[3] = &unk_1E6BC6F68;
    v18[4] = &v20;
    id v5 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v18];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__STManagementState_clearRestrictionsPasscodeWithError___block_invoke_2;
    v17[3] = &unk_1E6BC6F68;
    void v17[4] = &v20;
    [v5 clearRestrictionsPasscodeWithCompletionHandler:v17];
  }

  uint64_t v8 = *(void *)(v21[0] + 40);
  if (v8)
  {
    char v9 = +[STLog ask];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STManagementState clearRestrictionsPasscodeWithError:]((uint64_t)v21, v9, v10, v11, v12, v13, v14, v15);
    }

    if (a3) {
      *a3 = *(id *)(v21[0] + 40);
    }
  }
  _Block_object_dispose(&v20, 8);

  return v8 == 0;
}

void __56__STManagementState_clearRestrictionsPasscodeWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __56__STManagementState_clearRestrictionsPasscodeWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)isRestrictionsPasscodeSet:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog ask];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STManagementState isRestrictionsPasscodeSet:]();
  }

  if (_os_feature_enabled_impl())
  {
    id v6 = [(STManagementState *)self privateServiceClient];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__STManagementState_isRestrictionsPasscodeSet___block_invoke;
    v17[3] = &unk_1E6BC7AD0;
    uint64_t v7 = &v18;
    id v18 = v4;
    id v8 = v4;
    [v6 isRestrictionsPasscodeSetWithCompletionHandler:v17];
  }
  else
  {
    char v9 = [(STManagementState *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_28;
    v15[3] = &unk_1E6BC7AF8;
    uint64_t v7 = &v16;
    id v10 = v4;
    v15[4] = self;
    id v16 = v10;
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_29;
    v13[3] = &unk_1E6BC7B20;
    v13[4] = self;
    id v14 = v10;
    id v12 = v10;
    [v11 isRestrictionsPasscodeSetWithCompletionHandler:v13];
  }
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog ask];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog ask];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_28_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, [*(id *)(a1 + 32) cachedIsRestrictionsPasscodeSet]);
  }
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog ask];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_29_cold_1();
    }

    a2 = [*(id *)(a1 + 32) cachedIsRestrictionsPasscodeSet];
  }
  else
  {
    [*(id *)(a1 + 32) setCachedIsRestrictionsPasscodeSet:a2];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
}

- (BOOL)needsToSetRestrictionsPasscode
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (!_os_feature_enabled_impl())
  {
    id v5 = [(STManagementState *)self connection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_15];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke_30;
    v9[3] = &unk_1E6BC7B48;
    v9[4] = &v11;
    [v6 needsToSetRestrictionsPasscodeWithReplyHandler:v9];
LABEL_6:

    goto LABEL_7;
  }
  id v3 = [(STManagementState *)self privateServiceClient];
  id v10 = 0;
  char v4 = [v3 needsToSetRestrictionsPasscodeWithError:&v10];
  id v5 = v10;
  *((unsigned char *)v12 + 24) = v4;

  if (v5)
  {
    id v6 = +[STLog ask];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STManagementState needsToSetRestrictionsPasscode]();
    }
    goto LABEL_6;
  }
LABEL_7:

  char v7 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[STLog ask];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke_cold_1();
  }
}

void __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke_30(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog ask];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STManagementState needsToSetRestrictionsPasscode]();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(STManagementState *)self privateServiceClient];
    [v8 setRestrictionsPasscode:v7 completionHandler:v6];
  }
  else
  {
    char v9 = [(STManagementState *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke;
    v11[3] = &unk_1E6BC7058;
    id v12 = v6;
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v11];
    [v10 setRestrictionsPasscode:v7 completionHandler:&__block_literal_global_32];
  }
}

uint64_t __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[STLog screentime];
  char v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2_cold_1();
  }
}

- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(STManagementState *)self privateServiceClient];
    [v8 authenticateRestrictionsPasscode:v7 completionHandler:v6];
  }
  else
  {
    char v9 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__STManagementState_authenticateRestrictionsPasscode_completionHandler___block_invoke;
    v14[3] = &unk_1E6BC7058;
    id v10 = v6;
    id v15 = v10;
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__STManagementState_authenticateRestrictionsPasscode_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC6FB8;
    v12[4] = self;
    id v13 = v10;
    [v11 authenticateRestrictionsPasscode:v7 replyHandler:v12];
  }
}

uint64_t __72__STManagementState_authenticateRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__STManagementState_authenticateRestrictionsPasscode_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(STManagementState *)self privateServiceClient];
    [v5 restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:v4];
  }
  else
  {
    id v6 = [(STManagementState *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__STManagementState_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E6BC7058;
    id v7 = v4;
    id v12 = v7;
    id v8 = [v6 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __94__STManagementState_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E6BC7B70;
    v9[4] = self;
    id v10 = v7;
    [v8 restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithReplyHandler:v9];
  }
}

uint64_t __94__STManagementState_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__STManagementState_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)screenTimeStateWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(STManagementState *)self privateServiceClient];
    id v17 = 0;
    id v6 = [v5 isScreenTimeEnabledForLocalUserWithError:&v17];
    id v7 = v17;

    if (v4)
    {
      uint64_t v8 = 1;
      if (v6) {
        uint64_t v8 = 2;
      }
      if (v7) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v8;
      }
      v4[2](v4, v9, v7);
    }
  }
  else
  {
    id v10 = [(STManagementState *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__STManagementState_screenTimeStateWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E6BC7058;
    uint64_t v11 = v4;
    id v16 = v11;
    id v12 = [v10 remoteObjectProxyWithErrorHandler:v15];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__STManagementState_screenTimeStateWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E6BC7B98;
    v13[4] = self;
    char v14 = v11;
    [v12 screenTimeStateWithCompletionHandler:v13];

    id v7 = v16;
  }
}

uint64_t __58__STManagementState_screenTimeStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__STManagementState_screenTimeStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)setScreenTimeEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__11;
  char v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  if (_os_feature_enabled_impl())
  {
    id v7 = [(STManagementState *)self privateServiceClient];
    uint64_t v8 = (id *)(v16 + 5);
    id obj = (id)v16[5];
    [v7 setScreenTimeEnabledForLocalUser:v5 error:&obj];
    objc_storeStrong(v8, obj);
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__STManagementState_setScreenTimeEnabled_error___block_invoke;
    v13[3] = &unk_1E6BC6F68;
    v13[4] = &v15;
    id v7 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v13];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__STManagementState_setScreenTimeEnabled_error___block_invoke_2;
    v12[3] = &unk_1E6BC6F68;
    v12[4] = &v15;
    [v7 setScreenTimeEnabled:v5 completionHandler:v12];
  }

  id v10 = (void *)v16[5];
  if (a4 && v10) {
    *a4 = v10;
  }
  _Block_object_dispose(&v15, 8);

  return v10 == 0;
}

void __48__STManagementState_setScreenTimeEnabled_error___block_invoke(uint64_t a1, void *a2)
{
}

void __48__STManagementState_setScreenTimeEnabled_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)enableScreenTimeForDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__11;
  char v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  if (_os_feature_enabled_impl())
  {
    id v7 = [(STManagementState *)self privateServiceClient];
    uint64_t v8 = (id *)(v16 + 5);
    id obj = (id)v16[5];
    [v7 setScreenTimeEnabledForRemoteUserWithDSID:v6 enabled:1 error:&obj];
    objc_storeStrong(v8, obj);
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__STManagementState_enableScreenTimeForDSID_error___block_invoke;
    v13[3] = &unk_1E6BC6F68;
    v13[4] = &v15;
    id v7 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v13];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__STManagementState_enableScreenTimeForDSID_error___block_invoke_2;
    v12[3] = &unk_1E6BC6F68;
    v12[4] = &v15;
    [v7 enableScreenTimeForDSID:v6 completionHandler:v12];
  }

  id v10 = (void *)v16[5];
  if (a4 && v10) {
    *a4 = v10;
  }
  _Block_object_dispose(&v15, 8);

  return v10 == 0;
}

void __51__STManagementState_enableScreenTimeForDSID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __51__STManagementState_enableScreenTimeForDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)enableRemoteManagementForDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__11;
  char v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  if (_os_feature_enabled_impl())
  {
    id v7 = [(STManagementState *)self privateServiceClient];
    uint64_t v8 = (id *)(v16 + 5);
    id obj = (id)v16[5];
    [v7 enableRemoteManagementForDSID:v6 error:&obj];
    objc_storeStrong(v8, obj);
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__STManagementState_enableRemoteManagementForDSID_error___block_invoke;
    v13[3] = &unk_1E6BC6F68;
    v13[4] = &v15;
    id v7 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v13];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__STManagementState_enableRemoteManagementForDSID_error___block_invoke_2;
    v12[3] = &unk_1E6BC6F68;
    v12[4] = &v15;
    [v7 enableRemoteManagementForDSID:v6 completionHandler:v12];
  }

  id v10 = (void *)v16[5];
  if (a4 && v10) {
    *a4 = v10;
  }
  _Block_object_dispose(&v15, 8);

  return v10 == 0;
}

void __57__STManagementState_enableRemoteManagementForDSID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __57__STManagementState_enableRemoteManagementForDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, id))a4;
  if (_os_feature_enabled_impl())
  {
    id v7 = [(STManagementState *)self privateServiceClient];
    id v16 = 0;
    [v7 setScreenTimeEnabledForLocalUser:v4 error:&v16];
    uint64_t v8 = (void (**)(id, id))v16;

    if (v6) {
      v6[2](v6, v8);
    }
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__STManagementState_setScreenTimeEnabled_completionHandler___block_invoke;
    v14[3] = &unk_1E6BC7058;
    id v10 = v6;
    uint64_t v15 = v10;
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__STManagementState_setScreenTimeEnabled_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC6FB8;
    v12[4] = self;
    id v13 = v10;
    [v11 setScreenTimeEnabled:v4 completionHandler:v12];

    uint64_t v8 = v15;
  }
}

uint64_t __60__STManagementState_setScreenTimeEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__STManagementState_setScreenTimeEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, id))a4;
  if (_os_feature_enabled_impl())
  {
    id v7 = [(STManagementState *)self privateServiceClient];
    id v16 = 0;
    [v7 setScreenTimeSyncEnabled:v4 error:&v16];
    uint64_t v8 = (void (**)(id, id))v16;

    if (v6) {
      v6[2](v6, v8);
    }
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__STManagementState_setScreenTimeSyncingEnabled_completionHandler___block_invoke;
    v14[3] = &unk_1E6BC7058;
    id v10 = v6;
    uint64_t v15 = v10;
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__STManagementState_setScreenTimeSyncingEnabled_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC6FB8;
    v12[4] = self;
    id v13 = v10;
    [v11 setScreenTimeSyncingEnabled:v4 completionHandler:v12];

    uint64_t v8 = v15;
  }
}

uint64_t __67__STManagementState_setScreenTimeSyncingEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__STManagementState_setScreenTimeSyncingEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)screenTimeSyncStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    BOOL v5 = [(STManagementState *)self privateServiceClient];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E6BC7AD0;
    id v6 = &v16;
    id v16 = v4;
    id v7 = v4;
    [v5 isScreenTimeSyncEnabledWithCompletionHandler:v15];
  }
  else
  {
    uint64_t v8 = [(STManagementState *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E6BC7058;
    id v6 = &v14;
    id v9 = v4;
    id v14 = v9;
    BOOL v5 = [v8 remoteObjectProxyWithErrorHandler:v13];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E6BC7B98;
    void v11[4] = self;
    id v12 = v9;
    id v10 = v9;
    [v5 screenTimeSyncStateWithCompletionHandler:v11];
  }
}

uint64_t __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = 1;
    if (a2) {
      uint64_t v4 = 2;
    }
    if (a3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v4;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

uint64_t __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__STManagementState_screenTimeSyncStateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v8 = [(STManagementState *)self privateServiceClient];
    id v19 = 0;
    uint64_t v9 = [v8 isContentPrivacyEnabledForDSID:v7 error:&v19];

    id v10 = (void (**)(id, void *, id))v19;
    if (v6)
    {
      uint64_t v11 = [NSNumber numberWithBool:v9];
      v6[2](v6, v11, v10);
    }
  }
  else
  {
    id v12 = [(STManagementState *)self connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__STManagementState_isContentPrivacyEnabledForDSID_completionHandler___block_invoke;
    v17[3] = &unk_1E6BC7058;
    id v13 = v6;
    id v18 = v13;
    id v14 = [v12 remoteObjectProxyWithErrorHandler:v17];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__STManagementState_isContentPrivacyEnabledForDSID_completionHandler___block_invoke_2;
    v15[3] = &unk_1E6BC7BC0;
    void v15[4] = self;
    id v16 = v13;
    [v14 isContentPrivacyEnabledForDSID:v7 completionHandler:v15];

    id v10 = v18;
  }
}

uint64_t __70__STManagementState_isContentPrivacyEnabledForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__STManagementState_isContentPrivacyEnabledForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __64__STManagementState_communicationPoliciesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)communicationPoliciesWithError:(id *)a3
{
  uint64_t v21 = 0;
  id v22 = (id *)&v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__11;
  id v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = [(STManagementState *)self privateServiceClient];
    id v6 = v22;
    id obj = v22[5];
    uint64_t v7 = [v5 communicationPoliciesWithError:&obj];
    objc_storeStrong(v6 + 5, obj);
    uint64_t v8 = (void *)v16[5];
    v16[5] = v7;
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__STManagementState_communicationPoliciesWithError___block_invoke;
    v13[3] = &unk_1E6BC6F68;
    void v13[4] = &v21;
    uint64_t v5 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v13];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__STManagementState_communicationPoliciesWithError___block_invoke_2;
    v12[3] = &unk_1E6BC7C10;
    v12[4] = &v21;
    void v12[5] = &v15;
    [v5 communicationPoliciesWithCompletionHandler:v12];
  }

  if (a3) {
    *a3 = v22[5];
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __52__STManagementState_communicationPoliciesWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __52__STManagementState_communicationPoliciesWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
  }
  else
  {
    v14[0] = 0x1F348F2C0;
    uint64_t v9 = [NSNumber numberWithLongLong:a2];
    v14[1] = 0x1F348F2E0;
    v15[0] = v9;
    id v10 = [NSNumber numberWithLongLong:a3];
    v15[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:200 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v8);
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __72__STManagementState_communicationPoliciesForDSID_withCompletionHandler___block_invoke;
    v14[3] = &unk_1E6BC7058;
    id v10 = v7;
    id v15 = v10;
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__STManagementState_communicationPoliciesForDSID_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC7BE8;
    v12[4] = self;
    id v13 = v10;
    [v11 communicationPoliciesForDSID:v6 withCompletionHandler:v12];
  }
}

uint64_t __72__STManagementState_communicationPoliciesForDSID_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__STManagementState_communicationPoliciesForDSID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setManageContactsEnabled:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  if (_os_feature_enabled_impl())
  {
    id v10 = [(STManagementState *)self privateServiceClient];
    [v10 setManageContactsEnabled:v6 forDSID:v9 completionHandler:v8];
  }
  else
  {
    uint64_t v11 = [(STManagementState *)self connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__STManagementState_setManageContactsEnabled_forDSID_completionHandler___block_invoke;
    v17[3] = &unk_1E6BC7058;
    id v12 = v8;
    id v18 = v12;
    id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];

    if (v6) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__STManagementState_setManageContactsEnabled_forDSID_completionHandler___block_invoke_2;
    void v15[3] = &unk_1E6BC6FB8;
    void v15[4] = self;
    id v16 = v12;
    [v13 setContactManagementState:v14 forDSID:v9 completionHandler:v15];
  }
}

uint64_t __72__STManagementState_setManageContactsEnabled_forDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__STManagementState_setManageContactsEnabled_forDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestToManageContactsForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(STManagementState *)self privateServiceClient];
    [v8 requestToManageContactsForDSID:v7 completionHandler:v6];
  }
  else
  {
    id v9 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __70__STManagementState_requestToManageContactsForDSID_completionHandler___block_invoke;
    v14[3] = &unk_1E6BC7058;
    id v10 = v6;
    id v15 = v10;
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__STManagementState_requestToManageContactsForDSID_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC6FB8;
    v12[4] = self;
    id v13 = v10;
    [v11 setContactManagementState:1 forDSID:v7 completionHandler:v12];
  }
}

uint64_t __70__STManagementState_requestToManageContactsForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__STManagementState_requestToManageContactsForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(STManagementState *)self privateServiceClient];
    [v8 fetchContactManagementStateForDSID:v7 completionHandler:v6];
  }
  else
  {
    id v9 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __69__STManagementState_contactManagementStateForDSID_completionHandler___block_invoke;
    v14[3] = &unk_1E6BC7058;
    id v10 = v6;
    id v15 = v10;
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__STManagementState_contactManagementStateForDSID_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC7B98;
    v12[4] = self;
    id v13 = v10;
    [v11 contactManagementStateForDSID:v7 completionHandler:v12];
  }
}

uint64_t __69__STManagementState_contactManagementStateForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__STManagementState_contactManagementStateForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)primaryiCloudCardDAVAccountIdentifierWithError:(id *)a3
{
  uint64_t v21 = 0;
  id v22 = (id *)&v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__11;
  id v19 = __Block_byref_object_dispose__11;
  id v20 = 0;
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = [(STManagementState *)self privateServiceClient];
    id v6 = v22;
    id obj = v22[5];
    uint64_t v7 = [v5 primaryiCloudCardDAVAccountIdentifierWithError:&obj];
    objc_storeStrong(v6 + 5, obj);
    id v8 = (void *)v16[5];
    v16[5] = v7;
  }
  else
  {
    id v9 = [(STManagementState *)self connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__STManagementState_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke;
    v13[3] = &unk_1E6BC6F68;
    void v13[4] = &v21;
    uint64_t v5 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v13];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__STManagementState_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke_2;
    v12[3] = &unk_1E6BC7C38;
    v12[4] = &v21;
    void v12[5] = &v15;
    [v5 primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:v12];
  }

  if (a3) {
    *a3 = v22[5];
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __68__STManagementState_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __68__STManagementState_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *uint64_t v7 = v9;
}

- (BOOL)performMigrationFromMCXSettings:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__11;
  id v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  int v7 = _os_feature_enabled_impl();
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:200 userInfo:0];
    id v9 = (void *)v17[5];
    void v17[5] = v8;
  }
  else
  {
    id v10 = [(STManagementState *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__STManagementState_performMigrationFromMCXSettings_error___block_invoke;
    void v15[3] = &unk_1E6BC6F68;
    void v15[4] = &v16;
    id v9 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v15];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __59__STManagementState_performMigrationFromMCXSettings_error___block_invoke_2;
    v14[3] = &unk_1E6BC6F68;
    void v14[4] = &v16;
    [v9 performMigrationFromMCXSettings:v6 completionHandler:v14];
  }

  id v11 = (void *)v17[5];
  if (v11)
  {
    char v12 = 0;
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    char v12 = v7 ^ 1;
  }
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __59__STManagementState_performMigrationFromMCXSettings_error___block_invoke(uint64_t a1, void *a2)
{
}

void __59__STManagementState_performMigrationFromMCXSettings_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)applyDefaultUserPoliciesWithError:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__11;
  uint64_t v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(STManagementState *)self privateServiceClient];
    id v6 = (id *)(v14 + 5);
    id obj = (id)v14[5];
    [v5 applyDefaultUserPoliciesWithError:&obj];
    objc_storeStrong(v6, obj);
  }
  else
  {
    int v7 = [(STManagementState *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__STManagementState_applyDefaultUserPoliciesWithError___block_invoke;
    v11[3] = &unk_1E6BC6F68;
    void v11[4] = &v13;
    id v5 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__STManagementState_applyDefaultUserPoliciesWithError___block_invoke_2;
    v10[3] = &unk_1E6BC6F68;
    v10[4] = &v13;
    [v5 applyDefaultUserPoliciesWithCompletionHandler:v10];
  }

  uint64_t v8 = (void *)v14[5];
  if (a3 && v8) {
    *a3 = v8;
  }
  _Block_object_dispose(&v13, 8);

  return v8 == 0;
}

void __55__STManagementState_applyDefaultUserPoliciesWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __55__STManagementState_applyDefaultUserPoliciesWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__11;
  id v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  if (_os_feature_enabled_impl())
  {
    id v10 = [(STManagementState *)self privateServiceClient];
    id v11 = (id *)(v19 + 5);
    id obj = (id)v19[5];
    [v10 permitWebFilterURL:v8 pageTitle:v9 error:&obj];
    objc_storeStrong(v11, obj);
  }
  else
  {
    char v12 = [(STManagementState *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__STManagementState_permitWebFilterURL_pageTitle_error___block_invoke;
    v16[3] = &unk_1E6BC6F68;
    v16[4] = &v18;
    id v10 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v16];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__STManagementState_permitWebFilterURL_pageTitle_error___block_invoke_2;
    void v15[3] = &unk_1E6BC6F68;
    void v15[4] = &v18;
    [v10 permitWebFilterURL:v8 pageTitle:v9 completionHandler:v15];
  }

  uint64_t v13 = (void *)v19[5];
  if (a5 && v13) {
    *a5 = v13;
  }
  _Block_object_dispose(&v18, 8);

  return v13 == 0;
}

void __56__STManagementState_permitWebFilterURL_pageTitle_error___block_invoke(uint64_t a1, void *a2)
{
}

void __56__STManagementState_permitWebFilterURL_pageTitle_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11;
  v28 = __Block_byref_object_dispose__11;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__11;
  id v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  if (_os_feature_enabled_impl())
  {
    int v7 = [(STManagementState *)self privateServiceClient];
    id v8 = v25;
    id obj = v25[5];
    uint64_t v9 = [v7 shouldAllowOneMoreMinuteForBundleIdentifier:v6 error:&obj];
    objc_storeStrong(v8 + 5, obj);
    id v10 = (void *)v19[5];
    v19[5] = v9;
  }
  else
  {
    id v11 = [(STManagementState *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__STManagementState_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke;
    v16[3] = &unk_1E6BC6F68;
    v16[4] = &v24;
    int v7 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v16];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__STManagementState_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke_2;
    void v15[3] = &unk_1E6BC7538;
    void v15[4] = &v24;
    void v15[5] = &v18;
    [v7 shouldAllowOneMoreMinuteForBundleIdentifier:v6 replyHandler:v15];
  }

  char v12 = (void *)v19[5];
  if (a4 && !v12)
  {
    *a4 = v25[5];
    char v12 = (void *)v19[5];
  }
  id v13 = v12;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __71__STManagementState_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71__STManagementState_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  id *v6 = v8;
}

- (id)shouldAllowOneMoreMinuteForWebDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11;
  v28 = __Block_byref_object_dispose__11;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__11;
  id v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  if (_os_feature_enabled_impl())
  {
    int v7 = [(STManagementState *)self privateServiceClient];
    id v8 = v25;
    id obj = v25[5];
    uint64_t v9 = [v7 shouldAllowOneMoreMinuteForWebDomain:v6 error:&obj];
    objc_storeStrong(v8 + 5, obj);
    id v10 = (void *)v19[5];
    v19[5] = v9;
  }
  else
  {
    id v11 = [(STManagementState *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__STManagementState_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke;
    v16[3] = &unk_1E6BC6F68;
    v16[4] = &v24;
    int v7 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v16];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__STManagementState_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke_2;
    void v15[3] = &unk_1E6BC7538;
    void v15[4] = &v24;
    void v15[5] = &v18;
    [v7 shouldAllowOneMoreMinuteForWebDomain:v6 replyHandler:v15];
  }

  char v12 = (void *)v19[5];
  if (a4 && !v12)
  {
    *a4 = v25[5];
    char v12 = (void *)v19[5];
  }
  id v13 = v12;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __64__STManagementState_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke(uint64_t a1, void *a2)
{
}

void __64__STManagementState_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  id *v6 = v8;
}

- (id)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11;
  v28 = __Block_byref_object_dispose__11;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__11;
  id v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  if (_os_feature_enabled_impl())
  {
    int v7 = [(STManagementState *)self privateServiceClient];
    id v8 = v25;
    id obj = v25[5];
    uint64_t v9 = [v7 shouldAllowOneMoreMinuteForCategoryIdentifier:v6 error:&obj];
    objc_storeStrong(v8 + 5, obj);
    id v10 = (void *)v19[5];
    v19[5] = v9;
  }
  else
  {
    id v11 = [(STManagementState *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__STManagementState_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke;
    v16[3] = &unk_1E6BC6F68;
    v16[4] = &v24;
    int v7 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v16];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__STManagementState_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke_2;
    void v15[3] = &unk_1E6BC7538;
    void v15[4] = &v24;
    void v15[5] = &v18;
    [v7 shouldAllowOneMoreMinuteForCategoryIdentifier:v6 replyHandler:v15];
  }

  char v12 = (void *)v19[5];
  if (a4 && !v12)
  {
    *a4 = v25[5];
    char v12 = (void *)v19[5];
  }
  id v13 = v12;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __73__STManagementState_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73__STManagementState_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  id *v6 = v8;
}

- (void)isExplicitContentRestricted:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(STManagementState *)self privateServiceClient];
    [v5 isExplicitContentRestricted:v4];
  }
  else
  {
    id v6 = [(STManagementState *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__STManagementState_isExplicitContentRestricted___block_invoke;
    v11[3] = &unk_1E6BC7058;
    id v7 = v4;
    id v12 = v7;
    id v8 = [v6 remoteObjectProxyWithErrorHandler:v11];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__STManagementState_isExplicitContentRestricted___block_invoke_2;
    v9[3] = &unk_1E6BC7B20;
    v9[4] = self;
    id v10 = v7;
    [v8 isExplicitContentRestrictedWithCompletionHandler:v9];
  }
}

uint64_t __49__STManagementState_isExplicitContentRestricted___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__STManagementState_isExplicitContentRestricted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isWebContentRestricted:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(STManagementState *)self privateServiceClient];
    [v5 isWebContentRestricted:v4];
  }
  else
  {
    id v6 = [(STManagementState *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__STManagementState_isWebContentRestricted___block_invoke;
    v11[3] = &unk_1E6BC7058;
    id v7 = v4;
    id v12 = v7;
    id v8 = [v6 remoteObjectProxyWithErrorHandler:v11];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__STManagementState_isWebContentRestricted___block_invoke_2;
    v9[3] = &unk_1E6BC7B20;
    v9[4] = self;
    id v10 = v7;
    [v8 isWebContentRestrictedWithCompletionHandler:v9];
  }
}

uint64_t __44__STManagementState_isWebContentRestricted___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__STManagementState_isWebContentRestricted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enableWebContentFilterWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(STManagementState *)self privateServiceClient];
    [v5 enableWebContentFilterWithCompletionHandler:v4];
  }
  else
  {
    id v6 = [(STManagementState *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__STManagementState_enableWebContentFilterWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E6BC7058;
    id v7 = v4;
    id v12 = v7;
    id v8 = [v6 remoteObjectProxyWithErrorHandler:v11];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__STManagementState_enableWebContentFilterWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E6BC6FB8;
    v9[4] = self;
    id v10 = v7;
    [v8 enableWebContentFilterWithCompletionHandler:v9];
  }
}

uint64_t __65__STManagementState_enableWebContentFilterWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__STManagementState_enableWebContentFilterWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(STManagementState *)self privateServiceClient];
    [v8 fetchLastModificationDateForDSID:v7 completionHandler:v6];
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __66__STManagementState_lastModifcationDateForDSID_completionHandler___block_invoke;
    v14[3] = &unk_1E6BC7058;
    id v10 = v6;
    id v15 = v10;
    id v11 = [v9 remoteObjectProxyWithErrorHandler:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__STManagementState_lastModifcationDateForDSID_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC7C60;
    v12[4] = self;
    id v13 = v10;
    [v11 lastModifcationDateForDSID:v7 completionHandler:v12];
  }
}

uint64_t __66__STManagementState_lastModifcationDateForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__STManagementState_lastModifcationDateForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(STManagementState *)self privateServiceClient];
    [v8 lastCommunicationLimitsModificationDateForDSID:v7 completionHandler:v6];
  }
  else
  {
    uint64_t v9 = [(STManagementState *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __85__STManagementState_lastCommunicationLimitsModifcationDateForDSID_completionHandler___block_invoke;
    v14[3] = &unk_1E6BC7058;
    id v10 = v6;
    id v15 = v10;
    id v11 = [v9 remoteObjectProxyWithErrorHandler:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__STManagementState_lastCommunicationLimitsModifcationDateForDSID_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC7C60;
    v12[4] = self;
    id v13 = v10;
    [v11 lastCommunicationLimitsModifcationDateForDSID:v7 completionHandler:v12];
  }
}

uint64_t __85__STManagementState_lastCommunicationLimitsModifcationDateForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__STManagementState_lastCommunicationLimitsModifcationDateForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (_os_feature_enabled_impl())
  {
    id v11 = [(STManagementState *)self privateServiceClient];
    [v11 applyIntroductionModel:v10 forDSID:v9 completionHandler:v8];
  }
  else
  {
    id v12 = [(STManagementState *)self connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__STManagementState_applyIntroductionModel_forDSID_completionHandler___block_invoke;
    v17[3] = &unk_1E6BC7058;
    id v13 = v8;
    id v18 = v13;
    uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v17];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__STManagementState_applyIntroductionModel_forDSID_completionHandler___block_invoke_2;
    void v15[3] = &unk_1E6BC6FB8;
    void v15[4] = self;
    id v16 = v13;
    [v14 applyIntroductionModel:v10 forDSID:v9 completionHandler:v15];
  }
}

uint64_t __70__STManagementState_applyIntroductionModel_forDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__STManagementState_applyIntroductionModel_forDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog ask];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[STManagementState isLocationSharingModificationAllowedForDSID:completionHandler:]();
  }

  if (_os_feature_enabled_impl())
  {
    id v9 = [(STManagementState *)self privateServiceClient];
    [v9 isAllowFindMyFriendsModificationSetForDSID:v6 completionHandler:v7];
  }
  else
  {
    id v10 = [(STManagementState *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__STManagementState_isLocationSharingModificationAllowedForDSID_completionHandler___block_invoke;
    void v15[3] = &unk_1E6BC7058;
    id v11 = v7;
    id v16 = v11;
    id v12 = [v10 remoteObjectProxyWithErrorHandler:v15];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__STManagementState_isLocationSharingModificationAllowedForDSID_completionHandler___block_invoke_2;
    v13[3] = &unk_1E6BC7BC0;
    void v13[4] = self;
    id v14 = v11;
    [v12 isLocationSharingModificationAllowedForDSID:v6 completionHandler:v13];

    id v9 = v16;
  }
}

uint64_t __83__STManagementState_isLocationSharingModificationAllowedForDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__STManagementState_isLocationSharingModificationAllowedForDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[STLog ask];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[STManagementState setLocationSharingModificationAllowed:forDSID:completionHandler:]();
  }

  if (_os_feature_enabled_impl())
  {
    id v11 = [(STManagementState *)self privateServiceClient];
    [v11 updateAllowFindMyFriendsModification:v6 forDSID:v8 completionHandler:v9];
  }
  else
  {
    id v12 = [(STManagementState *)self connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__STManagementState_setLocationSharingModificationAllowed_forDSID_completionHandler___block_invoke;
    v17[3] = &unk_1E6BC7058;
    id v13 = v9;
    id v18 = v13;
    id v14 = [v12 remoteObjectProxyWithErrorHandler:v17];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__STManagementState_setLocationSharingModificationAllowed_forDSID_completionHandler___block_invoke_2;
    void v15[3] = &unk_1E6BC6FB8;
    void v15[4] = self;
    id v16 = v13;
    [v14 setLocationSharingModificationAllowed:v6 forDSID:v8 completionHandler:v15];

    id v11 = v18;
  }
}

uint64_t __85__STManagementState_setLocationSharingModificationAllowed_forDSID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__STManagementState_setLocationSharingModificationAllowed_forDSID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)postNotificationForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(STManagementState *)self connection];
  id v6 = [v5 remoteObjectProxy];

  [v6 postNotificationForContext:v4];
}

- (BOOL)triggerDowngradeMigrationWithOutError:(id *)a3
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__11;
    id v19 = __Block_byref_object_dispose__11;
    id v20 = 0;
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v5 = [(STManagementState *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__STManagementState_triggerDowngradeMigrationWithOutError___block_invoke;
    v10[3] = &unk_1E6BC7560;
    v10[4] = &v15;
    void v10[5] = &v11;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__STManagementState_triggerDowngradeMigrationWithOutError___block_invoke_2;
    v9[3] = &unk_1E6BC7C88;
    v9[4] = self;
    void v9[5] = &v15;
    v9[6] = &v11;
    [v6 triggerDowngradeMigrationWithCompletionHandler:v9];
    if (a3) {
      *a3 = (id) v16[5];
    }
    BOOL v7 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v7 = 0;
    if (a3) {
      *a3 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:1 userInfo:0];
    }
  }
  return v7;
}

void __59__STManagementState_triggerDowngradeMigrationWithOutError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __59__STManagementState_triggerDowngradeMigrationWithOutError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = v3;
  if (v3)
  {
    id v3 = v3;
    char v5 = 0;
  }
  else
  {
    char v5 = 1;
  }
  id v6 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

- (BOOL)cachedShouldRequestMoreTime
{
  return self->_cachedShouldRequestMoreTime;
}

- (void)setCachedShouldRequestMoreTime:(BOOL)a3
{
  self->_cachedShouldRequestMoreTime = a3;
}

- (BOOL)cachedIsRestrictionsPasscodeSet
{
  return self->_cachedIsRestrictionsPasscodeSet;
}

- (void)setConnection:(id)a3
{
}

- (STPrivateServiceClient)privateServiceClient
{
  return self->_privateServiceClient;
}

- (void)setPrivateServiceClient:(id)a3
{
}

- (BOOL)contactsEditable
{
  return self->_contactsEditable;
}

- (void)shouldRequestMoreTime
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Synchronously calling -shouldRequestMoreTime", v2, v3, v4, v5, v6);
}

void __42__STManagementState_shouldRequestMoreTime__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Requesting more time failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)shouldRequestMoreTime:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Asynchronously calling -shouldRequestMoreTime:", v2, v3, v4, v5, v6);
}

void __43__STManagementState_shouldRequestMoreTime___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed checking if user is managed with error: %@.", v2, v3, v4, v5, v6);
}

void __43__STManagementState_shouldRequestMoreTime___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "fetching should request more time failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)isRestrictionsPasscodeSet
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Synchronously calling -isRestrictionsPasscodeSet:", v2, v3, v4, v5, v6);
}

void __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Requesting restrictions passcode failed: %{public}@", v2, v3, v4, v5, v6);
}

void __46__STManagementState_isRestrictionsPasscodeSet__block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "failed to fetch isRestrictionsPasscodeSet, falling back to last known good value: %{public}@", v2, v3, v4, v5, v6);
}

- (void)clearRestrictionsPasscodeWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isRestrictionsPasscodeSet:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Asynchronously calling -isRestrictionsPasscodeSet:", v2, v3, v4, v5, v6);
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed checking if restrictions paccode is set with error: %@.", v2, v3, v4, v5, v6);
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "proxy: fetching isRestrictionPasscodeSet failed: %{public}@", v2, v3, v4, v5, v6);
}

void __47__STManagementState_isRestrictionsPasscodeSet___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "fetching isRestrictionPasscodeSet failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)needsToSetRestrictionsPasscode
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to get needsToSetRestrictionsPasscode, %{public}@", v2, v3, v4, v5, v6);
}

void __51__STManagementState_needsToSetRestrictionsPasscode__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to communicate with Screen Time agent to get needsToSetRestrictionsPasscode, %{public}@", v2, v3, v4, v5, v6);
}

void __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Updated restrictions passcode for local user", v2, v3, v4, v5, v6);
}

void __63__STManagementState_setRestrictionsPasscode_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to set Restrictions Passcode, %{public}@", v2, v3, v4, v5, v6);
}

- (void)isLocationSharingModificationAllowedForDSID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Calling -isLocationSharingModificationAllowedForDSID", v2, v3, v4, v5, v6);
}

- (void)setLocationSharingModificationAllowed:forDSID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1DA519000, v0, v1, "Calling -setLocationSharingModificationAllowed", v2, v3, v4, v5, v6);
}

@end