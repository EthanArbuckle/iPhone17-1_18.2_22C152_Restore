@interface BTLEXpcConnection
+ (id)createNSDictionaryFromXpcDictionary:(id)a3;
- (BTLEXpcConnection)initWithConnection:(id)a3;
- (OS_xpc_object)connection;
- (id)bundleIdentifier;
- (void)authenticationDidFail:(id)a3;
- (void)authenticationDidSucceed:(id)a3;
- (void)handleClassicDeviceUnexpectedDisconnectionMsg:(id)a3;
- (void)handleClassicPairStateRequestMsg:(id)a3;
- (void)handleClassicPairStateResponseMsg:(id)a3;
- (void)handleConnectAlwaysMsg:(id)a3;
- (void)handleConnectClassicDeviceMsg:(id)a3;
- (void)handleConnectOnceMsg:(id)a3;
- (void)handleDOAPDeviceConnectedMsg:(id)a3;
- (void)handleDisconnectClassicDeviceMsg:(id)a3;
- (void)handleDisconnection;
- (void)handleEvent:(id)a3;
- (void)handleHRMDeviceConnectedMsg:(id)a3;
- (void)handleLeaEasyPairRequestMsg:(id)a3;
- (void)handleLeaEasyPairResponseMsg:(id)a3;
- (void)handleLeaStoreBondingInfoRequestMsg:(id)a3;
- (void)handleLeaStoreBondingInfoResponseMsg:(id)a3;
- (void)handleMFiAccessoryAuthMsg:(id)a3;
- (void)handleMsg:(id)a3;
- (void)handleNotifyPiconetClockMsg:(id)a3;
- (void)handleNotifyPrimaryBudSideMsg:(id)a3;
- (void)handlePersistServerServicesMsg:(id)a3;
- (void)handlePreWarmMFiAccessoryAuthMsg:(id)a3;
- (void)handleStoreClassicDeviceSettingsMsg:(id)a3;
- (void)handleStoreClassicLinkKeyRequestExtendedMsg:(id)a3;
- (void)handleStoreClassicLinkKeyRequestMsg:(id)a3;
- (void)handleStoreClassicLinkKeyResponseMsg:(id)a3;
- (void)handleUARPAACPTransportChangeMsg:(id)a3;
- (void)handleUARPDataOverAACPMsg:(id)a3;
- (void)handleUARPDeviceConnectedMsg:(id)a3;
- (void)handleVersionInfoRequestMsg:(id)a3;
- (void)handleVersionInfoResponseMsg:(id)a3;
- (void)peerIsNotUsingBuiltinService:(id)a3;
- (void)peerIsUsingBuiltinService:(id)a3;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation BTLEXpcConnection

- (BTLEXpcConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006F9D8();
  }
  v17.receiver = self;
  v17.super_class = (Class)BTLEXpcConnection;
  v6 = [(BTLEXpcConnection *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)&_dispatch_main_q);
    connection = v7->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000298F8;
    handler[3] = &unk_1000B1960;
    v9 = v7;
    v16 = v9;
    xpc_connection_set_event_handler(connection, handler);
    xpc_connection_resume(v7->_connection);
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v9 selector:"authenticationDidSucceed:" name:@"AuthenticationServiceAuthDidSucceedNotification" object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v9 selector:"authenticationDidFail:" name:@"AuthenticationServiceAuthDidFailNotification" object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v9 selector:"peerIsUsingBuiltinService:" name:@"PeerIsUsingBuiltinServiceNotification" object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v9 selector:"peerIsNotUsingBuiltinService:" name:@"PeerIsNotUsingBuiltinServiceNotification" object:0];
  }
  return v7;
}

- (id)bundleIdentifier
{
  long long v13 = 0u;
  long long v14 = 0u;
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  v2 = SecTaskCreateWithAuditToken(0, &token);
  if (v2)
  {
    v3 = v2;
    *(void *)token.val = 0;
    CFStringRef v4 = SecTaskCopySigningIdentifier(v2, (CFErrorRef *)&token);
    id v5 = (void *)v4;
    if (*(void *)token.val)
    {
      v6 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to copy signing ID - using framework-provided bundle identifier!", buf, 2u);
      }
      CFRelease(*(CFTypeRef *)token.val);
      if (!v5) {
        goto LABEL_12;
      }
      CFRelease(v5);
    }
    else
    {
      if (v4) {
        goto LABEL_12;
      }
      v10 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to retrieve signing ID - using framework-provided bundle identifier!", buf, 2u);
      }
    }
    id v5 = 0;
