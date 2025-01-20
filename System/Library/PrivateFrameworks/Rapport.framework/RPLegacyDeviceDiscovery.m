@interface RPLegacyDeviceDiscovery
- (BOOL)scanCache;
- (BOOL)targetUserSession;
- (NSSet)deviceFilter;
- (NSString)serviceType;
- (NSString)wifiSSID;
- (OS_dispatch_queue)dispatchQueue;
- (RPLegacyDeviceDiscovery)init;
- (double)timeout;
- (id)description;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)scanStateChangedHandler;
- (id)timeoutHandler;
- (int)_bleStart;
- (int)_bonjourStart;
- (int)_mdStart;
- (int)_wifiStart;
- (int)rssiThreshold;
- (unsigned)changeFlags;
- (unsigned)deviceActionType;
- (unsigned)scanRate;
- (unsigned)scanState;
- (unsigned)wifiScanFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_bleHandleDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_bleHandleDeviceFound:(id)a3;
- (void)_bleHandleDeviceLost:(id)a3;
- (void)_bonjourHandleAddOrUpdateDevice:(id)a3;
- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4;
- (void)_bonjourHandleRemoveDevice:(id)a3;
- (void)_cleanup;
- (void)_foundDevice:(id)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_lostDeviceByIdentifier:(id)a3;
- (void)_mdHandleDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_mdHandleDeviceFound:(id)a3;
- (void)_mdHandleDeviceLost:(id)a3;
- (void)_wifiHandleDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)_wifiHandleDeviceFound:(id)a3;
- (void)_wifiHandleDeviceLost:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setBLEPayloadFilterData:(id)a3 mask:(id)a4;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceActionType:(unsigned __int8)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFilter:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRssiThreshold:(int)a3;
- (void)setScanCache:(BOOL)a3;
- (void)setScanRate:(unsigned int)a3;
- (void)setScanStateChangedHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)setWifiSSID:(id)a3;
- (void)setWifiScanFlags:(unsigned int)a3;
@end

@implementation RPLegacyDeviceDiscovery

