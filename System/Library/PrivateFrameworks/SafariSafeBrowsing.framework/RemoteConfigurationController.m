@interface RemoteConfigurationController
+ (id)convertDyldVersionToString:(unint64_t)a3;
+ (id)sharedController;
- (BOOL)_shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:(id)a3;
- (BOOL)forceLoadConfigurationFromDisk;
- (BOOL)forceUpdateConfigurationFromServer;
- (BOOL)isSafeBrowsingOff;
- (NSDictionary)currentConfiguration;
- (ProviderConfiguration)appleProviderConfiguration;
- (ProviderConfiguration)googleProviderConfiguration;
- (ProviderConfiguration)tencentProviderConfiguration;
- (RemoteConfigurationController)init;
- (id)_dyldSourceVersionString;
- (id)_lastConfigurationUpdateAttemptDate;
- (id)_providerToTurnOffFromProviderDictionary:(id)a3;
- (id)_urlOfDownloadedConfiguration;
- (void)_didReceiveConfigurationData:(id)a3;
- (void)_downloadConfigurationWithCompletionHandler:(id)a3;
- (void)_initializeProviderConfigurationsWithConfiguration:(id)a3;
- (void)_initializeToDefaultProviderConfigurations;
- (void)_loadConfigurationFromDiskIfNecessary;
- (void)_notifyProviderConfigurationsDidChangeIfNecessary;
- (void)_resetProviderConfigurationsDidChange;
- (void)_scheduleConfigurationUpdateDaily;
- (void)_setCurrentConfigurationOnInternalQueue:(id)a3;
- (void)_setCurrentDateAsLastConfigurationUpdateAttemptDate;
- (void)_simplifyProviderConfigurations;
- (void)_updateConfigurationIfNecessary;
- (void)_urlOfDownloadedConfiguration;
- (void)_writeConfigurationToDisk:(id)a3;
- (void)dealloc;
- (void)setCurrentConfiguration:(id)a3;
@end

@implementation RemoteConfigurationController

+ (id)sharedController
{
  if (+[RemoteConfigurationController sharedController]::onceToken != -1) {
    dispatch_once(&+[RemoteConfigurationController sharedController]::onceToken, &__block_literal_global_1);
  }
  v2 = (void *)+[RemoteConfigurationController sharedController]::sharedController;

  return v2;
}

uint64_t __49__RemoteConfigurationController_sharedController__block_invoke()
{
  +[RemoteConfigurationController sharedController]::sharedController = objc_alloc_init(RemoteConfigurationController);

  return MEMORY[0x270F9A758]();
}

- (RemoteConfigurationController)init
{
  v7.receiver = self;
  v7.super_class = (Class)RemoteConfigurationController;
  v2 = [(RemoteConfigurationController *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.RemoteConfigurationController.InternalQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    [(RemoteConfigurationController *)v2 _loadConfigurationFromDiskIfNecessary];
    [(RemoteConfigurationController *)v2 _updateConfigurationIfNecessary];
    [(RemoteConfigurationController *)v2 _initializeProviderConfigurationsWithConfiguration:v2->_currentConfiguration];
    [(RemoteConfigurationController *)v2 _scheduleConfigurationUpdateDaily];
    [(RemoteConfigurationController *)v2 _resetProviderConfigurationsDidChange];
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__RemoteConfigurationController_dealloc__block_invoke;
  block[3] = &unk_263FCE4E8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)RemoteConfigurationController;
  [(RemoteConfigurationController *)&v4 dealloc];
}

void __40__RemoteConfigurationController_dealloc__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    objc_super v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;
  }
}

- (BOOL)isSafeBrowsingOff
{
  if (![self->_googleProviderConfiguration providerOff]
    || ![self->_tencentProviderConfiguration providerOff])
  {
    return 0;
  }
  appleProviderConfiguration = self->_appleProviderConfiguration;

  return [appleProviderConfiguration providerOff];
}

- (id)_providerToTurnOffFromProviderDictionary:(id)a3
{
  uint64_t v3 = [a3 objectForKey:@"Provider To Turn Off"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v5 = (void *)v3;
  }
  else {
    v5 = 0;
  }
  if (isKindOfClass) {
    v6 = 0;
  }
  else {
    v6 = (void *)v3;
  }

  return v5;
}

