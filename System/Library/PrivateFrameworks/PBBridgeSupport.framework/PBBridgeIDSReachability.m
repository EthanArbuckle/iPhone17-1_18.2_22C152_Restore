@interface PBBridgeIDSReachability
+ (id)deviceStatusFromIDSDevices:(id)a3 nrDevices:(id)a4;
+ (id)nrDevices;
+ (id)sharedInstance;
- (PBBridgeIDSReachability)init;
- (id)getDeviceStatusChangeFromIDSDevices:(id)a3 nrDevices:(id)a4;
- (unint64_t)reachabilityForDevice:(id)a3;
- (void)_processDevices:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 linkedDevicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
@end

@implementation PBBridgeIDSReachability

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PBBridgeIDSReachability_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_object;
  return v2;
}

- (void)addObserver:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 136315650;
    v15 = "-[PBBridgeIDSReachability addObserver:]";
    __int16 v16 = 2112;
    v17 = v7;
    __int16 v18 = 2048;
    id v19 = v4;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s %@[%p]", buf, 0x20u);
  }
  v8 = objc_opt_new();
  [v8 setObserver:v4];
  os_unfair_lock_lock(&self->_lock);
  v9 = self->_activeDeviceStatus;
  [(NSMutableOrderedSet *)self->_observers addObject:v8];
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__PBBridgeIDSReachability_addObserver___block_invoke;
    block[3] = &unk_264401628;
    block[4] = self;
    id v12 = v8;
    v13 = v9;
    dispatch_async(queue, block);
  }
}

uint64_t __41__PBBridgeIDSReachability_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_object = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (PBBridgeIDSReachability)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)PBBridgeIDSReachability;
  v2 = [(PBBridgeIDSReachability *)&v12 init];
  if (v2)
  {
    v3 = pbb_bridge_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v14 = "-[PBBridgeIDSReachability init]";
      _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.bridge.COSIDSReachability.ids", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9B0] orderedSet];
    observers = v2->_observers;
    v2->_observers = (NSMutableOrderedSet *)v6;

    v8 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__PBBridgeIDSReachability_init__block_invoke;
    block[3] = &unk_2644011C8;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

void __31__PBBridgeIDSReachability_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.pbbridge.connectivity"];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  [*(id *)(*(void *)(a1 + 32) + 16) addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 24)];
  v5 = *(id **)(a1 + 32);
  objc_msgSend(v5[2], "pb_mineTinkerDevices");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 _processDevices:v6];
}

- (void)_processDevices:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(id)objc_opt_class() nrDevices];
  id v6 = [(PBBridgeIDSReachability *)self getDeviceStatusChangeFromIDSDevices:v4 nrDevices:v5];
  if ([v6 count])
  {
    v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v6;
      _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "IDSDevice status change: %@", buf, 0xCu);
    }

    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)[(NSMutableOrderedSet *)self->_observers copy];
    os_unfair_lock_unlock(&self->_lock);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "fireReachability:deviceStatus:devices:", self, v6, v5, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)getDeviceStatusChangeFromIDSDevices:(id)a3 nrDevices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() deviceStatusFromIDSDevices:v7 nrDevices:v6];

  id v9 = [MEMORY[0x263EFF980] array];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  activeDeviceStatus = self->_activeDeviceStatus;
  p_activeDeviceStatus = &self->_activeDeviceStatus;
  uint64_t v11 = activeDeviceStatus;
  if (!activeDeviceStatus)
  {
    if (!v8) {
      goto LABEL_12;
    }
    objc_storeStrong((id *)p_activeDeviceStatus, v8);
    __int16 v18 = v9;
    long long v17 = v8;
    goto LABEL_8;
  }
  if (v8)
  {
    BOOL v14 = [(PBBridgeIDSReachabilityStatusObject *)v11 isEqual:v8];
    long long v15 = *p_activeDeviceStatus;
    if (v14)
    {
      uint64_t v16 = [(PBBridgeIDSReachabilityStatusObject *)*p_activeDeviceStatus reachability];
      if (v16 == [(PBBridgeIDSReachabilityStatusObject *)v8 reachability]) {
        goto LABEL_12;
      }
      objc_storeStrong((id *)p_activeDeviceStatus, v8);
      long long v17 = *p_activeDeviceStatus;
      __int16 v18 = v9;
LABEL_8:
      [v18 addObject:v17];
      goto LABEL_12;
    }
    v22 = v8;
    v23 = *p_activeDeviceStatus;
    *p_activeDeviceStatus = v22;
    id v19 = v15;

    [(PBBridgeIDSReachabilityStatusObject *)v19 setReachability:0];
    [v9 addObject:v19];
    uint64_t v20 = v9;
    uint64_t v21 = v22;
  }
  else
  {
    *p_activeDeviceStatus = 0;
    id v19 = v11;

    [(PBBridgeIDSReachabilityStatusObject *)v19 setReachability:0];
    uint64_t v20 = v9;
    uint64_t v21 = v19;
  }
  [v20 addObject:v21];

