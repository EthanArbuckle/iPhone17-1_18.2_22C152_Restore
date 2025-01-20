@interface CBDMainController
- (CBDLocalServiceServer)localXPCServer;
- (CBDMainController)init;
- (CBDRemoteDeviceConnection)hostDevice;
- (CBDRemoteDeviceDiscovery)discovery;
- (CBDRemoteXPCServiceServer)remoteXPCServer;
- (NSSet)messageHandlers;
- (OS_dispatch_queue)hostDeviceSerialQueue;
- (void)didConnectDeviceConnection:(id)a3;
- (void)didDisconnectDeviceConnection:(id)a3;
- (void)didReceiveRemoteXPCMessage:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)setDiscovery:(id)a3;
- (void)setHostDevice:(id)a3;
- (void)setHostDeviceSerialQueue:(id)a3;
- (void)setLocalXPCServer:(id)a3;
- (void)setMessageHandlers:(id)a3;
- (void)setRemoteXPCServer:(id)a3;
- (void)start;
@end

@implementation CBDMainController

- (CBDMainController)init
{
  v29.receiver = self;
  v29.super_class = (Class)CBDMainController;
  v2 = [(CBDMainController *)&v29 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.maccheckerboardd.hostDevice", 0);
    hostDeviceSerialQueue = v2->_hostDeviceSerialQueue;
    v2->_hostDeviceSerialQueue = (OS_dispatch_queue *)v3;

    hostDevice = v2->_hostDevice;
    v2->_hostDevice = 0;

    v6 = objc_alloc_init(CBDLocalServiceServer);
    localXPCServer = v2->_localXPCServer;
    v2->_localXPCServer = v6;

    v8 = objc_alloc_init(CBDRemoteDeviceDiscovery);
    discovery = v2->_discovery;
    v2->_discovery = v8;

    [(CBDRemoteDeviceDiscovery *)v2->_discovery setDelegate:v2];
    v10 = objc_opt_new();
    v11 = [[CBDRemoteXPCMessageSetupHandler alloc] initWithProxyReceiver:v2->_localXPCServer];
    v12 = [[CBDRemoteXPCMessageStartDiagnosticsHandler alloc] initWithProxyReceiver:v2->_localXPCServer];
    uint64_t v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, 0);
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = (NSSet *)v13;

    v15 = +[NSMutableSet set];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v16 = v2->_messageHandlers;
    id v17 = [(NSSet *)v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v20) expectedRemoteMessageClasses];
          [v15 unionSet:v21];

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [(NSSet *)v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v18);
    }

    v22 = [[CBDRemoteXPCServiceServer alloc] initWithAllowedMessageClasses:v15];
    remoteXPCServer = v2->_remoteXPCServer;
    v2->_remoteXPCServer = v22;

    [(CBDRemoteXPCServiceServer *)v2->_remoteXPCServer setDelegate:v2];
  }
  return v2;
}

- (void)start
{
  dispatch_queue_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBDMainController: start", v7, 2u);
  }

  v4 = [(CBDMainController *)self localXPCServer];
  [v4 resume];

  v5 = [(CBDMainController *)self discovery];
  [v5 resume];

  v6 = [(CBDMainController *)self remoteXPCServer];
  [v6 resume];
}

- (void)invalidate
{
  dispatch_queue_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBDMainController: invalidate", v7, 2u);
  }

  v4 = [(CBDMainController *)self localXPCServer];
  [v4 invalidate];

  v5 = [(CBDMainController *)self discovery];
  [v5 invalidate];

  v6 = [(CBDMainController *)self remoteXPCServer];
  [v6 invalidate];
}

- (void)didConnectDeviceConnection:(id)a3
{
  id v4 = a3;
  v5 = [(CBDMainController *)self hostDeviceSerialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009FD4;
  v7[3] = &unk_100010620;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didDisconnectDeviceConnection:(id)a3
{
  id v4 = a3;
  v5 = [(CBDMainController *)self hostDeviceSerialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A1B0;
  v7[3] = &unk_100010620;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didReceiveRemoteXPCMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didReceiveRemoteXPCMessage: %@", buf, 0xCu);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = [(CBDMainController *)self messageHandlers];
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = [v14 expectedRemoteMessageClasses];
        unsigned int v16 = [v15 containsObject:objc_opt_class()];

        if (v16)
        {
          [v14 handleRemoteMessage:v6 completion:v7];

          goto LABEL_15;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error: no handler for %@", buf, 0xCu);
  }

  v7[2](v7, 0);
LABEL_15:
}

- (CBDRemoteDeviceConnection)hostDevice
{
  return self->_hostDevice;
}

- (void)setHostDevice:(id)a3
{
}

- (OS_dispatch_queue)hostDeviceSerialQueue
{
  return self->_hostDeviceSerialQueue;
}

- (void)setHostDeviceSerialQueue:(id)a3
{
}

- (CBDLocalServiceServer)localXPCServer
{
  return self->_localXPCServer;
}

- (void)setLocalXPCServer:(id)a3
{
}

- (CBDRemoteDeviceDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (CBDRemoteXPCServiceServer)remoteXPCServer
{
  return self->_remoteXPCServer;
}

- (void)setRemoteXPCServer:(id)a3
{
}

- (NSSet)messageHandlers
{
  return self->_messageHandlers;
}

- (void)setMessageHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_remoteXPCServer, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_localXPCServer, 0);
  objc_storeStrong((id *)&self->_hostDeviceSerialQueue, 0);

  objc_storeStrong((id *)&self->_hostDevice, 0);
}

@end