- (void)_initializeToDefaultProviderConfigurations
{
  googleProviderConfiguration = self->_googleProviderConfiguration;
  if (googleProviderConfiguration
    && ![googleProviderConfiguration isEqualToConfiguration:0])
  {
    self->_googleConfigurationDidChange = 1;
  }
  objc_super v4 = [[ProviderConfiguration alloc] initWithConfiguration:0];
  v5 = self->_googleProviderConfiguration;
  self->_googleProviderConfiguration = v4;

  tencentProviderConfiguration = self->_tencentProviderConfiguration;
  if (tencentProviderConfiguration
    && ![tencentProviderConfiguration isEqualToConfiguration:0])
  {
    self->_tencentConfigurationDidChange = 1;
  }
  objc_super v7 = [[ProviderConfiguration alloc] initWithConfiguration:0];
  v8 = self->_tencentProviderConfiguration;
  self->_tencentProviderConfiguration = v7;

  appleProviderConfiguration = self->_appleProviderConfiguration;
  if (appleProviderConfiguration
    && ![appleProviderConfiguration isEqualToConfiguration:0])
  {
    self->_appleConfigurationDidChange = 1;
  }
  self->_appleProviderConfiguration = [[ProviderConfiguration alloc] initWithConfiguration:0];

  MEMORY[0x270F9A758]();
}

- (void)_simplifyProviderConfigurations
{
  if (![self->_googleProviderConfiguration providerOff])
  {
    if ([self->_googleProviderConfiguration socialEngineeringThreatTypeOff])
    {
      BOOL v3 = [self->_googleProviderConfiguration malwareThreatTypeOff];
    }
    else
    {
      BOOL v3 = 0;
    }
    [self->_googleProviderConfiguration setProviderOff:v3];
  }
  if (![self->_tencentProviderConfiguration providerOff]) {
    [self->_tencentProviderConfiguration setProviderOff:[self->_tencentProviderConfiguration socialEngineeringThreatTypeOff]];
  }
  if (![self->_appleProviderConfiguration providerOff])
  {
    BOOL v4 = [self->_appleProviderConfiguration socialEngineeringThreatTypeOff];
    appleProviderConfiguration = self->_appleProviderConfiguration;
    [appleProviderConfiguration setProviderOff:v4];
  }
}

+ (id)convertDyldVersionToString:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%i.%i.%i", ((a3 >> 40) & 0x7FFFFF) - 1000 * (((8589935 * ((a3 >> 40) & 0x7FFFFF)) >> 32) >> 1), (a3 >> 30) & 0x3FF, (a3 >> 20) & 0x3FF);
}

- (id)_dyldSourceVersionString
{
  if (-[RemoteConfigurationController _dyldSourceVersionString]::once != -1) {
    dispatch_once(&-[RemoteConfigurationController _dyldSourceVersionString]::once, &__block_literal_global_20);
  }
  v2 = (void *)-[RemoteConfigurationController _dyldSourceVersionString]::versionString;

  return v2;
}

void __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke()
{
  v0 = (int *)dyld_image_header_containing_address();
  if (v0)
  {
    v1 = v0;
    if (*v0 == -17958193)
    {
      int v2 = v0[4];
      if (!v2) {
        goto LABEL_16;
      }
      BOOL v3 = v0 + 8;
      while (*v3 != 42)
      {
        BOOL v3 = (_DWORD *)((char *)v3 + v3[1]);
        if (!--v2) {
          goto LABEL_16;
        }
      }
      if (*((void *)v3 + 1))
      {
        -[RemoteConfigurationController _dyldSourceVersionString]::versionString = +[RemoteConfigurationController convertDyldVersionToString:](RemoteConfigurationController, "convertDyldVersionToString:");
        MEMORY[0x270F9A758]();
      }
      else
      {
LABEL_16:
        v6 = SSBOSLogRemoteConfiguration();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_2();
        }
      }
    }
    else
    {
      v5 = SSBOSLogRemoteConfiguration();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_3(v1, v5);
      }
    }
  }
  else
  {
    BOOL v4 = SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_1();
    }
  }
}

