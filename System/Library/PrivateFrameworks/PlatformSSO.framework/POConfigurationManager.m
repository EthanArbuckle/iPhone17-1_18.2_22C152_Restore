@interface POConfigurationManager
+ (id)sharedInstance;
- (BOOL)__removeDeviceConfigurationWithIdentifier:(id)a3;
- (BOOL)__removeLoginConfigurationForIdentifier:(id)a3;
- (BOOL)createAppSSOCachePath;
- (BOOL)removeDeviceConfiguration;
- (BOOL)removeLoginConfiguration;
- (BOOL)removeUserConfigurationForUserName:(id)a3;
- (BOOL)removeUserDeviceConfiguration;
- (BOOL)removeUserLoginConfiguration;
- (BOOL)resetStoredConfiguration;
- (BOOL)saveAppSSOConfiguration:(id)a3;
- (BOOL)saveCurrentUserConfigurationAndSyncToPreboot:(BOOL)a3;
- (BOOL)saveDeviceConfiguration:(id)a3;
- (BOOL)saveDeviceConfigurationSyncAllConfigToPreboot:(id)a3;
- (BOOL)saveLoginConfiguration:(id)a3;
- (BOOL)saveUserConfiguration:(id)a3 forUserName:(id)a4 syncToPreboot:(BOOL)a5;
- (BOOL)setTokens:(id)a3 extensionIdentifier:(id)a4 returningError:(id *)a5;
- (NSDate)tokenExpiration;
- (NSDate)tokenReceived;
- (NSString)userIdentifier;
- (POConfigurationManager)initWithUserName:(id)a3;
- (POConfigurationManager)initWithUserName:(id)a3 directoryServices:(id)a4 sharedOnly:(BOOL)a5;
- (POConfigurationVersion)deviceConfigurationVersion;
- (POConfigurationVersion)loginConfigurationVersion;
- (POConfigurationVersion)userConfigurationVersion;
- (PODirectoryServices)directoryServices;
- (POKeychainHelper)keychainHelper;
- (id)calculateExpirationForTokens:(id)a3;
- (id)currentDeviceConfiguration;
- (id)currentLoginConfiguration;
- (id)currentRefreshToken;
- (id)currentUserConfiguration;
- (id)deviceConfiguration;
- (id)loginConfiguration;
- (id)refreshTokenFromTokens:(id)a3;
- (id)tokensForExtensionIdentifier:(id)a3;
- (id)userConfigurationForUserName:(id)a3;
- (id)userDeviceConfiguration;
- (void)createAppSSOCachePath;
- (void)deviceConfiguration;
- (void)enablePlatformSSORulesIfNeeded:(id)a3;
- (void)loginConfiguration;
- (void)removeDeviceConfiguration;
- (void)removeLoginConfiguration;
- (void)removeUserDeviceConfiguration;
- (void)removeUserLoginConfiguration;
- (void)restorePlatformSSORulesIfNeeded;
- (void)setDeviceConfigurationVersion:(id)a3;
- (void)setDirectoryServices:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setLoginConfigurationVersion:(id)a3;
- (void)setUserConfigurationVersion:(id)a3;
- (void)userDeviceConfiguration;
@end

@implementation POConfigurationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_89);
  }
  v2 = (void *)sharedInstance_defaultManager;

  return v2;
}

void __40__POConfigurationManager_sharedInstance__block_invoke()
{
  v0 = [POConfigurationManager alloc];
  NSUserName();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(POConfigurationManager *)v0 initWithUserName:v3];
  v2 = (void *)sharedInstance_defaultManager;
  sharedInstance_defaultManager = v1;
}

- (POConfigurationManager)initWithUserName:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PODirectoryServices);
  v6 = [(POConfigurationManager *)self initWithUserName:v4 directoryServices:v5 sharedOnly:0];

  return v6;
}

- (POConfigurationManager)initWithUserName:(id)a3 directoryServices:(id)a4 sharedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)POConfigurationManager;
  v10 = [(POConfigurationCoreManager *)&v22 initWithUserName:a3 identifierProvider:v9 sharedOnly:v5];
  if (v10)
  {
    v11 = objc_alloc_init(PODaemonConnection);
    serviceConnection = v10->_serviceConnection;
    v10->_serviceConnection = v11;

    objc_storeStrong((id *)&v10->_directoryServices, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x263F5E5E8]) initWithConfigurationType:0];
    userConfigurationVersion = v10->_userConfigurationVersion;
    v10->_userConfigurationVersion = (POConfigurationVersion *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263F5E5E8]) initWithConfigurationType:1];
    loginConfigurationVersion = v10->_loginConfigurationVersion;
    v10->_loginConfigurationVersion = (POConfigurationVersion *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F5E5E8]) initWithConfigurationType:2];
    deviceConfigurationVersion = v10->_deviceConfigurationVersion;
    v10->_deviceConfigurationVersion = (POConfigurationVersion *)v17;

    v19 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x263F5E638]);
    keychainHelper = v10->_keychainHelper;
    v10->_keychainHelper = v19;
  }
  return v10;
}

