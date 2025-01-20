@interface TVRCHMServiceWrapper
+ (id)wrapperWithService:(id)a3;
- (BOOL)connected;
- (BOOL)isTVAwake;
- (BOOL)muteEnabled;
- (BOOL)sentWakeKey;
- (BOOL)supportsInfoKey;
- (BOOL)supportsMute;
- (BOOL)supportsPowerButton;
- (BOOL)supportsVolumeControl;
- (BOOL)volumeControlSupported;
- (HMAccessory)accessory;
- (HMCharacteristic)activeCharacteristic;
- (HMCharacteristic)muteCharacteristic;
- (HMCharacteristic)serviceCharacteristic;
- (HMCharacteristic)volumeSelectorCharacteristic;
- (HMHome)home;
- (HMService)service;
- (NSString)description;
- (NSString)identifier;
- (NSString)model;
- (NSString)name;
- (TVRCHMServiceWrapper)initWithService:(id)a3;
- (TVRCHMServiceWrapperDelegate)delegate;
- (id)_televisionServiceForAccessory:(id)a3;
- (id)_writeRequestForCharacteristic:(id)a3 withValue:(id)a4;
- (int64_t)_remoteKeyForTVRCButton:(id)a3;
- (int64_t)currentActiveState;
- (void)_checkVolumeServicesForAccessory:(id)a3;
- (void)_disconnectWithError:(id)a3;
- (void)_readValueForCharacteristic:(id)a3 completionHandler:(id)a4;
- (void)_sendMuteKey;
- (void)_sendRemoteKey:(int64_t)a3;
- (void)_sendVolumeKey:(BOOL)a3;
- (void)_sendWakeKey;
- (void)_serviceActiveStateChanged:(id)a3;
- (void)_serviceNameChanged:(id)a3;
- (void)_serviceRemoved:(id)a3;
- (void)_setCharacteristicsForService:(id)a3;
- (void)_startObservingServiceNotifications;
- (void)_stopObservingServiceNotifications;
- (void)_togglePowerButton;
- (void)_updateMuteState;
- (void)_updatePowerState;
- (void)_writeValue:(id)a3 toCharacteristic:(id)a4;
- (void)connect;
- (void)disconnect;
- (void)sendButtonEvent:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setActiveCharacteristic:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setCurrentActiveState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setMuteCharacteristic:(id)a3;
- (void)setMuteEnabled:(BOOL)a3;
- (void)setSentWakeKey:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setServiceCharacteristic:(id)a3;
- (void)setVolumeControlSupported:(BOOL)a3;
- (void)setVolumeSelectorCharacteristic:(id)a3;
@end

@implementation TVRCHMServiceWrapper

+ (id)wrapperWithService:(id)a3
{
  id v3 = a3;
  v4 = [[TVRCHMServiceWrapper alloc] initWithService:v3];

  return v4;
}

- (TVRCHMServiceWrapper)initWithService:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TVRCHMServiceWrapper;
  v6 = [(TVRCHMServiceWrapper *)&v12 init];
  v7 = v6;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    uint64_t v8 = [v5 accessory];
    accessory = v7->_accessory;
    v7->_accessory = (HMAccessory *)v8;

    v7->_connected = 0;
    v10 = [v5 accessory];
    [(TVRCHMServiceWrapper *)v7 _checkVolumeServicesForAccessory:v10];

    [(TVRCHMServiceWrapper *)v7 _setCharacteristicsForService:v5];
  }

  return v7;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(TVRCHMServiceWrapper *)self name];
  [v3 appendString:v4 withName:@"name"];

  id v5 = [(TVRCHMServiceWrapper *)self model];
  [v3 appendString:v5 withName:@"model"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCHMServiceWrapper connected](self, "connected"), @"connected");
  id v7 = (id)[v3 appendObject:self->_service withName:@"underlyingHMService"];
  uint64_t v8 = [(TVRCHMServiceWrapper *)self identifier];
  [v3 appendString:v8 withName:@"identifier"];

  v9 = [v3 build];

  return (NSString *)v9;
}

- (NSString)name
{
  return [(HMService *)self->_service name];
}

- (NSString)identifier
{
  v2 = [(HMService *)self->_service accessory];
  id v3 = [v2 deviceIdentifier];

  return (NSString *)v3;
}