- (void)_initializeProviderConfigurationsWithConfiguration:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v48 = a3;
  if (v48)
  {
    v49 = self;
    v59 = [(RemoteConfigurationController *)self _dyldSourceVersionString];
    if (v59)
    {
      id v58 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      objc_msgSend(v48, "ssb_arrayForKey:", @"Configurations");
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v52 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (!v52) {
        goto LABEL_48;
      }
      uint64_t v51 = *(void *)v71;
      while (1)
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v71 != v51) {
            objc_enumerationMutation(obj);
          }
          BOOL v4 = *(void **)(*((void *)&v70 + 1) + 8 * v53);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = (id)SSBOSLogRemoteConfiguration();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              uint64_t v33 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              uint64_t v77 = v33;
              _os_log_error_impl(&dword_209FC0000, v5, OS_LOG_TYPE_ERROR, "Skipped an entry in the configuration. Expected a NSDictionary, got %{public}@", buf, 0xCu);
            }
            goto LABEL_31;
          }
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v5 = objc_msgSend(v4, "ssb_arrayForKey:", @"VersionRanges");
          uint64_t v6 = [v5 countByEnumeratingWithState:&v66 objects:v75 count:16];
          if (!v6) {
            goto LABEL_31;
          }
          uint64_t v7 = *(void *)v67;
          while (2)
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v67 != v7) {
                objc_enumerationMutation(v5);
              }
              v9 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v10 = (id)SSBOSLogRemoteConfiguration();
                if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v13 = objc_opt_class();
                  *(_DWORD *)buf = 138543362;
                  uint64_t v77 = v13;
                  _os_log_error_impl(&dword_209FC0000, v10, OS_LOG_TYPE_ERROR, "Skipped an version range in the configuration. Expected a NSDictionary, got %{public}@", buf, 0xCu);
                }
                goto LABEL_25;
              }
              v10 = objc_msgSend(v9, "ssb_stringForKey:", @"MinVersion");
              v11 = objc_msgSend(v9, "ssb_stringForKey:", @"MaxVersion");
              if (!-[NSObject length](v10, "length") || ![v11 length])
              {
                v14 = SSBOSLogRemoteConfiguration();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                  [(RemoteConfigurationController *)&v64 _initializeProviderConfigurationsWithConfiguration:v14];
                }
LABEL_24:

LABEL_25:
                continue;
              }
              if ([v59 compare:v10 options:64] == -1) {
                goto LABEL_24;
              }
              BOOL v12 = [v59 compare:v11 options:64] == 1;

              if (!v12)
              {

                long long v62 = 0u;
                long long v63 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                v5 = objc_msgSend(v4, "ssb_arrayForKey:", @"Providers");
                uint64_t v15 = [v5 countByEnumeratingWithState:&v60 objects:v74 count:16];
                if (v15)
                {
                  uint64_t v55 = *(void *)v61;
LABEL_35:
                  uint64_t v54 = v15;
                  uint64_t v16 = 0;
                  while (1)
                  {
                    if (*(void *)v61 != v55) {
                      objc_enumerationMutation(v5);
                    }
                    v17 = *(void **)(*((void *)&v60 + 1) + 8 * v16);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      break;
                    }
                    v18 = objc_msgSend(v17, "ssb_stringForKey:", @"Provider To Turn Off");
                    id v19 = [v58 objectForKeyedSubscript:v18];
                    id v20 = v17;
                    v21 = v20;
                    if (v19)
                    {
                      v22 = objc_msgSend(v19, "ssb_stringForKey:", @"Provider To Turn Off");
                      v56 = objc_msgSend(v21, "ssb_stringForKey:", @"Provider To Turn Off");
                      v57 = v22;
                      id v23 = v19;
                      if (objc_msgSend(v22, "isEqualToString:"))
                      {
                        id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                        [v23 setObject:v22 forKeyedSubscript:@"Provider To Turn Off"];
                        objc_msgSend(v19, "ssb_arrayForKey:", @"Regions To Turn Off");
                        v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "ssb_arrayForKey:", @"Regions To Turn Off");
                        v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        v26 = mergeConfigurationArrayIfBothNotNil(v24, v25);
                        [v23 setObject:v26 forKeyedSubscript:@"Regions To Turn Off"];

                        objc_msgSend(v19, "ssb_arrayForKey:", @"Threat Types To Turn Off");
                        v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "ssb_arrayForKey:", @"Threat Types To Turn Off");
                        v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        v29 = mergeConfigurationArrayIfBothNotNil(v27, v28);
                        [v23 setObject:v29 forKeyedSubscript:@"Threat Types To Turn Off"];

                        objc_msgSend(v19, "ssb_arrayForKey:", @"Proxy Versions To Turn Off");
                        v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "ssb_arrayForKey:", @"Proxy Versions To Turn Off");
                        v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        v32 = mergeConfigurationArray(v30, v31);
                        [v23 setObject:v32 forKeyedSubscript:@"Proxy Versions To Turn Off"];
                      }
                    }
                    else
                    {
                      id v23 = v20;
                    }
                    [v58 setObject:v23 forKeyedSubscript:v18];

                    if (v54 == ++v16)
                    {
                      uint64_t v15 = [v5 countByEnumeratingWithState:&v60 objects:v74 count:16];
                      if (v15) {
                        goto LABEL_35;
                      }
                      goto LABEL_31;
                    }
                  }
                }
                goto LABEL_31;
              }
            }
            uint64_t v6 = [v5 countByEnumeratingWithState:&v66 objects:v75 count:16];
            if (v6) {
              continue;
            }
            break;
          }
