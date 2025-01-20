@interface SBCommandTabController
+ (SBCommandTabController)sharedInstance;
+ (id)keyCommands;
+ (id)sharedInstanceIfExists;
- (BOOL)dataStore:(id)a3 shouldRestorePersistedDisplayItem:(id)a4;
- (BOOL)isVisible;
- (BOOL)recentDisplayItemsController:(id)a3 shouldAddItem:(id)a4;
- (SBCommandTabController)init;
- (SBWindow)window;
- (id)persistedDisplayItemsForDataStore:(id)a3;
- (void)_activateWithForwardDirection:(BOOL)a3;
- (void)_allowAppToAppearWhileHidden:(id)a3;
- (void)_clearTimer;
- (void)_disallowAppFromAppearingWhileHidden:(id)a3;
- (void)_effectiveSettingsChangedNotification:(id)a3;
- (void)_emitAnalyticsEventForDisplayItem:(id)a3;
- (void)_sceneDidDisconnect:(id)a3;
- (void)_showCommandTabBarAfterTimer:(id)a3;
- (void)_showWindow:(BOOL)a3;
- (void)activateWithKeyCommand:(id)a3;
- (void)dataStore:(id)a3 persistDisplayItems:(id)a4;
- (void)dealloc;
- (void)dismiss;
- (void)launchCurrentSelectedApplication;
- (void)next;
- (void)previous;
- (void)recentDisplayItemsController:(id)a3 didRemoveItem:(id)a4;
- (void)recentDisplayItemsControllerDidUpdateDisplayItems:(id)a3;
- (void)removeCurrentSelectedApplication;
- (void)viewController:(id)a3 selectedApplicationWithDisplayItem:(id)a4;
@end

@implementation SBCommandTabController

+ (SBCommandTabController)sharedInstance
{
  if (sharedInstance___once_1 != -1) {
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_119);
  }
  v2 = (void *)__controllerInstance_2;
  return (SBCommandTabController *)v2;
}

uint64_t __40__SBCommandTabController_sharedInstance__block_invoke()
{
  kdebug_trace();
  if (!__sb__runningInSpringBoard())
  {
    v0 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v1 = [v0 userInterfaceIdiom];

    if (v1 != 1) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (SBFEffectiveDeviceClass() == 2)
  {
LABEL_5:
    v2 = objc_alloc_init(SBCommandTabController);
    v3 = (void *)__controllerInstance_2;
    __controllerInstance_2 = (uint64_t)v2;
  }
LABEL_6:
  return kdebug_trace();
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance_2;
}

+ (id)keyCommands
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      v2 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1) {
      goto LABEL_3;
    }
  }
  v5 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
  v6 = (void *)MEMORY[0x1E4F42AF8];
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 localizedStringForKey:@"COMMAND_TAB_DISCOVERABILITY" value:&stru_1F3084718 table:@"SpringBoard"];
  v9 = [v6 commandWithTitle:v8 image:0 action:sel__handleCommandTab_ input:@"\t" modifierFlags:0x100000 propertyList:0];

  [v9 _setEventDeferringEnvironment:v5];
  v10 = [MEMORY[0x1E4F42AF8] commandWithTitle:&stru_1F3084718 image:0 action:sel__handleShiftCommandTab_ input:@"\t" modifierFlags:1179648 propertyList:&unk_1F3349E00];
  [v9 _setEventDeferringEnvironment:v5];
  v12[0] = v9;
  v12[1] = v10;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

LABEL_6:
  return v2;
}

