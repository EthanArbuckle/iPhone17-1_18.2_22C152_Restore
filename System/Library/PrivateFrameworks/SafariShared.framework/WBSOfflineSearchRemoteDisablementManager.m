@interface WBSOfflineSearchRemoteDisablementManager
+ (WBSOfflineSearchRemoteDisablementManager)sharedManager;
- (WBSOfflineSearchRemoteDisablementManager)init;
- (void)areOfflineSearchSuggestionsDisabled:(id)a3;
@end

@implementation WBSOfflineSearchRemoteDisablementManager

- (void)areOfflineSearchSuggestionsDisabled:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [MEMORY[0x1E4F97FE0] sharedObserver];
  char v6 = [v5 isGoogleEnabledSearchEngine];

  if ((v6 & 1) == 0) {
    v4[2](v4, 0);
  }
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__WBSOfflineSearchRemoteDisablementManager_areOfflineSearchSuggestionsDisabled___block_invoke;
  v9[3] = &unk_1E5C9DE98;
  id v10 = v4;
  v8 = v4;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:v9];
}

+ (WBSOfflineSearchRemoteDisablementManager)sharedManager
{
  if (sharedManager_onceToken_3 != -1) {
    dispatch_once(&sharedManager_onceToken_3, &__block_literal_global_80);
  }
  v2 = (void *)sharedManager_sharedManager_1;
  return (WBSOfflineSearchRemoteDisablementManager *)v2;
}

void __57__WBSOfflineSearchRemoteDisablementManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSOfflineSearchRemoteDisablementManager);
  v1 = (void *)sharedManager_sharedManager_1;
  sharedManager_sharedManager_1 = (uint64_t)v0;
}

- (WBSOfflineSearchRemoteDisablementManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBSOfflineSearchRemoteDisablementManager;
  v2 = [(WBSOfflineSearchRemoteDisablementManager *)&v13 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariSharedBundle");
    v4 = [v3 URLForResource:@"WBSOfflineSearchRemoteDisablementDefaultConfig" withExtension:@"plist"];

    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = objc_msgSend(v5, "safari_settingsDirectoryURL");

    id v7 = objc_alloc(MEMORY[0x1E4F97F90]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v7 initWithDataFormat:0 builtInListURL:v4 downloadsDirectoryURL:v6 resourceName:@"OfflineSearchRemoteDisablement" resourceVersion:@"1" updateDateDefaultsKey:@"WBSOfflineSearchDisablementKey" updateInterval:86400.0 snapshotClass:v8 snapshotTransformerClass:objc_opt_class()];
    remotelyUpdatableDataController = v2->_remotelyUpdatableDataController;
    v2->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v9;

    [(WBSRemotelyUpdatableDataController *)v2->_remotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:1];
    v11 = v2;
  }
  return v2;
}

void __80__WBSOfflineSearchRemoteDisablementManager_areOfflineSearchSuggestionsDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E4F97FE0];
  id v4 = a2;
  id v7 = [v3 sharedObserver];
  v5 = [v7 defaultSearchEngineShortName];
  uint64_t v6 = [v4 areOfflineSearchSuggestionsDisabledRemotelyForSearchProvider:v5];

  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v6);
}

- (void).cxx_destruct
{
}

@end