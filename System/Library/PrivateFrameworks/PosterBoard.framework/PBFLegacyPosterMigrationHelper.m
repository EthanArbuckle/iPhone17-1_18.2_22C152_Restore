@interface PBFLegacyPosterMigrationHelper
- (BOOL)_shouldAllowMigration;
- (BOOL)canMigrateLegacyLockPoster;
- (BOOL)canMigrateLegacyPoster;
- (BOOL)isDistinctHomeScreenMigrationEnabled;
- (BOOL)isMigrationEnabled;
- (OS_dispatch_queue)homeMigrationQueue;
- (PBFLegacyPosterMigrationHelper)initWithDataStore:(id)a3 legacyPosterPair:(id)a4;
- (PBFPosterExtensionDataStore)dataStore;
- (PBUIPosterWallpaperMigrationInfo)migrationInfo;
- (id)legacyPosterPair;
- (id)lockScreenMigrationViewController;
- (void)finalizeMigrationWithMigratedConfigurationUUID:(id)a3;
- (void)lockScreenMigrationViewController;
- (void)migrateHomePosterAndAssociateToConfiguration:(id)a3 completion:(id)a4;
- (void)revertMigrationWithMigratedConfigurationUUID:(id)a3;
- (void)setHomeMigrationQueue:(id)a3;
@end

@implementation PBFLegacyPosterMigrationHelper

- (PBFLegacyPosterMigrationHelper)initWithDataStore:(id)a3 legacyPosterPair:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PBFLegacyPosterMigrationHelper;
  v9 = [(PBFLegacyPosterMigrationHelper *)&v35 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_legacyPosterPair, a4);
    objc_storeStrong((id *)&v10->_dataStore, a3);
    v10->_migrationEnabled = _os_feature_enabled_impl();
    v10->_BOOL distinctHomeScreenMigrationEnabled = _os_feature_enabled_impl();
    v11 = PBFLogLegacyPosterMigration();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PBFLegacyPosterMigrationHelper initWithDataStore:legacyPosterPair:]((unsigned __int8 *)&v10->_migrationEnabled, (unsigned __int8 *)&v10->_distinctHomeScreenMigrationEnabled, v11);
    }

    if ([(PBFLegacyPosterMigrationHelper *)v10 _shouldAllowMigration])
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F83BE0]);
      v13 = [v12 posterMigrationInfo];

      objc_storeStrong((id *)&v10->_migrationInfo, v13);
      int v14 = [v13 pairingType];
      int v15 = [v13 homeProvider] == 2 && objc_msgSend(v13, "pairingType") != 1;
      if ([v13 homeProvider] == 1 && objc_msgSend(v13, "pairingType") == 2)
      {
        BOOL distinctHomeScreenMigrationEnabled = v10->_distinctHomeScreenMigrationEnabled;
        int v18 = 1;
      }
      else
      {
        int v18 = 0;
        BOOL distinctHomeScreenMigrationEnabled = 1;
      }
      v19 = [(PBFLegacyPosterMigrationHelper *)v10 migrationInfo];
      int v20 = [v19 lockProvider];

      if (!v20)
      {
        v21 = PBFLogLegacyPosterMigration();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[PBFLegacyPosterMigrationHelper initWithDataStore:legacyPosterPair:](v21);
        }
      }
      v22 = PBFLogLegacyPosterMigration();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109888;
        BOOL v37 = v14 != 0;
        __int16 v38 = 1024;
        BOOL v39 = v15;
        __int16 v40 = 1024;
        int v41 = v18;
        __int16 v42 = 1024;
        BOOL v43 = distinctHomeScreenMigrationEnabled;
        _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_INFO, "Supported migration: %d, Collections Home Mismatched: %d, Distinct Photo Home: %d, canMigrateHome:%d", buf, 0x1Au);
      }

      BOOL v23 = v20 != 0;
      int v24 = (v14 != 0) & ~v15;
      if (!v20) {
        int v24 = 0;
      }
      int v25 = distinctHomeScreenMigrationEnabled & v24;
      v10->_BOOL canMigrateLegacyPoster = distinctHomeScreenMigrationEnabled & v24;
      v10->_BOOL canMigrateLegacyLockPoster = v23;
      v26 = PBFLogLegacyPosterMigration();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v25 == 1)
      {
        if (v27)
        {
          BOOL canMigrateLegacyPoster = v10->_canMigrateLegacyPoster;
          *(_DWORD *)buf = 67109120;
          BOOL v37 = canMigrateLegacyPoster;
          v29 = "Can Migrate:%d";
          v30 = v26;
          uint32_t v31 = 8;
LABEL_28:
          _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_INFO, v29, buf, v31);
        }
      }
      else if (v27)
      {
        BOOL v32 = v10->_canMigrateLegacyPoster;
        BOOL canMigrateLegacyLockPoster = v10->_canMigrateLegacyLockPoster;
        *(_DWORD *)buf = 67109376;
        BOOL v37 = v32;
        __int16 v38 = 1024;
        BOOL v39 = canMigrateLegacyLockPoster;
        v29 = "Can Migrate:%d, Lock:%d";
        v30 = v26;
        uint32_t v31 = 14;
        goto LABEL_28;
      }

      goto LABEL_30;
    }
    v16 = PBFLogLegacyPosterMigration();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_INFO, "Migration not enabled", buf, 2u);
    }

    v10->_BOOL canMigrateLegacyPoster = 0;
  }
