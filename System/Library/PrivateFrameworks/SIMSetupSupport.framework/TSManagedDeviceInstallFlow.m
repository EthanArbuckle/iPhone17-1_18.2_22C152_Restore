@interface TSManagedDeviceInstallFlow
- (TSManagedDeviceInstallFlow)initWith:(BOOL)a3 fallbackToActivationCode:(BOOL)a4 ignoreTransport:(BOOL)a5;
- (id)firstViewController;
- (void)firstViewController;
- (void)firstViewController:(id)a3;
- (void)handleProvisioningWatchdogExpiry;
- (void)hasCellularConnection:(id)a3;
- (void)invokeCompletionWithPlanInstallResult:(unint64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)planItemsUpdated:(id)a3 planListError:(id)a4;
@end

@implementation TSManagedDeviceInstallFlow

- (TSManagedDeviceInstallFlow)initWith:(BOOL)a3 fallbackToActivationCode:(BOOL)a4 ignoreTransport:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TSManagedDeviceInstallFlow;
  v8 = [(TSSIMSetupFlow *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_waitForService = a3;
    v8->_fallbackToActivationCode = a4;
    v8->_ignoreTransport = a5;
    id firstViewCompletion = v8->_firstViewCompletion;
    v8->_id firstViewCompletion = 0;

    v9->_startMonitoringConnection = 0;
  }
  return v9;
}

- (id)firstViewController
{
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    [(TSManagedDeviceInstallFlow *)v2 firstViewController];
  }

  return 0;
}

- (void)firstViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v5 = +[TSCellularPlanManagerCache sharedInstance];
      [v5 setDelegate:self];

      uint64_t v6 = (void *)MEMORY[0x22A683B20](v4);
      id firstViewCompletion = self->_firstViewCompletion;
      self->_id firstViewCompletion = v6;

      objc_initWeak(&location, self);
      uint64_t v8 = +[TSCellularPlanManagerCache sharedInstance];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke;
      v17[3] = &unk_264828288;
      objc_copyWeak(&v19, &location);
      v17[4] = self;
      id v18 = v4;
      [v8 planItemsWithCompletion:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v9 = _TSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TSManagedDeviceInstallFlow firstViewController:](v9, v10, v11, v12, v13, v14, v15, v16);
      }

      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    v20 = _TSLogDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_21;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v38 = v3;
    char v8 = 0;
    uint64_t v9 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isInstalling", v38) & 1) != 0
          || ([v11 plan],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              int v13 = [v12 status],
              v12,
              v13 == 14))
        {
          uint64_t v16 = _TSLogDomain();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v45 = "-[TSManagedDeviceInstallFlow firstViewController:]_block_invoke";
            _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "Skip since one plan is installing... @%s", buf, 0xCu);
          }

          WeakRetained[91] = 1;
          if (!*(void *)(*(void *)(a1 + 32) + 104))
          {
            uint64_t v17 = objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 120.0);
            uint64_t v18 = *(void *)(a1 + 32);
            id v19 = *(void **)(v18 + 104);
            *(void *)(v18 + 104) = v17;
          }
          id v3 = v38;
          goto LABEL_24;
        }
        uint64_t v14 = [v11 plan];
        BOOL v15 = [v14 status] == 0;

        v8 |= v15;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v7) {
        continue;
      }
      break;
    }

    id v3 = v38;
    if (!WeakRetained[90])
    {
      if ((v8 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_26;
    }
LABEL_23:
    v28 = +[TSCoreTelephonyClientCache sharedInstance];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_23;
    v39[3] = &unk_264828260;
    v39[4] = *(void *)(a1 + 32);
    [v28 pendingInstallItemsWithCompletion:v39];

    goto LABEL_24;
  }

  if (WeakRetained[90]) {
    goto LABEL_23;
  }
LABEL_25:
  if (!+[TSUtilities isWifiAvailable])
  {
    v29 = +[TSCoreTelephonyClientCache sharedInstance];
    char v30 = [v29 usingBootstrapDataService];

    if ((v30 & 1) == 0)
    {
      v20 = _TSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_cold_2(v20, v31, v32, v33, v34, v35, v36, v37);
      }
      goto LABEL_21;
    }
    goto LABEL_23;
  }
LABEL_26:
  v20 = _TSLogDomain();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[TSManagedDeviceInstallFlow firstViewController:]_block_invoke";
    _os_log_impl(&dword_227A17000, v20, OS_LOG_TYPE_DEFAULT, "Skip since having data connection @%s", buf, 0xCu);
  }
LABEL_21:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_24:
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3
    && ([v3 plans],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    uint64_t v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_handleProvisioningWatchdogExpiry selector:0 userInfo:0 repeats:120.0];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 104);
    *(void *)(v8 + 104) = v7;

    *(unsigned char *)(*(void *)(a1 + 32) + 91) = 1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v10 = +[TSCoreTelephonyClientCache sharedInstance];
    uint64_t v11 = [v4 plans];
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];
    int v13 = [v12 plan];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_2;
    v14[3] = &unk_264827EA8;
    objc_copyWeak(&v15, &location);
    v14[4] = *(void *)(a1 + 32);
    [v10 installPendingPlan:v13 completion:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(a1 + 32) invokeCompletionWithPlanInstallResult:1];
  }
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_3;
  block[3] = &unk_264827E30;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 88))
    {
      id v4 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_4;
      v8[3] = &unk_2648280A0;
      v8[4] = v3;
      [v4 hasCellularConnection:v8];
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = (uint64_t *)(a1 + 40);
    if (v6)
    {
      id v7 = _TSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_3_cold_1(v5, v7);
      }

      [v3 invokeCompletionWithPlanInstallResult:1];
    }
  }
}

