@interface POConfigurationCoreManager
- (BOOL)isPlatformSSOUserName:(id)a3;
- (BOOL)savePendingSSOTokens:(id)a3 forUserName:(id)a4;
- (BOOL)saveStashedDecryptionContext:(id)a3 forUserName:(id)a4;
- (BOOL)saveStashedSSOTokens:(id)a3 forUserName:(id)a4;
- (BOOL)sharedOnly;
- (BOOL)updateLoginStateForUserName:(id)a3 state:(unint64_t)a4 loginDate:(id)a5 loginType:(unint64_t)a6;
- (BOOL)updateLoginTypeForUserName:(id)a3 loginType:(unint64_t)a4;
- (BOOL)verifyTokenForUserName:(id)a3 passwordContext:(id)a4;
- (NSString)userIdentifier;
- (NSString)userName;
- (POConfigurationCoreManager)initWithUserName:(id)a3 identifierProvider:(id)a4 sharedOnly:(BOOL)a5;
- (POConfigurationCoreManager)initWithUserName:(id)a3 identifierProvider:(id)a4 sharedOnly:(BOOL)a5 volume:(id)a6;
- (POConfigurationVersion)deviceConfigurationVersion;
- (POConfigurationVersion)loginConfigurationVersion;
- (POConfigurationVersion)userConfigurationVersion;
- (PODeviceConfiguration)currentDeviceConfiguration;
- (PODeviceConfiguration)userDeviceConfiguration;
- (POLoginConfiguration)currentLoginConfiguration;
- (POUserConfiguration)currentUserConfiguration;
- (POUserIdentifierProvider)userIdentifierProvider;
- (id)deviceConfiguration;
- (id)loginConfiguration;
- (id)retrievePendingSSOTokensForUserName:(id)a3;
- (id)retrieveStashedDecryptionContextForUserName:(id)a3;
- (id)retrieveStashedSSOTokensForUserName:(id)a3;
- (id)userConfigurationForUserName:(id)a3;
- (id)userLoginStateForUserName:(id)a3;
- (void)deviceConfiguration;
- (void)insertTokenForUserName:(id)a3;
- (void)loginConfiguration;
- (void)saveCachedContextsToDisk;
- (void)setDeviceConfigurationVersion:(id)a3;
- (void)setLoginConfigurationVersion:(id)a3;
- (void)setSharedOnly:(BOOL)a3;
- (void)setUserConfigurationVersion:(id)a3;
- (void)setUserIdentifierProvider:(id)a3;
- (void)userDeviceConfiguration;
@end

@implementation POConfigurationCoreManager

- (POConfigurationCoreManager)initWithUserName:(id)a3 identifierProvider:(id)a4 sharedOnly:(BOOL)a5 volume:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)POConfigurationCoreManager;
  v14 = [(POConfigurationCoreManager *)&v25 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userName, a3);
    v16 = [[PODaemonCoreConnection alloc] initWithVolume:v13];
    serviceConnection = v15->_serviceConnection;
    v15->_serviceConnection = v16;

    objc_storeStrong((id *)&v15->_userIdentifierProvider, a4);
    v18 = [[POConfigurationVersion alloc] initWithConfigurationType:0];
    userConfigurationVersion = v15->_userConfigurationVersion;
    v15->_userConfigurationVersion = v18;

    v20 = [[POConfigurationVersion alloc] initWithConfigurationType:1];
    loginConfigurationVersion = v15->_loginConfigurationVersion;
    v15->_loginConfigurationVersion = v20;

    v22 = [[POConfigurationVersion alloc] initWithConfigurationType:2];
    deviceConfigurationVersion = v15->_deviceConfigurationVersion;
    v15->_deviceConfigurationVersion = v22;

    v15->_sharedOnly = a5;
  }

  return v15;
}

- (POConfigurationCoreManager)initWithUserName:(id)a3 identifierProvider:(id)a4 sharedOnly:(BOOL)a5
{
  return [(POConfigurationCoreManager *)self initWithUserName:a3 identifierProvider:a4 sharedOnly:a5 volume:0];
}