- (SBCommandTabController)init
{
  v33.receiver = self;
  v33.super_class = (Class)SBCommandTabController;
  v2 = [(SBCommandTabController *)&v33 init];
  if (v2)
  {
    v3 = +[SBSceneManagerCoordinator sharedInstance];
    uint64_t v4 = [v3 sceneDeactivationManager];
    uint64_t v5 = [v4 newAssertionWithReason:3];
    resignActiveAssertion = v2->_resignActiveAssertion;
    v2->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v5;

    uint64_t v7 = BSDispatchQueueCreateWithQualityOfService();
    recentDisplayItemsPersistenceQueue = v2->_recentDisplayItemsPersistenceQueue;
    v2->_recentDisplayItemsPersistenceQueue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__sceneDidDisconnect_ name:*MEMORY[0x1E4F43C80] object:0];

    v10 = +[SBDefaults localDefaults];
    uint64_t v11 = [v10 recentDisplayItemsDefaults];
    defaults = v2->_defaults;
    v2->_defaults = (SBRecentDisplayItemsDefaults *)v11;

    v13 = objc_alloc_init(SBRecentDisplayItemsDataStore);
    dataStore = v2->_dataStore;
    v2->_dataStore = v13;

    [(SBRecentDisplayItemsDataStore *)v2->_dataStore setPersistenceDelegate:v2];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v2 selector:sel__effectiveSettingsChangedNotification_ name:*MEMORY[0x1E4F73EC0] object:0];

    v16 = [SBRecentDisplayItemsController alloc];
    v17 = +[SBAppInteractionEventSourceManager sharedInstance];
    v18 = +[SBApplicationController sharedInstance];
    uint64_t v19 = [(SBRecentDisplayItemsController *)v16 initWithRemovalPersonality:7 movePersonality:15 transitionFromSources:0 maxDisplayItems:10 eventSource:v17 applicationController:v18];
    recentDisplayItemsController = v2->_recentDisplayItemsController;
    v2->_recentDisplayItemsController = (SBRecentDisplayItemsController *)v19;

    v21 = v2->_recentDisplayItemsController;
    v22 = [(SBRecentDisplayItemsDataStore *)v2->_dataStore displayItems];
    [(SBRecentDisplayItemsController *)v21 setRecentDisplayItems:v22];

    [(SBRecentDisplayItemsController *)v2->_recentDisplayItemsController setDelegate:v2];
    objc_initWeak(&location, v2);
    v23 = (void *)MEMORY[0x1E4F941F8];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __30__SBCommandTabController_init__block_invoke;
    v30 = &unk_1E6AF80B8;
    objc_copyWeak(&v31, &location);
    uint64_t v24 = [v23 recipeWithTitle:@"Show Command Tab" prepareBlock:0 toggleAction:&v27 cleanupBlock:0];
    testRecipe = v2->_testRecipe;
    v2->_testRecipe = (PTToggleTestRecipe *)v24;

    +[PTDomain registerTestRecipe:](SBAppSwitcherDomain, "registerTestRecipe:", v2->_testRecipe, v27, v28, v29, v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__SBCommandTabController_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (a2)
  {
    if ([WeakRetained isVisible]) {
      [v4 next];
    }
    else {
      [v4 activateWithKeyCommand:0];
    }
  }
  else
  {
    [WeakRetained dismiss];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion relinquish];
  v4.receiver = self;
  v4.super_class = (Class)SBCommandTabController;
  [(SBCommandTabController *)&v4 dealloc];
}

- (void)activateWithKeyCommand:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  v6 = [v5 policyAggregator];
  id v24 = 0;
  int v7 = [v6 allowsCapability:19 explanation:&v24];
  id v8 = v24;

  if (v7)
  {
    v9 = +[SBAssistantController sharedInstance];
    [v9 dismissAssistantViewInEverySceneIfNecessary];

    v10 = +[SBVoiceControlController sharedInstance];
    [v10 dismissTransientOverlay];

    uint64_t v11 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    v12 = [v11 recentAppLayouts];
    if ([v12 count])
    {
      v13 = [(SBRecentDisplayItemsController *)self->_recentDisplayItemsController recentDisplayItems];
      BOOL v14 = +[SBCommandTabViewController canActivateWithRecentDisplayItems:v13];

      if (v14)
      {
        if (([v4 modifierFlags] & 0x20000) != 0)
        {
          v15 = self;
          uint64_t v16 = 0;
        }
        else
        {
          v15 = self;
          uint64_t v16 = 1;
        }
        [(SBCommandTabController *)v15 _activateWithForwardDirection:v16];
        goto LABEL_16;
      }
    }
    else
    {
    }
    v18 = SBLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      v20 = [v19 recentAppLayouts];
      uint64_t v21 = [v20 count];
      v22 = [(SBRecentDisplayItemsController *)self->_recentDisplayItemsController recentDisplayItems];
      uint64_t v23 = [v22 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = v21;
      __int16 v27 = 2048;
      uint64_t v28 = v23;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Can't activate command-tab (numRecentAppLayouts: %lu, numRecentDisplayItems: %lu)", buf, 0x16u);
    }
  }
  else if (v8)
  {
    v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = (uint64_t)v8;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Can't activate command-tab: %{public}@", buf, 0xCu);
    }
  }
