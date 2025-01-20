@interface TVRCHMHomeObserver
+ (id)sharedInstance;
- (BOOL)_checkErrorForLocallySuspendedAccessory:(id)a3;
- (HMHome)currentHome;
- (NSMutableDictionary)serviceToAccessoryIDMapping;
- (TVRCHMHomeObserver)init;
- (void)_checkAccessoryReachabilityAndFetchTVServices:(id)a3 withCompletion:(id)a4;
- (void)_readCharacteristic:(id)a3 completion:(id)a4;
- (void)_updateAccessoriesForHome:(id)a3;
- (void)_updateServicesForAccessory:(id)a3;
- (void)accessory:(id)a3 didUpdateNameForService:(id)a4;
- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)accessoryDidUpdateReachableTransports:(id)a3;
- (void)accessoryDidUpdateServices:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)setCurrentHome:(id)a3;
- (void)setServiceToAccessoryIDMapping:(id)a3;
@end

@implementation TVRCHMHomeObserver

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_10);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

uint64_t __36__TVRCHMHomeObserver_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(TVRCHMHomeObserver);

  return MEMORY[0x270F9A758]();
}

- (TVRCHMHomeObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVRCHMHomeObserver;
  v2 = [(TVRCHMHomeObserver *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    serviceToAccessoryIDMapping = v2->_serviceToAccessoryIDMapping;
    v2->_serviceToAccessoryIDMapping = v3;
  }
  return v2;
}

- (void)setCurrentHome:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = (HMHome *)a3;
  objc_super v6 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentHome = self->_currentHome;
    int v9 = 138543618;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = currentHome;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Setting home to be observed as %{public}@. Previous home - %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = v5;
  if (self->_currentHome != v5)
  {
    [(NSMutableDictionary *)self->_serviceToAccessoryIDMapping removeAllObjects];
    [(HMHome *)v5 setDelegate:self];
    [(HMHome *)self->_currentHome setDelegate:0];
    objc_storeStrong((id *)&self->_currentHome, a3);
    v8 = self->_currentHome;
  }
  if (v8) {
    -[TVRCHMHomeObserver _updateAccessoriesForHome:](self, "_updateAccessoriesForHome:");
  }
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it added accessory %{public}@, for home %{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(TVRCHMHomeObserver *)self _updateServicesForAccessory:v7];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it removed accessory %{public}@ from home %{public}@", (uint8_t *)&v15, 0x16u);
  }

  int v9 = [v7 deviceIdentifier];
  id v10 = [(TVRCHMHomeObserver *)self serviceToAccessoryIDMapping];
  __int16 v11 = [v10 objectForKey:v9];

  if (v11)
  {
    id v12 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Removing accessory %{public}@ from device list because it was removed from the Home", (uint8_t *)&v15, 0xCu);
    }

    [v7 setDelegate:0];
    uint64_t v13 = [(TVRCHMHomeObserver *)self serviceToAccessoryIDMapping];
    [v13 removeObjectForKey:v9];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 postNotificationName:@"TVRCMatchPointServiceRemovedNotification" object:v11];
  }
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 1024;
    int v9 = [v4 isReachable];
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated reachability for accessory %{public}@. Reachable %{BOOL}d", (uint8_t *)&v6, 0x12u);
  }

  [(TVRCHMHomeObserver *)self _updateServicesForAccessory:v4];
}

- (void)accessoryDidUpdateReachableTransports:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 reachableTransports];
  int v6 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 1024;
    int v10 = v5 & 1;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated Reachable Transports for accessory %{public}@. Has IP Transport - %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }

  [(TVRCHMHomeObserver *)self _updateServicesForAccessory:v4];
}

- (void)accessory:(id)a3 didUpdateNameForService:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated service name for service %{public}@, of accessory %{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"TVRCMatchPointServiceNameChangedNotification" object:v6];
}

- (void)accessoryDidUpdateServices:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated services for accessory %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(TVRCHMHomeObserver *)self _updateServicesForAccessory:v4];
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v9 characteristicType];
    id v12 = [v9 localizedDescription];
    *(_DWORD *)buf = 138543874;
    v24 = v11;
    __int16 v25 = 2112;
    v26 = v12;
    __int16 v27 = 2114;
    id v28 = v7;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated characteristic: %{public}@ desc: %@ for accessory %{public}@", buf, 0x20u);
  }
  uint64_t v13 = [v9 characteristicType];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F0BEF8]];

  if (v14)
  {
    int v15 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v9 value];
      *(_DWORD *)buf = 138543362;
      v24 = v16;
      _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Active characteristic updated to: %{public}@", buf, 0xCu);
    }
    __int16 v17 = [v9 value];

    if (v17)
    {
      id v18 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v19 = objc_msgSend(v9, "value", @"TVRCMatchPointServiceActiveStateKey");
      v22 = v19;
      v20 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      [v18 postNotificationName:@"TVRCMatchPointServiceActiveStateChangedNotification" object:v8 userInfo:v20];
    }
  }
}

