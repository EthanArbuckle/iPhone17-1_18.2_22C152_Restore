@interface BTLEXpcServer
+ (id)instance;
- (BTLEXpcConnection)serverConnection;
- (BTLEXpcServer)init;
- (OS_xpc_object)xpcServer;
- (void)handleConnection:(id)a3;
- (void)handleEvent:(id)a3;
- (void)handleXpcDisconnection:(id)a3;
- (void)sendANCSNotificationSourceRegisteredMsg:(id)a3;
- (void)sendDevMgmtPipeConnectedMsg:(id)a3;
- (void)sendDevMgmtPipeDisconnectedMsg:(id)a3;
- (void)sendEnableBTSyncMsg:(unsigned __int16)a3 forPeer:(id)a4;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)sendSetConnectionParametersMsg:(id)a3 forPeer:(id)a4;
- (void)setServerConnection:(id)a3;
- (void)setXpcServer:(id)a3;
@end

@implementation BTLEXpcServer

+ (id)instance
{
  if (qword_1000CD0F0 != -1) {
    dispatch_once(&qword_1000CD0F0, &stru_1000B2078);
  }
  v2 = (void *)qword_1000CD0E8;

  return v2;
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BTLEXpcServer *)self serverConnection];
  [v8 sendMsg:v7 args:v6];
}

- (void)sendEnableBTSyncMsg:(unsigned __int16)a3 forPeer:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [(BTLEXpcServer *)self serverConnection];
  v11[0] = @"kPeerIdentifier";
  id v8 = [v6 msgIdentifier];

  v11[1] = @"kPeriod";
  v12[0] = v8;
  v9 = +[NSNumber numberWithUnsignedShort:v4];
  v12[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v7 sendMsg:@"EnableBTSync" args:v10];
}

- (void)sendSetConnectionParametersMsg:(id)a3 forPeer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v18 = [(BTLEXpcServer *)self serverConnection];
  v21[0] = @"kPeerIdentifier";
  v20 = [v6 msgIdentifier];

  v22[0] = v20;
  v21[1] = @"kMinInterval";
  [v7 minInterval];
  v19 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v22[1] = v19;
  v21[2] = @"kPreferredInterval";
  [v7 preferredInterval];
  id v8 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v22[2] = v8;
  v21[3] = @"kMaxInterval";
  [v7 maxInterval];
  v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v22[3] = v9;
  v21[4] = @"kMinCELength";
  v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 minCELength]);
  v22[4] = v10;
  v21[5] = @"kMaxCELength";
  v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 maxCELength]);
  v22[5] = v11;
  v21[6] = @"kPreferredPeripheralLatency";
  v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 preferredPeripheralLatency]);
  v22[6] = v12;
  v21[7] = @"kMaxPeripheralLatency";
  v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 maxPeripheralLatency]);
  v22[7] = v13;
  v21[8] = @"kMaxDeferment";
  v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 maxDeferment]);
  v22[8] = v14;
  v21[9] = @"kTimeout";
  id v15 = [v7 timeout];

  v16 = +[NSNumber numberWithInt:v15];
  v22[9] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:10];
  [v18 sendMsg:@"SetConnectionParameters" args:v17];
}

- (void)sendDevMgmtPipeConnectedMsg:(id)a3
{
  uint64_t v4 = [a3 UUIDString];
  CFUUIDRef v5 = CFUUIDCreateFromString(kCFAllocatorDefault, v4);

  id v6 = [(BTLEXpcServer *)self serverConnection];
  CFStringRef v8 = @"kPeerIdentifier";
  CFTypeRef v9 = CFAutorelease(v5);
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 sendMsg:@"DevMgmtPipeConnected" args:v7];
}

- (void)sendDevMgmtPipeDisconnectedMsg:(id)a3
{
  uint64_t v4 = [a3 UUIDString];
  CFUUIDRef v5 = CFUUIDCreateFromString(kCFAllocatorDefault, v4);

  id v6 = [(BTLEXpcServer *)self serverConnection];
  CFStringRef v8 = @"kPeerIdentifier";
  CFTypeRef v9 = CFAutorelease(v5);
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 sendMsg:@"DevMgmtPipeDisconnected" args:v7];
}

- (void)sendANCSNotificationSourceRegisteredMsg:(id)a3
{
  uint64_t v4 = [a3 UUIDString];
  CFUUIDRef v5 = CFUUIDCreateFromString(kCFAllocatorDefault, v4);

  id v6 = [(BTLEXpcServer *)self serverConnection];
  CFStringRef v8 = @"kPeerIdentifier";
  CFTypeRef v9 = CFAutorelease(v5);
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 sendMsg:@"ANCSNotificationSourceRegistered" args:v7];
}

- (BTLEXpcServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)BTLEXpcServer;
  v2 = [(BTLEXpcServer *)&v11 init];
  if (v2)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTServer.le", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = mach_service;

    CFUUIDRef v5 = v2->_xpcServer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004CC20;
    handler[3] = &unk_1000B1960;
    v10 = v2;
    xpc_connection_set_event_handler(v5, handler);
    id v6 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting XPC server", v8, 2u);
    }
    xpc_connection_resume(v2->_xpcServer);
  }
  return v2;
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    [(BTLEXpcServer *)self handleConnection:v4];
  }
  else
  {
    xpc_type_t v6 = type;
    id v7 = qword_1000CD178;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
    if (v6 == (xpc_type_t)&_xpc_type_error)
    {
      if (v8) {
        sub_1000738E4((uint64_t)v4, v7);
      }
    }
    else if (v8)
    {
      sub_10007395C((uint64_t)v4, v7);
    }
  }
}

- (void)handleConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  CFUUIDRef v5 = (void *)xpc_connection_copy_entitlement_value();
  xpc_type_t v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v6))
  {
    id v7 = [[BTLEXpcConnection alloc] initWithConnection:v4];
    BOOL v8 = [(BTLEXpcConnection *)v7 bundleIdentifier];
    CFTypeRef v9 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v12[0] = 67109378;
      v12[1] = xpc_connection_get_pid(v4);
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "XPC client set server connection pid %d, bundleID %@", (uint8_t *)v12, 0x12u);
    }
    if (([v8 hasPrefix:@"com.apple.bluetoothd"] & 1) != 0
      || [v8 hasPrefix:@"com.apple.BTServer"])
    {
      [(BTLEXpcServer *)self setServerConnection:v7];
    }
  }
  else
  {
    objc_super v11 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000739D4(v11);
    }
    xpc_connection_cancel(v4);
  }
}

- (void)handleXpcDisconnection:(id)a3
{
  id v4 = a3;
  id v5 = [(BTLEXpcServer *)self serverConnection];

  if (v5 == v4)
  {
    [(BTLEXpcServer *)self setServerConnection:0];
  }
}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
}

- (BTLEXpcConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_storeStrong((id *)&self->_xpcServer, 0);
}

@end