LABEL_30:

  return v10;
}

- (BOOL)_shouldAllowMigration
{
  return self->_migrationEnabled || self->_distinctHomeScreenMigrationEnabled;
}

- (id)lockScreenMigrationViewController
{
  if ([(PBFLegacyPosterMigrationHelper *)self canMigrateLegacyPoster]
    || [(PBFLegacyPosterMigrationHelper *)self canMigrateLegacyLockPoster])
  {
    v3 = [(PBFLegacyPosterMigrationHelper *)self migrationInfo];
    [v3 lockProvider];

    v4 = PBUIExtensionIdentifierForPosterWallpaperMigrationProvider();
    id v5 = (id)*MEMORY[0x1E4F923B8];
    v6 = [MEMORY[0x1E4F924B8] temporaryPathForRole:v5];
    id v7 = (void *)MEMORY[0x1E4F924C8];
    id v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v7 incomingConfigurationIdentityWithProvider:v4 role:v5 posterUUID:v8 version:1 supplement:0];

    v10 = (void *)MEMORY[0x1E4F924D0];
    v11 = [v6 contentsURL];
    id v12 = [v10 pathWithContainerURL:v11 identity:v9];

    v13 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
    int v14 = [v13 dataStore];

    int v15 = [v14 providerForPath:v12];
    if (!v15)
    {
      v17 = PBFLogLegacyPosterMigration();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[PBFLegacyPosterMigrationHelper lockScreenMigrationViewController]();
      }
      v19 = 0;
      goto LABEL_18;
    }
    id v26 = 0;
    [v12 ensureContentsURLIsReachableAndReturnError:&v26];
    v16 = v26;
    if (v16)
    {
      v17 = v16;
      int v18 = PBFLogLegacyPosterMigration();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PBFLegacyPosterMigrationHelper lockScreenMigrationViewController](v17);
      }
    }
    else
    {
      id v25 = 0;
      [v12 storeUserInfo:&unk_1F2AAEC90 error:&v25];
      int v20 = v25;
      if (!v20)
      {
        v22 = (void *)MEMORY[0x1E4F924A8];
        BOOL v23 = [v15 identity];
        int v24 = [MEMORY[0x1E4F29128] UUID];
        v17 = [v22 extensionInstanceForIdentity:v23 instanceIdentifier:v24];

        v19 = [[PBFLegacyMigrationEditingSceneViewController alloc] initWithProvider:v17 contents:v12 exnihiloPathAssertion:v6 replacing:0];
        int v18 = PBFLogLegacyPosterMigration();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_INFO, "(lockScreenMigrationViewController) will provide editing view controller for lock screen legacy migration", buf, 2u);
        }
        goto LABEL_17;
      }
      v17 = v20;
      int v18 = PBFLogLegacyPosterMigration();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PBFLegacyPosterMigrationHelper lockScreenMigrationViewController](v17);
      }
    }
    v19 = 0;
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  v4 = PBFLogLegacyPosterMigration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(lockScreenMigrationViewController) Unable to migrate legacy poster, returning nil", buf, 2u);
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (void)migrateHomePosterAndAssociateToConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PBFLegacyPosterMigrationHelper *)self _shouldAllowMigration]
    || ![(PBFLegacyPosterMigrationHelper *)self isDistinctHomeScreenMigrationEnabled])
  {
    v22 = PBFLogLegacyPosterMigration();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    BOOL v23 = "(migrateHomeScreenWallpaperIfNeeded...) Home screen migration not enabled.";
    goto LABEL_10;
  }
  id v8 = [(PBFLegacyPosterMigrationHelper *)self migrationInfo];
  int v9 = [v8 pairingType];

  if (v9 != 2)
  {
    v22 = PBFLogLegacyPosterMigration();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    BOOL v23 = "(migrateHomeScreenWallpaperIfNeeded...) Home screen migration not needed.";
LABEL_10:
    int v24 = v22;
    os_log_type_t v25 = OS_LOG_TYPE_INFO;
LABEL_11:
    _os_log_impl(&dword_1D31CE000, v24, v25, v23, buf, 2u);
    goto LABEL_12;
  }
  v10 = [(PBFLegacyPosterMigrationHelper *)self migrationInfo];
  int v11 = [v10 homeProvider];

  if (!v11)
  {
    v22 = PBFLogLegacyPosterMigration();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    BOOL v23 = "Unable to migrate legacy home wallpaper because we could not resolve a home provider";
    int v24 = v22;
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_11;
  }
  id v12 = PBUIExtensionIdentifierForPosterWallpaperMigrationProvider();
  id v13 = objc_alloc_init(MEMORY[0x1E4F92360]);
  [v13 setUserInfo:&unk_1F2AAECB8];
  int v14 = [MEMORY[0x1E4F92328] posterUpdateHomeScreenPosterProvider:v12 sessionInfo:v13];
  int v15 = [MEMORY[0x1E4F92328] posterUpdateHomeScreenAppearance:4];
  homeMigrationQueue = self->_homeMigrationQueue;
  if (!homeMigrationQueue)
  {
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PosterBoard.LegacyPosterHomeMigration", v17);
    v19 = self->_homeMigrationQueue;
    self->_homeMigrationQueue = v18;

    homeMigrationQueue = self->_homeMigrationQueue;
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke;
  v26[3] = &unk_1E6981248;
  id v27 = v6;
  id v28 = v14;
  id v29 = v15;
  id v30 = v7;
  id v20 = v15;
  id v21 = v14;
  dispatch_async(homeMigrationQueue, v26);

LABEL_13:
}

