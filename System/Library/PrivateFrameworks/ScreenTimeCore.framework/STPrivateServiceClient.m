@interface STPrivateServiceClient
- (BOOL)clearRestrictionsPasscodeWithError:(id *)a3;
- (BOOL)contactsEditable;
- (BOOL)isContentPrivacyEnabledForDSID:(id)a3 error:(id *)a4;
- (BOOL)isRestrictionsPasscodeSetWithError:(id *)a3;
- (BOOL)isScreenTimeEnabledForRemoteUserWithDSID:(id)a3 error:(id *)a4;
- (BOOL)isScreenTimeSyncEnabledWithError:(id *)a3;
- (BOOL)needsToSetRestrictionsPasscodeWithError:(id *)a3;
- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5;
- (BOOL)shouldRequestMoreTimeWithError:(id *)a3;
- (NSXPCConnection)connection;
- (STPrivateServiceClient)init;
- (id)communicationPoliciesWithError:(id *)a3;
- (id)isScreenTimeEnabledForLocalUserWithError:(id *)a3;
- (id)primaryiCloudCardDAVAccountIdentifierWithError:(id *)a3;
- (id)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 error:(id *)a4;
- (id)shouldAllowOneMoreMinuteForWebDomain:(id)a3 error:(id *)a4;
- (void)applyDefaultUserPoliciesWithError:(id *)a3;
- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4;
- (void)communicationPoliciesWithCompletionHandler:(id)a3;
- (void)contactsEditable;
- (void)dealloc;
- (void)deleteAllWebHistoryForApplication:(id)a3 completionHandler:(id)a4;
- (void)deleteAllWebHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 completionHandler:(id)a5;
- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)enableRemoteManagementForDSID:(id)a3 error:(id *)a4;
- (void)fetchContactManagementStateForDSID:(id)a3 completionHandler:(id)a4;
- (void)fetchLastModificationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)forceFamilyFetchWithCompletionHandler:(id)a3;
- (void)isAllowFindMyFriendsModificationSetForDSID:(id)a3 completionHandler:(id)a4;
- (void)isExplicitContentRestricted:(id)a3;
- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3;
- (void)isScreenTimeSyncEnabledWithCompletionHandler:(id)a3;
- (void)lastCommunicationLimitsModificationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)requestToManageContactsForDSID:(id)a3 completionHandler:(id)a4;
- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setManageContactsEnabled:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4;
- (void)setScreenTimeEnabledForLocalUser:(BOOL)a3 error:(id *)a4;
- (void)setScreenTimeEnabledForRemoteUserWithDSID:(id)a3 enabled:(BOOL)a4 error:(id *)a5;
- (void)setScreenTimeSyncEnabled:(BOOL)a3 error:(id *)a4;
- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3;
- (void)updateAllowFindMyFriendsModification:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5;
@end

@implementation STPrivateServiceClient

- (STPrivateServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STPrivateServiceClient;
  v2 = [(STPrivateServiceClient *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B5168];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.private" options:4096];
    [v4 setRemoteObjectInterface:v3];
    [v4 setInterruptionHandler:&__block_literal_global_23];
    [v4 setInvalidationHandler:&__block_literal_global_94];
    [v4 resume];
    [(STPrivateServiceClient *)v2 setConnection:v4];
  }
  return v2;
}

void __30__STPrivateServiceClient_init__block_invoke()
{
  v0 = +[STLog privateService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __30__STPrivateServiceClient_init__block_invoke_cold_1(v0);
  }
}