- (RPLegacyDeviceDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPLegacyDeviceDiscovery;
  v2 = [(RPLegacyDeviceDiscovery *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_wifiScanFlags = 3;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (RPLegacyDeviceDiscovery *)FatalErrorF();
    [(RPLegacyDeviceDiscovery *)v3 _cleanup];
  }
  else
  {
    [(RPLegacyDeviceDiscovery *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)RPLegacyDeviceDiscovery;
    [(RPLegacyDeviceDiscovery *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0;

  id deviceChangedHandler = self->_deviceChangedHandler;
  self->_id deviceChangedHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id scanStateChangedHandler = self->_scanStateChangedHandler;
  self->_id scanStateChangedHandler = 0;

  id timeoutHandler = self->_timeoutHandler;
  self->_id timeoutHandler = 0;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;
  return v2;
}

- (void)setBLEPayloadFilterData:(id)a3 mask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    id v16 = v7;
    LogPrintF();
  }
  uint64_t v8 = objc_msgSend(v6, "length", v15, v16);
  if (v8 == [v7 length])
  {
    v9 = (void *)[v6 copy];
    v10 = (void *)[v7 copy];
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke;
    block[3] = &unk_1E605C3D8;
    block[4] = self;
    id v18 = v9;
    id v19 = v10;
    id v12 = v10;
    id v13 = v9;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    [v6 length];
    [v7 length];
    uint64_t v14 = FatalErrorF();
    __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke(v14);
  }
}

void __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 48);
  v3 = (id *)(*(void *)(a1 + 32) + 24);
  objc_storeStrong(v3, v2);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__RPLegacyDeviceDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __50__RPLegacyDeviceDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v10 = a3;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_invalidateCalled && !self->_activateCalled)
  {
    serviceType = self->_serviceType;
    if (serviceType)
    {
      self->_activateCalled = 1;
      self->_verifyDevices = [(NSString *)serviceType isEqual:@"RPLegacyServiceTypeSystem"];
      if (*[(NSString *)self->_serviceType UTF8String] == 95)
      {
        int v5 = [(RPLegacyDeviceDiscovery *)self _bonjourStart];
        goto LABEL_15;
      }
      id v6 = self->_serviceType;
      if (([(NSString *)v6 isEqual:@"RPLegacyServiceTypeNearbyAction"] & 1) != 0
        || ([(NSString *)v6 isEqual:@"RPLegacyServiceTypeNearbyInfo"] & 1) != 0
        || [(NSString *)v6 isEqual:@"RPLegacyServiceTypeProximityPairing"])
      {

LABEL_14:
        int v5 = [(RPLegacyDeviceDiscovery *)self _bleStart];
        goto LABEL_15;
      }
      int v9 = [(NSString *)v6 isEqual:@"RPLegacyServiceTypeSystem"];

      if (v9) {
        goto LABEL_14;
      }
      if ([(NSString *)self->_serviceType isEqual:@"RPLegacyServiceTypeMobileDevice"])
      {
        int v5 = [(RPLegacyDeviceDiscovery *)self _mdStart];
        goto LABEL_15;
      }
      if (([(NSString *)self->_serviceType isEqual:@"RPLegacyServiceTypeWACAirPlay"] & 1) != 0
        || [(NSString *)self->_serviceType isEqual:@"RPLegacyServiceTypeWACGeneric"])
      {
        int v5 = [(RPLegacyDeviceDiscovery *)self _wifiStart];
LABEL_15:
        if (!v5) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (gLogCategory_RPLegacySupport > 90) {
        goto LABEL_20;
      }
      if (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
    }
  }
LABEL_16:
  if (gLogCategory_RPLegacySupport <= 60
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_20:
  id v7 = v10;
  if (v10)
  {
    id v8 = RPErrorF();
    (*((void (**)(id, void *))v10 + 2))(v10, v8);

    id v7 = v10;
  }
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler) {
    interruptionHandler[2]();
  }
  [(RPLegacyDeviceDiscovery *)self _lostAllDevices];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__RPLegacyDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__RPLegacyDeviceDiscovery_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_bleDiscovery invalidate];
    if (self->_bonjourBrowser) {
      BonjourBrowser_Stop();
    }
    [(CUMobileDeviceDiscovery *)self->_mdDiscovery invalidate];
    [(CUWiFiScanner *)self->_wifiScanner invalidate];
    [(RPLegacyDeviceDiscovery *)self _lostAllDevices];
    [(RPLegacyDeviceDiscovery *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPLegacySupport <= 50
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_bleDiscovery && !self->_bonjourBrowser && !self->_mdDiscovery && !self->_wifiScanner)
    {
      id invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler) {
        invalidationHandler[2]();
      }
      [(RPLegacyDeviceDiscovery *)self _cleanup];
      self->_invalidateDone = 1;
      if (gLogCategory_RPLegacySupport <= 10
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_foundDevice:(id)a3
{
  id v7 = a3;
  if (([v7 reported] & 1) == 0)
  {
    if (!self->_verifyDevices || (int v4 = [v7 state], v4 == 4) || v4 == 2)
    {
      [v7 setReported:1];
      id deviceFoundHandler = (void (**)(id, void *))self->_deviceFoundHandler;
      if (deviceFoundHandler)
      {
        id v6 = [v7 device];
        deviceFoundHandler[2](deviceFoundHandler, v6);
      }
    }
    else
    {
      [v7 pairVerify];
    }
  }
}

- (void)_lostDeviceByIdentifier:(id)a3
{
  id v7 = a3;
  int v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  if (v4)
  {
    [(NSMutableDictionary *)self->_devices removeObjectForKey:v7];
    if ([v4 reported])
    {
      id deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
      if (deviceLostHandler)
      {
        id v6 = [v4 device];
        deviceLostHandler[2](deviceLostHandler, v6);
      }
    }
    [v4 invalidate];
  }
}

- (void)_lostAllDevices
{
  [(NSMutableDictionary *)self->_devices enumerateKeysAndObjectsUsingBlock:&__block_literal_global_9];
  [(NSMutableDictionary *)self->_devices removeAllObjects];
  devices = self->_devices;
  self->_devices = 0;
}

uint64_t __42__RPLegacyDeviceDiscovery__lostAllDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (int)_bleStart
{
  [(SFDeviceDiscovery *)self->_bleDiscovery invalidate];
  v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)getSFDeviceDiscoveryClass[0]());
  bleDiscovery = self->_bleDiscovery;
  self->_bleDiscovery = v3;

  [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceFilter:self->_deviceFilter];
  [(SFDeviceDiscovery *)self->_bleDiscovery setDispatchQueue:self->_dispatchQueue];
  [(SFDeviceDiscovery *)self->_bleDiscovery setRssiThreshold:self->_rssiThreshold];
  [(SFDeviceDiscovery *)self->_bleDiscovery setScanCache:self->_scanCache];
  [(SFDeviceDiscovery *)self->_bleDiscovery setTargetUserSession:self->_targetUserSession];
  [(SFDeviceDiscovery *)self->_bleDiscovery setTimeout:self->_timeout];
  unsigned int v5 = self->_changeFlags & 1 | (8 * ((self->_changeFlags >> 1) & 1)) | (self->_changeFlags >> 1) & 2 | (self->_changeFlags >> 3) & 4;
  if (self->_changeFlags == -1) {
    unsigned int v5 = -1;
  }
  [(SFDeviceDiscovery *)self->_bleDiscovery setChangeFlags:v5 | (self->_deviceActionType != 0)];
  if (self->_deviceActionType
    || ([(NSString *)self->_serviceType isEqual:@"RPLegacyServiceTypeNearbyAction"] & 1) != 0)
  {
    uint64_t v6 = 16;
    goto LABEL_6;
  }
  if ([(NSString *)self->_serviceType isEqual:@"RPLegacyServiceTypeNearbyInfo"]) {
    goto LABEL_17;
  }
  if ([(NSString *)self->_serviceType isEqual:@"RPLegacyServiceTypeProximityPairing"])
  {
    uint64_t v6 = 2;
LABEL_6:
    [(SFDeviceDiscovery *)self->_bleDiscovery setDiscoveryFlags:v6];
    uint64_t scanRate = self->_scanRate;
    if ((int)scanRate > 39)
    {
      if (scanRate == 40)
      {
        uint64_t scanRate = 40;
        goto LABEL_14;
      }
      if (scanRate == 50)
      {
        uint64_t scanRate = 50;
        goto LABEL_14;
      }
    }
    else
    {
      if (scanRate == 10)
      {
LABEL_14:
        [(SFDeviceDiscovery *)self->_bleDiscovery setScanRate:scanRate];
        goto LABEL_15;
      }
      if (scanRate == 20)
      {
        uint64_t scanRate = 20;
        goto LABEL_14;
      }
    }
LABEL_15:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke;
    v14[3] = &unk_1E605D050;
    v14[4] = self;
    [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceFoundHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_2;
    v13[3] = &unk_1E605D050;
    v13[4] = self;
    [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceLostHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_3;
    v12[3] = &unk_1E605D078;
    v12[4] = self;
    [(SFDeviceDiscovery *)self->_bleDiscovery setDeviceChangedHandler:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_4;
    v11[3] = &unk_1E605B540;
    v11[4] = self;
    [(SFDeviceDiscovery *)self->_bleDiscovery setInterruptionHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_5;
    v10[3] = &unk_1E605B540;
    v10[4] = self;
    [(SFDeviceDiscovery *)self->_bleDiscovery setInvalidationHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_6;
    v9[3] = &unk_1E605B540;
    v9[4] = self;
    [(SFDeviceDiscovery *)self->_bleDiscovery setTimeoutHandler:v9];
    [(SFDeviceDiscovery *)self->_bleDiscovery activateWithCompletion:&__block_literal_global_75];
    return 0;
  }
  if ([(NSString *)self->_serviceType isEqual:@"RPLegacyServiceTypeSystem"])
  {
LABEL_17:
    uint64_t v6 = 1;
    goto LABEL_6;
  }
  if (gLogCategory_RPLegacySupport <= 60
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return -6762;
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bleHandleDeviceFound:a2];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bleHandleDeviceLost:a2];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _bleHandleDeviceChanged:a2 changes:a3];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_RPLegacySupport <= 50
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = *(void **)(a1 + 32);
  return [v2 _interrupted];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  int v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_6(uint64_t a1)
{
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 200);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_RPLegacySupport <= 60)
    {
      id v6 = v2;
      if (gLogCategory_RPLegacySupport != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v6;
      }
    }
  }
  else if (gLogCategory_RPLegacySupport <= 30)
  {
    id v6 = 0;
    if (gLogCategory_RPLegacySupport != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5) {
      goto LABEL_7;
    }
  }
}

- (void)_bleHandleDeviceFound:(id)a3
{
  id v11 = a3;
  int v4 = [v11 identifier];
  if (!v4)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_16;
  }
  if (self->_deviceActionType && [v11 deviceActionType] != self->_deviceActionType)
  {
LABEL_16:
    id v7 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
  if (v5)
  {
    id v7 = (RPDeviceContext *)v5;
  }
  else
  {
    id v6 = objc_alloc_init(RPDevice);
    [(RPDevice *)v6 setIdentifierUUID:v4];
    [(RPDevice *)v6 updateWithSFDevice:v11 changes:0xFFFFFFFFLL];
    id v7 = objc_alloc_init(RPDeviceContext);
    [(RPDeviceContext *)v7 setDevice:v6];
    [(RPDeviceContext *)v7 setDiscovery:self];
    devices = self->_devices;
    if (!devices)
    {
      int v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = self->_devices;
      self->_devices = v9;

      devices = self->_devices;
    }
    [(NSMutableDictionary *)devices setObject:v7 forKeyedSubscript:v4];
    [(RPLegacyDeviceDiscovery *)self _foundDevice:v7];
  }
LABEL_8:
}

- (void)_bleHandleDeviceLost:(id)a3
{
  id v5 = a3;
  int v4 = [v5 identifier];
  if (v4)
  {
    [(RPLegacyDeviceDiscovery *)self _lostDeviceByIdentifier:v4];
  }
  else if (gLogCategory_RPLegacySupport <= 90 {
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_bleHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  id v6 = [v11 identifier];
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_11;
  }
  id v7 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v6];
  if (!v7)
  {
    if (self->_deviceActionType && [v11 deviceActionType] == self->_deviceActionType) {
      [(RPLegacyDeviceDiscovery *)self _bleHandleDeviceFound:v11];
    }
LABEL_11:
    id v8 = 0;
    int v9 = 0;
    goto LABEL_13;
  }
  id v8 = v7;
  int v9 = [v7 device];
  [v9 updateWithSFDevice:v11 changes:v4];
  if (self->_deviceActionType && [v11 deviceActionType] != self->_deviceActionType)
  {
    [(RPLegacyDeviceDiscovery *)self _bleHandleDeviceLost:v11];
  }
  else if ([v8 reported])
  {
    id deviceChangedHandler = (void (**)(id, void *, void))self->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v9, v4 & 1 | (2 * ((v4 >> 3) & 1)) & 0xFFFFFFDB | (4 * ((v4 >> 1) & 1)) & 0xFFFFFFDF | (32 * ((v4 >> 2) & 1)));
    }
  }
LABEL_13:
}

- (int)_bonjourStart
{
  p_bonjourBrowser = &self->_bonjourBrowser;
  if (self->_bonjourBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(*p_bonjourBrowser);
    *p_bonjourBrowser = 0;
  }
  int v4 = BonjourBrowser_Create();
  if (v4
    || (BonjourBrowser_SetDispatchQueue(),
        BonjourBrowser_SetEventHandlerBlock(),
        [(NSString *)self->_serviceType UTF8String],
        (int v4 = BonjourBrowser_Start()) != 0))
  {
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*p_bonjourBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_bonjourBrowser);
      *p_bonjourBrowser = 0;
    }
  }
  return v4;
}

