@interface TFBetaApplicationProxy
- (BOOL)isBetaAppLaunchScreenEnabledForInstalledVersion;
- (BOOL)isProactiveFeedbackEnabledForInstalledVersion;
- (NSString)bundleIdentifier;
- (NSString)logKey;
- (NSString)preferredLocalizedDisplayNameForInstalledVersion;
- (NSURL)bundleURL;
- (id)initForAppWithBundleURL:(id)a3;
- (id)initForAppWithIdentifier:(id)a3;
- (id)initForAppWithIdentifier:(id)a3 appPlatform:(int64_t)a4;
- (int64_t)_asdAppPlatform;
- (int64_t)bundleAppPlatform;
- (void)deviceWillInstallVersion:(id)a3 build:(id)a4 withLocalizedDisplayNames:(id)a5 localizedTestNotes:(id)a6 primaryLocaleKey:(id)a7 developerName:(id)a8 expirationDate:(id)a9 iconUrlTemplate:(id)a10 testerEmail:(id)a11;
- (void)overwriteMetadataForInstalledVersion:(id)a3 build:(id)a4 withLocalizedDisplayNames:(id)a5 localizedTestNotes:(id)a6 primaryLocaleKey:(id)a7 developerName:(id)a8 expirationDate:(id)a9 iconUrlTemplate:(id)a10 testerEmail:(id)a11;
- (void)setBetaAppLaunchScreenEnabled:(BOOL)a3 forVersion:(id)a4 build:(id)a5;
- (void)setBundleAppPlatform:(int64_t)a3;
- (void)setProactiveFeedbackEnabled:(BOOL)a3 forVersion:(id)a4 build:(id)a5;
- (void)updateLocalizedTestNotes:(id)a3 forVersion:(id)a4 build:(id)a5;
@end

@implementation TFBetaApplicationProxy

- (id)initForAppWithBundleURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFBetaApplicationProxy;
  v6 = [(TFBetaApplicationProxy *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleURL, a3);
    uint64_t v8 = AMSGenerateLogCorrelationKey();
    logKey = v7->_logKey;
    v7->_logKey = (NSString *)v8;
  }
  return v7;
}

- (id)initForAppWithIdentifier:(id)a3
{
  return [(TFBetaApplicationProxy *)self initForAppWithIdentifier:a3 appPlatform:0];
}

- (id)initForAppWithIdentifier:(id)a3 appPlatform:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TFBetaApplicationProxy;
  uint64_t v8 = [(TFBetaApplicationProxy *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    v9->_bundleAppPlatform = a4;
    uint64_t v10 = AMSGenerateLogCorrelationKey();
    logKey = v9->_logKey;
    v9->_logKey = (NSString *)v10;
  }
  return v9;
}

- (NSString)preferredLocalizedDisplayNameForInstalledVersion
{
  bundleURL = self->_bundleURL;
  v4 = [MEMORY[0x263F25528] sharedInstance];
  id v5 = v4;
  if (bundleURL) {
    [v4 getDisplayNamesForBundleURL:self->_bundleURL];
  }
  else {
  v6 = [v4 getDisplayNamesForBundleID:self->_bundleIdentifier];
  }

  if (v6)
  {
    id v7 = +[TFLocale preferredLocalizedDisplayNameFromDisplayNames:v6];
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)isProactiveFeedbackEnabledForInstalledVersion
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  bundleURL = self->_bundleURL;
  v4 = [MEMORY[0x263F25528] sharedInstance];
  id v5 = v4;
  if (bundleURL) {
    int v6 = [v4 isFeedbackEnabledForBundleURL:self->_bundleURL];
  }
  else {
    int v6 = [v4 isFeedbackEnabledForBundleID:self->_bundleIdentifier];
  }
  BOOL v7 = v6;

  uint64_t v8 = +[TFLogConfiguration defaultConfiguration];
  v9 = [v8 generatedLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    v12 = [(TFBetaApplicationProxy *)self bundleIdentifier];
    objc_super v13 = [(TFBetaApplicationProxy *)self logKey];
    int v15 = 138544130;
    v16 = v10;
    __int16 v17 = 2114;
    v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 1024;
    BOOL v22 = v7;
    _os_log_impl(&dword_223064000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] isProactiveFeedbackEnabledForInstalledVersion enabled = %d", (uint8_t *)&v15, 0x26u);
  }
  return v7;
}

