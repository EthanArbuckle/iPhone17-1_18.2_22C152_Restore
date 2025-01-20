@interface SBContinuitySessionManager
+ (BOOL)areContinuitySessionsAllowed;
+ (id)sharedInstance;
+ (void)areContinuitySessionsAllowed;
- (NSString)description;
- (SBContinuitySession)currentSession;
- (SBOverridableUserInterfaceStyleProvider)overridableUserInterfaceStyleProvider;
- (SBUserInterfaceStyleProvider)userInterfaceStyleProvider;
- (id)_initWithService:(id)a3 userInterfaceStyleProvider:(id)a4 displayLayoutCoordinator:(id)a5 sessionFactory:(id)a6 externalDependencyProvider:(id)a7;
- (id)_registerSystemApertureScene:(id)a3 sessionConnectionCallout:(id)a4 sessionDisconnectionCallout:(id)a5;
- (id)newContinuitySession;
- (id)registerSystemApertureCurtainWindowScene:(id)a3;
- (id)registerSystemApertureWindowScene:(id)a3;
- (id)registerWindowScene:(id)a3;
- (void)_noteSceneOrSessionIsWaiting;
- (void)activate;
- (void)appendDescriptionToStream:(id)a3;
- (void)continuitySessionDidUpdateState:(id)a3;
- (void)dealloc;
- (void)newContinuitySession;
- (void)setCurrentSession:(id)a3;
@end

@implementation SBContinuitySessionManager

+ (id)sharedInstance
{
  if (sharedInstance___once_7 != -1) {
    dispatch_once(&sharedInstance___once_7, &__block_literal_global_210);
  }
  v2 = (void *)sharedInstance___sharedInstance_15;
  return v2;
}

void __44__SBContinuitySessionManager_sharedInstance__block_invoke()
{
  v9 = objc_alloc_init(SBOverridableUserInterfaceStyleProvider);
  v0 = (void *)MEMORY[0x1E4F62960];
  v1 = [MEMORY[0x1E4F62968] configurationForContinuityDisplay];
  v2 = [v0 publisherWithConfiguration:v1];

  v3 = [[SBContinuityDisplayLayoutCoordinator alloc] initWithRootPublisher:v2];
  v4 = objc_alloc_init(_SBContinuitySessionManagerExternalDependencyProvider);
  v5 = [SBContinuitySessionManager alloc];
  v6 = objc_alloc_init(SBContinuitySessionService);
  uint64_t v7 = [(SBContinuitySessionManager *)v5 _initWithService:v6 userInterfaceStyleProvider:v9 displayLayoutCoordinator:v3 sessionFactory:0 externalDependencyProvider:v4];
  v8 = (void *)sharedInstance___sharedInstance_15;
  sharedInstance___sharedInstance_15 = v7;
}

+ (BOOL)areContinuitySessionsAllowed
{
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
      goto LABEL_4;
    }
LABEL_7:
    v5 = SBLogContinuitySession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SBContinuitySessionManager areContinuitySessionsAllowed](v5);
    }
    goto LABEL_11;
  }
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4) {
    goto LABEL_7;
  }
LABEL_4:
  if (SBFIsOnenessAvailable()) {
    return 1;
  }
  v5 = SBLogContinuitySession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SBContinuitySessionManager areContinuitySessionsAllowed](v5);
  }
LABEL_11:

  return 0;
}

- (id)_initWithService:(id)a3 userInterfaceStyleProvider:(id)a4 displayLayoutCoordinator:(id)a5 sessionFactory:(id)a6 externalDependencyProvider:(id)a7
{
  id v13 = a3;
  id v24 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBContinuitySessionManager;
  v17 = [(SBContinuitySessionManager *)&v27 init];
  if (v17)
  {
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    waitingWindowScenes = v17->_waitingWindowScenes;
    v17->_waitingWindowScenes = v18;

    objc_storeStrong((id *)&v17->_sessionFactory, a6);
    objc_storeStrong((id *)&v17->_service, a3);
    objc_storeStrong((id *)&v17->_userInterfaceStyleProvider, a4);
    [v13 setSessionFactory:v17];
    objc_storeStrong((id *)&v17->_displayLayoutCoordinator, a5);
    objc_storeStrong((id *)&v17->_externalDependencyProvider, a7);
    objc_initWeak(&location, v17);
    id v20 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v25, &location);
    uint64_t v21 = BSLogAddStateCaptureBlockWithTitle();
    stateDumpHandle = v17->_stateDumpHandle;
    v17->_stateDumpHandle = (BSInvalidatable *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v17;
}

id __141__SBContinuitySessionManager__initWithService_userInterfaceStyleProvider_displayLayoutCoordinator_sessionFactory_externalDependencyProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1E4F4F720];
    v3 = [MEMORY[0x1E4F4F728] debugStyle];
    uint64_t v4 = [v2 descriptionForRootObject:WeakRetained withStyle:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateDumpHandle invalidate];
  stateDumpHandle = self->_stateDumpHandle;
  self->_stateDumpHandle = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBContinuitySessionManager;
  [(SBContinuitySessionManager *)&v4 dealloc];
}

