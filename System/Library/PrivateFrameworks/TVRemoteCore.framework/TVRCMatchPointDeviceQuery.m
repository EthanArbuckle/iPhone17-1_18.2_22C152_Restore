@interface TVRCMatchPointDeviceQuery
- (HMHomeManager)homeManager;
- (NSMutableDictionary)deviceImplMap;
- (NSObject)homekitActiveAssertion;
- (TVRCMatchPointDeviceQuery)init;
- (TVRCServiceDeviceQueryDelegate)delegate;
- (void)_matchPointServiceAdded:(id)a3;
- (void)_matchPointServiceNameChanged:(id)a3;
- (void)_matchPointServiceRemoved:(id)a3;
- (void)_notifyAddedService:(id)a3;
- (void)_notifyRemovedService:(id)a3;
- (void)dealloc;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceImplMap:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomekitActiveAssertion:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TVRCMatchPointDeviceQuery

- (TVRCMatchPointDeviceQuery)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVRCMatchPointDeviceQuery;
  v2 = [(TVRCMatchPointDeviceQuery *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deviceImplMap = v2->_deviceImplMap;
    v2->_deviceImplMap = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(TVRCMatchPointDeviceQuery *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)TVRCMatchPointDeviceQuery;
  [(TVRCMatchPointDeviceQuery *)&v3 dealloc];
}

- (void)start
{
  objc_super v3 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Starting query for HomeKit services", v10, 2u);
  }

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__matchPointServiceAdded_ name:@"TVRCMatchPointServiceAddedNotification" object:0];
  [v4 addObserver:self selector:sel__matchPointServiceRemoved_ name:@"TVRCMatchPointServiceRemovedNotification" object:0];
  [v4 addObserver:self selector:sel__matchPointServiceNameChanged_ name:@"TVRCMatchPointServiceNameChangedNotification" object:0];
  if (!self->_homeManager)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F0E5A8]) initWithOptions:1024 cachePolicy:1];
    [v5 setAdaptive:1];
    objc_super v6 = (HMHomeManager *)[objc_alloc(MEMORY[0x263F0E3C0]) initWithConfiguration:v5];
    homeManager = self->_homeManager;
    self->_homeManager = v6;

    [(HMHomeManager *)self->_homeManager setDelegate:self];
    v8 = [(HMHomeManager *)self->_homeManager _beginActiveAssertionWithReason:@"foreground"];
    homekitActiveAssertion = self->_homekitActiveAssertion;
    self->_homekitActiveAssertion = v8;
  }
}

- (void)stop
{
  objc_super v3 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stopping query for HomeKit services", v8, 2u);
  }

  if (self->_homekitActiveAssertion)
  {
    -[HMHomeManager _endActiveAssertion:](self->_homeManager, "_endActiveAssertion:");
    homekitActiveAssertion = self->_homekitActiveAssertion;
    self->_homekitActiveAssertion = 0;
  }
  [(HMHomeManager *)self->_homeManager setDelegate:0];
  homeManager = self->_homeManager;
  self->_homeManager = 0;

  [(NSMutableDictionary *)self->_deviceImplMap removeAllObjects];
  objc_super v6 = +[TVRCHMHomeObserver sharedInstance];
  [v6 setCurrentHome:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:@"TVRCMatchPointServiceAddedNotification" object:0];
  [v7 removeObserver:self name:@"TVRCMatchPointServiceRemovedNotification" object:0];
  [v7 removeObserver:self name:@"TVRCMatchPointServiceNameChangedNotification" object:0];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated homes", (uint8_t *)&v8, 2u);
  }

  v5 = [v3 currentHome];
  if (v5)
  {
    objc_super v6 = +[TVRCHMHomeObserver sharedInstance];
    [v6 setCurrentHome:v5];
  }
  else
  {
    objc_super v6 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v3 homes];
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "No current home found for manager %@. All homes - %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = (HMHomeManager *)a3;
  v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated current home", (uint8_t *)&v11, 2u);
  }

  if (self->_homeManager == v4)
  {
    objc_super v6 = [(HMHomeManager *)v4 currentHome];
    if (v6)
    {
      v7 = +[TVRCHMHomeObserver sharedInstance];
      int v8 = [v7 currentHome];

      if (v8 == v6) {
        goto LABEL_12;
      }
      id v9 = +[TVRCHMHomeObserver sharedInstance];
      [v9 setCurrentHome:v6];
    }
    else
    {
      id v9 = _TVRCHomeKitLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = [(HMHomeManager *)v4 homes];
        int v11 = 138412546;
        uint64_t v12 = v4;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "No current home found for manager %@. All homes - %@", (uint8_t *)&v11, 0x16u);
      }
    }

    goto LABEL_12;
  }
  objc_super v6 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "HomeKit home manager does not match", (uint8_t *)&v11, 2u);
  }