LABEL_12:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

+ (id)nrDevices
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = PBGetSetupCompletedDevicesWeShouldList();
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "bluetoothIdentifier", (void)v13);
        if (v9)
        {
          uint64_t v10 = [MEMORY[0x263F57730] sharedInstance];
          uint64_t v11 = [v10 deviceForBluetoothID:v9];
          [v3 setObject:v11 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)deviceStatusFromIDSDevices:(id)a3 nrDevices:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  v8 = (void *)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isDefaultPairedDevice", (void)v17)) {
        break;
      }
      if (v8 == (void *)++v10)
      {
        v8 = (void *)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    if (![v11 isNearby]) {
      goto LABEL_17;
    }
    v8 = [v11 nsuuid];
    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v12 = [v11 nsuuid];
    long long v13 = [v6 objectForKeyedSubscript:v12];

    if (v13)
    {
      v8 = objc_opt_new();
      long long v14 = [v11 nsuuid];
      [v8 setIdsDeviceID:v14];

      if ([v11 isConnected]) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 1;
      }
      [v8 setReachability:v15];
    }
    else
    {
LABEL_17:
      v8 = 0;
    }
  }
LABEL_18:

  return v8;
}

- (unint64_t)reachabilityForDevice:(id)a3
{
  id v4 = [a3 valueForProperty:*MEMORY[0x263F57778]];
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = [(PBBridgeIDSReachabilityStatusObject *)self->_activeDeviceStatus idsDeviceID];
    int v7 = [v6 isEqual:v4];

    if (v7) {
      unint64_t v8 = [(PBBridgeIDSReachabilityStatusObject *)self->_activeDeviceStatus reachability];
    }
    else {
      unint64_t v8 = 0;
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

void __39__PBBridgeIDSReachability_addObserver___block_invoke(void *a1)
{
  id v5 = [(id)objc_opt_class() nrDevices];
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObject:a1[6]];
  [v2 fireReachability:v3 deviceStatus:v4 devices:v5];
}

- (void)removeObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = "-[PBBridgeIDSReachability removeObserver:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (void *)[(NSMutableOrderedSet *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 observer];
        if (v12)
        {
          long long v13 = (void *)v12;
          id v14 = [v11 observer];

          if (v14 != v4) {
            continue;
          }
        }
        [(NSMutableOrderedSet *)self->_observers removeObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = "-[PBBridgeIDSReachability service:nearbyDevicesChanged:]";
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = objc_msgSend(v5, "pb_mineTinkerDevices");

  [(PBBridgeIDSReachability *)self _processDevices:v7];
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = "-[PBBridgeIDSReachability service:connectedDevicesChanged:]";
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = objc_msgSend(v5, "pb_mineTinkerDevices");

  [(PBBridgeIDSReachability *)self _processDevices:v7];
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = "-[PBBridgeIDSReachability service:activeAccountsChanged:]";
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = objc_msgSend(v5, "pb_mineTinkerDevices");

  [(PBBridgeIDSReachability *)self _processDevices:v7];
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = "-[PBBridgeIDSReachability service:linkedDevicesChanged:]";
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = objc_msgSend(v5, "pb_mineTinkerDevices");

  [(PBBridgeIDSReachability *)self _processDevices:v7];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = "-[PBBridgeIDSReachability service:devicesChanged:]";
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = objc_msgSend(v5, "pb_mineTinkerDevices");

  [(PBBridgeIDSReachability *)self _processDevices:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reachabilityService, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end