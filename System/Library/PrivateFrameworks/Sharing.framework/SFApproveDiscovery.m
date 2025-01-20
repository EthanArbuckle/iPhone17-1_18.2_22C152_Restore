@interface SFApproveDiscovery
- (NSArray)devices;
- (OS_dispatch_queue)dispatchQueue;
- (SFApproveDiscovery)init;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_activatedWithError:(id)a3;
- (void)_discoveryDeviceChanged:(id)a3;
- (void)_discoveryEnsureStarted;
- (void)_discoveryEnsureStopped;
- (void)_discoveryFoundDevice:(id)a3;
- (void)_discoveryLostDevice:(id)a3;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation SFApproveDiscovery

- (SFApproveDiscovery)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFApproveDiscovery;
  v2 = [(SFApproveDiscovery *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deviceDictionary = v2->_deviceDictionary;
    v2->_deviceDictionary = (NSMutableDictionary *)v3;

    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v5 = v2;
  }

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SFApproveDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __45__SFApproveDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  if (gLogCategory_SFApproveDiscovery <= 50
    && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _activateWithCompletion:v3];
}

- (void)_activateWithCompletion:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v6 = _Block_copy(v5);

  id activateHandler = self->_activateHandler;
  self->_id activateHandler = v6;

  [(SFApproveDiscovery *)self _discoveryEnsureStarted];
}

- (void)_activatedWithError:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  (*((void (**)(void))self->_activateHandler + 2))();
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SFApproveDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__SFApproveDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (gLogCategory_SFApproveDiscovery <= 50
      && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(v2 + 32) _discoveryEnsureStopped];
    uint64_t v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v4 = self->_invalidationHandler;
    }
    else
    {
      id v4 = 0;
    }
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFApproveDiscovery <= 50
      && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (NSArray)devices
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  devices = v2->_devices;
  if (!devices) {
    devices = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = devices;
  objc_sync_exit(v2);

  return v4;
}

- (void)_discoveryEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_deviceDiscovery)
  {
    uint64_t v3 = (SFDeviceDiscovery *)objc_opt_new();
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    [(SFDeviceDiscovery *)self->_deviceDiscovery setChangeFlags:1];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDiscoveryFlags:16777217];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke;
    v10[3] = &unk_1E5BBDF70;
    v10[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_2;
    v9[3] = &unk_1E5BBDF70;
    v9[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceLostHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_3;
    v8[3] = &unk_1E5BBDF98;
    v8[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceChangedHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_4;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setInvalidationHandler:v7];
    id v5 = self->_deviceDiscovery;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_5;
    v6[3] = &unk_1E5BBC8E8;
    v6[4] = self;
    [(SFDeviceDiscovery *)v5 activateWithCompletion:v6];
  }
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _discoveryFoundDevice:a2];
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _discoveryLostDevice:a2];
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _discoveryDeviceChanged:a2];
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_SFApproveDiscovery <= 90
    && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activatedWithError:a2];
}

- (void)_discoveryEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SFDeviceDiscovery *)self->_deviceDiscovery setInvalidationHandler:0];
  [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;
}

- (void)_discoveryFoundDevice:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v11 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_deviceDictionary objectForKeyedSubscript:v4];

    if (v5)
    {
      if (gLogCategory_SFApproveDiscovery <= 60
        && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
      {
LABEL_15:
        LogPrintF();
      }
    }
    else if ([v11 autoUnlockEnabled])
    {
      if (gLogCategory_SFApproveDiscovery <= 50
        && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
      {
        id v10 = v11;
        LogPrintF();
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceDictionary, "setObject:forKeyedSubscript:", v11, v4, v10);
      id v6 = self;
      objc_sync_enter(v6);
      uint64_t v7 = [(NSMutableDictionary *)self->_deviceDictionary allValues];
      devices = v6->_devices;
      v6->_devices = (NSArray *)v7;

      objc_sync_exit(v6);
      deviceFoundHandler = (void (**)(id, id))v6->_deviceFoundHandler;
      if (deviceFoundHandler) {
        deviceFoundHandler[2](deviceFoundHandler, v11);
      }
    }
    else if (gLogCategory_SFApproveDiscovery <= 50 {
           && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    }
    {
      goto LABEL_15;
    }
  }
  else if (gLogCategory_SFApproveDiscovery <= 90 {
         && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_15;
  }
}

- (void)_discoveryDeviceChanged:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v17 identifier];
  if (!v4)
  {
    if (gLogCategory_SFApproveDiscovery <= 90
      && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_21;
  }
  id v5 = [(NSMutableDictionary *)self->_deviceDictionary objectForKeyedSubscript:v4];
  if (v5)
  {
  }
  else if ([v17 autoUnlockEnabled])
  {
    if (gLogCategory_SFApproveDiscovery <= 50
      && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      id v16 = v17;
      LogPrintF();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceDictionary, "setObject:forKeyedSubscript:", v17, v4, v16);
    v13 = self;
    objc_sync_enter(v13);
    uint64_t v14 = [(NSMutableDictionary *)self->_deviceDictionary allValues];
    devices = v13->_devices;
    v13->_devices = (NSArray *)v14;

    objc_sync_exit(v13);
    deviceFoundHandler = (void (**)(id, id))v13->_deviceFoundHandler;
    if (deviceFoundHandler) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_deviceDictionary objectForKeyedSubscript:v4];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    char v8 = [v17 autoUnlockEnabled];

    if ((v8 & 1) == 0)
    {
      if (gLogCategory_SFApproveDiscovery <= 50
        && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
      {
        id v16 = v17;
        LogPrintF();
      }
      -[NSMutableDictionary removeObjectForKey:](self->_deviceDictionary, "removeObjectForKey:", v4, v16);
      v9 = self;
      objc_sync_enter(v9);
      uint64_t v10 = [(NSMutableDictionary *)self->_deviceDictionary allValues];
      id v11 = v9->_devices;
      v9->_devices = (NSArray *)v10;

      objc_sync_exit(v9);
      deviceFoundHandler = (void (**)(id, id))v9->_deviceLostHandler;
      if (deviceFoundHandler) {
LABEL_20:
      }
        deviceFoundHandler[2](deviceFoundHandler, v17);
    }
  }
LABEL_21:
}

- (void)_discoveryLostDevice:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v11 identifier];
  if (!v4)
  {
    if (gLogCategory_SFApproveDiscovery > 90
      || gLogCategory_SFApproveDiscovery == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
LABEL_11:
    LogPrintF();
    goto LABEL_18;
  }
  id v5 = [(NSMutableDictionary *)self->_deviceDictionary objectForKeyedSubscript:v4];

  if (!v5)
  {
    if (gLogCategory_SFApproveDiscovery > 50
      || gLogCategory_SFApproveDiscovery == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  if (gLogCategory_SFApproveDiscovery <= 50
    && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
  {
    id v10 = v11;
    LogPrintF();
  }
  -[NSMutableDictionary removeObjectForKey:](self->_deviceDictionary, "removeObjectForKey:", v4, v10);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(NSMutableDictionary *)self->_deviceDictionary allValues];
  devices = v6->_devices;
  v6->_devices = (NSArray *)v7;

  objc_sync_exit(v6);
  deviceLostHandler = (void (**)(id, id))v6->_deviceLostHandler;
  if (deviceLostHandler) {
    deviceLostHandler[2](deviceLostHandler, v11);
  }
LABEL_18:
}

- (void)setDevices:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);

  objc_storeStrong(&self->_activateHandler, 0);
}

@end