void __30__STPrivateServiceClient_init__block_invoke_92()
{
  v0 = +[STLog privateService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __30__STPrivateServiceClient_init__block_invoke_92_cold_1(v0);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STPrivateServiceClient;
  [(STPrivateServiceClient *)&v4 dealloc];
}

- (id)isScreenTimeEnabledForLocalUserWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20;
  v21 = __Block_byref_object_dispose__20;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  objc_super v4 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__STPrivateServiceClient_isScreenTimeEnabledForLocalUserWithError___block_invoke;
  v10[3] = &unk_1E6BC6F68;
  v10[4] = &v11;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__STPrivateServiceClient_isScreenTimeEnabledForLocalUserWithError___block_invoke_2;
  v9[3] = &unk_1E6BC6F90;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 isScreenTimeEnabledForLocalUserWithCompletionHandler:v9];
  if (!v18[5])
  {
    objc_super v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient isScreenTimeEnabledForLocalUserWithError:]();
    }

    if (a3) {
      *a3 = (id) v12[5];
    }
  }
  id v7 = (id)v18[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __67__STPrivateServiceClient_isScreenTimeEnabledForLocalUserWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __67__STPrivateServiceClient_isScreenTimeEnabledForLocalUserWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    uint64_t v8 = [NSNumber numberWithBool:a2];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)isScreenTimeEnabledForRemoteUserWithDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__20;
  v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  id v7 = [(STPrivateServiceClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__STPrivateServiceClient_isScreenTimeEnabledForRemoteUserWithDSID_error___block_invoke;
  v13[3] = &unk_1E6BC7560;
  v13[4] = &v14;
  v13[5] = &v20;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__STPrivateServiceClient_isScreenTimeEnabledForRemoteUserWithDSID_error___block_invoke_2;
  v12[3] = &unk_1E6BC6F90;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 isScreenTimeEnabledForRemoteUserWithDSID:v6 completionHandler:v12];
  if (v15[5])
  {
    uint64_t v9 = +[STLog privateService];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient isScreenTimeEnabledForLocalUserWithError:]();
    }

    if (a4) {
      *a4 = (id) v15[5];
    }
  }
  char v10 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __73__STPrivateServiceClient_isScreenTimeEnabledForRemoteUserWithDSID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __73__STPrivateServiceClient_isScreenTimeEnabledForRemoteUserWithDSID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)setScreenTimeEnabledForLocalUser:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  id v6 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__STPrivateServiceClient_setScreenTimeEnabledForLocalUser_error___block_invoke;
  v10[3] = &unk_1E6BC6F68;
  v10[4] = &v11;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__STPrivateServiceClient_setScreenTimeEnabledForLocalUser_error___block_invoke_2;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v11;
  [v7 setScreenTimeEnabledForLocalUser:v5 completionHandler:v9];
  if (v12[5])
  {
    uint64_t v8 = +[STLog privateService];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient setScreenTimeEnabledForLocalUser:error:]();
    }

    if (a4) {
      *a4 = (id) v12[5];
    }
  }

  _Block_object_dispose(&v11, 8);
}

void __65__STPrivateServiceClient_setScreenTimeEnabledForLocalUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__STPrivateServiceClient_setScreenTimeEnabledForLocalUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)setScreenTimeEnabledForRemoteUserWithDSID:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__20;
  uint64_t v20 = __Block_byref_object_dispose__20;
  id v21 = 0;
  uint64_t v9 = [(STPrivateServiceClient *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__STPrivateServiceClient_setScreenTimeEnabledForRemoteUserWithDSID_enabled_error___block_invoke;
  v15[3] = &unk_1E6BC6F68;
  v15[4] = &v16;
  char v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v15];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__STPrivateServiceClient_setScreenTimeEnabledForRemoteUserWithDSID_enabled_error___block_invoke_2;
  v14[3] = &unk_1E6BC6F68;
  v14[4] = &v16;
  [v10 setScreenTimeEnabledForRemoteUserWithDSID:v8 enabled:v6 completionHandler:v14];
  if (v17[5])
  {
    uint64_t v11 = +[STLog privateService];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = "clearing";
      uint64_t v13 = v17[5];
      *(_DWORD *)buf = 136315650;
      if (v6) {
        v12 = "setting";
      }
      char v23 = v12;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2114;
      uint64_t v27 = v13;
      _os_log_error_impl(&dword_1DA519000, v11, OS_LOG_TYPE_ERROR, "Failed %s screenTime enabled for dsid %@ with error: %{public}@", buf, 0x20u);
    }

    if (a5) {
      *a5 = (id) v17[5];
    }
  }

  _Block_object_dispose(&v16, 8);
}

void __82__STPrivateServiceClient_setScreenTimeEnabledForRemoteUserWithDSID_enabled_error___block_invoke(uint64_t a1, void *a2)
{
}

void __82__STPrivateServiceClient_setScreenTimeEnabledForRemoteUserWithDSID_enabled_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)enableRemoteManagementForDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  uint64_t v16 = __Block_byref_object_dispose__20;
  id v17 = 0;
  id v7 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__STPrivateServiceClient_enableRemoteManagementForDSID_error___block_invoke;
  v11[3] = &unk_1E6BC6F68;
  v11[4] = &v12;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__STPrivateServiceClient_enableRemoteManagementForDSID_error___block_invoke_2;
  v10[3] = &unk_1E6BC6F68;
  v10[4] = &v12;
  [v8 enableRemoteManagementForDSID:v6 completionHandler:v10];
  if (v13[5])
  {
    uint64_t v9 = +[STLog privateService];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient enableRemoteManagementForDSID:error:]();
    }

    if (a4) {
      *a4 = (id) v13[5];
    }
  }

  _Block_object_dispose(&v12, 8);
}

