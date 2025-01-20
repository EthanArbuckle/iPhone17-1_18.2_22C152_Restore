@interface VGExternalAccessory
- (BOOL)_currentStatePassesEVRoutingRequirements;
- (BOOL)_isAccessoryTracked:(id)a3;
- (BOOL)_isConnectedToCarPlayAccessory;
- (BOOL)_isConnectedToElectricVehicle;
- (BOOL)_isConnectedVehicleAllowlisted;
- (BOOL)isConnectedToAccessoryWithIdentifier:(id)a3;
- (BOOL)isConnectedToVehicle:(id)a3;
- (VGExternalAccessory)init;
- (VGExternalAccessoryUpdating)accessoryUpdateDelegate;
- (id)_bluetoothIdentifier;
- (id)_firmwareId;
- (id)_identifier;
- (id)_modelIdFromArguments:(id)a3;
- (id)_vehicleForCurrentState;
- (id)_vehicleStateForCurrentState;
- (void)_accessoryDidConnect:(id)a3;
- (void)_accessoryDidDisconnect:(id)a3;
- (void)_accessoryDidUpdateVehicle:(id)a3;
- (void)_addNewCarPlayAccessory:(id)a3;
- (void)_checkAvailableAccessoriesAndAttachIfNeeded;
- (void)_notifyDelegateWithCurrentVehicle;
- (void)_removeCarPlayAccessory:(id)a3;
- (void)_updateFromVehicleInfo:(id)a3;
- (void)dealloc;
- (void)getStateOfChargeForVehicle:(id)a3 completion:(id)a4;
- (void)listCarsWithCompletion:(id)a3;
- (void)setAccessoryUpdateDelegate:(id)a3;
@end

@implementation VGExternalAccessory

void __46__VGExternalAccessory_listCarsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (char *)WeakRetained;
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 6) && [*((id *)WeakRetained + 3) count])
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v9 = *((void *)v3 + 6);
      v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
      (*(void (**)(uint64_t, NSObject *, void))(v4 + 16))(v4, v5, 0);
    }
    else
    {
      v6 = (void *)MEMORY[0x263F087E8];
      v7 = GEOErrorDomain();
      v5 = [v6 errorWithDomain:v7 code:-11 userInfo:0];

      v8 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v11 = v3;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "[%{public}p] Either accessory is not connected or we don't have any _currentVehicleState yet.", buf, 0xCu);
      }

      (*(void (**)(void, void, NSObject *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v5);
    }
  }
  else
  {
    v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[VGExternalAccessory listCarsWithCompletion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 677;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

void __66__VGExternalAccessory__checkAvailableAccessoriesAndAttachIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v2 = [*(id *)(a1 + 32) connectedAccessories];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v31;
      *(void *)&long long v4 = 134349570;
      long long v27 = v4;
      do
      {
        uint64_t v7 = 0;
        uint64_t v28 = v5;
        do
        {
          if (*(void *)v31 != v6) {
            objc_enumerationMutation(v2);
          }
          v8 = *(__CFString **)(*((void *)&v30 + 1) + 8 * v7);
          int v9 = [(__CFString *)v8 _vg_supportsCarPlay];
          v10 = VGGetExternalAccessoryLog();
          BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
          if (v9)
          {
            if (v11)
            {
              int v12 = [(__CFString *)v8 supportsCarPlay];
              uint64_t v13 = v6;
              uint64_t v14 = @"YES";
              if (!v12) {
                uint64_t v14 = @"NO";
              }
              v15 = v14;
              if ([(__CFString *)v8 supportsWirelessCarPlay]) {
                v16 = @"YES";
              }
              else {
                v16 = @"NO";
              }
              v17 = v16;
              if ([(__CFString *)v8 supportsUSBCarPlay]) {
                v18 = @"YES";
              }
              else {
                v18 = @"NO";
              }
              v19 = v2;
              v20 = v18;
              *(_DWORD *)buf = 134350082;
              v35 = (const char *)WeakRetained;
              __int16 v36 = 2112;
              uint64_t v37 = (uint64_t)v8;
              __int16 v38 = 2112;
              v39 = v15;
              __int16 v40 = 2112;
              v41 = v17;
              __int16 v42 = 2112;
              v43 = v20;
              _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "[%{public}p] init: will use accessory: %@ supportsCarPlay: %@, supportsWirelessCarPlay: %@. supportsUSBCarPlay: %@", buf, 0x34u);

              v2 = v19;
              uint64_t v6 = v13;
              uint64_t v5 = v28;
            }
            [WeakRetained _addNewCarPlayAccessory:v8];
          }
          else
          {
            if (v11)
            {
              *(_DWORD *)buf = v27;
              v35 = (const char *)WeakRetained;
              __int16 v36 = 2048;
              uint64_t v37 = (uint64_t)v8;
              __int16 v38 = 2112;
              v39 = v8;
              _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "[%{public}p] init: skipping accessory as it doesn't support CarPlay: %p %@", buf, 0x20u);
            }
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v2 countByEnumeratingWithState:&v30 objects:v44 count:16];
      }
      while (v5);
    }

    v21 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [WeakRetained[3] count];
      *(_DWORD *)buf = 134349312;
      v35 = (const char *)WeakRetained;
      __int16 v36 = 2048;
      uint64_t v37 = v22;
      v23 = "[%{public}p] _checkCurrentAccessoriesAndAttachIfNeeded: currently connected to %lu CarPlay accessories";
      v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_INFO;
      uint32_t v26 = 22;
