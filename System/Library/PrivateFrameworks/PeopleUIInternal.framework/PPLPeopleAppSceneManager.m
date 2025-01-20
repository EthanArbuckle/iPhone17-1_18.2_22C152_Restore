@interface PPLPeopleAppSceneManager
+ (id)sharedSceneManager;
- (FBApplicationUpdateScenesTransaction)transaction;
- (FBScene)scene;
- (NSPointerArray)sceneRequesters;
- (PPLPeopleAppLauncher)peopleAppLauncher;
- (PPLPeopleAppSceneManager)initWithAppLauncher:(id)a3;
- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4;
- (void)_configureSceneForRequester:(id)a3;
- (void)_createSceneForRequester:(id)a3;
- (void)_launchPeopleAppIfNeededWithForegroundPriority:(BOOL)a3;
- (void)_sendSceneToBackground;
- (void)_updateSceneSettingsForRequester:(id)a3;
- (void)_updateTraitCollection;
- (void)addSceneRequester:(id)a3;
- (void)removeSceneRequester:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidInvalidate:(id)a3;
- (void)setScene:(id)a3;
- (void)setTransaction:(id)a3;
- (void)transaction:(id)a3 didCreateScene:(id)a4;
- (void)willLaunchPeopleAppInBackground:(id)a3;
@end

@implementation PPLPeopleAppSceneManager

+ (id)sharedSceneManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PPLPeopleAppSceneManager_sharedSceneManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSceneManager_onceToken != -1) {
    dispatch_once(&sharedSceneManager_onceToken, block);
  }
  v2 = (void *)sharedSceneManager___sharedSceneManager;
  return v2;
}

void __46__PPLPeopleAppSceneManager_sharedSceneManager__block_invoke()
{
  id v0 = objc_alloc((Class)objc_opt_class());
  id v3 = +[PPLPeopleAppLauncher sharedLauncher];
  uint64_t v1 = [v0 initWithAppLauncher:v3];
  v2 = (void *)sharedSceneManager___sharedSceneManager;
  sharedSceneManager___sharedSceneManager = v1;
}

- (PPLPeopleAppSceneManager)initWithAppLauncher:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPLPeopleAppSceneManager;
  v6 = [(PPLPeopleAppSceneManager *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    sceneRequesters = v6->_sceneRequesters;
    v6->_sceneRequesters = (NSPointerArray *)v7;

    objc_storeStrong((id *)&v6->_peopleAppLauncher, a3);
    [(PPLPeopleAppLauncher *)v6->_peopleAppLauncher setDelegate:v6];
  }

  return v6;
}

- (void)addSceneRequester:(id)a3
{
  id v9 = a3;
  v4 = [(PPLPeopleAppSceneManager *)self sceneRequesters];
  id v5 = [v4 allObjects];

  if (([v5 containsObject:v9] & 1) == 0)
  {
    v6 = [v5 lastObject];
    uint64_t v7 = [(PPLPeopleAppSceneManager *)self scene];
    [v6 sceneManager:self didRevokeOwnershipOfScene:v7];

    v8 = [(PPLPeopleAppSceneManager *)self sceneRequesters];
    [v8 addPointer:v9];

    [(PPLPeopleAppSceneManager *)self _configureSceneForRequester:v9];
  }
}

- (void)removeSceneRequester:(id)a3
{
  id v11 = a3;
  v4 = [(PPLPeopleAppSceneManager *)self sceneRequesters];
  id v5 = [v4 allObjects];
  uint64_t v6 = [v5 indexOfObject:v11];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 removePointerAtIndex:v6];
    id v7 = [v5 lastObject];

    if (v7 == v11)
    {
      v8 = [(PPLPeopleAppSceneManager *)self scene];
      [v11 sceneManager:self didRevokeOwnershipOfScene:v8];
    }
    if ([v4 count])
    {
      id v9 = [v4 allObjects];
      objc_super v10 = [v9 lastObject];

      [(PPLPeopleAppSceneManager *)self _configureSceneForRequester:v10];
    }
    else
    {
      [(PPLPeopleAppSceneManager *)self _sendSceneToBackground];
    }
  }
}