- (NSString)model
{
  v2 = [(HMService *)self->_service accessory];
  id v3 = [v2 category];
  v4 = [v3 categoryType];

  if ([v4 isEqualToString:*MEMORY[0x263F0B188]])
  {
    id v5 = TVRCDeviceModelTypeAirplaySetTopBox;
  }
  else
  {
    int v6 = [v4 isEqualToString:*MEMORY[0x263F0B198]];
    id v5 = TVRCDeviceModelTypeAirplayTelevision;
    if (v6) {
      id v5 = TVRCDeviceModelTypeAirplayStick;
    }
  }
  id v7 = *v5;

  return v7;
}

- (void)connect
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_connected)
  {
    id v3 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      service = self->_service;
      int v16 = 138412290;
      v17 = service;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to connect service %@", (uint8_t *)&v16, 0xCu);
    }

    id v5 = [(HMService *)self->_service accessory];
    int v6 = [(HMService *)v5 home];
    home = self->_home;
    self->_home = v6;

    uint64_t v8 = _TVRCHomeKitLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        int v16 = 138412290;
        v17 = v5;
        _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Found parent accessory %@", (uint8_t *)&v16, 0xCu);
      }

      int v10 = [(HMService *)v5 isReachable];
      v11 = _TVRCHomeKitLog();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          int v16 = 138412290;
          v17 = v5;
          _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Accessory %@ is reachable and local. Informing delegate that we can connect", (uint8_t *)&v16, 0xCu);
        }

        self->_connected = 1;
        [(TVRCHMServiceWrapper *)self _startObservingServiceNotifications];
        [(TVRCHMServiceWrapper *)self _updatePowerState];
        [(TVRCHMServiceWrapper *)self _updateMuteState];
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained connectedToService:self];
        goto LABEL_18;
      }
      if (v12)
      {
        int v16 = 138412290;
        v17 = v5;
        _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Accessory %@ is not reachable or local. Informing delegate that we disconnected", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v15 = 300;
    }
    else
    {
      if (v9)
      {
        v14 = self->_service;
        int v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Could not find accessory for service %@. Informing delegate that we disconnected", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v15 = 301;
    }
    WeakRetained = TVRCMakeError(v15, 0);
    [(TVRCHMServiceWrapper *)self _disconnectWithError:WeakRetained];
LABEL_18:
  }
}

- (void)disconnect
{
}

- (void)sendButtonEvent:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 eventType];
  if (v4 == 2)
  {
    int64_t v7 = [(TVRCHMServiceWrapper *)self _remoteKeyForTVRCButton:v10];
    if (v7 != -1) {
      [(TVRCHMServiceWrapper *)self _sendRemoteKey:v7];
    }
    uint64_t v8 = [v10 button];
    uint64_t v9 = [v8 buttonType];

    if (![(TVRCHMServiceWrapper *)self isTVAwake] && v9 != 30) {
      [(TVRCHMServiceWrapper *)self _sendWakeKey];
    }
    if (v9 == 29)
    {
      [(TVRCHMServiceWrapper *)self _sendMuteKey];
    }
    else if (v9 == 30)
    {
      [(TVRCHMServiceWrapper *)self _togglePowerButton];
    }
  }
  else if (v4 == 1)
  {
    id v5 = [v10 button];
    uint64_t v6 = [v5 buttonType];

    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 0xA) {
      [(TVRCHMServiceWrapper *)self _sendVolumeKey:v6 == 10];
    }
  }
}

- (BOOL)supportsVolumeControl
{
  return self->_volumeControlSupported && self->_volumeSelectorCharacteristic != 0;
}

- (BOOL)supportsMute
{
  return self->_muteCharacteristic != 0;
}

- (BOOL)supportsInfoKey
{
  v2 = [(HMCharacteristic *)self->_serviceCharacteristic metadata];
  id v3 = [v2 validValues];
  uint64_t v4 = [NSNumber numberWithInteger:15];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)supportsPowerButton
{
  return self->_activeCharacteristic != 0;
}

- (void)_startObservingServiceNotifications
{
  if (self->_service)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__serviceNameChanged_ name:@"TVRCMatchPointServiceNameChangedNotification" object:self->_service];
    [v3 addObserver:self selector:sel__serviceRemoved_ name:@"TVRCMatchPointServiceRemovedNotification" object:self->_service];
    [v3 addObserver:self selector:sel__serviceActiveStateChanged_ name:@"TVRCMatchPointServiceActiveStateChangedNotification" object:self->_service];
  }
}