LABEL_28:
      _os_log_impl(&dword_214A2C000, v24, v25, v23, buf, v26);
    }
  }
  else
  {
    v21 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[VGExternalAccessory _checkAvailableAccessoriesAndAttachIfNeeded]_block_invoke";
      __int16 v36 = 1024;
      LODWORD(v37) = 268;
      v23 = "strongSelf went away in %s line %d";
      v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      uint32_t v26 = 18;
      goto LABEL_28;
    }
  }
}

- (VGExternalAccessory)init
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)VGExternalAccessory;
  v2 = [(VGExternalAccessory *)&v20 init];
  if (v2)
  {
    uint64_t v3 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v22 = v2;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "[%{public}p] init: created new VGExternalAccessory", buf, 0xCu);
    }

    long long v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("VGExternalAccessory.WorkQueue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("VGExternalAccessory.DelegateQueue", v7);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    trackedAccessoriesByConnectionId = v2->_trackedAccessoriesByConnectionId;
    v2->_trackedAccessoriesByConnectionId = (NSMutableDictionary *)v10;

    int v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v2 selector:sel__accessoryDidConnect_ name:*MEMORY[0x263F04E80] object:0];
    [v12 addObserver:v2 selector:sel__accessoryDidUpdateVehicle_ name:*MEMORY[0x263F04EA0] object:0];
    [v12 addObserver:v2 selector:sel__accessoryDidDisconnect_ name:*MEMORY[0x263F04E88] object:0];
    uint64_t v13 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v22 = v2;
      _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_INFO, "[%{public}p] Registering for local accessory notifications", buf, 0xCu);
    }

    uint64_t v14 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
    [v14 registerForLocalNotifications];

    [(VGExternalAccessory *)v2 _checkAvailableAccessoriesAndAttachIfNeeded];
    int BOOL = GEOConfigGetBOOL();
    p_super = VGGetExternalAccessoryLog();
    BOOL v17 = os_log_type_enabled(p_super, OS_LOG_TYPE_INFO);
    if (BOOL)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v22 = v2;
        _os_log_impl(&dword_214A2C000, p_super, OS_LOG_TYPE_INFO, "[%{public}p] Allowlisting enabled, will initialize model filter", buf, 0xCu);
      }

      v18 = objc_alloc_init(VGExternalAccessoryModelFilter);
      p_super = &v2->_modelFilter->super;
      v2->_modelFilter = v18;
    }
    else if (v17)
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v22 = v2;
      _os_log_impl(&dword_214A2C000, p_super, OS_LOG_TYPE_INFO, "[%{public}p] Allowlisting disabled, will not initialize model filter", buf, 0xCu);
    }
  }
  return v2;
}

- (void)_checkAvailableAccessoriesAndAttachIfNeeded
{
  uint64_t v3 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__VGExternalAccessory__checkAvailableAccessoriesAndAttachIfNeeded__block_invoke;
  block[3] = &unk_264226208;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setAccessoryUpdateDelegate:(id)a3
{
}

- (void)listCarsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      uint64_t v6 = NSString;
      id v7 = self;
      id v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      id v8 = @"<nil>";
    }
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    __int16 v16 = 2080;
    BOOL v17 = "-[VGExternalAccessory listCarsWithCompletion:]";
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] %s", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__VGExternalAccessory_listCarsWithCompletion___block_invoke;
  block[3] = &unk_264226428;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v8 = self;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "[%{public}p] dealloc: deallocating accessory", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
  [v4 unregisterForLocalNotifications];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)VGExternalAccessory;
  [(VGExternalAccessory *)&v6 dealloc];
}