- (POUserConfiguration)currentUserConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(POConfigurationCoreManager *)v2 userConfigurationVersion];
  uint64_t v4 = [v3 checkVersion];

  currentUserConfiguration = v2->_currentUserConfiguration;
  if (!currentUserConfiguration)
  {
    v10 = [(POConfigurationCoreManager *)v2 userName];
    uint64_t v11 = [(POConfigurationCoreManager *)v2 userConfigurationForUserName:v10];
    id v12 = v2->_currentUserConfiguration;
    v2->_currentUserConfiguration = (POUserConfiguration *)v11;

    currentUserConfiguration = v2->_currentUserConfiguration;
    if (!currentUserConfiguration)
    {
      id v13 = __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke();
      goto LABEL_8;
    }
LABEL_9:
    v14 = currentUserConfiguration;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    v6 = [(POConfigurationCoreManager *)v2 userName];
    uint64_t v7 = [(POConfigurationCoreManager *)v2 userConfigurationForUserName:v6];
    v8 = v2->_currentUserConfiguration;
    v2->_currentUserConfiguration = (POUserConfiguration *)v7;

    currentUserConfiguration = v2->_currentUserConfiguration;
    if (!currentUserConfiguration)
    {
      id v9 = __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_67();
LABEL_8:
      currentUserConfiguration = v2->_currentUserConfiguration;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v14 = 0;
LABEL_11:
  objc_sync_exit(v2);

  return v14;
}

id __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"no user configuration for user"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_67()
{
  v0 = +[POError errorWithCode:-1005 description:@"no user configuration for user"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (PODeviceConfiguration)currentDeviceConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(POConfigurationCoreManager *)v2 deviceConfigurationVersion];
  uint64_t v4 = [v3 checkVersion];

  currentDeviceConfiguration = v2->_currentDeviceConfiguration;
  if (!currentDeviceConfiguration)
  {
    uint64_t v9 = [(POConfigurationCoreManager *)v2 deviceConfiguration];
    v10 = v2->_currentDeviceConfiguration;
    v2->_currentDeviceConfiguration = (PODeviceConfiguration *)v9;

    currentDeviceConfiguration = v2->_currentDeviceConfiguration;
    if (!currentDeviceConfiguration)
    {
      id v11 = __56__POConfigurationCoreManager_currentDeviceConfiguration__block_invoke();
      goto LABEL_8;
    }
LABEL_9:
    id v12 = currentDeviceConfiguration;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    uint64_t v6 = [(POConfigurationCoreManager *)v2 deviceConfiguration];
    uint64_t v7 = v2->_currentDeviceConfiguration;
    v2->_currentDeviceConfiguration = (PODeviceConfiguration *)v6;

    currentDeviceConfiguration = v2->_currentDeviceConfiguration;
    if (!currentDeviceConfiguration)
    {
      id v8 = __56__POConfigurationCoreManager_currentDeviceConfiguration__block_invoke_71();
LABEL_8:
      currentDeviceConfiguration = v2->_currentDeviceConfiguration;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v12 = 0;
LABEL_11:
  objc_sync_exit(v2);

  return v12;
}

id __56__POConfigurationCoreManager_currentDeviceConfiguration__block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"no device configuration"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __56__POConfigurationCoreManager_currentDeviceConfiguration__block_invoke_71()
{
  v0 = +[POError errorWithCode:-1005 description:@"no device configuration"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (POLoginConfiguration)currentLoginConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(POConfigurationCoreManager *)v2 loginConfigurationVersion];
  uint64_t v4 = [v3 checkVersion];

  currentLoginConfiguration = v2->_currentLoginConfiguration;
  if (!currentLoginConfiguration)
  {
    uint64_t v9 = [(POConfigurationCoreManager *)v2 loginConfiguration];
    v10 = v2->_currentLoginConfiguration;
    v2->_currentLoginConfiguration = (POLoginConfiguration *)v9;

    currentLoginConfiguration = v2->_currentLoginConfiguration;
    if (!currentLoginConfiguration)
    {
      id v11 = __55__POConfigurationCoreManager_currentLoginConfiguration__block_invoke();
      goto LABEL_8;
    }
LABEL_9:
    id v12 = currentLoginConfiguration;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    uint64_t v6 = [(POConfigurationCoreManager *)v2 loginConfiguration];
    uint64_t v7 = v2->_currentLoginConfiguration;
    v2->_currentLoginConfiguration = (POLoginConfiguration *)v6;

    currentLoginConfiguration = v2->_currentLoginConfiguration;
    if (!currentLoginConfiguration)
    {
      id v8 = __55__POConfigurationCoreManager_currentLoginConfiguration__block_invoke_75();
LABEL_8:
      currentLoginConfiguration = v2->_currentLoginConfiguration;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v12 = 0;
LABEL_11:
  objc_sync_exit(v2);

  return v12;
}

id __55__POConfigurationCoreManager_currentLoginConfiguration__block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"no login configuration for user"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __55__POConfigurationCoreManager_currentLoginConfiguration__block_invoke_75()
{
  v0 = +[POError errorWithCode:-1005 description:@"no login configuration for user"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (id)deviceConfiguration
{
  v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager deviceConfiguration]();
  }

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  id v20 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__POConfigurationCoreManager_deviceConfiguration__block_invoke;
  v12[3] = &unk_2654640D8;
  v12[4] = &v13;
  v12[5] = v19;
  [(PODaemonCoreConnection *)serviceConnection deviceConfigurationForIdentifer:0 completion:v12];
  if ([(id)v14[5] sharedDeviceKeys]
    && [(id)v14[5] registrationCompleted])
  {
    [(POConfigurationCoreManager *)self setSharedOnly:1];
  }
  if (!v14[5] && ![(POConfigurationCoreManager *)self sharedOnly])
  {
    v5 = NSString;
    uint64_t v6 = [(POConfigurationCoreManager *)self userIdentifier];
    uint64_t v7 = [v5 stringWithFormat:@"%@", v6];

    id v8 = self->_serviceConnection;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__POConfigurationCoreManager_deviceConfiguration__block_invoke_2;
    v11[3] = &unk_2654640D8;
    v11[4] = &v13;
    v11[5] = v19;
    [(PODaemonCoreConnection *)v8 deviceConfigurationForIdentifer:v7 completion:v11];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);
  return v9;
}

void __49__POConfigurationCoreManager_deviceConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = a2;
    uint64_t v7 = [[PODeviceConfiguration alloc] initWithData:v6];

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

void __49__POConfigurationCoreManager_deviceConfiguration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = a2;
    uint64_t v7 = [[PODeviceConfiguration alloc] initWithData:v6];

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (PODeviceConfiguration)userDeviceConfiguration
{
  v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager userDeviceConfiguration]();
  }

  uint64_t v4 = NSString;
  id v5 = [(POConfigurationCoreManager *)self userIdentifier];
  id v6 = [v4 stringWithFormat:@"%@", v5];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  id v18 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  serviceConnection = self->_serviceConnection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__POConfigurationCoreManager_userDeviceConfiguration__block_invoke;
  v10[3] = &unk_2654640D8;
  v10[4] = &v11;
  v10[5] = v17;
  [(PODaemonCoreConnection *)serviceConnection deviceConfigurationForIdentifer:v6 completion:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return (PODeviceConfiguration *)v8;
}

void __53__POConfigurationCoreManager_userDeviceConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = a2;
    uint64_t v7 = [[PODeviceConfiguration alloc] initWithData:v6];

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)loginConfiguration
{
  v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager loginConfiguration]();
  }

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  id v20 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  uint64_t v4 = [(POConfigurationCoreManager *)self currentDeviceConfiguration];
  char v5 = [v4 sharedDeviceKeys];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [(POConfigurationCoreManager *)self userIdentifier];
    id v6 = [v7 stringWithFormat:@"%@", v8];
  }
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__POConfigurationCoreManager_loginConfiguration__block_invoke;
  v12[3] = &unk_2654640D8;
  v12[4] = &v13;
  v12[5] = v19;
  [(PODaemonCoreConnection *)serviceConnection loginConfigurationForIdentifer:v6 completion:v12];
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v19, 8);

  return v10;
}

