@interface EndpointManager
+ (id)instance;
- (BOOL)shouldPersist;
- (CBScalablePipeManager)pipeManager;
- (DeviceManagementEndpoint)deviceManagementEndpoint;
- (EndpointManager)init;
- (OS_os_transaction)persistanceAssertion;
- (id)endpointForPipe:(id)a3;
- (id)scalablePipeManagerStateString;
- (void)connectDevice:(id)a3 quickDisconnectEnabled:(id)a4;
- (void)disconnectDevice:(id)a3;
- (void)notifyPrimaryBudSide:(id)a3 device:(id)a4;
- (void)refreshPersistanceAssertion;
- (void)requestLeaEasyPair:(id)a3 deviceIdentifier:(id)a4 deviceTags:(id)a5;
- (void)requestLeaStoreBondingInfo:(id)a3 rand:(id)a4 ltk:(id)a5 irk:(id)a6 name:(id)a7 device:(id)a8;
- (void)requestPairStateForDevice:(id)a3;
- (void)requestStoreLinkKey:(id)a3 name:(id)a4 device:(id)a5;
- (void)requestStoreLinkKeyExtended:(id)a3 name:(id)a4 device:(id)a5 deviceServiceMask:(id)a6 classOfDevice:(id)a7;
- (void)requestVersionInfo:(id)a3 cloudAccount:(id)a4;
- (void)respondToLeaEasyPair:(id)a3 device:(id)a4;
- (void)respondToLeaStoreBondingInfo:(id)a3 device:(id)a4;
- (void)respondToPairState:(id)a3 device:(id)a4;
- (void)respondToStoreLinkKey:(id)a3 device:(id)a4;
- (void)respondVersionInfo:(id)a3 cloudAccount:(id)a4 easyPairingStatus:(id)a5;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setDeviceManagementEndpoint:(id)a3;
- (void)setPersist:(BOOL)a3;
- (void)setPersistanceAssertion:(id)a3;
- (void)setPipeManager:(id)a3;
- (void)setShouldPersist:(BOOL)a3;
- (void)storeDeviceSettings:(id)a3 inEarEnable:(id)a4 doubleTapMode:(id)a5 deviceSettings:(id)a6 deviceName:(id)a7 device:(id)a8;
- (void)unexpectedDisconnection:(id)a3;
@end

@implementation EndpointManager

+ (id)instance
{
  if (qword_1000CD028 != -1) {
    dispatch_once(&qword_1000CD028, &stru_1000B13A8);
  }
  v2 = (void *)qword_1000CD020;

  return v2;
}

- (void)setPersist:(BOOL)a3
{
  [(EndpointManager *)self setShouldPersist:a3];

  [(EndpointManager *)self refreshPersistanceAssertion];
}

- (void)connectDevice:(id)a3 quickDisconnectEnabled:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EndpointManager *)self deviceManagementEndpoint];
  [v8 connectDevice:v7 quickDisconnectEnabled:v6];
}

- (void)disconnectDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(EndpointManager *)self deviceManagementEndpoint];
  [v5 disconnectDevice:v4];
}

- (void)unexpectedDisconnection:(id)a3
{
  id v4 = a3;
  id v5 = [(EndpointManager *)self deviceManagementEndpoint];
  [v5 unexpectedDisconnection:v4];
}

- (void)requestVersionInfo:(id)a3 cloudAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EndpointManager *)self deviceManagementEndpoint];
  [v8 requestVersionInfo:v7 cloudAccount:v6];
}

- (void)respondVersionInfo:(id)a3 cloudAccount:(id)a4 easyPairingStatus:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(EndpointManager *)self deviceManagementEndpoint];
  [v11 respondVersionInfo:v10 cloudAccount:v9 easyPairingStatus:v8];
}

- (void)requestPairStateForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(EndpointManager *)self deviceManagementEndpoint];
  [v5 requestPairStateForDevice:v4];
}

- (void)respondToPairState:(id)a3 device:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EndpointManager *)self deviceManagementEndpoint];
  [v8 respondToPairState:v7 device:v6];
}

- (void)requestStoreLinkKey:(id)a3 name:(id)a4 device:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(EndpointManager *)self deviceManagementEndpoint];
  [v11 requestStoreLinkKey:v10 name:v9 device:v8];
}

- (void)requestStoreLinkKeyExtended:(id)a3 name:(id)a4 device:(id)a5 deviceServiceMask:(id)a6 classOfDevice:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(EndpointManager *)self deviceManagementEndpoint];
  [v17 requestStoreLinkKeyExtended:v16 name:v15 device:v14 deviceServiceMask:v13 classOfDevice:v12];
}

- (void)respondToStoreLinkKey:(id)a3 device:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EndpointManager *)self deviceManagementEndpoint];
  [v8 respondToStoreLinkKey:v7 device:v6];
}

- (void)storeDeviceSettings:(id)a3 inEarEnable:(id)a4 doubleTapMode:(id)a5 deviceSettings:(id)a6 deviceName:(id)a7 device:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(EndpointManager *)self deviceManagementEndpoint];
  [v20 storeDeviceSettings:v19 inEarEnable:v18 doubleTapMode:v17 deviceSettings:v16 deviceName:v15 device:v14];
}

- (void)notifyPrimaryBudSide:(id)a3 device:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EndpointManager *)self deviceManagementEndpoint];
  [v8 notifyPrimaryBudSide:v7 device:v6];
}

