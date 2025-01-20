@interface BTUserCloudServicesDaemon
+ (id)sharedBTServicesDaemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BTUserCloudServicesDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_invalidate;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)reportHMDeviceCloudRecordInfosUpdated:(id)a3;
@end

@implementation BTUserCloudServicesDaemon

+ (id)sharedBTServicesDaemon
{
  if (qword_100263EF8 != -1) {
    dispatch_once(&qword_100263EF8, &stru_1002351E0);
  }
  v2 = (void *)qword_100263EF0;

  return v2;
}

- (BTUserCloudServicesDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)BTUserCloudServicesDaemon;
  v2 = [(BTUserCloudServicesDaemon *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BTUserCloudServicesDaemon", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = (void *)CFPrefs_CopyKeys();
  dispatch_queue_t v4 = (char *)[v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    v5 = v4;
    int v6 = 0;
    v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        if (!v6)
        {
          NSAppendPrintF();
          id v10 = v7;

          v7 = v10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20 = (void *)CFPrefs_CopyTypedValue();
          NSAppendPrintF();
          id v11 = v7;

          ++v6;
          v7 = v11;
        }
      }
      v5 = (char *)[v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }

  v12 = +[CBIDSManager sharedInstance];
  v18 = [v12 statedumpAndRecordDailyMetric];
  NSAppendPrintF();
  id v13 = v7;

  v14 = +[CloudXPCService sharedInstance];
  v15 = [v14 deviceManager];
  v19 = [v15 printDebug];
  NSAppendPrintF();
  id v16 = v13;

  return v16;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A388;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.BluetoothCloudServices"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  if (!self->_stateHandle) {
    self->_stateHandle = os_state_add_handler();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A570;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(BTCloudServicesXPCConnection);
  [(BTCloudServicesXPCConnection *)v7 setDaemon:self];
  [(BTCloudServicesXPCConnection *)v7 setDispatchQueue:self->_dispatchQueue];
  [(BTCloudServicesXPCConnection *)v7 setXpcCnx:v6];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }
  v35 = self;
  [(NSMutableSet *)xpcConnections addObject:v7];
  long long v40 = 0u;
  long long v41 = 0u;
  if (v6) {
    [v6 auditToken];
  }
  v36 = v6;
  uint64_t v11 = xpc_copy_code_signing_identity_for_token();
  if (v11)
  {
    v12 = (void *)v11;
    uint64_t v13 = +[NSString stringWithUTF8String:v11];
    free(v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  v27 = (void *)v13;
  [(BTCloudServicesXPCConnection *)v7 setSigningIdentity:v13];
  v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BTCloudServicesXPCClientInterface];
  id v34 = objc_alloc((Class)NSSet);
  uint64_t v33 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  id v16 = v7;
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  id v24 = [v34 initWithObjects:v33, v32, v31, v30, v29, v15, v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0];
  [v14 setClasses:v24 forSelector:"createDeviceRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"modifyDeviceRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deleteDeviceRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deviceRecord:completion:" argumentIndex:1 ofReply:1];
  [v14 setClasses:v24 forSelector:"deviceRecordsWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"createDeviceSupportInformationRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"modifyDeviceSupportInformationRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deleteDeviceSupportInformationRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deviceSupportInformationRecord:completion:" argumentIndex:1 ofReply:1];
  [v14 setClasses:v24 forSelector:"deviceSupportInformationRecordsWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"createMagicSettingsRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"modifyMagicSettingsRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deleteDeviceRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"magicSettingsRecord:completion:" argumentIndex:1 ofReply:1];
  [v14 setClasses:v24 forSelector:"magicSettingsRecordsWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"accountInfoWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"cloudPairingIdentifierForPeripheral:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"cloudPairingIdentifierForPeripheral:completion:" argumentIndex:1 ofReply:1];
  [v14 setClasses:v24 forSelector:"createSoundProfileRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"modifySoundProfileRecord:completion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"fetchSoundProfileRecordWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"deleteSoundProfileRecordWithCompletion:" argumentIndex:0 ofReply:1];
  [v14 setClasses:v24 forSelector:"hmDeviceCloudRecordInfosUpdated:" argumentIndex:0 ofReply:0];
  [v36 _setQueue:v35->_dispatchQueue];
  v25 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BTCloudServicesXPCDaemonInterface];
  [v36 setExportedInterface:v25];

  [v36 setExportedObject:v16];
  objc_initWeak(&location, v35);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10007AC9C;
  v37[3] = &unk_100234E80;
  objc_copyWeak(&v38, &location);
  v37[4] = v16;
  [v36 setInvalidationHandler:v37];
  [v36 setRemoteObjectInterface:v14];
  [v36 resume];
  if (dword_100261308 <= 20 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    [v36 processIdentifier];
    LogPrintF();
  }
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (dword_100261308 <= 20)
  {
    if (dword_100261308 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      v5 = [v4 xpcCnx];
      id v7 = [v5 processIdentifier];
      LogPrintF();

      id v4 = v8;
    }
  }
  [v4 xpcConnectionInvalidated:v7];
  [(NSMutableSet *)self->_xpcConnections removeObject:v8];
}

- (void)reportHMDeviceCloudRecordInfosUpdated:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) clientReportHMDeviceCloudRecordInfosUpdated:v4, (void)v10];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end