void __62__STPrivateServiceClient_enableRemoteManagementForDSID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __62__STPrivateServiceClient_enableRemoteManagementForDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (BOOL)isScreenTimeSyncEnabledWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  id v4 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__STPrivateServiceClient_isScreenTimeSyncEnabledWithError___block_invoke;
  v10[3] = &unk_1E6BC7560;
  v10[4] = &v11;
  void v10[5] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__STPrivateServiceClient_isScreenTimeSyncEnabledWithError___block_invoke_2;
  v9[3] = &unk_1E6BC6F90;
  v9[4] = &v17;
  void v9[5] = &v11;
  [v5 isScreenTimeSyncEnabledWithCompletionHandler:v9];
  if (v12[5])
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient isScreenTimeSyncEnabledWithError:]();
    }

    if (a3) {
      *a3 = (id) v12[5];
    }
  }
  char v7 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __59__STPrivateServiceClient_isScreenTimeSyncEnabledWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __59__STPrivateServiceClient_isScreenTimeSyncEnabledWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)isScreenTimeSyncEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STPrivateServiceClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__STPrivateServiceClient_isScreenTimeSyncEnabledWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BC7058;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 isScreenTimeSyncEnabledWithCompletionHandler:v6];
}

uint64_t __71__STPrivateServiceClient_isScreenTimeSyncEnabledWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setScreenTimeSyncEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  id v6 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__STPrivateServiceClient_setScreenTimeSyncEnabled_error___block_invoke;
  v10[3] = &unk_1E6BC6F68;
  v10[4] = &v11;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__STPrivateServiceClient_setScreenTimeSyncEnabled_error___block_invoke_2;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v11;
  [v7 setScreenTimeSyncEnabled:v5 completionHandler:v9];
  if (v12[5])
  {
    id v8 = +[STLog privateService];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient setScreenTimeSyncEnabled:error:]();
    }

    if (a4) {
      *a4 = (id) v12[5];
    }
  }

  _Block_object_dispose(&v11, 8);
}

void __57__STPrivateServiceClient_setScreenTimeSyncEnabled_error___block_invoke(uint64_t a1, void *a2)
{
}

void __57__STPrivateServiceClient_setScreenTimeSyncEnabled_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (BOOL)shouldRequestMoreTimeWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  id v4 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__STPrivateServiceClient_shouldRequestMoreTimeWithError___block_invoke;
  v10[3] = &unk_1E6BC7560;
  v10[4] = &v11;
  void v10[5] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__STPrivateServiceClient_shouldRequestMoreTimeWithError___block_invoke_2;
  v9[3] = &unk_1E6BC6F90;
  v9[4] = &v17;
  void v9[5] = &v11;
  [v5 shouldRequestMoreTimeWithCompletionHandler:v9];
  if (v12[5])
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient shouldRequestMoreTimeWithError:]();
    }

    if (a3) {
      *a3 = (id) v12[5];
    }
  }
  char v7 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __57__STPrivateServiceClient_shouldRequestMoreTimeWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __57__STPrivateServiceClient_shouldRequestMoreTimeWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_102;
  v9[3] = &unk_1E6BC7AD0;
  id v10 = v6;
  id v8 = v6;
  [v7 shouldRequestMoreTimeWithCompletionHandler:v9];
}