LABEL_16:
}

- (void)dismiss
{
  if (self->_timer)
  {
    v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "cancelling command-tab present timer for view dismissal", v4, 2u);
    }

    [(SBCommandTabController *)self _clearTimer];
  }
  [(SBCommandTabController *)self _showWindow:0];
}

- (BOOL)isVisible
{
  window = self->_window;
  if (window) {
    LOBYTE(window) = [(SBWindow *)window isHidden] ^ 1;
  }
  return (char)window;
}

- (void)next
{
}

- (void)previous
{
}

- (void)launchCurrentSelectedApplication
{
  commandTabViewController = self->_commandTabViewController;
  id v4 = [(SBCommandTabViewController *)commandTabViewController selectedApplicationDisplayItem];
  [(SBCommandTabController *)self viewController:commandTabViewController selectedApplicationWithDisplayItem:v4];
}

- (void)removeCurrentSelectedApplication
{
  id v3 = [(SBCommandTabViewController *)self->_commandTabViewController selectedApplicationDisplayItem];
  if ([v3 type] != 1) {
    [(SBRecentDisplayItemsController *)self->_recentDisplayItemsController removeDisplayItem:v3];
  }
}

- (void)viewController:(id)a3 selectedApplicationWithDisplayItem:(id)a4
{
  id v6 = a4;
  int v7 = [a3 _sbWindowScene];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 sceneManager];
    v10 = +[SBWorkspace mainWorkspace];
    uint64_t v11 = [v10 keyboardFocusController];

    uint64_t v12 = [v11 userFocusRequestGeneration];
    [(SBCommandTabController *)self _emitAnalyticsEventForDisplayItem:v6];
    v13 = [v11 bufferEventsForSpringBoardScene:v8 reason:@"SBCommandTabController"];
    if (!v6) {
      [(SBCommandTabController *)self dismiss];
    }
    v48 = v9;
    if ([v6 type] == 1)
    {
      [(SBCommandTabController *)self dismiss];
      BOOL v14 = +[SBWorkspaceEntity entity];
LABEL_18:
      if ([(SBApplicationSceneEntity *)v14 isApplicationSceneEntity])
      {
        [(SBApplicationSceneEntity *)v14 application];
        v37 = v11;
        v39 = uint64_t v38 = v12;
        v40 = [v39 bundleIdentifier];

        uint64_t v12 = v38;
        uint64_t v11 = v37;
      }
      [(SBWorkspaceEntity *)v14 setFlag:1 forActivationSetting:49];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke;
      v58[3] = &unk_1E6AF4AC0;
      id v59 = v13;
      id v41 = v13;
      v42 = (void *)MEMORY[0x1D948C7A0](v58);
      v43 = +[SBWorkspace mainWorkspace];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_2;
      v52[3] = &unk_1E6AFF300;
      v53 = v14;
      id v54 = v8;
      id v56 = v42;
      uint64_t v57 = v12;
      id v55 = v6;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_75;
      v49[3] = &unk_1E6AFF260;
      id v50 = v55;
      v51 = self;
      id v44 = v42;
      v15 = v14;
      [v43 requestTransitionWithOptions:0 builder:v52 validator:v49];

      goto LABEL_21;
    }
    if ([v6 type] == 5)
    {
      uint64_t v16 = +[SBApplicationController sharedInstance];
      [v16 webApplication];
      v17 = v46 = v13;

      v18 = [SBDeviceApplicationSceneEntity alloc];
      uint64_t v19 = [v6 uniqueIdentifier];
      [v9 displayIdentity];
      v20 = v11;
      v22 = uint64_t v21 = v12;
      BOOL v14 = [(SBDeviceApplicationSceneEntity *)v18 initWithApplication:v17 uniqueIdentifier:v19 sceneHandleProvider:v9 displayIdentity:v22];

      uint64_t v12 = v21;
      uint64_t v11 = v20;

      v13 = v46;
      goto LABEL_18;
    }
    uint64_t v47 = v12;
    uint64_t v23 = [v6 bundleIdentifier];
    id v24 = +[SBApplicationController sharedInstance];
    v25 = [v24 applicationWithBundleIdentifier:v23];

    uint64_t v26 = [v25 bundleIdentifier];
    BOOL v27 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:v26];

    if (!v25 || v27)
    {
      id v31 = +[SBApplicationPlaceholderController sharedInstance];
      v32 = [v31 placeholderForDisplayID:v23];
      v45 = v23;
      objc_super v33 = v13;
      int v34 = [v32 isAppClip] | v27;

      BOOL v35 = v34 == 1;
      v13 = v33;
      uint64_t v23 = v45;
      if (!v35)
      {
        BOOL v14 = 0;
LABEL_17:
        uint64_t v12 = v47;

        goto LABEL_18;
      }
      v36 = [SBAppClipPlaceholderWorkspaceEntity alloc];
      uint64_t v29 = [v6 uniqueIdentifier];
      uint64_t v30 = [(SBAppClipPlaceholderWorkspaceEntity *)v36 initWithBundleIdentifier:v45 futureSceneIdentifier:v29 needsUpdate:v27];
    }
    else
    {
      uint64_t v28 = [SBDeviceApplicationSceneEntity alloc];
      uint64_t v29 = [v48 displayIdentity];
      uint64_t v30 = [(SBDeviceApplicationSceneEntity *)v28 initWithApplication:v25 uniqueIdentifier:0 sceneHandleProvider:v48 displayIdentity:v29];
    }
    BOOL v14 = (SBDeviceApplicationSceneEntity *)v30;

    goto LABEL_17;
  }
  v15 = SBLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "rejecting command-tab view controller request to launch app as it isn't associated with a window scene", buf, 2u);
  }
