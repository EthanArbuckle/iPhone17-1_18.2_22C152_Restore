@interface SBApplicationSupportServiceRequestContext
+ (BOOL)shouldOverrideClientInitialization:(id)a3;
+ (id)_hostProcessForProcess:(id)a3;
+ (id)hostingApplicationBundleIDForPid:(int)a3;
+ (void)initializationContextForClient:(id)a3 completion:(id)a4;
- (SBApplicationSupportServiceRequestContext)initWithApplication:(id)a3 launchDisplayConfiguration:(id)a4;
- (SBApplicationSupportServiceRequestContext)initWithApplication:(id)a3 launchDisplayConfiguration:(id)a4 persistenceIdentifierProvider:(id)a5 sceneIdentityProvider:(id)a6 sceneIdentityTokenProvider:(id)a7;
- (SBApplicationSupportServiceRequestContext)initWithClient:(id)a3 host:(id)a4;
- (id)_main_appPersistenceIDProvider;
- (id)_main_appSceneIdentityProvider;
- (id)_main_applicationInitializationContext;
- (id)_main_deviceContext;
- (id)_main_displayContextForDisplayConfiguration:(id)a3;
- (id)_main_effectiveApplicationForCompatibility;
- (id)_main_embeddedDisplayContext;
- (id)_main_launchDisplayContext;
- (id)_main_persistenceIDs;
- (id)_main_sceneIdentityTokenProvider;
- (int64_t)_main_effectiveClassicMode;
- (unint64_t)_main_effectiveScreenType;
- (void)_main_applyClassicModeLiesIfNecessaryToDisplayContext:(id)a3;
- (void)applicationInitializationContextWithCompletion:(id)a3;
@end

@implementation SBApplicationSupportServiceRequestContext

- (id)_main_applicationInitializationContext
{
  BSDispatchQueueAssertMain();
  v3 = [(SBApplicationSupportServiceRequestContext *)self _main_embeddedDisplayContext];
  v4 = [(SBApplicationSupportServiceRequestContext *)self _main_launchDisplayContext];
  v5 = [(SBApplicationSupportServiceRequestContext *)self _main_deviceContext];
  v6 = [(SBApplicationSupportServiceRequestContext *)self _main_persistenceIDs];
  id v7 = objc_alloc(MEMORY[0x1E4FB33F8]);
  v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  v10 = (void *)[v7 initWithMainDisplayContext:v3 launchDisplayContext:v4 deviceContext:v5 persistedSceneIdentifiers:v6 supportAppSceneRequests:(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  app = self->_app;
  if (app)
  {
    v12 = [(SBApplication *)app info];
    char v13 = [v12 supportsMultiwindow];

    if ((v13 & 1) == 0)
    {
      v14 = [(SBApplicationSupportServiceRequestContext *)self _main_appSceneIdentityProvider];
      v15 = (void *)[v14 newSceneIdentityForApplication:self->_app];

      v16 = [(SBApplicationSupportServiceRequestContext *)self _main_sceneIdentityTokenProvider];
      v17 = (void *)[v16 newSceneIdentityTokenForIdentity:v15];

      [v10 setDefaultSceneToken:v17];
    }
  }

  return v10;
}

- (id)_main_launchDisplayContext
{
  BSDispatchQueueAssertMain();
  v3 = [(SBApplicationSupportServiceRequestContext *)self _main_effectiveApplicationForCompatibility];
  launchDisplayConfiguration = self->_launchDisplayConfiguration;
  if (launchDisplayConfiguration
    && ([(FBSDisplayConfiguration *)launchDisplayConfiguration isMainRootDisplay] & 1) == 0
    && [v3 supportsChamoisOnExternalDisplay]
    && !_SBApplicationClassicModeIsClassic([(SBApplicationSupportServiceRequestContext *)self _main_effectiveClassicMode]))
  {
    v5 = [(SBApplicationSupportServiceRequestContext *)self _main_displayContextForDisplayConfiguration:self->_launchDisplayConfiguration];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_main_persistenceIDs
{
  BSDispatchQueueAssertMain();
  if (self->_app)
  {
    v3 = [(SBApplicationSupportServiceRequestContext *)self _main_appPersistenceIDProvider];
    v4 = [(SBApplication *)self->_app bundleIdentifier];
    v5 = [v3 _persistenceIdentifiersForBundleIdentifier:v4 onlyIncludeLaunchableIdentifiers:0];
    v6 = [v5 set];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_main_embeddedDisplayContext
{
  BSDispatchQueueAssertMain();
  v3 = objc_msgSend(MEMORY[0x1E4FB3408], "sb_embeddedDisplayDefaultContext");
  [(SBApplicationSupportServiceRequestContext *)self _main_applyClassicModeLiesIfNecessaryToDisplayContext:v3];
  return v3;
}

- (id)_main_effectiveApplicationForCompatibility
{
  BSDispatchQueueAssertMain();
  extensionContainingApp = self->_extensionContainingApp;
  if (!extensionContainingApp)
  {
    extensionContainingApp = self->_app;
    if (!extensionContainingApp) {
      extensionContainingApp = self->_hostApp;
    }
  }
  return extensionContainingApp;
}

- (void)_main_applyClassicModeLiesIfNecessaryToDisplayContext:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(SBApplicationSupportServiceRequestContext *)self _main_effectiveClassicMode];
  if (_SBApplicationClassicModeIsClassic(v4))
  {
    v5 = [v10 displayConfiguration];
    v6 = +[SBApplication restrictedClassicModeDisplayConfigurationForDisplayConfiguration:v5 classicMode:v4];

    [v10 setDisplayConfiguration:v6];
    unint64_t v7 = [(SBApplicationSupportServiceRequestContext *)self _main_effectiveScreenType];
    v8 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_displayEdgeInfoForScreenTypeConsideringCurrentDevice:", v7);
    [v10 setDisplayEdgeInfo:v8];

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB33E8], "sb_displayShapeForScreenType:", v7);
    [v10 setExclusionArea:v9];
  }
}

- (id)_main_deviceContext
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [(SBApplicationSupportServiceRequestContext *)self _main_effectiveClassicMode];
  if (_SBApplicationClassicModeIsClassic(v3))
  {
    uint64_t v4 = [MEMORY[0x1E4FB3400] defaultContext];
    v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && SBApplicationClassicModeRepresentsPhone(v3)) {
      [v4 setDeviceInfoValue:&unk_1F334AAD8 forKey:*MEMORY[0x1E4FB34D0]];
    }
    if (SBFEffectiveHomeButtonType() == 2 && !SBApplicationClassicModeExpectsRoundedCorners(v3))
    {
      [v4 setDeviceInfoValue:&unk_1F334AAF0 forKey:*MEMORY[0x1E4FB34E8]];
      [v4 setDeviceInfoValue:&unk_1F334AAD8 forKey:*MEMORY[0x1E4FB34D8]];
    }
    else
    {
      unint64_t v7 = NSNumber;
      [(SBApplicationSupportServiceRequestContext *)self _main_effectiveScreenType];
      SBHDisplayCornerRadiusForScreenType();
      v8 = objc_msgSend(v7, "numberWithDouble:");
      [v4 setDeviceInfoValue:v8 forKey:*MEMORY[0x1E4FB34D8]];
    }
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB33D8], "sb_defaultContext");
  }
  return v4;
}