LABEL_31:

          ++v53;
        }
        while (v53 != v52);
        uint64_t v34 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
        uint64_t v52 = v34;
        if (!v34)
        {
LABEL_48:

          v35 = [v58 objectForKeyedSubscript:@"Google"];
          BOOL v36 = [v49->_googleProviderConfiguration isEqualToConfiguration:v35];
          v49->_googleConfigurationDidChange = !v36;
          if (!v36)
          {
            v37 = [[ProviderConfiguration alloc] initWithConfiguration:v35];
            googleProviderConfiguration = v49->_googleProviderConfiguration;
            v49->_googleProviderConfiguration = v37;
          }
          v39 = [v58 objectForKeyedSubscript:@"Tencent"];
          BOOL v40 = [v49->_tencentProviderConfiguration isEqualToConfiguration:v39];
          v49->_tencentConfigurationDidChange = !v40;
          if (!v40)
          {
            v41 = [[ProviderConfiguration alloc] initWithConfiguration:v39];
            tencentProviderConfiguration = v49->_tencentProviderConfiguration;
            v49->_tencentProviderConfiguration = v41;
          }
          v43 = [v58 objectForKeyedSubscript:@"Apple"];
          BOOL v44 = [v49->_googleProviderConfiguration isEqualToConfiguration:v43];
          v49->_appleConfigurationDidChange = !v44;
          if (!v44)
          {
            v45 = [[ProviderConfiguration alloc] initWithConfiguration:v43];
            appleProviderConfiguration = v49->_appleProviderConfiguration;
            v49->_appleProviderConfiguration = v45;
          }
          [(RemoteConfigurationController *)v49 _simplifyProviderConfigurations];

          goto LABEL_59;
        }
      }
    }
    v47 = SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
      -[RemoteConfigurationController _initializeProviderConfigurationsWithConfiguration:]();
    }
    [(RemoteConfigurationController *)self _initializeToDefaultProviderConfigurations];
LABEL_59:
  }
  else
  {
    [(RemoteConfigurationController *)self _initializeToDefaultProviderConfigurations];
  }
}

- (void)_resetProviderConfigurationsDidChange
{
  *(_WORD *)&self->_googleConfigurationDidChange = 0;
  self->_appleConfigurationDidChange = 0;
}

