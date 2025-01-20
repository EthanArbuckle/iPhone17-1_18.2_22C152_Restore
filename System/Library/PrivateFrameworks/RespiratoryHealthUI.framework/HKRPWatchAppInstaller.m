@interface HKRPWatchAppInstaller
- (HKRPWatchAppInstaller)init;
- (HKRPWatchAppInstaller)initWithDevice:(id)a3 watchAppAvailability:(id)a4 installAppsProviding:(id)a5;
- (void)checkIfAppCanBeInstalledWithCompletion:(id)a3;
- (void)installAppWithCompletion:(id)a3;
@end

@implementation HKRPWatchAppInstaller

- (HKRPWatchAppInstaller)init
{
  v3 = [MEMORY[0x263F57730] sharedInstance];
  v4 = [v3 getActivePairedDevice];
  v5 = (void *)[objc_alloc(MEMORY[0x263F0A8F0]) initWithBundleID:@"com.apple.NanoOxygenSaturation.watchkitapp"];
  v6 = objc_alloc_init(_HKRPDefaultWatchAppsInstallProvider);
  v7 = [(HKRPWatchAppInstaller *)self initWithDevice:v4 watchAppAvailability:v5 installAppsProviding:v6];

  return v7;
}

- (HKRPWatchAppInstaller)initWithDevice:(id)a3 watchAppAvailability:(id)a4 installAppsProviding:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKRPWatchAppInstaller;
  v12 = [(HKRPWatchAppInstaller *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    objc_storeStrong((id *)&v13->_watchAppAvailability, a4);
    objc_storeStrong((id *)&v13->_installAppsProviding, a5);
  }

  return v13;
}

- (void)checkIfAppCanBeInstalledWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  device = self->_device;
  if (device)
  {
    watchAppAvailability = self->_watchAppAvailability;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__HKRPWatchAppInstaller_checkIfAppCanBeInstalledWithCompletion___block_invoke;
    v11[3] = &unk_264C4DBA0;
    v11[4] = self;
    id v12 = v4;
    [(HKWatchAppAvailability *)watchAppAvailability appInstallStateOnWatch:device completion:v11];
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      *(_DWORD *)buf = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      v16 = @"com.apple.NanoOxygenSaturation.watchkitapp";
      id v10 = v14;
      _os_log_impl(&dword_2352DD000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping check to see if %{public}@ is installed. No device specified.", buf, 0x16u);
    }
    v5[2](v5, 0, 0);
  }
}

void __64__HKRPWatchAppInstaller_checkIfAppCanBeInstalledWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  switch(a2)
  {
    case 2:
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x263F09950];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        int v20 = 138543618;
        id v21 = (id)objc_opt_class();
        __int16 v22 = 2114;
        v23 = @"com.apple.NanoOxygenSaturation.watchkitapp";
        id v15 = v21;
        v16 = "[%{public}@] %{public}@ cannot be installed, its already installed.";
LABEL_11:
        _os_log_impl(&dword_2352DD000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x16u);
      }
LABEL_12:
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v10 + 16);
      uint64_t v12 = 0;
LABEL_13:
      id v18 = 0;
      goto LABEL_17;
    case 1:
      _HKInitializeLogging();
      uint64_t v17 = (void *)*MEMORY[0x263F09950];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v17;
        int v20 = 138543618;
        id v21 = (id)objc_opt_class();
        __int16 v22 = 2114;
        v23 = @"com.apple.NanoOxygenSaturation.watchkitapp";
        id v15 = v21;
        v16 = "[%{public}@] %{public}@ cannot be installed, its already installing.";
        goto LABEL_11;
      }
      goto LABEL_12;
    case 0:
      _HKInitializeLogging();
      v6 = (void *)*MEMORY[0x263F09950];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v6;
        int v20 = 138543618;
        id v21 = (id)objc_opt_class();
        __int16 v22 = 2114;
        v23 = @"com.apple.NanoOxygenSaturation.watchkitapp";
        id v9 = v21;
        _os_log_impl(&dword_2352DD000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ can be installed.", (uint8_t *)&v20, 0x16u);
      }
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v10 + 16);
      uint64_t v12 = 1;
      goto LABEL_13;
  }
  _HKInitializeLogging();
  v19 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
    __64__HKRPWatchAppInstaller_checkIfAppCanBeInstalledWithCompletion___block_invoke_cold_1(a1, v19, (uint64_t)v5);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v10 + 16);
  uint64_t v12 = 0;
  id v18 = v5;
LABEL_17:
  v11(v10, v12, v18, v7);
}

- (void)installAppWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F25518]) initWithBundleID:@"com.apple.NanoOxygenSaturation.watchkitapp"];
  installAppsProviding = self->_installAppsProviding;
  device = self->_device;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__HKRPWatchAppInstaller_installAppWithCompletion___block_invoke;
  v9[3] = &unk_264C4DBC8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(HKRPWatchInstallAppsProviding *)installAppsProviding installApp:v5 onPairedDevice:device withCompletionHandler:v9];
}

void __50__HKRPWatchAppInstaller_installAppWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x263F09950];
  uint64_t v7 = *MEMORY[0x263F09950];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 8);
      id v10 = v6;
      id v11 = [v9 pairingID];
      int v13 = 138543874;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      v16 = @"com.apple.NanoOxygenSaturation.watchkitapp";
      __int16 v17 = 2114;
      id v18 = v11;
      _os_log_impl(&dword_2352DD000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduled install of %{public}@ on %{public}@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__HKRPWatchAppInstaller_installAppWithCompletion___block_invoke_cold_1(a1, v6, (uint64_t)v5);
    }
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v12();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installAppsProviding, 0);
  objc_storeStrong((id *)&self->_watchAppAvailability, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __64__HKRPWatchAppInstaller_checkIfAppCanBeInstalledWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = objc_opt_class();
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = v6;
  id v9 = [v7 pairingID];
  int v10 = 138543874;
  id v11 = v6;
  __int16 v12 = 2114;
  int v13 = v9;
  __int16 v14 = 2114;
  uint64_t v15 = a3;
  _os_log_error_impl(&dword_2352DD000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] There was an error querying for app availability on device %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
}

void __50__HKRPWatchAppInstaller_installAppWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = objc_opt_class();
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = v6;
  id v9 = [v7 pairingID];
  int v10 = 138544130;
  id v11 = v6;
  __int16 v12 = 2114;
  int v13 = @"com.apple.NanoOxygenSaturation.watchkitapp";
  __int16 v14 = 2114;
  uint64_t v15 = v9;
  __int16 v16 = 2114;
  uint64_t v17 = a3;
  _os_log_error_impl(&dword_2352DD000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to schedule install of %{public}@ on %{public}@: %{public}@", (uint8_t *)&v10, 0x2Au);
}

@end