- (id)currentUserConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(POConfigurationManager *)v2 userConfigurationVersion];
  uint64_t v4 = [v3 checkVersion];

  currentUserConfiguration = v2->_currentUserConfiguration;
  if (!currentUserConfiguration)
  {
    v10 = [(POConfigurationCoreManager *)v2 userName];
    uint64_t v11 = [(POConfigurationManager *)v2 userConfigurationForUserName:v10];
    v12 = v2->_currentUserConfiguration;
    v2->_currentUserConfiguration = (POUserConfiguration *)v11;

    currentUserConfiguration = v2->_currentUserConfiguration;
    if (!currentUserConfiguration)
    {
      id v13 = __50__POConfigurationManager_currentUserConfiguration__block_invoke();
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
    uint64_t v7 = [(POConfigurationManager *)v2 userConfigurationForUserName:v6];
    v8 = v2->_currentUserConfiguration;
    v2->_currentUserConfiguration = (POUserConfiguration *)v7;

    currentUserConfiguration = v2->_currentUserConfiguration;
    if (!currentUserConfiguration)
    {
      id v9 = __50__POConfigurationManager_currentUserConfiguration__block_invoke_100();
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

id __50__POConfigurationManager_currentUserConfiguration__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"no user configuration for user"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __50__POConfigurationManager_currentUserConfiguration__block_invoke_100()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"no user configuration for user"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)saveCurrentUserConfigurationAndSyncToPreboot:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  currentUserConfiguration = v4->_currentUserConfiguration;
  if (currentUserConfiguration
    && ([(POConfigurationCoreManager *)v4 userName],
        v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = [(POConfigurationManager *)v4 saveUserConfiguration:currentUserConfiguration forUserName:v6 syncToPreboot:v3], v6, !v7))
  {
    id v9 = __71__POConfigurationManager_saveCurrentUserConfigurationAndSyncToPreboot___block_invoke();
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  objc_sync_exit(v4);

  return v8;
}

id __71__POConfigurationManager_saveCurrentUserConfigurationAndSyncToPreboot___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"failed to save user configuration"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (id)currentDeviceConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(POConfigurationManager *)v2 deviceConfigurationVersion];
  uint64_t v4 = [v3 checkVersion];

  currentDeviceConfiguration = v2->_currentDeviceConfiguration;
  if (!currentDeviceConfiguration)
  {
    uint64_t v9 = [(POConfigurationManager *)v2 deviceConfiguration];
    v10 = v2->_currentDeviceConfiguration;
    v2->_currentDeviceConfiguration = (PODeviceConfiguration *)v9;

    currentDeviceConfiguration = v2->_currentDeviceConfiguration;
    if (!currentDeviceConfiguration)
    {
      id v11 = __52__POConfigurationManager_currentDeviceConfiguration__block_invoke();
      goto LABEL_8;
    }
LABEL_9:
    v12 = currentDeviceConfiguration;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    uint64_t v6 = [(POConfigurationManager *)v2 deviceConfiguration];
    BOOL v7 = v2->_currentDeviceConfiguration;
    v2->_currentDeviceConfiguration = (PODeviceConfiguration *)v6;

    currentDeviceConfiguration = v2->_currentDeviceConfiguration;
    if (!currentDeviceConfiguration)
    {
      id v8 = __52__POConfigurationManager_currentDeviceConfiguration__block_invoke_109();
LABEL_8:
      currentDeviceConfiguration = v2->_currentDeviceConfiguration;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v12 = 0;
LABEL_11:
  objc_sync_exit(v2);

  return v12;
}

id __52__POConfigurationManager_currentDeviceConfiguration__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"no device configuration"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __52__POConfigurationManager_currentDeviceConfiguration__block_invoke_109()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"no device configuration"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (id)currentLoginConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(POConfigurationManager *)v2 loginConfigurationVersion];
  uint64_t v4 = [v3 checkVersion];

  currentLoginConfiguration = v2->_currentLoginConfiguration;
  if (!currentLoginConfiguration)
  {
    uint64_t v9 = [(POConfigurationManager *)v2 loginConfiguration];
    v10 = v2->_currentLoginConfiguration;
    v2->_currentLoginConfiguration = (POLoginConfiguration *)v9;

    currentLoginConfiguration = v2->_currentLoginConfiguration;
    if (!currentLoginConfiguration)
    {
      id v11 = __51__POConfigurationManager_currentLoginConfiguration__block_invoke();
      goto LABEL_8;
    }
LABEL_9:
    v12 = currentLoginConfiguration;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    uint64_t v6 = [(POConfigurationManager *)v2 loginConfiguration];
    BOOL v7 = v2->_currentLoginConfiguration;
    v2->_currentLoginConfiguration = (POLoginConfiguration *)v6;

    currentLoginConfiguration = v2->_currentLoginConfiguration;
    if (!currentLoginConfiguration)
    {
      id v8 = __51__POConfigurationManager_currentLoginConfiguration__block_invoke_113();
LABEL_8:
      currentLoginConfiguration = v2->_currentLoginConfiguration;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v12 = 0;
LABEL_11:
  objc_sync_exit(v2);

  return v12;
}

id __51__POConfigurationManager_currentLoginConfiguration__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"no login configuration for user"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

id __51__POConfigurationManager_currentLoginConfiguration__block_invoke_113()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1005 description:@"no login configuration for user"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (id)deviceConfiguration
{
  BOOL v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager deviceConfiguration]();
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
  uint64_t v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__POConfigurationManager_deviceConfiguration__block_invoke;
  v12[3] = &unk_264BBEED0;
  v12[4] = &v13;
  v12[5] = v19;
  [(PODaemonConnection *)serviceConnection deviceConfigurationForIdentifer:0 completion:v12];
  if ([(id)v14[5] sharedDeviceKeys]
    && [(id)v14[5] registrationCompleted])
  {
    [(POConfigurationCoreManager *)self setSharedOnly:1];
  }
  if (!v14[5] && ![(POConfigurationCoreManager *)self sharedOnly])
  {
    BOOL v5 = NSString;
    uint64_t v6 = [(POConfigurationManager *)self userIdentifier];
    BOOL v7 = [v5 stringWithFormat:@"%@", v6];

    id v8 = self->_serviceConnection;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__POConfigurationManager_deviceConfiguration__block_invoke_2;
    v11[3] = &unk_264BBEED0;
    v11[4] = &v13;
    v11[5] = v19;
    [(PODaemonConnection *)v8 deviceConfigurationForIdentifer:v7 completion:v11];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);

  return v9;
}

void __45__POConfigurationManager_deviceConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x263F5E608];
    id v7 = a2;
    uint64_t v8 = [[v6 alloc] initWithData:v7];

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