void __48__POConfigurationCoreManager_loginConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = a2;
    uint64_t v7 = [[POLoginConfiguration alloc] initWithData:v6];

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)userConfigurationForUserName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v12 = 0;
    goto LABEL_13;
  }
  id v5 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v6 = [v5 uniqueIdentifierForUserName:v4];

  if (v6)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__1;
    v23[4] = __Block_byref_object_dispose__1;
    id v24 = 0;
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    serviceConnection = self->_serviceConnection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke_86;
    v16[3] = &unk_265464100;
    v16[4] = &v17;
    v16[5] = v23;
    [(PODaemonCoreConnection *)serviceConnection userConfigurationForIdentifier:v6 completion:v16];
    uint64_t v8 = (void *)v18[5];
    if (v8)
    {
      id v9 = [v8 uniqueIdentifier];
      int v10 = [v6 isEqualToString:v9];

      if (!v10)
      {
        id v14 = __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke_2();
        id v12 = 0;
        goto LABEL_11;
      }
      uint64_t v11 = (void *)v18[5];
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = v11;
LABEL_11:
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(v23, 8);
    goto LABEL_12;
  }
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  v27 = __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke;
  v28 = &unk_265463860;
  id v29 = v4;
  id v13 = __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke();

  id v12 = 0;
