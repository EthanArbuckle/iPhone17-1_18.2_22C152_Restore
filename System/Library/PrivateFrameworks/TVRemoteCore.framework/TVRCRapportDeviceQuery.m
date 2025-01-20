@interface TVRCRapportDeviceQuery
- (BOOL)_shouldReportDevice:(id)a3;
- (RPCompanionLinkClient)companionLinkClient;
- (TVRCRapportDeviceQuery)init;
- (TVRCServiceDeviceQueryDelegate)delegate;
- (_TVRCExpiringStore)expiringStore;
- (_TVRCRapportDeviceManager)deviceManager;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_disconnectAllDevices;
- (void)_disconnectAndRemoveDevice:(id)a3;
- (void)_mdmConfigChanged:(id)a3;
- (void)dealloc;
- (void)setCompanionLinkClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setExpiringStore:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TVRCRapportDeviceQuery

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[TVRCRapportDeviceQuery dealloc]";
    __int16 v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  v5.receiver = self;
  v5.super_class = (Class)TVRCRapportDeviceQuery;
  [(TVRCRapportDeviceQuery *)&v5 dealloc];
}

- (TVRCRapportDeviceQuery)init
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)TVRCRapportDeviceQuery;
  v2 = [(TVRCRapportDeviceQuery *)&v9 init];
  if (v2)
  {
    v3 = _TVRCRapportLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[TVRCRapportDeviceQuery init]";
      __int16 v12 = 2112;
      v13 = v2;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }

    v4 = objc_alloc_init(_TVRCRapportDeviceManager);
    deviceManager = v2->_deviceManager;
    v2->_deviceManager = v4;

    v6 = objc_alloc_init(_TVRCExpiringStore);
    expiringStore = v2->_expiringStore;
    v2->_expiringStore = v6;
  }
  return v2;
}