void __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
  v3 = [v2 dataStore];

  v4 = PBFLogLegacyPosterMigration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_INFO, "(migrateHomeScreenWallpaperIfNeeded...) Home screen migration required, updating configuration for UUID: %{public}@", buf, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  v11[0] = *(void *)(a1 + 40);
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_26;
  v9[3] = &unk_1E6980CE8;
  id v10 = *(id *)(a1 + 56);
  [v3 updatePosterConfigurationMatchingUUID:v6 updates:v8 completion:v9];
}

void __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_26(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = PBFLogLegacyPosterMigration();
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_26_cold_1(v7);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_INFO, "Home screen migrated successfully", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_27;
  block[3] = &unk_1E6981090;
  id v10 = *(id *)(a1 + 32);
  id v15 = v7;
  id v16 = v10;
  id v14 = v6;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_27(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(a1[6] + 16))(a1[6], a1[4] == 0, a1[5]);
}

- (void)revertMigrationWithMigratedConfigurationUUID:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
  id v6 = [v5 dataStore];

  id v7 = [v6 switcherConfiguration];
  id v8 = [(PBFLegacyPosterMigrationHelper *)self legacyPosterPair];
  int v9 = [v8 configurationUUID];

  id v10 = [v7 configurations];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__PBFLegacyPosterMigrationHelper_revertMigrationWithMigratedConfigurationUUID___block_invoke;
  v28[3] = &unk_1E6981108;
  id v11 = v4;
  id v29 = v11;
  id v12 = objc_msgSend(v10, "bs_firstObjectPassingTest:", v28);

  uint64_t v13 = [v7 configurations];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __79__PBFLegacyPosterMigrationHelper_revertMigrationWithMigratedConfigurationUUID___block_invoke_2;
  v26[3] = &unk_1E6981108;
  id v14 = v9;
  id v27 = v14;
  id v15 = objc_msgSend(v13, "bs_firstObjectPassingTest:", v26);

  if (!v12 || !v15)
  {
    if (!v12 || v15)
    {
      v17 = PBFLogLegacyPosterMigration();
      BOOL v22 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v12 || !v15)
      {
        if (!v22) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 138543618;
        id v31 = v14;
        __int16 v32 = 2114;
        id v33 = v11;
        id v21 = "revertMigration: Could not locate configs to remove or set for legacy UUID: %{public}@, UUID: %{public}@";
        BOOL v23 = v17;
        uint32_t v24 = 22;
LABEL_19:
        _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_DEFAULT, v21, buf, v24);
        goto LABEL_20;
      }
      if (!v22) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138543362;
      id v31 = v11;
      id v21 = "revertMigration: Could not locate config to remove for UUID: %{public}@";
    }
    else
    {
      v17 = PBFLogLegacyPosterMigration();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138543362;
      id v31 = v14;
      id v21 = "revertMigration: Could not locate config to set for legacy UUID: %{public}@";
    }
    BOOL v23 = v17;
    uint32_t v24 = 12;
    goto LABEL_19;
  }
  id v16 = [v6 switcherConfiguration];
  v17 = [v16 mutableCopy];

  [v17 removeConfiguration:v12];
  [v17 setSelectedConfiguration:v15];
  [v17 setDesiredActiveConfiguration:v15];
  id v25 = 0;
  id v18 = (id)[v6 updateDataStoreForSwitcherConfiguration:v17 options:0 reason:@"Reverting legacy migration" error:&v25];
  id v19 = v25;
  if (v19)
  {
    id v20 = PBFLogLegacyPosterMigration();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PBFLegacyPosterMigrationHelper revertMigrationWithMigratedConfigurationUUID:](v19);
    }
  }