LABEL_21:
}

uint64_t __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:16];
  [v3 setEventLabel:@"ActivateAppCommandTab"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_3;
  void v12[3] = &unk_1E6AFF2B0;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  [v3 modifyApplicationContext:v12];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_4;
  v8[3] = &unk_1E6AFF2D8;
  id v4 = *(id *)(a1 + 32);
  id v6 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = v4;
  uint64_t v11 = v5;
  id v10 = v6;
  id v7 = (id)[v3 addCompletionHandler:v8];
}

void __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 setActivatingEntity:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) switcherController];
  id v4 = [v3 switcherCoordinator];
  id v6 = [v4 switcherControllerForDisplayItem:*(void *)(a1 + 48)];

  uint64_t v5 = [v6 _currentMainAppLayout];
  if ([v5 containsItem:*(void *)(a1 + 48)]) {
    [*(id *)(a1 + 32) setFlag:1 forActivationSetting:11];
  }
}

void __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) applicationSceneEntity];
    id v4 = [v3 sceneHandle];
    uint64_t v5 = [v4 sceneIfExists];

    if (v5)
    {
      id v6 = +[SBWorkspace mainWorkspace];
      id v7 = [v6 keyboardFocusController];

      uint64_t v8 = *(void *)(a1 + 48);
      if (v8 == [v7 userFocusRequestGeneration])
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_5;
        void v12[3] = &unk_1E6AF5A50;
        id v13 = *(id *)(a1 + 40);
        [v7 userFocusRequestForScene:v5 reason:@"commandTab" completion:v12];
      }
      else
      {
        id v10 = SBLogKeyboardFocus();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v11 = 0;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "CommandTab: not invoking userFocusRequestForScene: -- someone else requested a focus change since transition began", v11, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v9();
  }
}

uint64_t __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  uint64_t v5 = [v4 switcherControllerForDisplayItem:*(void *)(a1 + 32)];

  id v6 = [v5 windowScene];
  id v7 = v6;
  if (!v6) {
    id v6 = *(void **)(*(void *)(a1 + 40) + 104);
  }
  uint64_t v8 = [v6 _fbsDisplayConfiguration];
  [v3 setDisplayConfiguration:v8];

  return 1;
}

- (void)recentDisplayItemsControllerDidUpdateDisplayItems:(id)a3
{
  dataStore = self->_dataStore;
  id v4 = [(SBRecentDisplayItemsController *)self->_recentDisplayItemsController recentDisplayItems];
  [(SBRecentDisplayItemsDataStore *)dataStore setDisplayItems:v4];
}

- (void)recentDisplayItemsController:(id)a3 didRemoveItem:(id)a4
{
}