- (void)_updateAccessoriesForHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Updating accessories for home %{public}@", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v6 = objc_msgSend(v4, "accessories", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TVRCHMHomeObserver *)self _updateServicesForAccessory:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_updateServicesForAccessory:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__TVRCHMHomeObserver__updateServicesForAccessory___block_invoke;
  v6[3] = &unk_2647AF9C8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(TVRCHMHomeObserver *)self _checkAccessoryReachabilityAndFetchTVServices:v5 withCompletion:v6];
}

void __50__TVRCHMHomeObserver__updateServicesForAccessory___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) deviceIdentifier];
  if (a2 && [v5 count])
  {
    [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v20 = v5;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          long long v13 = [*(id *)(a1 + 40) serviceToAccessoryIDMapping];
          [v13 setObject:v12 forKey:v6];

          long long v14 = [MEMORY[0x263F08A00] defaultCenter];
          [v14 postNotificationName:@"TVRCMatchPointServiceAddedNotification" object:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v9);
      id v5 = v20;
    }
  }
  else
  {
    int v15 = [*(id *)(a1 + 40) serviceToAccessoryIDMapping];
    id v7 = [v15 objectForKey:v6];

    if (v7)
    {
      id v16 = _TVRCHomeKitLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v17;
        _os_log_impl(&dword_2266D3000, v16, OS_LOG_TYPE_DEFAULT, "Removing accessory because it is no longer reachable or does not have a service type of HMServiceTypeTelevision anymore, %{public}@", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setDelegate:0];
      uint64_t v18 = [*(id *)(a1 + 40) serviceToAccessoryIDMapping];
      [v18 removeObjectForKey:v6];

      uint64_t v19 = [MEMORY[0x263F08A00] defaultCenter];
      [v19 postNotificationName:@"TVRCMatchPointServiceRemovedNotification" object:v7];
    }
  }
}

- (void)_checkAccessoryReachabilityAndFetchTVServices:(id)a3 withCompletion:(id)a4
{
  v37 = self;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v38 = a4;
  v39 = v5;
  id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  int v6 = [v5 services];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v50;
    uint64_t v10 = *MEMORY[0x263F0D850];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "serviceType", v37);
        int v14 = [v13 isEqualToString:v10];

        if (v14)
        {
          int v15 = _TVRCHomeKitLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v55 = v12;
            __int16 v56 = 2114;
            *(void *)v57 = v39;
            _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Found service %{public}@ with type HMServiceTypeTelevision in accessory %{public}@", buf, 0x16u);
          }

          [v40 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v8);
  }

  if (![v40 count])
  {
    long long v22 = _TVRCHomeKitLog();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 138543362;
    v55 = v39;
    long long v23 = "No Television service found in accessory %{public}@. Skipping it";
    goto LABEL_39;
  }
  int v16 = [v39 isReachable];
  uint64_t v17 = [v39 suspendedState];
  uint64_t v18 = [v39 reachableTransports] & 1;
  uint64_t v19 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v55 = v39;
    __int16 v56 = 1024;
    *(_DWORD *)v57 = v16;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v18;
    __int16 v58 = 1024;
    BOOL v59 = v17 == 3;
    _os_log_impl(&dword_2266D3000, v19, OS_LOG_TYPE_DEFAULT, "Accessory %{public}@ reachable: %{BOOL}d | locally reachable: %{BOOL}d | suspended: %{BOOL}d", buf, 0x1Eu);
  }

  if (v17 == 3 || (v18 ? (int v20 = v16) : (int v20 = 0), v20 == 1))
  {
    long long v21 = v38;
    if (v38) {
      (*((void (**)(id, uint64_t, id))v38 + 2))(v38, 1, v40);
    }
    goto LABEL_42;
  }
  if (v16 && !v18)
  {
    long long v24 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v39;
      _os_log_impl(&dword_2266D3000, v24, OS_LOG_TYPE_DEFAULT, "Accessory %{public}@ is reachable but does NOT contain ReachableTransportIP. Checking for BLE wake support...", buf, 0xCu);
    }

    __int16 v25 = [v40 lastObject];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v26 = [v25 characteristics];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v46;
      uint64_t v30 = *MEMORY[0x263F0BF08];
      while (2)
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v26);
          }
          v32 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          v33 = objc_msgSend(v32, "characteristicType", v37);
          int v34 = [v33 isEqualToString:v30];

          if (v34)
          {
            v35 = _TVRCHomeKitLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v55 = v32;
              __int16 v56 = 2114;
              *(void *)v57 = v25;
              _os_log_impl(&dword_2266D3000, v35, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeActiveIdentifier, %{public}@ for service %{public}@. Reading value...", buf, 0x16u);
            }

            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __83__TVRCHMHomeObserver__checkAccessoryReachabilityAndFetchTVServices_withCompletion___block_invoke;
            v41[3] = &unk_2647AF9F0;
            id v42 = v25;
            long long v21 = v38;
            id v44 = v38;
            id v43 = v40;
            id v36 = v25;
            [(TVRCHMHomeObserver *)v37 _readCharacteristic:v32 completion:v41];

            goto LABEL_42;
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
  }
  long long v22 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v39;
    long long v23 = "Skipping accessory %{public}@ as it not reachable and not suspended";
