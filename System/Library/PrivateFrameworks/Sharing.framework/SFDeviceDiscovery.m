@interface SFDeviceDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)overrideScreenOff;
- (BOOL)rssiChangeDetection;
- (BOOL)scanCache;
- (BOOL)targetUserSession;
- (BOOL)trackPeers;
- (NSSet)deviceFilter;
- (NSSet)useCases;
- (NSString)purpose;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceDiscovery)init;
- (SFDeviceDiscovery)initWithCoder:(id)a3;
- (double)timeout;
- (id)description;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)scanStateChangedHandler;
- (id)timeoutHandler;
- (int)_ensureXPCStarted;
- (int64_t)fastScanMode;
- (int64_t)overrideScreenOffRescanInterval;
- (int64_t)rssiThreshold;
- (int64_t)scanRate;
- (int64_t)scanRateOverride;
- (int64_t)scanState;
- (unint64_t)discoveryFlags;
- (unsigned)changeFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_retryConsole;
- (void)_startTimeoutIfNeeded;
- (void)_timeoutTimerFired;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)deviceDiscoveryDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)deviceDiscoveryFoundDevice:(id)a3;
- (void)deviceDiscoveryLostDevice:(id)a3;
- (void)deviceDiscoveryScanStateChanged:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fastScanCancel:(id)a3;
- (void)fastScanTrigger:(id)a3;
- (void)invalidate;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFilter:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFastScanMode:(int64_t)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setOverrideScreenOff:(BOOL)a3;
- (void)setOverrideScreenOffRescanInterval:(int64_t)a3;
- (void)setPurpose:(id)a3;
- (void)setRssiChangeDetection:(BOOL)a3;
- (void)setRssiThreshold:(int64_t)a3;
- (void)setScanCache:(BOOL)a3;
- (void)setScanRate:(int64_t)a3;
- (void)setScanRateOverride:(int64_t)a3;
- (void)setScanStateChangedHandler:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)setTrackPeers:(BOOL)a3;
- (void)setUseCases:(id)a3;
- (void)triggerEnhancedDiscovery:(id)a3;
- (void)triggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5;
@end

@implementation SFDeviceDiscovery

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (BOOL)overrideScreenOff
{
  return self->_overrideScreenOff;
}

- (NSSet)deviceFilter
{
  return self->_deviceFilter;
}