void __45__POConfigurationManager_deviceConfiguration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x263F5E608];
    id v7 = a2;
    uint64_t v8 = [[v6 alloc] initWithData:v7];

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

- (id)userDeviceConfiguration
{
  BOOL v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager userDeviceConfiguration]();
  }

  uint64_t v4 = NSString;
  id v5 = [(POConfigurationManager *)self userIdentifier];
  uint64_t v6 = [v4 stringWithFormat:@"%@", v5];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  id v18 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  serviceConnection = self->_serviceConnection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__POConfigurationManager_userDeviceConfiguration__block_invoke;
  v10[3] = &unk_264BBEED0;
  v10[4] = &v11;
  v10[5] = v17;
  [(PODaemonConnection *)serviceConnection deviceConfigurationForIdentifer:v6 completion:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);

  return v8;
}

void __49__POConfigurationManager_userDeviceConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x263F5E608];
    id v7 = a2;
    uint64_t v8 = [[v6 alloc] initWithData:v7];

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

- (BOOL)saveDeviceConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager saveDeviceConfiguration:]();
  }

  if ([v4 sharedDeviceKeys])
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = NSString;
    uint64_t v8 = [(POConfigurationManager *)self userIdentifier];
    uint64_t v6 = [v7 stringWithFormat:@"%@", v8];
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  serviceConnection = self->_serviceConnection;
  v10 = [v4 dataRepresentation];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__POConfigurationManager_saveDeviceConfiguration___block_invoke;
  v16[3] = &unk_264BBEC78;
  v16[4] = &v17;
  [(PODaemonConnection *)serviceConnection saveDeviceConfiguration:v10 identifer:v6 completion:v16];

  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v11 = self;
    objc_sync_enter(v11);
    currentDeviceConfiguration = v11->_currentDeviceConfiguration;
    v11->_currentDeviceConfiguration = 0;

    objc_sync_exit(v11);
    uint64_t v13 = [(POConfigurationManager *)v11 deviceConfigurationVersion];
    [v13 increaseVersionWithMessage:@"deviceConfiguration updated"];

    BOOL v14 = *((unsigned char *)v18 + 24) != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v14;
}

uint64_t __50__POConfigurationManager_saveDeviceConfiguration___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)saveDeviceConfigurationSyncAllConfigToPreboot:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager saveDeviceConfigurationSyncAllConfigToPreboot:]();
  }

  if ([v4 sharedDeviceKeys])
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = NSString;
    uint64_t v8 = [(POConfigurationManager *)self userIdentifier];
    uint64_t v6 = [v7 stringWithFormat:@"%@", v8];
  }
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  serviceConnection = self->_serviceConnection;
  v10 = [v4 dataRepresentation];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__POConfigurationManager_saveDeviceConfigurationSyncAllConfigToPreboot___block_invoke;
  v18[3] = &unk_264BBEC78;
  v18[4] = &v19;
  [(PODaemonConnection *)serviceConnection saveDeviceConfigurationSyncAllConfigToPreboot:v10 identifer:v6 completion:v18];

  if (*((unsigned char *)v20 + 24))
  {
    uint64_t v11 = self;
    objc_sync_enter(v11);
    currentDeviceConfiguration = v11->_currentDeviceConfiguration;
    v11->_currentDeviceConfiguration = 0;

    currentLoginConfiguration = v11->_currentLoginConfiguration;
    v11->_currentLoginConfiguration = 0;

    objc_sync_exit(v11);
    BOOL v14 = [(POConfigurationManager *)v11 deviceConfigurationVersion];
    [v14 increaseVersionWithMessage:@"deviceConfiguration sync all"];

    uint64_t v15 = [(POConfigurationManager *)v11 loginConfigurationVersion];
    [v15 increaseVersionWithMessage:@"loginConfiguration sync all"];

    BOOL v16 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v16;
}