- (int64_t)_main_effectiveClassicMode
{
  BSDispatchQueueAssertMain();
  app = self->_app;
  if (app)
  {
    uint64_t v4 = app;
LABEL_4:
    extensionContainingApp = self->_extensionContainingApp;
    if (extensionContainingApp) {
      uint64_t v6 = -[SBApplication _classicModeForHostingExtensionContainedInApplication:](v4, extensionContainingApp);
    }
    else {
      uint64_t v6 = [(SBApplication *)v4 _classicMode];
    }
    int64_t v7 = (int64_t)v6;

    return v7;
  }
  uint64_t v4 = self->_hostApp;
  if (v4) {
    goto LABEL_4;
  }
  int64_t result = (int64_t)self->_extensionContainingApp;
  if (result)
  {
    return (int64_t)-[SBApplication _classicModeForHostingExtensionContainedInThisApplicationInUnknownHostingHierarchy]((id *)result);
  }
  return result;
}

- (id)_main_appPersistenceIDProvider
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = self->_preferredAppPersistenceIDProvider;
  if (!v3)
  {
    uint64_t v3 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  }
  return v3;
}

- (id)_main_sceneIdentityTokenProvider
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = self->_preferredSceneIdentityTokenProvider;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F62490] sharedInstance];
  }
  return v3;
}

- (id)_main_appSceneIdentityProvider
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = self->_preferredAppSceneIdentityProvider;
  if (!v3)
  {
    uint64_t v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  }
  return v3;
}

