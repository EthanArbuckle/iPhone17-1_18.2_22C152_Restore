@interface RPRemoteDisplayDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)_checkRSSIThresholdForDevice:(id)a3;
- (BOOL)shouldReportDevice:(id)a3;
- (BOOL)triggerEnhancedDiscovery;
- (NSArray)discoveredDevices;
- (NSArray)discoveredPeople;
- (NSString)peerDeviceIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (RPRemoteDisplayDevice)dedicatedDevice;
- (RPRemoteDisplayDiscovery)init;
- (RPRemoteDisplayDiscovery)initWithCoder:(id)a3;
- (RPRemoteDisplayPerson)personSelected;
- (id)dedicatedDeviceChangedHandler;
- (id)description;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)deviceSelectedHandler;
- (id)discoverySessionStateChangedHandler;
- (id)errorFlagsChangedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)personChangedHandler;
- (id)personDeclinedHandler;
- (id)personFoundHandler;
- (id)personLostHandler;
- (int64_t)rssiThreshold;
- (unint64_t)controlFlags;
- (unint64_t)discoveryFlags;
- (unint64_t)errorFlags;
- (unsigned)currentState;
- (unsigned)discoverySessionStartReason;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_lostAllDevices;
- (void)_lostAllPeople;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enterDiscoverySessionWithDevice:(id)a3 reason:(id)a4;
- (void)exitDiscoverySessionWithReason:(id)a3;
- (void)invalidate;
- (void)personCanceled:(id)a3;
- (void)remoteDisplayChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)remoteDisplayDedicatedDeviceChanged:(id)a3;
- (void)remoteDisplayDeviceSelected:(id)a3;
- (void)remoteDisplayFoundDevice:(id)a3;
- (void)remoteDisplayLostDevice:(id)a3;
- (void)remoteDisplayNotifyDiscoverySessionState:(unsigned __int8)a3 forDevice:(id)a4 startReason:(unsigned __int8)a5;
- (void)remoteDisplayPersonDeclined;
- (void)remoteDisplayUpdateErrorFlags:(unint64_t)a3;
- (void)requestDedicatedDeviceConfirmationWithCompletion:(id)a3;
- (void)saveDedicatedDevice:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDedicatedDeviceChangedHandler:(id)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDeviceSelectedHandler:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDiscoverySessionStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorFlags:(unint64_t)a3;
- (void)setErrorFlagsChangedHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPersonChangedHandler:(id)a3;
- (void)setPersonDeclinedHandler:(id)a3;
- (void)setPersonFoundHandler:(id)a3;
- (void)setPersonLostHandler:(id)a3;
- (void)setPersonSelected:(id)a3;
- (void)setPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4;
- (void)setRssiThreshold:(int64_t)a3;
- (void)setTriggerEnhancedDiscovery:(BOOL)a3;
@end