uint64_t __72__POConfigurationManager_saveDeviceConfigurationSyncAllConfigToPreboot___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeDeviceConfiguration
{
  BOOL v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager removeDeviceConfiguration]();
  }

  return [(POConfigurationManager *)self __removeDeviceConfigurationWithIdentifier:0];
}

- (BOOL)removeUserDeviceConfiguration
{
  BOOL v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager removeUserDeviceConfiguration]();
  }

  id v4 = NSString;
  id v5 = [(POConfigurationManager *)self userIdentifier];
  uint64_t v6 = [v4 stringWithFormat:@"%@", v5];

  BOOL v7 = [(POConfigurationManager *)self __removeDeviceConfigurationWithIdentifier:v6];
  return v7;
}

- (BOOL)__removeDeviceConfigurationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager __removeDeviceConfigurationWithIdentifier:]();
  }

  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__POConfigurationManager___removeDeviceConfigurationWithIdentifier___block_invoke;
  v12[3] = &unk_264BBEC78;
  v12[4] = &v13;
  [(PODaemonConnection *)serviceConnection removeDeviceConfigurationForIdentifer:v4 completion:v12];
  if (*((unsigned char *)v14 + 24))
  {
    BOOL v7 = [(POConfigurationManager *)self deviceConfigurationVersion];
    [v7 increaseVersionWithMessage:@"deviceConfiguration updated"];

    uint64_t v8 = self;
    objc_sync_enter(v8);
    currentDeviceConfiguration = v8->_currentDeviceConfiguration;
    v8->_currentDeviceConfiguration = 0;

    objc_sync_exit(v8);
    BOOL v10 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __68__POConfigurationManager___removeDeviceConfigurationWithIdentifier___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)loginConfiguration
{
  BOOL v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager loginConfiguration]();
  }

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  id v20 = 0;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy__1;
  uint64_t v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  id v4 = [(POConfigurationManager *)self currentDeviceConfiguration];
  char v5 = [v4 sharedDeviceKeys];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v7 = NSString;
    uint64_t v8 = [(POConfigurationManager *)self userIdentifier];
    uint64_t v6 = [v7 stringWithFormat:@"%@", v8];
  }
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__POConfigurationManager_loginConfiguration__block_invoke;
  v12[3] = &unk_264BBEED0;
  v12[4] = &v13;
  void v12[5] = v19;
  [(PODaemonConnection *)serviceConnection loginConfigurationForIdentifer:v6 completion:v12];
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v19, 8);

  return v10;
}

void __44__POConfigurationManager_loginConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x263F5E640];
    id v7 = a2;
    uint64_t v8 = [[v6 alloc] initWithData:v7];

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

- (BOOL)saveLoginConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager saveLoginConfiguration:]();
  }

  uint64_t v6 = [(POConfigurationManager *)self currentDeviceConfiguration];
  char v7 = [v6 sharedDeviceKeys];

  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = NSString;
    id v10 = [(POConfigurationManager *)self userIdentifier];
    uint64_t v8 = [v9 stringWithFormat:@"%@", v10];
  }
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  serviceConnection = self->_serviceConnection;
  v12 = [v4 dataRepresentation];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__POConfigurationManager_saveLoginConfiguration___block_invoke;
  v18[3] = &unk_264BBEC78;
  v18[4] = &v19;
  [(PODaemonConnection *)serviceConnection saveLoginConfiguration:v12 identifer:v8 completion:v18];

  if (*((unsigned char *)v20 + 24))
  {
    uint64_t v13 = [(POConfigurationManager *)self loginConfigurationVersion];
    [v13 increaseVersionWithMessage:@"loginConfiguration updated"];

    BOOL v14 = self;
    objc_sync_enter(v14);
    currentLoginConfiguration = v14->_currentLoginConfiguration;
    v14->_currentLoginConfiguration = 0;

    objc_sync_exit(v14);
    BOOL v16 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v16;
}

uint64_t __49__POConfigurationManager_saveLoginConfiguration___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeUserLoginConfiguration
{
  BOOL v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager removeUserLoginConfiguration]();
  }

  id v4 = NSString;
  id v5 = [(POConfigurationManager *)self userIdentifier];
  uint64_t v6 = [v4 stringWithFormat:@"%@", v5];

  BOOL v7 = [(POConfigurationManager *)self __removeLoginConfigurationForIdentifier:v6];
  return v7;
}

- (BOOL)removeLoginConfiguration
{
  BOOL v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager removeLoginConfiguration]();
  }

  id v4 = [(POConfigurationManager *)self currentDeviceConfiguration];
  char v5 = [v4 sharedDeviceKeys];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v7 = NSString;
    uint64_t v8 = [(POConfigurationManager *)self userIdentifier];
    uint64_t v6 = [v7 stringWithFormat:@"%@", v8];
  }
  BOOL v9 = [(POConfigurationManager *)self __removeLoginConfigurationForIdentifier:v6];

  return v9;
}

