@interface BMSyncServiceServer
- (BMSyncServiceServer)initWithQueue:(id)a3 biomeSyncCore:(id)a4 cascadeSyncManager:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_cloudKitSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4;
- (void)_rapportSyncWithDevices:(id)a3 syncTriggeredHandler:(id)a4 syncCompletedHandler:(id)a5;
- (void)_rapportSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4;
- (void)cascadeRapportSyncWithReply:(id)a3;
- (void)cloudKitSyncWithReply:(id)a3;
- (void)peerInformationWithReply:(id)a3;
- (void)rapportSyncWithReply:(id)a3;
- (void)remoteDevicesForAccount:(id)a3 reply:(id)a4;
- (void)triggerCloudKitSyncWithReply:(id)a3;
- (void)triggerRapportSyncDeviceIdentifiers:(id)a3 reply:(id)a4;
- (void)triggerRapportSyncWithReply:(id)a3;
@end

@implementation BMSyncServiceServer

- (BMSyncServiceServer)initWithQueue:(id)a3 biomeSyncCore:(id)a4 cascadeSyncManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMSyncServiceServer;
  v12 = [(BMSyncServiceServer *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_core, a4);
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeStrong((id *)&v13->_cascadeSyncManager, a5);
    v14 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.biomesyncd.sync"];
    listener = v13->_listener;
    v13->_listener = v14;

    [(NSXPCListener *)v13->_listener setDelegate:v13];
    [(NSXPCListener *)v13->_listener resume];
  }

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[BMProcess processWithXPCConnection:v5];
  if (([v6 BOOLForEntitlement:@"com.apple.private.biome.sync"] & 1) != 0
    || os_variant_allows_internal_security_policies()
    && ([v6 BOOLForEntitlement:@"com.apple.internal.biome.sync"] & 1) != 0)
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BMSyncServiceServerProtocol];
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BMSyncServiceClientProtocol];
    [v5 setRemoteObjectInterface:v8];

    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    [v5 invalidate];
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_cloudKitSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021868;
  block[3] = &unk_10006D300;
  block[4] = self;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v11 = [(BMSyncCore *)self->_core syncScheduler];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002198C;
  v17[3] = &unk_10006D328;
  id v18 = v10;
  id v12 = v10;
  [v11 syncCloudKitNowIfPolicyAllowsWithReason:5 activity:0 completionHandler:v17];

  v13 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000219A4;
  v15[3] = &unk_10006D350;
  id v16 = v9;
  id v14 = v9;
  dispatch_sync((dispatch_queue_t)v13, v15);
}

- (void)_rapportSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021A84;
  block[3] = &unk_10006D300;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)_rapportSyncWithDevices:(id)a3 syncTriggeredHandler:(id)a4 syncCompletedHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021D4C;
  v15[3] = &unk_10006D378;
  id v17 = v9;
  id v18 = v10;
  void v15[4] = self;
  id v16 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync((dispatch_queue_t)queue, v15);
}

- (void)triggerRapportSyncWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "triggerRapportSyncWithReply called", buf, 2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002207C;
  v11[3] = &unk_10006D3A0;
  id v12 = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = nullsub_1;
  v9[3] = &unk_10006CC98;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(BMSyncServiceServer *)self _rapportSyncWithSyncTriggeredHandler:v11 syncCompletedHandler:v9];
}

- (void)triggerRapportSyncDeviceIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)os_transaction_create();
  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "triggerRapportSyncDeviceIdentifiers called", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100022204;
  v14[3] = &unk_10006D3A0;
  id v15 = v6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = nullsub_2;
  v12[3] = &unk_10006CC98;
  id v13 = v8;
  id v10 = v8;
  id v11 = v6;
  [(BMSyncServiceServer *)self _rapportSyncWithDevices:v7 syncTriggeredHandler:v14 syncCompletedHandler:v12];
}

- (void)rapportSyncWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "rapportSyncWithError called", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022330;
  v9[3] = &unk_10006D3C8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  [(BMSyncServiceServer *)self _rapportSyncWithSyncTriggeredHandler:0 syncCompletedHandler:v9];
}

- (void)cascadeRapportSyncWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "rapportSyncWithError called", buf, 2u);
  }

  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[BMPersonaUtilities currentPersonaIdentifierLoggingDescription];
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "rapportSyncWithError persona is %@", buf, 0xCu);
  }
  id v9 = [(CCPersonaSyncManager *)self->_cascadeSyncManager syncEngineForCurrentPersona];
  [v9 startClient];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022524;
  v13[3] = &unk_10006D3F0;
  id v15 = v5;
  id v16 = v4;
  id v14 = v9;
  id v10 = v5;
  id v11 = v4;
  id v12 = v9;
  [v12 syncNowWithReason:5 activity:0 completionHandler:v13];
}

- (void)triggerCloudKitSyncWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "triggerCloudKitSyncWithReply called", buf, 2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000226EC;
  v11[3] = &unk_10006D3A0;
  id v12 = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = nullsub_3;
  v9[3] = &unk_10006CC98;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(BMSyncServiceServer *)self _cloudKitSyncWithSyncTriggeredHandler:v11 syncCompletedHandler:v9];
}

- (void)cloudKitSyncWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cloudKitSyncWithError called", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022818;
  v9[3] = &unk_10006D3C8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  [(BMSyncServiceServer *)self _cloudKitSyncWithSyncTriggeredHandler:0 syncCompletedHandler:v9];
}

- (void)remoteDevicesForAccount:(id)a3 reply:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000228C8;
  v8[3] = &unk_10006CB80;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, v8);
}

- (void)peerInformationWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022CAC;
  v7[3] = &unk_10006CB80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_cascadeSyncManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_core, 0);
}

@end