@implementation RPRemoteDisplayDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayDiscovery)init
{
  v8.receiver = self;
  v8.super_class = (Class)RPRemoteDisplayDiscovery;
  v2 = [(RPRemoteDisplayDiscovery *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_controlFlags = 6;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    int DeviceClass = GestaltGetDeviceClass();
    uint64_t v5 = -60;
    if (DeviceClass == 4) {
      uint64_t v5 = -75;
    }
    v3->_rssiThreshold = v5;
    v6 = v3;
  }

  return v3;
}

- (RPRemoteDisplayDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RPRemoteDisplayDiscovery;
  uint64_t v5 = [(RPRemoteDisplayDiscovery *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    id v7 = v4;
    if ([v7 containsValueForKey:@"cFl"]) {
      v6->_controlFlags = [v7 decodeInt64ForKey:@"cFl"];
    }

    id v8 = v7;
    if ([v8 containsValueForKey:@"dFl"]) {
      v6->_discoveryFlags = [v8 decodeInt64ForKey:@"dFl"];
    }

    id v9 = v8;
    if ([v9 containsValueForKey:@"eDis"]) {
      v6->_triggerEnhancedDiscovery = [v9 decodeBoolForKey:@"eDis"];
    }

    id v10 = v9;
    if ([v10 containsValueForKey:@"rssiTh"]) {
      v6->_rssiThreshold = [v10 decodeIntegerForKey:@"rssiTh"];
    }

    v11 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t controlFlags = self->_controlFlags;
  id v8 = v4;
  if (controlFlags)
  {
    [v4 encodeInt64:controlFlags forKey:@"cFl"];
    id v4 = v8;
  }
  unint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags)
  {
    [v8 encodeInt64:discoveryFlags forKey:@"dFl"];
    id v4 = v8;
  }
  if (self->_triggerEnhancedDiscovery)
  {
    [v8 encodeBool:1 forKey:@"eDis"];
    id v4 = v8;
  }
  int64_t rssiThreshold = self->_rssiThreshold;
  if (rssiThreshold)
  {
    [v8 encodeInteger:rssiThreshold forKey:@"rssiTh"];
    id v4 = v8;
  }
}

- (id)description
{
  unint64_t discoveryFlags = (unint64_t)self;
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_discoveryFlags)
  {
    v14 = v3;
    unint64_t discoveryFlags = self->_discoveryFlags;
    objc_super v13 = &unk_1B3971901;
    NSAppendPrintF();
    id v5 = v14;

    id v4 = v5;
  }
  if (self->_controlFlags)
  {
    unint64_t discoveryFlags = self->_controlFlags;
    objc_super v13 = &unk_1B3971920;
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }
  if ([(NSMutableDictionary *)self->_discoveredDevices count])
  {
    uint64_t v12 = [(NSMutableDictionary *)self->_discoveredDevices count];
    NSAppendPrintF();
    id v7 = v4;

    id v4 = v7;
  }
  if ([(NSMutableDictionary *)self->_discoveredPeople count])
  {
    [(NSMutableDictionary *)self->_discoveredPeople count];
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }
  if (self->_rssiThreshold)
  {
    NSAppendPrintF();
    id v9 = v4;

    id v4 = v9;
  }
  return v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RPRemoteDisplayDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __51__RPRemoteDisplayDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  int DeviceClass = GestaltGetDeviceClass();
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 64)) {
    BOOL v4 = DeviceClass == 100;
  }
  else {
    BOOL v4 = 0;
  }
  char v5 = v4;
  *(unsigned char *)(v3 + 50) = v5;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  return [v6 _activateWithCompletion:v7 reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPRemoteDisplayDiscovery <= 30 {
         && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  [(RPRemoteDisplayDiscovery *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke;
  v14[3] = &unk_1E605B7B8;
  BOOL v16 = v4;
  id v8 = v6;
  id v15 = v8;
  id v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke_2;
  v11[3] = &unk_1E605D408;
  BOOL v13 = v4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 remoteDisplayActivateDiscovery:self completion:v11];
}

void __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = v7;
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

void __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(a1 + 32) + 112) = a2;
  id v13 = v5;
  if (a2 && *(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 120), v5);
    id v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }

    id v5 = v13;
  }
  if (v5)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
      {
        if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (v9 = _LogCategory_Initialize(), id v5 = v13, v9))
        {
LABEL_20:
          LogPrintF();
          id v5 = v13;
        }
      }
    }
    else if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1) {
        goto LABEL_20;
      }
      int v11 = _LogCategory_Initialize();
      id v5 = v13;
      if (v11) {
        goto LABEL_20;
      }
    }
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1) {
        goto LABEL_20;
      }
      int v10 = _LogCategory_Initialize();
      id v5 = v13;
      if (v10) {
        goto LABEL_20;
      }
    }
  }
  else if (gLogCategory_RPRemoteDisplayDiscovery <= 30)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery != -1) {
      goto LABEL_20;
    }
    int v12 = _LogCategory_Initialize();
    id v5 = v13;
    if (v12) {
      goto LABEL_20;
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v13);
    id v5 = v13;
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.RemoteDisplay" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C42760];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E605B540;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C48260];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_RPRemoteDisplayDiscovery <= 10
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  int v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPRemoteDisplayDiscovery <= 50
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(RPRemoteDisplayDiscovery *)self _lostAllDevices];
  [(RPRemoteDisplayDiscovery *)self _lostAllPeople];
  if (self->_activateCalled) {
    [(RPRemoteDisplayDiscovery *)self _activateWithCompletion:0 reactivate:1];
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    int v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__RPRemoteDisplayDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__RPRemoteDisplayDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 32) = 1;
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(v2 + 32) + 40) invalidate];
    id v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id dedicatedDeviceChangedHandler = self->_dedicatedDeviceChangedHandler;
    self->_id dedicatedDeviceChangedHandler = 0;

    dedicatedDevice = self->_dedicatedDevice;
    self->_dedicatedDevice = 0;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0;

    id discoverySessionStateChangedHandler = self->_discoverySessionStateChangedHandler;
    self->_id discoverySessionStateChangedHandler = 0;

    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0;

    discoveredPeople = self->_discoveredPeople;
    self->_discoveredPeople = 0;

    id errorFlagsChangedHandler = self->_errorFlagsChangedHandler;
    self->_id errorFlagsChangedHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v14 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id personDeclinedHandler = self->_personDeclinedHandler;
    self->_id personDeclinedHandler = 0;

    id personFoundHandler = self->_personFoundHandler;
    self->_id personFoundHandler = 0;

    id personLostHandler = self->_personLostHandler;
    self->_id personLostHandler = 0;

    id personChangedHandler = self->_personChangedHandler;
    self->_id personChangedHandler = 0;

    personSelected = self->_personSelected;
    self->_personSelected = 0;

    peerDeviceIdentifier = self->_peerDeviceIdentifier;
    self->_peerDeviceIdentifier = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)personCanceled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(RPRemoteDisplayDiscovery *)self _ensureXPCStarted];
    xpcCnx = self->_xpcCnx;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__RPRemoteDisplayDiscovery_personCanceled___block_invoke;
    v8[3] = &unk_1E605B5B0;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v8];
    [v7 remoteDisplayPersonCanceled:v6];
  }
}