- (void)requestLeaEasyPair:(id)a3 deviceIdentifier:(id)a4 deviceTags:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(EndpointManager *)self deviceManagementEndpoint];
  [v11 requestLeaEasyPair:v10 deviceIdentifier:v9 deviceTags:v8];
}

- (void)respondToLeaEasyPair:(id)a3 device:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EndpointManager *)self deviceManagementEndpoint];
  [v8 respondToLeaEasyPair:v7 device:v6];
}

- (void)requestLeaStoreBondingInfo:(id)a3 rand:(id)a4 ltk:(id)a5 irk:(id)a6 name:(id)a7 device:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(EndpointManager *)self deviceManagementEndpoint];
  [v20 requestLeaStoreBondingInfo:v19 rand:v18 ltk:v17 irk:v16 name:v15 device:v14];
}

- (void)respondToLeaStoreBondingInfo:(id)a3 device:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EndpointManager *)self deviceManagementEndpoint];
  [v8 respondToLeaStoreBondingInfo:v7 device:v6];
}

- (EndpointManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)EndpointManager;
  v2 = [(EndpointManager *)&v6 init];
  if (v2)
  {
    v3 = (CBScalablePipeManager *)[objc_alloc((Class)CBScalablePipeManager) initWithDelegate:v2 queue:&_dispatch_main_q];
    pipeManager = v2->_pipeManager;
    v2->_pipeManager = v3;
  }
  return v2;
}

- (void)refreshPersistanceAssertion
{
  v3 = [(EndpointManager *)self pipeManager];
  if ([v3 state] == (id)4)
  {

LABEL_6:
    [(EndpointManager *)self setPersistanceAssertion:0];
    return;
  }
  unsigned int v4 = [(EndpointManager *)self shouldPersist];

  if (!v4) {
    goto LABEL_6;
  }
  id v5 = [(EndpointManager *)self persistanceAssertion];

  if (!v5)
  {
    id v7 = +[NSString stringWithFormat:@"com.apple.%@", objc_opt_class()];
    [v7 UTF8String];
    objc_super v6 = (void *)os_transaction_create();
    [(EndpointManager *)self setPersistanceAssertion:v6];
  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    id v7 = [(EndpointManager *)self scalablePipeManagerStateString];
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ScalablePipeManager state is now %@", (uint8_t *)&v17, 0xCu);
  }
  [(EndpointManager *)self refreshPersistanceAssertion];
  id v8 = [(EndpointManager *)self pipeManager];
  id v9 = [v8 state];

  if (v9 == (id)5)
  {
    id v10 = objc_alloc_init(DeviceManagementEndpoint);
    [(EndpointManager *)self setDeviceManagementEndpoint:v10];

    id v11 = [(EndpointManager *)self pipeManager];
    id v12 = [(EndpointManager *)self deviceManagementEndpoint];
    id v13 = [v12 identifier];
    id v14 = [(EndpointManager *)self deviceManagementEndpoint];
    id v15 = [v14 type];
    id v16 = [(EndpointManager *)self deviceManagementEndpoint];
    [v11 registerEndpoint:v13 type:v15 priority:[v16 priority]];
  }
  else
  {
    [(EndpointManager *)self setDeviceManagementEndpoint:0];
    id v11 = [(EndpointManager *)self pipeManager];
    [v11 unregisterAllEndpoints];
  }
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = qword_1000CD178;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006D768((uint64_t)v8, (uint64_t)v9, v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully registered endpoint \"%@\"", (uint8_t *)&v11, 0xCu);
  }
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v4 = a4;
  id v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unregistered endpoint \"%@\"", (uint8_t *)&v6, 0xCu);
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v5 = a4;
  int v6 = [(EndpointManager *)self endpointForPipe:v5];
  id v7 = v6;
  if (v6)
  {
    [v6 addPipe:v5];
  }
  else
  {
    id v8 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006D7F0((uint64_t)v5, v8);
    }
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = [(EndpointManager *)self endpointForPipe:v6];
  id v8 = v7;
  if (v7)
  {
    [v7 removePipe:v6];
  }
  else
  {
    id v9 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006D868((uint64_t)v6, v9);
    }
  }
}

- (id)endpointForPipe:(id)a3
{
  id v4 = a3;
  id v5 = [(EndpointManager *)self deviceManagementEndpoint];
  id v6 = [v5 identifier];
  id v7 = [v4 name];

  LODWORD(v4) = [v6 isEqualToString:v7];
  if (v4)
  {
    id v8 = [(EndpointManager *)self deviceManagementEndpoint];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)scalablePipeManagerStateString
{
  v2 = [(EndpointManager *)self pipeManager];
  v3 = (char *)[v2 state];

  if ((unint64_t)(v3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1000B13C8[(void)(v3 - 1)];
  }
}

- (CBScalablePipeManager)pipeManager
{
  return self->_pipeManager;
}

- (void)setPipeManager:(id)a3
{
}

- (DeviceManagementEndpoint)deviceManagementEndpoint
{
  return self->_deviceManagementEndpoint;
}

- (void)setDeviceManagementEndpoint:(id)a3
{
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (OS_os_transaction)persistanceAssertion
{
  return self->_persistanceAssertion;
}

- (void)setPersistanceAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistanceAssertion, 0);
  objc_storeStrong((id *)&self->_deviceManagementEndpoint, 0);

  objc_storeStrong((id *)&self->_pipeManager, 0);
}

@end