@interface PXSystemNavigationSettings
+ (PXSystemNavigationSettings)sharedInstance;
+ (id)settingsControllerModule;
- (id)parentSettings;
@end

@implementation PXSystemNavigationSettings

+ (id)settingsControllerModule
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke;
  v9[3] = &unk_1E5DCF720;
  id v10 = v2;
  id v3 = v2;
  PXSystemNavigationEnumerateDestinations(v9);
  v4 = [MEMORY[0x1E4F94160] sectionWithRows:v3 title:@"Destinations"];
  v5 = (void *)MEMORY[0x1E4F94160];
  v11[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v7 = [v5 moduleWithTitle:@"System Navigation" contents:v6];

  return v7;
}

void __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke(uint64_t a1, unint64_t a2)
{
  v4 = PXSystemNavigationDestinationDescription(a2);
  v5 = (void *)MEMORY[0x1E4F94190];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke_2;
  v13 = &unk_1E5DD08B0;
  id v14 = v4;
  unint64_t v15 = a2;
  id v6 = v4;
  v7 = [v5 actionWithHandler:&v10];
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(MEMORY[0x1E4F940F8], "rowWithTitle:action:", v6, v7, v10, v11, v12, v13);
  [v8 addObject:v9];
}

uint64_t __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Will navigate to destination: %{public}@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke_4;
  v6[3] = &unk_1E5DD3158;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  +[PXSystemNavigation navigateToDestination:v4 completion:v6];

  return 1;
}

void __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke_4(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLUIGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v8;
      uint64_t v9 = "Did navigate to destination: %{public}@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    id v17 = v5;
    uint64_t v9 = "Failed to navigate to destination: %{public}@, error: %{public}@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

+ (PXSystemNavigationSettings)sharedInstance
{
  if (sharedInstance_onceToken_155880 != -1) {
    dispatch_once(&sharedInstance_onceToken_155880, &__block_literal_global_155881);
  }
  id v2 = (void *)sharedInstance_sharedInstance_155882;
  return (PXSystemNavigationSettings *)v2;
}

void __44__PXSystemNavigationSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 systemNavigationSettings];
  v1 = (void *)sharedInstance_sharedInstance_155882;
  sharedInstance_sharedInstance_155882 = v0;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end