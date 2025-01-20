@interface NRRemoteObjectClassD
- (NRRemoteObjectClassD)initWithDelegate:(id)a3 andQueue:(id)a4;
- (void)idsHandlePingRequest:(id)a3;
- (void)idsHandleWatchMigrationCompletionRequest:(id)a3;
- (void)idsHandleWatchMigrationMetricSessionID:(id)a3;
- (void)idsHandleWillUnpair:(id)a3;
- (void)registerProtobufHandlers;
- (void)sendMigrationCompletionWithStatus:(unint64_t)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5;
- (void)sendPairingModeRequest:(unsigned __int16)a3 toIDSBTUUID:(id)a4 withSentBlock:(id)a5;
- (void)sendPairingSessionID:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5;
- (void)sendPingRequestType:(int)a3 withMessagePriority:(int64_t)a4 withMessageSize:(unint64_t)a5 withTimeout:(double)a6 toIDSBTUUID:(id)a7 withResponseBlock:(id)a8;
- (void)sendRTCMigrationMetricSessionID:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5;
- (void)sendUnpairMessageWithAdvertisedName:(id)a3 btUUID:(id)a4 shouldObliterate:(id)a5 shouldBrick:(id)a6 shouldPreserveESim:(id)a7 withPairingFailureCode:(id)a8 withAbortReason:(id)a9 withRequestIdentifier:(id)a10 responseBlock:(id)a11;
@end

@implementation NRRemoteObjectClassD

- (NRRemoteObjectClassD)initWithDelegate:(id)a3 andQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NRRemoteObjectClassD;
  return [(NRRemoteObject *)&v5 initWithServiceName:@"com.apple.private.alloy.bluetoothregistry" andClientQueue:a4 andDelegate:a3];
}

- (void)registerProtobufHandlers
{
  [(NRRemoteObject *)self setAlwaysProtobufAction:"idsHandleWillUnpair:" forIncomingRequestsOfType:1];
  [(NRRemoteObject *)self setAlwaysProtobufAction:"idsHandlePingRequest:" forIncomingRequestsOfType:5];
  [(NRRemoteObject *)self setAlwaysProtobufAction:0 forIncomingResponsesOfType:5];
  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandleWatchMigrationCompletionRequest:" forIncomingRequestsOfType:6];

  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandleWatchMigrationMetricSessionID:" forIncomingRequestsOfType:9];
}

- (void)sendPairingModeRequest:(unsigned __int16)a3 toIDSBTUUID:(id)a4 withSentBlock:(id)a5
{
  unsigned int v6 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc_init(NRPBPairingModeRequest);
  sub_10009A7B0((uint64_t)v10, v6);
  v11 = [(NRRemoteObject *)self defaultPairedDevice];
  sub_100099E1C((uint64_t)v10, (int)[v11 maxCompatibilityVersion]);

  v12 = [(NRRemoteObject *)self delegate];
  sub_100099DF4((uint64_t)v10, (int)[v12 maxPairingCompatibilityVersion]);
  sub_100099E44((uint64_t)v10, (int)[v12 minPairingCompatibilityVersion]);
  uint64_t v13 = v6;
  v14 = +[NRPairingCompatibilityVersionInfo systemVersions];
  id v15 = [v14 maxPairingCompatibilityVersion];
  v16 = [(NRRemoteObject *)self defaultPairedDevice];
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Set Compatibility State %ld (P=%d W=%d)", v13, v15, [v16 pairingProtocolVersion]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006A360;
  v19[3] = &unk_100165C20;
  id v20 = v8;
  id v18 = v8;
  [(NRRemoteObject *)self sendRequest:v10 type:3 withTimeout:0 withResponseTimeout:0 withDescription:v17 onlyOneFor:@"compatibilityState" priority:300 toIDSBTUUID:v9 didSend:v19 andResponse:0];
}