uint64_t __40__RPLegacyDeviceDiscovery__bonjourStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _bonjourHandleEventType:a2 info:a3];
}

- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  switch(a3)
  {
    case 1u:
      [(RPLegacyDeviceDiscovery *)self _bonjourHandleAddOrUpdateDevice:v6];
      goto LABEL_12;
    case 2u:
      [(RPLegacyDeviceDiscovery *)self _bonjourHandleRemoveDevice:v6];
      goto LABEL_12;
    case 3u:
      if (self->_bonjourBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_bonjourBrowser);
        self->_bonjourBrowser = 0;
      }
      [(RPLegacyDeviceDiscovery *)self _invalidated];
      goto LABEL_12;
    case 4u:
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(RPLegacyDeviceDiscovery *)self _interrupted];
LABEL_12:
      id v6 = v7;
      break;
    default:
      break;
  }
}

- (void)_bonjourHandleAddOrUpdateDevice:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15[0] = 0;
  v15[1] = 0;
  BonjourDevice_GetDeviceID();
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v15];
  id v6 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = v6;
    id v8 = [(RPDeviceContext *)v6 device];
    uint64_t v9 = [(RPDevice *)v8 updateWithBonjourDevice:v4];
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id deviceChangedHandler = (void (**)(id, RPDevice *, uint64_t))self->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v8, v9);
    }
  }
  else
  {
    id v8 = objc_alloc_init(RPDevice);
    [(RPDevice *)v8 setIdentifierUUID:v5];
    id v7 = objc_alloc_init(RPDeviceContext);
    [(RPDeviceContext *)v7 setDevice:v8];
    [(RPDeviceContext *)v7 setDiscovery:self];
    devices = self->_devices;
    if (!devices)
    {
      id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v12 = self->_devices;
      self->_devices = v11;

      devices = self->_devices;
    }
    [(NSMutableDictionary *)devices setObject:v7 forKeyedSubscript:v5];
    [(RPDevice *)v8 updateWithBonjourDevice:v4];
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7, v8);
    }
    else
    {
      -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7, v14);
    }
  }
}