void __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_102(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (BOOL)isContentPrivacyEnabledForDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__20;
  uint64_t v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  uint64_t v7 = [(STPrivateServiceClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__STPrivateServiceClient_isContentPrivacyEnabledForDSID_error___block_invoke;
  v13[3] = &unk_1E6BC7560;
  v13[4] = &v14;
  v13[5] = &v20;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__STPrivateServiceClient_isContentPrivacyEnabledForDSID_error___block_invoke_2;
  v12[3] = &unk_1E6BC6F90;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 isContentPrivacyEnabledForDSID:v6 completionHandler:v12];
  if (v15[5])
  {
    id v9 = +[STLog privateService];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient isContentPrivacyEnabledForDSID:error:]();
    }

    if (a4) {
      *a4 = (id) v15[5];
    }
  }
  char v10 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __63__STPrivateServiceClient_isContentPrivacyEnabledForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __63__STPrivateServiceClient_isContentPrivacyEnabledForDSID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (BOOL)clearRestrictionsPasscodeWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  id v4 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__STPrivateServiceClient_clearRestrictionsPasscodeWithError___block_invoke;
  v10[3] = &unk_1E6BC7560;
  v10[4] = &v11;
  void v10[5] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__STPrivateServiceClient_clearRestrictionsPasscodeWithError___block_invoke_2;
  v9[3] = &unk_1E6BC7560;
  void v9[4] = &v11;
  void v9[5] = &v17;
  [v5 clearRestrictionsPasscodeWithCompletionHandler:v9];
  if (v12[5])
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient clearRestrictionsPasscodeWithError:]();
    }

    if (a3) {
      *a3 = (id) v12[5];
    }
  }
  char v7 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __61__STPrivateServiceClient_clearRestrictionsPasscodeWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __61__STPrivateServiceClient_clearRestrictionsPasscodeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)isRestrictionsPasscodeSetWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  id v4 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__STPrivateServiceClient_isRestrictionsPasscodeSetWithError___block_invoke;
  v10[3] = &unk_1E6BC7560;
  v10[4] = &v11;
  void v10[5] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__STPrivateServiceClient_isRestrictionsPasscodeSetWithError___block_invoke_2;
  v9[3] = &unk_1E6BC6F90;
  void v9[4] = &v11;
  void v9[5] = &v17;
  [v5 isRestrictionsPasscodeSetWithCompletionHandler:v9];
  if (v12[5])
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient clearRestrictionsPasscodeWithError:]();
    }

    if (a3) {
      *a3 = (id) v12[5];
    }
  }
  char v7 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __61__STPrivateServiceClient_isRestrictionsPasscodeSetWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __61__STPrivateServiceClient_isRestrictionsPasscodeSetWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
    a2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_103;
  v9[3] = &unk_1E6BC7AD0;
  id v10 = v6;
  id v8 = v6;
  [v7 isRestrictionsPasscodeSetWithCompletionHandler:v9];
}

void __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_103(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_103_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (BOOL)needsToSetRestrictionsPasscodeWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  id v4 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__STPrivateServiceClient_needsToSetRestrictionsPasscodeWithError___block_invoke;
  v10[3] = &unk_1E6BC7560;
  v10[4] = &v11;
  void v10[5] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__STPrivateServiceClient_needsToSetRestrictionsPasscodeWithError___block_invoke_2;
  v9[3] = &unk_1E6BC6F90;
  void v9[4] = &v11;
  void v9[5] = &v17;
  [v5 needsToSetRestrictionsPasscodeWithCompletionHandler:v9];
  if (v12[5])
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient needsToSetRestrictionsPasscodeWithError:]();
    }

    if (a3) {
      *a3 = (id) v12[5];
    }
  }
  char v7 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __66__STPrivateServiceClient_needsToSetRestrictionsPasscodeWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __66__STPrivateServiceClient_needsToSetRestrictionsPasscodeWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v5 = v6;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__STPrivateServiceClient_setRestrictionsPasscode_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];

  [v10 setRestrictionsPasscode:v7 completionHandler:v9];
}

void __68__STPrivateServiceClient_setRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__STPrivateServiceClient_setRestrictionsPasscode_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__STPrivateServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];

  [v10 authenticateRestrictionsPasscode:v7 completionHandler:v9];
}

void __77__STPrivateServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__STPrivateServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STPrivateServiceClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BC7058;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 fetchRestrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:v6];
}

void __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

- (void)communicationPoliciesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STPrivateServiceClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__STPrivateServiceClient_communicationPoliciesWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BC7058;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 fetchCommunicationPoliciesWithCompletionHandler:v6];
}

void __69__STPrivateServiceClient_communicationPoliciesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