LABEL_20:
}

uint64_t __79__PBFLegacyPosterMigrationHelper_revertMigrationWithMigratedConfigurationUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 _path];
  id v4 = [v3 serverIdentity];
  uint64_t v5 = [v4 posterUUID];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

uint64_t __79__PBFLegacyPosterMigrationHelper_revertMigrationWithMigratedConfigurationUUID___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 _path];
  id v4 = [v3 serverIdentity];
  uint64_t v5 = [v4 posterUUID];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

- (void)finalizeMigrationWithMigratedConfigurationUUID:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
  uint64_t v6 = [v5 dataStore];

  id v7 = [v6 switcherConfiguration];
  id v8 = [(PBFLegacyPosterMigrationHelper *)self legacyPosterPair];
  int v9 = [v8 configurationUUID];

  id v10 = [v7 configurations];
  id v11 = (void *)[v10 mutableCopy];

  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v38 = 0;
  BOOL v39 = &v38;
  uint64_t v40 = 0x3032000000;
  int v41 = __Block_byref_object_copy__8;
  __int16 v42 = __Block_byref_object_dispose__8;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  objc_super v35 = __Block_byref_object_copy__8;
  v36 = __Block_byref_object_dispose__8;
  id v37 = 0;
  uint64_t v12 = objc_opt_class();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__PBFLegacyPosterMigrationHelper_finalizeMigrationWithMigratedConfigurationUUID___block_invoke;
  v25[3] = &unk_1E69837B8;
  id v13 = v4;
  id v26 = v13;
  id v28 = &v38;
  id v29 = &v48;
  id v14 = v9;
  id v27 = v14;
  id v30 = &v32;
  id v31 = &v44;
  objc_msgSend(v11, "bs_enumerateObjectsOfClass:usingBlock:", v12, v25);
  if (v49[3] == 0x7FFFFFFFFFFFFFFFLL || v45[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = PBFLogLegacyPosterMigration();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PBFLegacyPosterMigrationHelper finalizeMigrationWithMigratedConfigurationUUID:](v15);
    }
  }
  else
  {
    id v15 = [v7 mutableCopy];
    [v11 replaceObjectAtIndex:v45[3] withObject:v39[5]];
    [v11 replaceObjectAtIndex:v49[3] withObject:v33[5]];
    [v15 setConfigurations:v11];
    id v16 = [v15 selectedConfiguration];
    int v17 = [v16 isEqual:v33[5]];

    if (v17) {
      [v15 setSelectedConfiguration:v39[5]];
    }
    id v18 = [v15 activeConfiguration];
    int v19 = [v18 isEqual:v33[5]];

    if (v19) {
      [v15 setDesiredActiveConfiguration:v39[5]];
    }
    [v15 removeConfiguration:v33[5]];
    id v24 = 0;
    id v20 = (id)[v6 updateDataStoreForSwitcherConfiguration:v15 options:0 reason:@"Finalizing legacy migration" error:&v24];
    id v21 = v24;
    if (v21)
    {
      BOOL v22 = PBFLogLegacyPosterMigration();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        BOOL v23 = [v21 localizedDescription];
        [(PBFLegacyPosterMigrationHelper *)v23 finalizeMigrationWithMigratedConfigurationUUID:v22];
      }
    }
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
}