- (void)_stopObservingServiceNotifications
{
  if (self->_service)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:@"TVRCMatchPointServiceNameChangedNotification" object:self->_service];
    [v3 removeObserver:self name:@"TVRCMatchPointServiceRemovedNotification" object:self->_service];
  }
}

- (void)_serviceNameChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = objc_opt_class();
    service = self->_service;
    id v7 = v5;
    uint64_t v8 = [(TVRCHMServiceWrapper *)self name];
    int v11 = 138412802;
    BOOL v12 = v5;
    __int16 v13 = 2112;
    v14 = service;
    __int16 v15 = 2112;
    int v16 = v8;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "%@ got notification that services updated name %@. New name : %@", (uint8_t *)&v11, 0x20u);
  }
  if (self->_connected)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = [(TVRCHMServiceWrapper *)self name];
    [WeakRetained service:self updatedName:v10];
  }
}

- (void)_serviceRemoved:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = objc_opt_class();
    service = self->_service;
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    BOOL v12 = service;
    id v7 = v5;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ got notification that services went away %@. Disconnecting if still connected", (uint8_t *)&v9, 0x16u);
  }
  if (self->_connected)
  {
    uint64_t v8 = TVRCMakeError(300, 0);
    [(TVRCHMServiceWrapper *)self _disconnectWithError:v8];
  }
}

- (void)_serviceActiveStateChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [a3 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"TVRCMatchPointServiceActiveStateKey"];

  char v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Received notification that activeState changed to %@", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)isTVAwake
{
  return [(TVRCHMServiceWrapper *)self currentActiveState] == 1;
}

- (void)_disconnectWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    int v9 = 138412546;
    id v10 = service;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to disconnect service %@ with error %{public}@", (uint8_t *)&v9, 0x16u);
  }

  if (self->_connected) {
    [(TVRCHMServiceWrapper *)self _stopObservingServiceNotifications];
  }
  *(_WORD *)&self->_connected = 0;
  home = self->_home;
  self->_home = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained disconnectedFromService:self error:v4];
}

- (void)_sendRemoteKey:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    int v9 = 134218242;
    int64_t v10 = a3;
    __int16 v11 = 2112;
    id v12 = service;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to send key of type %ld to service %@", (uint8_t *)&v9, 0x16u);
  }

  if (self->_serviceCharacteristic)
  {
    id v7 = [NSNumber numberWithInteger:a3];
    [(TVRCHMServiceWrapper *)self _writeValue:v7 toCharacteristic:self->_serviceCharacteristic];
  }
  else
  {
    id v7 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = self->_service;
      int v9 = 138412290;
      int64_t v10 = (int64_t)v8;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicRemoteKey exists for service %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_sendWakeKey
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    int v7 = 138412290;
    uint64_t v8 = service;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Sending wake key to service %@", (uint8_t *)&v7, 0xCu);
  }

  if (self->_activeCharacteristic)
  {
    char v5 = [NSNumber numberWithInteger:1];
    [(TVRCHMServiceWrapper *)self _writeValue:v5 toCharacteristic:self->_activeCharacteristic];
  }
  else
  {
    char v5 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = self->_service;
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicTypeActive exists for service %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_updatePowerState
{
  if (self->_activeCharacteristic)
  {
    id v3 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Reading value for HMCharacteristicTypeActive", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    activeCharacteristic = self->_activeCharacteristic;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __41__TVRCHMServiceWrapper__updatePowerState__block_invoke;
    v5[3] = &unk_2647AFA68;
    objc_copyWeak(&v6, buf);
    [(HMCharacteristic *)activeCharacteristic readValueWithCompletionHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __41__TVRCHMServiceWrapper__updatePowerState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained activeCharacteristic];
    int v7 = [v6 localizedDescription];

    if (v3)
    {
      uint64_t v8 = _TVRCHomeKitLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __41__TVRCHMServiceWrapper__updatePowerState__block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v9 = [v5 activeCharacteristic];
      uint64_t v8 = [v9 value];

      objc_msgSend(v5, "setCurrentActiveState:", (int)-[NSObject intValue](v8, "intValue"));
      int64_t v10 = _TVRCHomeKitLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134217984;
        uint64_t v12 = [v5 currentActiveState];
        _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Received value for HMCharacteristicTypeActive. Setting currentActiveState to %ld", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_updateMuteState
{
  if (self->_muteCharacteristic)
  {
    id v3 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Reading value for HMCharacteristicTypeMute", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    muteCharacteristic = self->_muteCharacteristic;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __40__TVRCHMServiceWrapper__updateMuteState__block_invoke;
    v5[3] = &unk_2647AFA68;
    objc_copyWeak(&v6, buf);
    [(HMCharacteristic *)muteCharacteristic readValueWithCompletionHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __40__TVRCHMServiceWrapper__updateMuteState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained activeCharacteristic];
    int v7 = [v6 localizedDescription];

    if (v3)
    {
      uint64_t v8 = _TVRCHomeKitLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __41__TVRCHMServiceWrapper__updatePowerState__block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v9 = [v5 muteCharacteristic];
      uint64_t v8 = [v9 value];

      objc_msgSend(v5, "setMuteEnabled:", -[NSObject BOOLValue](v8, "BOOLValue"));
      int64_t v10 = _TVRCHomeKitLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = [v5 muteEnabled];
        _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Received value for HMCharacteristicTypeMute. Setting muteEnabled to %{BOOL}d", (uint8_t *)v11, 8u);
      }
    }
  }
}

- (void)_togglePowerButton
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412290;
    v14 = service;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Toggling power for service %@", buf, 0xCu);
  }

  if (self->_activeCharacteristic)
  {
    BOOL v5 = [(TVRCHMServiceWrapper *)self isTVAwake];
    objc_initWeak((id *)buf, self);
    unint64_t v6 = !v5;
    activeCharacteristic = self->_activeCharacteristic;
    uint64_t v8 = [NSNumber numberWithInteger:v6];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __42__TVRCHMServiceWrapper__togglePowerButton__block_invoke;
    v11[3] = &unk_2647AFA90;
    objc_copyWeak(v12, (id *)buf);
    v12[1] = (id)v6;
    [(HMCharacteristic *)activeCharacteristic writeValue:v8 completionHandler:v11];

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v9 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v10 = self->_service;
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicTypeActive exists for service %@", buf, 0xCu);
    }
  }
}