- (int64_t)scanRate
{
  return self->_scanRate;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (NSSet)useCases
{
  return self->_useCases;
}

- (BOOL)trackPeers
{
  return self->_trackPeers;
}

- (int64_t)scanRateOverride
{
  return self->_scanRateOverride;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (int64_t)fastScanMode
{
  return self->_fastScanMode;
}

- (int64_t)overrideScreenOffRescanInterval
{
  return self->_overrideScreenOffRescanInterval;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeInteger:self->_changeFlags forKey:@"changeFlags"];
  deviceFilter = self->_deviceFilter;
  if (deviceFilter) {
    [v13 encodeObject:deviceFilter forKey:@"deviceFilter"];
  }
  [v13 encodeInteger:self->_discoveryFlags forKey:@"discoveryFlags"];
  int64_t fastScanMode = self->_fastScanMode;
  if (fastScanMode) {
    [v13 encodeInteger:fastScanMode forKey:@"fastScanMode"];
  }
  if (self->_legacy) {
    [v13 encodeBool:1 forKey:@"legacy"];
  }
  if (self->_overrideScreenOff) {
    [v13 encodeBool:1 forKey:@"overrideScreenOff"];
  }
  int64_t overrideScreenOffRescanInterval = self->_overrideScreenOffRescanInterval;
  if (overrideScreenOffRescanInterval) {
    [v13 encodeInteger:overrideScreenOffRescanInterval forKey:@"osoitvl"];
  }
  purpose = self->_purpose;
  if (purpose) {
    [v13 encodeObject:purpose forKey:@"purpose"];
  }
  if (self->_rssiChangeDetection) {
    [v13 encodeBool:1 forKey:@"rssiChangeDetection"];
  }
  int64_t rssiThreshold = self->_rssiThreshold;
  if (rssiThreshold) {
    [v13 encodeInteger:rssiThreshold forKey:@"rssiThreshold"];
  }
  if (self->_scanCache) {
    [v13 encodeBool:1 forKey:@"scanCache"];
  }
  useCases = self->_useCases;
  if (useCases) {
    [v13 encodeObject:useCases forKey:@"useCases"];
  }
  int64_t scanRate = self->_scanRate;
  if (scanRate > 2)
  {
    if (scanRate == 20) {
      goto LABEL_33;
    }
    if (scanRate != 3) {
      goto LABEL_28;
    }
    int64_t v11 = 40;
  }
  else
  {
    if (scanRate != 1)
    {
      if (scanRate == 2) {
        goto LABEL_33;
      }
LABEL_28:
      if (scanRate == 4) {
        int64_t v11 = 50;
      }
      else {
        int64_t v11 = self->_scanRate;
      }
      goto LABEL_32;
    }
    int64_t v11 = 10;
  }
LABEL_32:
  [v13 encodeInteger:v11 forKey:@"scanRate"];
LABEL_33:
  v12 = v13;
  if (self->_trackPeers)
  {
    [v13 encodeBool:1 forKey:@"trackPeers"];
    v12 = v13;
  }
}

- (id)scanStateChangedHandler
{
  return self->_scanStateChangedHandler;
}

- (SFDeviceDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SFDeviceDiscovery;
  v5 = [(SFDeviceDiscovery *)&v29 init];
  if (v5)
  {
    uint64_t v6 = SFMainQueue();
    v7 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v6;

    *(_OWORD *)(v5 + 168) = xmmword_1A56EAAA0;
    if ([v4 containsValueForKey:@"changeFlags"]) {
      *((_DWORD *)v5 + 18) = [v4 decodeIntegerForKey:@"changeFlags"];
    }
    if ([v4 containsValueForKey:@"deviceFilter"])
    {
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = objc_opt_class();
      v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
      uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"deviceFilter"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v13 = *MEMORY[0x1E4F1C3C8];
        v14 = _NSMethodExceptionProem();
        [v12 raise:v13, @"%@: non-set value for key %@ : %@", v14, @"deviceFilter", v11 format];
      }
      v15 = (void *)*((void *)v5 + 10);
      *((void *)v5 + 10) = v11;
    }
    if ([v4 containsValueForKey:@"discoveryFlags"]) {
      *((void *)v5 + 14) = [v4 decodeIntegerForKey:@"discoveryFlags"];
    }
    id v16 = v4;
    if ([v16 containsValueForKey:@"fastScanMode"]) {
      *((void *)v5 + 16) = [v16 decodeIntegerForKey:@"fastScanMode"];
    }

    if ([v16 containsValueForKey:@"legacy"]) {
      v5[42] = [v16 decodeBoolForKey:@"legacy"];
    }
    if ([v16 containsValueForKey:@"overrideScreenOff"]) {
      v5[64] = [v16 decodeBoolForKey:@"overrideScreenOff"];
    }
    if ([v16 containsValueForKey:@"osoitvl"]) {
      *((void *)v5 + 19) = [v16 decodeIntegerForKey:@"osoitvl"];
    }
    id v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if ([v17 containsValueForKey:@"rssiChangeDetection"]) {
      v5[65] = [v17 decodeBoolForKey:@"rssiChangeDetection"];
    }
    if ([v17 containsValueForKey:@"rssiThreshold"]) {
      *((void *)v5 + 21) = [v17 decodeIntegerForKey:@"rssiThreshold"];
    }
    if ([v17 containsValueForKey:@"scanCache"]) {
      v5[66] = [v17 decodeBoolForKey:@"scanCache"];
    }
    if ([v17 containsValueForKey:@"scanRate"]) {
      *((void *)v5 + 22) = [v17 decodeIntegerForKey:@"scanRate"];
    }
    id v18 = v17;
    if ([v18 containsValueForKey:@"trackPeers"]) {
      v5[68] = [v18 decodeBoolForKey:@"trackPeers"];
    }

    if ([v18 containsValueForKey:@"useCases"])
    {
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v20 = objc_opt_class();
      v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
      uint64_t v22 = [v18 decodeObjectOfClasses:v21 forKey:@"useCases"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v24 = *MEMORY[0x1E4F1C3C8];
        v25 = _NSMethodExceptionProem();
        [v23 raise:v24, @"%@: non-set value for key %@ : %@", v25, @"deviceFilter", v22 format];
      }
      v26 = (void *)*((void *)v5 + 26);
      *((void *)v5 + 26) = v22;
    }
    v27 = v5;
  }

  return (SFDeviceDiscovery *)v5;
}

- (void)deviceDiscoveryScanStateChanged:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_scanState = a3;
  scanStateChangedHandler = (void (**)(id, int64_t))self->_scanStateChangedHandler;
  if (scanStateChangedHandler) {
    scanStateChangedHandler[2](scanStateChangedHandler, a3);
  }

  [(SFDeviceDiscovery *)self _startTimeoutIfNeeded];
}

- (void)deviceDiscoveryFoundDevice:(id)a3
{
  id v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 9
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    id v13 = v14;
    LogPrintF();
  }
  id v4 = objc_msgSend(v14, "identifier", v13);
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];

    devices = self->_devices;
    if (v5)
    {
      [(NSMutableDictionary *)devices setObject:v14 forKeyedSubscript:v4];
      v7 = _Block_copy(self->_deviceChangedHandler);
      v8 = v7;
      if (v7) {
        (*((void (**)(void *, id, uint64_t))v7 + 2))(v7, v14, 0xFFFFFFFFLL);
      }
    }
    else
    {
      id v9 = v14;
      if (!devices)
      {
        v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v11 = self->_devices;
        self->_devices = v10;

        id v9 = v14;
        devices = self->_devices;
      }
      [(NSMutableDictionary *)devices setObject:v9 forKeyedSubscript:v4];
      v12 = _Block_copy(self->_deviceFoundHandler);
      v8 = v12;
      if (v12) {
        (*((void (**)(void *, id))v12 + 2))(v12, v14);
      }
    }
  }
}