LABEL_39:
    _os_log_impl(&dword_2266D3000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
  }
LABEL_40:

  long long v21 = v38;
  if (v38) {
    (*((void (**)(id, void, void))v38 + 2))(v38, 0, 0);
  }
LABEL_42:
}

uint64_t __83__TVRCHMHomeObserver__checkAccessoryReachabilityAndFetchTVServices_withCompletion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Service %{public}@ locally reachable: %{BOOL}d ", (uint8_t *)&v7, 0x12u);
  }

  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, a1[5]);
  }
  return result;
}

- (void)_readCharacteristic:(id)a3 completion:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F0E268] readRequestWithCharacteristic:v6];
  __int16 v9 = (void *)MEMORY[0x263F0E250];
  v32[0] = v8;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  uint64_t v11 = [v9 characteristicBatchRequestWithReadRequests:v10];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke;
  v21[3] = &unk_2647AFA18;
  id v12 = v6;
  __int16 v25 = v26;
  id v22 = v12;
  long long v23 = self;
  id v13 = v7;
  id v24 = v13;
  [v11 setCompletionHandler:v21];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke_24;
  v18[3] = &unk_2647AFA40;
  v18[4] = self;
  int v20 = v26;
  id v14 = v13;
  id v19 = v14;
  [v11 setProgressHandler:v18];
  if (self->_currentHome)
  {
    int v15 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      currentHome = self->_currentHome;
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v11;
      __int16 v30 = 2114;
      v31 = currentHome;
      _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Performing Batch Characteristic Read Request %@, on home %{public}@", buf, 0x16u);
    }

    [(HMHome *)self->_currentHome performBatchCharacteristicRequest:v11];
  }
  else
  {
    uint64_t v17 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TVRCHMHomeObserver _readCharacteristic:completion:]((uint64_t)v11, v17);
    }
  }
  _Block_object_dispose(v26, 8);
}

void __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _TVRCHomeKitLog();
  uint64_t v5 = v4;
  if (!v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v13 = 138543618;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    int v16 = v11;
    id v7 = "Batch Characteristic completion called with no error - %{public}@, localReachability=%{BOOL}d";
    uint64_t v8 = v5;
    uint32_t v9 = 18;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) _checkErrorForLocallySuspendedAccessory:v3];
  }
  uint64_t v5 = _TVRCHomeKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v13 = 67109120;
    LODWORD(v14) = v6;
    id v7 = "Batch Characteristic completion with error, final check to see if accessory is locally reachable, locallyReachable=%{BOOL}d";
    uint64_t v8 = v5;
    uint32_t v9 = 8;
LABEL_10:
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
  }
LABEL_11:

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  }
}

void __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint32_t v9 = _TVRCHomeKitLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v8;
          _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Batch Characteristic Read progress handler called with response - %@", buf, 0xCu);
        }

        uint64_t v10 = [v8 error];
        if ([*(id *)(a1 + 32) _checkErrorForLocallySuspendedAccessory:v10])
        {
          uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
          if (!*(unsigned char *)(v11 + 24))
          {
            *(unsigned char *)(v11 + 24) = 1;
            uint64_t v12 = *(void *)(a1 + 40);
            if (v12) {
              (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
            }

            goto LABEL_16;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (BOOL)_checkErrorForLocallySuspendedAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v3;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Checking error for locally suspended accessory %{public}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v5 = [v3 userInfo];
    uint64_t v6 = [v5 valueForKey:*MEMORY[0x263F08608]];

    id v7 = _TVRCHomeKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[TVRCHMHomeObserver _checkErrorForLocallySuspendedAccessory:]((uint64_t)v6, v7);
    }

    uint64_t v8 = [v6 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x263F0C710]];
    if (v9)
    {
      uint64_t v10 = [v6 code];

      if (v10 != 2401)
      {
        LOBYTE(v9) = 0;
        goto LABEL_13;
      }
      uint64_t v8 = _TVRCHomeKitLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TVRCHMHomeObserver _checkErrorForLocallySuspendedAccessory:](v8);
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  LOBYTE(v9) = 1;
LABEL_14:

  return v9;
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (NSMutableDictionary)serviceToAccessoryIDMapping
{
  return self->_serviceToAccessoryIDMapping;
}

- (void)setServiceToAccessoryIDMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToAccessoryIDMapping, 0);

  objc_storeStrong((id *)&self->_currentHome, 0);
}

- (void)_readCharacteristic:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Could not perform Batch Characteristic Read Request %@ since no valid home was found", (uint8_t *)&v2, 0xCu);
}

void __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "Batch Characteristic completion called %{public}@. Error : %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_checkErrorForLocallySuspendedAccessory:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "Error code HMErrorCodeAccessorySuspendedLocally when reading active characteristic. Returning reachability as YES", v1, 2u);
}

- (void)_checkErrorForLocallySuspendedAccessory:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Underlying HomeKit Error - %{public}@", (uint8_t *)&v2, 0xCu);
}

@end