- (BOOL)__removeLoginConfigurationForIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager __removeLoginConfigurationForIdentifier:]();
  }

  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__POConfigurationManager___removeLoginConfigurationForIdentifier___block_invoke;
  v12[3] = &unk_264BBEC78;
  v12[4] = &v13;
  [(PODaemonConnection *)serviceConnection removeLoginConfigurationForIdentifer:v4 completion:v12];
  if (*((unsigned char *)v14 + 24))
  {
    BOOL v7 = [(POConfigurationManager *)self loginConfigurationVersion];
    [v7 increaseVersionWithMessage:@"loginConfiguration updated"];

    uint64_t v8 = self;
    objc_sync_enter(v8);
    currentLoginConfiguration = v8->_currentLoginConfiguration;
    v8->_currentLoginConfiguration = 0;

    objc_sync_exit(v8);
    BOOL v10 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __66__POConfigurationManager___removeLoginConfigurationForIdentifier___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)userConfigurationForUserName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v12 = 0;
    goto LABEL_13;
  }
  char v5 = [(POConfigurationManager *)self directoryServices];
  uint64_t v6 = [v5 uniqueIdentifierForUserName:v4];

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
    uint64_t v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    serviceConnection = self->_serviceConnection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__POConfigurationManager_userConfigurationForUserName___block_invoke_137;
    v16[3] = &unk_264BBF0E8;
    v16[4] = &v17;
    void v16[5] = v23;
    [(PODaemonConnection *)serviceConnection userConfigurationForIdentifier:v6 completion:v16];
    uint64_t v8 = (void *)v18[5];
    if (v8)
    {
      BOOL v9 = [v8 uniqueIdentifier];
      int v10 = [v6 isEqualToString:v9];

      if (!v10)
      {
        id v14 = __55__POConfigurationManager_userConfigurationForUserName___block_invoke_2();
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
  v27 = __55__POConfigurationManager_userConfigurationForUserName___block_invoke;
  v28 = &unk_264BBECA8;
  id v29 = v4;
  id v13 = __55__POConfigurationManager_userConfigurationForUserName___block_invoke();

  id v12 = 0;
LABEL_12:

LABEL_13:

  return v12;
}

id __55__POConfigurationManager_userConfigurationForUserName___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"identifier for user not found when retrieving user configuration"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();
  }

  return v0;
}

void __55__POConfigurationManager_userConfigurationForUserName___block_invoke_137(uint64_t a1, void *a2, void *a3)
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

id __55__POConfigurationManager_userConfigurationForUserName___block_invoke_2()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1008 description:@"user identifier mismatch"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)saveUserConfiguration:(id)a3 forUserName:(id)a4 syncToPreboot:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager saveUserConfiguration:forUserName:syncToPreboot:]();
  }

  uint64_t v11 = [(POConfigurationManager *)self directoryServices];
  id v12 = [v11 uniqueIdentifierForUserName:v9];

  if (v12)
  {
    [v8 setUniqueIdentifier:v12];
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    serviceConnection = self->_serviceConnection;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke_145;
    v20[3] = &unk_264BBEC78;
    v20[4] = &v21;
    [(PODaemonConnection *)serviceConnection saveUserConfiguration:v8 forIdentifier:v12 syncToPreboot:v5 completion:v20];
    if (*((unsigned char *)v22 + 24))
    {
      id v14 = self;
      objc_sync_enter(v14);
      currentUserConfiguration = v14->_currentUserConfiguration;
      v14->_currentUserConfiguration = 0;

      objc_sync_exit(v14);
      char v16 = [(POConfigurationManager *)v14 userConfigurationVersion];
      [v16 increaseVersionWithMessage:@"userConfiguration updated"];

      BOOL v17 = *((unsigned char *)v22 + 24) != 0;
    }
    else
    {
      BOOL v17 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke;
    v28 = &unk_264BBECA8;
    id v29 = v9;
    id v18 = __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke();

    BOOL v17 = 0;
  }

  return v17;
}

id __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"identifier for user not found when saving user configuration"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke_145(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeUserConfigurationForUserName:(id)a3
{
  id v4 = a3;
  BOOL v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager removeUserConfigurationForUserName:]();
  }

  id v6 = [(POConfigurationManager *)self directoryServices];
  uint64_t v7 = [v6 uniqueIdentifierForUserName:v4];

  if (v7)
  {
    uint64_t v16 = 0;
    BOOL v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke_152;
    v15[3] = &unk_264BBEC78;
    v15[4] = &v16;
    [(PODaemonConnection *)serviceConnection removeUserConfigurationForIdentifier:v7 completion:v15];
    if (*((unsigned char *)v17 + 24))
    {
      id v9 = [(POConfigurationManager *)self loginConfigurationVersion];
      [v9 increaseVersionWithMessage:@"userConfiguration updated"];

      int v10 = self;
      objc_sync_enter(v10);
      currentUserConfiguration = v10->_currentUserConfiguration;
      v10->_currentUserConfiguration = 0;

      objc_sync_exit(v10);
      BOOL v12 = *((unsigned char *)v17 + 24) != 0;
    }
    else
    {
      BOOL v12 = 0;
    }
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke;
    uint64_t v23 = &unk_264BBECA8;
    id v24 = v4;
    id v13 = __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke();

    BOOL v12 = 0;
  }

  return v12;
}

