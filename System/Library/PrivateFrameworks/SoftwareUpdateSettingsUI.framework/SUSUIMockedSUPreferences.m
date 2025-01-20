@interface SUSUIMockedSUPreferences
+ (id)sharedInstance;
- (BOOL)autoInstallSecurityResponse;
- (BOOL)autoInstallSecurityResponseForceOn;
- (BOOL)autoInstallSystemAndDataFiles;
- (BOOL)isAutomaticDownloadEnabled;
- (BOOL)isAutomaticUpdateV2Enabled;
- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse;
- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled;
- (id)preferences;
- (void)enableAutoInstallSecurityResponse:(BOOL)a3;
- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3;
- (void)enableAutomaticDownload:(BOOL)a3;
- (void)enableAutomaticUpdateV2:(BOOL)a3;
- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3;
- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3;
@end

@implementation SUSUIMockedSUPreferences

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_6);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

void __42__SUSUIMockedSUPreferences_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SUSUIMockedSUPreferences);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
}

- (BOOL)isAutomaticDownloadEnabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSUPreferences *)self preferences];
  char v11 = [v10 automaticDownloadEnabled];

  char v15 = v11 & 1;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v9 = +[SUSUITestAutomationManager sharedManager];
    id v8 = (id)[v9 currentSession];
    id v7 = (id)[v8 correlationId];
    id v2 = v7;
    id v12 = v2;
    if (v15) {
      v3 = "YES";
    }
    else {
      v3 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences isAutomaticDownloadEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'automaticDownloadEnabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v11 = +[SUSUITestAutomationManager sharedManager];
    id v10 = (id)[v11 currentSession];
    id v9 = (id)[v10 correlationId];
    id v3 = v9;
    id v12 = v3;
    if (v15) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enableAutomaticDownload:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'automaticDownloadEnabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  BOOL v5 = v15;
  id v6 = [(SUSUIMockedSUPreferences *)v17 preferences];
  [v6 setAutomaticDownloadEnabled:v5];
}

- (BOOL)isAutomaticUpdateV2Enabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSUPreferences *)self preferences];
  char v11 = [v10 automaticUpdateV2Enabled];

  char v15 = v11 & 1;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v9 = +[SUSUITestAutomationManager sharedManager];
    id v8 = (id)[v9 currentSession];
    id v7 = (id)[v8 correlationId];
    id v2 = v7;
    id v12 = v2;
    if (v15) {
      id v3 = "YES";
    }
    else {
      id v3 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences isAutomaticUpdateV2Enabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'automaticUpdateV2Enabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v11 = +[SUSUITestAutomationManager sharedManager];
    id v10 = (id)[v11 currentSession];
    id v9 = (id)[v10 correlationId];
    id v3 = v9;
    id v12 = v3;
    if (v15) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enableAutomaticUpdateV2:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'automaticUpdateV2Enabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  BOOL v5 = v15;
  id v6 = [(SUSUIMockedSUPreferences *)v17 preferences];
  [v6 setAutomaticUpdateV2Enabled:v5];
}

- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSUPreferences *)self preferences];
  char v11 = [v10 previousUserSpecifiedAutomaticUpdateV2Enabled];

  char v15 = v11 & 1;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v9 = +[SUSUITestAutomationManager sharedManager];
    id v8 = (id)[v9 currentSession];
    id v7 = (id)[v8 correlationId];
    id v2 = v7;
    id v12 = v2;
    if (v15) {
      id v3 = "YES";
    }
    else {
      id v3 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences previousUserSpecifiedAutomaticUpdateV2Enabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'previousUserSpecifiedAutomaticUpdateV2Enabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v11 = +[SUSUITestAutomationManager sharedManager];
    id v10 = (id)[v11 currentSession];
    id v9 = (id)[v10 correlationId];
    id v3 = v9;
    id v12 = v3;
    if (v15) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enablePreviousUserSpecifiedAutomaticUpdateV2:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'previousUserSpecifiedAutomaticUpdateV2Enabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  BOOL v5 = v15;
  id v6 = [(SUSUIMockedSUPreferences *)v17 preferences];
  [v6 setPreviousUserSpecifiedAutomaticUpdateV2Enabled:v5];
}

- (BOOL)autoInstallSecurityResponse
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSUPreferences *)self preferences];
  char v11 = [v10 autoInstallSecurityResponse];

  char v15 = v11 & 1;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v9 = +[SUSUITestAutomationManager sharedManager];
    id v8 = (id)[v9 currentSession];
    id v7 = (id)[v8 correlationId];
    id v2 = v7;
    id v12 = v2;
    if (v15) {
      id v3 = "YES";
    }
    else {
      id v3 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences autoInstallSecurityResponse]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'autoInstallSecurityResponse': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enableAutoInstallSecurityResponse:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v11 = +[SUSUITestAutomationManager sharedManager];
    id v10 = (id)[v11 currentSession];
    id v9 = (id)[v10 correlationId];
    id v3 = v9;
    id v12 = v3;
    if (v15) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enableAutoInstallSecurityResponse:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'autoInstallSecurityResponse': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  BOOL v5 = v15;
  id v6 = [(SUSUIMockedSUPreferences *)v17 preferences];
  [v6 setAutoInstallSecurityResponse:v5];
}

- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSUPreferences *)self preferences];
  char v11 = [v10 previousUserSpecifiedAutoInstallSecurityResponse];

  char v15 = v11 & 1;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v9 = +[SUSUITestAutomationManager sharedManager];
    id v8 = (id)[v9 currentSession];
    id v7 = (id)[v8 correlationId];
    id v2 = v7;
    id v12 = v2;
    if (v15) {
      id v3 = "YES";
    }
    else {
      id v3 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences previousUserSpecifiedAutoInstallSecurityResponse]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'previousUserSpecifiedAutoInstallSecurityResponse': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v11 = +[SUSUITestAutomationManager sharedManager];
    id v10 = (id)[v11 currentSession];
    id v9 = (id)[v10 correlationId];
    id v3 = v9;
    id v12 = v3;
    if (v15) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enablePreviousUserSpecifiedAutoInstallSecurityResponse:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'previousUserSpecifiedAutoInstallSecurityResponse': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  BOOL v5 = v15;
  id v6 = [(SUSUIMockedSUPreferences *)v17 preferences];
  [v6 setPreviousUserSpecifiedAutoInstallSecurityResponse:v5];
}

- (BOOL)autoInstallSystemAndDataFiles
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSUPreferences *)self preferences];
  char v11 = [v10 autoInstallSystemAndDataFiles];

  char v15 = v11 & 1;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v9 = +[SUSUITestAutomationManager sharedManager];
    id v8 = (id)[v9 currentSession];
    id v7 = (id)[v8 correlationId];
    id v2 = v7;
    id v12 = v2;
    if (v15) {
      id v3 = "YES";
    }
    else {
      id v3 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences autoInstallSystemAndDataFiles]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'autoInstallSystemAndDataFiles': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id v14 = _SUSUIInternalLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    id v11 = +[SUSUITestAutomationManager sharedManager];
    id v10 = (id)[v11 currentSession];
    id v9 = (id)[v10 correlationId];
    id v3 = v9;
    id v12 = v3;
    if (v15) {
      v4 = "YES";
    }
    else {
      v4 = "NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enableAutoInstallSystemAndDataFiles:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'autoInstallSystemAndDataFiles': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  BOOL v5 = v15;
  id v6 = [(SUSUIMockedSUPreferences *)v17 preferences];
  [v6 setAutoInstallSystemAndDataFiles:v5];
}

- (BOOL)autoInstallSecurityResponseForceOn
{
  return 0;
}

- (id)preferences
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v28[2] = self;
  v28[1] = (id)a2;
  id v17 = +[SUSUITestAutomationManager sharedManager];
  id v16 = (id)[v17 currentSession];
  v28[0] = (id)[v16 strategyForServiceType:0];

  getSUSMKSoftwareUpdateServicesStrategyBaseClass_0();
  if (objc_opt_isKindOfClass())
  {
    id v22 = (id)[v28[0] options];
    getSUSMKSoftwareUpdateServicesStrategyOptionsClass_0();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v21 = _SUSUIInternalLoggingFacility();
      char v20 = 16;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        BOOL v5 = v21;
        os_log_type_t v6 = v20;
        id v9 = +[SUSUITestAutomationManager sharedManager];
        id v8 = (id)[v9 currentSession];
        id v7 = (id)[v8 correlationId];
        id v4 = v7;
        id v19 = v4;
        id v18 = (id)objc_opt_class();
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v30, (uint64_t)v4, (uint64_t)v18);
        _os_log_error_impl(&dword_228401000, v5, v6, "[XCUI correlationId: %@] The strategy options class %@ doesn't inherit SUSMKSoftwareUpdateServicesStrategyOptions.", v30, 0x16u);

        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
      }
      objc_storeStrong(&v21, 0);
    }
    id v29 = (id)[v22 preferences];
    int v23 = 1;
    objc_storeStrong(&v22, 0);
  }
  else
  {
    id v27 = _SUSUIInternalLoggingFacility();
    char v26 = 16;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      log = v27;
      os_log_type_t type = v26;
      id v15 = +[SUSUITestAutomationManager sharedManager];
      id v14 = (id)[v15 currentSession];
      id v13 = (id)[v14 correlationId];
      id v10 = v13;
      id v25 = v10;
      id v24 = (id)objc_opt_class();
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v31, (uint64_t)v10, (uint64_t)v24);
      _os_log_error_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] The strategy class %@ doesn't inherit SUSMKSoftwareUpdateServicesStrategyBase.", v31, 0x16u);

      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v27, 0);
    id v29 = 0;
    int v23 = 1;
  }
  objc_storeStrong(v28, 0);
  id v2 = v29;
  return v2;
}

@end