void __43__RPRemoteDisplayDiscovery_personCanceled___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    id v5 = v2;
    if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

- (BOOL)_checkRSSIThresholdForDevice:(id)a3
{
  int v4 = [a3 bleDevice];
  id v5 = [v4 bleDevice];
  int64_t v6 = [v5 rssi];

  return !v6 || v6 >= self->_rssiThreshold;
}

- (NSArray)discoveredDevices
{
  id v2 = self;
  objc_sync_enter(v2);
  discoveredDevices = v2->_discoveredDevices;
  if (discoveredDevices)
  {
    int v4 = [(NSMutableDictionary *)discoveredDevices allValues];
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (NSArray)discoveredPeople
{
  id v2 = self;
  objc_sync_enter(v2);
  discoveredPeople = v2->_discoveredPeople;
  if (discoveredPeople)
  {
    int v4 = [(NSMutableDictionary *)discoveredPeople allValues];
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setPersonSelected:(id)a3
{
}

- (void)setPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  objc_storeStrong((id *)&v8->_personSelected, a3);
  objc_sync_exit(v8);

  if (v7)
  {
    [(RPRemoteDisplayDiscovery *)v8 _ensureXPCStarted];
    xpcCnx = v8->_xpcCnx;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __66__RPRemoteDisplayDiscovery_setPersonSelected_forDedicatedPairing___block_invoke;
    id v15 = &unk_1E605B568;
    id v10 = v7;
    id v16 = v10;
    v17 = v8;
    int v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:&v12];
    objc_msgSend(v11, "remoteDisplayPersonSelected:forDedicatedPairing:", v10, v4, v12, v13, v14, v15);
  }
}

void __66__RPRemoteDisplayDiscovery_setPersonSelected_forDedicatedPairing___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = *(id *)(a1 + 40);
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 176);
  *(void *)(v4 + 176) = 0;

  objc_sync_exit(v3);
}