- (id)_urlOfDownloadedConfiguration
{
  v18[4] = *(id *)MEMORY[0x263EF8340];
  uid_t v2 = geteuid();
  if (!v2) {
    uid_t v2 = getuid();
  }
  BOOL v3 = getpwuid(v2);
  if (v3 && (pw_dir = v3->pw_dir) != 0)
  {
    v5 = [NSURL fileURLWithFileSystemRepresentation:pw_dir isDirectory:1 relativeToURL:0];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 URLByAppendingPathComponent:@"Library"];
      v8 = [v7 URLByAppendingPathComponent:@"SafariSafeBrowsing" isDirectory:1];
      v9 = [MEMORY[0x263F08850] defaultManager];
      v10 = [v8 path];
      v18[0] = 0;
      char v11 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:v18];
      id v12 = v18[0];

      if (v11)
      {
        uint64_t v13 = [@"SafeBrowsingRemoteConfiguration-1" stringByAppendingPathExtension:@"plist"];
        v14 = [v8 URLByAppendingPathComponent:v13];
      }
      else
      {
        uint64_t v13 = (id)SSBOSLogRemoteConfiguration();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "ssb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[RemoteConfigurationController _urlOfDownloadedConfiguration]();
        }
        v14 = 0;
      }
    }
    else
    {
      uint64_t v16 = SSBOSLogRemoteConfiguration();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[RemoteConfigurationController _urlOfDownloadedConfiguration]();
      }
      v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RemoteConfigurationController _urlOfDownloadedConfiguration]();
    }
    v14 = 0;
  }

  return v14;
}

- (void)_loadConfigurationFromDiskIfNecessary
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__RemoteConfigurationController__loadConfigurationFromDiskIfNecessary__block_invoke;
  block[3] = &unk_263FCE4E8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __70__RemoteConfigurationController__loadConfigurationFromDiskIfNecessary__block_invoke(uint64_t a1)
{
  uid_t v2 = *(void **)(a1 + 32);
  if (!v2[7])
  {
    BOOL v3 = [v2 _urlOfDownloadedConfiguration];
    if (v3)
    {
      BOOL v4 = [MEMORY[0x263F08850] defaultManager];
      v5 = [v3 path];
      char v6 = [v4 fileExistsAtPath:v5];

      if (v6)
      {
        uint64_t v7 = [NSDictionary dictionaryWithContentsOfURL:v3];
        uint64_t v8 = *(void *)(a1 + 32);
        v9 = *(void **)(v8 + 56);
        *(void *)(v8 + 56) = v7;

        if (!*(void *)(*(void *)(a1 + 32) + 56))
        {
          v10 = SSBOSLogRemoteConfiguration();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            __70__RemoteConfigurationController__loadConfigurationFromDiskIfNecessary__block_invoke_cold_1((uint64_t)v3, v10);
          }
        }
      }
    }
  }
}

- (void)_writeConfigurationToDisk:(id)a3
{
  v10[4] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(RemoteConfigurationController *)self _urlOfDownloadedConfiguration];
  if (v5)
  {
    if (v4)
    {
      [v4 writeToURL:v5 atomically:1];
    }
    else
    {
      char v6 = [MEMORY[0x263F08850] defaultManager];
      v10[0] = 0;
      char v7 = [v6 removeItemAtURL:v5 error:v10];
      id v8 = v10[0];

      if ((v7 & 1) == 0)
      {
        v9 = (id)SSBOSLogRemoteConfiguration();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "ssb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[RemoteConfigurationController _writeConfigurationToDisk:]();
        }
      }
    }
  }
}

- (void)setCurrentConfiguration:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__RemoteConfigurationController_setCurrentConfiguration___block_invoke;
  v7[3] = &unk_263FCE510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __57__RemoteConfigurationController_setCurrentConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCurrentConfigurationOnInternalQueue:*(void *)(a1 + 40)];
}

- (void)_setCurrentConfigurationOnInternalQueue:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  currentConfiguration = self->_currentConfiguration;
  id v7 = (id)v5;
  if (v5 | (unint64_t)currentConfiguration
    && (!v5 || ![(NSDictionary *)currentConfiguration isEqualToDictionary:v5]))
  {
    objc_storeStrong((id *)&self->_currentConfiguration, a3);
    [(RemoteConfigurationController *)self _initializeProviderConfigurationsWithConfiguration:self->_currentConfiguration];
    [(RemoteConfigurationController *)self _writeConfigurationToDisk:self->_currentConfiguration];
    [(RemoteConfigurationController *)self _notifyProviderConfigurationsDidChangeIfNecessary];
  }
}