- (void)_addNewCarPlayAccessory:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 connectionID])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionID"));
    objc_super v6 = [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId objectForKeyedSubscript:v5];

    if (v6)
    {
      id v7 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [v4 name];
        int v13 = 134349570;
        uint64_t v14 = self;
        __int16 v15 = 2112;
        __int16 v16 = v8;
        __int16 v17 = 2112;
        uint64_t v18 = (uint64_t)v5;
        _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, "[%{public}p] _addNewCarPlayAccessory: trying to add an accessory, it is already tracked -> replacing, name: %@ key: %@", (uint8_t *)&v13, 0x20u);
      }
    }
    uint64_t v9 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v4 name];
      int v13 = 134349570;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = (uint64_t)v5;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_INFO, "[%{public}p] _addNewCarPlayAccessory: added a new accessory: %@ key: %@.", (uint8_t *)&v13, 0x20u);
    }
    [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId setObject:v4 forKeyedSubscript:v5];
    BOOL v11 = [v4 getVehicleInfoData];
    [(VGExternalAccessory *)self _updateFromVehicleInfo:v11];

    id v12 = [v4 vehicleInfoInitialData];
    [(VGExternalAccessory *)self _updateFromVehicleInfo:v12];
    goto LABEL_11;
  }
  id v5 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    id v12 = [v4 name];
    int v13 = 134349570;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = [v4 connectionID];
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_FAULT, "[%{public}p] _addNewCarPlayAccessory: tried to add an accessory, but it has an invalid key. %@, %lu", (uint8_t *)&v13, 0x20u);
LABEL_11:
  }
}

- (void)_removeCarPlayAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 connectionID])
  {
    id v5 = VGGetExternalAccessoryLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    id v8 = [v4 name];
    int v15 = 134349570;
    __int16 v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = [v4 connectionID];
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "[%{public}p] _removeCarPlayAccessory: tried to remove an accessory that has an invalid key. %@, %lu", (uint8_t *)&v15, 0x20u);
LABEL_13:

    goto LABEL_14;
  }
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionID"));
  objc_super v6 = [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId objectForKeyedSubscript:v5];

  id v7 = VGGetExternalAccessoryLog();
  id v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v4 name];
      int v15 = 134349570;
      __int16 v16 = self;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = (uint64_t)v5;
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "[%{public}p] _removeCarPlayAccessory: tried to remove an accessory that was not tracked. %@, %@", (uint8_t *)&v15, 0x20u);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v4 name];
    int v15 = 134349570;
    __int16 v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = (uint64_t)v5;
    _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "[%{public}p] _removeCarPlayAccessory: removing accessory with key. %@, %@", (uint8_t *)&v15, 0x20u);
  }
  [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId removeObjectForKey:v5];
  if (![(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId count])
  {
    id v10 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v15 = 134349056;
      __int16 v16 = self;
      _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "[%{public}p] _removeCarPlayAccessory: currently not tracking any accessories. clearing tracked vehicle state", (uint8_t *)&v15, 0xCu);
    }

    accessoryState = self->_accessoryState;
    self->_accessoryState = 0;

    currentVehicleState = self->_currentVehicleState;
    self->_currentVehicleState = 0;

    currentVehicle = self->_currentVehicle;
    self->_currentVehicle = 0;

    [(VGExternalAccessory *)self _notifyDelegateWithCurrentVehicle];
  }
LABEL_14:
}

- (BOOL)_isAccessoryTracked:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 connectionID])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionID"));
    objc_super v6 = [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId objectForKeyedSubscript:v5];
    BOOL v7 = v6 != 0;
  }
  else
  {
    id v8 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v4 name];
      int v11 = 134349570;
      id v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = [v4 connectionID];
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "[%{public}p] _isAccessoryTracked: tried to check status of accessory with an invalid key. %@ %lu", (uint8_t *)&v11, 0x20u);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_accessoryDidConnect:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidConnect: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__VGExternalAccessory__accessoryDidConnect___block_invoke;
  v8[3] = &unk_264226208;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __44__VGExternalAccessory__accessoryDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) userInfo];
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F04E90]];

    if (v4 && ([v4 _vg_supportsCarPlay] & 1) != 0)
    {
      id v5 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        if ([v4 supportsCarPlay]) {
          objc_super v6 = @"YES";
        }
        else {
          objc_super v6 = @"NO";
        }
        id v7 = v6;
        if ([v4 supportsWirelessCarPlay]) {
          id v8 = @"YES";
        }
        else {
          id v8 = @"NO";
        }
        id v9 = v8;
        if ([v4 supportsUSBCarPlay]) {
          id v10 = @"YES";
        }
        else {
          id v10 = @"NO";
        }
        int v11 = v10;
        int v13 = 134350338;
        id v14 = WeakRetained;
        __int16 v15 = 2048;
        uint64_t v16 = v4;
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        __int16 v19 = 2112;
        uint64_t v20 = v7;
        __int16 v21 = 2112;
        uint64_t v22 = v9;
        __int16 v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidConnect: new accessory: %p, %@, supportsCarPlay: %@, supportsWirelessCarPlay: %@. supportsUSBCarPlay: %@", (uint8_t *)&v13, 0x3Eu);
      }
      [WeakRetained _addNewCarPlayAccessory:v4];
    }
    else
    {
      id v12 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 134349570;
        id v14 = WeakRetained;
        __int16 v15 = 2048;
        uint64_t v16 = v4;
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_ERROR, "[%{public}p] _accessoryDidConnect: received an unsupported accessory: %p, %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  else
  {
    id v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      id v14 = "-[VGExternalAccessory _accessoryDidConnect:]_block_invoke";
      __int16 v15 = 1024;
      LODWORD(v16) = 352;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v13, 0x12u);
    }
  }
}