LABEL_12:
    CFRelease(v3);
    goto LABEL_13;
  }
  v7 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(token.val[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to allocate security task - using framework-provided bundle identifier!", (uint8_t *)&token, 2u);
  }
  id v5 = 0;
LABEL_13:
  if (![v5 length])
  {
    uint64_t v8 = +[NSString stringWithFormat:@"UNKNOWN-%0000x", arc4random_uniform(0xFFFFu)];

    id v5 = (void *)v8;
  }

  return v5;
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    [(BTLEXpcConnection *)self handleMsg:v4];
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      [(BTLEXpcConnection *)self handleDisconnection];
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_10006FA4C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_10006FAC0();
  }
}

- (void)handleDisconnection
{
  v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006FB34(v3, self);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  id v5 = +[BTLEXpcServer instance];
  [v5 handleXpcDisconnection:self];
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006FBC8(v5, v4);
  }
  string = xpc_dictionary_get_string(v4, "kMsgId");
  v7 = xpc_dictionary_get_value(v4, "kMsgArgs");
  uint64_t v8 = +[NSString stringWithFormat:@"handle%sMsg:", string];
  v9 = NSSelectorFromString(v8);

  if (xpc_dictionary_expects_reply()) {
    id v10 = v4;
  }
  else {
    id v10 = v7;
  }
  [self v9:v10];
}

- (void)handleConnectOnceMsg:(id)a3
{
  xpc_dictionary_get_value(a3, "kPeerIdentifier");
  xpc_object_t xuuid = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:xpc_uuid_get_bytes(xuuid)];
  id v4 = +[ConnectionManager instance];
  [v4 connectOnce:v3];
}

- (void)handleConnectAlwaysMsg:(id)a3
{
  id v3 = xpc_dictionary_get_value(a3, "kPeerIdentifiers");
  +[NSMutableArray array];
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_100029E8C;
  applier[3] = &unk_1000B1988;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v7;
  xpc_array_apply(v3, applier);
  id v5 = +[ConnectionManager instance];
  [v5 connectAlways:v4];
}

- (void)handlePersistServerServicesMsg:(id)a3
{
  BOOL v3 = xpc_dictionary_get_BOOL(a3, "kPersist");
  id v4 = +[ServerServiceManager instance];
  [v4 setPersist:v3];

  id v5 = +[EndpointManager instance];
  [v5 setPersist:v3];
}

- (void)handleNotifyPiconetClockMsg:(id)a3
{
  id v3 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "kPiconetClock");
  uint64_t v5 = xpc_dictionary_get_uint64(v3, "kPiconetPhaseClock");

  v6 = +[NSNotificationCenter defaultCenter];
  v10[0] = @"PiconetClockUserInfoKey";
  id v7 = +[NSNumber numberWithUnsignedLongLong:uint64];
  v11[0] = v7;
  v10[1] = @"PiconetPhaseClockUserInfoKey";
  uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:v5];
  v11[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v6 postNotificationName:@"PiconetClockNotification" object:0 userInfo:v9];
}

- (void)handleConnectClassicDeviceMsg:(id)a3
{
  id v3 = a3;
  id v7 = +[EndpointManager instance];
  id v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kDeviceAddress")];
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "kQuickDisconnectEnabled");

  v6 = +[NSNumber numberWithUnsignedLongLong:uint64];
  [v7 connectDevice:v4 quickDisconnectEnabled:v6];
}

- (void)handleDisconnectClassicDeviceMsg:(id)a3
{
  id v3 = a3;
  id v6 = +[EndpointManager instance];
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  uint64_t v5 = +[NSString stringWithUTF8String:string];
  [v6 disconnectDevice:v5];
}

- (void)handleClassicDeviceUnexpectedDisconnectionMsg:(id)a3
{
  id v3 = a3;
  id v6 = +[EndpointManager instance];
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  uint64_t v5 = +[NSString stringWithUTF8String:string];
  [v6 unexpectedDisconnection:v5];
}