- (BOOL)isBetaAppLaunchScreenEnabledForInstalledVersion
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  bundleURL = self->_bundleURL;
  v4 = [MEMORY[0x263F25528] sharedInstance];
  id v5 = v4;
  if (bundleURL) {
    int v6 = [v4 isLaunchScreenEnabledForBundleURL:self->_bundleURL];
  }
  else {
    int v6 = [v4 isLaunchScreenEnabledForBundleID:self->_bundleIdentifier];
  }
  BOOL v7 = v6;

  uint64_t v8 = +[TFLogConfiguration defaultConfiguration];
  v9 = [v8 generatedLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    v12 = [(TFBetaApplicationProxy *)self bundleIdentifier];
    objc_super v13 = [(TFBetaApplicationProxy *)self logKey];
    int v15 = 138544130;
    v16 = v10;
    __int16 v17 = 2114;
    v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 1024;
    BOOL v22 = v7;
    _os_log_impl(&dword_223064000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] isBetaAppLaunchScreenEnabledForInstalledVersion enabled = %d", (uint8_t *)&v15, 0x26u);
  }
  return v7;
}

- (void)deviceWillInstallVersion:(id)a3 build:(id)a4 withLocalizedDisplayNames:(id)a5 localizedTestNotes:(id)a6 primaryLocaleKey:(id)a7 developerName:(id)a8 expirationDate:(id)a9 iconUrlTemplate:(id)a10 testerEmail:(id)a11
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v17 = a4;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v44 = a8;
  id v18 = a9;
  id v19 = a10;
  id v40 = a11;
  v20 = +[TFLogConfiguration defaultConfiguration];
  __int16 v21 = [v20 generatedLogger];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = v19;
    id v23 = v17;
    v24 = objc_opt_class();
    id v39 = v24;
    v25 = [(TFBetaApplicationProxy *)self bundleIdentifier];
    v26 = [(TFBetaApplicationProxy *)self logKey];
    *(_DWORD *)buf = 138546178;
    v51 = v24;
    id v17 = v23;
    id v19 = v22;
    __int16 v52 = 2114;
    v53 = v25;
    __int16 v54 = 2112;
    v55 = v26;
    __int16 v56 = 2112;
    id v57 = v45;
    __int16 v58 = 2112;
    id v59 = v17;
    __int16 v60 = 2112;
    id v61 = v43;
    __int16 v62 = 2112;
    id v63 = v42;
    __int16 v64 = 2112;
    id v65 = v41;
    __int16 v66 = 2112;
    id v67 = v44;
    __int16 v68 = 2112;
    id v69 = v18;
    __int16 v70 = 2112;
    id v71 = v22;
    __int16 v72 = 2112;
    id v73 = v40;
    _os_log_impl(&dword_223064000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] deviceWillInstallVersion               shortVersionString = %@ |              bundleVersion = %@ |              localizedDisplayNames = %@ |              localizedTestNotes = %@ |              primaryLocaleKey = %@ |              developerName = %@ |              expirationDate = %@ |              iconUrlTemplate = %@ |              testerEmail = %@", buf, 0x7Au);
  }
  id v27 = objc_alloc_init(MEMORY[0x263F25400]);
  v28 = (void *)MEMORY[0x263F25408];
  v29 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  v30 = objc_msgSend(v28, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v29, v17, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v45);
  [v27 setVersion:v30];

  [v27 setExpirationDate:v18];
  [v27 setArtistName:v44];
  [v27 setIconURLTemplate:v19];
  [v27 setLocalizedTestNotes:v42];
  [v27 setTesterEmail:v40];
  v31 = [MEMORY[0x263F253F0] displayNameWithLocalizedNames:v43 andPrimaryLocale:v41];
  [v27 setDisplayNames:v31];

  [v27 setSharedFeedback:0];
  [v27 setFeedbackEnabled:0];
  [v27 setLaunchScreenEnabled:0];
  uint64_t v32 = objc_opt_class();
  v33 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  v34 = [(TFBetaApplicationProxy *)self logKey];
  [MEMORY[0x263F25528] sharedInstance];
  v36 = v35 = v17;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __176__TFBetaApplicationProxy_deviceWillInstallVersion_build_withLocalizedDisplayNames_localizedTestNotes_primaryLocaleKey_developerName_expirationDate_iconUrlTemplate_testerEmail___block_invoke;
  v46[3] = &unk_26468E8E0;
  id v48 = v34;
  uint64_t v49 = v32;
  id v47 = v33;
  id v37 = v34;
  id v38 = v33;
  [v36 setLaunchInfo:v27 withCompletionHandler:v46];
}