- (void)deviceDiscoveryLostDevice:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 9
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    id v7 = v8;
    LogPrintF();
  }
  id v4 = objc_msgSend(v8, "identifier", v7);
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
    if (v5)
    {
      [(NSMutableDictionary *)self->_devices removeObjectForKey:v4];
      objc_msgSend(v5, "setIsBLEDeviceReplaced:", objc_msgSend(v8, "isBLEDeviceReplaced"));
      deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
      if (deviceLostHandler) {
        deviceLostHandler[2](deviceLostHandler, v5);
      }
    }
  }
  else
  {
    v5 = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scanStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_useCases, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_devices, 0);

  objc_storeStrong((id *)&self->_consoleUserTimer, 0);
}

- (void)setScanRate:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__SFDeviceDiscovery_setScanRate___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  v3[5] = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xFFFFFFEC | 0x10;
  if ((a3 & 0x647FFC0) == 0) {
    unint64_t v3 = a3;
  }
  if ((v3 & 0x400000) != 0) {
    v3 |= 0x60uLL;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SFDeviceDiscovery_setDiscoveryFlags___block_invoke;
  v4[3] = &unk_1E5BBC910;
  if ((v3 & 0x40000) != 0) {
    v3 |= 0x20060uLL;
  }
  v4[4] = self;
  v4[5] = v3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v4];
}

- (void)setOverrideScreenOff:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__SFDeviceDiscovery_setOverrideScreenOff___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

- (void)setDeviceFilter:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SFDeviceDiscovery_setDeviceFilter___block_invoke;
  v6[3] = &unk_1E5BBBD18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v6];
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    uint64_t v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFDeviceDiscovery/deviceDiscoveryUpdate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    dispatchQueue = v5->_dispatchQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__SFDeviceDiscovery__invokeBlockActivateSafe___block_invoke;
    v8[3] = &unk_1E5BBC9C8;
    v8[4] = v5;
    id v9 = v4;
    dispatch_async(dispatchQueue, v8);

    os_activity_scope_leave(&state);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

void __37__SFDeviceDiscovery_setDeviceFilter___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  if ([*(id *)(a1 + 40) count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v2 = [*(id *)(*(void *)(a1 + 32) + 32) allKeys];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if (([*(id *)(a1 + 40) containsObject:v7] & 1) == 0)
          {
            id v8 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v7];
            if (v8)
            {
              if (gLogCategory_SFDeviceDiscovery <= 30
                && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
              {
                v10 = v8;
                LogPrintF();
              }
              objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectForKey:", v7, v10);
              uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 96);
              if (v9) {
                (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
              }
            }
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
}

uint64_t __46__SFDeviceDiscovery__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = [*(id *)(*(void *)(a1 + 32) + 56) remoteObjectProxy];
  [v2 deviceDiscoveryUpdate:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _startTimeoutIfNeeded];
}

uint64_t __33__SFDeviceDiscovery_setScanRate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 176) = *(void *)(result + 40);
  return result;
}

uint64_t __42__SFDeviceDiscovery_setOverrideScreenOff___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __39__SFDeviceDiscovery_setDiscoveryFlags___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 112) = *(void *)(result + 40);
  return result;
}

- (void)dealloc
{
  if (!self->_activateCalled || self->_invalidateCalled || self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id scanStateChangedHandler = self->_scanStateChangedHandler;
    self->_id scanStateChangedHandler = 0;

    id timeoutHandler = self->_timeoutHandler;
    self->_id timeoutHandler = 0;

    v10.receiver = self;
    v10.super_class = (Class)SFDeviceDiscovery;
    [(SFDeviceDiscovery *)&v10 dealloc];
  }
  else
  {
    uint64_t v9 = FatalErrorF();
    charging_log(v9);
  }
}