- (void)willLaunchPeopleAppInBackground:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PPLPeopleAppSceneManager_willLaunchPeopleAppInBackground___block_invoke;
  block[3] = &unk_264612988;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__PPLPeopleAppSceneManager_willLaunchPeopleAppInBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureSceneForRequester:0];
}

- (void)transaction:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  [(PPLPeopleAppSceneManager *)self setScene:v5];
  uint64_t v6 = [(PPLPeopleAppSceneManager *)self scene];
  [v6 addObserver:self];

  id v7 = [(PPLPeopleAppSceneManager *)self sceneRequesters];
  v8 = [v7 allObjects];
  id v9 = [v8 lastObject];

  [v9 sceneManager:self didGrantOwnershipOfScene:v5];
}

- (void)sceneDidInvalidate:(id)a3
{
  v4 = [(PPLPeopleAppSceneManager *)self scene];
  [v4 removeObserver:self];

  id v5 = [(PPLPeopleAppSceneManager *)self transaction];
  [v5 removeObserver:self];

  uint64_t v6 = PPLPeopleViewServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_2225B4000, v6, OS_LOG_TYPE_DEFAULT, "scene invalidated", v19, 2u);
  }

  id v7 = [(PPLPeopleAppSceneManager *)self sceneRequesters];
  v8 = [v7 allObjects];
  id v9 = [v8 lastObject];

  if (v9)
  {
    objc_super v10 = PPLPeopleViewServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PPLPeopleAppSceneManager sceneDidInvalidate:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v18 = [(PPLPeopleAppSceneManager *)self scene];
    [v9 sceneManager:self didRevokeOwnershipOfScene:v18];

    [(PPLPeopleAppSceneManager *)self setScene:0];
    [(PPLPeopleAppSceneManager *)self _createSceneForRequester:v9];
  }
  else
  {
    [(PPLPeopleAppSceneManager *)self setScene:0];
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a6;
  v8 = PPLPeopleViewServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[PPLPeopleAppSceneManager scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:]";
    _os_log_impl(&dword_2225B4000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 shouldDismiss])
  {
    id v9 = [(PPLPeopleAppSceneManager *)self sceneRequesters];
    objc_super v10 = [v9 allObjects];
    uint64_t v11 = [v10 lastObject];

    if (v11)
    {
      uint64_t v12 = [(PPLPeopleAppSceneManager *)self scene];
      [v11 sceneManager:self sceneDidRequestDismissal:v12];
    }
  }
}

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a4;
  if ([v4 event] == 1 || objc_msgSend(v4, "event") == 2)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F3F4A8];
    FBSProcessResourceAllowanceMakeWithRealTimeInterval();
    id v7 = [v6 provisionWithAllowance:v11];
    v8 = (void *)MEMORY[0x263F3F4B8];
    v12[0] = v7;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v5 = [v8 policyWithProvisions:v9];
  }
  return v5;
}

- (void)_launchPeopleAppIfNeededWithForegroundPriority:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPLPeopleAppSceneManager *)self peopleAppLauncher];
  [v4 launchPeopleAppIfNeededWithForegroundPriority:v3];
}

- (void)_configureSceneForRequester:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PPLPeopleAppSceneManager *)self scene];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(PPLPeopleAppSceneManager *)self scene],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isValid],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = PPLPeopleViewServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = [(PPLPeopleAppSceneManager *)self scene];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_2225B4000, v9, OS_LOG_TYPE_DEFAULT, "Current scene %@", (uint8_t *)&v11, 0xCu);
    }
    [(PPLPeopleAppSceneManager *)self _updateSceneSettingsForRequester:v4];
  }
  else
  {
    [(PPLPeopleAppSceneManager *)self _createSceneForRequester:v4];
  }
}

