@interface PairingProximityNotifierService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)workQueue;
- (PairingProximityNotifierService)init;
- (SBSRemoteAlertConfiguration)config;
- (SBSRemoteAlertHandle)pairingAlertHandle;
- (void)_postAppRemovedBulletinBoardNotification;
- (void)notifyOfNearbyDevice:(id)a3 withReply:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setConfig:(id)a3;
- (void)setPairingAlertHandle:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation PairingProximityNotifierService

- (PairingProximityNotifierService)init
{
  v6.receiver = self;
  v6.super_class = (Class)PairingProximityNotifierService;
  v2 = [(PairingProximityNotifierService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Bridge.ppNotifierServiceQueue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [v5 valueForEntitlement:@"com.apple.Bridge.ppNotifierService-notify"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v6 BOOLValue])
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PPNotifierService];
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    [v5 resume];
    v8 = pbb_shared_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Had entitlement: %@", (uint8_t *)&v11, 0xCu);
    }
    BOOL v9 = 1;
  }
  else
  {
    v8 = pbb_shared_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rejecting connection: %@", (uint8_t *)&v11, 0xCu);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_postAppRemovedBulletinBoardNotification
{
  v2 = pbb_shared_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Posted Bulletin", v3, 2u);
  }
}

- (void)notifyOfNearbyDevice:(id)a3 withReply:(id)a4
{
  id v5 = pbb_shared_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " ", buf, 2u);
  }

  objc_super v6 = [(PairingProximityNotifierService *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000030A8;
  block[3] = &unk_1000040E8;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "remoteAlertHandleDidActivate: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  int v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remoteAlertHandleDidDeactivate: %@", (uint8_t *)&v7, 0xCu);
  }

  [(SBSRemoteAlertHandle *)self->_pairingAlertHandle removeObserver:self];
  [(SBSRemoteAlertHandle *)self->_pairingAlertHandle invalidate];
  pairingAlertHandle = self->_pairingAlertHandle;
  self->_pairingAlertHandle = 0;
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remoteAlertHandle:(SBSRemoteAlertHandle *)handle didInvalidateWithError: %@ %@", (uint8_t *)&v8, 0x16u);
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (SBSRemoteAlertConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (SBSRemoteAlertHandle)pairingAlertHandle
{
  return self->_pairingAlertHandle;
}

- (void)setPairingAlertHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingAlertHandle, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end