- (void)handleVersionInfoRequestMsg:(id)a3
{
  id v3 = a3;
  id v7 = +[EndpointManager instance];
  id v4 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kEasyPairingVersion")];
  string = xpc_dictionary_get_string(v3, "kCloudAccount");

  id v6 = +[NSString stringWithUTF8String:string];
  [v7 requestVersionInfo:v4 cloudAccount:v6];
}

- (void)handleVersionInfoResponseMsg:(id)a3
{
  id v3 = a3;
  id v8 = +[EndpointManager instance];
  id v4 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kEasyPairingVersion")];
  uint64_t v5 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kCloudAccount")];
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "kEasyPairingStatus");

  id v7 = +[NSNumber numberWithUnsignedLongLong:uint64];
  [v8 respondVersionInfo:v4 cloudAccount:v5 easyPairingStatus:v7];
}

- (void)handleClassicPairStateRequestMsg:(id)a3
{
  id v3 = a3;
  id v6 = +[EndpointManager instance];
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  uint64_t v5 = +[NSString stringWithUTF8String:string];
  [v6 requestPairStateForDevice:v5];
}

- (void)handleClassicPairStateResponseMsg:(id)a3
{
  id v3 = a3;
  id v7 = +[EndpointManager instance];
  id v4 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kDevicePairState")];
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  id v6 = +[NSString stringWithUTF8String:string];
  [v7 respondToPairState:v4 device:v6];
}

- (void)handleStoreClassicLinkKeyRequestMsg:(id)a3
{
  id v3 = a3;
  size_t length = 0;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kDeviceLinkKey", &length);
  if (length)
  {
    uint64_t v5 = data;
    uint64_t v6 = +[NSArray array];
    id v7 = (void *)v6;
    if (length)
    {
      for (size_t i = 0; i < length; ++i)
      {
        v9 = +[NSNumber numberWithUnsignedChar:v5[i]];
        id v10 = [v7 arrayByAddingObject:v9];

        id v7 = v10;
      }
    }
    else
    {
      id v10 = (void *)v6;
    }
    v11 = +[EndpointManager instance];
    v12 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kDeviceName")];
    long long v13 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kDeviceAddress")];
    [v11 requestStoreLinkKey:v10 name:v12 device:v13];
  }
}

- (void)handleStoreClassicLinkKeyRequestExtendedMsg:(id)a3
{
  id v3 = a3;
  size_t length = 0;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kDeviceLinkKey", &length);
  if (length)
  {
    uint64_t v5 = data;
    uint64_t v6 = +[NSArray array];
    id v7 = (void *)v6;
    if (length)
    {
      for (size_t i = 0; i < length; ++i)
      {
        v9 = +[NSNumber numberWithUnsignedChar:v5[i]];
        id v10 = [v7 arrayByAddingObject:v9];

        id v7 = v10;
      }
    }
    else
    {
      id v10 = (void *)v6;
    }
    v11 = +[EndpointManager instance];
    v12 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kDeviceName")];
    long long v13 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kDeviceAddress")];
    long long v14 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kDeviceServiceMask")];
    v15 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kClassOfDevice")];
    [v11 requestStoreLinkKeyExtended:v10 name:v12 device:v13 deviceServiceMask:v14 classOfDevice:v15];
  }
}

- (void)handleStoreClassicLinkKeyResponseMsg:(id)a3
{
  id v3 = a3;
  id v7 = +[EndpointManager instance];
  id v4 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kStoreClassicLinkKeyResult")];
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  uint64_t v6 = +[NSString stringWithUTF8String:string];
  [v7 respondToStoreLinkKey:v4 device:v6];
}