- (BOOL)recentDisplayItemsController:(id)a3 shouldAddItem:(id)a4
{
  id v9 = a4;
  id v10 = +[SBIconController sharedInstance];
  uint64_t v11 = [v10 model];

  if ([v9 type] == 5) {
    [v9 webClipIdentifier];
  }
  else {
  uint64_t v12 = [v9 bundleIdentifier];
  }
  id v13 = [v11 expectedIconForDisplayIdentifier:v12];

  if (([v11 isIconVisible:v13] & 1) == 0)
  {
    id v15 = [v13 applicationBundleID];
    if (v15)
    {
      uint64_t v16 = +[SBApplicationController sharedInstance];
      id v4 = [v13 applicationBundleID];
      uint64_t v5 = [v16 applicationWithBundleIdentifier:v4];
      id v6 = [v5 info];
      if ([v6 isAppClip])
      {
        char v14 = 1;
LABEL_15:

        goto LABEL_16;
      }
      v17 = +[SBApplicationPlaceholderController sharedInstance];
      v22 = [v13 applicationBundleID];
      uint64_t v23 = v17;
      id v7 = objc_msgSend(v17, "placeholderForDisplayID:");
      if ([v7 isAppClip])
      {
        char v14 = 1;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v21 = v16;
    }
    appsAllowedWhileHidden = self->_appsAllowedWhileHidden;
    uint64_t v19 = [v9 bundleIdentifier];
    char v14 = [(NSMutableSet *)appsAllowedWhileHidden containsObject:v19];

    uint64_t v16 = v21;
    if (!v15)
    {
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_14;
  }
  char v14 = 1;
LABEL_17:

  return v14;
}

- (id)persistedDisplayItemsForDataStore:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (SBRecentDisplayItemsDataStore *)a3;
  if (self->_dataStore == v4)
  {
    persistedRecentDisplayItems = self->_persistedRecentDisplayItems;
    if (persistedRecentDisplayItems)
    {
      id v5 = (id)[(NSOrderedSet *)persistedRecentDisplayItems mutableCopy];
    }
    else
    {
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x3032000000;
      uint64_t v26 = __Block_byref_object_copy__37;
      BOOL v27 = __Block_byref_object_dispose__37;
      id v28 = 0;
      recentDisplayItemsPersistenceQueue = self->_recentDisplayItemsPersistenceQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__SBCommandTabController_persistedDisplayItemsForDataStore___block_invoke;
      block[3] = &unk_1E6AF4B88;
      block[4] = self;
      block[5] = &v23;
      dispatch_sync(recentDisplayItemsPersistenceQueue, block);
      if (v24[5])
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = (id)v24[5];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v19;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              id v13 = [SBDisplayItem alloc];
              char v14 = -[SBDisplayItem initWithPlistRepresentation:](v13, "initWithPlistRepresentation:", v12, (void)v18);
              if (!v14)
              {

                id v15 = SBLogCommon();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                  -[SBCommandTabController persistedDisplayItemsForDataStore:](v12, v15);
                }

                id v5 = 0;
                goto LABEL_18;
              }
              [v5 addObject:v14];
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v29 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      else
      {
        id v5 = 0;
      }
      _Block_object_dispose(&v23, 8);
    }
    uint64_t v16 = +[SBDisplayItem homeScreenDisplayItem];
    [v5 addObject:v16];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __60__SBCommandTabController_persistedDisplayItemsForDataStore___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) commandTabPlistRepresentation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)dataStore:(id)a3 persistDisplayItems:(id)a4
{
  id v6 = a4;
  if (self->_dataStore == a3 && ([(NSOrderedSet *)self->_persistedRecentDisplayItems isEqual:v6] & 1) == 0)
  {
    id v7 = (void *)[v6 copy];
    objc_storeStrong((id *)&self->_persistedRecentDisplayItems, v7);
    objc_initWeak(&location, self->_defaults);
    recentDisplayItemsPersistenceQueue = self->_recentDisplayItemsPersistenceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SBCommandTabController_dataStore_persistDisplayItems___block_invoke;
    block[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    id v9 = v7;
    dispatch_async(recentDisplayItemsPersistenceQueue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __56__SBCommandTabController_dataStore_persistDisplayItems___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "plistRepresentation", (void)v10);
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [WeakRetained setCommandTabPlistRepresentation:v3];
}

- (BOOL)dataStore:(id)a3 shouldRestorePersistedDisplayItem:(id)a4
{
  id v4 = a4;
  uint64_t v5 = +[SBIconController sharedInstance];
  uint64_t v6 = [v5 model];

  if ([v4 type])
  {
    uint64_t v7 = [v4 type];

    char v8 = v7 == 1;
  }
  else
  {
    id v9 = [v4 bundleIdentifier];

    if (v9)
    {
      long long v10 = [v6 expectedIconForDisplayIdentifier:v9];
      char v11 = [v6 isIconVisible:v10];
      long long v12 = +[SBApplicationController sharedInstance];
      long long v13 = [v12 restrictionController];
      char v14 = [v13 isApplicationIdentifierRestricted:v9];

      char v8 = v11 & (v14 ^ 1);
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (void)_sceneDidDisconnect:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = [(UIWindow *)self->_window _sbWindowScene];

  if (v4 == v5)
  {
    uint64_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing command-tab because its scene has disconnected", v7, 2u);
    }

    [(SBCommandTabController *)self dismiss];
  }
}

- (void)_effectiveSettingsChangedNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBCommandTabController__effectiveSettingsChangedNotification___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__SBCommandTabController__effectiveSettingsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isCommandTabAllowed];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 dismiss];
  }
}