- (void)_bonjourHandleRemoveDevice:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = 0;
  v6[1] = 0;
  BonjourDevice_GetDeviceID();
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v6];
  [(RPLegacyDeviceDiscovery *)self _lostDeviceByIdentifier:v5];
}

- (int)_mdStart
{
  [(CUMobileDeviceDiscovery *)self->_mdDiscovery invalidate];
  v3 = (CUMobileDeviceDiscovery *)objc_alloc_init(MEMORY[0x1E4F5E150]);
  mdDiscovery = self->_mdDiscovery;
  self->_mdDiscovery = v3;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke;
  v9[3] = &unk_1E605D0E8;
  v9[4] = self;
  [(CUMobileDeviceDiscovery *)self->_mdDiscovery setDeviceFoundHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_2;
  v8[3] = &unk_1E605D0E8;
  v8[4] = self;
  [(CUMobileDeviceDiscovery *)self->_mdDiscovery setDeviceLostHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_3;
  v7[3] = &unk_1E605D110;
  v7[4] = self;
  [(CUMobileDeviceDiscovery *)self->_mdDiscovery setDeviceChangedHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_4;
  void v6[3] = &unk_1E605B540;
  v6[4] = self;
  [(CUMobileDeviceDiscovery *)self->_mdDiscovery setInvalidationHandler:v6];
  [(CUMobileDeviceDiscovery *)self->_mdDiscovery activate];
  return 0;
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mdHandleDeviceFound:a2];
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mdHandleDeviceLost:a2];
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _mdHandleDeviceChanged:a2 changes:a3];
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_mdHandleDeviceFound:(id)a3
{
  id v11 = a3;
  id v4 = [v11 identifier];
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
    if (v5)
    {
      id v7 = (RPDeviceContext *)v5;
    }
    else
    {
      id v6 = objc_alloc_init(RPDevice);
      [(RPDevice *)v6 setIdentifierUUID:v4];
      [(RPDevice *)v6 updateWithMobileDevice:v11];
      id v7 = objc_alloc_init(RPDeviceContext);
      [(RPDeviceContext *)v7 setDevice:v6];
      [(RPDeviceContext *)v7 setDiscovery:self];
      devices = self->_devices;
      if (!devices)
      {
        uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v10 = self->_devices;
        self->_devices = v9;

        devices = self->_devices;
      }
      [(NSMutableDictionary *)devices setObject:v7 forKeyedSubscript:v4];
      [(RPLegacyDeviceDiscovery *)self _foundDevice:v7];
    }
  }
  else
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v7 = 0;
  }
}

