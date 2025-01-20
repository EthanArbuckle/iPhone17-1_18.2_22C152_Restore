@interface CRCarKitMonitoringServiceAgent
- (BOOL)connection:(id)a3 isMonitoringSerial:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CRCarKitMonitoringServiceAgent)init;
- (NSMutableSet)connections;
- (OS_dispatch_queue)connectionsQueue;
- (id)userInfoDictionaryForConnection:(id)a3;
- (void)_addConnection:(id)a3 forCertificateSerial:(id)a4;
- (void)_removeConnection:(id)a3;
- (void)handleUpdatedVehicle:(id)a3 enabled:(BOOL)a4 completion:(id)a5;
- (void)setConnections:(id)a3;
- (void)setConnectionsQueue:(id)a3;
- (void)startMonitoringCertificateSerial:(id)a3 reply:(id)a4;
- (void)stopMonitoringCertificateSerial:(id)a3 reply:(id)a4;
@end

@implementation CRCarKitMonitoringServiceAgent

- (CRCarKitMonitoringServiceAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRCarKitMonitoringServiceAgent;
  v2 = [(CRCarKitMonitoringServiceAgent *)&v6 init];
  if (v2)
  {
    v3 = +[NSMutableSet set];
    [(CRCarKitMonitoringServiceAgent *)v2 setConnections:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.carkitd.monitoring_transactions", 0);
    [(CRCarKitMonitoringServiceAgent *)v2 setConnectionsQueue:v4];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = [v6 valueForEntitlement:@"com.apple.private.carkit"];
  unsigned __int8 v8 = [v7 BOOLValue];

  if (v8)
  {
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRCarKitMonitoringServerService];
    [v6 setExportedInterface:v9];
    [v6 setExportedObject:self];
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRCarKitMonitoringClientService];
    [v6 setRemoteObjectInterface:v10];
    objc_initWeak(&location, v6);
    objc_initWeak(&from, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004CF84;
    v17[3] = &unk_1000BE570;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &location);
    v11 = objc_retainBlock(v17);
    [v6 setInterruptionHandler:v11];
    [v6 setInvalidationHandler:v11];
    v12 = CarGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v6 serviceName];
      v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 processIdentifier]);
      *(_DWORD *)buf = 138412802;
      id v23 = v6;
      __int16 v24 = 2112;
      v25 = v13;
      __int16 v26 = 2112;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Receiving monitoring service connection %@ to service %@ from %@", buf, 0x20u);
    }
    [v6 resume];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000718B8(v6, v9);
    }
  }

  return v8;
}

- (id)userInfoDictionaryForConnection:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = [v3 userInfo];
  if (!v4)
  {
    dispatch_queue_t v4 = +[NSMutableDictionary dictionary];
    v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating a monitoring transaction for %@", (uint8_t *)&v8, 0xCu);
    }

    id v6 = (void *)os_transaction_create();
    [v4 setObject:v6 forKeyedSubscript:@"os-transaction"];

    [v3 setUserInfo:v4];
  }

  return v4;
}

- (BOOL)connection:(id)a3 isMonitoringSerial:(id)a4
{
  id v6 = a4;
  v7 = [(CRCarKitMonitoringServiceAgent *)self userInfoDictionaryForConnection:a3];
  int v8 = [v7 objectForKey:@"certificateSerial"];

  if (v8) {
    unsigned __int8 v9 = [v8 isEqualToData:v6];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)startMonitoringCertificateSerial:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  int v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "start monitoring for %@", buf, 0xCu);
  }

  unsigned __int8 v9 = +[NSXPCConnection currentConnection];
  objc_initWeak((id *)buf, self);
  v10 = [(CRCarKitMonitoringServiceAgent *)self connectionsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D47C;
  block[3] = &unk_1000BED98;
  objc_copyWeak(&v16, (id *)buf);
  id v11 = v9;
  id v14 = v11;
  id v12 = v6;
  id v15 = v12;
  dispatch_sync(v10, block);

  v7[2](v7);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)stopMonitoringCertificateSerial:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stop monitoring for %@", (uint8_t *)&v9, 0xCu);
  }

  int v8 = +[NSXPCConnection currentConnection];
  [v8 invalidate];
  v6[2](v6);
}

- (void)handleUpdatedVehicle:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v23 = a3;
  id v24 = a5;
  int v8 = [v23 certificateSerialNumber];
  int v9 = CarGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v23 identifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "going to tell clients that %@ has enabled state %i", buf, 0x12u);
  }
  id v11 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v41 = sub_10004DA78;
  v42 = sub_10004DA88;
  id v43 = 0;
  id v12 = [(CRCarKitMonitoringServiceAgent *)self connectionsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DA90;
  block[3] = &unk_1000BD768;
  void block[4] = self;
  block[5] = buf;
  dispatch_sync(v12, block);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = *(id *)(*(void *)&buf[8] + 40);
  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([(CRCarKitMonitoringServiceAgent *)self connection:v17 isMonitoringSerial:v8])
        {
          id v18 = CarGeneralLogging();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v19 = [v17 processIdentifier];
            *(_DWORD *)v37 = 67109120;
            unsigned int v38 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "policy monitor sending vehicle update to process %d", v37, 8u);
          }

          v20 = [v17 remoteObjectProxyWithErrorHandler:&stru_1000BEDB8];
          dispatch_group_enter(v11);
          if (v6)
          {
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_10004DB48;
            v30[3] = &unk_1000BD1B0;
            v31 = v11;
            [v20 willEnableCertificateSerial:v8 reply:v30];
            v21 = (id *)&v31;
          }
          else
          {
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_10004DB50;
            v28[3] = &unk_1000BD1B0;
            v29 = v11;
            [v20 willDisableCertificateSerial:v8 reply:v28];
            v21 = (id *)&v29;
          }
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v14);
  }

  if (v24)
  {
    v22 = dispatch_get_global_queue(17, 0);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004DB58;
    v25[3] = &unk_1000BD668;
    __int16 v26 = v11;
    id v27 = v24;
    dispatch_async(v22, v25);
  }
  _Block_object_dispose(buf, 8);
}

- (void)_addConnection:(id)a3 forCertificateSerial:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CRCarKitMonitoringServiceAgent *)self userInfoDictionaryForConnection:v7];
  [v9 setObject:v6 forKey:@"certificateSerial"];

  int v8 = [(CRCarKitMonitoringServiceAgent *)self connections];
  [v8 addObject:v7];
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRCarKitMonitoringServiceAgent *)self userInfoDictionaryForConnection:v4];
  [v5 removeAllObjects];
  id v6 = [(CRCarKitMonitoringServiceAgent *)self connections];
  unsigned int v7 = [v6 containsObject:v4];

  int v8 = CarGeneralLogging();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing connection %@", (uint8_t *)&v10, 0xCu);
    }

    int v8 = [(CRCarKitMonitoringServiceAgent *)self connections];
    [v8 removeObject:v4];
  }
  else if (v9)
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connection %@ not being monitored by service agent", (uint8_t *)&v10, 0xCu);
  }
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (OS_dispatch_queue)connectionsQueue
{
  return self->_connectionsQueue;
}

- (void)setConnectionsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionsQueue, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

@end