- (void)activate
{
  [(SBContinuityDisplayLayoutCoordinator *)self->_displayLayoutCoordinator start];
  v3 = [(SBContinuityDisplayLayoutCoordinator *)self->_displayLayoutCoordinator rootPublisher];
  [v3 activate];

  service = self->_service;
  [(SBContinuitySessionService *)service activate];
}

- (SBUserInterfaceStyleProvider)userInterfaceStyleProvider
{
  return (SBUserInterfaceStyleProvider *)self->_userInterfaceStyleProvider;
}

- (SBOverridableUserInterfaceStyleProvider)overridableUserInterfaceStyleProvider
{
  return self->_userInterfaceStyleProvider;
}

- (id)registerWindowScene:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [v4 delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [v4 delegate];
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"ContinuityScene<%p>-Delegate<%p>", v4, v7);
  v9 = [v4 _FBSScene];
  v10 = [v9 hostHandle];

  v11 = [v10 auditToken];
  char v12 = [v11 hasEntitlement:*MEMORY[0x1E4FA7E90]];

  if ((v12 & 1) == 0)
  {
    v18 = SBLogContinuitySession();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SBContinuitySessionManager registerWindowScene:]((uint64_t)v8);
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    v18 = SBLogContinuitySession();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SBContinuitySessionManager registerWindowScene:]((uint64_t)v8, v4);
    }
LABEL_14:

    id v16 = 0;
    goto LABEL_15;
  }
  objc_initWeak(&location, self);
  id v13 = objc_alloc(MEMORY[0x1E4F4F838]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__SBContinuitySessionManager_registerWindowScene___block_invoke;
  v20[3] = &unk_1E6B04EE0;
  objc_copyWeak(&v24, &location);
  id v14 = v4;
  id v21 = v14;
  id v22 = v7;
  id v15 = v8;
  id v23 = v15;
  id v16 = (void *)[v13 initWithIdentifier:v15 forReason:@"SBContinuitySessionManager registerWindowScene:" invalidationBlock:v20];
  v17 = SBLogContinuitySession();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v15;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[SessionManager] Added waiting scene: %{public}@", buf, 0xCu);
  }

  [(NSMutableArray *)self->_waitingWindowScenes insertObject:v14 atIndex:0];
  [(SBContinuitySessionManager *)self _noteSceneOrSessionIsWaiting];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_15:

  return v16;
}

void __50__SBContinuitySessionManager_registerWindowScene___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[5] removeObject:*(void *)(a1 + 32)];
    id v4 = [*(id *)(a1 + 40) connectedSession];
    v5 = v4;
    if (v4)
    {
      [v4 noteSceneDisconnected:*(void *)(a1 + 32)];
    }
    else
    {
      char v6 = SBLogContinuitySession();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        int v8 = 138543362;
        uint64_t v9 = v7;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ unregistered but has no memory of its session", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (id)registerSystemApertureWindowScene:(id)a3
{
  return [(SBContinuitySessionManager *)self _registerSystemApertureScene:a3 sessionConnectionCallout:&__block_literal_global_64_0 sessionDisconnectionCallout:&__block_literal_global_66];
}

void __64__SBContinuitySessionManager_registerSystemApertureWindowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  [v7 noteSystemApertureSceneConnected:a3];
  [v6 didConnectToSession:v7];
}

uint64_t __64__SBContinuitySessionManager_registerSystemApertureWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteSystemApertureSceneDisconnected:");
}

- (id)registerSystemApertureCurtainWindowScene:(id)a3
{
  return [(SBContinuitySessionManager *)self _registerSystemApertureScene:a3 sessionConnectionCallout:&__block_literal_global_68_1 sessionDisconnectionCallout:&__block_literal_global_70_1];
}

void __71__SBContinuitySessionManager_registerSystemApertureCurtainWindowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  [v7 noteSystemApertureCurtainSceneConnected:a3];
  [v6 didConnectToSession:v7];
}

uint64_t __71__SBContinuitySessionManager_registerSystemApertureCurtainWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteSystemApertureCurtainSceneDisconnected:");
}