- (void)_createSceneForRequester:(id)a3
{
  id v4 = a3;
  [(PPLPeopleAppSceneManager *)self _launchPeopleAppIfNeededWithForegroundPriority:1];
  if (v4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = [(PPLPeopleAppSceneManager *)self transaction];

  if (v6)
  {
    id v7 = PPLPeopleViewServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2225B4000, v7, OS_LOG_TYPE_DEFAULT, "another active transaction", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    id v7 = [v4 personURL];
    char v8 = PPLPeopleViewServiceLog();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_2225B4000, v9, OS_LOG_TYPE_DEFAULT, "setup new transaction", (uint8_t *)&buf, 2u);
      }

      id v10 = objc_alloc(MEMORY[0x263F3F428]);
      int v11 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.PeopleViewService"];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke;
      v65[3] = &unk_2646129D8;
      v65[4] = self;
      v65[5] = v5;
      uint64_t v12 = (void *)[v10 initWithProcessIdentity:v11 executionContextProvider:v65];
      [(PPLPeopleAppSceneManager *)self setTransaction:v12];

      uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 addObserver:self selector:sel__updateTraitCollection name:*MEMORY[0x263F1D890] object:0];

      objc_initWeak(&buf, self);
      uint64_t v14 = [(PPLPeopleAppSceneManager *)self transaction];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_2;
      v61[3] = &unk_264612A28;
      objc_copyWeak(&v63, &buf);
      id v15 = v4;
      id v62 = v15;
      [v14 setCompletionBlock:v61];

      uint64_t v16 = objc_alloc_init(PPLPeopleEntitySceneSpecification);
      id v17 = objc_alloc_init([(PPLPeopleEntitySceneSpecification *)v16 settingsClass]);
      v18 = (void *)[v17 mutableCopy];

      v19 = [MEMORY[0x263F3F430] mainConfiguration];
      [v18 setDisplayConfiguration:v19];

      v20 = [MEMORY[0x263F1C920] mainScreen];
      v21 = [v20 traitCollection];
      objc_msgSend(v18, "setUserInterfaceStyle:", objc_msgSend(v21, "userInterfaceStyle"));

      [v18 setForeground:v4 != 0];
      if (v4)
      {
        [v15 initialSceneFrame];
        double v23 = v22;
        double v25 = v24;
        [v15 sceneSafeAreaInsetPortrait];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
      }
      else
      {
        v41 = [MEMORY[0x263F1C920] mainScreen];
        [v41 bounds];
        double v23 = v42;
        double v25 = v43;
        double v27 = *MEMORY[0x263F1D1C0];
        double v29 = *(double *)(MEMORY[0x263F1D1C0] + 8);
        double v31 = *(double *)(MEMORY[0x263F1D1C0] + 16);
        double v33 = *(double *)(MEMORY[0x263F1D1C0] + 24);
      }
      objc_msgSend(v18, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), v23, v25);
      [v18 setInterfaceOrientationMode:0];
      [v18 setInterfaceOrientation:1];
      [v18 setForcedStatusBarForegroundTransparent:1];
      objc_msgSend(v18, "setSafeAreaInsetsPortrait:", v27, v29, v31, v33);
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_18;
      v59[3] = &unk_264612A50;
      id v44 = v18;
      id v60 = v44;
      v45 = (void (**)(void, void))MEMORY[0x223C9B060](v59);
      v45[2](v45, 1);
      v45[2](v45, 2);
      v45[2](v45, 4);
      v45[2](v45, 3);
      v58 = v16;
      id v46 = objc_alloc_init([(UIApplicationSceneSpecification *)v16 clientSettingsClass]);
      v47 = (void *)[v46 mutableCopy];

      [v47 setStatusBarHidden:1];
      [v47 setSupportedInterfaceOrientations:2];
      v48 = (void *)[objc_alloc(MEMORY[0x263F3F490]) initWithSpecification:v16];
      [v48 setSettings:v44];
      [v48 setClientSettings:v47];
      v57 = v44;
      v49 = (void *)[objc_alloc(MEMORY[0x263F1C820]) initWithURL:v7];
      id v50 = objc_alloc_init([(UIApplicationSceneSpecification *)v58 transitionContextClass]);
      v51 = [MEMORY[0x263EFFA08] setWithObject:v49];
      [v50 setActions:v51];

      v52 = [(PPLPeopleAppSceneManager *)self transaction];
      v53 = [MEMORY[0x263F3F4D0] identityForIdentifier:@"com.apple.PeopleViewService" workspaceIdentifier:@"com.apple.PeopleViewService"];
      [v52 updateSceneWithIdentity:v53 parameters:v48 transitionContext:v50];

      v54 = [(PPLPeopleAppSceneManager *)self transaction];
      [v54 addObserver:self];

      v55 = [(PPLPeopleAppSceneManager *)self transaction];
      [v55 begin];

      v56 = [(PPLPeopleAppSceneManager *)self transaction];
      [v56 setWaitsForSceneCommits:1];

      objc_destroyWeak(&v63);
      objc_destroyWeak(&buf);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PPLPeopleAppSceneManager _createSceneForRequester:](v9, v34, v35, v36, v37, v38, v39, v40);
      }
    }
  }
}