- (void)_notifyProviderConfigurationsDidChangeIfNecessary
{
  uid_t v2 = self;
  if (self->_googleConfigurationDidChange) {
    self = (RemoteConfigurationController *)notify_post("com.apple.Safari.SafeBrowsing.GoogleRemoteConfigurationDidChange");
  }
  shouldConsultWithTencent = (Backend::Google::SSBUtilities *)Backend::Google::SSBUtilities::shouldConsultWithTencent((Backend::Google::SSBUtilities *)self);
  if (shouldConsultWithTencent && v2->_tencentConfigurationDidChange) {
    shouldConsultWithTencent = (Backend::Google::SSBUtilities *)notify_post("com.apple.Safari.SafeBrowsing.TencentRemoteConfigurationDidChange");
  }
  if (Backend::Google::SSBUtilities::shouldConsultWithApple(shouldConsultWithTencent)
    && v2->_appleConfigurationDidChange)
  {
    notify_post("com.apple.Safari.SafeBrowsing.AppleRemoteConfigurationDidChange");
  }

  [(RemoteConfigurationController *)v2 _resetProviderConfigurationsDidChange];
}

- (void)_downloadConfigurationWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFC640] sharedSession];
  unint64_t v5 = configurationBaseURL();
  id v6 = [@"SafeBrowsingRemoteConfiguration-1" stringByAppendingPathExtension:@"plist"];
  id v7 = [v5 URLByAppendingPathComponent:v6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__RemoteConfigurationController__downloadConfigurationWithCompletionHandler___block_invoke;
  v10[3] = &unk_263FCE538;
  id v8 = v3;
  id v11 = v8;
  v9 = [v4 dataTaskWithURL:v7 completionHandler:v10];
  [v9 resume];
}

void __77__RemoteConfigurationController__downloadConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v7 && v9)
  {
    id v11 = (id)SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ssb_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __77__RemoteConfigurationController__downloadConfigurationWithCompletionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateConfigurationIfNecessary
{
  id v3 = [(RemoteConfigurationController *)self _lastConfigurationUpdateAttemptDate];
  BOOL v4 = [(RemoteConfigurationController *)self _shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:v3];

  if (v4)
  {
    [(RemoteConfigurationController *)self _setCurrentDateAsLastConfigurationUpdateAttemptDate];
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __64__RemoteConfigurationController__updateConfigurationIfNecessary__block_invoke;
    v5[3] = &unk_263FCE588;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    [(RemoteConfigurationController *)self _downloadConfigurationWithCompletionHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __64__RemoteConfigurationController__updateConfigurationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __64__RemoteConfigurationController__updateConfigurationIfNecessary__block_invoke_2;
    v5[3] = &unk_263FCE560;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v6 = v3;
    dispatch_async(v4, v5);

    objc_destroyWeak(&v7);
  }
}

void __64__RemoteConfigurationController__updateConfigurationIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didReceiveConfigurationData:*(void *)(a1 + 32)];
}

- (void)_didReceiveConfigurationData:(id)a3
{
  v7[4] = *(id *)MEMORY[0x263EF8340];
  v7[0] = 0;
  BOOL v4 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:v7];
  id v5 = v7[0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(RemoteConfigurationController *)self _setCurrentConfigurationOnInternalQueue:v4];
  }
  else
  {
    id v6 = (id)SSBOSLogRemoteConfiguration();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "ssb_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[RemoteConfigurationController _didReceiveConfigurationData:]();
    }
  }
}

- (BOOL)_shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:(id)a3
{
  id v3 = (Backend::Google::SSBUtilities *)a3;
  BOOL v4 = v3;
  if (v3)
  {
    if (Backend::Google::SSBUtilities::isInternalInstall(v3)
      && ([MEMORY[0x263EFFA40] standardUserDefaults],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [v5 objectForKey:@"DebugSafeBrowsingTestUpdateInterval"],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v5,
          v6))
    {
      [(Backend::Google::SSBUtilities *)v4 timeIntervalSinceNow];
      double v8 = v7;
      [v6 doubleValue];
      BOOL v10 = v9 < -v8;
    }
    else
    {
      [(Backend::Google::SSBUtilities *)v4 timeIntervalSinceNow];
      BOOL v10 = v11 < -86400.0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)_lastConfigurationUpdateAttemptDate
{
  uid_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"SafeBrowsingRemoteConfigurationLastUpdateDate"];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v5 = (void *)v3;
  }
  else {
    id v5 = 0;
  }
  if (isKindOfClass) {
    id v6 = 0;
  }
  else {
    id v6 = (void *)v3;
  }

  return v5;
}