- (id)communicationPoliciesWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__20;
  id v21 = __Block_byref_object_dispose__20;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  id v4 = [(STPrivateServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__STPrivateServiceClient_communicationPoliciesWithError___block_invoke;
  v10[3] = &unk_1E6BC6F68;
  v10[4] = &v17;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__STPrivateServiceClient_communicationPoliciesWithError___block_invoke_2;
  v9[3] = &unk_1E6BC7C10;
  void v9[4] = &v17;
  void v9[5] = &v11;
  [v5 fetchCommunicationPoliciesWithCompletionHandler:v9];
  if (v18[5])
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient communicationPoliciesWithError:]();
    }

    if (a3) {
      *a3 = (id) v18[5];
    }
  }
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __57__STPrivateServiceClient_communicationPoliciesWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __57__STPrivateServiceClient_communicationPoliciesWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
  }
  else
  {
    v14[0] = @"STCommunicationPolicyKey";
    id v9 = [NSNumber numberWithLongLong:a2];
    v14[1] = @"STCommunicationWhileLimitedPolicyKey";
    v15[0] = v9;
    id v10 = [NSNumber numberWithLongLong:a3];
    v15[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (void)setManageContactsEnabled:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(STPrivateServiceClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__STPrivateServiceClient_setManageContactsEnabled_forDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E6BC7058;
  id v14 = v8;
  id v11 = v8;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v13];

  [v12 setManageContactsEnabled:v6 forDSID:v9 completionHandler:v11];
}

void __77__STPrivateServiceClient_setManageContactsEnabled_forDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__STPrivateServiceClient_setManageContactsEnabled_forDSID_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)requestToManageContactsForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STPrivateServiceClient *)self connection];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __75__STPrivateServiceClient_requestToManageContactsForDSID_completionHandler___block_invoke;
  v15 = &unk_1E6BC6FB8;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 remoteObjectProxyWithErrorHandler:&v12];

  objc_msgSend(v11, "requestToManageContactsForDSID:completionHandler:", v10, v9, v12, v13, v14, v15);
}

void __75__STPrivateServiceClient_requestToManageContactsForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__STPrivateServiceClient_requestToManageContactsForDSID_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)fetchContactManagementStateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STPrivateServiceClient *)self connection];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __79__STPrivateServiceClient_fetchContactManagementStateForDSID_completionHandler___block_invoke;
  v15 = &unk_1E6BC6FB8;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 remoteObjectProxyWithErrorHandler:&v12];

  objc_msgSend(v11, "fetchContactManagementStateForDSID:completionHandler:", v10, v9, v12, v13, v14, v15);
}

void __79__STPrivateServiceClient_fetchContactManagementStateForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__STPrivateServiceClient_fetchContactManagementStateForDSID_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (id)primaryiCloudCardDAVAccountIdentifierWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__20;
  id v22 = __Block_byref_object_dispose__20;
  id v23 = 0;
  id v4 = [(STPrivateServiceClient *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__STPrivateServiceClient_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke;
  v17[3] = &unk_1E6BC6F68;
  v17[4] = &v18;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v17];

  if (v19[5])
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STContactsServiceClient restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:]();
    }

    id v7 = 0;
    if (a3) {
      *a3 = (id) v19[5];
    }
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__20;
    v15 = __Block_byref_object_dispose__20;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__STPrivateServiceClient_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke_106;
    v10[3] = &unk_1E6BC7C38;
    v10[4] = &v18;
    void v10[5] = &v11;
    [v5 primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:v10];
    if (v19[5])
    {
      id v8 = +[STLog privateService];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[STPrivateServiceClient primaryiCloudCardDAVAccountIdentifierWithError:]();
      }

      if (a3) {
        *a3 = (id) v19[5];
      }
    }
    id v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v18, 8);

  return v7;
}

void __73__STPrivateServiceClient_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __73__STPrivateServiceClient_primaryiCloudCardDAVAccountIdentifierWithError___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)contactsEditable
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__20;
  id v17 = __Block_byref_object_dispose__20;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v2 = [(STPrivateServiceClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__STPrivateServiceClient_contactsEditable__block_invoke;
  v8[3] = &unk_1E6BC6F68;
  void v8[4] = &v13;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];

  if (v14[5])
  {
    id v4 = +[STLog privateService];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient contactsEditable]();
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__STPrivateServiceClient_contactsEditable__block_invoke_108;
    v7[3] = &unk_1E6BC7B48;
    v7[4] = &v9;
    [v3 fetchContactsEditableWithReplyHandler:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

void __42__STPrivateServiceClient_contactsEditable__block_invoke(uint64_t a1, void *a2)
{
}

void __42__STPrivateServiceClient_contactsEditable__block_invoke_108(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v5)
  {
    uint64_t v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__STPrivateServiceClient_contactsEditable__block_invoke_108_cold_1();
    }
  }
}

- (void)lastCommunicationLimitsModificationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__STPrivateServiceClient_lastCommunicationLimitsModificationDateForDSID_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];

  [v10 fetchLastCommunicationLimitsModificationDateForDSID:v7 completionHandler:v9];
}

