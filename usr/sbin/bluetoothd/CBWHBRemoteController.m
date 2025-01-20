@interface CBWHBRemoteController
- (BOOL)invalidated;
- (CBDaemonServer)daemonServer;
- (CBDiscovery)activatedDiscovery;
- (CBWHBDiscoveryDaemon)whbDaemon;
- (NSString)controllerID;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkDevice)remoteDevice;
- (id)description;
- (unint64_t)activationRetryCount;
- (unint64_t)discoveryFlags;
- (void)activate;
- (void)invalidate;
- (void)setActivatedDiscovery:(id)a3;
- (void)setActivationRetryCount:(unint64_t)a3;
- (void)setControllerID:(id)a3;
- (void)setDaemonServer:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setWhbDaemon:(id)a3;
@end

@implementation CBWHBRemoteController

- (id)description
{
  v4 = sub_10008C254(self->_remoteDevice);
  v2 = NSPrintF_safe();

  return v2;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  if (self->_discoveryFlags != a3)
  {
    self->_discoveryFlags = a3;
    [(CBDiscovery *)self->_activatedDiscovery setDiscoveryFlags:a3 & 0xFFFFBFFFFFFFFFFFLL];
  }
}

- (void)activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
  {
    v9 = sub_10008C254(self->_remoteDevice);
    LogPrintF_safe();
  }
  v3 = self->_activatedDiscovery;
  if (!v3)
  {
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    objc_storeStrong((id *)&self->_activatedDiscovery, v3);
    [(CBDiscovery *)v3 setDiscoveryFlags:self->_discoveryFlags & 0xFFFFBFFFFFFFFFFFLL];
    [(CBDiscovery *)v3 setDispatchQueue:self->_dispatchQueue];
    v4 = [(CBDaemonServer *)self->_daemonServer xpcListenerEndpoint];
    if (v4)
    {
      [(CBDiscovery *)v3 setTestListenerEndpoint:v4];
      id v5 = objc_alloc_init((Class)CBDevice);
      v6 = [(RPCompanionLinkDevice *)self->_remoteDevice idsDeviceIdentifier];
      [v5 setIdentifier:v6];

      [(CBDiscovery *)v3 setRemoteDevice:v5];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10008C600;
      v16[3] = &unk_100997370;
      v7 = v3;
      v17 = v7;
      v18 = self;
      [(CBDiscovery *)v7 setDeviceFoundHandler:v16];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10008C620;
      v13[3] = &unk_100997370;
      v8 = v7;
      v14 = v8;
      v15 = self;
      [(CBDiscovery *)v8 setDeviceLostHandler:v13];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10008C640;
      v10[3] = &unk_100997398;
      v11 = v8;
      v12 = self;
      [(CBDiscovery *)v11 activateWithCompletion:v10];
    }
    else if (dword_1009F83A0 <= 90 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
  {
    v4 = sub_10008C254(self->_remoteDevice);
    LogPrintF_safe();
  }
  [(CBDiscovery *)self->_activatedDiscovery invalidate];
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0;

  self->_invalidated = 1;
}

- (CBDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (void)setActivatedDiscovery:(id)a3
{
}

- (NSString)controllerID
{
  return self->_controllerID;
}

- (void)setControllerID:(id)a3
{
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPCompanionLinkDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (CBWHBDiscoveryDaemon)whbDaemon
{
  return self->_whbDaemon;
}

- (void)setWhbDaemon:(id)a3
{
}

- (unint64_t)activationRetryCount
{
  return self->_activationRetryCount;
}

- (void)setActivationRetryCount:(unint64_t)a3
{
  self->_activationRetryCount = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whbDaemon, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_controllerID, 0);

  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
}

@end