- (void)start
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[TVRCRapportDeviceQuery start]";
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v4;

  uint64_t v6 = 0x4000000000404;
  if (+[TVRCFeatures isAWDLEnabled])
  {
    v7 = _TVRCRapportLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "AWDL is enabled", buf, 2u);
    }

    uint64_t v6 = 0x4000000000406;
  }
  [(RPCompanionLinkClient *)self->_companionLinkClient setControlFlags:v6];
  [(RPCompanionLinkClient *)self->_companionLinkClient setDispatchQueue:MEMORY[0x263EF83A0]];
  [(RPCompanionLinkClient *)self->_companionLinkClient setFlags:1];
  [(RPCompanionLinkClient *)self->_companionLinkClient setRssiThreshold:-75];
  [(RPCompanionLinkClient *)self->_companionLinkClient tvrc_setAllowedTVs];
  objc_initWeak((id *)buf, self);
  __int16 v8 = self->_companionLinkClient;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __31__TVRCRapportDeviceQuery_start__block_invoke;
  v22[3] = &unk_2647AFC90;
  objc_copyWeak(&v23, (id *)buf);
  [(RPCompanionLinkClient *)v8 setDeviceFoundHandler:v22];
  objc_super v9 = self->_companionLinkClient;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __31__TVRCRapportDeviceQuery_start__block_invoke_61;
  v20[3] = &unk_2647AFC90;
  objc_copyWeak(&v21, (id *)buf);
  [(RPCompanionLinkClient *)v9 setDeviceLostHandler:v20];
  uint64_t v10 = self->_companionLinkClient;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __31__TVRCRapportDeviceQuery_start__block_invoke_64;
  v18[3] = &unk_2647AFCB8;
  objc_copyWeak(&v19, (id *)buf);
  [(RPCompanionLinkClient *)v10 setDeviceChangedHandler:v18];
  v11 = self->_companionLinkClient;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __31__TVRCRapportDeviceQuery_start__block_invoke_68;
  v16 = &unk_2647AEB88;
  objc_copyWeak(&v17, (id *)buf);
  [(RPCompanionLinkClient *)v11 setInvalidationHandler:&v13];
  -[RPCompanionLinkClient setInterruptionHandler:](self->_companionLinkClient, "setInterruptionHandler:", &__block_literal_global_15, v13, v14, v15, v16);
  [(RPCompanionLinkClient *)self->_companionLinkClient activateWithCompletion:&__block_literal_global_73];
  __int16 v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel__mdmConfigChanged_ name:@"TVRXManagedConfigManagerTVRemoteAllowedTVAdded" object:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __31__TVRCRapportDeviceQuery_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __31__TVRCRapportDeviceQuery_start__block_invoke_cold_2((uint64_t)v3, v5);
    }

    if ([WeakRetained _shouldReportDevice:v3])
    {
      uint64_t v6 = _TVRCRapportLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134218242;
        id v27 = v3;
        __int16 v28 = 2114;
        id v29 = v3;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Device should be added, device<%p> %{public}@", (uint8_t *)&v26, 0x16u);
      }

      unsigned int v7 = [v3 statusFlags];
      unsigned int v8 = [v3 statusFlags];
      unsigned int v9 = [v3 statusFlags];
      uint64_t v10 = _TVRCRapportLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v3 name];
        __int16 v12 = [v3 identifier];
        int v26 = 138544386;
        id v27 = v11;
        __int16 v28 = 2114;
        id v29 = v12;
        __int16 v30 = 1024;
        int v31 = (v7 >> 1) & 1;
        __int16 v32 = 1024;
        int v33 = (v8 >> 9) & 1;
        __int16 v34 = 1024;
        int v35 = (v9 >> 2) & 1;
        _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Device details name:%{public}@, id:%{public}@, ble:%{BOOL}d, wifip2p:%{BOOL}d, wifi:%{BOOL}d ", (uint8_t *)&v26, 0x28u);
      }
      uint64_t v13 = [WeakRetained deviceManager];
      uint64_t v14 = [v13 _identifierForDevice:v3];

      if ([WeakRetained[2] containsIdentifier:v14])
      {
        v15 = _TVRCRapportLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138412290;
          id v27 = v3;
          _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Device expired, but was found again, device=%@", (uint8_t *)&v26, 0xCu);
        }

        [WeakRetained[2] removeIdentifier:v14];
        v16 = [WeakRetained deviceManager];
        id v17 = [v16 deviceImplForLinkDevice:v3];

        v18 = [v17 deviceWrapper];

        if (v18)
        {
          id v19 = [v17 deviceWrapper];
          id v20 = [v19 device];

          if (v20 != v3)
          {
            id v21 = [v17 deviceWrapper];
            [v21 updateWithDevice:v3];
          }
          v22 = _TVRCRapportLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [v17 deviceWrapper];
            int v26 = 138412290;
            id v27 = v23;
            _os_log_impl(&dword_2266D3000, v22, OS_LOG_TYPE_DEFAULT, "Reconnecting: %@", (uint8_t *)&v26, 0xCu);
          }
          v24 = [v17 deviceWrapper];
          [v24 reconnect];

          goto LABEL_22;
        }
        v25 = _TVRCRapportLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          __31__TVRCRapportDeviceQuery_start__block_invoke_cold_1();
        }
      }
      [WeakRetained _deviceFound:v3];