void __42__TVRCHMServiceWrapper__togglePowerButton__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v5 = _TVRCHomeKitLog();
    unint64_t v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __42__TVRCHMServiceWrapper__togglePowerButton__block_invoke_cold_1();
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
        uint64_t v8 = [WeakRetained activeCharacteristic];
        uint64_t v9 = [v8 localizedDescription];
        int v10 = 138412546;
        int v11 = v7;
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Successfully wrote value %@ to characteristic %@", (uint8_t *)&v10, 0x16u);
      }
      [WeakRetained setCurrentActiveState:*(void *)(a1 + 40)];
    }
  }
}

- (void)_sendVolumeKey:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = @"NO";
    service = self->_service;
    if (v3) {
      unint64_t v6 = @"YES";
    }
    int v10 = 138412546;
    int v11 = service;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Sending volume key to service %@ with increment %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (self->_volumeSelectorCharacteristic)
  {
    uint64_t v8 = [NSNumber numberWithInteger:!v3];
    [(TVRCHMServiceWrapper *)self _writeValue:v8 toCharacteristic:self->_volumeSelectorCharacteristic];
  }
  else
  {
    uint64_t v8 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self->_service;
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicTypeVolumeSelector exists for service %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_sendMuteKey
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = service;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Sending mute key to service %@", buf, 0xCu);
  }

  if (self->_muteCharacteristic)
  {
    BOOL v5 = [(TVRCHMServiceWrapper *)self muteEnabled];
    objc_initWeak((id *)buf, self);
    BOOL v6 = !v5;
    muteCharacteristic = self->_muteCharacteristic;
    uint64_t v8 = [NSNumber numberWithBool:!v5];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __36__TVRCHMServiceWrapper__sendMuteKey__block_invoke;
    v11[3] = &unk_2647AFAB8;
    objc_copyWeak(&v12, (id *)buf);
    BOOL v13 = v6;
    [(HMCharacteristic *)muteCharacteristic writeValue:v8 completionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v9 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = self->_service;
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v10;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicTypeMute exists for service %@", buf, 0xCu);
    }
  }
}

void __36__TVRCHMServiceWrapper__sendMuteKey__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v5 = _TVRCHomeKitLog();
    BOOL v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __36__TVRCHMServiceWrapper__sendMuteKey__block_invoke_cold_1();
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
        uint64_t v8 = [WeakRetained muteCharacteristic];
        uint64_t v9 = [v8 localizedDescription];
        int v10 = 138412546;
        int v11 = v7;
        __int16 v12 = 2112;
        BOOL v13 = v9;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Successfully wrote value %@ to characteristic %@", (uint8_t *)&v10, 0x16u);
      }
      [WeakRetained setMuteEnabled:*(unsigned __int8 *)(a1 + 40)];
    }
  }
}