- (void)_startTimeoutIfNeeded
{
  if (self->_timeout > 0.0 && self->_scanState == 1 && !self->_timeoutFired && !self->_timeoutTimer)
  {
    if (gLogCategory_SFDeviceDiscovery <= 20
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v3;

    uint64_t v5 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__SFDeviceDiscovery__startTimeoutIfNeeded__block_invoke;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    SFDispatchTimerSet(self->_timeoutTimer, self->_timeout, 1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }
}

- (id)description
{
  uint64_t v34 = 0;
  NSAppendPrintF();
  id v3 = 0;
  uint64_t v4 = v3;
  purpose = self->_purpose;
  if (purpose)
  {
    id v33 = v3;
    v28 = purpose;
    NSAppendPrintF();
    id v6 = v33;

    uint64_t v4 = v6;
  }
  if (self->_invalidateCalled)
  {
    v32[4] = v4;
    NSAppendPrintF();
    id v7 = v4;

    uint64_t v4 = v7;
  }
  if (self->_legacy)
  {
    v32[3] = v4;
    NSAppendPrintF();
    id v8 = v4;

    uint64_t v4 = v8;
  }
  if ([(NSSet *)self->_deviceFilter count])
  {
    v32[2] = v4;
    [(NSSet *)self->_deviceFilter count];
    NSAppendPrintF();
    id v9 = v4;

    uint64_t v4 = v9;
  }
  v32[1] = v4;
  v30 = &unk_1A56EAAB0;
  NSAppendPrintF();
  id v10 = v4;

  unsigned int changeFlags = self->_changeFlags;
  if (changeFlags)
  {
    if (changeFlags == -1)
    {
      v32[0] = v10;
      long long v12 = (id *)v32;
    }
    else
    {
      id v31 = v10;
      v30 = &unk_1A56EABCC;
      long long v12 = &v31;
    }
    NSAppendPrintF();
    id v13 = *v12;

    id v10 = v13;
  }
  int64_t scanRate = self->_scanRate;
  if (scanRate > 19)
  {
    if (scanRate > 39)
    {
      if (scanRate == 40)
      {
        v15 = "High";
        goto LABEL_31;
      }
      if (scanRate == 50)
      {
        v15 = "Aggressive";
        goto LABEL_31;
      }
    }
    else
    {
      if (scanRate == 20)
      {
        v15 = "Normal";
        goto LABEL_31;
      }
      if (scanRate == 30)
      {
        v15 = "HighNormal";
        goto LABEL_31;
      }
    }
LABEL_30:
    v15 = "?";
  }
  else
  {
    v15 = "Invalid";
    switch(scanRate)
    {
      case 0:
        break;
      case 1:
        v15 = "BackgroundOld";
        break;
      case 2:
        v15 = "NormalOld";
        break;
      case 3:
        v15 = "HighOld";
        break;
      case 4:
        v15 = "AggressiveOld";
        break;
      case 10:
        v15 = "Background";
        break;
      default:
        goto LABEL_30;
    }
  }
LABEL_31:
  int64_t overrideScreenOffRescanInterval = (int64_t)v15;
  NSAppendPrintF();
  id v16 = v10;

  int64_t fastScanMode = self->_fastScanMode;
  if (fastScanMode)
  {
    id v18 = "?";
    if (fastScanMode == 1) {
      id v18 = "Start";
    }
    if (fastScanMode == 2) {
      v19 = "Match";
    }
    else {
      v19 = v18;
    }
    int64_t overrideScreenOffRescanInterval = (int64_t)v19;
    NSAppendPrintF();
    id v20 = v16;

    id v16 = v20;
  }
  if (self->_overrideScreenOff)
  {
    NSAppendPrintF();
    id v21 = v16;

    if (self->_overrideScreenOff && self->_overrideScreenOffRescanInterval)
    {
      int64_t overrideScreenOffRescanInterval = self->_overrideScreenOffRescanInterval;
      NSAppendPrintF();
      id v16 = v21;
    }
    else
    {
      id v16 = v21;
    }
  }
  if (self->_rssiChangeDetection)
  {
    NSAppendPrintF();
    id v22 = v16;

    id v16 = v22;
  }
  if (self->_rssiThreshold)
  {
    int64_t overrideScreenOffRescanInterval = self->_rssiThreshold;
    NSAppendPrintF();
    id v23 = v16;

    id v16 = v23;
  }
  if (self->_scanCache)
  {
    NSAppendPrintF();
    id v24 = v16;

    id v16 = v24;
  }
  if (self->_trackPeers)
  {
    NSAppendPrintF();
    id v25 = v16;

    id v16 = v25;
  }
  if (self->_xpcCnx)
  {
    [(NSMutableDictionary *)self->_devices count];
    NSAppendPrintF();
    id v26 = v16;

    id v16 = v26;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFDeviceDiscovery)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceDiscovery;
  v2 = [(SFDeviceDiscovery *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_unsigned int changeFlags = 1;
    v2->_discoveryFlags = 1;
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_legacy = 1;
    *(_OWORD *)&v3->_int64_t rssiThreshold = xmmword_1A56EAAA0;
  }
  return v3;
}

- (void)setChangeFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__SFDeviceDiscovery_setChangeFlags___block_invoke;
  v3[3] = &unk_1E5BBEE88;
  v3[4] = self;
  unsigned int v4 = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __36__SFDeviceDiscovery_setChangeFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 72) = *(_DWORD *)(result + 40);
  *(unsigned char *)(*(void *)(result + 32) + 42) = 0;
  return result;
}

- (void)setDispatchQueue:(id)a3
{
  unsigned int v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)setFastScanMode:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__SFDeviceDiscovery_setFastScanMode___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  void v3[5] = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __37__SFDeviceDiscovery_setFastScanMode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 128) = *(void *)(result + 40);
  return result;
}

- (void)setOverrideScreenOffRescanInterval:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__SFDeviceDiscovery_setOverrideScreenOffRescanInterval___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  void v3[5] = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __56__SFDeviceDiscovery_setOverrideScreenOffRescanInterval___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 152) = *(void *)(result + 40);
  return result;
}

- (void)setRssiChangeDetection:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SFDeviceDiscovery_setRssiChangeDetection___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __44__SFDeviceDiscovery_setRssiChangeDetection___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 65) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setRssiThreshold:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__SFDeviceDiscovery_setRssiThreshold___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  void v3[5] = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __38__SFDeviceDiscovery_setRssiThreshold___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 168) = *(void *)(result + 40);
  return result;
}

