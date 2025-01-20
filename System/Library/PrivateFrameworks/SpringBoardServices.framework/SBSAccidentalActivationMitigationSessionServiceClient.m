@interface SBSAccidentalActivationMitigationSessionServiceClient
- (BSServiceConnection)_connection;
- (SBSAccidentalActivationMitigationSessionServiceClient)init;
- (SBSAccidentalActivationMitigationSessionServiceClientDelegate)delegate;
- (id)_createConnection;
- (void)_setConnection:(id)a3;
- (void)activateSessionForBundleIdentifier:(id)a3 duration:(double)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5;
- (void)mitigationSessionDidTransitionToState:(id)a3;
- (void)requestSessionCancellation;
- (void)setDelegate:(id)a3;
@end

@implementation SBSAccidentalActivationMitigationSessionServiceClient

- (SBSAccidentalActivationMitigationSessionServiceClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBSAccidentalActivationMitigationSessionServiceClient;
  result = [(SBSAccidentalActivationMitigationSessionServiceClient *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)_createConnection
{
  objc_super v3 = (void *)MEMORY[0x1E4F50BB8];
  v4 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v5 = +[SBSAccidentalActivationMitigationSessionServiceSpecification identifier];
  v6 = [v3 endpointForMachName:v4 service:v5 instance:0];

  v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
  [(SBSAccidentalActivationMitigationSessionServiceClient *)self _setConnection:v7];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke;
  v9[3] = &unk_1E566B438;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  [v7 configureConnection:v9];
  [v7 activate];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SBSAccidentalActivationMitigationSessionServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[SBSAccidentalActivationMitigationSessionServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke_2;
  v8[3] = &unk_1E566B410;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke_3;
  v6[3] = &unk_1E566B410;
  objc_copyWeak(&v7, (id *)a1);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

void __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_DEFAULT, "Interrupted connection %@", (uint8_t *)&v6, 0xCu);
  }

  if (WeakRetained) {
    [v3 activate];
  }
}

void __74__SBSAccidentalActivationMitigationSessionServiceClient__createConnection__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_DEFAULT, "Invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  if (WeakRetained) {
    [WeakRetained _setConnection:0];
  }
}

- (BSServiceConnection)_connection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setConnection:(id)a3
{
  id v7 = a3;
  v5 = [(SBSAccidentalActivationMitigationSessionServiceClient *)self _connection];
  char v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_connection, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)activateSessionForBundleIdentifier:(id)a3 duration:(double)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SBSAccidentalActivationMitigationSessionServiceClient *)self _createConnection];
  id v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
  v11 = [(SBSAccidentalActivationMitigationSessionServiceClient *)self _connection];
  v12 = [v11 remoteTarget];
  [v12 activateSessionForBundleIdentifier:v9 durationNum:v13 accidentalActivationMitigationSessionCancellationPolicyClassName:v8];
}

- (void)requestSessionCancellation
{
  id v3 = [(SBSAccidentalActivationMitigationSessionServiceClient *)self _connection];
  v2 = [v3 remoteTarget];
  [v2 requestSessionCancellation];
}

- (void)mitigationSessionDidTransitionToState:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 integerValue];
  v4 = SBLogCameraCaptureAccidentalActivationMitigationSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSBSAccidentalActivationMitigationSessionState(v3);
    *(_DWORD *)buf = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "Mitigation session did transition to state %@", buf, 0xCu);
  }
  BSDispatchMain();
}

void __95__SBSAccidentalActivationMitigationSessionServiceClient_mitigationSessionDidTransitionToState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mitigationSessionServiceClient:*(void *)(a1 + 32) mitigationSessionDidTransitionToState:*(void *)(a1 + 40)];
}

- (SBSAccidentalActivationMitigationSessionServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSAccidentalActivationMitigationSessionServiceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

@end