@interface RPPrivateXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)direct;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPPrivateAdvertiser)activatedAdvertiser;
- (RPPrivateDaemon)daemon;
- (RPPrivateDiscovery)activatedDiscovery;
- (void)setDaemon:(id)a3;
- (void)setDirect:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setXpcCnx:(id)a3;
- (void)xpcConnectionInvalidated;
- (void)xpcPrivateAdvertiserActivate:(id)a3 completion:(id)a4;
- (void)xpcPrivateAdvertiserUpdate:(id)a3 completion:(id)a4;
- (void)xpcPrivateDiscoveryActivate:(id)a3 completion:(id)a4;
- (void)xpcPrivateDiscoveryUpdate:(id)a3 completion:(id)a4;
@end

@implementation RPPrivateXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.rapport"];
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_100142570 <= 90 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (a3)
    {
      RPErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v8;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)xpcConnectionInvalidated
{
  v3 = self->_activatedAdvertiser;
  if (v3)
  {
    if (dword_100142570 < 31 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v3;
      uint64_t v9 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (!self->_direct) {
      [(RPPrivateAdvertiser *)v3 invalidate];
    }
    activatedAdvertiser = self->_activatedAdvertiser;
    self->_activatedAdvertiser = 0;
  }
  v5 = self->_activatedDiscovery;
  if (v5)
  {
    if (dword_100142570 < 31 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (!self->_direct) {
      [(RPPrivateDiscovery *)v5 invalidate];
    }
    activatedDiscovery = self->_activatedDiscovery;
    self->_activatedDiscovery = 0;
  }
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;
}

- (void)xpcPrivateAdvertiserActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  id v12 = 0;
  unsigned int v9 = [(RPPrivateXPCConnection *)self _entitledAndReturnError:&v12];
  id v10 = v12;
  id v11 = v10;
  if (v9)
  {
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_activatedAdvertiser, a3);
    id v11 = 0;
  }
  ((void (**)(id, id))v8)[2](v8, v11);
}

- (void)xpcPrivateAdvertiserUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v11 = 0;
  unsigned int v8 = [(RPPrivateXPCConnection *)self _entitledAndReturnError:&v11];
  id v9 = v11;
  id v10 = v9;
  if (v8)
  {
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    id v10 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v10);
}

- (void)xpcPrivateDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  unsigned int v8 = (void (**)(id, void))a4;
  id v12 = 0;
  unsigned int v9 = [(RPPrivateXPCConnection *)self _entitledAndReturnError:&v12];
  id v10 = v12;
  id v11 = v10;
  if (v9)
  {
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    id v11 = 0;
  }
  ((void (**)(id, id))v8)[2](v8, v11);
}

- (void)xpcPrivateDiscoveryUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v11 = 0;
  unsigned int v8 = [(RPPrivateXPCConnection *)self _entitledAndReturnError:&v11];
  id v9 = v11;
  id v10 = v9;
  if (v8)
  {
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    id v10 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v10);
}

- (RPPrivateAdvertiser)activatedAdvertiser
{
  return self->_activatedAdvertiser;
}

- (RPPrivateDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPPrivateDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);

  objc_storeStrong((id *)&self->_activatedAdvertiser, 0);
}

@end