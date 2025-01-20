@interface RPNearbyInvitationDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldReportDevice:(id)a3;
- (NSArray)discoveredDevices;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearbyInvitationDiscovery)init;
- (RPNearbyInvitationDiscovery)initWithCoder:(id)a3;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unint64_t)discoveryFlags;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)nearbyInvitationChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)nearbyInvitationFoundDevice:(id)a3;
- (void)nearbyInvitationLostDevice:(id)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation RPNearbyInvitationDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNearbyInvitationDiscovery;
  v2 = [(RPNearbyInvitationDiscovery *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (RPNearbyInvitationDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPNearbyInvitationDiscovery;
  v5 = [(RPNearbyInvitationDiscovery *)&v10 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    id v7 = v4;
    if ([v7 containsValueForKey:@"_disFl"]) {
      v6->_discoveryFlags = [v7 decodeInt64ForKey:@"_disFl"];
    }

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags) {
    [a3 encodeInt64:discoveryFlags forKey:@"_disFl"];
  }
}

- (NSString)description
{
  unint64_t discoveryFlags = (unint64_t)self;
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_discoveryFlags)
  {
    objc_super v10 = v3;
    unint64_t discoveryFlags = self->_discoveryFlags;
    v9 = &unk_1B397118C;
    NSAppendPrintF();
    id v5 = v10;

    id v4 = v5;
  }
  if ([(NSMutableDictionary *)self->_discoveredDevices count])
  {
    [(NSMutableDictionary *)self->_discoveredDevices count];
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }
  return (NSString *)v4;
}

- (BOOL)shouldReportDevice:(id)a3
{
  return ([a3 statusFlags] & 0x10000AE000) == 0;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__RPNearbyInvitationDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __54__RPNearbyInvitationDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNearbyInvitationDiscovery <= 30 {
         && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  [(RPNearbyInvitationDiscovery *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke;
  v14[3] = &unk_1E605BCF0;
  v14[4] = self;
  BOOL v16 = v4;
  id v8 = v6;
  id v15 = v8;
  v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke_2;
  v11[3] = &unk_1E605B7B8;
  BOOL v13 = v4;
  id v12 = v8;
  id v10 = v8;
  [v9 nearbyInvitationActivateDiscovery:self completion:v11];
}

uint64_t __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    id v10 = v3;
    uint64_t v5 = RPNestedErrorF();

    id v4 = (id)v5;
  }
  id v11 = v4;
  if (*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1 || (int v6 = _LogCategory_Initialize(), v4 = v11, v6))
      {
LABEL_9:
        LogPrintF();
        id v4 = v11;
      }
    }
  }
  else if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
  {
    if (gLogCategory_RPNearbyInvitationDiscovery != -1) {
      goto LABEL_9;
    }
    int v7 = _LogCategory_Initialize();
    id v4 = v11;
    if (v7) {
      goto LABEL_9;
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v4);
  }
  return MEMORY[0x1F4181870]();
}

void __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
      {
        if (gLogCategory_RPNearbyInvitationDiscovery != -1 || (v5 = _LogCategory_Initialize(), id v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          id v3 = v9;
        }
      }
    }
    else if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1) {
        goto LABEL_15;
      }
      int v7 = _LogCategory_Initialize();
      id v3 = v9;
      if (v7) {
        goto LABEL_15;
      }
    }
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1) {
        goto LABEL_15;
      }
      int v6 = _LogCategory_Initialize();
      id v3 = 0;
      if (v6) {
        goto LABEL_15;
      }
    }
  }
  else if (gLogCategory_RPNearbyInvitationDiscovery <= 30)
  {
    if (gLogCategory_RPNearbyInvitationDiscovery != -1) {
      goto LABEL_15;
    }
    int v8 = _LogCategory_Initialize();
    id v3 = 0;
    if (v8) {
      goto LABEL_15;
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
    id v3 = v9;
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.rapport.NearbyInvitation" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    int v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C3E138];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E605B540;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    int v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C48020];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_RPNearbyInvitationDiscovery <= 10
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPNearbyInvitationDiscovery <= 50
    && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_activateCalled) {
    [(RPNearbyInvitationDiscovery *)self _activateWithCompletion:0 reactivate:1];
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    uint64_t v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__RPNearbyInvitationDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__RPNearbyInvitationDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(v2 + 32) + 32) invalidate];
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
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0;

    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (NSArray)discoveredDevices
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  discoveredDevices = v2->_discoveredDevices;
  if (discoveredDevices)
  {
    uint64_t v4 = [(NSMutableDictionary *)discoveredDevices allValues];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)nearbyInvitationFoundDevice:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  int v5 = [v10 identifier];
  if (v5)
  {
    discoveredDevices = v4->_discoveredDevices;
    if (!discoveredDevices)
    {
      int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = v4->_discoveredDevices;
      v4->_discoveredDevices = v7;

      discoveredDevices = v4->_discoveredDevices;
    }
    [(NSMutableDictionary *)discoveredDevices setObject:v10 forKeyedSubscript:v5];

    objc_sync_exit(v4);
    id deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
    if (deviceFoundHandler) {
      deviceFoundHandler[2](deviceFoundHandler, v10);
    }
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)nearbyInvitationLostDevice:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  int v5 = [v7 identifier];
  if (v5)
  {
    [(NSMutableDictionary *)v4->_discoveredDevices setObject:0 forKeyedSubscript:v5];

    objc_sync_exit(v4);
    id deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
    if (deviceLostHandler) {
      deviceLostHandler[2](deviceLostHandler, v7);
    }
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)nearbyInvitationChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v6 = self;
  objc_sync_enter(v6);
  id v7 = [v9 identifier];
  if (v7)
  {
    [(NSMutableDictionary *)v6->_discoveredDevices setObject:v9 forKeyedSubscript:v7];

    objc_sync_exit(v6);
    id deviceChangedHandler = (void (**)(id, id, void))v6->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v9, v4);
    }
  }
  else
  {
    objc_sync_exit(v6);
  }
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
}

@end