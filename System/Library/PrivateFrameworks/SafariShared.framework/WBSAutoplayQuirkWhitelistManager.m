@interface WBSAutoplayQuirkWhitelistManager
- (WBSAutoplayQuirkWhitelistManager)init;
- (WBSAutoplayQuirkWhitelistManager)initWithBuiltInWhitelistURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8;
- (void)prepareForTermination;
- (void)quirksForDomain:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSAutoplayQuirkWhitelistManager

- (WBSAutoplayQuirkWhitelistManager)init
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 doubleForKey:@"DebugAutoplayWhitelistConfigurationUpdateInterval"];
  double v5 = v4;

  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 URLForResource:@"SitesAllowedToUseAutoplayQuirks" withExtension:@"plist"];
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = objc_msgSend(v8, "safari_settingsDirectoryURL");
  double v10 = 86400.0;
  if (v5 != 0.0) {
    double v10 = v5;
  }
  v11 = [(WBSAutoplayQuirkWhitelistManager *)self initWithBuiltInWhitelistURL:v7 downloadsDirectoryURL:v9 resourceName:@"SitesAllowedToUseAutoplayQuirks" resourceVersion:@"1" updateDateDefaultsKey:@"AutoplayQuirksWhitelistConfigurationUpdateDate" updateInterval:v10];

  return v11;
}

- (WBSAutoplayQuirkWhitelistManager)initWithBuiltInWhitelistURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WBSAutoplayQuirkWhitelistManager;
  v19 = [(WBSAutoplayQuirkWhitelistManager *)&v26 init];
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

- (void)quirksForDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__WBSAutoplayQuirkWhitelistManager_quirksForDomain_completionHandler___block_invoke;
  v11[3] = &unk_1E5C8C7E8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:v11];
}

uint64_t __70__WBSAutoplayQuirkWhitelistManager_quirksForDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [a2 quirkTypeForDomain:*(void *)(a1 + 32)];
  double v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)prepareForTermination
{
}

- (void).cxx_destruct
{
}

@end