- (void)_mdHandleDeviceLost:(id)a3
{
  id v5 = a3;
  id v4 = [v5 identifier];
  if (v4)
  {
    [(RPLegacyDeviceDiscovery *)self _lostDeviceByIdentifier:v4];
  }
  else if (gLogCategory_RPLegacySupport <= 90 {
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_mdHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  id v13 = a3;
  id v5 = [v13 identifier];
  if (!v5)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
LABEL_13:
    LogPrintF();
LABEL_17:
    id v7 = 0;
    id v8 = 0;
    goto LABEL_5;
  }
  id v6 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v5];
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = [v6 device];
  uint64_t v9 = [v8 updateWithMobileDevice:v13];
  id deviceChangedHandler = (void (**)(id, void *, void))self->_deviceChangedHandler;
  if (deviceChangedHandler)
  {
    uint64_t v11 = v9;
    id v12 = [v7 device];
    deviceChangedHandler[2](deviceChangedHandler, v12, v11);
  }
LABEL_5:
}

- (int)_wifiStart
{
  [(CUWiFiScanner *)self->_wifiScanner invalidate];
  v3 = (CUWiFiScanner *)objc_alloc_init(MEMORY[0x1E4F5E220]);
  wifiScanner = self->_wifiScanner;
  self->_wifiScanner = v3;

  [(CUWiFiScanner *)self->_wifiScanner setDispatchQueue:self->_dispatchQueue];
  [(CUWiFiScanner *)self->_wifiScanner setScanFlags:self->_wifiScanFlags];
  [(CUWiFiScanner *)self->_wifiScanner setSsid:self->_wifiSSID];
  self->_wifiAirPlayWAC = [(NSString *)self->_serviceType isEqual:@"RPLegacyServiceTypeWACAirPlay"];
  if (self->_changeFlags == -1) {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v5 = (self->_changeFlags >> 4) & 6 | ((self->_changeFlags & 0xA) != 0);
  }
  [(CUWiFiScanner *)self->_wifiScanner setChangeFlags:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke;
  v10[3] = &unk_1E605D138;
  v10[4] = self;
  [(CUWiFiScanner *)self->_wifiScanner setDeviceFoundHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_2;
  v9[3] = &unk_1E605D138;
  v9[4] = self;
  [(CUWiFiScanner *)self->_wifiScanner setDeviceLostHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_3;
  v8[3] = &unk_1E605D160;
  v8[4] = self;
  [(CUWiFiScanner *)self->_wifiScanner setDeviceChangedHandler:v8];
  [(CUWiFiScanner *)self->_wifiScanner setErrorHandler:&__block_literal_global_103];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_5;
  v7[3] = &unk_1E605B540;
  v7[4] = self;
  [(CUWiFiScanner *)self->_wifiScanner setInvalidationHandler:v7];
  [(CUWiFiScanner *)self->_wifiScanner activate];
  return 0;
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _wifiHandleDeviceFound:a2];
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _wifiHandleDeviceLost:a2];
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _wifiHandleDeviceChanged:a2 changes:a3];
}