- (void)_accessoryDidDisconnect:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidDisconnect: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__VGExternalAccessory__accessoryDidDisconnect___block_invoke;
  v8[3] = &unk_264226208;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __47__VGExternalAccessory__accessoryDidDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) userInfo];
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F04E90]];

    char v5 = [v4 _vg_supportsCarPlay];
    objc_super v6 = VGGetExternalAccessoryLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        int v9 = 134349314;
        id v10 = WeakRetained;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidDisconnect: will disconnect a tracked accessory: %@", (uint8_t *)&v9, 0x16u);
      }

      [WeakRetained _removeCarPlayAccessory:v4];
    }
    else
    {
      if (v7)
      {
        id v8 = [v4 name];
        int v9 = 134349314;
        id v10 = WeakRetained;
        __int16 v11 = 2112;
        id v12 = v8;
        _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidDisconnect: disconnected accessory that is not tracked %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    id v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[VGExternalAccessory _accessoryDidDisconnect:]_block_invoke";
      __int16 v11 = 1024;
      LODWORD(v12) = 368;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)_accessoryDidUpdateVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidUpdateVehicle: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__VGExternalAccessory__accessoryDidUpdateVehicle___block_invoke;
  v8[3] = &unk_264226208;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __50__VGExternalAccessory__accessoryDidUpdateVehicle___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) userInfo];
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F04E90]];

    if (v4 && ([v4 _vg_supportsCarPlay] & 1) == 0)
    {
      id v10 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = [v4 name];
        int v12 = 134349314;
        __int16 v13 = WeakRetained;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidUpdateVehicle: accessory %@ does not support CarPlay, ignoring update", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      char v5 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_super v6 = [v4 name];
        id v7 = [*(id *)(a1 + 32) userInfo];
        int v12 = 134349570;
        __int16 v13 = WeakRetained;
        __int16 v14 = 2112;
        uint64_t v15 = v6;
        __int16 v16 = 2112;
        __int16 v17 = v7;
        _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "[%{public}p] _accessoryDidUpdateVehicle: received a vehicle update update for accessory %@ with userInfo: %@", (uint8_t *)&v12, 0x20u);
      }
      if (v4 && ([WeakRetained _isAccessoryTracked:v4] & 1) == 0)
      {
        id v8 = VGGetExternalAccessoryLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          id v9 = [v4 name];
          int v12 = 134349314;
          __int16 v13 = WeakRetained;
          __int16 v14 = 2112;
          uint64_t v15 = v9;
        }
        [WeakRetained _addNewCarPlayAccessory:v4];
      }
      id v10 = [*(id *)(a1 + 32) userInfo];
      [WeakRetained _updateFromVehicleInfo:v10];
    }
  }
  else
  {
    id v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      __int16 v13 = "-[VGExternalAccessory _accessoryDidUpdateVehicle:]_block_invoke";
      __int16 v14 = 1024;
      LODWORD(v15) = 384;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (void)_updateFromVehicleInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = VGGetExternalAccessoryLog();
  objc_super v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      int v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "[%{public}p] _updateFromVehicleInfo: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__VGExternalAccessory__updateFromVehicleInfo___block_invoke;
    v8[3] = &unk_264226208;
    objc_copyWeak(&v10, (id *)buf);
    id v9 = v4;
    dispatch_async(workQueue, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      int v12 = self;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "[%{public}p] _updateFromVehicleInfo: tried to update from a nil vehicleInfo.", buf, 0xCu);
    }
  }
}