- (void)_emitAnalyticsEventForDisplayItem:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12[0] = *MEMORY[0x1E4FA7690];
  uint64_t v5 = +[SBDisplayItem homeScreenDisplayItem];
  char v6 = [v4 isEqual:v5];
  if (v6)
  {
    uint64_t v7 = &unk_1F3349E18;
  }
  else
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBCommandTabViewController indexOfDisplayItem:](self->_commandTabViewController, "indexOfDisplayItem:", v4));
  }
  v12[1] = *MEMORY[0x1E4FA7698];
  v13[0] = v7;
  v13[1] = &unk_1F3349E30;
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  if ((v6 & 1) == 0) {

  }
  id v9 = (void *)MEMORY[0x1E4FA5E78];
  id v10 = v8;
  char v11 = [v9 sharedInstance];
  [v11 emitEvent:14 withPayload:v10];
}

- (void)_activateWithForwardDirection:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_window) {
    [(SBCommandTabController *)self _showWindow:1];
  }
  if (self->_timer) {
    [(SBCommandTabController *)self _clearTimer];
  }
  if (self->_window)
  {
    id v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__showCommandTabBarAfterTimer_ selector:0 userInfo:0 repeats:0.1];
    objc_storeStrong((id *)&self->_timer, v6);
    if (v3)
    {
      if ((SBWorkspaceSpringBoardIsActive() & 1) == 0) {
        [(SBCommandTabViewController *)self->_commandTabViewController next];
      }
    }
    else
    {
      [(SBCommandTabViewController *)self->_commandTabViewController previous];
    }
  }
  else
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create command-tab window while attempting to activate", buf, 2u);
    }
  }
}

- (void)_showCommandTabBarAfterTimer:(id)a3
{
  [(SBCommandTabController *)self _clearTimer];
  commandTabViewController = self->_commandTabViewController;
  [(SBCommandTabViewController *)commandTabViewController showCommandTabBar];
}

