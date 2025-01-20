@interface SBAccidentalActivationMitigationHostSession
- (BOOL)mitigatedEarly;
- (NSString)bundleIdentifier;
- (NSString)cancellationPolicyClassName;
- (SBAccidentalActivationMitigationHostSession)initWithSuppressionManager:(id)a3;
- (SBAccidentalActivationMitigationHostSessionDelegate)delegate;
- (double)duration;
- (int64_t)state;
- (void)activateSessionForBundleIdentifier:(id)a3 duration:(double)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5;
- (void)addObserver:(id)a3;
- (void)idleTimerDidExpire:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestSessionCancellation;
- (void)requestSessionMitigateEarly;
- (void)setDelegate:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SBAccidentalActivationMitigationHostSession

- (SBAccidentalActivationMitigationHostSession)initWithSuppressionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAccidentalActivationMitigationHostSession;
  v6 = [(SBAccidentalActivationMitigationHostSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suppressionManager, a3);
  }

  return v7;
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
        v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        v8 = self->_observers;
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

- (void)setState:(int64_t)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  int64_t state = self->_state;
  if (state != a3)
  {
    self->_int64_t state = a3;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v7 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v11++) accidentalActivationMitigationSessionStateDidChange:self];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v9);
    }

    switch(a3)
    {
      case 0:
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"SBAccidentalActivationMitigationHostSession.m" lineNumber:71 description:@"Accidental activation mitigation session should never become initial again."];

        v13 = SBLogCameraCaptureAccidentalActivationMitigationSession();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = NSStringFromSBSAccidentalActivationMitigationSessionState();
          v15 = NSStringFromSBCaptureButtonSuppressionState([(SBCaptureButtonSuppressionManager *)self->_suppressionManager suppressionState]);
          *(_DWORD *)buf = 138412802;
          v45 = self;
          __int16 v46 = 2112;
          v47 = v14;
          __int16 v48 = 2112;
          double v49 = *(double *)&v15;
          _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state: %@; due to mitiga"
            "tion session initialized, VO=%@;",
            buf,
            0x20u);
        }
        goto LABEL_31;
      case 1:
        if (state)
        {
          v36 = [MEMORY[0x1E4F28B00] currentHandler];
          [v36 handleFailureInMethod:a2 object:self file:@"SBAccidentalActivationMitigationHostSession.m" lineNumber:76 description:@"Accidental activation mitigation session must be initial before becoming active."];
        }
        v16 = SBLogCameraCaptureAccidentalActivationMitigationSession();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = NSStringFromSBSAccidentalActivationMitigationSessionState();
          double duration = self->_duration;
          v19 = NSStringFromSBCaptureButtonSuppressionState([(SBCaptureButtonSuppressionManager *)self->_suppressionManager suppressionState]);
          *(_DWORD *)buf = 138413058;
          v45 = self;
          __int16 v46 = 2112;
          v47 = v17;
          __int16 v48 = 2048;
          double v49 = duration;
          __int16 v50 = 2112;
          v51 = v19;
          _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state: %@; start timer w"
            "ith duration: %f due to mitigation session become active, VO=%@; screen is dimmed",
            buf,
            0x2Au);
        }
        v20 = [(SBAccidentalActivationMitigationHostSession *)self delegate];
        id v39 = 0;
        [v20 hostSessionDidRequestStartMitigation:self outIdleTimer:&v39];
        v21 = (SBIdleTimer *)v39;

        idleTimer = self->_idleTimer;
        self->_idleTimer = v21;
        v13 = v21;

        [(SBIdleTimer *)self->_idleTimer addIdleTimerObserver:self];
        goto LABEL_31;
      case 2:
        if (state != 1)
        {
          v37 = [MEMORY[0x1E4F28B00] currentHandler];
          [v37 handleFailureInMethod:a2 object:self file:@"SBAccidentalActivationMitigationHostSession.m" lineNumber:85 description:@"Accidental activation mitigation session must be active before becoming cancelled."];
        }
        uint64_t v23 = objc_opt_class();
        v13 = SBSafeCast(v23, self->_cancellationPolicy);
        v24 = SBLogCameraCaptureAccidentalActivationMitigationSession();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (!v25) {
            goto LABEL_30;
          }
          v26 = NSStringFromSBSAccidentalActivationMitigationSessionState();
          v27 = NSStringFromSBAccidentalActivationMitigationSessionCancellationEventType([v13 eventType]);
          v28 = [v13 eventReason];
          v29 = NSStringFromSBCaptureButtonSuppressionState([(SBCaptureButtonSuppressionManager *)self->_suppressionManager suppressionState]);
          *(_DWORD *)buf = 138413314;
          v45 = self;
          __int16 v46 = 2112;
          v47 = v26;
          __int16 v48 = 2112;
          double v49 = *(double *)&v27;
          __int16 v50 = 2112;
          v51 = v28;
          __int16 v52 = 2112;
          v53 = v29;
          _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state: %@; cancelled due"
            " to event type: %@; reason: %@, VO=%@; screen is un-dimmed, camera running",
            buf,
            0x34u);
        }
        else
        {
          if (!v25) {
            goto LABEL_30;
          }
          v26 = NSStringFromSBSAccidentalActivationMitigationSessionState();
          v27 = NSStringFromSBCaptureButtonSuppressionState([(SBCaptureButtonSuppressionManager *)self->_suppressionManager suppressionState]);
          *(_DWORD *)buf = 138412802;
          v45 = self;
          __int16 v46 = 2112;
          v47 = v26;
          __int16 v48 = 2112;
          double v49 = *(double *)&v27;
          _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state :%@; cancelled due"
            " to custom cancellation policy, VO=%@; screen is un-dimmed, camera running",
            buf,
            0x20u);
        }