- (void)idsHandleWillUnpair:(id)a3
{
  id v4 = a3;
  objc_super v5 = [NRPBDeviceWillUnpairRequest alloc];
  unsigned int v6 = [v4 protobuf];
  v7 = [v6 data];
  id v8 = [(NRPBDeviceWillUnpairRequest *)v5 initWithData:v7];

  id v9 = [(NRRemoteObject *)self delegate];
  v10 = nr_pairing_reporter_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = nr_pairing_reporter_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (sub_10009CE24((uint64_t)v8)) {
        uint64_t v13 = sub_10009DA64((uint64_t)v8);
      }
      else {
        uint64_t v13 = 0xFFFFFFFFLL;
      }
      v14 = +[NSNumber numberWithInt:v13];
      id v15 = sub_10009DA78((uint64_t)v8);
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      __int16 v27 = 2114;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "IDSHandleWillUnpairCalled with failure code: %{public}@\tabort reason: %{public}@", buf, 0x16u);
    }
  }
  v16 = [(NRRemoteObject *)self clientQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006A5BC;
  v20[3] = &unk_100165668;
  id v21 = v9;
  v22 = self;
  v23 = v8;
  id v24 = v4;
  id v17 = v4;
  id v18 = v8;
  id v19 = v9;
  dispatch_async(v16, v20);
}

- (void)sendUnpairMessageWithAdvertisedName:(id)a3 btUUID:(id)a4 shouldObliterate:(id)a5 shouldBrick:(id)a6 shouldPreserveESim:(id)a7 withPairingFailureCode:(id)a8 withAbortReason:(id)a9 withRequestIdentifier:(id)a10 responseBlock:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v25 = v24;
  if (v23)
  {
    v26 = objc_opt_new();
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10006AA68;
    v35[3] = &unk_100165C20;
    v36 = v25;
    [(NRRemoteObject *)self sendResponse:v26 type:1 requestUUID:v23 withTimeout:&off_100176A78 withDescription:@"willUnpairResponse" onlyOneFor:0 priority:300 didSend:v35];

    __int16 v27 = v36;
  }
  else
  {
    v29 = v24;
    v28 = objc_alloc_init(NRPBDeviceWillUnpairRequest);
    __int16 v27 = v28;
    if (v16) {
      sub_10009D67C((uint64_t)v28, v16);
    }
    if (v18) {
      sub_10009CDBC((uint64_t)v27, (char)[v18 BOOLValue]);
    }
    if (v19) {
      sub_10009CE3C((uint64_t)v27, (char)[v19 BOOLValue]);
    }
    if (v20) {
      sub_10009CE7C((uint64_t)v27, (char)[v20 BOOLValue]);
    }
    if (v21) {
      sub_10009CDFC((uint64_t)v27, (int)[v21 intValue]);
    }
    if (v22) {
      sub_10009D694((uint64_t)v27, v22);
    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10006AA80;
    v33[3] = &unk_100165C20;
    id v34 = v29;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10006AA9C;
    v31[3] = &unk_100167DE8;
    id v32 = v34;
    v25 = v29;
    [(NRRemoteObject *)self sendRequest:v27 type:1 withTimeout:&off_100176A78 withResponseTimeout:&off_100176A90 withDescription:@"willUnpairRequest" onlyOneFor:0 priority:300 toIDSBTUUID:v17 didSend:v33 andResponse:v31];
  }
}

- (void)sendPingRequestType:(int)a3 withMessagePriority:(int64_t)a4 withMessageSize:(unint64_t)a5 withTimeout:(double)a6 toIDSBTUUID:(id)a7 withResponseBlock:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = objc_alloc_init(NRPBPingRequest);
  sub_1000ECB6C((uint64_t)v16, a4);
  sub_1000ECB9C((uint64_t)v16, a6);
  sub_1000ECBC4((uint64_t)v16, a3);
  id v17 = [(NRPBPingRequest *)v16 data];
  id v18 = [v17 length];

  if ((unint64_t)v18 < a5)
  {
    if (a5 >= (unint64_t)v18) {
      unint64_t v19 = a5 - (void)v18;
    }
    else {
      unint64_t v19 = 0;
    }
    id v20 = +[NSData dataWithRandomBytesOfSize:v19];
    sub_1000EC90C((uint64_t)v16, v20);
  }
  id v21 = +[NSDate date];
  [v21 timeIntervalSinceReferenceDate];
  uint64_t v23 = v22;

  id v24 = +[NSNumber numberWithDouble:a6];
  v25 = +[NSNumber numberWithDouble:a6];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10006AC8C;
  v27[3] = &unk_100167E10;
  uint64_t v29 = v23;
  id v28 = v14;
  id v26 = v14;
  [(NRRemoteObject *)self sendRequest:v16 type:5 withTimeout:v24 withResponseTimeout:v25 withDescription:@"Ping request" onlyOneFor:0 priority:a4 toIDSBTUUID:v15 didSend:0 andResponse:v27];
}