void __91__STPrivateServiceClient_lastCommunicationLimitsModificationDateForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __91__STPrivateServiceClient_lastCommunicationLimitsModificationDateForDSID_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applyDefaultUserPoliciesWithError:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__20;
  uint64_t v13 = __Block_byref_object_dispose__20;
  id v14 = 0;
  id v4 = [(STPrivateServiceClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__STPrivateServiceClient_applyDefaultUserPoliciesWithError___block_invoke;
  v8[3] = &unk_1E6BC6F68;
  void v8[4] = &v9;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v8];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__STPrivateServiceClient_applyDefaultUserPoliciesWithError___block_invoke_2;
  v7[3] = &unk_1E6BC6F68;
  v7[4] = &v9;
  [v5 applyDefaultUserPoliciesWithCompletionHandler:v7];
  if (v10[5])
  {
    id v6 = +[STLog privateService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient applyDefaultUserPoliciesWithError:]();
    }

    if (a3) {
      *a3 = (id) v10[5];
    }
  }

  _Block_object_dispose(&v9, 8);
}

void __60__STPrivateServiceClient_applyDefaultUserPoliciesWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __60__STPrivateServiceClient_applyDefaultUserPoliciesWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__20;
  id v21 = __Block_byref_object_dispose__20;
  id v22 = 0;
  id v10 = [(STPrivateServiceClient *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__STPrivateServiceClient_permitWebFilterURL_pageTitle_error___block_invoke;
  v16[3] = &unk_1E6BC6F68;
  v16[4] = &v17;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__STPrivateServiceClient_permitWebFilterURL_pageTitle_error___block_invoke_2;
  void v15[3] = &unk_1E6BC6F68;
  v15[4] = &v17;
  [v11 permitWebFilterURL:v8 pageTitle:v9 completionHandler:v15];
  uint64_t v12 = v18[5];
  if (v12)
  {
    uint64_t v13 = +[STLog privateService];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient permitWebFilterURL:pageTitle:error:]();
    }

    if (a5) {
      *a5 = (id) v18[5];
    }
  }

  _Block_object_dispose(&v17, 8);
  return v12 == 0;
}

void __61__STPrivateServiceClient_permitWebFilterURL_pageTitle_error___block_invoke(uint64_t a1, void *a2)
{
}

void __61__STPrivateServiceClient_permitWebFilterURL_pageTitle_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)isExplicitContentRestricted:(id)a3
{
  id v4 = a3;
  id v5 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__STPrivateServiceClient_isExplicitContentRestricted___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__STPrivateServiceClient_isExplicitContentRestricted___block_invoke_109;
  v9[3] = &unk_1E6BC7B20;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 isExplicitContentRestricted:v9];
}

void __54__STPrivateServiceClient_isExplicitContentRestricted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __54__STPrivateServiceClient_isExplicitContentRestricted___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchLastModificationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__STPrivateServiceClient_fetchLastModificationDateForDSID_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];

  [v10 fetchLastModificationDateForDSID:v7 completionHandler:v9];
}

void __77__STPrivateServiceClient_fetchLastModificationDateForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(STPrivateServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __75__STPrivateServiceClient_applyIntroductionModel_forDSID_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC7058;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v14];

  [v13 applyIntroductionModel:v10 forDSID:v9 completionHandler:v12];
}

void __75__STPrivateServiceClient_applyIntroductionModel_forDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)isAllowFindMyFriendsModificationSetForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__STPrivateServiceClient_isAllowFindMyFriendsModificationSetForDSID_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];

  [v10 isAllowFindMyFriendsModificationSetForDSID:v7 completionHandler:v9];
}

void __87__STPrivateServiceClient_isAllowFindMyFriendsModificationSetForDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, MEMORY[0x1E4F1CC38], v3);
  }
}

- (void)updateAllowFindMyFriendsModification:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(STPrivateServiceClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__STPrivateServiceClient_updateAllowFindMyFriendsModification_forDSID_completionHandler___block_invoke;
  v13[3] = &unk_1E6BC7058;
  id v14 = v8;
  id v11 = v8;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v13];

  [v12 updateAllowFindMyFriendsModification:v6 forDSID:v9 completionHandler:v11];
}

