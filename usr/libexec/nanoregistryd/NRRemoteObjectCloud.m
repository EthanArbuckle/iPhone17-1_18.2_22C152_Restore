@interface NRRemoteObjectCloud
+ (BOOL)messagesShouldHaveValidSender;
- (NRRemoteObjectCloud)initWithDelegate:(id)a3 andQueue:(id)a4;
- (void)idsHandleAddTermsCloudEvent:(id)a3;
- (void)idsHandleMigratedAwayRequest:(id)a3;
- (void)idsHandleReceiveSystemVersionBroadcast:(id)a3;
- (void)idsHandleSystemVersionRequest:(id)a3;
- (void)registerProtobufHandlers;
- (void)sendMigrationRequestToDestinations:(id)a3 shouldCancel:(BOOL)a4 withSentBlock:(id)a5 withResponseBlock:(id)a6;
- (void)sendSystemVersionsRequestToCompanionWithSentBlock:(id)a3 withResponseBlock:(id)a4;
- (void)sendSystemVersionsResponseWithSystemVersions:(id)a3 forRequest:(id)a4;
- (void)sendSystemVersionsToDestinations:(id)a3 withSentBlock:(id)a4;
- (void)sendTermsEventToDestinations:(id)a3 termsEvent:(id)a4 withSentBlock:(id)a5 withResponseBlock:(id)a6;
@end

@implementation NRRemoteObjectCloud

- (NRRemoteObjectCloud)initWithDelegate:(id)a3 andQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NRRemoteObjectCloud;
  return [(NRRemoteObject *)&v5 initWithServiceName:@"com.apple.private.alloy.bluetoothregistry.cloud" isAlwaysConnected:1 andClientQueue:a4 andDelegate:a3];
}

- (void)registerProtobufHandlers
{
  [(NRRemoteObject *)self setConnectedProtobufAction:0 forIncomingResponsesOfType:0];
  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandleMigratedAwayRequest:" forIncomingRequestsOfType:1];
  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandleSystemVersionRequest:" forIncomingRequestsOfType:3];

  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandleReceiveSystemVersionBroadcast:" forIncomingRequestsOfType:4];
}

- (void)sendMigrationRequestToDestinations:(id)a3 shouldCancel:(BOOL)a4 withSentBlock:(id)a5 withResponseBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  v13 = objc_opt_new();
  sub_10005EC88((uint64_t)v13, a4);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000DF9F8;
  v18[3] = &unk_100165C20;
  id v19 = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000DFAB0;
  v16[3] = &unk_100167DE8;
  id v17 = v11;
  id v14 = v11;
  id v15 = v10;
  [(NRRemoteObject *)self sendCloudRequest:v13 type:0 withTimeout:&off_100177550 withResponseTimeout:&off_100177550 withDescription:@"Cloud migration request" onlyOneFor:@"migrationRequest" priority:300 toDestinations:v12 didSend:v18 andResponse:v16];
}

- (void)idsHandleMigratedAwayRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NRRemoteObject *)self delegate];
  v6 = [NRPBMigratedAwayRequest alloc];
  v7 = [v4 protobuf];

  v8 = [v7 data];
  v9 = [(NRPBMigratedAwayRequest *)v6 initWithData:v8];

  id v10 = [(NRRemoteObject *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DFDC0;
  block[3] = &unk_100165868;
  id v14 = v5;
  id v15 = self;
  v16 = v9;
  id v11 = v9;
  id v12 = v5;
  dispatch_async(v10, block);
}

- (void)idsHandleAddTermsCloudEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NRRemoteObject *)self delegate];
  v6 = [NRPBAddTermsEventRequest alloc];
  v7 = [v4 protobuf];
  v8 = [v7 data];
  v9 = [(NRPBAddTermsEventRequest *)v6 initWithData:v8];

  if (v9)
  {
    id v10 = sub_1000B1ECC((uint64_t)v9);

    if (v10)
    {
      id v11 = [(NRRemoteObject *)self clientQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000DFF6C;
      v12[3] = &unk_100165668;
      id v13 = v5;
      id v14 = self;
      id v15 = v9;
      id v16 = v4;
      dispatch_async(v11, v12);
    }
  }
}

