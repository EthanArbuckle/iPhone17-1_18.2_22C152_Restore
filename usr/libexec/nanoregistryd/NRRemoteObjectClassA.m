@interface NRRemoteObjectClassA
- (NRRemoteObjectClassA)initWithDelegate:(id)a3 andQueue:(id)a4;
- (void)sendMigrationSetKeyRequestToBTUUID:(id)a3 withKey:(id)a4 withRevision:(int)a5 withResponseBlock:(id)a6;
@end

@implementation NRRemoteObjectClassA

- (NRRemoteObjectClassA)initWithDelegate:(id)a3 andQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NRRemoteObjectClassA;
  return [(NRRemoteObject *)&v5 initWithServiceName:@"com.apple.private.alloy.bluetoothregistryclassa" isAlwaysConnected:1 andClientQueue:a4 andDelegate:a3];
}

- (void)sendMigrationSetKeyRequestToBTUUID:(id)a3 withKey:(id)a4 withRevision:(int)a5 withResponseBlock:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  v13 = objc_opt_new();
  sub_1000D7754((uint64_t)v13, v10);
  sub_1000D730C((uint64_t)v13, a5);
  v14 = nr_daemon_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    v16 = nr_daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v10 SHA256Data];
      v18 = [v17 base64EncodedStringWithOptions:0];
      v19 = [v18 substringToIndex:6];
      *(_DWORD *)buf = 138412546;
      v27 = v19;
      __int16 v28 = 2048;
      uint64_t v29 = a5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending migration key, digest %@, revision %lx", buf, 0x16u);
    }
  }
  v20 = +[NSString stringWithFormat:@"Cloud migration set key request"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000BAA5C;
  v24[3] = &unk_100165C20;
  id v25 = v11;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000BAAC0;
  v22[3] = &unk_100167DE8;
  id v23 = v25;
  id v21 = v25;
  [(NRRemoteObject *)self sendRequest:v13 type:0 withTimeout:&off_100177530 withResponseTimeout:&off_100177530 withDescription:v20 onlyOneFor:@"migrationSetKey" priority:300 toIDSBTUUID:v12 didSend:v24 andResponse:v22];
}

@end