void __46__VGExternalAccessory__updateFromVehicleInfo___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[4];
    if (!v4)
    {
      char v5 = objc_alloc_init(VGExternalAccessoryState);
      objc_super v6 = (void *)*((void *)v3 + 4);
      *((void *)v3 + 4) = v5;

      id v4 = (void *)*((void *)v3 + 4);
    }
    [v4 _updateWithVehicleInfo:*(void *)(a1 + 32)];
    id v7 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *((void *)v3 + 4);
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 134349570;
      uint64_t v18 = (const char *)v3;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "[%{public}p] _updateFromVehicleInfo: did update accessoryState: %@ from vehicleInfo: %@", (uint8_t *)&v17, 0x20u);
    }

    uint64_t v10 = [v3 _vehicleStateForCurrentState];
    __int16 v11 = (void *)*((void *)v3 + 5);
    *((void *)v3 + 5) = v10;

    uint64_t v12 = [v3 _vehicleForCurrentState];
    __int16 v13 = (void *)*((void *)v3 + 6);
    *((void *)v3 + 6) = v12;

    [*((id *)v3 + 6) _updateWithVehicleState:*((void *)v3 + 5)];
    id v14 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *((void *)v3 + 6);
      int v17 = 134349314;
      uint64_t v18 = (const char *)v3;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_INFO, "[%{public}p] updated _currentVehicle: %@", (uint8_t *)&v17, 0x16u);
    }

    [v3 _notifyDelegateWithCurrentVehicle];
  }
  else
  {
    __int16 v16 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[VGExternalAccessory _updateFromVehicleInfo:]_block_invoke";
      __int16 v19 = 1024;
      LODWORD(v20) = 411;
      _os_log_impl(&dword_214A2C000, v16, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v17, 0x12u);
    }
  }
}

- (void)_notifyDelegateWithCurrentVehicle
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    __int16 v13 = self;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "[%{public}p] _notifyDelegateWithCurrentVehicle", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v4 = [(VGExternalAccessory *)self accessoryUpdateDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = (void *)[(VGVehicle *)self->_currentVehicle copy];
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__VGExternalAccessory__notifyDelegateWithCurrentVehicle__block_invoke;
    v9[3] = &unk_264226208;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v6;
    id v8 = v6;
    dispatch_async(delegateQueue, v9);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak((id *)buf);
}

