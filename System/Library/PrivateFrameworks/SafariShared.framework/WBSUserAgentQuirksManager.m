@interface WBSUserAgentQuirksManager
- (WBSUserAgentQuirksManager)init;
- (WBSUserAgentQuirksManager)initWithBuiltInQuirkListURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8;
- (void)getQuirksForURLString:(id)a3 withDefaultUserAgent:(id)a4 completionHandler:(id)a5;
- (void)prepareForTermination;
@end

@implementation WBSUserAgentQuirksManager

- (WBSUserAgentQuirksManager)init
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 doubleForKey:@"DebugUserAgentQuirksConfigurationUpdateInterval"];
  double v5 = v4;

  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 URLForResource:@"UserAgentQuirks" withExtension:@"plist"];
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = objc_msgSend(v8, "safari_settingsDirectoryURL");
  double v10 = 86400.0;
  if (v5 != 0.0) {
    double v10 = v5;
  }
  v11 = [(WBSUserAgentQuirksManager *)self initWithBuiltInQuirkListURL:v7 downloadsDirectoryURL:v9 resourceName:@"UserAgentQuirks" resourceVersion:@"1" updateDateDefaultsKey:@"UserAgentQuirksConfigurationUpdateDate" updateInterval:v10];

  return v11;
}

- (WBSUserAgentQuirksManager)initWithBuiltInQuirkListURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WBSUserAgentQuirksManager;
  v19 = [(WBSUserAgentQuirksManager *)&v26 init];
  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F97F90]);
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [v20 initWithDataFormat:0 builtInListURL:v14 downloadsDirectoryURL:v15 resourceName:v16 resourceVersion:v17 updateDateDefaultsKey:v18 updateInterval:a8 snapshotClass:v21 snapshotTransformerClass:objc_opt_class()];
    remotelyUpdatableDataController = v19->_remotelyUpdatableDataController;
    v19->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v22;

    if (a8 != 0.0) {
      [(WBSRemotelyUpdatableDataController *)v19->_remotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:1];
    }
    v24 = v19;
  }

  return v19;
}

- (void)getQuirksForURLString:(id)a3 withDefaultUserAgent:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__WBSUserAgentQuirksManager_getQuirksForURLString_withDefaultUserAgent_completionHandler___block_invoke;
  v15[3] = &unk_1E5CA08A8;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:v15];
}

void __90__WBSUserAgentQuirksManager_getQuirksForURLString_withDefaultUserAgent_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[6];
  id v3 = [a2 quirkTypeForURLString:a1[4] withDefaultUserAgent:a1[5]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)prepareForTermination
{
}

- (void).cxx_destruct
{
}

@end