void __89__STPrivateServiceClient_updateAllowFindMyFriendsModification_forDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__20;
  __int16 v24 = __Block_byref_object_dispose__20;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__20;
  id v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  id v7 = [(STPrivateServiceClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__STPrivateServiceClient_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke;
  v13[3] = &unk_1E6BC6F68;
  void v13[4] = &v20;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__STPrivateServiceClient_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E6BC7538;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 shouldAllowOneMoreMinuteForBundleIdentifier:v6 completionHandler:v12];
  if (v21[5])
  {
    id v9 = +[STLog privateService];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient shouldAllowOneMoreMinuteForBundleIdentifier:error:]();
    }

    if (a4) {
      *a4 = (id) v21[5];
    }
  }
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __76__STPrivateServiceClient_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76__STPrivateServiceClient_shouldAllowOneMoreMinuteForBundleIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)shouldAllowOneMoreMinuteForWebDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__20;
  __int16 v24 = __Block_byref_object_dispose__20;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__20;
  id v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  id v7 = [(STPrivateServiceClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__STPrivateServiceClient_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke;
  v13[3] = &unk_1E6BC6F68;
  void v13[4] = &v20;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__STPrivateServiceClient_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke_2;
  v12[3] = &unk_1E6BC7538;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 shouldAllowOneMoreMinuteForBundleIdentifier:v6 completionHandler:v12];
  if (v21[5])
  {
    id v9 = +[STLog privateService];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient shouldAllowOneMoreMinuteForWebDomain:error:]();
    }

    if (a4) {
      *a4 = (id) v21[5];
    }
  }
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __69__STPrivateServiceClient_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69__STPrivateServiceClient_shouldAllowOneMoreMinuteForWebDomain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__20;
  __int16 v24 = __Block_byref_object_dispose__20;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__20;
  id v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  id v7 = [(STPrivateServiceClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__STPrivateServiceClient_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke;
  v13[3] = &unk_1E6BC6F68;
  void v13[4] = &v20;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__STPrivateServiceClient_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E6BC7538;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 shouldAllowOneMoreMinuteForBundleIdentifier:v6 completionHandler:v12];
  if (v21[5])
  {
    id v9 = +[STLog privateService];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STPrivateServiceClient shouldAllowOneMoreMinuteForCategoryIdentifier:error:]();
    }

    if (a4) {
      *a4 = (id) v21[5];
    }
  }
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __78__STPrivateServiceClient_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __78__STPrivateServiceClient_shouldAllowOneMoreMinuteForCategoryIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)forceFamilyFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STPrivateServiceClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__STPrivateServiceClient_forceFamilyFetchWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BC7058;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 forceFamilyFetchWithCompletionHandler:v6];
}

void __64__STPrivateServiceClient_forceFamilyFetchWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__STPrivateServiceClient_forceFamilyFetchWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STPrivateServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC7058;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v14];

  [v13 deleteWebHistoryForURL:v10 webApplication:v9 completionHandler:v12];
}

void __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STPrivateServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC7058;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v14];

  [v13 deleteWebHistoryForURLs:v10 webApplication:v9 completionHandler:v12];
}

void __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STPrivateServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC7058;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v14];

  [v13 deleteWebHistoryForDomain:v10 webApplication:v9 completionHandler:v12];
}

void __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STPrivateServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC7058;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v14];

  [v13 deleteWebHistoryDuringInterval:v10 webApplication:v9 completionHandler:v12];
}

void __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteAllWebHistoryForApplication:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STPrivateServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__STPrivateServiceClient_deleteAllWebHistoryForApplication_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];

  [v10 deleteAllWebApplicationHistory:v7 completionHandler:v9];
}

void __78__STPrivateServiceClient_deleteAllWebHistoryForApplication_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__STPrivateServiceClient_deleteAllWebHistoryForApplication_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(STPrivateServiceClient *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__STPrivateServiceClient_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E6BC7058;
  id v18 = v10;
  id v15 = v10;
  uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v17];

  [v16 deleteWebHistoryForURL:v13 webApplication:v12 profileIdentifier:v11 completionHandler:v15];
}

void __97__STPrivateServiceClient_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(STPrivateServiceClient *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__STPrivateServiceClient_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E6BC7058;
  id v18 = v10;
  id v15 = v10;
  uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v17];

  [v16 deleteWebHistoryForURLs:v13 webApplication:v12 profileIdentifier:v11 completionHandler:v15];
}

void __98__STPrivateServiceClient_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(STPrivateServiceClient *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__STPrivateServiceClient_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E6BC7058;
  id v18 = v10;
  id v15 = v10;
  uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v17];

  [v16 deleteWebHistoryForDomain:v13 webApplication:v12 profileIdentifier:v11 completionHandler:v15];
}

void __100__STPrivateServiceClient_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(STPrivateServiceClient *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E6BC7058;
  id v18 = v10;
  id v15 = v10;
  uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v17];

  [v16 deleteWebHistoryDuringInterval:v13 webApplication:v12 profileIdentifier:v11 completionHandler:v15];
}