- (void)_showWindow:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(id)SBApp windowSceneManager];
  id v6 = [v5 activeDisplayWindowScene];

  uint64_t v7 = [v6 switcherController];
  char v8 = [v7 isChamoisWindowingUIEnabled];

  window = self->_window;
  if (v3)
  {
    if (window)
    {
      id v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [(SBWindow *)self->_window isHidden];
        v30[0] = 67109120;
        v30[1] = v11;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Not creating command-tab window because one already exists, isHidden: %d", (uint8_t *)v30, 8u);
      }
    }
    else
    {
      if ((v8 & 1) == 0)
      {
        resignActiveAssertion = self->_resignActiveAssertion;
        v17 = [v6 _fbsDisplayIdentity];
        [(UIApplicationSceneDeactivationAssertion *)resignActiveAssertion sb_acquireForDisplayIdentity:v17];
      }
      long long v18 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"CommandTab"];
      deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
      self->_deferOrientationUpdatesAssertion = v18;

      long long v20 = [(SBWindow *)[SBCommandTabWindow alloc] initWithWindowScene:v6 role:@"SBTraitsParticipantRoleCommandTab" debugName:@"Command Tab Window"];
      long long v21 = self->_window;
      self->_window = &v20->super;

      v22 = [SBCommandTabViewController alloc];
      uint64_t v23 = [(SBRecentDisplayItemsController *)self->_recentDisplayItemsController recentDisplayItems];
      id v24 = [(SBCommandTabViewController *)v22 initWithRecentDisplayItems:v23];
      commandTabViewController = self->_commandTabViewController;
      self->_commandTabViewController = v24;

      [(SBCommandTabViewController *)self->_commandTabViewController setDelegate:self];
      [(SBWindow *)self->_window setRootViewController:self->_commandTabViewController];
      [(SBWindow *)self->_window setWindowLevel:*MEMORY[0x1E4F43CF8] + 45.0];
      if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCommandTab") & 1) == 0) {
        -[SBWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self->_window, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", [(id)SBApp activeInterfaceOrientation], 0, 0, 0.0);
      }
      [(SBWindow *)self->_window setHidden:0];
      [(SBFWindow *)self->_window makeKeyWindow];
      [(SBCommandTabViewController *)self->_commandTabViewController becomeFirstResponder];
      id v10 = +[SBMainWorkspace sharedInstance];
      uint64_t v26 = [v10 keyboardFocusController];
      BOOL v27 = +[SBKeyboardFocusLockReason commandTab];
      id v28 = [v26 focusLockSpringBoardWindowScene:v6 forReason:v27];
      keyboardFocusAssertion = self->_keyboardFocusAssertion;
      self->_keyboardFocusAssertion = v28;
    }
  }
  else if (window)
  {
    if ((v8 & 1) == 0) {
      [(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion relinquish];
    }
    [(BSInvalidatable *)self->_deferOrientationUpdatesAssertion invalidate];
    long long v12 = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = 0;

    [(SBCommandTabViewController *)self->_commandTabViewController resignFirstResponder];
    long long v13 = self->_commandTabViewController;
    self->_commandTabViewController = 0;

    [(SBFWindow *)self->_window resignAsKeyWindow];
    [(SBWindow *)self->_window setHidden:1];
    char v14 = self->_window;
    self->_window = 0;

    [(BSInvalidatable *)self->_keyboardFocusAssertion invalidate];
    uint64_t v15 = self->_keyboardFocusAssertion;
    self->_keyboardFocusAssertion = 0;
  }
}

- (void)_clearTimer
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_allowAppToAppearWhileHidden:(id)a3
{
  id v4 = a3;
  appsAllowedWhileHidden = self->_appsAllowedWhileHidden;
  id v8 = v4;
  if (!appsAllowedWhileHidden)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_appsAllowedWhileHidden;
    self->_appsAllowedWhileHidden = v6;

    id v4 = v8;
    appsAllowedWhileHidden = self->_appsAllowedWhileHidden;
  }
  [(NSMutableSet *)appsAllowedWhileHidden addObject:v4];
  [(SBRecentDisplayItemsController *)self->_recentDisplayItemsController _allowAppToAppearWhileHidden:v8];
}

- (void)_disallowAppFromAppearingWhileHidden:(id)a3
{
  id v5 = a3;
  -[NSMutableSet removeObject:](self->_appsAllowedWhileHidden, "removeObject:");
  if (![(NSMutableSet *)self->_appsAllowedWhileHidden count])
  {
    appsAllowedWhileHidden = self->_appsAllowedWhileHidden;
    self->_appsAllowedWhileHidden = 0;
  }
  [(SBRecentDisplayItemsController *)self->_recentDisplayItemsController _disallowAppFromAppearingWhileHidden:v5];
}

- (SBWindow)window
{
  return self->_window;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testRecipe, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_recentDisplayItemsPersistenceQueue, 0);
  objc_storeStrong((id *)&self->_appsAllowedWhileHidden, 0);
  objc_storeStrong((id *)&self->_persistedRecentDisplayItems, 0);
  objc_storeStrong((id *)&self->_recentDisplayItemsController, 0);
  objc_storeStrong((id *)&self->_keyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_commandTabViewController, 0);
}

- (void)persistedDisplayItemsForDataStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "failed to create display item from cmdtab plist rep -- aborting loading of items. failed plist rep: %@", (uint8_t *)&v2, 0xCu);
}

@end