void __176__TFBetaApplicationProxy_deviceWillInstallVersion_build_withLocalizedDisplayNames_localizedTestNotes_primaryLocaleKey_developerName_expirationDate_iconUrlTemplate_testerEmail___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = +[TFLogConfiguration defaultConfiguration];
    id v5 = [v4 generatedLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v6 = a1[6];
      uint64_t v8 = a1[4];
      v9 = [v3 localizedDescription];
      int v10 = 138544130;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_223064000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to save launch info. error = %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)setProactiveFeedbackEnabled:(BOOL)a3 forVersion:(id)a4 build:(id)a5
{
  BOOL v6 = a3;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = +[TFLogConfiguration defaultConfiguration];
  uint64_t v11 = [v10 generatedLogger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = objc_opt_class();
    id v13 = v12;
    __int16 v14 = [(TFBetaApplicationProxy *)self bundleIdentifier];
    uint64_t v15 = [(TFBetaApplicationProxy *)self logKey];
    *(_DWORD *)buf = 138544642;
    v30 = v12;
    __int16 v31 = 2114;
    uint64_t v32 = v14;
    __int16 v33 = 2112;
    v34 = v15;
    __int16 v35 = 1024;
    BOOL v36 = v6;
    __int16 v37 = 2112;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl(&dword_223064000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] setProactiveFeedbackEnabled               enabled = %d |              shortVersionString = %@ |              bundleVersion = %@ ", buf, 0x3Au);
  }
  __int16 v16 = (void *)MEMORY[0x263F25408];
  id v17 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  uint64_t v18 = objc_msgSend(v16, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v17, v9, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v8);

  uint64_t v19 = objc_opt_class();
  v20 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  __int16 v21 = [(TFBetaApplicationProxy *)self logKey];
  id v22 = [MEMORY[0x263F25528] sharedInstance];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __71__TFBetaApplicationProxy_setProactiveFeedbackEnabled_forVersion_build___block_invoke;
  v25[3] = &unk_26468E8E0;
  id v27 = v21;
  uint64_t v28 = v19;
  id v26 = v20;
  id v23 = v21;
  id v24 = v20;
  [v22 setFeedbackEnabled:v6 forVersion:v18 withCompletionHandler:v25];
}

void __71__TFBetaApplicationProxy_setProactiveFeedbackEnabled_forVersion_build___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = +[TFLogConfiguration defaultConfiguration];
    id v5 = [v4 generatedLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v6 = a1[6];
      uint64_t v8 = a1[4];
      id v9 = [v3 localizedDescription];
      int v10 = 138544130;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_223064000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to set proactive feedback flag. error = %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)setBetaAppLaunchScreenEnabled:(BOOL)a3 forVersion:(id)a4 build:(id)a5
{
  BOOL v6 = a3;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = +[TFLogConfiguration defaultConfiguration];
  uint64_t v11 = [v10 generatedLogger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = objc_opt_class();
    id v13 = v12;
    __int16 v14 = [(TFBetaApplicationProxy *)self bundleIdentifier];
    uint64_t v15 = [(TFBetaApplicationProxy *)self logKey];
    *(_DWORD *)buf = 138544642;
    v30 = v12;
    __int16 v31 = 2114;
    uint64_t v32 = v14;
    __int16 v33 = 2112;
    v34 = v15;
    __int16 v35 = 1024;
    BOOL v36 = v6;
    __int16 v37 = 2112;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl(&dword_223064000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] setBetaAppLaunchScreenEnabled               enabled = %d |              shortVersionString = %@ |              bundleVersion = %@ ", buf, 0x3Au);
  }
  __int16 v16 = (void *)MEMORY[0x263F25408];
  id v17 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  uint64_t v18 = objc_msgSend(v16, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v17, v9, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v8);

  uint64_t v19 = objc_opt_class();
  v20 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  __int16 v21 = [(TFBetaApplicationProxy *)self logKey];
  id v22 = [MEMORY[0x263F25528] sharedInstance];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__TFBetaApplicationProxy_setBetaAppLaunchScreenEnabled_forVersion_build___block_invoke;
  v25[3] = &unk_26468E8E0;
  id v27 = v21;
  uint64_t v28 = v19;
  id v26 = v20;
  id v23 = v21;
  id v24 = v20;
  [v22 setLaunchScreenEnabled:v6 forVersion:v18 withCompletionHandler:v25];
}