id __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"identifier for user not found when removing user configuration"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke_152(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)resetStoredConfiguration
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  serviceConnection = self->_serviceConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__POConfigurationManager_resetStoredConfiguration__block_invoke;
  v9[3] = &unk_264BBEC78;
  v9[4] = &v10;
  [(PODaemonConnection *)serviceConnection resetStoredConfigurationWithCompletion:v9];
  if (*((unsigned char *)v11 + 24))
  {
    id v4 = [(POConfigurationManager *)self userConfigurationVersion];
    [v4 reset];

    BOOL v5 = [(POConfigurationManager *)self loginConfigurationVersion];
    [v5 reset];

    id v6 = [(POConfigurationManager *)self deviceConfigurationVersion];
    [v6 reset];

    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __50__POConfigurationManager_resetStoredConfiguration__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)enablePlatformSSORulesIfNeeded:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  serviceConnection = self->_serviceConnection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__POConfigurationManager_enablePlatformSSORulesIfNeeded___block_invoke;
  v6[3] = &unk_264BBEE58;
  v6[4] = &v13;
  v6[5] = &v7;
  [(PODaemonConnection *)serviceConnection enablePlatformSSORules:v6];
  if (v4) {
    v4[2](v4, *((unsigned __int8 *)v14 + 24), v8[5]);
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

void __57__POConfigurationManager_enablePlatformSSORulesIfNeeded___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)restorePlatformSSORulesIfNeeded
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  char v5 = 0;
  serviceConnection = self->_serviceConnection;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__POConfigurationManager_restorePlatformSSORulesIfNeeded__block_invoke;
  v3[3] = &unk_264BBEC78;
  v3[4] = v4;
  [(PODaemonConnection *)serviceConnection disablePlatformSSORules:v3];
  _Block_object_dispose(v4, 8);
}

uint64_t __57__POConfigurationManager_restorePlatformSSORulesIfNeeded__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSString)userIdentifier
{
  userIdentifier = self->_userIdentifier;
  if (!userIdentifier)
  {
    id v4 = [(POConfigurationManager *)self directoryServices];
    char v5 = [(POConfigurationCoreManager *)self userName];
    id v6 = [v4 uniqueIdentifierForUserName:v5];
    uint64_t v7 = self->_userIdentifier;
    self->_userIdentifier = v6;

    userIdentifier = self->_userIdentifier;
    if (!userIdentifier)
    {
      id v8 = __40__POConfigurationManager_userIdentifier__block_invoke();
      userIdentifier = self->_userIdentifier;
    }
  }
  uint64_t v9 = userIdentifier;

  return v9;
}

id __40__POConfigurationManager_userIdentifier__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"id for user not found."];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();
  }

  return v0;
}

- (NSDate)tokenExpiration
{
  BOOL v3 = [(POConfigurationManager *)self keychainHelper];
  id v4 = [(POConfigurationManager *)self currentDeviceConfiguration];
  char v5 = [v4 extensionIdentifier];
  id v6 = [(POConfigurationManager *)self currentUserConfiguration];
  uint64_t v7 = [v6 uniqueIdentifier];
  id v13 = 0;
  int v8 = [v3 retrieveTokensFromKeychainForService:v5 username:v7 returningTokens:0 metaData:&v13];
  id v9 = v13;

  if (v8)
  {
    id v10 = __41__POConfigurationManager_tokenExpiration__block_invoke();
LABEL_3:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  if (!v9) {
    goto LABEL_3;
  }
  uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F5E6E8]];
LABEL_6:

  return (NSDate *)v11;
}

id __41__POConfigurationManager_tokenExpiration__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"SSO tokens not found."];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

- (NSDate)tokenReceived
{
  BOOL v3 = [(POConfigurationManager *)self currentUserConfiguration];
  uint64_t v4 = [v3 uniqueIdentifier];
  if (!v4)
  {

    goto LABEL_7;
  }
  char v5 = (void *)v4;
  id v6 = [(POConfigurationManager *)self currentDeviceConfiguration];
  uint64_t v7 = [v6 extensionIdentifier];

  if (!v7)
  {
LABEL_7:
    char v16 = 0;
    goto LABEL_11;
  }
  int v8 = [(POConfigurationManager *)self keychainHelper];
  id v9 = [(POConfigurationManager *)self currentDeviceConfiguration];
  id v10 = [v9 extensionIdentifier];
  uint64_t v11 = [(POConfigurationManager *)self currentUserConfiguration];
  id v12 = [v11 uniqueIdentifier];
  id v18 = 0;
  int v13 = [v8 retrieveTokensFromKeychainForService:v10 username:v12 returningTokens:0 metaData:&v18];
  id v14 = v18;

  if (v13)
  {
    id v15 = __39__POConfigurationManager_tokenReceived__block_invoke();
  }
  else if (v14)
  {
    char v16 = [v14 objectForKeyedSubscript:*MEMORY[0x263F5E6F0]];
    goto LABEL_10;
  }
  char v16 = 0;
LABEL_10:

LABEL_11:

  return (NSDate *)v16;
}