- (void)setScanCache:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__SFDeviceDiscovery_setScanCache___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __34__SFDeviceDiscovery_setScanCache___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 66) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setTimeout:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__SFDeviceDiscovery_setTimeout___block_invoke;
  v3[3] = &unk_1E5BBC910;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

double __32__SFDeviceDiscovery_setTimeout___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;
  }
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 192) = result;
  return result;
}

- (void)setTrackPeers:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__SFDeviceDiscovery_setTrackPeers___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __35__SFDeviceDiscovery_setTrackPeers___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 68) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setUseCases:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__SFDeviceDiscovery_setUseCases___block_invoke;
  v6[3] = &unk_1E5BBBD18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SFDeviceDiscovery *)self _invokeBlockActivateSafe:v6];
}

void __33__SFDeviceDiscovery_setUseCases___block_invoke(uint64_t a1)
{
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SFDeviceDiscovery_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __44__SFDeviceDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 30
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    if (self->_targetUserSession) {
      id v5 = "(TargetUserSession)";
    }
    else {
      id v5 = "";
    }
    uint64_t v19 = (uint64_t)v5;
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    if (gLogCategory_SFDeviceDiscovery <= 60
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = 4294960572;
      LogPrintF();
    }
    if (v4)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v15 = (void *)v14;
      id v16 = @"?";
      if (v14) {
        id v16 = (__CFString *)v14;
      }
      v26[0] = v16;
      id v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1, v19);
      id v18 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-6724 userInfo:v17];
      v4[2](v4, v18);
    }
  }
  else
  {
    if (!self->_purpose)
    {
      id v6 = getprogname();
      if (v6)
      {
        id v7 = [NSString stringWithUTF8String:v6];
        purpose = self->_purpose;
        self->_purpose = v7;
      }
    }
    self->_activateTicks = mach_absolute_time();
    if ([(SFDeviceDiscovery *)self _ensureXPCStarted])
    {
      if (gLogCategory_SFDeviceDiscovery <= 50
        && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v4) {
        v4[2](v4, 0);
      }
    }
    else
    {
      id v9 = _os_activity_create(&dword_1A5389000, "Sharing/SFDeviceDiscovery/deviceDiscoveryActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v9, &state);
      xpcCnx = self->_xpcCnx;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __45__SFDeviceDiscovery__activateWithCompletion___block_invoke;
      v22[3] = &unk_1E5BBCD68;
      long long v11 = v4;
      id v23 = v11;
      long long v12 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v22];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __45__SFDeviceDiscovery__activateWithCompletion___block_invoke_2;
      v20[3] = &unk_1E5BBCD68;
      id v21 = v11;
      [v12 deviceDiscoveryActivate:self completion:v20];

      os_activity_scope_leave(&state);
    }
  }
}

uint64_t __45__SFDeviceDiscovery__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __45__SFDeviceDiscovery__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__SFDeviceDiscovery__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5BBC870;
    v9[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__SFDeviceDiscovery__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5BBC870;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v8];
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39560];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFDeviceDiscovery <= 30
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return 0;
}

uint64_t __38__SFDeviceDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __38__SFDeviceDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)fastScanTrigger:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFDeviceDiscovery/deviceDiscoveryFastScanTrigger", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__SFDeviceDiscovery_fastScanTrigger___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __37__SFDeviceDiscovery_fastScanTrigger___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceDiscovery <= 50
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "remoteObjectProxy", v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 deviceDiscoveryFastScanTrigger:*(void *)(a1 + 32)];
}

- (void)fastScanCancel:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFDeviceDiscovery/deviceDiscoveryFastScanCancel", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__SFDeviceDiscovery_fastScanCancel___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __36__SFDeviceDiscovery_fastScanCancel___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceDiscovery <= 50
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    LogPrintF();
  }
  *(void *)(*(void *)(a1 + 40) + 128) = 0;
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "remoteObjectProxy", v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 deviceDiscoveryFastScanCancel:*(void *)(a1 + 32)];
}

- (void)triggerEnhancedDiscovery:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFDeviceDiscovery/deviceDiscoveryTrigggerEnhancedDiscovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__SFDeviceDiscovery_triggerEnhancedDiscovery___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __46__SFDeviceDiscovery_triggerEnhancedDiscovery___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceDiscovery <= 30
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "remoteObjectProxy", v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 deviceDiscoveryTriggerEnhancedDiscovery:*(void *)(a1 + 32)];
}