LABEL_12:

LABEL_13:
  return v12;
}

id __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when retrieving user configuration"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

void __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

id __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1008 description:@"user identifier mismatch"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (id)userLoginStateForUserName:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager userLoginStateForUserName:]();
  }

  id v6 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  uint64_t v7 = [v6 uniqueIdentifierForUserName:v4];

  if (!v7)
  {
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke;
    id v29 = &unk_265463860;
    id v30 = v4;
    id v13 = __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke();

    id v14 = 0;
    goto LABEL_12;
  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__1;
  v24[4] = __Block_byref_object_dispose__1;
  id v25 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  id v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  serviceConnection = self->_serviceConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke_94;
  v17[3] = &unk_265464128;
  v17[4] = &v18;
  void v17[5] = v24;
  [(PODaemonCoreConnection *)serviceConnection userLoginStateForIdentifier:v7 completion:v17];
  id v9 = (void *)v19[5];
  if (v9)
  {
    int v10 = [v9 uniqueIdentifier];
    int v11 = [v7 isEqualToString:v10];

    if (!v11)
    {
      id v15 = __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke_2();
      id v14 = 0;
      goto LABEL_11;
    }
    id v12 = (void *)v19[5];
  }
  else
  {
    id v12 = 0;
  }
  id v14 = v12;
LABEL_11:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(v24, 8);
LABEL_12:

  return v14;
}

id __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when retrieving login state"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

void __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

id __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1008 description:@"user identifier mismatch"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)updateLoginStateForUserName:(id)a3 state:(unint64_t)a4 loginDate:(id)a5 loginType:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v22 = +[POConstantCoreUtil stringForLoginPolicyState:a4];
    id v23 = +[POConstantCoreUtil stringForLoginType:a6];
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "-[POConfigurationCoreManager updateLoginStateForUserName:state:loginDate:loginType:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2114;
    id v27 = v11;
    __int16 v28 = 2114;
    id v29 = v23;
    __int16 v30 = 2112;
    v31 = self;
    _os_log_debug_impl(&dword_259DFE000, v12, OS_LOG_TYPE_DEBUG, "%s state: %{public}@, loginDate: %{public}@, loginDate: %{public}@ on %@", buf, 0x34u);
  }
  id v13 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v14 = [v13 uniqueIdentifierForUserName:v10];

  if (!v14)
  {
    v24[10] = MEMORY[0x263EF8330];
    v24[11] = 3221225472;
    v24[12] = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke;
    v24[13] = &unk_265463860;
    id v25 = v10;
    id v19 = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke();

LABEL_8:
    BOOL v18 = 0;
    goto LABEL_9;
  }
  if (a4 >= 3)
  {
    void v24[5] = MEMORY[0x263EF8330];
    v24[6] = 3221225472;
    v24[7] = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_100;
    v24[8] = &__block_descriptor_40_e14___NSError_8__0l;
    v24[9] = a4;
    id v20 = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_100();
    goto LABEL_8;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v27) = 0;
  serviceConnection = self->_serviceConnection;
  id v16 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:a6];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_106;
  v24[3] = &unk_265464150;
  v24[4] = buf;
  [(PODaemonCoreConnection *)serviceConnection updateLoginStateForIdentifier:v14 state:v16 loginDate:v11 loginType:v17 completion:v24];

  BOOL v18 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
