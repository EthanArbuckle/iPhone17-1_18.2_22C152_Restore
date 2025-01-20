@interface SBAccidentalActivationMitigationSessionCoordinator
- (BOOL)hasIdleTimerBehaviors;
- (SBAccidentalActivationMitigationHostSession)hostSession;
- (SBAccidentalActivationMitigationSessionCoordinator)initWithSuppressionManager:(id)a3 backlightController:(id)a4;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)serverDidRequestCreateHostSessionUponConnection:(id)a3;
- (void)_publishDidCancelMitigationSession:(id)a3;
- (void)_publishDidMitigateMitigationSession:(id)a3;
- (void)_publishDidStartMitigationSession:(id)a3;
- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3;
- (void)addObserver:(id)a3;
- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)hostSessionDidRequestCancelMitigation:(id)a3;
- (void)hostSessionDidRequestMitigateAccidentalActivation:(id)a3;
- (void)hostSessionDidRequestStartMitigation:(id)a3 outIdleTimer:(id *)a4;
- (void)removeObserver:(id)a3;
- (void)serverDidRequestDestroyNonActiveHostSessionUponDisconnection:(id)a3;
- (void)setHasIdleTimerBehaviors:(BOOL)a3;
- (void)setHostSession:(id)a3;
@end

@implementation SBAccidentalActivationMitigationSessionCoordinator

- (SBAccidentalActivationMitigationSessionCoordinator)initWithSuppressionManager:(id)a3 backlightController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBAccidentalActivationMitigationSessionCoordinator;
  v9 = [(SBAccidentalActivationMitigationSessionCoordinator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_suppressionManager, a3);
    objc_storeStrong((id *)&v10->_backlightController, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FA6988]) initWithDelegate:v10];
    server = v10->_server;
    v10->_server = (SBSAccidentalActivationMitigationSessionServiceServer *)v11;

    [(SBSAccidentalActivationMitigationSessionServiceServer *)v10->_server startServer];
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        id v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (v5) {
    [(NSHashTable *)self->_observers removeObject:v5];
  }
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (BOOL)hasIdleTimerBehaviors
{
  v2 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
  BOOL v3 = [v2 state] == 1;

  return v3;
}

- (SBAccidentalActivationMitigationHostSession)hostSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_host_session;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHostSession:(id)a3
{
  id v7 = a3;
  id v5 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
  char v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_host_session, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_publishDidStartMitigationSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accidentalActivationMitigationSessionCoordinator:self didStartMitigationSession:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_publishDidCancelMitigationSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accidentalActivationMitigationSessionCoordinator:self didCancelMitigationSession:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_publishDidMitigateMitigationSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 accidentalActivationMitigationSessionCoordinator:self didMitigateMitigationSession:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)hostSessionDidRequestStartMitigation:(id)a3 outIdleTimer:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v7 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    long long v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%@ for session %@ requested start camera capture mitigation", (uint8_t *)&v10, 0x16u);
  }

  [(SBBacklightController *)self->_backlightController addObserver:self];
  uint64_t v8 = +[SBWorkspace mainWorkspace];
  uint64_t v9 = [(SBAccidentalActivationMitigationSessionCoordinator *)self coordinatorRequestedIdleTimerBehavior:v8];
  *a4 = [v8 idleTimerProvider:self didProposeBehavior:v9 forReason:@"SBAccidentalActivationMitigationSessionActiveReason"];
  [(SBAccidentalActivationMitigationSessionCoordinator *)self _publishDidStartMitigationSession:v6];
}