- (void)remoteDisplayFoundDevice:(id)a3
{
  id v20 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  discoveredDevices = v4->_discoveredDevices;
  if (!discoveredDevices)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = v4->_discoveredDevices;
    v4->_discoveredDevices = v6;

    discoveredDevices = v4->_discoveredDevices;
  }
  uint64_t v8 = [v20 identifier];
  [(NSMutableDictionary *)discoveredDevices setObject:v20 forKeyedSubscript:v8];

  id v9 = [v20 accountAltDSID];
  if (!v9) {
    goto LABEL_14;
  }
  id v10 = [(NSMutableDictionary *)v4->_discoveredPeople valueForKey:v9];
  id v11 = v10;
  if (v10)
  {
    [v10 addDevice:v20];
    char v12 = 0;
    goto LABEL_15;
  }
  id v11 = [[RPRemoteDisplayPerson alloc] initPersonWithDevice:v20];
  if (!v11)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_14:
    char v12 = 0;
    id v11 = 0;
    goto LABEL_15;
  }
  discoveredPeople = v4->_discoveredPeople;
  if (!discoveredPeople)
  {
    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v15 = v4->_discoveredPeople;
    v4->_discoveredPeople = v14;

    discoveredPeople = v4->_discoveredPeople;
  }
  [(NSMutableDictionary *)discoveredPeople setObject:v11 forKeyedSubscript:v9];
  char v12 = 1;
LABEL_15:

  objc_sync_exit(v4);
  if (v11)
  {
    if (v12) {
      id personFoundHandler = v4->_personFoundHandler;
    }
    else {
      id personFoundHandler = v4->_personChangedHandler;
    }
    uint64_t v17 = MEMORY[0x1B3EBCC80](personFoundHandler);
    v18 = (void *)v17;
    if (v17) {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v11);
    }
  }
  id deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
  if (deviceFoundHandler) {
    deviceFoundHandler[2](deviceFoundHandler, v20);
  }
}

- (void)remoteDisplayLostDevice:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  discoveredDevices = v4->_discoveredDevices;
  id v6 = [v17 identifier];
  [(NSMutableDictionary *)discoveredDevices setObject:0 forKeyedSubscript:v6];

  id v7 = [v17 accountAltDSID];
  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)v4->_discoveredPeople valueForKey:v7];
    id v9 = v8;
    if (v8
      && ([v8 removeDevice:v17],
          [v9 discoveredDevices],
          id v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 count],
          v10,
          !v11))
    {
      [(NSMutableDictionary *)v4->_discoveredPeople removeObjectForKey:v7];
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
    id v9 = 0;
  }

  objc_sync_exit(v4);
  if (v9)
  {
    if (v12) {
      id personLostHandler = v4->_personLostHandler;
    }
    else {
      id personLostHandler = v4->_personChangedHandler;
    }
    uint64_t v14 = MEMORY[0x1B3EBCC80](personLostHandler);
    id v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v9);
    }
  }
  id deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
  if (deviceLostHandler) {
    deviceLostHandler[2](deviceLostHandler, v17);
  }
}

- (void)remoteDisplayChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = self;
  objc_sync_enter(v6);
  discoveredDevices = v6->_discoveredDevices;
  uint64_t v8 = [v17 identifier];
  id v9 = [(NSMutableDictionary *)discoveredDevices objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v6->_discoveredDevices;
    uint64_t v11 = [v17 identifier];
    [(NSMutableDictionary *)v10 setObject:v17 forKeyedSubscript:v11];

    char v12 = [v17 accountAltDSID];
    if (v12)
    {
      uint64_t v13 = [(NSMutableDictionary *)v6->_discoveredPeople valueForKey:v12];
      uint64_t v14 = v13;
      if (v13)
      {
        [v13 removeDevice:v17];
        [v14 addDevice:v17];
      }
    }
    else
    {
      uint64_t v14 = 0;
    }

    objc_sync_exit(v6);
    if (v14)
    {
      id personChangedHandler = (void (**)(id, void *))v6->_personChangedHandler;
      if (personChangedHandler) {
        personChangedHandler[2](personChangedHandler, v14);
      }
    }
    id deviceChangedHandler = (void (**)(id, id, void))v6->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v17, v4);
    }
  }
  else
  {
    [(RPRemoteDisplayDiscovery *)v6 remoteDisplayFoundDevice:v17];
    objc_sync_exit(v6);

    uint64_t v14 = 0;
  }
}

- (void)remoteDisplayUpdateErrorFlags:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_errorFlags != a3)
  {
    self->_errorFlags = a3;
    id v5 = (void (**)(void))MEMORY[0x1B3EBCC80](self->_errorFlagsChangedHandler);
    if (v5)
    {
      id v6 = v5;
      v5[2]();
      id v5 = v6;
    }
  }
}

