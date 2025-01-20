@interface SafariCloudBookmarksMigrationCoordinator
+ (id)migrationCoordinator;
- (BOOL)_evaluateMigrationEnabled;
- (SafariCloudBookmarksMigrationCoordinator)initWithSyncAgent:(id)a3;
- (void)_detectedLocalMigrationStateTransition:(id)a3;
- (void)dealloc;
- (void)getLocalMigrationStateForMigrationCoordinator:(id)a3 completionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SafariCloudBookmarksMigrationCoordinator

void __64__SafariCloudBookmarksMigrationCoordinator_migrationCoordinator__block_invoke()
{
  v0 = [MEMORY[0x1E4F97FB8] sharedProxy];
  v1 = [[SafariCloudBookmarksMigrationCoordinator alloc] initWithSyncAgent:v0];
  v2 = (void *)migrationCoordinator_coordinator;
  migrationCoordinator_coordinator = (uint64_t)v1;

  v3 = SafariCloudBookmarksMigrationCoordinatorLogsDirectoryURL();
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__SafariCloudBookmarksMigrationCoordinator_migrationCoordinator__block_invoke_cold_1(v7, v6);
    }
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F97EA8]) initWithDirectoryURL:v3 logName:@"migrationEligibility" maximumLogAge:60];
  [(id)migrationCoordinator_coordinator setKeyActionsLogger:v8];
}

+ (id)migrationCoordinator
{
  if (migrationCoordinator_onceToken != -1) {
    dispatch_once(&migrationCoordinator_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)migrationCoordinator_coordinator;
  return v2;
}

void __108__SafariCloudBookmarksMigrationCoordinator_getLocalMigrationStateForMigrationCoordinator_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  id v3 = v2;
  if (v2) {
    [v2 _cloudKitLocalMigrationState];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SafariCloudBookmarksMigrationCoordinator)initWithSyncAgent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SafariCloudBookmarksMigrationCoordinator;
  id v3 = [(WBSCloudBookmarksMigrationCoordinator *)&v11 initWithSyncAgent:a3 localDataProvider:self];
  v4 = v3;
  if (v3)
  {
    [(WBSCloudBookmarksMigrationCoordinator *)v3 setMigrationEnabled:[(SafariCloudBookmarksMigrationCoordinator *)v3 _evaluateMigrationEnabled]];
    char v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 addObserver:v4 forKeyPath:*MEMORY[0x1E4F99108] options:0 context:kvoContext_1];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4FB6140];
    v8 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    [v6 addObserver:v4 selector:sel__detectedLocalMigrationStateTransition_ name:v7 object:v8];

    id v9 = v4;
  }

  return v4;
}

- (BOOL)_evaluateMigrationEnabled
{
  if ([MEMORY[0x1E4F97EA0] hasInternalContent])
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F99108]];

    if (v3 == -1) {
      return 0;
    }
  }
  v4 = +[FeatureManager sharedFeatureManager];
  char v5 = [v4 isCloudKitBookmarksAvailable];

  return v5;
}

- (void)getLocalMigrationStateForMigrationCoordinator:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__SafariCloudBookmarksMigrationCoordinator_getLocalMigrationStateForMigrationCoordinator_completionHandler___block_invoke;
  block[3] = &unk_1E6D77E70;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB6140] object:0];
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 removeObserver:self forKeyPath:*MEMORY[0x1E4F99108] context:kvoContext_1];

  v5.receiver = self;
  v5.super_class = (Class)SafariCloudBookmarksMigrationCoordinator;
  [(SafariCloudBookmarksMigrationCoordinator *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kvoContext_1 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E4F99108], a4, a5))
    {
      BOOL v7 = [(SafariCloudBookmarksMigrationCoordinator *)self _evaluateMigrationEnabled];
      [(WBSCloudBookmarksMigrationCoordinator *)self setMigrationEnabled:v7];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SafariCloudBookmarksMigrationCoordinator;
    -[SafariCloudBookmarksMigrationCoordinator observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_detectedLocalMigrationStateTransition:(id)a3
{
  id v12 = [a3 userInfo];
  id v4 = objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E4FB6168]);
  uint64_t v5 = objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E4FB6188]);
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = [v4 integerValue];
    uint64_t v9 = [v6 integerValue];
    if ((unint64_t)(v8 - 4) >= 0xFFFFFFFFFFFFFFFDLL && v9 == 0)
    {
      [(WBSCloudBookmarksMigrationCoordinator *)self startCoordinatingMigration];
      objc_super v11 = [MEMORY[0x1E4FB60E8] safariBookmarkCollection];
      [v11 _postBookmarksChangedSyncNotification];
    }
  }
}

void __64__SafariCloudBookmarksMigrationCoordinator_migrationCoordinator__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "Could not create migration coordinator logs directory: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end