@interface SBActivateManyApplicationsTestRecipe
+ (id)_bundleIdentifiers;
- (SBActivateManyApplicationsTestRecipe)init;
- (id)title;
- (void)_addAppToStageWithBundleIdentifier:(id)a3;
- (void)_addNewNotesSceneToStage;
- (void)_destroyApplicationSceneHandles:(id)a3;
- (void)_removeFrontmostScene;
- (void)_removeNotesScenes;
- (void)_removeScenesForAppWithBundleIdentifier:(id)a3;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)windowSceneDidUpdate:(id)a3;
@end

@implementation SBActivateManyApplicationsTestRecipe

- (SBActivateManyApplicationsTestRecipe)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBActivateManyApplicationsTestRecipe;
  result = [(SBActivateManyApplicationsTestRecipe *)&v3 init];
  if (result) {
    result->_launchedAppsCount = 0;
  }
  return result;
}

- (id)title
{
  return @"Activate Many Apps";
}

- (void)handleVolumeIncrease
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_1_0();
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "[%@] Reached bundle identifiers list max (%lu), now creating new notes windows", v7, 0x16u);
}

- (void)handleVolumeDecrease
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[%@] No app to deactivate", v5, 0xCu);
}

- (void)windowSceneDidUpdate:(id)a3
{
}

+ (id)_bundleIdentifiers
{
  if (_bundleIdentifiers_onceToken != -1) {
    dispatch_once(&_bundleIdentifiers_onceToken, &__block_literal_global_337);
  }
  v2 = (void *)_bundleIdentifiers_bundleIdentifiers;
  return v2;
}

void __58__SBActivateManyApplicationsTestRecipe__bundleIdentifiers__block_invoke()
{
  v2[36] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.AppStore";
  v2[1] = @"com.apple.iBooks";
  v2[2] = @"com.apple.calculator";
  v2[3] = @"com.apple.mobilecal";
  v2[4] = @"com.apple.camera";
  v2[5] = @"com.apple.mobiletimer";
  v2[6] = @"com.apple.BarcodeScanner";
  v2[7] = @"com.apple.compass";
  v2[8] = @"com.apple.MobileAddressBook";
  v2[9] = @"com.apple.facetime";
  v2[10] = @"com.apple.DocumentsApp";
  v2[11] = @"com.apple.findmy";
  v2[12] = @"com.apple.freeform";
  v2[13] = @"com.apple.Health";
  v2[14] = @"com.apple.Home";
  v2[15] = @"com.apple.MobileStore";
  v2[16] = @"com.apple.Magnifier";
  v2[17] = @"com.apple.mobilemail";
  v2[18] = @"com.apple.Maps";
  v2[19] = @"com.apple.measure";
  v2[20] = @"com.apple.MobileSMS";
  v2[21] = @"com.apple.Music";
  v2[22] = @"com.apple.news";
  v2[23] = @"com.apple.Photo-Booth";
  v2[24] = @"com.apple.mobileslideshow";
  v2[25] = @"com.apple.podcasts";
  v2[26] = @"com.apple.reminders";
  v2[27] = @"com.apple.mobilesafari";
  v2[28] = @"com.apple.Preferences";
  v2[29] = @"com.apple.shortcuts";
  v2[30] = @"com.apple.stocks";
  v2[31] = @"com.apple.tips";
  v2[32] = @"com.apple.Translate";
  v2[33] = @"com.apple.tv";
  v2[34] = @"com.apple.VoiceMemos";
  v2[35] = @"com.apple.weather";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:36];
  v1 = (void *)_bundleIdentifiers_bundleIdentifiers;
  _bundleIdentifiers_bundleIdentifiers = v0;
}

- (void)_addAppToStageWithBundleIdentifier:(id)a3
{
  windowScene = self->_windowScene;
  id v4 = a3;
  v5 = [(SBWindowScene *)windowScene sceneManager];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  }
  __int16 v8 = v7;

  uint64_t v9 = +[SBApplicationController sharedInstance];
  uint64_t v10 = [v9 applicationWithBundleIdentifier:v4];

  v11 = [SBDeviceApplicationSceneEntity alloc];
  v12 = [v8 displayIdentity];
  v13 = [(SBDeviceApplicationSceneEntity *)v11 initWithApplication:v10 generatingNewPrimarySceneIfRequired:1 sceneHandleProvider:v8 displayIdentity:v12];

  if (v13)
  {
    v14 = +[SBWorkspace mainWorkspace];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__SBActivateManyApplicationsTestRecipe__addAppToStageWithBundleIdentifier___block_invoke;
    v15[3] = &unk_1E6AF57E8;
    v16 = v13;
    [v14 requestTransitionWithOptions:0 builder:v15 validator:&__block_literal_global_15_2];
  }
}

void __75__SBActivateManyApplicationsTestRecipe__addAppToStageWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:35];
  [v3 setEventLabel:@"NewWindowRequest"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__SBActivateManyApplicationsTestRecipe__addAppToStageWithBundleIdentifier___block_invoke_2;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

void __75__SBActivateManyApplicationsTestRecipe__addAppToStageWithBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  uint64_t v6 = +[SBWorkspaceEntity entity];
  id v7 = +[SBWorkspaceEntity entity];
  [v4 setEntities:v5 startingAtLayoutRole:1 withPolicy:1 centerEntity:v6 floatingEntity:v7];

  [v4 _setRequestedFrontmostEntity:*(void *)(a1 + 32)];
}

uint64_t __75__SBActivateManyApplicationsTestRecipe__addAppToStageWithBundleIdentifier___block_invoke_3()
{
  return 1;
}