void __73__TFBetaApplicationProxy_setBetaAppLaunchScreenEnabled_forVersion_build___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = +[TFLogConfiguration defaultConfiguration];
    id v5 = [v4 generatedLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v6 = a1[6];
      uint64_t v8 = a1[4];
      id v9 = [v3 localizedDescription];
      int v10 = 138544130;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_223064000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to set beta launch screen flag. error = %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)updateLocalizedTestNotes:(id)a3 forVersion:(id)a4 build:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[TFLogConfiguration defaultConfiguration];
  __int16 v12 = [v11 generatedLogger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = v13;
    uint64_t v15 = [(TFBetaApplicationProxy *)self bundleIdentifier];
    __int16 v16 = [(TFBetaApplicationProxy *)self logKey];
    *(_DWORD *)buf = 138544642;
    __int16 v31 = v13;
    __int16 v32 = 2114;
    __int16 v33 = v15;
    __int16 v34 = 2112;
    __int16 v35 = v16;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    __int16 v40 = 2112;
    id v41 = v10;
    _os_log_impl(&dword_223064000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] updateLocalizedTestNotes               localizedTestNotes = %@ |              shortVersionString = %@ |              bundleVersion = %@ ", buf, 0x3Eu);
  }
  id v17 = (void *)MEMORY[0x263F25408];
  uint64_t v18 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  uint64_t v19 = objc_msgSend(v17, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v18, v10, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v9);

  uint64_t v20 = objc_opt_class();
  __int16 v21 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  id v22 = [(TFBetaApplicationProxy *)self logKey];
  id v23 = [MEMORY[0x263F25528] sharedInstance];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __68__TFBetaApplicationProxy_updateLocalizedTestNotes_forVersion_build___block_invoke;
  v26[3] = &unk_26468E8E0;
  id v28 = v22;
  uint64_t v29 = v20;
  id v27 = v21;
  id v24 = v22;
  id v25 = v21;
  [v23 updateTestNotes:v8 forVersion:v19 withCompletionHandler:v26];
}

