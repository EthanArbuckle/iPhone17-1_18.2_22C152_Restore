@interface SBMedusaAppsTestRecipe
- (FBApplicationUpdateScenesTransaction)currentTransaction;
- (SBMedusaAppsTestRecipe)init;
- (id)title;
- (void)_toggle;
- (void)_updateAppsToBringUpFromPreferences;
- (void)setCurrentTransaction:(id)a3;
@end

@implementation SBMedusaAppsTestRecipe

- (SBMedusaAppsTestRecipe)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBMedusaAppsTestRecipe;
  v2 = [(SBMedusaAppsTestRecipe *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [@"com.apple.mobilesafari" copy];
    leftTestBundleID = v2->_leftTestBundleID;
    v2->_leftTestBundleID = (NSString *)v3;

    uint64_t v5 = [@"com.apple.MobileSMS" copy];
    rightTestBundleID = v2->_rightTestBundleID;
    v2->_rightTestBundleID = (NSString *)v5;

    v2->_activated = 0;
  }
  return v2;
}

- (id)title
{
  return @"Medusa 2 Apps";
}

- (void)_toggle
{
  self->_activated ^= 1u;
  [(SBMedusaAppsTestRecipe *)self _updateAppsToBringUpFromPreferences];
  uint64_t v3 = +[SBApplicationController sharedInstance];
  v24 = +[SBWorkspace mainWorkspace];
  v4 = [SBDeviceApplicationSceneEntity alloc];
  uint64_t v5 = [v3 applicationWithBundleIdentifier:self->_rightTestBundleID];
  uint64_t v6 = [(SBDeviceApplicationSceneEntity *)v4 initWithApplicationForMainDisplay:v5];

  v7 = [SBDeviceApplicationSceneEntity alloc];
  objc_super v8 = [v3 applicationWithBundleIdentifier:self->_leftTestBundleID];
  uint64_t v9 = [(SBDeviceApplicationSceneEntity *)v7 initWithApplicationForMainDisplay:v8];

  v10 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
  v11 = [v10 layoutStatePrimaryElement];
  v12 = [v10 layoutStateSideElement];
  v13 = [v11 workspaceEntity];
  v14 = [v12 workspaceEntity];
  v23 = v3;
  if (self->_activated)
  {
    if (v13) {
      v15 = v13;
    }
    else {
      v15 = (void *)v9;
    }
    id v16 = v15;
    if (v14) {
      v17 = v14;
    }
    else {
      v17 = (void *)v6;
    }
    id v18 = v17;
    v19 = (void *)v9;
    v20 = (void *)v6;
  }
  else
  {
    v19 = (void *)v9;
    id v16 = v13;
    v20 = (void *)v6;
    if (objc_msgSend(v14, "isAnalogousToEntity:", v6, v23))
    {
      id v18 = +[SBWorkspaceEntity entity];
    }
    else
    {
      id v18 = v14;
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __33__SBMedusaAppsTestRecipe__toggle__block_invoke;
  v25[3] = &unk_1E6AFFFD8;
  id v26 = v16;
  id v27 = v18;
  id v21 = v18;
  id v22 = v16;
  [v24 requestTransitionWithOptions:0 builder:v25 validator:&__block_literal_global_129];
}

void __33__SBMedusaAppsTestRecipe__toggle__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SBMedusaAppsTestRecipe__toggle__block_invoke_2;
  v4[3] = &unk_1E6AF5638;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 modifyApplicationContext:v4];
}

void __33__SBMedusaAppsTestRecipe__toggle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setEntity:v3 forLayoutRole:1];
  [v4 setEntity:*(void *)(a1 + 40) forLayoutRole:2];
}

uint64_t __33__SBMedusaAppsTestRecipe__toggle__block_invoke_3()
{
  return 1;
}

- (void)_updateAppsToBringUpFromPreferences
{
  id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v11 stringForKey:@"testMedusaAppLeftBundleID"];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = @"com.apple.mobilesafari";
  }
  id v5 = (NSString *)[(__CFString *)v3 copy];
  leftTestBundleID = self->_leftTestBundleID;
  self->_leftTestBundleID = v5;

  v7 = [v11 stringForKey:@"testMedusaAppRightBundleID"];
  objc_super v8 = v7;
  if (!v7) {
    v7 = @"com.apple.MobileSMS";
  }
  uint64_t v9 = (NSString *)[(__CFString *)v7 copy];
  rightTestBundleID = self->_rightTestBundleID;
  self->_rightTestBundleID = v9;
}

- (FBApplicationUpdateScenesTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_rightTestBundleID, 0);
  objc_storeStrong((id *)&self->_leftTestBundleID, 0);
}

@end