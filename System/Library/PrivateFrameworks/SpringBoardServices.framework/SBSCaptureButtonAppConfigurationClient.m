@interface SBSCaptureButtonAppConfigurationClient
- (BSServiceConnection)_connection;
- (SBSCaptureButtonAppConfigurationClient)init;
- (SBSCaptureButtonAppConfigurationClientDelegate)delegate;
- (void)_setConnection:(id)a3;
- (void)establishConnectionIfNeeded;
- (void)receiveInitialOrUpdatedAssociatedAppBundleIdentifier:(id)a3;
- (void)receiveInitialOrUpdatedEligibleApps:(id)a3;
- (void)setCurrentAssociatedAppUsingBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBSCaptureButtonAppConfigurationClient

- (SBSCaptureButtonAppConfigurationClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBSCaptureButtonAppConfigurationClient;
  result = [(SBSCaptureButtonAppConfigurationClient *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)establishConnectionIfNeeded
{
  objc_super v3 = [(SBSCaptureButtonAppConfigurationClient *)self _connection];

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F50BB8];
    v5 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v6 = +[SBSCaptureButtonAppConfigurationServiceSpecification identifier];
    v7 = [v4 endpointForMachName:v5 service:v6 instance:0];

    v8 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v7];
    [(SBSCaptureButtonAppConfigurationClient *)self _setConnection:v8];
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke;
    v9[3] = &unk_1E566B438;
    v9[4] = self;
    objc_copyWeak(&v10, &location);
    [v8 configureConnection:v9];
    [v8 activate];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SBSCaptureButtonAppConfigurationServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[SBSCaptureButtonAppConfigurationServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setInterruptionHandler:&__block_literal_global_15];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke_3;
  v6[3] = &unk_1E566B410;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
}

void __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationClient interrupted connection %@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __69__SBSCaptureButtonAppConfigurationClient_establishConnectionIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationClient invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  if (WeakRetained) {
    [WeakRetained _setConnection:0];
  }
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
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    int v4 = (BSServiceConnection *)v6;
    os_unfair_lock_lock(&self->_lock);
    lock_connection = self->_lock_connection;
    self->_lock_connection = v4;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)setCurrentAssociatedAppUsingBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(SBSCaptureButtonAppConfigurationClient *)self _connection];
  id v5 = [v6 remoteTarget];
  [v5 setCurrentAssociatedAppUsingBundleIdentifier:v4];
}

- (void)receiveInitialOrUpdatedAssociatedAppBundleIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationClient received initial or updated active app bundle identifier: %{public}@.", buf, 0xCu);
  }

  id v5 = v3;
  BSDispatchMain();
}

void __95__SBSCaptureButtonAppConfigurationClient_receiveInitialOrUpdatedAssociatedAppBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 captureButtonAppConfigurationClient:*(void *)(a1 + 32) receiveInitialOrUpdatedAssociatedAppBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)receiveInitialOrUpdatedEligibleApps:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationClient received initial or updated eligible apps: %{public}@.", buf, 0xCu);
  }

  id v5 = v3;
  BSDispatchMain();
}

void __78__SBSCaptureButtonAppConfigurationClient_receiveInitialOrUpdatedEligibleApps___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 captureButtonAppConfigurationClient:*(void *)(a1 + 32) receiveInitialOrUpdatedEligibleApps:*(void *)(a1 + 40)];
}

- (SBSCaptureButtonAppConfigurationClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSCaptureButtonAppConfigurationClientDelegate *)WeakRetained;
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