void __81__PBFLegacyPosterMigrationHelper_finalizeMigrationWithMigratedConfigurationUUID___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  id v8 = [v16 _path];
  int v9 = [v8 serverIdentity];
  id v10 = [v9 posterUUID];
  int v11 = [v10 isEqual:a1[4]];

  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
  }
  uint64_t v12 = [v16 _path];
  id v13 = [v12 serverIdentity];
  id v14 = [v13 posterUUID];
  int v15 = [v14 isEqual:a1[5]];

  if (v15)
  {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
    *(void *)(*(void *)(a1[9] + 8) + 24) = a3;
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL
    && *(void *)(*(void *)(a1[9] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = 1;
  }
}

- (BOOL)canMigrateLegacyPoster
{
  return self->_canMigrateLegacyPoster;
}

- (BOOL)canMigrateLegacyLockPoster
{
  return self->_canMigrateLegacyLockPoster;
}

- (id)legacyPosterPair
{
  return self->_legacyPosterPair;
}

- (PBUIPosterWallpaperMigrationInfo)migrationInfo
{
  return self->_migrationInfo;
}

- (PBFPosterExtensionDataStore)dataStore
{
  return self->_dataStore;
}

- (BOOL)isMigrationEnabled
{
  return self->_migrationEnabled;
}

- (BOOL)isDistinctHomeScreenMigrationEnabled
{
  return self->_distinctHomeScreenMigrationEnabled;
}

- (OS_dispatch_queue)homeMigrationQueue
{
  return self->_homeMigrationQueue;
}

- (void)setHomeMigrationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMigrationQueue, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_migrationInfo, 0);
  objc_storeStrong(&self->_legacyPosterPair, 0);
}

- (void)initWithDataStore:(os_log_t)log legacyPosterPair:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "Unable to migrate legacy lock wallpaper because we could not resolve a lock provider", v1, 2u);
}

- (void)initWithDataStore:(os_log_t)log legacyPosterPair:.cold.2(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl(&dword_1D31CE000, log, OS_LOG_TYPE_DEBUG, "MigrationFF: %d, HomeMigrationFF: %d", (uint8_t *)v5, 0xEu);
}

- (void)lockScreenMigrationViewController
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_3(&dword_1D31CE000, v2, v3, "(lockScreenMigrationViewController) Unable to create contents at migration path: %{public}@", v4, v5, v6, v7, v8);
}

void __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_26_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_3(&dword_1D31CE000, v2, v3, "Home screen migration failed: %{public}@", v4, v5, v6, v7, v8);
}

- (void)revertMigrationWithMigratedConfigurationUUID:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_3(&dword_1D31CE000, v2, v3, "revertMigration: Failed to revert legacy migration: %{public}@", v4, v5, v6, v7, v8);
}

- (void)finalizeMigrationWithMigratedConfigurationUUID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "finalizeMigration: Could not find indices for new and legacy poster", v1, 2u);
}

- (void)finalizeMigrationWithMigratedConfigurationUUID:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "finalizeMigration: Failed to finalize legacy migration: %{public}@", buf, 0xCu);
}

@end