- (void)_addNewNotesSceneToStage
{
  v2 = [(SBWindowScene *)self->_windowScene sceneManager];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  }
  id v5 = v4;

  uint64_t v6 = +[SBApplicationController sharedInstance];
  id v7 = [v6 applicationWithBundleIdentifier:@"com.apple.mobilenotes"];

  uint64_t v8 = [v5 displayIdentity];
  id v9 = +[SBDeviceApplicationSceneEntity newEntityWithApplication:v7 sceneHandleProvider:v5 displayIdentity:v8];

  if (v9)
  {
    uint64_t v10 = +[SBWorkspace mainWorkspace];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__SBActivateManyApplicationsTestRecipe__addNewNotesSceneToStage__block_invoke;
    v11[3] = &unk_1E6AF57E8;
    id v12 = v9;
    [v10 requestTransitionWithOptions:0 builder:v11 validator:&__block_literal_global_17_4];
  }
}

void __64__SBActivateManyApplicationsTestRecipe__addNewNotesSceneToStage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:35];
  [v3 setEventLabel:@"NewWindowRequest"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SBActivateManyApplicationsTestRecipe__addNewNotesSceneToStage__block_invoke_2;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

void __64__SBActivateManyApplicationsTestRecipe__addNewNotesSceneToStage__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setActivatingEntity:v3];
  v8[0] = *(void *)(a1 + 32);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = +[SBWorkspaceEntity entity];
  id v7 = +[SBWorkspaceEntity entity];
  [v4 setEntities:v5 startingAtLayoutRole:1 withPolicy:1 centerEntity:v6 floatingEntity:v7];

  [v4 _setRequestedFrontmostEntity:*(void *)(a1 + 32)];
}

uint64_t __64__SBActivateManyApplicationsTestRecipe__addNewNotesSceneToStage__block_invoke_3()
{
  return 1;
}

- (void)_removeNotesScenes
{
  uint64_t v3 = @"com.apple.mobilenotes";
  id v4 = [(SBWindowScene *)self->_windowScene sceneManager];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  }
  id v7 = v6;

  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  id v9 = [v7 externalApplicationSceneHandlesForBundleIdentifiers:v8];

  uint64_t v10 = SBApplicationSceneEntityDestructionMakeIntent(1, 1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SBActivateManyApplicationsTestRecipe__removeNotesScenes__block_invoke;
  v11[3] = &unk_1E6AF8948;
  id v12 = v3;
  SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v9, v10, v11);
}

void __58__SBActivateManyApplicationsTestRecipe__removeNotesScenes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = SBLogPrototyping();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__SBActivateManyApplicationsTestRecipe__removeNotesScenes__block_invoke_cold_1();
    }
  }
  id v6 = +[SBApplicationController sharedInstanceIfExists];
  id v7 = [v6 applicationWithBundleIdentifier:*(void *)(a1 + 32)];
  uint64_t v8 = [v7 processState];
  int v9 = [v8 isRunning];

  if (v9)
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Killing %@ because it has been disabled", (uint8_t *)&v11, 0xCu);
    }

    SBWorkspaceKillApplication(v7, 1, @"app has been disabled/restricted", 0);
  }
}

- (void)_removeScenesForAppWithBundleIdentifier:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBActivateManyApplicationsTestRecipe.m", 195, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  id v5 = [(SBWindowScene *)self->_windowScene sceneManager];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  }
  uint64_t v8 = v7;

  int v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  uint64_t v10 = [v8 externalApplicationSceneHandlesForBundleIdentifiers:v9];

  [(SBActivateManyApplicationsTestRecipe *)self _destroyApplicationSceneHandles:v10];
}

- (void)_removeFrontmostScene
{
  uint64_t v3 = [(SBWindowScene *)self->_windowScene switcherController];
  id v4 = [v3 layoutState];
  id v5 = [v4 appLayout];
  id v6 = [v5 zOrderedLeafAppLayouts];
  id v7 = [v6 firstObject];

  uint64_t v8 = [v7 zOrderedItems];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__94;
  v21 = __Block_byref_object_dispose__94;
  id v22 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __61__SBActivateManyApplicationsTestRecipe__removeFrontmostScene__block_invoke;
  v14 = &unk_1E6B0AC58;
  v16 = &v17;
  id v9 = v3;
  id v15 = v9;
  [v8 enumerateObjectsUsingBlock:&v11];
  if (v18[5])
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", v11, v12, v13, v14);
    [(SBActivateManyApplicationsTestRecipe *)self _destroyApplicationSceneHandles:v10];
  }
  _Block_object_dispose(&v17, 8);
}

void __61__SBActivateManyApplicationsTestRecipe__removeFrontmostScene__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (![v9 type])
  {
    uint64_t v6 = [*(id *)(a1 + 32) _deviceApplicationSceneHandleForDisplayItem:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *a4 = 1;
    }
  }
}

- (void)_destroyApplicationSceneHandles:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBActivateManyApplicationsTestRecipe.m", 221, @"Invalid parameter not satisfying: %@", @"sceneHandlesToDestroy" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 count])
  {
    uint64_t v6 = SBApplicationSceneEntityDestructionMakeIntent(1, 1);
    SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v8, v6, &__block_literal_global_38_2);
  }
}

void __72__SBActivateManyApplicationsTestRecipe__destroyApplicationSceneHandles___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = SBLogPrototyping();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__SBActivateManyApplicationsTestRecipe__removeNotesScenes__block_invoke_cold_1();
    }
  }
}

- (void).cxx_destruct
{
}

void __58__SBActivateManyApplicationsTestRecipe__removeNotesScenes__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Error while attempting to disconnect scene: %@", v1, 0xCu);
}

@end