id __39__POConfigurationManager_tokenReceived__block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1004 description:@"Error retrieving tokens for token received"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

- (id)currentRefreshToken
{
  BOOL v3 = [(POConfigurationManager *)self currentDeviceConfiguration];
  uint64_t v4 = [v3 extensionIdentifier];

  if (v4)
  {
    char v5 = [(POConfigurationManager *)self currentDeviceConfiguration];
    id v6 = [v5 extensionIdentifier];
    uint64_t v7 = [(POConfigurationManager *)self tokensForExtensionIdentifier:v6];

    if (v7)
    {
      int v8 = [(POConfigurationManager *)self refreshTokenFromTokens:v7];
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)refreshTokenFromTokens:(id)a3
{
  id v11 = 0;
  BOOL v3 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:16 error:&v11];
  id v4 = v11;
  char v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__POConfigurationManager_refreshTokenFromTokens___block_invoke;
    v9[3] = &unk_264BBECA8;
    id v10 = v4;
    id v6 = __49__POConfigurationManager_refreshTokenFromTokens___block_invoke((uint64_t)v9);

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"refresh_token"];
  }

  return v7;
}

id __49__POConfigurationManager_refreshTokenFromTokens___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1004 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing tokens for refresh token"];
  v2 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (id)tokensForExtensionIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager tokensForExtensionIdentifier:]();
  }

  id v6 = [(POConfigurationManager *)self currentUserConfiguration];
  uint64_t v7 = [v6 uniqueIdentifier];

  if (v7)
  {
    int v8 = [(POConfigurationManager *)self keychainHelper];
    id v9 = [(POConfigurationManager *)self currentUserConfiguration];
    id v10 = [v9 uniqueIdentifier];
    id v17 = 0;
    int v11 = [v8 retrieveTokensFromKeychainForService:v4 username:v10 returningTokens:&v17 metaData:0];
    id v12 = v17;

    if (!v11)
    {
      id v12 = v12;
      id v14 = v12;
      goto LABEL_12;
    }
    if (v11 == -25300) {
      id v13 = __55__POConfigurationManager_tokensForExtensionIdentifier___block_invoke();
    }
    else {
      id v15 = __55__POConfigurationManager_tokensForExtensionIdentifier___block_invoke_172();
    }
  }
  else
  {
    id v12 = PO_LOG_POConfigurationManager();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[POConfigurationManager tokensForExtensionIdentifier:]();
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

id __55__POConfigurationManager_tokensForExtensionIdentifier___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"SSO Tokens not found on keychain"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __55__POConfigurationManager_tokensForExtensionIdentifier___block_invoke_172()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Error retrieving tokens from keychain"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)setTokens:(id)a3 extensionIdentifier:(id)a4 returningError:(id *)a5
{
  v34[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager setTokens:extensionIdentifier:returningError:]();
  }

  int v11 = [(POConfigurationManager *)self currentUserConfiguration];
  id v12 = [v11 uniqueIdentifier];

  if (!v12)
  {
    id v18 = PO_LOG_POConfigurationManager();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[POConfigurationManager tokensForExtensionIdentifier:]();
    }

LABEL_22:
    BOOL v23 = 0;
    goto LABEL_23;
  }
  if (a5) {
    *a5 = 0;
  }
  if (v8)
  {
    uint64_t v13 = [(POConfigurationManager *)self calculateExpirationForTokens:v8];
    id v14 = (void *)v13;
    if (v13)
    {
      uint64_t v15 = *MEMORY[0x263F5E6F0];
      v33[0] = *MEMORY[0x263F5E6E8];
      v33[1] = v15;
      v34[0] = v13;
      char v16 = [MEMORY[0x263EFF910] date];
      v34[1] = v16;
      id v17 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v26 = [(POConfigurationManager *)self keychainHelper];
    v27 = [(POConfigurationManager *)self currentUserConfiguration];
    v28 = [v27 uniqueIdentifier];
    int v29 = [v26 addTokens:v8 metaData:v17 toKeychainForService:v9 username:v28];

    if (!v29)
    {

      BOOL v23 = 1;
      goto LABEL_23;
    }
    v30 = __71__POConfigurationManager_setTokens_extensionIdentifier_returningError___block_invoke();
    v31 = v30;
    if (a5) {
      *a5 = v30;
    }

    goto LABEL_22;
  }
  char v19 = [(POConfigurationManager *)self keychainHelper];
  uint64_t v20 = [(POConfigurationManager *)self currentUserConfiguration];
  uint64_t v21 = [v20 uniqueIdentifier];
  int v22 = [v19 removeTokensFromKeychainWithService:v9 username:v21];

  BOOL v23 = 1;
  if (v22 != -25300 && v22)
  {
    id v24 = __71__POConfigurationManager_setTokens_extensionIdentifier_returningError___block_invoke_181();
    uint64_t v25 = v24;
    if (a5) {
      *a5 = v24;
    }

    BOOL v23 = v22 == -25300;
  }
LABEL_23:

  return v23;
}