LABEL_22:
    }
  }
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = WeakRetained;
  if (WeakRetained && [WeakRetained _shouldReportDevice:v3])
  {
    uint64_t v6 = _TVRCRapportLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = (uint64_t)v3;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Device should be removed, device=%{public}@", buf, 0xCu);
    }

    unsigned int v7 = [v5 deviceManager];
    unsigned int v8 = [v7 _identifierForDevice:v3];

    unsigned int v9 = [v5 deviceManager];
    uint64_t v10 = [v9 deviceImplForLinkDevice:v3];

    v11 = [v10 deviceWrapper];
    int v12 = [v11 connected];

    uint64_t v13 = _TVRCRapportLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        v15 = [v10 deviceWrapper];
        *(_DWORD *)buf = 134218498;
        uint64_t v21 = 0x401C000000000000;
        __int16 v22 = 2112;
        id v23 = v15;
        __int16 v24 = 2112;
        id v25 = v3;
        _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Device was lost, wait to see if it returns, timeout=%f, deviceWrapper=%@, device=%@", buf, 0x20u);
      }
      objc_initWeak((id *)buf, v5);
      v16 = (void *)v5[2];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __31__TVRCRapportDeviceQuery_start__block_invoke_62;
      v17[3] = &unk_2647AEC00;
      objc_copyWeak(&v19, (id *)buf);
      id v18 = v3;
      [v16 addIdentifier:v8 withExpiration:v17 completion:7.0];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Device wasn't connected so we won't try to reconnect", buf, 2u);
      }

      [v5 _deviceLost:v3];
    }
  }
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_62(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = _TVRCRapportLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Device was not found again, device=%{public}@", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained _deviceLost:*(void *)(a1 + 32)];
  }
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_64(uint64_t a1, void *a2, char a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v8 = [WeakRetained deviceManager];
    unsigned int v9 = [v8 deviceImplForLinkDevice:v5];

    uint64_t v10 = _TVRCRapportLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v9 deviceWrapper];
      *(_DWORD *)__int16 v24 = 138543618;
      *(void *)&v24[4] = v5;
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v11;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Device changed, device=%{public}@, wrapper=%@", v24, 0x16u);
    }
    int v12 = [v9 deviceWrapper];

    if (v12)
    {
      uint64_t v13 = _TVRCRapportLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = "yes";
        if ((a3 & 2) != 0) {
          v15 = "yes";
        }
        else {
          v15 = "no";
        }
        *(_DWORD *)__int16 v24 = 138412802;
        *(void *)&v24[4] = v5;
        *(void *)&v24[14] = v15;
        *(_WORD *)&v24[12] = 2080;
        if ((a3 & 0x10) == 0) {
          BOOL v14 = "no";
        }
        *(_WORD *)&v24[22] = 2080;
        id v25 = v14;
        _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Rapport discovery device %@ changed handler attributesChanged :%s nameChanged: %s", v24, 0x20u);
      }
    }
    uint64_t v16 = objc_msgSend(v9, "deviceWrapper", *(_OWORD *)v24, *(void *)&v24[16]);
    if (v16)
    {
      id v17 = (void *)v16;
      id v18 = [v9 deviceWrapper];
      int v19 = [v18 isPaired];

      if (v19)
      {
        id v20 = _TVRCRapportLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = "yes";
          if ((a3 & 2) != 0) {
            __int16 v22 = "yes";
          }
          else {
            __int16 v22 = "no";
          }
          *(_DWORD *)__int16 v24 = 138412802;
          *(void *)&v24[4] = v5;
          *(void *)&v24[14] = v22;
          *(_WORD *)&v24[12] = 2080;
          if ((a3 & 0x10) == 0) {
            uint64_t v21 = "no";
          }
          *(_WORD *)&v24[22] = 2080;
          id v25 = v21;
          _os_log_impl(&dword_2266D3000, v20, OS_LOG_TYPE_DEFAULT, "Rapport discovery device %@ changed handler attributesChanged :%s nameChanged: %s", v24, 0x20u);
        }

        if ((a3 & 0x12) != 0)
        {
          id v23 = [v9 deviceWrapper];
          [v23 updateWithDevice:v5];
        }
      }
    }
  }
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_68(uint64_t a1)
{
  v2 = _TVRCRapportLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Rapport discovery companionLinkClient connection invalidated, disconnecting all devices", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _disconnectAllDevices];
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_69()
{
  v0 = _TVRCRapportLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2266D3000, v0, OS_LOG_TYPE_DEFAULT, "Rapport discovery companionLinkClient connection interrupted", v1, 2u);
  }
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_70(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _TVRCRapportLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __31__TVRCRapportDeviceQuery_start__block_invoke_70_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Rapport discovery client activated. Searching for Rapport devices.", v5, 2u);
  }
}

- (void)stop
{
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stopping rapport query", v8, 2u);
  }

  expiringStore = self->_expiringStore;
  self->_expiringStore = 0;

  deviceManager = self->_deviceManager;
  self->_deviceManager = 0;

  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:@"TVRXManagedConfigManagerTVRemoteAllowedTVAdded" object:0];
}

- (void)_deviceFound:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[TVRCRapportDeviceQuery _deviceFound:]";
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__TVRCRapportDeviceQuery__deviceFound___block_invoke;
  v7[3] = &unk_2647AF458;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  _os_activity_initiate(&dword_2266D3000, "RPCompanionLinkDevice device discovered", OS_ACTIVITY_FLAG_DETACHED, v7);
}

void __39__TVRCRapportDeviceQuery__deviceFound___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) deviceManager];
    int v5 = [v4 createOrUpdateDeviceImplForLinkDevice:*(void *)(a1 + 40)];

    if (v5)
    {
      id v6 = _TVRCRapportLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v11 = 138543362;
        uint64_t v12 = v7;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate device %{public}@ was added", (uint8_t *)&v11, 0xCu);
      }

      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      unsigned int v9 = [*(id *)(a1 + 32) deviceManager];
      uint64_t v10 = [v9 deviceImplForLinkDevice:*(void *)(a1 + 40)];
      [v8 addedDevice:v10];
    }
  }
}