- (void)triggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create(&dword_1A5389000, "Sharing/SFDeviceDiscovery/deviceDiscoveryTrigggerEnhancedDiscovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__SFDeviceDiscovery_triggerEnhancedDiscovery_useCase_completion___block_invoke;
  v14[3] = &unk_1E5BBFC20;
  unsigned int v18 = a4;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

void __65__SFDeviceDiscovery_triggerEnhancedDiscovery_useCase_completion___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceDiscovery <= 30
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    int v2 = *(_DWORD *)(a1 + 56);
    if (v2 >= 0x20000)
    {
      if (v2 >= 327680)
      {
        if (v2 > 589824)
        {
          if (v2 <= 2147418111)
          {
            switch(v2)
            {
              case 589825:
                id v3 = "FindNearbyPencil";
                break;
              case 655360:
                id v3 = "AccessDigitalHomeKey";
                break;
              case 786432:
                id v3 = "ProxControlDeviceClose";
                break;
              default:
LABEL_142:
                id v3 = "?";
                break;
            }
          }
          else
          {
            switch(v2)
            {
              case 2147418112:
                id v3 = "InternalTestNoLockScan";
                break;
              case 2147418113:
                id v3 = "InternalTestNoScreenOffScan";
                break;
              case 2147418114:
                id v3 = "InternalTestScanWithNoDups";
                break;
              case 2147418115:
                id v3 = "InternalTestScanWithDups";
                break;
              case 2147418116:
                id v3 = "InternalTestScanFor20Seconds";
                break;
              case 2147418117:
                id v3 = "InternalTestActiveScan";
                break;
              case 2147418118:
                id v3 = "InternalTestUUIDScan";
                break;
              case 2147418119:
                id v3 = "InternalTestScanFor10ClockSeconds";
                break;
              case 2147418120:
                id v3 = "InternalTestScanBoost";
                break;
              default:
                goto LABEL_142;
            }
          }
        }
        else if (v2 > 458752)
        {
          int v5 = v2 - 0x80000;
          switch(v5)
          {
            case 0:
              id v3 = "ADPD";
              break;
            case 1:
              id v3 = "ADPDBuffer";
              break;
            case 2:
              id v3 = "MicroLocation";
              break;
            case 3:
              id v3 = "MicroLocationLeech";
              break;
            default:
              if (v5 == 458753)
              {
                id v3 = "PrecisionFindingFindee";
              }
              else
              {
                if (v5 != 589824) {
                  goto LABEL_142;
                }
                id v3 = "FindNearbyRemote";
              }
              break;
          }
        }
        else
        {
          int v4 = v2 - 393216;
          switch(v4)
          {
            case 0:
              id v3 = "CaptiveNetworkJoin";
              break;
            case 1:
              id v3 = "UseCaseSIMTransfer";
              break;
            case 2:
              id v3 = "MacSetup";
              break;
            case 3:
              id v3 = "AppleIDSignIn";
              break;
            case 4:
              id v3 = "AppleIDSignInSettings";
              break;
            default:
              if (v4 == 327680)
              {
                id v3 = "RapportThirdParty";
              }
              else
              {
                if (v4 != 458752) {
                  goto LABEL_142;
                }
                id v3 = "PrecisionFindingFinder";
              }
              break;
          }
        }
      }
      else
      {
        switch(v2)
        {
          case 131072:
            id v3 = "SharingDefault";
            break;
          case 131073:
            id v3 = "SharingPhoneAutoUnlock";
            break;
          case 131074:
            id v3 = "SharingSiriWatchAuth";
            break;
          case 131075:
            id v3 = "SharingMacAutoUnlock";
            break;
          case 131076:
            id v3 = "SharingEDTScreenOn";
            break;
          case 131077:
            id v3 = "SharingEDTWiFiDisabled";
            break;
          case 131078:
            id v3 = "SharingEDTWombatEligibleAsDefaultCamera";
            break;
          case 131079:
            id v3 = "SharingEDTWombatCameraPicker";
            break;
          case 131080:
            id v3 = "SharingWombatBackground";
            break;
          case 131081:
            id v3 = "SharingUniversalControl";
            break;
          case 131082:
            id v3 = "SharingPeopleProximity";
            break;
          case 131083:
            id v3 = "SharingEDTEnsembleOpenDisplayPrefs";
            break;
          case 131084:
            id v3 = "SharingEDTNearbydMotionStopped";
            break;
          case 131085:
            id v3 = "SharingDoubleBoostGenericScan";
            break;
          case 131086:
            id v3 = "SharingEDTIncomingAdvertisement ";
            break;
          case 131087:
            id v3 = "SharingEDTWombatStreamStart";
            break;
          case 131088:
            id v3 = "SharingOYAutoUnlock";
            break;
          case 131090:
            id v3 = "SharingAirDrop";
            break;
          case 131091:
            id v3 = "SharingNearbyInvitationHost";
            break;
          case 131092:
            id v3 = "SharingNearbyInvitationParticipant";
            break;
          case 131093:
            id v3 = "SharingAirDropAskToAirDrop";
            break;
          case 131094:
            id v3 = "SharingAirDropTempIdentity";
            break;
          case 131095:
            id v3 = "SharingAirDropNeedsCLink";
            break;
          case 131096:
            id v3 = "SharingRemoteWidgetUpdate";
            break;
          case 131097:
            id v3 = "SharingCountryCodeUpdate";
            break;
          case 131098:
            id v3 = "SharingMacPhoneAutoUnlock";
            break;
          case 131099:
            id v3 = "SharingVisionProDiscovery";
            break;
          case 131100:
            id v3 = "SharingVisionProStateChange";
            break;
          case 131101:
            id v3 = "SharingContinuityScreen";
            break;
          case 131102:
            id v3 = "SharingEDTRemoteDisplay";
            break;
          default:
            goto LABEL_142;
        }
      }
    }
    else if (v2 <= 0x20000)
    {
      switch(v2)
      {
        case 65536:
          id v3 = "FindMyAction";
          break;
        case 65537:
          id v3 = "FindMyBackground";
          break;
        case 65538:
          id v3 = "FindMyActionHELE";
          break;
        case 65539:
          id v3 = "FindMyBackgroundHELE";
          break;
        case 65540:
          id v3 = "FindMyActionTransient";
          break;
        case 65541:
          id v3 = "FindMyBackgroundTransient";
          break;
        case 65542:
          id v3 = "FindMyActionHELETransient";
          break;
        case 65543:
          id v3 = "FindMyBackgroundHELETransient";
          break;
        case 65544:
          id v3 = "FindMyNotOptedIn";
          break;
        case 65545:
          id v3 = "FindMyOptedIn";
          break;
        case 65546:
          id v3 = "FindMySepAlertsEnabled";
          break;
        case 65547:
          id v3 = "FindMyTemporaryAggressiveLegacy";
          break;
        case 65548:
          id v3 = "FindMyTemporaryLongAggressive";
          break;
        case 65549:
          id v3 = "FindMyBTFindingUserInitiated";
          break;
        case 65550:
          id v3 = "FindMyHELE";
          break;
        case 65551:
          id v3 = "FindMyBeaconOnDemand";
          break;
        case 65552:
          id v3 = "FindMyWildTimedScan";
          break;
        case 65553:
          id v3 = "FindMyBackgroundLeechScan";
          break;
        case 65554:
          id v3 = "FindMySnifferMode";
          break;
        case 65555:
          id v3 = "FindMyUnpair";
          break;
        case 65556:
          id v3 = "FindMyUnpairHELE";
          break;
        case 65557:
          id v3 = "FindMyPlaySound";
          break;
        case 65558:
          id v3 = "FindMyPlaySoundHELE";
          break;
        case 65559:
          id v3 = "FindMyNotOptedInBeepOnMoveWaking";
          break;
        case 65560:
          id v3 = "FindMyUTTransient";
          break;
        case 65561:
          id v3 = "FindMyUTHELETransient";
          break;
        default:
          JUMPOUT(0);
      }
    }
    else
    {
      id v3 = "Unspecified";
      switch(v2)
      {
        case 0:
          break;
        case 1:
          id v3 = "HealthKit";
          break;
        case 2:
          id v3 = "HomeKit";
          break;
        case 3:
          id v3 = "FindMyObjectConnection";
          break;
        case 4:
          id v3 = "FindMyObjectConnectionTransient";
          break;
        case 5:
          id v3 = "MIDI";
          break;
        case 6:
          id v3 = "Continuity";
          break;
        case 7:
          id v3 = "InstantHotSpot";
          break;
        case 8:
          id v3 = "NearBy";
          break;
        case 9:
          id v3 = "Sharing";
          break;
        case 10:
          id v3 = "HearingSupport";
          break;
        case 11:
          id v3 = "Magnet";
          break;
        case 12:
          id v3 = "HID";
          break;
        case 13:
          id v3 = "LEA";
          break;
        case 14:
          id v3 = "External";
          break;
        case 15:
          id v3 = "ExternalMedical";
          break;
        case 16:
          id v3 = "ExternalLock";
          break;
        case 17:
          id v3 = "ExternalWatch";
          break;
        case 18:
          id v3 = "SmartRouting";
          break;
        case 19:
          id v3 = "DigitalID";
          break;
        case 20:
          id v3 = "DigitalKey";
          break;
        case 21:
          id v3 = "DigitalCarKey";
          break;
        case 22:
          id v3 = "HeySiri";
          break;
        case 23:
          id v3 = "ThirdPartyApp";
          break;
        case 24:
          id v3 = "CNJ";
          break;
        default:
          switch(v2)
          {
            case 256:
              id v3 = "DevicePresenceDetection";
              break;
            case 257:
              id v3 = "AudioBox";
              break;
            case 258:
              id v3 = "SIMTransfer";
              break;
            case 259:
              id v3 = "ProximityScreenOnLeechScan";
              break;
            case 260:
              id v3 = "MacMigrate";
              break;
            case 263:
              id v3 = "HIDUARTService";
              break;
            case 264:
              id v3 = "AccessibilitySwitchControlPairing";
              break;
            case 265:
              id v3 = "BaseBandFastConnect";
              break;
            case 266:
              id v3 = "SafetyAlerts";
              break;
            case 267:
              id v3 = "LECarPlay";
              break;
            case 268:
              id v3 = "TCCBluetooth";
              break;
            case 269:
              id v3 = "AOPBufferLeech";
              break;
            default:
              goto LABEL_142;
          }
          break;
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v3;
    LogPrintF();
  }
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "remoteObjectProxy", v9, v10);
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(unsigned int *)(a1 + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SFDeviceDiscovery_triggerEnhancedDiscovery_useCase_completion___block_invoke_2;
  v11[3] = &unk_1E5BBD618;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  [v6 deviceDiscoveryTriggerEnhancedDiscovery:v12 useCase:v8 completion:v11];
}

void __65__SFDeviceDiscovery_triggerEnhancedDiscovery_useCase_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_SFDeviceDiscovery <= 60)
    {
      if (gLogCategory_SFDeviceDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 50
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler) {
    interruptionHandler[2]();
  }
  [(NSMutableDictionary *)self->_devices removeAllObjects];
  devices = self->_devices;
  self->_devices = 0;

  if (self->_activateCalled)
  {
    if ([(SFDeviceDiscovery *)self _ensureXPCStarted])
    {
      if (gLogCategory_SFDeviceDiscovery <= 50
        && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      uint64_t v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFDeviceDiscovery/deviceDiscoveryActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v5, &state);
      if (gLogCategory_SFDeviceDiscovery <= 50
        && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v6 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v6 deviceDiscoveryActivate:self completion:&__block_literal_global_41];

      os_activity_scope_leave(&state);
    }
  }
}