- (void)remoteDisplayDeviceSelected:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    uint64_t v4 = [[RPRemoteDisplayPerson alloc] initPersonWithDevice:v8];
    personSelected = self->_personSelected;
    self->_personSelected = v4;
  }
  else
  {
    personSelected = self->_personSelected;
    self->_personSelected = 0;
  }

  uint64_t v6 = MEMORY[0x1B3EBCC80](self->_deviceSelectedHandler);
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
  }
}

- (void)remoteDisplayNotifyDiscoverySessionState:(unsigned __int8)a3 forDevice:(id)a4 startReason:(unsigned __int8)a5
{
  uint64_t v7 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_currentState = v7;
  objc_storeStrong((id *)&self->_peerDeviceIdentifier, a4);
  self->_discoverySessionStartReason = a5;
  id discoverySessionStateChangedHandler = (void (**)(id, void, id))self->_discoverySessionStateChangedHandler;
  if (discoverySessionStateChangedHandler) {
    discoverySessionStateChangedHandler[2](discoverySessionStateChangedHandler, v7, v10);
  }
}

- (void)remoteDisplayPersonDeclined
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = (void (**)(void))MEMORY[0x1B3EBCC80](self->_personDeclinedHandler);
  if (v3)
  {
    uint64_t v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (void)_lostAllDevices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_RPRemoteDisplayDiscovery <= 30
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id deviceLostHandler = self->_deviceLostHandler;
  obj = self;
  objc_sync_enter(obj);
  discoveredDevices = obj->_discoveredDevices;
  if (deviceLostHandler)
  {
    id v5 = [(NSMutableDictionary *)discoveredDevices allValues];
    [(NSMutableDictionary *)obj->_discoveredDevices removeAllObjects];
    uint64_t v6 = obj->_discoveredDevices;
    obj->_discoveredDevices = 0;

    objc_sync_exit(obj);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = (void (**)(id, void))self->_deviceLostHandler;
          if (v11) {
            v11[2](v11, *(void *)(*((void *)&v14 + 1) + 8 * i));
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [(NSMutableDictionary *)discoveredDevices removeAllObjects];
    char v12 = obj->_discoveredDevices;
    obj->_discoveredDevices = 0;

    objc_sync_exit(obj);
  }
}

- (void)_lostAllPeople
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_RPRemoteDisplayDiscovery <= 30
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = [(RPRemoteDisplayDiscovery *)self discoveredPeople];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_discoveredPeople removeAllObjects];
  discoveredPeople = v4->_discoveredPeople;
  v4->_discoveredPeople = 0;

  personSelected = v4->_personSelected;
  v4->_personSelected = 0;

  objc_sync_exit(v4);
  if (v4->_personLostHandler)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          (*((void (**)(id))v4->_personLostHandler + 2))(v4->_personLostHandler);
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)shouldReportDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = (([v4 statusFlags] & 0x80000) != 0
     || ([v4 statusFlags] & 0x2000000000) != 0 && (self->_discoveryFlags & 1) != 0
     || ([v4 statusFlags] & 0x1000000000) != 0 && (self->_discoveryFlags & 2) != 0)
    && [(RPRemoteDisplayDiscovery *)self _checkRSSIThresholdForDevice:v4];

  return v5;
}

- (void)enterDiscoverySessionWithDevice:(id)a3 reason:(id)a4
{
  xpcCnx = self->_xpcCnx;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:&__block_literal_global_12];
  [v8 remoteDisplayChangeDiscoverySessionStateForDevice:v7 reason:v6];
}

void __67__RPRemoteDisplayDiscovery_enterDiscoverySessionWithDevice_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    id v5 = v2;
    if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

- (void)exitDiscoverySessionWithReason:(id)a3
{
  xpcCnx = self->_xpcCnx;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:&__block_literal_global_123];
  [v5 remoteDisplayChangeDiscoverySessionStateForDevice:0 reason:v4];
}

void __59__RPRemoteDisplayDiscovery_exitDiscoverySessionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    id v5 = v2;
    if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

- (void)saveDedicatedDevice:(id)a3
{
  xpcCnx = self->_xpcCnx;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:&__block_literal_global_126];
  [v5 remoteDisplayChangeDedicatedDevice:v4];
}

void __48__RPRemoteDisplayDiscovery_saveDedicatedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    id v5 = v2;
    if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