- (void)_deviceLost:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[TVRCRapportDeviceQuery _deviceLost:]";
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__TVRCRapportDeviceQuery__deviceLost___block_invoke;
  v7[3] = &unk_2647AF458;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  _os_activity_initiate(&dword_2266D3000, "RPCompanionLinkDevice device lost", OS_ACTIVITY_FLAG_DETACHED, v7);
}

void __38__TVRCRapportDeviceQuery__deviceLost___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = _TVRCRapportLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v34 = 138543362;
    *(void *)int v35 = v3;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Informing delegate device %{public}@ was lost", (uint8_t *)&v34, 0xCu);
  }

  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) deviceManager];
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = (id *)(a1 + 32);
    uint64_t v10 = [v7 deviceImplForLinkDevice:v9];

    if (!v10
      || ([v10 deviceWrapper], int v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
    {
      __int16 v22 = _TVRCRapportLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_1(v8, v4);
      }
      goto LABEL_29;
    }
    if (!+[TVRCFeatures isAWDLEnabled]) {
      goto LABEL_9;
    }
    uint64_t v12 = [v10 deviceWrapper];
    uint64_t v13 = [v12 device];
    unint64_t v14 = [v13 statusFlags] & 2;

    v15 = [v10 deviceWrapper];
    uint64_t v16 = [v15 device];
    int v17 = [v16 isEqualToRPDevice:*v8] ^ 1;

    if ((v17 & 1) != 0 || v14)
    {
      __int16 v22 = _TVRCRapportLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 67109376;
        *(_DWORD *)int v35 = v17;
        *(_WORD *)&v35[4] = 1024;
        *(_DWORD *)&v35[6] = v14 >> 1;
        id v23 = "Not removing device because isAlternateLink:%d isBLELink:%d";
        __int16 v24 = v22;
        uint32_t v25 = 14;
        goto LABEL_28;
      }
    }
    else
    {
LABEL_9:
      int v18 = [*v8 flags] & 1;
      int v19 = [v10 isPaired];
      id v20 = _TVRCRapportLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 67109376;
        *(_DWORD *)int v35 = v18;
        *(_WORD *)&v35[4] = 1024;
        *(_DWORD *)&v35[6] = v19;
        _os_log_impl(&dword_2266D3000, v20, OS_LOG_TYPE_DEFAULT, "isUnAuthDeviceRemoved:%d isCurrentDeviceAuthenticated:%d", (uint8_t *)&v34, 0xEu);
      }

      if (v18) {
        int v21 = v19;
      }
      else {
        int v21 = 0;
      }
      if (v21 != 1)
      {
        if ([v10 isConnected])
        {
          uint64_t v26 = _TVRCRapportLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_2();
          }

          id v27 = [v10 deviceWrapper];
          __int16 v28 = TVRCMakeError(103, 0);
          [v27 disconnectWithError:v28];
        }
        id v29 = objc_loadWeakRetained((id *)*v4 + 1);
        [v29 removedDevice:v10];

        __int16 v30 = _TVRCRapportLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = [*v8 identifier];
          __int16 v32 = [*v4 deviceManager];
          int v33 = [v32 deviceImplMap];
          int v34 = 138412546;
          *(void *)int v35 = v31;
          *(_WORD *)&v35[8] = 2112;
          uint64_t v36 = v33;
          _os_log_impl(&dword_2266D3000, v30, OS_LOG_TYPE_DEFAULT, "Removing %@ from dictionary: %@", (uint8_t *)&v34, 0x16u);
        }
        __int16 v22 = [*v4 deviceManager];
        [v22 removeDeviceImplForLinkDevice:*v8];
        goto LABEL_29;
      }
      __int16 v22 = _TVRCRapportLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        id v23 = "Ignoring unauth device that is lost because we are now using authenticated device";
        __int16 v24 = v22;
        uint32_t v25 = 2;
LABEL_28:
        _os_log_impl(&dword_2266D3000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v34, v25);
      }
    }
LABEL_29:
  }
}