void __105__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteAllWebHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STPrivateServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __96__STPrivateServiceClient_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC7058;
  id v15 = v8;
  id v12 = v8;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v14];

  [v13 deleteAllWebApplicationHistory:v10 profileIdentifier:v9 completionHandler:v12];
}

void __96__STPrivateServiceClient_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog privateService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __30__STPrivateServiceClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "privateService connection interrupted", v1, 2u);
}

void __30__STPrivateServiceClient_init__block_invoke_92_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "privateService connection invalidated", v1, 2u);
}

- (void)isScreenTimeEnabledForLocalUserWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed checking screenTime enabled with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setScreenTimeEnabledForLocalUser:error:.cold.1()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "Failed %s screenTime enabled with error: %{public}@");
}

- (void)enableRemoteManagementForDSID:error:.cold.1()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "Failed enabling RemoteManagement for dsid %@ with error: %{public}@");
}

- (void)isScreenTimeSyncEnabledWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed checking if cloud sync is enabled with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setScreenTimeSyncEnabled:error:.cold.1()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "Failed %s cloud sync enabled with error: %{public}@");
}

- (void)shouldRequestMoreTimeWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed checking if user should request more time with error: %{public}@", v2, v3, v4, v5, v6);
}

void __69__STPrivateServiceClient_shouldRequestMoreTimeWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed checking if user should request more time with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)isContentPrivacyEnabledForDSID:error:.cold.1()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "Failed checking if content privacy is enabled for user %@ with error: %{public}@");
}

- (void)clearRestrictionsPasscodeWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed clearing restrictions passcode with error: %{public}@", v2, v3, v4, v5, v6);
}

void __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to get proxy with error: %{public}@", v2, v3, v4, v5, v6);
}

void __73__STPrivateServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to check if restrictions passcode is set with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)needsToSetRestrictionsPasscodeWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to get needsToSetRestrictionsPasscode with error: %{public}@", v2, v3, v4, v5, v6);
}

void __68__STPrivateServiceClient_setRestrictionsPasscode_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to update passcode with error: %{public}@", v2, v3, v4, v5, v6);
}

void __77__STPrivateServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to authenticate passcode with error: %{public}@", v2, v3, v4, v5, v6);
}

void __99__STPrivateServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch private service proxy with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)communicationPoliciesWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch Communication Policies with error: %{public}@", v2, v3, v4, v5, v6);
}

void __77__STPrivateServiceClient_setManageContactsEnabled_forDSID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to set manageContactsEnabled with error: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STPrivateServiceClient_requestToManageContactsForDSID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "Failed to request to manage contacts for DSID %@ with error: %{public}@");
}

void __79__STPrivateServiceClient_fetchContactManagementStateForDSID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "Failed to get contactManagementState for DSID %@ with error: %{public}@");
}

- (void)primaryiCloudCardDAVAccountIdentifierWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch primary icloud DAV Account Identifier with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)contactsEditable
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to get private service proxy with error: %{public}@", v2, v3, v4, v5, v6);
}

void __42__STPrivateServiceClient_contactsEditable__block_invoke_108_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch contactsEditable with error: %{public}@", v2, v3, v4, v5, v6);
}

void __91__STPrivateServiceClient_lastCommunicationLimitsModificationDateForDSID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to get private service proxy with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)applyDefaultUserPoliciesWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Applying default user policies failed with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)permitWebFilterURL:pageTitle:error:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Allowing a page through web content filter in safari failed with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)shouldAllowOneMoreMinuteForBundleIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "shouldAllowOneMoreMinuteForBundleIdentifier failed with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)shouldAllowOneMoreMinuteForWebDomain:error:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "shouldAllowOneMoreMinuteForWebDomain failed with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)shouldAllowOneMoreMinuteForCategoryIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "shouldAllowOneMoreMinuteForCategoryIdentifier failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __64__STPrivateServiceClient_forceFamilyFetchWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "forceFamilyFetchWithCompletionHandler failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __79__STPrivateServiceClient_deleteWebHistoryForURL_application_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "deleteWebHistoryForURL failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __80__STPrivateServiceClient_deleteWebHistoryForURLs_application_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "deleteWebHistoryForURLs failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __82__STPrivateServiceClient_deleteWebHistoryForDomain_application_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "deleteWebHistoryForDomain failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __87__STPrivateServiceClient_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "deleteWebHistoryDuringInterval failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __78__STPrivateServiceClient_deleteAllWebHistoryForApplication_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "deleteAllWebHistoryForApplication failed with error: %{public}@", v2, v3, v4, v5, v6);
}

@end