void __56__VGExternalAccessory__notifyDelegateWithCurrentVehicle__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained accessoryUpdateDelegate];
    if (v4)
    {
      char v5 = v4;
      objc_super v6 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v9 = 134349314;
        id v10 = v3;
        __int16 v11 = 2112;
        uint64_t v12 = v7;
        _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_INFO, "[%{public}p] notifying delegate with vehicle: %@", (uint8_t *)&v9, 0x16u);
      }

      [v5 accessoryUpdatedWithVehicle:*(void *)(a1 + 32)];
    }
    else
    {
      id v8 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315394;
        id v10 = "-[VGExternalAccessory _notifyDelegateWithCurrentVehicle]_block_invoke";
        __int16 v11 = 1024;
        LODWORD(v12) = 434;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", (uint8_t *)&v9, 0x12u);
      }

      char v5 = 0;
    }
  }
  else
  {
    char v5 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[VGExternalAccessory _notifyDelegateWithCurrentVehicle]_block_invoke";
      __int16 v11 = 1024;
      LODWORD(v12) = 433;
      _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (id)_vehicleForCurrentState
{
  if ([(VGExternalAccessory *)self _currentStatePassesEVRoutingRequirements])
  {
    id v3 = [VGVehicle alloc];
    v24 = [(VGExternalAccessoryState *)self->_accessoryState name];
    uint32_t v26 = (void *)[v24 copy];
    uint64_t v25 = [(VGExternalAccessoryState *)self->_accessoryState year];
    uint64_t v23 = [(VGExternalAccessoryState *)self->_accessoryState manufacturer];
    uint64_t v22 = (void *)[v23 copy];
    __int16 v21 = [(VGExternalAccessoryState *)self->_accessoryState model];
    uint64_t v20 = (void *)[v21 copy];
    __int16 v19 = [(VGExternalAccessoryState *)self->_accessoryState colorHex];
    uint64_t v4 = [v19 stringByReplacingOccurrencesOfString:@"#" withString:&stru_26C592A20];
    if ([v4 length] == 6)
    {
      char v5 = [v4 stringByAppendingString:@"ff"];
    }
    else
    {
      char v5 = 0;
    }

    uint64_t v18 = [(VGExternalAccessory *)self _identifier];
    uint64_t v7 = (void *)[v18 copy];
    int v17 = [(VGExternalAccessory *)self _bluetoothIdentifier];
    id v8 = (void *)[v17 copy];
    int v9 = [(VGExternalAccessoryState *)self->_accessoryState supportedConnectors];
    unint64_t v10 = [v9 unsignedIntegerValue];
    uint64_t v11 = v10 & 0x128 | (v10 >> 2) & 1 | (2 * (v10 & 3)) & 0x7F | (v10 >> 2) & 0x10 | (v10 >> 1) & 0x40 | (((v10 >> 4) & 1) << 7);
    uint64_t v12 = [(VGExternalAccessoryState *)self->_accessoryState powerByConnector];
    uint64_t v13 = (void *)[v12 copy];
    objc_super v6 = [(VGVehicle *)v3 initWithDisplayName:v26 year:v25 manufacturer:v22 model:v20 colorHex:v5 headUnitIdentifier:v7 headUnitBluetoothIdentifier:v8 supportedConnectors:v11 powerByConnector:v13];

    uint64_t v14 = [(VGExternalAccessory *)self _identifier];
    uint64_t v15 = (void *)[v14 copy];
    [(VGVehicle *)v6 setIapIdentifier:v15];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)_vehicleStateForCurrentState
{
  if ([(VGExternalAccessory *)self _currentStatePassesEVRoutingRequirements])
  {
    uint64_t v20 = [VGVehicleState alloc];
    uint64_t v22 = [(VGExternalAccessory *)self _identifier];
    __int16 v16 = (void *)[v22 copy];
    id v3 = [MEMORY[0x263EFF910] date];
    __int16 v21 = [(VGExternalAccessoryState *)self->_accessoryState batteryCharge];
    __int16 v19 = [(VGExternalAccessoryState *)self->_accessoryState currentEVRange];
    uint64_t v18 = [(VGExternalAccessoryState *)self->_accessoryState maxEVRange];
    uint64_t v14 = [(VGExternalAccessoryState *)self->_accessoryState minBatteryCapacity];
    uint64_t v13 = [(VGExternalAccessoryState *)self->_accessoryState currentBatteryCapacity];
    uint64_t v4 = [(VGExternalAccessoryState *)self->_accessoryState maxBatteryCapacity];
    int v17 = [(VGExternalAccessoryState *)self->_accessoryState consumptionArguments];
    char v5 = (void *)[v17 copy];
    uint64_t v15 = [(VGExternalAccessoryState *)self->_accessoryState chargingArguments];
    objc_super v6 = (void *)[v15 copy];
    BOOL v7 = [(VGExternalAccessoryState *)self->_accessoryState isCharging];
    id v8 = [(VGExternalAccessoryState *)self->_accessoryState activeConnector];
    unint64_t v9 = [v8 unsignedIntegerValue];
    LOBYTE(v12) = v7;
    unint64_t v10 = [(VGVehicleState *)v20 initWithIdentifier:v16 dateOfUpdate:v3 origin:1 batteryPercentage:v21 currentEVRange:v19 maxEVRange:v18 minBatteryCapacity:v14 currentBatteryCapacity:v13 maxBatteryCapacity:v4 consumptionArguments:v5 chargingArguments:v6 isCharging:v12 activeConnector:v9 & 0x128 | (v9 >> 2) & 1 | (2 * (v9 & 3)) & 0x7F | (v9 >> 2) & 0x10 | (v9 >> 1) & 0x40 | (((v9 >> 4) & 1) << 7)];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)_currentStatePassesEVRoutingRequirements
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  LODWORD(v3) = [(VGExternalAccessory *)self _isConnectedToElectricVehicle];
  if (v3)
  {
    id v3 = [(VGExternalAccessory *)self _identifier];
    if (v3)
    {
      accessoryState = self->_accessoryState;

      if (accessoryState)
      {
        if ([(VGExternalAccessory *)self _isConnectedVehicleAllowlisted])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        char v5 = VGGetExternalAccessoryLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          objc_super v6 = [(VGExternalAccessoryState *)self->_accessoryState consumptionArguments];
          BOOL v7 = [(VGExternalAccessory *)self _modelIdFromArguments:v6];
          id v8 = [(VGExternalAccessoryState *)self->_accessoryState chargingArguments];
          unint64_t v9 = [(VGExternalAccessory *)self _modelIdFromArguments:v8];
          unint64_t v10 = [(VGExternalAccessory *)self _firmwareId];
          uint64_t v11 = [(VGExternalAccessoryState *)self->_accessoryState year];
          uint64_t v12 = [(VGExternalAccessoryState *)self->_accessoryState model];
          int v14 = 134350338;
          uint64_t v15 = self;
          __int16 v16 = 2112;
          int v17 = v7;
          __int16 v18 = 2112;
          __int16 v19 = v9;
          __int16 v20 = 2112;
          __int16 v21 = v10;
          __int16 v22 = 2112;
          uint64_t v23 = v11;
          __int16 v24 = 2112;
          uint64_t v25 = v12;
          _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "[%{public}p] Connected vehicle is not allowlisted. consumption modelId: %@, charging modelId: %@, firmwareId: %@, year: %@, model: %@", (uint8_t *)&v14, 0x3Eu);
        }
      }
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)_modelIdFromArguments:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = VGDictionaryFromVGVehicleArguments(v4);
  if (v5)
  {
    objc_super v6 = GEOConfigGetString();
    BOOL v7 = [v5 objectForKeyedSubscript:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = v7;
      id v8 = v7;
      goto LABEL_10;
    }
    unint64_t v9 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v11 = 134349314;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_FAULT, "[%{public}p] Failed to parse model id from arguments: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    BOOL v7 = VGGetExternalAccessoryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v11 = 134349314;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_FAULT, "[%{public}p] Failed to parse arguments: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)_isConnectedVehicleAllowlisted
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (GEOConfigGetBOOL())
  {
    id v3 = [(VGExternalAccessoryState *)self->_accessoryState consumptionArguments];
    id v4 = [(VGExternalAccessory *)self _modelIdFromArguments:v3];

    char v5 = [(VGExternalAccessoryState *)self->_accessoryState chargingArguments];
    objc_super v6 = [(VGExternalAccessory *)self _modelIdFromArguments:v5];

    if (v4 && v6)
    {
      modelFilter = self->_modelFilter;
      id v8 = [(VGExternalAccessory *)self _firmwareId];
      unint64_t v9 = [(VGExternalAccessoryState *)self->_accessoryState year];
      unint64_t v10 = [(VGExternalAccessoryState *)self->_accessoryState model];
      BOOL v11 = [(VGExternalAccessoryModelFilter *)modelFilter allowsVehicleWithModelId:v4 firmwareId:v8 year:v9 model:v10];

      uint64_t v12 = self->_modelFilter;
      __int16 v13 = [(VGExternalAccessory *)self _firmwareId];
      id v14 = [(VGExternalAccessoryState *)self->_accessoryState year];
      uint64_t v15 = [(VGExternalAccessoryState *)self->_accessoryState model];
      BOOL v16 = [(VGExternalAccessoryModelFilter *)v12 allowsVehicleWithModelId:v6 firmwareId:v13 year:v14 model:v15];

      if (v11 && v16)
      {
        BOOL v17 = 1;
LABEL_13:

        return v17;
      }
      __int16 v18 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v22 = 134349056;
        uint64_t v23 = self;
        _os_log_impl(&dword_214A2C000, v18, OS_LOG_TYPE_ERROR, "[%{public}p] Currently connected vehicle is an EV, but does is not allow listed. Onboarding won't be allowed", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      __int16 v18 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        __int16 v19 = [(VGExternalAccessoryState *)self->_accessoryState consumptionArguments];
        __int16 v20 = [(VGExternalAccessoryState *)self->_accessoryState chargingArguments];
        int v22 = 134349570;
        uint64_t v23 = self;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        long long v27 = v20;
        _os_log_impl(&dword_214A2C000, v18, OS_LOG_TYPE_FAULT, "[%{public}p] Vehicle does not have valid consumption or charging arguments. consumption: %@, charging: %@", (uint8_t *)&v22, 0x20u);
      }
    }

    BOOL v17 = 0;
    goto LABEL_13;
  }
  return 1;
}

- (BOOL)_isConnectedToElectricVehicle
{
  if (![(VGExternalAccessory *)self _isConnectedToCarPlayAccessory]) {
    return 0;
  }
  id v3 = [(VGExternalAccessoryState *)self->_accessoryState consumptionArguments];
  if ([v3 length])
  {
    id v4 = [(VGExternalAccessoryState *)self->_accessoryState chargingArguments];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isConnectedToCarPlayAccessory
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isConnected])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_identifier
{
  v2 = [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId allValues];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    if (GEOConfigGetBOOL())
    {
      uint64_t v4 = @"CarDisplaySim";
    }
    else
    {
      BOOL v5 = [v3 serialNumber];
      uint64_t v4 = (__CFString *)[v5 copy];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_bluetoothIdentifier
{
  v2 = [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId allValues];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    if (GEOConfigGetBOOL())
    {
      uint64_t v4 = @"CarDisplaySim";
    }
    else
    {
      BOOL v5 = [v3 macAddress];
      uint64_t v4 = (__CFString *)[v5 copy];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_firmwareId
{
  v2 = [(NSMutableDictionary *)self->_trackedAccessoriesByConnectionId allValues];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    if (GEOConfigGetBOOL())
    {
      uint64_t v4 = @"CarDisplaySimFirmware";
    }
    else
    {
      BOOL v5 = [v3 firmwareRevision];
      uint64_t v4 = (__CFString *)[v5 copy];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isConnectedToVehicle:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      objc_super v6 = NSString;
      long long v7 = self;
      long long v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      long long v8 = @"<nil>";
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VGExternalAccessory isConnectedToVehicle:]";
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] %s", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__VGExternalAccessory_isConnectedToVehicle___block_invoke;
  block[3] = &unk_2642263D8;
  id v14 = v4;
  uint64_t v15 = buf;
  void block[4] = self;
  id v10 = v4;
  dispatch_sync(workQueue, block);
  char v11 = *(unsigned char *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v11;
}

void __44__VGExternalAccessory_isConnectedToVehicle___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isConnectedToCarPlayAccessory])
  {
    v2 = [*(id *)(a1 + 40) iapIdentifier];
    if (v2)
    {
      BOOL v5 = v2;
      uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) iapIdentifier];
      id v4 = [*(id *)(a1 + 40) iapIdentifier];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 isEqualToString:v4];

      v2 = v5;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (BOOL)isConnectedToAccessoryWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      objc_super v6 = NSString;
      long long v7 = self;
      long long v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      long long v8 = @"<nil>";
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VGExternalAccessory isConnectedToAccessoryWithIdentifier:]";
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] %s", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__VGExternalAccessory_isConnectedToAccessoryWithIdentifier___block_invoke;
  block[3] = &unk_2642263D8;
  id v14 = v4;
  uint64_t v15 = buf;
  void block[4] = self;
  id v10 = v4;
  dispatch_sync(workQueue, block);
  char v11 = *(unsigned char *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v11;
}