- (int64_t)_remoteKeyForTVRCButton:(id)a3
{
  id v3 = [a3 button];
  uint64_t v4 = [v3 buttonType];

  int64_t result = -1;
  switch(v4)
  {
    case 12:
      int64_t result = 4;
      break;
    case 13:
      int64_t result = 5;
      break;
    case 14:
      int64_t result = 6;
      break;
    case 15:
      int64_t result = 7;
      break;
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
      return result;
    case 23:
      int64_t result = 9;
      break;
    case 24:
      int64_t result = 10;
      break;
    case 25:
      int64_t result = 15;
      break;
    default:
      int64_t v6 = 8;
      if (v4 != 1) {
        int64_t v6 = -1;
      }
      if (v4 == 5) {
        int64_t result = 11;
      }
      else {
        int64_t result = v6;
      }
      break;
  }
  return result;
}

- (id)_televisionServiceForAccessory:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_msgSend(a3, "services", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x263F0D850];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v10 = [v9 serviceType];
        int v11 = [v10 isEqualToString:v7];

        if (v11)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)_setCharacteristicsForService:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v23 = a3;
  uint64_t v4 = [v23 characteristics];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    uint64_t v8 = *MEMORY[0x263F0C360];
    uint64_t v9 = *MEMORY[0x263F0BEF8];
    location = &self->_activeCharacteristic;
    p_serviceCharacteristic = &self->_serviceCharacteristic;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        BOOL v13 = _TVRCHomeKitLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v21 = [v12 localizedDescription];
          *(_DWORD *)buf = 138543618;
          v30 = v21;
          __int16 v31 = 2112;
          id v32 = v23;
          _os_log_debug_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEBUG, "Found characteristic, %{public}@ for service %@", buf, 0x16u);
        }
        long long v14 = [v12 characteristicType];
        int v15 = [v14 isEqualToString:v8];

        if (v15)
        {
          long long v16 = _TVRCHomeKitLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v12;
            __int16 v31 = 2112;
            id v32 = v23;
            _os_log_impl(&dword_2266D3000, v16, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicRemoteKey, %{public}@ for service %@", buf, 0x16u);
          }

          long long v17 = (id *)p_serviceCharacteristic;
        }
        else
        {
          uint64_t v18 = [v12 characteristicType];
          int v19 = [v18 isEqualToString:v9];

          if (!v19) {
            goto LABEL_17;
          }
          v20 = _TVRCHomeKitLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v12;
            __int16 v31 = 2112;
            id v32 = v23;
            _os_log_impl(&dword_2266D3000, v20, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeActive, %{public}@ for service %@", buf, 0x16u);
          }

          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke;
          v24[3] = &unk_2647AFAE0;
          v24[4] = v12;
          [v12 enableNotification:1 completionHandler:v24];
          long long v17 = (id *)location;
        }
        objc_storeStrong(v17, v12);
LABEL_17:
        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v6);
  }
}

void __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _TVRCHomeKitLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Enabled notifications for HMCharacteristicTypeActive", v5, 2u);
  }
}