void __92__SBApplicationSupportServiceRequestContext_applicationInitializationContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) bundleIdentifier];
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Generating initialization context on main thread for: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "_main_applicationInitializationContext");
  uint64_t v6 = *(void *)(a1 + 32);
  int64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  objc_sync_exit(v2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)initializationContextForClient:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  BSDispatchQueueAssertNotMain();
  if (!v7)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"SBApplicationSupportServiceRequestContext.m", 135, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  uint64_t v9 = [v7 pid];
  id v10 = [MEMORY[0x1E4F963F8] identifierWithPid:v9];
  uint64_t v11 = [MEMORY[0x1E4F963E8] handleForIdentifier:v10 error:0];
  if (!v11
    || !+[SBSystemUIScenesCoordinator shouldHandleSceneRequestsForProcess:v11 withOptions:0])
  {
    char v13 = +[SBApplicationController sharedInstance];
    v14 = [v13 applicationWithPid:v9];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      v17 = [v7 bundleIdentifier];
      id v16 = [v13 applicationWithBundleIdentifier:v17];
    }
    v18 = SBLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v16 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      id v31 = v19;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Fetching initialization context for: %{public}@", buf, 0xCu);
    }
    if (v16)
    {
      if (([v16 isSpotlight] & 1) != 0 || objc_msgSend(v16, "isPaperBoard"))
      {
        objc_msgSend(MEMORY[0x1E4FB3390], "sb_embeddedDisplayDefaultContext");
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v20);
LABEL_21:

        goto LABEL_22;
      }
      id v20 = [v16 _initializationRequestContext];
      [v20 applicationInitializationContextWithCompletion:v8];
      v25 = SBLogClassicMode();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        +[SBApplicationSupportServiceRequestContext initializationContextForClient:completion:](v9, v16, v25);
      }
    }
    else
    {
      v21 = [MEMORY[0x1E4F62448] sharedInstance];
      v22 = [v21 processForPID:v9];

      v23 = [(id)objc_opt_class() _hostProcessForProcess:v22];
      v27 = (void *)[objc_alloc((Class)a1) initWithClient:v22 host:v23];
      v29 = v8;
      v28 = v22;
      id v24 = v23;
      v25 = v22;
      id v20 = v27;
      BSDispatchMain();
    }
    goto LABEL_21;
  }
  v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v7;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Providing init context for SystemUI Scene client: %{public}@", buf, 0xCu);
  }

  char v13 = objc_msgSend(MEMORY[0x1E4FB3390], "sb_embeddedDisplayDefaultContextForSystemUIScenes");
  v8[2](v8, v13);
LABEL_22:
}

- (void)applicationInitializationContextWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_selfLock_applicationInitializationContext)
  {
    uint64_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(SBApplication *)v5->_app bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Returning cached initialization context for %{public}@", buf, 0xCu);
    }
    id v8 = v5->_selfLock_applicationInitializationContext;
  }
  else
  {
    id v8 = 0;
  }
  objc_sync_exit(v5);

  if (v8)
  {
    v4[2](v4, v8);
  }
  else
  {
    uint64_t v9 = v4;
    BSDispatchMain();
  }
}

- (SBApplicationSupportServiceRequestContext)initWithApplication:(id)a3 launchDisplayConfiguration:(id)a4 persistenceIdentifierProvider:(id)a5 sceneIdentityProvider:(id)a6 sceneIdentityTokenProvider:(id)a7
{
  id v13 = a3;
  id v22 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBApplicationSupportServiceRequestContext.m", 189, @"Invalid parameter not satisfying: %@", @"app" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)SBApplicationSupportServiceRequestContext;
  v17 = [(SBApplicationSupportServiceRequestContext *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_app, a3);
    objc_storeStrong((id *)&v18->_launchDisplayConfiguration, a4);
    objc_storeStrong((id *)&v18->_preferredAppPersistenceIDProvider, a5);
    objc_storeStrong((id *)&v18->_preferredAppSceneIdentityProvider, a6);
    objc_storeStrong((id *)&v18->_preferredSceneIdentityTokenProvider, a7);
  }

  return v18;
}

- (SBApplicationSupportServiceRequestContext)initWithApplication:(id)a3 launchDisplayConfiguration:(id)a4
{
  return [(SBApplicationSupportServiceRequestContext *)self initWithApplication:a3 launchDisplayConfiguration:a4 persistenceIdentifierProvider:0 sceneIdentityProvider:0 sceneIdentityTokenProvider:0];
}

+ (BOOL)shouldOverrideClientInitialization:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F963F8], "identifierWithPid:", objc_msgSend(a3, "pid"));
  uint64_t v4 = [MEMORY[0x1E4F963E8] handleForIdentifier:v3 error:0];
  if (v4) {
    BOOL v5 = +[SBSystemUIScenesCoordinator shouldHandleSceneRequestsForProcess:v4 withOptions:0];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)hostingApplicationBundleIDForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [MEMORY[0x1E4F62448] sharedInstance];
  uint64_t v6 = [v5 processForPID:v3];

  id v7 = [a1 _hostProcessForProcess:v6];
  if (objc_msgSend(v7, "sb_isProbablyUIApplication"))
  {
    id v8 = objc_msgSend(v7, "sb_bundleIdentifierWithFallback");
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_hostProcessForProcess:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if ([v3 isExtensionProcess])
  {
    uint64_t v4 = v3;
    do
    {
      id v5 = v4;
      uint64_t v4 = [v5 hostProcess];
    }
    while (([v4 isExtensionProcess] & 1) != 0);
  }

  return v4;
}

