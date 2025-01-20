@interface SBSAccidentalActivationMitigationSessionServiceServer
- (BSServiceConnection)_connection;
- (SBAccidentalActivationMitigationHostSession)_hostSession;
- (SBSAccidentalActivationMitigationSessionServiceServer)initWithDelegate:(id)a3;
- (SBSAccidentalActivationMitigationSessionServiceServerDelegate)delegate;
- (void)_setConnection:(id)a3;
- (void)_setHostSession:(id)a3;
- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3;
- (void)activateSessionForBundleIdentifier:(id)a3 durationNum:(id)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)requestSessionCancellation;
- (void)setDelegate:(id)a3;
- (void)startServer;
@end

@implementation SBSAccidentalActivationMitigationSessionServiceServer

- (SBSAccidentalActivationMitigationSessionServiceServer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSAccidentalActivationMitigationSessionServiceServer;
  v5 = [(SBSAccidentalActivationMitigationSessionServiceServer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)startServer
{
  BSDispatchQueueAssertMain();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SBSAccidentalActivationMitigationSessionServiceServer_startServer__block_invoke;
  v5[3] = &unk_1E566D910;
  v5[4] = self;
  v3 = [MEMORY[0x1E4F50BC8] listenerWithConfigurator:v5];
  connectionListener = self->_connectionListener;
  self->_connectionListener = v3;

  [(BSServiceConnectionListener *)self->_connectionListener activate];
}

void __68__SBSAccidentalActivationMitigationSessionServiceServer_startServer__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = +[SBSAccidentalActivationMitigationSessionServiceSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSAccidentalActivationMitigationSessionServiceServer;
  [(SBSAccidentalActivationMitigationSessionServiceServer *)&v3 dealloc];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11 = [(SBSAccidentalActivationMitigationSessionServiceServer *)self _hostSession];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    v15 = [v9 remoteProcess];
    v16 = [v15 auditToken];
    if ([v16 hasEntitlement:@"com.apple.springboard.private.accidental-mitigation-session-service"])
    {
    }
    else
    {
      v17 = [v9 remoteProcess];
      v18 = [v17 auditToken];
      int v19 = [v18 hasEntitlement:@"com.apple.springboard.private.3CAD882F-D615-43E4-89A9-34720441BC23"];

      if (!v19)
      {
        v13 = SBLogCameraCaptureAccidentalActivationMitigationSession();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_5;
        }
        *(_DWORD *)buf = 138412290;
        id v29 = v9;
        v14 = "Invalidating connection because client process is missing required entitlement %@.";
        goto LABEL_4;
      }
    }
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke;
    v24 = &unk_1E566B438;
    v25 = self;
    objc_copyWeak(&v26, &location);
    [v9 configureConnection:&v21];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    BSDispatchMain();
    -[SBSAccidentalActivationMitigationSessionServiceServer _setConnection:](self, "_setConnection:", v9, v20, 3221225472, __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_19, &unk_1E566BCE8, self, v21, v22, v23, v24, v25);
    [v9 activate];
    objc_destroyWeak(&v26);
    goto LABEL_10;
  }
  v13 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v9;
    v14 = "Refuse to connect since there is already a host session %@.";
LABEL_4:
    _os_log_impl(&dword_18FBC5000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
  }
LABEL_5:

  [v9 invalidate];
LABEL_10:
  objc_destroyWeak(&location);
}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSAccidentalActivationMitigationSessionServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[SBSAccidentalActivationMitigationSessionServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setInterruptionHandler:&__block_literal_global_49];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_12;
  id v9 = &unk_1E566DA30;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  uint64_t v10 = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:&v6];
  [v3 setActivationHandler:^(void) {
    __block_literal_global_17();
} completion:v6, v7, v8, v9];
  objc_destroyWeak(&v11);
}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Interrupted connection %@", (uint8_t *)&v4, 0xCu);
  }
}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_DEFAULT, "Invalidated connection %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    [*(id *)(a1 + 32) _setConnection:0];
    id v6 = WeakRetained;
    BSDispatchMain();
  }
}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_13(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _hostSession];
  uint64_t v3 = [v2 state];

  if (!v3)
  {
    int v4 = [*(id *)(a1 + 32) delegate];
    [v4 serverDidRequestDestroyNonActiveHostSessionUponDisconnection:*(void *)(a1 + 40)];

    id v5 = *(void **)(a1 + 32);
    [v5 _setHostSession:0];
  }
}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_2_15(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Activated connection %@", (uint8_t *)&v4, 0xCu);
  }
}

void __99__SBSAccidentalActivationMitigationSessionServiceServer_listener_didReceiveConnection_withContext___block_invoke_19(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 serverDidRequestCreateHostSessionUponConnection:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _setHostSession:v3];
  [v3 addObserver:*(void *)(a1 + 32)];
}

- (BSServiceConnection)_connection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setConnection:(id)a3
{
  id v7 = a3;
  id v5 = [(SBSAccidentalActivationMitigationSessionServiceServer *)self _connection];
  char v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_connection, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (SBAccidentalActivationMitigationHostSession)_hostSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = self->_lock_host_session;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setHostSession:(id)a3
{
  id v7 = a3;
  id v5 = [(SBSAccidentalActivationMitigationSessionServiceServer *)self _hostSession];
  char v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_host_session, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3
{
  id v10 = a3;
  int v4 = [(SBSAccidentalActivationMitigationSessionServiceServer *)self _hostSession];
  int v5 = [v10 isEqual:v4];

  if (v5)
  {
    char v6 = [(SBSAccidentalActivationMitigationSessionServiceServer *)self _connection];
    id v7 = [v6 remoteTarget];
    id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:[v10 state]];
    [v7 mitigationSessionDidTransitionToState:v8];

    if (([v10 state] & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [(SBSAccidentalActivationMitigationSessionServiceServer *)self _setHostSession:0];
      uint64_t v9 = [(SBSAccidentalActivationMitigationSessionServiceServer *)self _connection];
      [v9 invalidate];
    }
  }
}

- (void)activateSessionForBundleIdentifier:(id)a3 durationNum:(id)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  [a4 doubleValue];
  uint64_t v10 = v9;
  id v11 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_18FBC5000, v11, OS_LOG_TYPE_DEFAULT, "Activate host session with bundle identifier: %@ with duration: %f and accidental activation mitigation session cancellation policy: %@", buf, 0x20u);
  }

  v14 = v7;
  id v12 = v8;
  id v13 = v7;
  BSDispatchMain();
}

void __169__SBSAccidentalActivationMitigationSessionServiceServer_activateSessionForBundleIdentifier_durationNum_accidentalActivationMitigationSessionCancellationPolicyClassName___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _hostSession];
  [v2 activateSessionForBundleIdentifier:*(void *)(a1 + 40) duration:*(void *)(a1 + 48) accidentalActivationMitigationSessionCancellationPolicyClassName:*(double *)(a1 + 56)];
}

- (void)requestSessionCancellation
{
  id v2 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FBC5000, v2, OS_LOG_TYPE_DEFAULT, "Request session cancellation", buf, 2u);
  }

  BSDispatchMain();
}

void __83__SBSAccidentalActivationMitigationSessionServiceServer_requestSessionCancellation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _hostSession];
  [v1 requestSessionCancellation];
}

- (SBSAccidentalActivationMitigationSessionServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSAccidentalActivationMitigationSessionServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_lock_host_session, 0);
}

@end