- (void)handleStoreClassicDeviceSettingsMsg:(id)a3
{
  id v3 = a3;
  id v4 = xpc_dictionary_get_value(v3, "kClassicDeviceSettings");
  uint64_t v5 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
  xpc_object_t xdict = v4;
  if (v4)
  {
    uint64_t v6 = xpc_dictionary_get_value(v4, "kCfgDoubleClickInt");
    v37 = v6;
    if (v6) {
      int64_t value = xpc_int64_get_value(v6);
    }
    else {
      int64_t value = 0xFFFFFFFFLL;
    }
    v9 = xpc_dictionary_get_value(xdict, "kCfgClickHold");
    v36 = v9;
    if (v9) {
      int64_t v10 = xpc_int64_get_value(v9);
    }
    else {
      int64_t v10 = 0xFFFFFFFFLL;
    }
    v11 = xpc_dictionary_get_value(xdict, "kCfgClickHoldInt");
    v35 = v11;
    if (v11) {
      int64_t v12 = xpc_int64_get_value(v11);
    }
    else {
      int64_t v12 = 0xFFFFFFFFLL;
    }
    long long v13 = xpc_dictionary_get_value(xdict, "kCfgListenModeCfgs");
    v34 = v13;
    if (v13) {
      int64_t v14 = xpc_int64_get_value(v13);
    }
    else {
      int64_t v14 = 0xFFFFFFFFLL;
    }
    v15 = xpc_dictionary_get_value(xdict, "kCfgOneBudANCMode");
    v16 = v15;
    if (v15) {
      int64_t v17 = xpc_int64_get_value(v15);
    }
    else {
      int64_t v17 = 0xFFFFFFFFLL;
    }
    v18 = xpc_dictionary_get_value(xdict, "kCfgListenMode");
    v19 = v18;
    if (v18) {
      int64_t v20 = xpc_int64_get_value(v18);
    }
    else {
      int64_t v20 = 0xFFFFFFFFLL;
    }
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    if (value != -1)
    {
      v21 = +[NSNumber numberWithInt:value];
      [v8 setObject:v21 forKey:@"kCfgDoubleClickInt"];
    }
    if (v10 != -1)
    {
      v22 = +[NSNumber numberWithInt:v10];
      [v8 setObject:v22 forKey:@"kCfgClickHold"];
    }
    uint64_t v5 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
    if (v12 != -1)
    {
      v23 = +[NSNumber numberWithInt:v12];
      [v8 setObject:v23 forKey:@"kCfgClickHoldInt"];
    }
    if (v14 != -1)
    {
      v24 = +[NSNumber numberWithInt:v14];
      [v8 setObject:v24 forKey:@"kCfgListenModeCfgs"];
    }
    if (v17 != -1)
    {
      v25 = +[NSNumber numberWithInt:v17];
      [v8 setObject:v25 forKey:@"kCfgOneBudANCMode"];
    }
    if (v20 != -1)
    {
      v26 = +[NSNumber numberWithInt:v20];
      [v8 setObject:v26 forKey:@"kCfgListenMode"];
    }
  }
  else
  {
    id v8 = 0;
  }
  v27 = +[EndpointManager instance];
  v28 = [v5[448] numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kClassicDeviceMicMode")];
  v29 = [v5[448] numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kClassicDeviceInEarEnable")];
  v30 = [v5[448] numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kClassicDeviceDoubleTapMode")];
  v31 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kDeviceName")];
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v33 = +[NSString stringWithUTF8String:string];
  [v27 storeDeviceSettings:v28 inEarEnable:v29 doubleTapMode:v30 deviceSettings:v8 deviceName:v31 device:v33];
}

- (void)handleNotifyPrimaryBudSideMsg:(id)a3
{
  id v3 = a3;
  id v7 = +[EndpointManager instance];
  id v4 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kPrimaryBudSide")];
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  uint64_t v6 = +[NSString stringWithUTF8String:string];
  [v7 notifyPrimaryBudSide:v4 device:v6];
}

- (void)handleMFiAccessoryAuthMsg:(id)a3
{
  xpc_dictionary_get_value(a3, "kPeerIdentifier");
  xpc_object_t xuuid = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:xpc_uuid_get_bytes(xuuid)];
  id v4 = +[ConnectionManager instance];
  [v4 performMFiAuth:v3];
}

- (void)handlePreWarmMFiAccessoryAuthMsg:(id)a3
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PreWarmMFiAuth : Launch accessoryd", v5, 2u);
  }
  id v4 = +[ACCTransportClient sharedClient];
  [v4 launchServer];
}

- (void)handleDOAPDeviceConnectedMsg:(id)a3
{
  id v3 = +[CattManager instance];
  [v3 registerServices];
}

