@interface RPAppSignInService
- (NSArray)associatedDomains;
- (NSString)appBundleID;
- (NSString)appName;
- (OS_dispatch_queue)dispatchQueue;
- (RPAppSignInService)init;
- (id)description;
- (unsigned)flags;
- (void)_activate;
- (void)_invalidate;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setAppBundleID:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
@end

@implementation RPAppSignInService

- (RPAppSignInService)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPAppSignInService;
  v2 = [(RPAppSignInService *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;
  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__RPAppSignInService_activate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__RPAppSignInService_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(void **)(v2 + 32);
    return [v3 _activate];
  }
  return result;
}

- (void)_activate
{
  if (gLogCategory_RPAppSignInService <= 30
    && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = objc_alloc_init(getSFServiceClass());
  objc_storeStrong((id *)&self->_bleAdvertiser, v3);
  [v3 setDeviceActionType:28];
  v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  [v3 setIdentifier:v5];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__RPAppSignInService__activate__block_invoke;
  v7[3] = &unk_1E605B568;
  id v8 = v3;
  v9 = self;
  id v6 = v3;
  [v6 activateWithCompletion:v7];
}

void __31__RPAppSignInService__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 16))
  {
    if (v3)
    {
      id v9 = v3;
      if (gLogCategory_RPAppSignInService <= 30
        && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
      {
        id v8 = v9;
        LogPrintF();
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "invalidate", v8);
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = 0;

      goto LABEL_11;
    }
    if (gLogCategory_RPAppSignInService <= 30)
    {
      id v9 = 0;
      if (gLogCategory_RPAppSignInService != -1 || (int v7 = _LogCategory_Initialize(), v4 = 0, v7))
      {
        LogPrintF();
LABEL_11:
        v4 = v9;
      }
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__RPAppSignInService_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPAppSignInService_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = *(void **)(v2 + 32);
    return [v3 _invalidate];
  }
  return result;
}

- (void)_invalidate
{
  if (self->_bleAdvertiser)
  {
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFService *)self->_bleAdvertiser invalidate];
    bleAdvertiser = self->_bleAdvertiser;
    self->_bleAdvertiser = 0;
  }
  [(RPAppSignInService *)self _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

@end