- (id)_registerSystemApertureScene:(id)a3 sessionConnectionCallout:(id)a4 sessionDisconnectionCallout:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, SBContinuitySession *, id, id))a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v11 = [v8 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [v8 delegate];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"SystemApertureScene<%p>-Delegate<%p>", v8, v13);
  id v15 = [v8 _FBSScene];
  id v16 = [v15 hostHandle];

  v17 = [v16 auditToken];
  char v18 = [v17 hasEntitlement:*MEMORY[0x1E4FA7E90]];

  if ((v18 & 1) == 0)
  {
    id v25 = SBLogContinuitySession();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SBContinuitySessionManager registerWindowScene:]((uint64_t)v14);
    }
    goto LABEL_11;
  }
  if (!v13)
  {
    id v25 = SBLogContinuitySession();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SBContinuitySessionManager _registerSystemApertureScene:sessionConnectionCallout:sessionDisconnectionCallout:]((uint64_t)v14, v8);
    }
LABEL_11:

    goto LABEL_21;
  }
  currentSession = self->_currentSession;
  if (currentSession)
  {
    id v20 = [(SBContinuitySession *)currentSession mainWindowScene];

    if (v20)
    {
      objc_initWeak(location, self);
      id v21 = objc_alloc(MEMORY[0x1E4F4F838]);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __112__SBContinuitySessionManager__registerSystemApertureScene_sessionConnectionCallout_sessionDisconnectionCallout___block_invoke;
      v28[3] = &unk_1E6B04F28;
      objc_copyWeak(&v33, location);
      id v22 = v13;
      id v29 = v22;
      id v32 = v10;
      id v23 = v8;
      id v30 = v23;
      id v31 = v14;
      id v24 = (void *)[v21 initWithIdentifier:v31 forReason:@"SBContinuitySessionManager registerSystemApertureWindowScene:" invalidationBlock:v28];
      v9[2](v9, self->_currentSession, v23, v22);

      objc_destroyWeak(&v33);
      objc_destroyWeak(location);
      goto LABEL_22;
    }
    v26 = SBLogContinuitySession();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v14;
      _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Attempted to register a scene %{public}@ the current session doesn't have a main window scene", (uint8_t *)location, 0xCu);
    }
  }
  else
  {
    v26 = SBLogContinuitySession();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v14;
      _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Attempted to register a scene %{public}@ but we don't have an active session", (uint8_t *)location, 0xCu);
    }
  }

LABEL_21:
  id v24 = 0;
LABEL_22:

  return v24;
}

void __112__SBContinuitySessionManager__registerSystemApertureScene_sessionConnectionCallout_sessionDisconnectionCallout___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [*(id *)(a1 + 32) connectedSession];
  id v4 = (void *)v3;
  if (WeakRetained)
  {
    if (v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      v5 = SBLogContinuitySession();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        int v7 = 138543362;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ unregistered but has no memory of its session", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)_noteSceneOrSessionIsWaiting
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableArray *)self->_waitingWindowScenes firstObject];
  if (v4)
  {
    currentSession = self->_currentSession;
    if (currentSession && ![(SBContinuitySession *)currentSession isSceneConnected])
    {
      [(NSMutableArray *)self->_waitingWindowScenes removeObject:v4];
      id v10 = SBLogContinuitySession();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v4 _sceneIdentifier];
        char v12 = [(SBContinuitySession *)self->_currentSession succinctDescription];
        int v16 = 138543618;
        uint64_t v17 = (uint64_t)v11;
        __int16 v18 = 2114;
        v19 = v12;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[SessionManager] Connecting window scene %{public}@ to session %{public}@", (uint8_t *)&v16, 0x16u);
      }
      id v13 = [v4 delegate];
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0
        || ([v4 delegate], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:self file:@"SBContinuitySessionManager.m" lineNumber:278 description:@"the waiting scene does not have a SBContinuitySessionSceneDelegate"];

        uint64_t v6 = 0;
      }
      [(SBContinuitySession *)self->_currentSession noteSceneConnected:v4];
      [v6 didConnectToSession:self->_currentSession];
    }
    else
    {
      uint64_t v6 = SBLogContinuitySession();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v4 _sceneIdentifier];
        uint64_t v8 = (void *)v7;
        uint64_t v9 = @"current session already has a scene";
        if (!self->_currentSession) {
          uint64_t v9 = @"current session is nil";
        }
        int v16 = 138543618;
        uint64_t v17 = v7;
        __int16 v18 = 2114;
        v19 = v9;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SessionManager] waiting scene %{public}@ can't connect to session %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBContinuitySessionManager_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __56__SBContinuitySessionManager_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"currentSession"];
  id result = (id)[*(id *)(*(void *)(a1 + 40) + 40) count];
  if (result) {
    return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"waitingWindowScenes"];
  }
  return result;
}