- (void)_disconnectAllDevices
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[TVRCRapportDeviceQuery _disconnectAllDevices]";
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v16 = self;
  id v4 = [(TVRCRapportDeviceQuery *)self deviceManager];
  int v5 = [v4 deviceImplMap];
  char v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(const char **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = _TVRCRapportLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = v11;
          _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Telling device to disconnect, device=%{public}@", buf, 0xCu);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&v16->_delegate);
        [WeakRetained removedDevice:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  unint64_t v14 = [(TVRCRapportDeviceQuery *)v16 deviceManager];
  v15 = [v14 deviceImplMap];
  [v15 removeAllObjects];
}

- (BOOL)_shouldReportDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 model];
  int v5 = [v4 containsString:@"AppleTV"];

  unint64_t v6 = [v3 statusFlags] & 0x800;
  if (!v5 || !v6)
  {
    int v11 = _TVRCRapportLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 67109634;
      *(_DWORD *)unint64_t v14 = v5;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = v6 >> 11;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_debug_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEBUG, "Device will not be shown because isAppleTV=%d, supportsRemote=%d for device:%@", (uint8_t *)&v13, 0x18u);
    }
    goto LABEL_9;
  }
  uint64_t v7 = +[TVRXManagedConfigManager sharedInstance];
  uint64_t v8 = [v3 name];
  char v9 = [v7 allowedDeviceWithName:v8];

  if ((v9 & 1) == 0)
  {
    int v11 = _TVRCRapportLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      *(void *)unint64_t v14 = v3;
      _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Device will not be shown because it's now allowed by MDM! %{public}@", (uint8_t *)&v13, 0xCu);
    }
LABEL_9:

    BOOL v10 = 0;
    goto LABEL_10;
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (void)_disconnectAndRemoveDevice:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 deviceWrapper];

  if (v5)
  {
    unint64_t v6 = [(TVRCRapportDeviceQuery *)self deviceManager];
    uint64_t v7 = [v4 deviceWrapper];
    uint64_t v8 = [v7 device];
    [v6 removeDeviceImplForLinkDevice:v8];

    char v9 = _TVRCRapportLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [v4 deviceWrapper];
      int v12 = 138543362;
      int v13 = v10;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Telling device to disconnect, device=%{public}@", (uint8_t *)&v12, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained removedDevice:v4];
  }
}

- (void)_mdmConfigChanged:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = _TVRCRapportLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "MDM config changed. Disconnecting non-approved devices.", buf, 2u);
  }

  int v5 = +[TVRXManagedConfigManager sharedInstance];
  int v6 = [v5 isManagedConfigProfileInstalled];

  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(TVRCRapportDeviceQuery *)self deviceManager];
    uint64_t v8 = [v7 deviceImplMap];
    char v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          __int16 v15 = [v14 deviceWrapper];
          id v16 = [v15 device];
          BOOL v17 = [(TVRCRapportDeviceQuery *)self _shouldReportDevice:v16];

          if (!v17) {
            [(TVRCRapportDeviceQuery *)self _disconnectAndRemoveDevice:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
  }
}

- (TVRCServiceDeviceQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRCServiceDeviceQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TVRCExpiringStore)expiringStore
{
  return self->_expiringStore;
}

- (void)setExpiringStore:(id)a3
{
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
}

- (_TVRCRapportDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_expiringStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_2266D3000, v0, OS_LOG_TYPE_ERROR, "Device wrapper not found", v1, 2u);
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_2266D3000, a2, OS_LOG_TYPE_DEBUG, "Device found, device<%p> %{public}@", (uint8_t *)&v2, 0x16u);
}

void __31__TVRCRapportDeviceQuery_start__block_invoke_70_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Rapport discovery companionLinkClient failed to activate. Error - %{public}@", (uint8_t *)&v2, 0xCu);
}

void __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_1(id *a1, id *a2)
{
  uint64_t v3 = [*a1 identifier];
  uint64_t v4 = [*a2 deviceManager];
  uint64_t v11 = [v4 deviceImplMap];
  OUTLINED_FUNCTION_1_1(&dword_2266D3000, v5, v6, "No deviceWrapper found for device id:%{public}@ in mapping %{public}@", v7, v8, v9, v10, 2u);
}

void __38__TVRCRapportDeviceQuery__deviceLost___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_2266D3000, v0, OS_LOG_TYPE_ERROR, "Device was connected while lost, sending TVRCErrorCodeDeviceNotFoundError", v1, 2u);
}

@end