LABEL_9:

  return v18;
}

id __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when saving pending tokens"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_100()
{
  v0 = +[POError errorWithCode:-1001 description:@"invalid login state"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_104_cold_1();
  }

  return v0;
}

uint64_t __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_106(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateLoginTypeForUserName:(id)a3 loginType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager updateLoginTypeForUserName:loginType:](a4, (uint64_t)self, v7);
  }

  uint64_t v8 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v9 = [v8 uniqueIdentifierForUserName:v6];

  if (v9)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    serviceConnection = self->_serviceConnection;
    id v11 = [NSNumber numberWithUnsignedInteger:a4];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__POConfigurationCoreManager_updateLoginTypeForUserName_loginType___block_invoke_108;
    v15[3] = &unk_265464150;
    v15[4] = &v16;
    [(PODaemonCoreConnection *)serviceConnection updateLoginStateForIdentifier:v9 state:0 loginDate:0 loginType:v11 completion:v15];

    BOOL v12 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __67__POConfigurationCoreManager_updateLoginTypeForUserName_loginType___block_invoke;
    id v23 = &unk_265463860;
    id v24 = v6;
    id v13 = __67__POConfigurationCoreManager_updateLoginTypeForUserName_loginType___block_invoke();

    BOOL v12 = 0;
  }

  return v12;
}

id __67__POConfigurationCoreManager_updateLoginTypeForUserName_loginType___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when saving pending tokens"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

uint64_t __67__POConfigurationCoreManager_updateLoginTypeForUserName_loginType___block_invoke_108(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isPlatformSSOUserName:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager isPlatformSSOUserName:]();
  }

  id v6 = [(POConfigurationCoreManager *)self currentDeviceConfiguration];
  uint64_t v7 = [v6 nonPlatformSSOAccounts];
  uint64_t v8 = [v4 lowercaseString];

  int v9 = [v7 containsObject:v8];
  if (v9)
  {
    id v10 = PO_LOG_POConfigurationManager();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[POConfigurationCoreManager isPlatformSSOUserName:](v10);
    }
  }
  return v9 ^ 1;
}

- (BOOL)savePendingSSOTokens:(id)a3 forUserName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager savePendingSSOTokens:forUserName:]();
  }

  int v9 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v10 = [v9 uniqueIdentifierForUserName:v7];

  if (v10)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke_109;
    v15[3] = &unk_265464150;
    v15[4] = &v16;
    [(PODaemonCoreConnection *)serviceConnection savePendingSSOTokens:v6 identifer:v10 completion:v15];
    BOOL v12 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke;
    id v23 = &unk_265463860;
    id v24 = v7;
    id v13 = __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke();

    BOOL v12 = 0;
  }

  return v12;
}

id __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when saving pending tokens"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

uint64_t __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke_109(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)retrievePendingSSOTokensForUserName:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager retrievePendingSSOTokensForUserName:]();
  }

  id v6 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v7 = [v6 uniqueIdentifierForUserName:v4];

  if (v7)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__1;
    v19[4] = __Block_byref_object_dispose__1;
    id v20 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__1;
    uint64_t v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    serviceConnection = self->_serviceConnection;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke_113;
    v12[3] = &unk_2654640D8;
    v12[4] = &v13;
    v12[5] = v19;
    [(PODaemonCoreConnection *)serviceConnection retrievePendingSSOTokenForIdentifer:v7 completion:v12];
    id v9 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke;
    id v24 = &unk_265463860;
    id v25 = v4;
    id v10 = __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke();

    id v9 = 0;
  }

  return v9;
}