id __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setWatchdogProvider:*(void *)(a1 + 32)];
  [v2 setLaunchIntent:*(void *)(a1 + 40)];
  return v2;
}

void __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setTransaction:0];
  uint64_t v5 = PPLPeopleViewServiceLog();
  uint64_t v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_2225B4000, v6, OS_LOG_TYPE_DEFAULT, "successfully created transaction", v15, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    dispatch_time_t v14 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_13;
    block[3] = &unk_264612A00;
    block[4] = WeakRetained;
    id v17 = *(id *)(a1 + 32);
    dispatch_after(v14, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createSceneForRequester:*(void *)(a1 + 40)];
}

uint64_t __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_18(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setDefaultStatusBarHeight:a2 forOrientation:0.0];
}

- (void)_updateTraitCollection
{
  id v2 = [(PPLPeopleAppSceneManager *)self scene];
  [v2 updateSettingsWithBlock:&__block_literal_global_1];
}

void __50__PPLPeopleAppSceneManager__updateTraitCollection__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 isUISubclass])
  {
    id v2 = (void *)MEMORY[0x263F1C920];
    id v3 = v6;
    id v4 = [v2 mainScreen];
    uint64_t v5 = [v4 traitCollection];
    objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  }
}

- (void)_updateSceneSettingsForRequester:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PPLPeopleAppSceneManager *)self scene];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__PPLPeopleAppSceneManager__updateSceneSettingsForRequester___block_invoke;
  v9[3] = &unk_264612A98;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__PPLPeopleAppSceneManager__updateSceneSettingsForRequester___block_invoke_2;
  v7[3] = &unk_264612AC0;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [v5 performUpdate:v9 withCompletion:v7];
}

void __61__PPLPeopleAppSceneManager__updateSceneSettingsForRequester___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [v11 setForeground:1];
  if ([v11 isUISubclass])
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = v11;
    [v6 initialSceneFrame];
    objc_msgSend(v7, "setFrame:");
    [*(id *)(a1 + 32) sceneSafeAreaInsetPortrait];
    objc_msgSend(v7, "setSafeAreaInsetsPortrait:");
  }
  id v8 = [*(id *)(a1 + 32) personURL];
  if (v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F1C820]) initWithURL:v8];
    id v10 = [MEMORY[0x263EFFA08] setWithObject:v9];
    [v5 setActions:v10];
  }
}

void __61__PPLPeopleAppSceneManager__updateSceneSettingsForRequester___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sceneRequesters];
  id v3 = [v2 allObjects];
  id v6 = [v3 lastObject];

  if (v6 == *(id *)(a1 + 40))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 scene];
    [v6 sceneManager:v4 didGrantOwnershipOfScene:v5];
  }
}

- (void)_sendSceneToBackground
{
  id v3 = PPLPeopleViewServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2225B4000, v3, OS_LOG_TYPE_DEFAULT, "Sending people app to the background", v5, 2u);
  }

  id v4 = [(PPLPeopleAppSceneManager *)self scene];
  [v4 updateSettingsWithTransitionBlock:&__block_literal_global_29];
}

uint64_t __50__PPLPeopleAppSceneManager__sendSceneToBackground__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (FBApplicationUpdateScenesTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSPointerArray)sceneRequesters
{
  return self->_sceneRequesters;
}

- (PPLPeopleAppLauncher)peopleAppLauncher
{
  return self->_peopleAppLauncher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleAppLauncher, 0);
  objc_storeStrong((id *)&self->_sceneRequesters, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)sceneDidInvalidate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createSceneForRequester:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end