- (void)idsHandlePingRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [NRPBPingRequest alloc];
  unsigned int v6 = [v4 protobuf];
  v7 = [v6 data];
  id v8 = [(NRPBPingRequest *)v5 initWithData:v7];

  id v9 = objc_opt_new();
  v10 = +[NSDate date];
  [v10 timeIntervalSinceReferenceDate];
  sub_1000A4318((uint64_t)v9, v11);

  v12 = [(NRPBPingRequest *)v8 data];
  uint64_t v13 = [v12 length];

  id v14 = [v9 data];
  id v15 = [v14 length];

  if (v13 > v15)
  {
    id v16 = +[NSData dataWithRandomBytesOfSize:v13 - v15];
    sub_1000A4130((uint64_t)v9, v16);
  }
  id v17 = +[NSNumber numberWithDouble:sub_1000ECB80((uint64_t)v8)];
  [(NRRemoteObject *)self sendResponse:v9 type:5 withRequest:v4 withTimeout:v17 withDescription:@"Ping response" onlyOneFor:0 priority:(int)sub_1000ECB58((uint64_t)v8) didSend:0];

  id v18 = [(NRRemoteObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v19 = [(NRRemoteObject *)self clientQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006AFEC;
    block[3] = &unk_100165530;
    id v21 = v18;
    uint64_t v22 = v8;
    dispatch_async(v19, block);
  }
}

- (void)idsHandleWatchMigrationCompletionRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [NRPBWatchMigrationCompletionRequest alloc];
  unsigned int v6 = [v4 protobuf];

  v7 = [v6 data];
  id v8 = [(NRPBWatchMigrationCompletionRequest *)v5 initWithData:v7];

  id v9 = nr_daemon_log();
  LODWORD(v6) = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = sub_10002011C((uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received watch migration completion request status: %d", buf, 8u);
    }
  }
  double v11 = [(NRRemoteObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v12 = [(NRRemoteObject *)self clientQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006B200;
    v13[3] = &unk_100165530;
    id v14 = v11;
    id v15 = v8;
    dispatch_async(v12, v13);
  }
}

- (void)idsHandleWatchMigrationMetricSessionID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [NRPBRTCMigrationMetricSessionID alloc];
  unsigned int v6 = [v4 protobuf];

  v7 = [v6 data];
  id v8 = [(NRPBRTCMigrationMetricSessionID *)v5 initWithData:v7];

  id v9 = nr_daemon_log();
  LODWORD(v6) = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = sub_1000D4F78((uint64_t)v8);
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received watch migration metric session ID: %@", buf, 0xCu);
    }
  }
  v12 = [(NRRemoteObject *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [(NRRemoteObject *)self clientQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006B420;
    v14[3] = &unk_100165530;
    id v15 = v12;
    id v16 = v8;
    dispatch_async(v13, v14);
  }
}

- (void)sendMigrationCompletionWithStatus:(unint64_t)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5
{
  int v6 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc_init(NRPBWatchMigrationCompletionRequest);
  sub_10001FC4C((uint64_t)v10, v6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006B578;
  v12[3] = &unk_100167E38;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [(NRRemoteObject *)self sendRequest:v10 type:6 withTimeout:&off_100176A90 withResponseTimeout:&off_100176A90 withDescription:@"Watch migration completion request" onlyOneFor:0 priority:300 toIDSBTUUID:v9 didSend:v12 andResponse:0];
}

- (void)sendRTCMigrationMetricSessionID:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(NRPBRTCMigrationMetricSessionID);
  sub_1000D4E6C((uint64_t)v11, v10);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006B76C;
  v13[3] = &unk_100167E38;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [(NRRemoteObject *)self sendRequest:v11 type:9 withTimeout:&off_100176A90 withResponseTimeout:&off_100176A90 withDescription:@"RTC Migration metric session ID" onlyOneFor:0 priority:300 toIDSBTUUID:v9 didSend:v13 andResponse:0];
}

- (void)sendPairingSessionID:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(NRPBPairingSessionID);
  sub_1000190CC((uint64_t)v11, v10);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006B960;
  v13[3] = &unk_100167E38;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [(NRRemoteObject *)self sendRequest:v11 type:10 withTimeout:&off_100176A90 withResponseTimeout:&off_100176A90 withDescription:@"Pairing session id" onlyOneFor:0 priority:300 toIDSBTUUID:v9 didSend:v13 andResponse:0];
}

@end