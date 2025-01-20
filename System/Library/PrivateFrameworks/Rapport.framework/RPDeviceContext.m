@interface RPDeviceContext
- (BOOL)reported;
- (RPDevice)device;
- (RPLegacyDeviceDiscovery)discovery;
- (RPLegacySession)session;
- (int)state;
- (void)invalidate;
- (void)pairVerify;
- (void)setDevice:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setReported:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setState:(int)a3;
- (void)systemInfoResponse:(id)a3 error:(id)a4;
@end

@implementation RPDeviceContext

- (void)invalidate
{
  discovery = self->_discovery;
  self->_discovery = 0;

  [(RPLegacySession *)self->_session invalidate];
  session = self->_session;
  self->_session = 0;
}

- (void)pairVerify
{
  [(RPLegacySession *)self->_session invalidate];
  v3 = objc_alloc_init(RPLegacySession);
  session = self->_session;
  self->_session = v3;

  [(RPLegacySession *)self->_session setPeerDevice:self->_device];
  [(RPLegacySession *)self->_session setSecurityFlags:3];
  [(RPLegacySession *)self->_session setServiceType:@"RPLegacyServiceTypeSystem"];
  v5 = self->_session;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__RPDeviceContext_pairVerify__block_invoke;
  v8[3] = &unk_1E605B5B0;
  v8[4] = self;
  [(RPLegacySession *)v5 activateWithCompletion:v8];
  v6 = self->_session;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__RPDeviceContext_pairVerify__block_invoke_2;
  v7[3] = &unk_1E605B5B0;
  v7[4] = self;
  [(RPLegacySession *)v6 pairVerifyWithFlags:8 completion:v7];
}

void __29__RPDeviceContext_pairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      id v6 = v7;
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "invalidate", v6);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    id v3 = v7;
  }
}

void __29__RPDeviceContext_pairVerify__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    id v7 = v3;
    LogPrintF();
  }
  if (!v3) {
    [*(id *)(*(void *)(a1 + 32) + 16) setSystemPairState:30];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__RPDeviceContext_pairVerify__block_invoke_3;
  v8[3] = &unk_1E605D188;
  v8[4] = v4;
  objc_msgSend(v5, "requestSystemInfoWithCompletion:", v8, v6, v7);
}

uint64_t __29__RPDeviceContext_pairVerify__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) systemInfoResponse:a2 error:a3];
}

- (void)systemInfoResponse:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    -[RPDevice updateWithSystemInfo:](self->_device, "updateWithSystemInfo:");
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      device = self->_device;
      LogPrintF();
    }
    self->_state = 4;
    -[RPLegacyDeviceDiscovery _foundDevice:](self->_discovery, "_foundDevice:", self, device);
  }
  else
  {
    self->_state = 3;
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      device = self->_device;
      id v9 = v6;
      LogPrintF();
    }
  }
  [(RPLegacySession *)self->_session invalidate];
  session = self->_session;
  self->_session = 0;
}

- (RPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (RPLegacyDeviceDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (BOOL)reported
{
  return self->_reported;
}

- (void)setReported:(BOOL)a3
{
  self->_reported = a3;
}

- (RPLegacySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end