void __68__TFBetaApplicationProxy_updateLocalizedTestNotes_forVersion_build___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = +[TFLogConfiguration defaultConfiguration];
    id v5 = [v4 generatedLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v6 = a1[6];
      uint64_t v8 = a1[4];
      id v9 = [v3 localizedDescription];
      int v10 = 138544130;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_223064000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to update test notes. error = %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)overwriteMetadataForInstalledVersion:(id)a3 build:(id)a4 withLocalizedDisplayNames:(id)a5 localizedTestNotes:(id)a6 primaryLocaleKey:(id)a7 developerName:(id)a8 expirationDate:(id)a9 iconUrlTemplate:(id)a10 testerEmail:(id)a11
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v54 = a5;
  id v19 = a6;
  id v59 = a7;
  id v58 = a8;
  id v20 = a9;
  id v57 = a10;
  id v56 = a11;
  __int16 v21 = +[TFLogConfiguration defaultConfiguration];
  id v22 = [v21 generatedLogger];
  v55 = v19;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = v18;
    id v24 = objc_opt_class();
    id v51 = v24;
    id v25 = [(TFBetaApplicationProxy *)self bundleIdentifier];
    id v26 = [(TFBetaApplicationProxy *)self logKey];
    *(_DWORD *)buf = 138546178;
    id v65 = v24;
    id v18 = v23;
    __int16 v66 = 2114;
    id v67 = v25;
    __int16 v68 = 2112;
    id v69 = v26;
    __int16 v70 = 2112;
    id v71 = v17;
    __int16 v72 = 2112;
    id v73 = v23;
    __int16 v74 = 2112;
    id v75 = v54;
    __int16 v76 = 2112;
    v77 = v55;
    __int16 v78 = 2112;
    id v79 = v59;
    __int16 v80 = 2112;
    id v81 = v58;
    __int16 v82 = 2112;
    id v83 = v20;
    __int16 v84 = 2112;
    id v85 = v57;
    __int16 v86 = 2112;
    id v87 = v56;
    _os_log_impl(&dword_223064000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] overwriteMetadataForInstalledVersion               shortVersionString = %@ |              bundleVersion = %@ |              localizedDisplayNames = %@ |              localizedTestNotes = %@ |              primaryLocaleKey = %@ |              developerName = %@ |              expirationDate = %@ |              iconUrlTemplate = %@ |              testerEmail = %@", buf, 0x7Au);

    id v19 = v55;
  }

  id v27 = (void *)MEMORY[0x263F25408];
  id v28 = [(TFBetaApplicationProxy *)self bundleIdentifier];
  uint64_t v29 = objc_msgSend(v27, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v28, v18, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v17);

  v30 = [MEMORY[0x263F25528] sharedInstance];
  __int16 v31 = [v30 getLaunchInfoForVersion:v29];

  if (v31)
  {
    __int16 v32 = v54;
    if (v54)
    {
      __int16 v33 = [v31 displayNames];
      [v33 setLocalizedNames:v54];
    }
    if (v19) {
      [v31 setLocalizedTestNotes:v19];
    }
    if (v59)
    {
      __int16 v34 = [v31 displayNames];
      [v34 setPrimaryLocale:v59];
    }
    id v52 = v17;
    if (v58) {
      objc_msgSend(v31, "setArtistName:");
    }
    __int16 v35 = v29;
    if (v20) {
      [v31 setExpirationDate:v20];
    }
    id v36 = v20;
    if (v57) {
      [v31 setIconURLTemplate:v57];
    }
    id v37 = v18;
    if (v56) {
      objc_msgSend(v31, "setTesterEmail:");
    }
    uint64_t v38 = objc_opt_class();
    id v39 = [(TFBetaApplicationProxy *)self bundleIdentifier];
    __int16 v40 = [(TFBetaApplicationProxy *)self logKey];
    id v41 = [MEMORY[0x263F25528] sharedInstance];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __188__TFBetaApplicationProxy_overwriteMetadataForInstalledVersion_build_withLocalizedDisplayNames_localizedTestNotes_primaryLocaleKey_developerName_expirationDate_iconUrlTemplate_testerEmail___block_invoke;
    v60[3] = &unk_26468E8E0;
    id v62 = v40;
    uint64_t v63 = v38;
    id v61 = v39;
    uint64_t v42 = v40;
    id v43 = v39;
    [v41 setLaunchInfo:v31 withCompletionHandler:v60];

    id v18 = v37;
    id v20 = v36;
    uint64_t v29 = v35;
    id v17 = v52;
  }
  else
  {
    id v43 = +[TFLogConfiguration defaultConfiguration];
    uint64_t v42 = [v43 generatedLogger];
    __int16 v32 = v54;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v53 = v17;
      id v44 = v29;
      id v45 = v20;
      id v46 = v18;
      id v47 = objc_opt_class();
      id v50 = v47;
      id v48 = [(TFBetaApplicationProxy *)self bundleIdentifier];
      uint64_t v49 = [(TFBetaApplicationProxy *)self logKey];
      *(_DWORD *)buf = 138543874;
      id v65 = v47;
      id v18 = v46;
      id v20 = v45;
      uint64_t v29 = v44;
      id v17 = v53;
      __int16 v66 = 2114;
      id v67 = v48;
      __int16 v68 = 2112;
      id v69 = v49;
      _os_log_impl(&dword_223064000, v42, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to find beta app launch info to overwrite", buf, 0x20u);
    }
  }
}

void __188__TFBetaApplicationProxy_overwriteMetadataForInstalledVersion_build_withLocalizedDisplayNames_localizedTestNotes_primaryLocaleKey_developerName_expirationDate_iconUrlTemplate_testerEmail___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = +[TFLogConfiguration defaultConfiguration];
    id v5 = [v4 generatedLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v6 = a1[6];
      uint64_t v8 = a1[4];
      id v9 = [v3 localizedDescription];
      int v10 = 138544130;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_223064000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to update launch info. error = %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (int64_t)_asdAppPlatform
{
  int64_t result = self->_bundleAppPlatform;
  if ((unint64_t)result > 1) {
    return [MEMORY[0x263F25408] defaultPlatform];
  }
  return result;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)bundleAppPlatform
{
  return self->_bundleAppPlatform;
}

- (void)setBundleAppPlatform:(int64_t)a3
{
  self->_bundleAppPlatform = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end