void __87__SBApplicationSupportServiceRequestContext_initializationContextForClient_completion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) applicationInitializationContextWithCompletion:*(void *)(a1 + 56)];
  id v3 = SBLogClassicMode();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4)
  {
    id v5 = SBLogClassicMode();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __87__SBApplicationSupportServiceRequestContext_initializationContextForClient_completion___block_invoke_cold_1(a1, v2, v5);
    }
  }
}

- (SBApplicationSupportServiceRequestContext)initWithClient:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 pid];
  pid_t v9 = getpid();
  if (v8 == v9)
  {
    id v10 = FBSystemAppBundleID();

    if (v7 == v6) {
      goto LABEL_13;
    }
  }
  else
  {
    id v10 = objc_msgSend(v7, "sb_bundleIdentifierWithFallback");
    char v11 = objc_msgSend(v7, "sb_isProbablyUIApplication");
    if (v7) {
      char v12 = v11;
    }
    else {
      char v12 = 1;
    }

    id v13 = 0;
    if (v7 == v6 || (v12 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (![v6 isExtensionProcess])
  {
LABEL_13:
    id v13 = 0;
    goto LABEL_16;
  }
  id v14 = objc_msgSend(v6, "sb_bundleIdentifierWithFallback");
  id v15 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v14];
  id v16 = [v15 containingBundle];

  v17 = [v16 bundleType];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F22390]];

  if (v18)
  {
    id v13 = [v16 bundleIdentifier];
  }
  else
  {
    id v13 = 0;
  }

LABEL_16:
  v19 = +[SBApplicationController sharedInstance];
  id v20 = [v19 applicationWithBundleIdentifier:v10];
  uint64_t v21 = [v19 applicationWithBundleIdentifier:v13];
  id v22 = (void *)v21;
  if (v8 == v9 || v20 || v21)
  {
    v27.receiver = self;
    v27.super_class = (Class)SBApplicationSupportServiceRequestContext;
    id v24 = [(SBApplicationSupportServiceRequestContext *)&v27 init];
    v25 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_hostApp, v20);
      objc_storeStrong((id *)&v25->_extensionContainingApp, v22);
      v25->_hostIsSpringBoard = v8 == v9;
    }
    self = v25;
    objc_super v23 = self;
  }
  else
  {
    objc_super v23 = 0;
  }

  return v23;
}

- (unint64_t)_main_effectiveScreenType
{
  BSDispatchQueueAssertMain();
  id v3 = [(SBApplicationSupportServiceRequestContext *)self _main_effectiveApplicationForCompatibility];
  if (v3) {
    uint64_t v4 = -[SBApplication _screenTypeForClassicMode:]((uint64_t)v3, [(SBApplicationSupportServiceRequestContext *)self _main_effectiveClassicMode]);
  }
  else {
    uint64_t v4 = SBHScreenTypeForCurrentDevice();
  }
  unint64_t v5 = v4;

  return v5;
}

- (id)_main_displayContextForDisplayConfiguration:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB3408], "sb_defaultContextForDisplayConfiguration:");
    [(SBApplicationSupportServiceRequestContext *)self _main_applyClassicModeLiesIfNecessaryToDisplayContext:v4];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSceneIdentityTokenProvider, 0);
  objc_storeStrong((id *)&self->_preferredAppSceneIdentityProvider, 0);
  objc_storeStrong((id *)&self->_preferredAppPersistenceIDProvider, 0);
  objc_storeStrong((id *)&self->_launchDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_selfLock_applicationInitializationContext, 0);
  objc_storeStrong((id *)&self->_extensionContainingApp, 0);
  objc_storeStrong((id *)&self->_hostApp, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

+ (void)initializationContextForClient:(NSObject *)a3 completion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 bundleIdentifier];
  OUTLINED_FUNCTION_0_17();
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "Using initialization context for client with pid: %ld app: %@", v6, 0x16u);
}

void __87__SBApplicationSupportServiceRequestContext_initializationContextForClient_completion___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = SBApplicationClassicModeDescription(objc_msgSend(*a2, "_main_effectiveClassicMode"));
  OUTLINED_FUNCTION_0_17();
  uint64_t v10 = v4;
  __int16 v11 = v7;
  uint64_t v12 = v5;
  __int16 v13 = v7;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "Generated initialization context for client with pid: %ld clientProcess: %@ hostProcess: %@ classicMode: %@", v9, 0x2Au);
}

@end