- (void)_setCurrentDateAsLastConfigurationUpdateAttemptDate
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uid_t v2 = [MEMORY[0x263EFF910] date];
  [v3 setObject:v2 forKey:@"SafeBrowsingRemoteConfigurationLastUpdateDate"];
}

- (void)_scheduleConfigurationUpdateDaily
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__RemoteConfigurationController__scheduleConfigurationUpdateDaily__block_invoke;
  block[3] = &unk_263FCE4E8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __66__RemoteConfigurationController__scheduleConfigurationUpdateDaily__block_invoke(id *a1)
{
  if (!*((void *)a1[4] + 2))
  {
    if (Backend::Google::SSBUtilities::isInternalInstall((Backend::Google::SSBUtilities *)a1))
    {
      uid_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v3 = [v2 objectForKey:@"DebugSafeBrowsingTestUpdateInterval"];

      if (v3)
      {
        [v3 doubleValue];
        double v5 = v4;
      }
      else
      {
        double v5 = 86400.0;
      }
    }
    else
    {
      double v5 = 86400.0;
    }
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)a1[4] + 1));
    double v7 = a1[4];
    double v8 = (void *)v7[2];
    v7[2] = v6;

    objc_initWeak(&location, a1[4]);
    double v9 = *((void *)a1[4] + 2);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__RemoteConfigurationController__scheduleConfigurationUpdateDaily__block_invoke_2;
    v12[3] = &unk_263FCE5B0;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v9, v12);
    BOOL v10 = *((void *)a1[4] + 2);
    dispatch_time_t v11 = dispatch_time(0, (unint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, (unint64_t)(v5 * 1000000000.0), (unint64_t)(v5 * 1000000000.0) / 0xA);
    dispatch_resume(*((dispatch_object_t *)a1[4] + 2));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __66__RemoteConfigurationController__scheduleConfigurationUpdateDaily__block_invoke_2(uint64_t a1)
{
  uid_t v2 = SSBOSLogRemoteConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_209FC0000, v2, OS_LOG_TYPE_INFO, "update timer fired", v5, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateConfigurationIfNecessary];
  }
}