LABEL_30:
        v34 = [(SBAccidentalActivationMitigationHostSession *)self delegate];
        [v34 hostSessionDidRequestCancelMitigation:self];

        [(SBIdleTimer *)self->_idleTimer removeIdleTimerObserver:self];
        v35 = self->_idleTimer;
        self->_idleTimer = 0;

LABEL_31:
        break;
      case 3:
        if (state != 1)
        {
          v38 = [MEMORY[0x1E4F28B00] currentHandler];
          [v38 handleFailureInMethod:a2 object:self file:@"SBAccidentalActivationMitigationHostSession.m" lineNumber:98 description:@"Accidental activation mitigation session must be active before becoming mitigated."];
        }
        v30 = SBLogCameraCaptureAccidentalActivationMitigationSession();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = NSStringFromSBSAccidentalActivationMitigationSessionState();
          v32 = NSStringFromSBCaptureButtonSuppressionState([(SBCaptureButtonSuppressionManager *)self->_suppressionManager suppressionState]);
          *(_DWORD *)buf = 138412802;
          v45 = self;
          __int16 v46 = 2112;
          v47 = v31;
          __int16 v48 = 2112;
          double v49 = *(double *)&v32;
          _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state: %@; stopping came"
            "ra due to mitigation session ended, VO=%@; camera stopped, device dimmed and locked",
            buf,
            0x20u);
        }
        v33 = [(SBAccidentalActivationMitigationHostSession *)self delegate];
        [v33 hostSessionDidRequestMitigateAccidentalActivation:self];

        [(SBIdleTimer *)self->_idleTimer removeIdleTimerObserver:self];
        v13 = self->_idleTimer;
        self->_idleTimer = 0;
        goto LABEL_31;
      default:
        return;
    }
  }
}

- (void)activateSessionForBundleIdentifier:(id)a3 duration:(double)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5
{
  id v14 = a3;
  uint64_t v9 = (NSString *)a5;
  BSDispatchQueueAssertMain();
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
  self->_double duration = a4;
  cancellationPolicyClassName = self->_cancellationPolicyClassName;
  self->_cancellationPolicyClassName = v9;
  uint64_t v11 = v9;

  self->_mitigatedEarly = 0;
  if (v11) {
    v12 = (SBAccidentalActivationMitigationSessionCancellationDefaultPolicy *)[objc_alloc(NSClassFromString(v11)) initWithSession:self];
  }
  else {
    v12 = [[SBAccidentalActivationMitigationSessionCancellationDefaultPolicy alloc] initWithSession:self suppressionManager:self->_suppressionManager];
  }
  cancellationPolicy = self->_cancellationPolicy;
  self->_cancellationPolicy = (SBSAccidentalActivationMitigationSessionCancellationPolicy *)v12;

  [(SBAccidentalActivationMitigationHostSession *)self setState:1];
}

- (void)requestSessionCancellation
{
  BSDispatchQueueAssertMain();
  [(SBAccidentalActivationMitigationHostSession *)self setState:2];
}

- (void)requestSessionMitigateEarly
{
  BSDispatchQueueAssertMain();
  self->_mitigatedEarly = 1;
  [(SBAccidentalActivationMitigationHostSession *)self setState:3];
}

- (void)idleTimerDidExpire:(id)a3
{
  if (self->_idleTimer == a3 && [(SBAccidentalActivationMitigationHostSession *)self state] == 1)
  {
    [(SBAccidentalActivationMitigationHostSession *)self setState:3];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (SBAccidentalActivationMitigationHostSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)cancellationPolicyClassName
{
  return self->_cancellationPolicyClassName;
}

- (BOOL)mitigatedEarly
{
  return self->_mitigatedEarly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationPolicyClassName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cancellationPolicy, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
}

@end