void __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (gLogCategory_RPLegacySupport <= 60)
  {
    id v5 = v2;
    if (gLogCategory_RPLegacySupport != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      v3 = v5;
    }
  }
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  int v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_wifiHandleDeviceFound:(id)a3
{
  id v13 = a3;
  int v4 = [v13 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
    id v6 = [v13 deviceIEDeviceID];
    if (v6)
    {
      id v7 = v6;
      if (self->_wifiAirPlayWAC)
      {
        int v8 = [v13 deviceIEFlags];

        if ((v8 & 0x80000000) == 0) {
          goto LABEL_5;
        }
      }
      else
      {
      }
      if (v5)
      {
        uint64_t v9 = [(RPDeviceContext *)v5 device];
      }
      else
      {
        uint64_t v9 = objc_alloc_init(RPDevice);
        [(RPDevice *)v9 setIdentifierUUID:v4];
        id v5 = objc_alloc_init(RPDeviceContext);
        [(RPDeviceContext *)v5 setDevice:v9];
        [(RPDeviceContext *)v5 setDiscovery:self];
        devices = self->_devices;
        if (!devices)
        {
          uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v12 = self->_devices;
          self->_devices = v11;

          devices = self->_devices;
        }
        [(NSMutableDictionary *)devices setObject:v5 forKeyedSubscript:v4];
      }
      [(RPDevice *)v9 updateWithWiFiDevice:v13 changes:0xFFFFFFFFLL];
      [(RPLegacyDeviceDiscovery *)self _foundDevice:v5];

LABEL_14:
      goto LABEL_15;
    }
LABEL_5:
    if (!v5) {
      goto LABEL_15;
    }
    [(RPLegacyDeviceDiscovery *)self _wifiHandleDeviceLost:v13];
    goto LABEL_14;
  }
  if (gLogCategory_RPLegacySupport <= 90
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_15:
}

- (void)_wifiHandleDeviceLost:(id)a3
{
  id v5 = a3;
  int v4 = [v5 identifier];
  if (v4)
  {
    [(RPLegacyDeviceDiscovery *)self _lostDeviceByIdentifier:v4];
  }
  else if (gLogCategory_RPLegacySupport <= 90 {
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_wifiHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v12 = a3;
  id v6 = [v12 identifier];
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
LABEL_13:
    LogPrintF();
LABEL_17:
    int v8 = 0;
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  id v7 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v6];
  if (!v7)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  int v8 = v7;
  uint64_t v9 = [v7 device];
  [v9 updateWithWiFiDevice:v12 changes:v4];
  id deviceChangedHandler = (void (**)(id, void *, void))self->_deviceChangedHandler;
  if (deviceChangedHandler)
  {
    uint64_t v11 = [v8 device];
    deviceChangedHandler[2](deviceChangedHandler, v11, ((int)(v4 << 31) >> 31) & ((2 * (v4 & 1)) | 8) & 0xFFFFFF9F | (32 * ((v4 >> 1) & 3)));
  }
LABEL_5:
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_deviceActionType = a3;
}

- (NSSet)deviceFilter
{
  return self->_deviceFilter;
}

- (void)setDeviceFilter:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (int)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int)a3
{
  self->_rssiThreshold = a3;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (void)setScanCache:(BOOL)a3
{
  self->_scanCache = a3;
}

- (unsigned)scanRate
{
  return self->_scanRate;
}

- (void)setScanRate:(unsigned int)a3
{
  self->_uint64_t scanRate = a3;
}

- (unsigned)scanState
{
  return self->_scanState;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
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

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unsigned)wifiScanFlags
{
  return self->_wifiScanFlags;
}

- (void)setWifiScanFlags:(unsigned int)a3
{
  self->_wifiScanFlags = a3;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
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

- (id)scanStateChangedHandler
{
  return self->_scanStateChangedHandler;
}

- (void)setScanStateChangedHandler:(id)a3
{
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_scanStateChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong((id *)&self->_wifiScanner, 0);
  objc_storeStrong((id *)&self->_mdDiscovery, 0);
  objc_storeStrong((id *)&self->_bleDiscovery, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_blePayloadFilterMask, 0);
  objc_storeStrong((id *)&self->_blePayloadFilterData, 0);
}

@end