- (void)idsHandleSystemVersionRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received System Version request: %@", buf, 0xCu);
    }
  }
  v8 = [(NRRemoteObject *)self clientQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E023C;
  v10[3] = &unk_100165530;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)idsHandleReceiveSystemVersionBroadcast:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 protobuf];
  BOOL v6 = [v5 context];
  v7 = [v6 fromID];

  v8 = nr_daemon_log();
  LODWORD(v6) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received System Version Broadcast: %@ from %@", (uint8_t *)&v18, 0x16u);
    }
  }
  id v10 = [(NRRemoteObject *)self service];
  id v11 = [v10 linkedDeviceForFromID:v7 withRelationship:3];

  id v12 = [(NRRemoteObject *)self delegate];
  id v13 = [NRPBSystemVersionResponse alloc];
  id v14 = [v4 protobuf];
  id v15 = [v14 data];
  id v16 = [(NRPBSystemVersionResponse *)v13 initWithData:v15];
  id v17 = [v11 uniqueIDOverride];
  [v12 remoteObject:self receivedSystemVersionBroadcast:v16 fromDeviceID:v17];
}

+ (BOOL)messagesShouldHaveValidSender
{
  return 1;
}

- (void)sendTermsEventToDestinations:(id)a3 termsEvent:(id)a4 withSentBlock:(id)a5 withResponseBlock:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(NRPBAddTermsEventRequest);
  sub_1000B1DC0((uint64_t)v12, v10);
  id v13 = sub_1000B1ECC((uint64_t)v12);
  [v13 setWritable:1];

  id v14 = [v10 termsText];

  id v15 = sub_1000B1ECC((uint64_t)v12);
  [v15 setTermsText:v14];

  id v16 = sub_1000B1ECC((uint64_t)v12);
  [v16 setWritable:0];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E0600;
  v18[3] = &unk_100165C20;
  id v19 = v9;
  id v17 = v9;
  [(NRRemoteObject *)self sendCloudRequest:v12 type:2 withTimeout:&off_100177550 withResponseTimeout:&off_100177550 withDescription:@"Terms Event" onlyOneFor:0 priority:300 toDestinations:v11 didSend:v18 andResponse:0];
}

- (void)sendSystemVersionsToDestinations:(id)a3 withSentBlock:(id)a4
{
  id v5 = a3;
  BOOL v6 = objc_alloc_init(NRPBSystemVersionResponse);
  v7 = +[NRPairingCompatibilityVersionInfo systemVersions];
  sub_100060E30((uint64_t)v6, (int)[v7 minPairingCompatibilityVersion]);
  sub_100060E08((uint64_t)v6, (int)[v7 maxPairingCompatibilityVersion]);
  sub_100060E58((uint64_t)v6, (int)[v7 minQuickSwitchCompatibilityVersion]);
  sub_100060DE0((uint64_t)v6, (int)[v7 pairingCompatibilityVersion]);
  sub_100060E80((uint64_t)v6, (char)[v7 isOverrideActive]);
  v8 = (void *)MGCopyAnswer();
  sub_100061744((uint64_t)v6, v8);

  id v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sendSystemVersionsToDestinations: %@", buf, 0xCu);
    }
  }
  [(NRRemoteObject *)self sendCloudRequest:v6 type:4 withTimeout:&off_100177550 withResponseTimeout:&off_100177550 withDescription:@"SystemVersion" onlyOneFor:0 priority:300 toDestinations:v5 didSend:&stru_100169A10 andResponse:0];
}

- (void)sendSystemVersionsResponseWithSystemVersions:(id)a3 forRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v10 = objc_alloc_init(NRPBSystemVersionResponse);
  sub_100060E30((uint64_t)v10, (int)[v7 minPairingCompatibilityVersion]);
  sub_100060E08((uint64_t)v10, (int)[v7 maxPairingCompatibilityVersion]);
  sub_100060E58((uint64_t)v10, (int)[v7 minQuickSwitchCompatibilityVersion]);
  sub_100060DE0((uint64_t)v10, (int)[v7 pairingCompatibilityVersion]);
  char v8 = [v7 isOverrideActive];

  sub_100060E80((uint64_t)v10, v8);
  id v9 = (void *)MGCopyAnswer();
  sub_100061744((uint64_t)v10, v9);

  [(NRRemoteObject *)self sendCloudResponse:v10 type:3 withRequest:v6 withTimeout:&off_100177550 withDescription:@"SystemVersion" onlyOneFor:0 priority:300 didSend:&stru_100169A30];
}

- (void)sendSystemVersionsRequestToCompanionWithSentBlock:(id)a3 withResponseBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_alloc_init(NRPBSystemVersionResponse);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E0C64;
  v13[3] = &unk_100165C20;
  id v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E0D1C;
  v11[3] = &unk_100167DE8;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NRRemoteObject *)self sendCompanionCloudRequest:v8 type:3 withTimeout:&off_100177550 withResponseTimeout:&off_100177550 withDescription:@"SystemVersion Request" onlyOneFor:0 priority:300 didSend:v13 andResponse:v11];
}

@end