- (id)newContinuitySession
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = SBLogContinuitySession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SessionManager] Creating new session...", (uint8_t *)&v16, 2u);
  }

  sessionFactory = self->_sessionFactory;
  if (sessionFactory) {
    id v5 = (SBContinuitySession *)[(SBContinuitySessionFactory *)sessionFactory newContinuitySession];
  }
  else {
    id v5 = objc_alloc_init(SBContinuitySession);
  }
  uint64_t v6 = v5;
  currentSession = self->_currentSession;
  if (currentSession)
  {
    uint64_t v8 = SBLogContinuitySession();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBContinuitySessionManager newContinuitySession](&self->_currentSession);
    }

    [(SBContinuitySession *)self->_currentSession removeStateObserver:self];
    uint64_t v9 = self->_currentSession;
    id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:@"terminal.new-session-created"];
    [(SBContinuitySession *)v9 invalidateForReasons:v10];

    v11 = self->_currentSession;
    self->_currentSession = 0;
  }
  char v12 = [[SBContinuityDisplayLayoutPublisher alloc] initWithCoordinator:self->_displayLayoutCoordinator];
  [(SBContinuitySession *)v6 setDisplayLayoutPublisher:v12];
  id v13 = SBLogContinuitySession();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = [(SBContinuitySession *)v6 succinctDescription];
    int v16 = 138543362;
    uint64_t v17 = v14;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[SessionManager] Created new session: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  objc_storeStrong((id *)&self->_currentSession, v6);
  [(SBContinuitySession *)v6 addStateObserver:self];
  if (!currentSession) {
    [(SBContinuitySessionManagerExternalDependencyProviding *)self->_externalDependencyProvider noteContinuitySessionNegotiationStarted];
  }
  [(SBContinuitySessionManager *)self _noteSceneOrSessionIsWaiting];

  return v6;
}

- (void)continuitySessionDidUpdateState:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (SBContinuitySession *)a3;
  id v5 = v4;
  if (self->_currentSession == v4)
  {
    uint64_t v6 = [(SBContinuitySession *)v4 state];
    if (v6 == 11)
    {
      id v7 = SBLogContinuitySession();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(SBContinuitySession *)v5 succinctDescription];
        int v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[SessionManager] current session %{public}@ is invalid - cleaning up", (uint8_t *)&v10, 0xCu);
      }
      [(SBContinuitySession *)self->_currentSession removeStateObserver:self];
      currentSession = self->_currentSession;
      self->_currentSession = 0;

      [(SBContinuitySessionManagerExternalDependencyProviding *)self->_externalDependencyProvider noteContinuitySessionEnded];
    }
    else if (v6 == 10)
    {
      [(SBContinuitySessionManagerExternalDependencyProviding *)self->_externalDependencyProvider noteContinuitySessionIsActive];
    }
  }
}

- (SBContinuitySession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_externalDependencyProvider, 0);
  objc_storeStrong((id *)&self->_displayLayoutCoordinator, 0);
  objc_storeStrong((id *)&self->_waitingWindowScenes, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_sessionFactory, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

+ (void)areContinuitySessionsAllowed
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "continuity session not allowed - this device doesn't support this feature", v1, 2u);
}

- (void)registerWindowScene:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v2 = [a2 delegate];
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v5, v6, "Attempted to register a scene %{public}@ who's delegate doesn't conform to SBContinuitySessionSceneDelegate: %{public}@", v7, v8, v9, v10, v11);
}

- (void)registerWindowScene:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v1, v2, "Attempted to register a scene %{public}@ from an untrusted host: %{public}@", (void)v3, DWORD2(v3));
}

- (void)_registerSystemApertureScene:(uint64_t)a1 sessionConnectionCallout:(void *)a2 sessionDisconnectionCallout:.cold.1(uint64_t a1, void *a2)
{
  os_log_t v2 = [a2 delegate];
  long long v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v5, v6, "Attempted to register a scene %{public}@ who's delegate doesn't conform to SBContinuitySessionSceneDelegate: %{public}@", v7, v8, v9, v10, v11);
}

- (void)newContinuitySession
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v1, v2, "[SessionManager] Current session %{public}@ is being replaced by session %{public}@", (void)v3, DWORD2(v3));
}

@end