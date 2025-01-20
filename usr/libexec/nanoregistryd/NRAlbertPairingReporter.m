@interface NRAlbertPairingReporter
- (NRAlbertPairingReporter)init;
- (id)_submissionURL;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_sendPairingActivityData:(id)a3;
- (void)submitPairingReportWithRegistry:(id)a3 deviceID:(id)a4;
@end

@implementation NRAlbertPairingReporter

- (NRAlbertPairingReporter)init
{
  v7.receiver = self;
  v7.super_class = (Class)NRAlbertPairingReporter;
  v2 = [(NRAlbertPairingReporter *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoRegistry.albertPairingReporter", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)submitPairingReportWithRegistry:(id)a3 deviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_10005036C;
    v17[4] = sub_10005037C;
    id v18 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100050384;
    v12[3] = &unk_100167770;
    v16 = v17;
    id v13 = v7;
    v14 = self;
    id v15 = v6;
    [v15 grabRegistryWithReadBlock:v12];

    _Block_object_dispose(v17, 8);
  }
  else
  {
    v9 = nr_daemon_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000F87F8();
      }
    }
  }
}

- (id)_submissionURL
{
  if (qword_1001A1140 != -1) {
    dispatch_once(&qword_1001A1140, &stru_100167790);
  }
  v2 = (void *)qword_1001A1138;

  return v2;
}

- (void)_sendPairingActivityData:(id)a3
{
  id v4 = a3;
  v5 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  [v5 setHTTPCookieAcceptPolicy:1];
  [v5 setHTTPCookieStorage:0];
  id v6 = objc_alloc_init((Class)NSOperationQueue);
  [v6 setName:@"com.apple.NanoRegistry.AlbertPairingReporter"];
  id v7 = +[NSURLSession sessionWithConfiguration:v5 delegate:self delegateQueue:v6];
  v8 = [(NRAlbertPairingReporter *)self _submissionURL];
  v9 = +[NSURL URLWithString:v8];
  BOOL v10 = +[NSMutableURLRequest requestWithURL:v9];

  [v10 setHTTPMethod:@"POST"];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10005036C;
  v18[4] = sub_10005037C;
  v11 = self;
  v19 = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100050A00;
  v14[3] = &unk_1001677E0;
  id v12 = v7;
  v16 = v11;
  v17 = v18;
  id v15 = v12;
  id v13 = [v12 uploadTaskWithRequest:v10 fromData:v4 completionHandler:v14];
  [v13 resume];

  _Block_object_dispose(v18, 8);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting server validation", buf, 2u);
    }
  }
  id v12 = [v7 protectionSpace];
  [v12 host];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100050EF8;
  v38[3] = &unk_100166210;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v39 = v13;
  id v14 = v8;
  id v40 = v14;
  id v15 = objc_retainBlock(v38);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100050F84;
  v36[3] = &unk_100165D10;
  id v16 = v14;
  id v37 = v16;
  v17 = objc_retainBlock(v36);
  id v18 = [v12 authenticationMethod];
  unsigned int v19 = [v18 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (!v19)
  {
    v25 = nr_daemon_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

    if (v26)
    {
      v27 = nr_daemon_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000F8A28(v12, v27);
      }
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v20 = (__SecTrust *)[v12 serverTrust];
  if (!v20)
  {
    v28 = nr_daemon_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (v29)
    {
      v27 = nr_daemon_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000F89C0();
      }
      goto LABEL_18;
    }
LABEL_19:
    ((void (*)(void *))v15[2])(v15);
    goto LABEL_20;
  }
  v21 = v20;
  SecTrustSetNetworkFetchAllowed(v20, 1u);
  SecPolicyRef SSL = SecPolicyCreateSSL(1u, @"albert.apple.com");
  if (!SSL)
  {
    v30 = nr_daemon_log();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

    if (v31)
    {
      v27 = nr_daemon_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000F89F4();
      }
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  SecPolicyRef v23 = SSL;
  SecTrustSetPolicies(v21, SSL);
  CFRelease(v23);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051030;
  block[3] = &unk_100167830;
  v35 = v21;
  block[4] = self;
  v33 = v17;
  v34 = v15;
  dispatch_async((dispatch_queue_t)queue, block);

LABEL_20:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_registry, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end