- (void)handleUARPDeviceConnectedMsg:(id)a3
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "UARP device connected", v5, 2u);
  }
  id v4 = +[CattManager instance];
  [v4 registerServices];
}

- (void)handleUARPAACPTransportChangeMsg:(id)a3
{
  id v3 = xpc_dictionary_get_value(a3, "kUARPDeviceUUID");
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:xpc_uuid_get_bytes(v3)];
  uint64_t v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006FC5C(v5, v4);
  }
  uint64_t v6 = +[UARPServiceUARPControllerManager instance];
  id v7 = +[NSNumber numberWithBool:1];
  [v6 addUARPTransportDict:v4 UARPAACPSupported:v7];
}

- (void)handleUARPDataOverAACPMsg:(id)a3
{
  size_t length = 0;
  id v3 = a3;
  id v4 = xpc_dictionary_get_value(v3, "kUARPDeviceUUID");
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:xpc_uuid_get_bytes(v4)];
  data = xpc_dictionary_get_data(v3, "kUARPData", &length);

  id v7 = +[NSData dataWithBytes:data length:length];
  id v8 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006FCF8(v8, v5);
  }
  v9 = +[UARPServiceUARPControllerManager instance];
  [v9 relayAACPUARP:v5 uarpMsg:v7 error:0];
}

- (void)handleHRMDeviceConnectedMsg:(id)a3
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HRM Classic device connected", v5, 2u);
  }
  id v4 = +[CattManager instance];
  [v4 registerServices];
}

- (void)handleLeaEasyPairRequestMsg:(id)a3
{
  xpc_object_t xdict = a3;
  id v3 = xpc_dictionary_get_value(xdict, "kLeaDeviceTags");
  if (v3)
  {
    id v4 = +[NSMutableArray array];
    if (xpc_array_get_count(v3))
    {
      size_t v5 = 0;
      do
      {
        uint64_t v6 = xpc_array_get_value(v3, v5);
        id v7 = +[NSString stringWithCString:xpc_string_get_string_ptr(v6) encoding:1];
        [v4 addObject:v7];

        ++v5;
      }
      while (v5 < xpc_array_get_count(v3));
    }
    id v8 = +[EndpointManager instance];
    v9 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, "kLeaDeviceAddress")];
    int64_t v10 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, "kLeaDeviceIdentifier")];
    [v8 requestLeaEasyPair:v9 deviceIdentifier:v10 deviceTags:v4];
  }
}

- (void)handleLeaEasyPairResponseMsg:(id)a3
{
  id v3 = a3;
  id v7 = +[EndpointManager instance];
  id v4 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kLeaDevicePairState")];
  string = xpc_dictionary_get_string(v3, "kLeaDeviceAddress");

  uint64_t v6 = +[NSString stringWithUTF8String:string];
  [v7 respondToLeaEasyPair:v4 device:v6];
}

- (void)handleLeaStoreBondingInfoRequestMsg:(id)a3
{
  id v3 = a3;
  size_t v27 = 0;
  size_t length = 0;
  size_t v26 = 0;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceRand", &length);
  size_t v5 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceLtk", &v27);
  uint64_t v6 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceIrk", &v26);
  uint64_t v7 = +[NSArray array];
  id v8 = (void *)v7;
  if (length)
  {
    for (size_t i = 0; i < length; ++i)
    {
      int64_t v10 = +[NSNumber numberWithUnsignedChar:data[i]];
      v11 = [v8 arrayByAddingObject:v10];

      id v8 = v11;
    }
  }
  else
  {
    v11 = (void *)v7;
  }
  uint64_t v12 = +[NSArray array];
  long long v13 = (void *)v12;
  if (v27)
  {
    for (size_t j = 0; j < v27; ++j)
    {
      v15 = +[NSNumber numberWithUnsignedChar:v5[j]];
      v16 = [v13 arrayByAddingObject:v15];

      long long v13 = v16;
    }
  }
  else
  {
    v16 = (void *)v12;
  }
  uint64_t v17 = +[NSArray array];
  v18 = (void *)v17;
  if (v26)
  {
    for (size_t k = 0; k < v26; ++k)
    {
      int64_t v20 = +[NSNumber numberWithUnsignedChar:v6[k]];
      v21 = [v18 arrayByAddingObject:v20];

      v18 = v21;
    }
  }
  else
  {
    v21 = (void *)v17;
  }
  v22 = +[EndpointManager instance];
  v23 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kLeaDeviceEdiv")];
  v24 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kLeaDeviceName")];
  v25 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kLeaDeviceAddress")];
  [v22 requestLeaStoreBondingInfo:v23 rand:v11 ltk:v16 irk:v21 name:v24 device:v25];
}