id __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when retrieving pending tokens"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

void __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)saveStashedSSOTokens:(id)a3 forUserName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager saveStashedSSOTokens:forUserName:]();
  }

  uint64_t v9 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v10 = [v9 uniqueIdentifierForUserName:v7];

  if (v10)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke_117;
    v15[3] = &unk_265464150;
    v15[4] = &v16;
    [(PODaemonCoreConnection *)serviceConnection saveStashedSSOTokens:v6 identifer:v10 completion:v15];
    BOOL v12 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke;
    id v23 = &unk_265463860;
    id v24 = v7;
    id v13 = __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke();

    BOOL v12 = 0;
  }

  return v12;
}

id __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when saving stashed tokens"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

uint64_t __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke_117(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)retrieveStashedSSOTokensForUserName:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager retrieveStashedSSOTokensForUserName:]();
  }

  id v6 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v7 = [v6 uniqueIdentifierForUserName:v4];

  if (v7)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__1;
    v19[4] = __Block_byref_object_dispose__1;
    id v20 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__1;
    uint64_t v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    serviceConnection = self->_serviceConnection;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke_121;
    v12[3] = &unk_2654640D8;
    v12[4] = &v13;
    v12[5] = v19;
    [(PODaemonCoreConnection *)serviceConnection retrieveStashedSSOTokenForIdentifer:v7 completion:v12];
    id v9 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke;
    id v24 = &unk_265463860;
    id v25 = v4;
    id v10 = __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke();

    id v9 = 0;
  }

  return v9;
}

id __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when retrieving stashed tokens"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

void __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)saveStashedDecryptionContext:(id)a3 forUserName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager saveStashedDecryptionContext:forUserName:]();
  }

  uint64_t v9 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v10 = [v9 uniqueIdentifierForUserName:v7];

  if (v10)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke_125;
    v15[3] = &unk_265464150;
    v15[4] = &v16;
    [(PODaemonCoreConnection *)serviceConnection saveStashedDecryptionContext:v6 identifer:v10 completion:v15];
    BOOL v12 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke;
    id v23 = &unk_265463860;
    id v24 = v7;
    id v13 = __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke();

    BOOL v12 = 0;
  }

  return v12;
}

id __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when saving stashed context"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

uint64_t __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke_125(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)retrieveStashedDecryptionContextForUserName:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationCoreManager retrieveStashedDecryptionContextForUserName:]();
  }

  id v6 = [(POConfigurationCoreManager *)self userIdentifierProvider];
  id v7 = [v6 uniqueIdentifierForUserName:v4];

  if (v7)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__1;
    v19[4] = __Block_byref_object_dispose__1;
    id v20 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__1;
    uint64_t v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    serviceConnection = self->_serviceConnection;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke_126;
    v12[3] = &unk_2654640D8;
    v12[4] = &v13;
    v12[5] = v19;
    [(PODaemonCoreConnection *)serviceConnection retrieveStashedDecryptionContextForIdentifer:v7 completion:v12];
    id v9 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke;
    id v24 = &unk_265463860;
    id v25 = v4;
    id v10 = __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke();

    id v9 = 0;
  }

  return v9;
}

id __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"identifier for user not found when retrieving stashed tokens"];
  v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

void __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)saveCachedContextsToDisk
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

uint64_t __54__POConfigurationCoreManager_saveCachedContextsToDisk__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSString)userIdentifier
{
  userIdentifier = self->_userIdentifier;
  if (!userIdentifier)
  {
    uint64_t v4 = [(POConfigurationCoreManager *)self userIdentifierProvider];
    uint64_t v5 = [(POConfigurationCoreManager *)self userName];
    id v6 = [v4 uniqueIdentifierForUserName:v5];
    uint64_t v7 = self->_userIdentifier;
    self->_userIdentifier = v6;

    userIdentifier = self->_userIdentifier;
    if (!userIdentifier)
    {
      id v8 = __44__POConfigurationCoreManager_userIdentifier__block_invoke();
      userIdentifier = self->_userIdentifier;
    }
  }
  uint64_t v9 = userIdentifier;
  return v9;
}