void __33__SFDeviceDiscovery__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_SFDeviceDiscovery <= 30)
  {
    id v5 = v2;
    if (gLogCategory_SFDeviceDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SFDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__SFDeviceDiscovery_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    *(unsigned char *)(v1 + 40) = 1;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 41)
      && gLogCategory_SFDeviceDiscovery <= 30
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    if (v3)
    {
      int v4 = v3;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = 0;
    }
    id v7 = *(void **)(*(void *)(a1 + 32) + 48);
    if (v7)
    {
      uint64_t v8 = v7;
      dispatch_source_cancel(v8);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 48);
      *(void *)(v9 + 48) = 0;
    }
    long long v11 = *(void **)(*(void *)(a1 + 32) + 56);
    if (v11)
    {
      [v11 invalidate];
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 56);
      *(void *)(v12 + 56) = 0;
    }
    else
    {
      uint64_t v14 = *(void **)(a1 + 32);
      [v14 _invalidated];
    }
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFDeviceDiscovery <= 50
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    consoleUserTimer = self->_consoleUserTimer;
    if (consoleUserTimer)
    {
      uint64_t v5 = consoleUserTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_consoleUserTimer;
      self->_consoleUserTimer = 0;
    }
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      uint64_t v8 = timeoutTimer;
      dispatch_source_cancel(v8);
      uint64_t v9 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    [(NSMutableDictionary *)self->_devices removeAllObjects];
    devices = self->_devices;
    self->_devices = 0;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v15 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id scanStateChangedHandler = self->_scanStateChangedHandler;
    self->_id scanStateChangedHandler = 0;

    id timeoutHandler = self->_timeoutHandler;
    self->_id timeoutHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFDeviceDiscovery <= 30
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_retryConsole
{
  consoleUserTimer = self->_consoleUserTimer;
  if (consoleUserTimer)
  {
    int v4 = consoleUserTimer;
    dispatch_source_cancel(v4);
    uint64_t v5 = self->_consoleUserTimer;
    self->_consoleUserTimer = 0;
  }
  if ([(SFDeviceDiscovery *)self _ensureXPCStarted])
  {
    if (gLogCategory_SFDeviceDiscovery <= 50
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFDeviceDiscovery/deviceDiscoveryActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    if (gLogCategory_SFDeviceDiscovery <= 50
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v7 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v7 deviceDiscoveryActivate:self completion:&__block_literal_global_308];

    os_activity_scope_leave(&state);
  }
}

void __34__SFDeviceDiscovery__retryConsole__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_SFDeviceDiscovery <= 30)
  {
    id v5 = v2;
    if (gLogCategory_SFDeviceDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

uint64_t __42__SFDeviceDiscovery__startTimeoutIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeoutTimerFired];
}

- (void)_timeoutTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 20
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    int v4 = timeoutTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  id timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    id timeoutHandler = (void (**)(void))self->_timeoutHandler;
  }
  self->_id timeoutHandler = 0;
}

- (void)deviceDiscoveryDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 9
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = v4;
    long long v11 = &unk_1A56EABCC;
    id v9 = v12;
    LogPrintF();
  }
  id v6 = objc_msgSend(v12, "identifier", v9, v10, v11);
  if (v6)
  {
    [(NSMutableDictionary *)self->_devices setObject:v12 forKeyedSubscript:v6];
    if (self->_legacy)
    {
      id deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
      if (deviceFoundHandler) {
        deviceFoundHandler[2](deviceFoundHandler, v12);
      }
    }
    id deviceChangedHandler = (void (**)(id, id, void))self->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v12, v4);
    }
  }
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
}

- (BOOL)rssiChangeDetection
{
  return self->_rssiChangeDetection;
}

- (int64_t)scanState
{
  return self->_scanState;
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (void)setScanRateOverride:(int64_t)a3
{
  self->_scanRateOverride = a3;
}

- (void)setScanStateChangedHandler:(id)a3
{
}

@end