LABEL_12:
}

- (void)_matchPointServiceAdded:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = [a3 object];
  v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2112;
    v16 = v4;
    id v6 = v14;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ got notification that MatchPoint service added %@", (uint8_t *)&v13, 0x16u);
  }
  v7 = [v4 uniqueIdentifier];
  int v8 = [v7 UUIDString];

  id v9 = [(NSMutableDictionary *)self->_deviceImplMap objectForKey:v8];

  __int16 v10 = _TVRCHomeKitLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Found existing mapping for service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Creating mapping for service %@", (uint8_t *)&v13, 0xCu);
    }

    __int16 v10 = +[TVRCHMServiceWrapper wrapperWithService:v4];
    uint64_t v12 = +[TVRCMatchPointDeviceImpl implWithService:v10];
    [(NSMutableDictionary *)self->_deviceImplMap setObject:v12 forKey:v8];
    [(TVRCMatchPointDeviceQuery *)self _notifyAddedService:v12];
  }
}

- (void)_matchPointServiceRemoved:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = [a3 object];
  v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    int v13 = v4;
    id v6 = v11;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ got notification that MatchPoint service removed %@", (uint8_t *)&v10, 0x16u);
  }
  v7 = [v4 uniqueIdentifier];
  int v8 = [v7 UUIDString];

  id v9 = [(NSMutableDictionary *)self->_deviceImplMap objectForKey:v8];
  if (v9)
  {
    [(NSMutableDictionary *)self->_deviceImplMap removeObjectForKey:v8];
    [(TVRCMatchPointDeviceQuery *)self _notifyRemovedService:v9];
  }
}

- (void)_matchPointServiceNameChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = [a3 object];
  v5 = [v4 uniqueIdentifier];
  id v6 = [v5 UUIDString];

  v7 = [(NSMutableDictionary *)self->_deviceImplMap objectForKey:v6];
  int v8 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    id v11 = [v4 name];
    int v12 = 138543874;
    int v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ got notification that service updated name %@. New name : %@", (uint8_t *)&v12, 0x20u);
  }
  if (v7)
  {
    [(TVRCMatchPointDeviceQuery *)self _notifyRemovedService:v7];
    [(TVRCMatchPointDeviceQuery *)self _notifyAddedService:v7];
  }
}

- (void)_notifyAddedService:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Informing delegate we added MatchPoint service, %@", (uint8_t *)&v10, 0xCu);
    }

    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 addedDevice:v4];
  }
}

- (void)_notifyRemovedService:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Informing delegate we removed MatchPoint service, %@", (uint8_t *)&v10, 0xCu);
    }

    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 removedDevice:v4];
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

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (NSObject)homekitActiveAssertion
{
  return self->_homekitActiveAssertion;
}

- (void)setHomekitActiveAssertion:(id)a3
{
}

- (NSMutableDictionary)deviceImplMap
{
  return self->_deviceImplMap;
}

- (void)setDeviceImplMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImplMap, 0);
  objc_storeStrong((id *)&self->_homekitActiveAssertion, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end