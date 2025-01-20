@interface NRRemoteObjectTinker
- (NRRemoteObjectTinker)initWithDelegate:(id)a3 andQueue:(id)a4;
- (void)sendMigrationRequestToDestinations:(id)a3 shouldCancel:(BOOL)a4 withSentBlock:(id)a5 withResponseBlock:(id)a6;
- (void)sendSystemVersionsRequestToCompanionWithSentBlock:(id)a3 withResponseBlock:(id)a4;
- (void)sendSystemVersionsResponseWithSystemVersions:(id)a3 forRequest:(id)a4;
- (void)sendSystemVersionsToDestinations:(id)a3 withSentBlock:(id)a4;
- (void)sendTermsEventToDestinations:(id)a3 termsEvent:(id)a4 withSentBlock:(id)a5 withResponseBlock:(id)a6;
@end

@implementation NRRemoteObjectTinker

- (NRRemoteObjectTinker)initWithDelegate:(id)a3 andQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NRRemoteObjectTinker;
  return [(NRRemoteObject *)&v5 initWithServiceName:@"com.apple.private.alloy.tinker.nanoregistry" isAlwaysConnected:1 andClientQueue:a4 andDelegate:a3];
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
  v18[2] = sub_10007F300;
  v18[3] = &unk_100165C20;
  id v19 = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007F3B8;
  v16[3] = &unk_100167DE8;
  id v17 = v11;
  id v14 = v11;
  id v15 = v10;
  [(NRRemoteObject *)self sendTinkerRequest:v13 type:0 withTimeout:&off_1001774F0 withResponseTimeout:&off_1001774F0 withDescription:@"Tinker migration request" onlyOneFor:@"migrationRequest" priority:300 toDestinations:v12 didSend:v18 andResponse:v16];
}

- (void)sendTermsEventToDestinations:(id)a3 termsEvent:(id)a4 withSentBlock:(id)a5 withResponseBlock:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(NRPBAddTermsEventRequest);
  sub_1000B1DC0((uint64_t)v12, v10);
  v13 = sub_1000B1ECC((uint64_t)v12);
  [v13 setWritable:1];

  id v14 = [v10 termsText];

  id v15 = sub_1000B1ECC((uint64_t)v12);
  [v15 setTermsText:v14];

  v16 = sub_1000B1ECC((uint64_t)v12);
  [v16 setWritable:0];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007F70C;
  v18[3] = &unk_100165C20;
  id v19 = v9;
  id v17 = v9;
  [(NRRemoteObject *)self sendCloudRequest:v12 type:1 withTimeout:&off_1001774F0 withResponseTimeout:&off_1001774F0 withDescription:@"Terms Event" onlyOneFor:0 priority:300 toDestinations:v11 didSend:v18 andResponse:0];
}

- (void)sendSystemVersionsToDestinations:(id)a3 withSentBlock:(id)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(NRPBSystemVersionResponse);
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
  [(NRRemoteObject *)self sendCloudRequest:v6 type:4 withTimeout:&off_1001774F0 withResponseTimeout:&off_1001774F0 withDescription:@"SystemVersion" onlyOneFor:0 priority:300 toDestinations:v5 didSend:&stru_100168360 andResponse:0];
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

  [(NRRemoteObject *)self sendCloudResponse:v10 type:3 withRequest:v6 withTimeout:&off_1001774F0 withDescription:@"SystemVersion" onlyOneFor:0 priority:300 didSend:&stru_100168380];
}

- (void)sendSystemVersionsRequestToCompanionWithSentBlock:(id)a3 withResponseBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_alloc_init(NRPBSystemVersionResponse);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007FD24;
  v13[3] = &unk_100165C20;
  id v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007FDDC;
  v11[3] = &unk_100167DE8;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NRRemoteObject *)self sendCompanionCloudRequest:v8 type:3 withTimeout:&off_1001774F0 withResponseTimeout:&off_1001774F0 withDescription:@"SystemVersion Request" onlyOneFor:0 priority:300 didSend:v13 andResponse:v11];
}

@end