- (void)_checkVolumeServicesForAccessory:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v4 = [a3 services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v43;
    uint64_t v8 = *MEMORY[0x263F0D808];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v43 != v7) {
        objc_enumerationMutation(v4);
      }
      int v10 = *(void **)(*((void *)&v42 + 1) + 8 * v9);
      uint64_t v11 = [v10 serviceType];
      char v12 = [v11 isEqualToString:v8];

      if (v12) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (!v6) {
          goto LABEL_32;
        }
        goto LABEL_3;
      }
    }
    id v13 = v10;

    if (v13)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v35 = v13;
      long long v14 = [v13 characteristics];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (!v15) {
        goto LABEL_31;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      uint64_t v18 = *MEMORY[0x263F0C5A0];
      uint64_t v19 = *MEMORY[0x263F0C5A8];
      location = &self->_muteCharacteristic;
      v33 = v37;
      uint64_t v34 = *MEMORY[0x263F0C290];
      while (1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "characteristicType", location, v33);
          int v23 = [v22 isEqualToString:v18];

          if (v23)
          {
            v24 = _TVRCHomeKitLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v47 = v21;
              __int16 v48 = 2112;
              id v49 = v35;
              _os_log_impl(&dword_2266D3000, v24, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeVolume, %{public}@ for service %@", buf, 0x16u);
            }

            self->_volumeControlSupported = 1;
          }
          else
          {
            long long v25 = [v21 characteristicType];
            int v26 = [v25 isEqualToString:v19];

            if (v26)
            {
              long long v27 = _TVRCHomeKitLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v47 = v21;
                __int16 v48 = 2112;
                id v49 = v35;
                _os_log_impl(&dword_2266D3000, v27, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeVolumeSelector, %{public}@ for service %@", buf, 0x16u);
              }

              self->_volumeControlSupported = 1;
              p_volumeSelectorCharacteristic = &self->_volumeSelectorCharacteristic;
            }
            else
            {
              v29 = [v21 characteristicType];
              int v30 = [v29 isEqualToString:v34];

              if (!v30) {
                continue;
              }
              __int16 v31 = _TVRCHomeKitLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v47 = v21;
                __int16 v48 = 2112;
                id v49 = v35;
                _os_log_impl(&dword_2266D3000, v31, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeMute, %{public}@ for service %@", buf, 0x16u);
              }

              v36[0] = MEMORY[0x263EF8330];
              v36[1] = 3221225472;
              v37[0] = __57__TVRCHMServiceWrapper__checkVolumeServicesForAccessory___block_invoke;
              v37[1] = &unk_2647AFAE0;
              v37[2] = v21;
              [v21 enableNotification:1 completionHandler:v36];
              p_volumeSelectorCharacteristic = location;
            }
            objc_storeStrong((id *)p_volumeSelectorCharacteristic, v21);
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (!v16)
        {
LABEL_31:

          uint64_t v4 = v35;
          goto LABEL_32;
        }
      }
    }
  }
  else
  {
LABEL_32:
  }
}

void __57__TVRCHMServiceWrapper__checkVolumeServicesForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _TVRCHomeKitLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Enabled notifications for HMCharacteristicTypeMute", v5, 2u);
  }
}

- (id)_writeRequestForCharacteristic:(id)a3 withValue:(id)a4
{
  return (id)[MEMORY[0x263F0E2A8] writeRequestWithCharacteristic:a3 value:a4];
}

- (void)_writeValue:(id)a3 toCharacteristic:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F0E2A8] writeRequestWithCharacteristic:v7 value:v6];
  uint64_t v9 = (void *)MEMORY[0x263F0E250];
  v28[0] = v8;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  uint64_t v11 = [v9 characteristicBatchRequestWithWriteRequests:v10];

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke;
  v21 = &unk_2647AFB08;
  id v12 = v7;
  id v22 = v12;
  id v13 = v6;
  id v23 = v13;
  [v11 setCompletionHandler:&v18];
  objc_msgSend(v11, "setProgressHandler:", &__block_literal_global_11, v18, v19, v20, v21);
  home = self->_home;
  uint64_t v15 = _TVRCHomeKitLog();
  uint64_t v16 = v15;
  if (home)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = self->_home;
      *(_DWORD *)buf = 138412546;
      long long v25 = v11;
      __int16 v26 = 2112;
      long long v27 = v17;
      _os_log_impl(&dword_2266D3000, v16, OS_LOG_TYPE_DEFAULT, "Performing Batch Characteristic Write Request %@, on home %@", buf, 0x16u);
    }

    [(HMHome *)self->_home performBatchCharacteristicRequest:v11];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TVRCHMServiceWrapper _writeValue:toCharacteristic:]((uint64_t)v11, v16);
    }
  }
}

void __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _TVRCHomeKitLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) localizedDescription];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Successfully wrote value %@ to characteristic %@", (uint8_t *)&v8, 0x16u);
  }
}