- (void)hostSessionDidRequestCancelMitigation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ for session %@ requested camera capture mitigation cancellation", buf, 0x16u);
  }

  id v6 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  [v6 resetIdleTimerForReason:@"SBAccidentalActivationMitigationSessionCancelledReason"];

  objc_initWeak((id *)buf, self);
  uint64_t v7 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __92__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestCancelMitigation___block_invoke;
  long long v11 = &unk_1E6AF5AF0;
  objc_copyWeak(&v13, (id *)buf);
  __int16 v12 = self;
  [v7 configureSwitcherStateForAccidentalActivationMitigationSession:v4 completion:&v8];

  -[SBAccidentalActivationMitigationSessionCoordinator _publishDidCancelMitigationSession:](self, "_publishDidCancelMitigationSession:", v4, v8, v9, v10, v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __92__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestCancelMitigation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 32) removeObserver:WeakRetained];
}

- (void)hostSessionDidRequestMitigateAccidentalActivation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ for session %@ requested camera capture mitigation", buf, 0x16u);
  }

  if ([v4 mitigatedEarly])
  {
    id v6 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    [v6 resetIdleTimerForReason:@"SBAccidentalActivationMitigationSessionMitigatedReason"];
  }
  uint64_t v7 = +[SBLockScreenManager sharedInstance];
  int v8 = [v7 isUILocked];

  objc_initWeak((id *)buf, self);
  if (v8)
  {
    uint64_t v9 = +[SBLockScreenManager sharedInstance];
    int v10 = [v9 coverSheetViewController];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __104__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestMitigateAccidentalActivation___block_invoke;
    v18[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v19, (id *)buf);
    v18[4] = self;
    [v10 activateMainPageWithCompletion:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    long long v11 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __104__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestMitigateAccidentalActivation___block_invoke_2;
    v15 = &unk_1E6AF5AF0;
    objc_copyWeak(&v17, (id *)buf);
    __int16 v16 = self;
    [v11 configureSwitcherStateForAccidentalActivationMitigationSession:v4 completion:&v12];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  -[SBAccidentalActivationMitigationSessionCoordinator _publishDidMitigateMitigationSession:](self, "_publishDidMitigateMitigationSession:", v4, v12, v13, v14, v15);
}

void __104__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestMitigateAccidentalActivation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 32) removeObserver:WeakRetained];
}

void __104__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestMitigateAccidentalActivation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 32) removeObserver:WeakRetained];
}

- (id)serverDidRequestCreateHostSessionUponConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [[SBAccidentalActivationMitigationHostSession alloc] initWithSuppressionManager:self->_suppressionManager];
  [(SBAccidentalActivationMitigationSessionCoordinator *)self setHostSession:v5];
  id v6 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
  [v6 setDelegate:self];

  uint64_t v7 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
  [v7 addObserver:self];

  int v8 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
    int v11 = 134218498;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%p created host session %@ from server %@", (uint8_t *)&v11, 0x20u);
  }
  return v5;
}

- (void)serverDidRequestDestroyNonActiveHostSessionUponDisconnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
    int v8 = 134218498;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    int v11 = v6;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%p requested destruction of non-active host session %@ from server %@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v7 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
  [v7 removeObserver:self];

  [(SBAccidentalActivationMitigationSessionCoordinator *)self setHostSession:0];
}

- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3
{
  if (([a3 state] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(SBAccidentalActivationMitigationSessionCoordinator *)self setHostSession:0];
  }
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior behaviorWithDuration:3 mode:2 warnMode:2];
}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
  uint64_t v8 = [v7 state];

  if (a4 == 1 && v8 == 1)
  {
    uint64_t v9 = SBLogCameraCaptureAccidentalActivationMitigationSession();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
      int v12 = 138412290;
      id v13 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBAccidentalActivationMitigationSessionCoordinator mitigated session: %@ early for reason: backlight turned on", (uint8_t *)&v12, 0xCu);
    }
    int v11 = [(SBAccidentalActivationMitigationSessionCoordinator *)self hostSession];
    [v11 requestSessionMitigateEarly];
  }
}

- (void)setHasIdleTimerBehaviors:(BOOL)a3
{
  self->_hasIdleTimerBehaviors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_host_session, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end