- (void)remoteDisplayDedicatedDeviceChanged:(id)a3
{
  id v8 = (RPRemoteDisplayDevice *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_dedicatedDevice == v8)
  {
    objc_storeStrong((id *)&v5->_dedicatedDevice, a3);
    objc_sync_exit(v5);
  }
  else
  {
    BOOL v6 = -[RPRemoteDisplayDevice isEqualToDevice:](v8, "isEqualToDevice:");
    objc_storeStrong((id *)&v5->_dedicatedDevice, a3);
    objc_sync_exit(v5);

    if (!v6)
    {
      id dedicatedDeviceChangedHandler = (void (**)(id, RPRemoteDisplayDevice *))v5->_dedicatedDeviceChangedHandler;
      if (dedicatedDeviceChangedHandler) {
        dedicatedDeviceChangedHandler[2](dedicatedDeviceChangedHandler, v8);
      }
    }
  }
}

- (void)requestDedicatedDeviceConfirmationWithCompletion:(id)a3
{
  id v4 = a3;
  [(RPRemoteDisplayDiscovery *)self _ensureXPCStarted];
  id v5 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxyWithErrorHandler:&__block_literal_global_129];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke_2;
  v7[3] = &unk_1E605B600;
  id v8 = v4;
  id v6 = v4;
  [v5 remoteDisplayDedicatedDeviceConfirmationWithCompletion:v7];
}

void __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    id v5 = v2;
    if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

void __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_unint64_t controlFlags = a3;
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

- (id)deviceSelectedHandler
{
  return self->_deviceSelectedHandler;
}

- (void)setDeviceSelectedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_unint64_t discoveryFlags = a3;
}

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

- (void)setErrorFlags:(unint64_t)a3
{
  self->_errorFlags = a3;
}

- (id)errorFlagsChangedHandler
{
  return self->_errorFlagsChangedHandler;
}

- (void)setErrorFlagsChangedHandler:(id)a3
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

- (id)personChangedHandler
{
  return self->_personChangedHandler;
}

- (void)setPersonChangedHandler:(id)a3
{
}

- (id)personDeclinedHandler
{
  return self->_personDeclinedHandler;
}

- (void)setPersonDeclinedHandler:(id)a3
{
}

- (id)personFoundHandler
{
  return self->_personFoundHandler;
}

- (void)setPersonFoundHandler:(id)a3
{
}

- (id)personLostHandler
{
  return self->_personLostHandler;
}

- (void)setPersonLostHandler:(id)a3
{
}

- (RPRemoteDisplayPerson)personSelected
{
  return self->_personSelected;
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int64_t)a3
{
  self->_int64_t rssiThreshold = a3;
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (NSString)peerDeviceIdentifier
{
  return self->_peerDeviceIdentifier;
}

- (RPRemoteDisplayDevice)dedicatedDevice
{
  return self->_dedicatedDevice;
}

- (id)dedicatedDeviceChangedHandler
{
  return self->_dedicatedDeviceChangedHandler;
}

- (void)setDedicatedDeviceChangedHandler:(id)a3
{
}

- (unsigned)discoverySessionStartReason
{
  return self->_discoverySessionStartReason;
}

- (id)discoverySessionStateChangedHandler
{
  return self->_discoverySessionStateChangedHandler;
}

- (void)setDiscoverySessionStateChangedHandler:(id)a3
{
}

- (BOOL)triggerEnhancedDiscovery
{
  return self->_triggerEnhancedDiscovery;
}

- (void)setTriggerEnhancedDiscovery:(BOOL)a3
{
  self->_triggerEnhancedDiscovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoverySessionStateChangedHandler, 0);
  objc_storeStrong(&self->_dedicatedDeviceChangedHandler, 0);
  objc_storeStrong((id *)&self->_dedicatedDevice, 0);
  objc_storeStrong((id *)&self->_peerDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_personSelected, 0);
  objc_storeStrong(&self->_personLostHandler, 0);
  objc_storeStrong(&self->_personFoundHandler, 0);
  objc_storeStrong(&self->_personDeclinedHandler, 0);
  objc_storeStrong(&self->_personChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorFlagsChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceSelectedHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_discoveredPeople, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
}

@end