void __60__VGExternalAccessory_isConnectedToAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isConnectedToCarPlayAccessory])
  {
    id v2 = [*(id *)(a1 + 32) _identifier];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)getStateOfChargeForVehicle:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = VGGetExternalAccessoryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      long long v9 = NSString;
      id v10 = self;
      char v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
    }
    else
    {
      char v11 = @"<nil>";
    }
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v11;
    __int16 v21 = 2080;
    int v22 = "-[VGExternalAccessory getStateOfChargeForVehicle:completion:]";
    _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] %s", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__VGExternalAccessory_getStateOfChargeForVehicle_completion___block_invoke;
  block[3] = &unk_264226400;
  objc_copyWeak(&v18, (id *)buf);
  id v16 = v6;
  id v17 = v7;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __61__VGExternalAccessory_getStateOfChargeForVehicle_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[5] && [WeakRetained[3] count])
    {
      id v4 = [*(id *)(a1 + 32) iapIdentifier];
      BOOL v5 = [v3[5] identifier];
      char v6 = [v4 isEqualToString:v5];

      if (v6)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_14;
      }
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      id v13 = GEOErrorDomain();
      long long v9 = [v12 errorWithDomain:v13 code:-13 userInfo:0];

      id v10 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v14 = [*(id *)(a1 + 32) identifier];
        id v15 = v3[5];
        int v16 = 134349570;
        id v17 = (const char *)v3;
        __int16 v18 = 2112;
        __int16 v19 = v14;
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "[%{public}p] SoC requested for %@ but the currently connected vehicle is %@", (uint8_t *)&v16, 0x20u);
      }
    }
    else
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      long long v8 = GEOErrorDomain();
      long long v9 = [v7 errorWithDomain:v8 code:-11 userInfo:0];

      id v10 = VGGetExternalAccessoryLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v16 = 134349056;
        id v17 = (const char *)v3;
        _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_ERROR, "[%{public}p] Either accessory is not connected or we don't have any _currentVehicleState yet.", (uint8_t *)&v16, 0xCu);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  char v11 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    id v17 = "-[VGExternalAccessory getStateOfChargeForVehicle:completion:]_block_invoke";
    __int16 v18 = 1024;
    LODWORD(v19) = 655;
    _os_log_impl(&dword_214A2C000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v16, 0x12u);
  }

LABEL_14:
}

- (VGExternalAccessoryUpdating)accessoryUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryUpdateDelegate);

  return (VGExternalAccessoryUpdating *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessoryUpdateDelegate);
  objc_storeStrong((id *)&self->_modelFilter, 0);
  objc_storeStrong((id *)&self->_currentVehicle, 0);
  objc_storeStrong((id *)&self->_currentVehicleState, 0);
  objc_storeStrong((id *)&self->_accessoryState, 0);
  objc_storeStrong((id *)&self->_trackedAccessoriesByConnectionId, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end