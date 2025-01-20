@interface SUSUIMockedSoftwareUpdateClientManager
- (BOOL)isAutoDownloadEnabled;
- (BOOL)isAutoInstallEnabled;
- (BOOL)isAutoInstallPreviousUserSettingsEnabled;
- (BOOL)isAutomaticInstallSystemDataFilesEnabled;
- (BOOL)isSecurityResponseEnabled;
- (BOOL)previousUserSpecifiedSecurityResponseEnabled;
- (id)preferences;
- (void)queue_enableAutoInstallPreviousUserSettings:(BOOL)a3;
- (void)queue_enableAutomaticInstallSystemDataFiles:(BOOL)a3;
- (void)queue_setAutoDownloadEnabled:(BOOL)a3;
- (void)queue_setAutoInstallEnabled:(BOOL)a3;
- (void)queue_setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3;
- (void)queue_setSecurityResponseEnabled:(BOOL)a3;
@end

@implementation SUSUIMockedSoftwareUpdateClientManager

- (BOOL)isAutoDownloadEnabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSoftwareUpdateClientManager *)self preferences];
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
      v3 = @"YES";
    }
    else {
      v3 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isAutoDownloadEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'automaticDownloadEnabled': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_setAutoDownloadEnabled:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  SEL v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = _SUSUIInternalLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    id v10 = +[SUSUITestAutomationManager sharedManager];
    id v9 = (id)[v10 currentSession];
    id v8 = (id)[v9 correlationId];
    id v3 = v8;
    id v11 = v3;
    if (v14) {
      v4 = @"YES";
    }
    else {
      v4 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_setAutoDownloadEnabled:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setAutomaticDownloadEnabled': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  id v5 = [(SUSUIMockedSoftwareUpdateClientManager *)v16 preferences];
  [v5 setAutomaticDownloadEnabled:v14];
}

- (BOOL)isAutoInstallEnabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSoftwareUpdateClientManager *)self preferences];
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
      id v3 = @"YES";
    }
    else {
      id v3 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isAutoInstallEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'automaticUpdateV2Enabled': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_setAutoInstallEnabled:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  SEL v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = _SUSUIInternalLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    id v10 = +[SUSUITestAutomationManager sharedManager];
    id v9 = (id)[v10 currentSession];
    id v8 = (id)[v9 correlationId];
    id v3 = v8;
    id v11 = v3;
    if (v14) {
      v4 = @"YES";
    }
    else {
      v4 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_setAutoInstallEnabled:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setAutomaticUpdateV2Enabled': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  id v5 = [(SUSUIMockedSoftwareUpdateClientManager *)v16 preferences];
  [v5 setAutomaticUpdateV2Enabled:v14];
}

- (BOOL)isAutoInstallPreviousUserSettingsEnabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSoftwareUpdateClientManager *)self preferences];
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
      id v3 = @"YES";
    }
    else {
      id v3 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isAutoInstallPreviousUserSettingsEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'previousUserSpecifiedAutomaticUpdateV2Enabled': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_enableAutoInstallPreviousUserSettings:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  SEL v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = _SUSUIInternalLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    id v10 = +[SUSUITestAutomationManager sharedManager];
    id v9 = (id)[v10 currentSession];
    id v8 = (id)[v9 correlationId];
    id v3 = v8;
    id v11 = v3;
    if (v14) {
      v4 = @"YES";
    }
    else {
      v4 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_enableAutoInstallPreviousUserSettings:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setPreviousUserSpecifiedAutomaticUpdateV2Enabled': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  id v5 = [(SUSUIMockedSoftwareUpdateClientManager *)v16 preferences];
  [v5 setPreviousUserSpecifiedAutomaticUpdateV2Enabled:v14];
}

- (BOOL)isSecurityResponseEnabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSoftwareUpdateClientManager *)self preferences];
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
      id v3 = @"YES";
    }
    else {
      id v3 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isSecurityResponseEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'autoInstallSecurityResponse': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_setSecurityResponseEnabled:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  SEL v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = _SUSUIInternalLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    id v10 = +[SUSUITestAutomationManager sharedManager];
    id v9 = (id)[v10 currentSession];
    id v8 = (id)[v9 correlationId];
    id v3 = v8;
    id v11 = v3;
    if (v14) {
      v4 = @"YES";
    }
    else {
      v4 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_setSecurityResponseEnabled:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setAutoInstallSecurityResponse': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  id v5 = [(SUSUIMockedSoftwareUpdateClientManager *)v16 preferences];
  [v5 setAutoInstallSecurityResponse:v14];
}

- (BOOL)previousUserSpecifiedSecurityResponseEnabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSoftwareUpdateClientManager *)self preferences];
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
      id v3 = @"YES";
    }
    else {
      id v3 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager previousUserSpecifiedSecurityResponseEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'previousUserSpecifiedAutoInstallSecurityResponse': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  SEL v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = _SUSUIInternalLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    id v10 = +[SUSUITestAutomationManager sharedManager];
    id v9 = (id)[v10 currentSession];
    id v8 = (id)[v9 correlationId];
    id v3 = v8;
    id v11 = v3;
    if (v14) {
      v4 = @"YES";
    }
    else {
      v4 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_setPreviousUserSpecifiedSecurityResponseStatus:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setPreviousUserSpecifiedAutoInstallSecurityResponse': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  id v5 = [(SUSUIMockedSoftwareUpdateClientManager *)v16 preferences];
  [v5 setPreviousUserSpecifiedAutoInstallSecurityResponse:v14];
}

- (BOOL)isAutomaticInstallSystemDataFilesEnabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17 = self;
  SEL v16 = a2;
  id v10 = [(SUSUIMockedSoftwareUpdateClientManager *)self preferences];
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
      id v3 = @"YES";
    }
    else {
      id v3 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isAutomaticInstallSystemDataFilesEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'autoInstallSystemAndDataFiles': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_enableAutomaticInstallSystemDataFiles:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  SEL v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = _SUSUIInternalLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    id v10 = +[SUSUITestAutomationManager sharedManager];
    id v9 = (id)[v10 currentSession];
    id v8 = (id)[v9 correlationId];
    id v3 = v8;
    id v11 = v3;
    if (v14) {
      v4 = @"YES";
    }
    else {
      v4 = @"NO";
    }
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_enableAutomaticInstallSystemDataFiles:]", (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setAutoInstallSystemAndDataFiles': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  id v5 = [(SUSUIMockedSoftwareUpdateClientManager *)v16 preferences];
  [v5 setAutoInstallSystemAndDataFiles:v14];
}

- (id)preferences
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v28[2] = self;
  v28[1] = (id)a2;
  id v17 = +[SUSUITestAutomationManager sharedManager];
  id v16 = (id)[v17 currentSession];
  v28[0] = (id)[v16 strategyForServiceType:0];

  getSUSMKSoftwareUpdateServicesStrategyBaseClass();
  if (objc_opt_isKindOfClass())
  {
    id v22 = (id)[v28[0] options];
    getSUSMKSoftwareUpdateServicesStrategyOptionsClass();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v21 = _SUSUIInternalLoggingFacility();
      char v20 = 16;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        id v5 = v21;
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