void __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Batch Characteristic Write progress handler called - %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_readValueForCharacteristic:(id)a3 completionHandler:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263F0E268] readRequestWithCharacteristic:v6];
  uint64_t v9 = (void *)MEMORY[0x263F0E250];
  v28[0] = v8;
  __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  uint64_t v11 = [v9 characteristicBatchRequestWithReadRequests:v10];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke;
  v22[3] = &unk_2647AFB50;
  id v12 = v7;
  id v23 = v12;
  [v11 setProgressHandler:v22];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke_35;
  v19[3] = &unk_2647AFB78;
  id v13 = v6;
  id v20 = v13;
  id v14 = v12;
  id v21 = v14;
  [v11 setCompletionHandler:v19];
  home = self->_home;
  uint64_t v16 = _TVRCHomeKitLog();
  uint64_t v17 = v16;
  if (home)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = self->_home;
      *(_DWORD *)buf = 138412546;
      long long v25 = v11;
      __int16 v26 = 2112;
      long long v27 = v18;
      _os_log_impl(&dword_2266D3000, v17, OS_LOG_TYPE_DEFAULT, "Performing Batch Characteristic Read Request %@, on home %@", buf, 0x16u);
    }

    [(HMHome *)self->_home performBatchCharacteristicRequest:v11];
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TVRCHMHomeObserver _readCharacteristic:completion:]((uint64_t)v11, v17);
    }
  }
}

void __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v8 = _TVRCHomeKitLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 value];
          __int16 v10 = [v7 request];
          uint64_t v11 = [v10 characteristic];
          id v12 = [v11 localizedDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v19 = v9;
          __int16 v20 = 2112;
          id v21 = v12;
          _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Received value %@ for read request on characteristic %@", buf, 0x16u);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v4);
  }
}

void __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke_35_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (TVRCHMServiceWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRCHMServiceWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (HMCharacteristic)serviceCharacteristic
{
  return self->_serviceCharacteristic;
}

- (void)setServiceCharacteristic:(id)a3
{
}

- (HMCharacteristic)activeCharacteristic
{
  return self->_activeCharacteristic;
}

- (void)setActiveCharacteristic:(id)a3
{
}

- (HMCharacteristic)volumeSelectorCharacteristic
{
  return self->_volumeSelectorCharacteristic;
}

- (void)setVolumeSelectorCharacteristic:(id)a3
{
}

- (HMCharacteristic)muteCharacteristic
{
  return self->_muteCharacteristic;
}

- (void)setMuteCharacteristic:(id)a3
{
}

- (BOOL)sentWakeKey
{
  return self->_sentWakeKey;
}

- (void)setSentWakeKey:(BOOL)a3
{
  self->_sentWakeKey = a3;
}

- (BOOL)volumeControlSupported
{
  return self->_volumeControlSupported;
}

- (void)setVolumeControlSupported:(BOOL)a3
{
  self->_volumeControlSupported = a3;
}

- (int64_t)currentActiveState
{
  return self->_currentActiveState;
}

- (void)setCurrentActiveState:(int64_t)a3
{
  self->_currentActiveState = a3;
}

- (BOOL)muteEnabled
{
  return self->_muteEnabled;
}

- (void)setMuteEnabled:(BOOL)a3
{
  self->_muteEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteCharacteristic, 0);
  objc_storeStrong((id *)&self->_volumeSelectorCharacteristic, 0);
  objc_storeStrong((id *)&self->_activeCharacteristic, 0);
  objc_storeStrong((id *)&self->_serviceCharacteristic, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __41__TVRCHMServiceWrapper__updatePowerState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Failed to read to chacratersitic %@. Error : %{public}@");
}

void __42__TVRCHMServiceWrapper__togglePowerButton__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = [v0 activeCharacteristic];
  id v2 = [v1 localizedDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2266D3000, v3, v4, "Failed to write to characteristic %@. Error : %{public}@", v5, v6, v7, v8, v9);
}

void __36__TVRCHMServiceWrapper__sendMuteKey__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = [v0 muteCharacteristic];
  id v2 = [v1 localizedDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2266D3000, v3, v4, "Failed to write to characteristic %@. Error : %{public}@", v5, v6, v7, v8, v9);
}

void __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_5(v0) localizedDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2266D3000, v2, v3, "Failed to enable notification for characteristic %@. Error : %{public}@", v4, v5, v6, v7, v8);
}

- (void)_writeValue:(uint64_t)a1 toCharacteristic:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Could not perform Batch Characteristic Write Request %@ since no valid home was found", (uint8_t *)&v2, 0xCu);
}

void __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_5(v0) localizedDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2266D3000, v2, v3, "Failed to write to characteristic %@. Error : %{public}@", v4, v5, v6, v7, v8);
}

void __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_5(v0) localizedDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2266D3000, v2, v3, "Failed to read to chacratersitic %@. Error : %{public}@", v4, v5, v6, v7, v8);
}

@end