id __44__POConfigurationCoreManager_userIdentifier__block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"id for user not found."];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (void)insertTokenForUserName:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v10 = "-[POConfigurationCoreManager insertTokenForUserName:]";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = self;
    _os_log_impl(&dword_259DFE000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", buf, 0x20u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke;
  v7[3] = &unk_265464178;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  _os_activity_initiate(&dword_259DFE000, "PSSOInsertToken", OS_ACTIVITY_FLAG_DEFAULT, v7);
}

uint64_t __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) insertTokenForUserName:*(void *)(a1 + 40) completion:&__block_literal_global_10];
}

void __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = PO_LOG_POConfigurationManager();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2_cold_2((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2_cold_1(v4);
  }
}

- (BOOL)verifyTokenForUserName:(id)a3 passwordContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[POConfigurationCoreManager verifyTokenForUserName:passwordContext:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, context = %{public}@ on %@", buf, 0x2Au);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v18) = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__POConfigurationCoreManager_verifyTokenForUserName_passwordContext___block_invoke;
  v13[3] = &unk_2654641A0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = buf;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_259DFE000, "PSSOVerifyToken", OS_ACTIVITY_FLAG_DEFAULT, v13);

  char v11 = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v11;
}

uint64_t __69__POConfigurationCoreManager_verifyTokenForUserName_passwordContext___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  id v2 = *(void **)(a1[4] + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__POConfigurationCoreManager_verifyTokenForUserName_passwordContext___block_invoke_2;
  v5[3] = &unk_265464150;
  uint64_t v3 = a1[6];
  v5[4] = a1[7];
  return [v2 verifyTokenForUserName:v1 passwordContext:v3 completion:v5];
}

uint64_t __69__POConfigurationCoreManager_verifyTokenForUserName_passwordContext___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)sharedOnly
{
  return self->_sharedOnly;
}

- (void)setSharedOnly:(BOOL)a3
{
  self->_sharedOnly = a3;
}

- (POConfigurationVersion)userConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUserConfigurationVersion:(id)a3
{
}

- (POConfigurationVersion)loginConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLoginConfigurationVersion:(id)a3
{
}

- (POConfigurationVersion)deviceConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDeviceConfigurationVersion:(id)a3
{
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_loginConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_userConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_currentDeviceConfiguration, 0);
  objc_storeStrong((id *)&self->_currentLoginConfiguration, 0);
  objc_storeStrong((id *)&self->_currentUserConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_3_4(v0, v1), "userName");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);
}

- (void)deviceConfiguration
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userDeviceConfiguration
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)loginConfiguration
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userLoginStateForUserName:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)updateLoginTypeForUserName:(NSObject *)a3 loginType:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = +[POConstantCoreUtil stringForLoginType:a1];
  int v6 = 136315650;
  uint64_t v7 = "-[POConfigurationCoreManager updateLoginTypeForUserName:loginType:]";
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_259DFE000, a3, OS_LOG_TYPE_DEBUG, "%s type: %{public}@ on %@", (uint8_t *)&v6, 0x20u);
}

- (void)isPlatformSSOUserName:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "Not a Platform SSO User", v1, 2u);
}

- (void)isPlatformSSOUserName:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)savePendingSSOTokens:forUserName:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)retrievePendingSSOTokensForUserName:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)saveStashedSSOTokens:forUserName:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)retrieveStashedSSOTokensForUserName:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)saveStashedDecryptionContext:forUserName:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)retrieveStashedDecryptionContextForUserName:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "insertTokenForUserName complete", v1, 2u);
}

void __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_259DFE000, a2, OS_LOG_TYPE_ERROR, "insertTokenForUserName error = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end