- (void)handleLeaStoreBondingInfoResponseMsg:(id)a3
{
  id v3 = a3;
  id v7 = +[EndpointManager instance];
  id v4 = +[NSNumber numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kLeaStoreBondingInfoResult")];
  string = xpc_dictionary_get_string(v3, "kLeaDeviceAddress");

  uint64_t v6 = +[NSString stringWithUTF8String:string];
  [v7 respondToLeaStoreBondingInfo:v4 device:v6];
}

+ (id)createNSDictionaryFromXpcDictionary:(id)a3
{
  id v3 = a3;
  size_t count = xpc_dictionary_get_count(v3);
  uint64_t v5 = 8 * count;
  uint64_t v6 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v6, 8 * count);
  bzero(v6, 8 * count);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10002BB4C;
  applier[3] = &unk_1000B19B0;
  void applier[4] = v12;
  applier[5] = v6;
  applier[6] = v6;
  xpc_dictionary_apply(v3, applier);
  id v7 = [objc_alloc((Class)NSDictionary) initWithObjects:v6 forKeys:v6 count:count];
  _Block_object_dispose(v12, 8);
  if (count)
  {
    uint64_t v8 = 8 * count;
    do
    {

      v8 -= 8;
    }
    while (v8);
    v9 = v6 - 8;
    do
    {

      v5 -= 8;
    }
    while (v5);
  }

  return v7;
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = v7;
  int64_t v10 = (const char *)[v9 UTF8String];

  xpc_dictionary_set_string(v8, "kMsgId", v10);
  if (v6)
  {
    v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v8, "kMsgArgs", v11);
  }
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006FDC0();
  }
  uint64_t v12 = [(BTLEXpcConnection *)self connection];
  xpc_connection_send_message(v12, v8);
}

- (void)authenticationDidSucceed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v4 userInfo];

  if (v6)
  {
    id v7 = [v4 userInfo];
    xpc_object_t v8 = [v7 objectForKeyedSubscript:@"AuthenticationServiceCertClassUserInfoKey"];

    v13[0] = @"kPeerIdentifier";
    id v9 = [v5 msgIdentifier];
    v13[1] = @"kCertClass";
    v14[0] = v9;
    v14[1] = v8;
    int64_t v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [(BTLEXpcConnection *)self sendMsg:@"AuthenticationDidSucceed" args:v10];
  }
  else
  {
    CFStringRef v11 = @"kPeerIdentifier";
    xpc_object_t v8 = [v5 msgIdentifier];
    uint64_t v12 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [(BTLEXpcConnection *)self sendMsg:@"AuthenticationDidSucceed" args:v9];
  }
}

- (void)authenticationDidFail:(id)a3
{
  id v4 = [a3 object];
  CFStringRef v7 = @"kPeerIdentifier";
  uint64_t v5 = [v4 msgIdentifier];
  xpc_object_t v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [(BTLEXpcConnection *)self sendMsg:@"AuthenticationDidFail" args:v6];
}

- (void)peerIsUsingBuiltinService:(id)a3
{
  id v4 = [a3 object];
  CFStringRef v7 = @"kPeerIdentifier";
  uint64_t v5 = [v4 msgIdentifier];
  xpc_object_t v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [(BTLEXpcConnection *)self sendMsg:@"PeerIsUsingBuiltinService" args:v6];
}

- (void)peerIsNotUsingBuiltinService:(id)a3
{
  id v4 = [a3 object];
  CFStringRef v7 = @"kPeerIdentifier";
  uint64_t v5 = [v4 msgIdentifier];
  xpc_object_t v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [(BTLEXpcConnection *)self sendMsg:@"PeerIsNotUsingBuiltinService" args:v6];
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end