uint64_t __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t result = +[TSUtilities isWifiAvailable];
  if ((result & 1) != 0 || a2)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 invokeCompletionWithPlanInstallResult:4];
  }
  return result;
}

- (void)handleProvisioningWatchdogExpiry
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[TSManagedDeviceInstallFlow handleProvisioningWatchdogExpiry]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "handle 2 min provisioning watchdog timer expired @%s", (uint8_t *)&v4, 0xCu);
  }

  [(TSManagedDeviceInstallFlow *)self invokeCompletionWithPlanInstallResult:1];
}

- (void)invokeCompletionWithPlanInstallResult:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    unint64_t v10 = a3;
    __int16 v11 = 2080;
    uint64_t v12 = "-[TSManagedDeviceInstallFlow invokeCompletionWithPlanInstallResult:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "handle plan install result: %lu @%s", (uint8_t *)&v9, 0x16u);
  }

  [(NSTimer *)self->_provisioningWatchDogTimer invalidate];
  id firstViewCompletion = (void (**)(id, void))self->_firstViewCompletion;
  if (firstViewCompletion) {
    firstViewCompletion[2](firstViewCompletion, 0);
  }
  self->_startMonitoringConnection = 0;
  provisioningWatchDogTimer = self->_provisioningWatchDogTimer;
  self->_provisioningWatchDogTimer = 0;

  id v8 = self->_firstViewCompletion;
  self->_id firstViewCompletion = 0;
}

- (void)hasCellularConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[TSCellularPlanManagerCache sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TSManagedDeviceInstallFlow_hasCellularConnection___block_invoke;
  v7[3] = &unk_2648282B0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 planItemsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__TSManagedDeviceInstallFlow_hasCellularConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "plan", (void)v20);
          int v11 = [v10 status];

          if (!v11)
          {
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v12 = _TSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __52__TSManagedDeviceInstallFlow_hasCellularConnection___block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_planInstallError)
  {
    id v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      planInstallError = self->_planInstallError;
      *(_DWORD *)buf = 138412546;
      v29 = planInstallError;
      __int16 v30 = 2080;
      uint64_t v31 = "-[TSManagedDeviceInstallFlow planItemsUpdated:planListError:]";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "received error already : %@ @%s", buf, 0x16u);
    }
  }
  else if (v7)
  {
    objc_storeStrong((id *)&self->_planInstallError, a4);
    [(TSManagedDeviceInstallFlow *)self invokeCompletionWithPlanInstallResult:1];
  }
  else if (v6 && self->_startMonitoringConnection)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (self->_startMonitoringConnection)
          {
            if (([*(id *)(*((void *)&v23 + 1) + 8 * i) isInstalling] & 1) != 0
              || ([v15 plan],
                  uint64_t v16 = objc_claimAutoreleasedReturnValue(),
                  int v17 = [v16 status],
                  v16,
                  v17 == 14))
            {
              long long v20 = _TSLogDomain();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                long long v21 = [v15 plan];
                *(_DWORD *)buf = 138412546;
                v29 = v21;
                __int16 v30 = 2080;
                uint64_t v31 = "-[TSManagedDeviceInstallFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v20, OS_LOG_TYPE_DEFAULT, "One plan is installing or in monitor mode, continue waiting: %@ @%s", buf, 0x16u);
              }
              goto LABEL_26;
            }
          }
          uint64_t v18 = [v15 plan];
          int v19 = [v18 status];

          if (!v19)
          {
            [(TSManagedDeviceInstallFlow *)self invokeCompletionWithPlanInstallResult:4];
            goto LABEL_26;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_startMonitoringConnection)
  {
    BOOL v12 = +[TSUtilities isWifiAvailable];
    uint64_t v13 = _TSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = "OFF";
      if (v12) {
        uint64_t v14 = "ON";
      }
      int v15 = 136315394;
      uint64_t v16 = v14;
      __int16 v17 = 2080;
      uint64_t v18 = "-[TSManagedDeviceInstallFlow observeValueForKeyPath:ofObject:change:context:]";
      _os_log_impl(&dword_227A17000, v13, OS_LOG_TYPE_DEFAULT, "WiFi : %s @%s", (uint8_t *)&v15, 0x16u);
    }

    if (v12) {
      [(TSManagedDeviceInstallFlow *)self invokeCompletionWithPlanInstallResult:4];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstViewCompletion, 0);
  objc_storeStrong((id *)&self->_provisioningWatchDogTimer, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
}

- (void)firstViewController
{
}

- (void)firstViewController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__TSManagedDeviceInstallFlow_firstViewController___block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  id v6 = "-[TSManagedDeviceInstallFlow firstViewController:]_block_invoke_3";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]Failed - plan item install failed with error: %@ @%s", (uint8_t *)&v3, 0x16u);
}

void __52__TSManagedDeviceInstallFlow_hasCellularConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end