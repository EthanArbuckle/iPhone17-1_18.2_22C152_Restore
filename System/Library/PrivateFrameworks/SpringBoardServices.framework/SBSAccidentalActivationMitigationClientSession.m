@interface SBSAccidentalActivationMitigationClientSession
- (SBSAccidentalActivationMitigationClientSession)initWithBundleIdentifier:(id)a3;
- (SBSAccidentalActivationMitigationClientSession)initWithBundleIdentifier:(id)a3 callOutQueue:(id)a4;
- (int64_t)state;
- (void)activateSessionWithDuration:(double)a3 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a4;
- (void)addObserver:(id)a3;
- (void)mitigationSessionServiceClient:(id)a3 mitigationSessionDidTransitionToState:(int64_t)a4;
- (void)removeObserver:(id)a3;
- (void)requestSessionCancellation;
- (void)setState:(int64_t)a3;
@end

@implementation SBSAccidentalActivationMitigationClientSession

- (SBSAccidentalActivationMitigationClientSession)initWithBundleIdentifier:(id)a3
{
  return [(SBSAccidentalActivationMitigationClientSession *)self initWithBundleIdentifier:a3 callOutQueue:MEMORY[0x1E4F14428]];
}

- (SBSAccidentalActivationMitigationClientSession)initWithBundleIdentifier:(id)a3 callOutQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSAccidentalActivationMitigationClientSession;
  v9 = [(SBSAccidentalActivationMitigationClientSession *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_alloc_init(SBSAccidentalActivationMitigationSessionServiceClient);
    client = v10->_client;
    v10->_client = v11;

    [(SBSAccidentalActivationMitigationSessionServiceClient *)v10->_client setDelegate:v10];
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_callOutQueue, a4);
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  uint64_t v4 = BSDispatchQueueAssert();
  if (v8)
  {
    uint64_t v4 = [(NSHashTable *)self->_observers containsObject:v8];
    if ((v4 & 1) == 0)
    {
      observers = self->_observers;
      if (!observers)
      {
        v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        id v7 = self->_observers;
        self->_observers = v6;

        observers = self->_observers;
      }
      uint64_t v4 = [(NSHashTable *)observers addObject:v8];
    }
  }
  MEMORY[0x1F41817F8](v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssert();
  if (v5) {
    [(NSHashTable *)self->_observers removeObject:v5];
  }
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)activateSessionWithDuration:(double)a3 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssert();
  id v7 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    v9 = self;
    __int16 v10 = 2048;
    double v11 = a3;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_18FBC5000, v7, OS_LOG_TYPE_DEFAULT, "%@ activated session with duration: %f and cancellation policy: %@", (uint8_t *)&v8, 0x20u);
  }

  [(SBSAccidentalActivationMitigationSessionServiceClient *)self->_client activateSessionForBundleIdentifier:self->_bundleIdentifier duration:v6 accidentalActivationMitigationSessionCancellationPolicyClassName:a3];
}

- (void)requestSessionCancellation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  v3 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "%@ requested session cancellation", (uint8_t *)&v5, 0xCu);
  }

  if ([(SBSAccidentalActivationMitigationClientSession *)self state] == 1)
  {
    [(SBSAccidentalActivationMitigationSessionServiceClient *)self->_client requestSessionCancellation];
  }
  else
  {
    uint64_t v4 = SBLogCameraCaptureAccidentalActivationMitigationSession();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = self;
      _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "%@ is not able to cancel the session because it is not active", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_state = a3;
    os_unfair_lock_unlock(p_lock);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            callOutQueue = self->_callOutQueue;
            v13[0] = MEMORY[0x1E4F143A8];
            v13[1] = 3221225472;
            v13[2] = __59__SBSAccidentalActivationMitigationClientSession_setState___block_invoke;
            v13[3] = &unk_1E566BB08;
            v13[4] = v11;
            v13[5] = self;
            dispatch_async(callOutQueue, v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __59__SBSAccidentalActivationMitigationClientSession_setState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accidentalActivationMitigationSessionStateDidChange:*(void *)(a1 + 40)];
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  return lock_state;
}

- (void)mitigationSessionServiceClient:(id)a3 mitigationSessionDidTransitionToState:(int64_t)a4
{
  BSDispatchQueueAssertMain();
  [(SBSAccidentalActivationMitigationClientSession *)self setState:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end