id __71__POConfigurationManager_setTokens_extensionIdentifier_returningError___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Error saving tokens to keychain"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __71__POConfigurationManager_setTokens_extensionIdentifier_returningError___block_invoke_181()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Error removing tokens from keychain"];
  uint64_t v1 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

- (id)calculateExpirationForTokens:(id)a3
{
  id v13 = 0;
  BOOL v3 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:16 error:&v13];
  id v4 = v13;
  char v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__POConfigurationManager_calculateExpirationForTokens___block_invoke;
    v11[3] = &unk_264BBECA8;
    id v12 = v4;
    id v6 = __55__POConfigurationManager_calculateExpirationForTokens___block_invoke((uint64_t)v11);
    uint64_t v7 = 0;
    id v8 = v12;
LABEL_6:

    goto LABEL_7;
  }
  id v8 = [v3 objectForKeyedSubscript:@"refresh_token_expires_in"];
  if (v8
    || ([v3 objectForKeyedSubscript:@"expires_in"],
        (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)MEMORY[0x263EFF910];
    [v8 doubleValue];
    uint64_t v7 = objc_msgSend(v9, "dateWithTimeIntervalSinceNow:");
    goto LABEL_6;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

id __55__POConfigurationManager_calculateExpirationForTokens___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"failed to deserialize tokens to calculate expiration date."];
  v2 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (BOOL)saveAppSSOConfiguration:(id)a3
{
  id v4 = a3;
  char v5 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager saveAppSSOConfiguration:]();
  }

  id v6 = PO_LOG_POConfigurationManager();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = PO_LOG_POConfigurationManager();
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_230E51000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PlatformSSO_SaveConfig", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  *(void *)buf = 0;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  serviceConnection = self->_serviceConnection;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__POConfigurationManager_saveAppSSOConfiguration___block_invoke;
  v13[3] = &unk_264BBF110;
  v13[4] = &v20;
  v13[5] = buf;
  v13[6] = v7;
  [(PODaemonConnection *)serviceConnection saveAppSSOConfiguration:v4 completion:v13];
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __50__POConfigurationManager_saveAppSSOConfiguration___block_invoke(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v4 = PO_LOG_POConfigurationManager();
  char v5 = v4;
  os_signpost_id_t v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)os_signpost_id_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_230E51000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PlatformSSO_SaveConfig", (const char *)&unk_230EAB9BB, v7, 2u);
  }
}

- (BOOL)createAppSSOCachePath
{
  BOOL v3 = PO_LOG_POConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POConfigurationManager createAppSSOCachePath]();
  }

  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__1;
  v8[4] = __Block_byref_object_dispose__1;
  id v9 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__POConfigurationManager_createAppSSOCachePath__block_invoke;
  v7[3] = &unk_264BBEE58;
  v7[4] = &v10;
  v7[5] = v8;
  [(PODaemonConnection *)serviceConnection createAppSSOCachePathWithCompletion:v7];
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __47__POConfigurationManager_createAppSSOCachePath__block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (PODirectoryServices)directoryServices
{
  return (PODirectoryServices *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDirectoryServices:(id)a3
{
}

- (POConfigurationVersion)userConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUserConfigurationVersion:(id)a3
{
}

- (POConfigurationVersion)loginConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLoginConfigurationVersion:(id)a3
{
}

- (POConfigurationVersion)deviceConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeviceConfigurationVersion:(id)a3
{
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 168, 1);
}

- (void)setKeychainHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_loginConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_userConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_directoryServices, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_currentDeviceConfiguration, 0);
  objc_storeStrong((id *)&self->_currentLoginConfiguration, 0);
  objc_storeStrong((id *)&self->_currentUserConfiguration, 0);

  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_7_1(v0, v1), "userName");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_230E51000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);
}

- (void)deviceConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)userDeviceConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)saveDeviceConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)saveDeviceConfigurationSyncAllConfigToPreboot:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)removeDeviceConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)removeUserDeviceConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)__removeDeviceConfigurationWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)loginConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)saveLoginConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)removeUserLoginConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)removeLoginConfiguration
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)__removeLoginConfigurationForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(&dword_230E51000, v0, v1, "%{public}@, %{public}@");
}

- (void)saveUserConfiguration:forUserName:syncToPreboot:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)removeUserConfigurationForUserName:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)tokensForExtensionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "no uniqueIdentifier", v2, v3, v4, v5, v6);
}

- (void)tokensForExtensionIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "retrieving sso tokens", v2, v3, v4, v5, v6);
}

- (void)setTokens:extensionIdentifier:returningError:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "setting sso tokens", v2, v3, v4, v5, v6);
}

- (void)saveAppSSOConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)createAppSSOCachePath
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

@end