- (BOOL)forceLoadConfigurationFromDisk
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__RemoteConfigurationController_forceLoadConfigurationFromDisk__block_invoke;
  v5[3] = &unk_263FCE5D8;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __63__RemoteConfigurationController_forceLoadConfigurationFromDisk__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _urlOfDownloadedConfiguration];
  if (v8)
  {
    uid_t v2 = [MEMORY[0x263F08850] defaultManager];
    char v3 = [v8 path];
    char v4 = [v2 fileExistsAtPath:v3];

    if (v4)
    {
      double v5 = [NSDictionary dictionaryWithContentsOfURL:v8];
      if (v5)
      {
        if (([*(id *)(*(void *)(a1 + 32) + 56) isEqualToDictionary:v5] & 1) == 0)
        {
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v5);
          [*(id *)(a1 + 32) _initializeProviderConfigurationsWithConfiguration:*(void *)(*(void *)(a1 + 32) + 56)];
          [*(id *)(a1 + 32) _notifyProviderConfigurationsDidChangeIfNecessary];
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 32);
      double v7 = *(void **)(v6 + 56);
      if (v7)
      {
        *(void *)(v6 + 56) = 0;

        [*(id *)(a1 + 32) _initializeToDefaultProviderConfigurations];
        [*(id *)(a1 + 32) _notifyProviderConfigurationsDidChangeIfNecessary];
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)forceUpdateConfigurationFromServer
{
  [(RemoteConfigurationController *)self _setCurrentDateAsLastConfigurationUpdateAttemptDate];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  char v4 = [MEMORY[0x263EFC648] ephemeralSessionConfiguration];
  double v5 = [MEMORY[0x263EFC640] sessionWithConfiguration:v4];
  uint64_t v6 = configurationBaseURL();
  double v7 = [@"SafeBrowsingRemoteConfiguration-1" stringByAppendingPathExtension:@"plist"];
  id v8 = [v6 URLByAppendingPathComponent:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke;
  v14[3] = &unk_263FCE628;
  v17 = &v18;
  char v9 = v3;
  uint64_t v15 = v9;
  uint64_t v16 = self;
  BOOL v10 = [v5 dataTaskWithURL:v8 completionHandler:v14];
  [v10 resume];

  dispatch_time_t v11 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    BOOL v12 = 0;
    *((unsigned char *)v19 + 24) = 0;
  }
  else
  {
    BOOL v12 = *((unsigned char *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = v9;
  if (!v7 || v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v8 statusCode] == 404)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      BOOL v12 = *(NSObject **)(v11 + 8);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke_2;
      block[3] = &unk_263FCE510;
      block[4] = v11;
      id v25 = *(id *)(a1 + 32);
      dispatch_async(v12, block);
      id v13 = v25;
    }
    else
    {
      v14 = *(NSObject **)(*(void *)(a1 + 40) + 8);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke_3;
      v19[3] = &unk_263FCE600;
      id v15 = v7;
      uint64_t v16 = *(void *)(a1 + 48);
      id v20 = v15;
      uint64_t v23 = v16;
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      id v21 = v17;
      uint64_t v22 = v18;
      dispatch_async(v14, v19);

      id v13 = v20;
    }
  }
}

intptr_t __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setCurrentConfigurationOnInternalQueue:0];
  uid_t v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

void __67__RemoteConfigurationController_forceUpdateConfigurationFromServer__block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08AC0] propertyListWithData:*(void *)(a1 + 32) options:0 format:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 48) _setCurrentConfigurationOnInternalQueue:v2];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (ProviderConfiguration)googleProviderConfiguration
{
  return self->_googleProviderConfiguration;
}

- (ProviderConfiguration)tencentProviderConfiguration
{
  return self->_tencentProviderConfiguration;
}

- (ProviderConfiguration)appleProviderConfiguration
{
  return self->_appleProviderConfiguration;
}

- (NSDictionary)currentConfiguration
{
  return self->_currentConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_appleProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_tencentProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_googleProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_209FC0000, v0, v1, "Mach-O header not found", v2, v3, v4, v5, v6);
}

void __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_209FC0000, v0, v1, "Could not find LC_SOURCE_VERSION Mach-O command", v2, v3, v4, v5, v6);
}

void __57__RemoteConfigurationController__dyldSourceVersionString__block_invoke_cold_3(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_209FC0000, a2, OS_LOG_TYPE_ERROR, "Mach-O header has incorrect magic: %04x", (uint8_t *)v3, 8u);
}

- (void)_initializeProviderConfigurationsWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_209FC0000, v0, OS_LOG_TYPE_FAULT, "Unable to determine SafariSafeBrowsing's version", v1, 2u);
}

- (void)_initializeProviderConfigurationsWithConfiguration:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_209FC0000, log, OS_LOG_TYPE_ERROR, "Skipped an version range in the configuration. Missing min or max versions entries in dictionary", buf, 2u);
}

- (void)_urlOfDownloadedConfiguration
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_209FC0000, v3, v4, "Failed to create Safe Browsing settings directory with error: %{public}@", v5);
}

void __70__RemoteConfigurationController__loadConfigurationFromDiskIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209FC0000, a2, OS_LOG_TYPE_ERROR, "The downloaded configuration could not be loaded from %@", (uint8_t *)&v2, 0xCu);
}

- (void)_writeConfigurationToDisk:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_209FC0000, v3, v4, "Failed to remove remote configuration file: %{public}@", v5);
}

void __77__RemoteConfigurationController__downloadConfigurationWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_209FC0000, v3, v4, "Failed to get configuration data from server with error: %{public}@", v5);
}

- (void)_didReceiveConfigurationData:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1(&dword_209FC0000, v3, v4, "Failed to read configuration data received from server with error: %{public}@", v5);
}

@end