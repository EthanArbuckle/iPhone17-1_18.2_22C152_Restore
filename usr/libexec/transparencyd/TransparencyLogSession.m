@interface TransparencyLogSession
+ (BOOL)enablePinning;
+ (id)createErrorFromURLResonse:(id)a3 data:(id)a4 allowEmptyData:(BOOL)a5 error:(id)a6;
+ (void)dispatchToQueue:(id)a3 block:(id)a4;
- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6;
- (NSURLSession)backgroundSession;
- (NSURLSession)foregroundSession;
- (OS_dispatch_workloop)callbackWorkloop;
- (OS_dispatch_workloop)networkingWorkloop;
- (TransparencyAuthentication)auth;
- (TransparencyLogSession)initWithWorkloop:(id)a3 sessionDelegate:(id)a4;
- (TransparencyLogSessionDelegate)delegate;
- (id)createAuthenticatedBackgroundSession:(id)a3 delegateQueue:(id)a4;
- (id)createAuthenticatedForegroundSession;
- (unint64_t)fetchCount;
- (void)setAuth:(id)a3;
- (void)setBackgroundSession:(id)a3;
- (void)setCallbackWorkloop:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchCount:(unint64_t)a3;
- (void)setForegroundSession:(id)a3;
- (void)setNetworkingWorkloop:(id)a3;
@end

@implementation TransparencyLogSession

- (TransparencyLogSession)initWithWorkloop:(id)a3 sessionDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TransparencyLogSession;
  v8 = [(TransparencyLogSession *)&v15 init];
  v9 = v8;
  if (v8)
  {
    [(TransparencyLogSession *)v8 setCallbackWorkloop:v6];
    dispatch_workloop_t v10 = dispatch_workloop_create("com.apple.transparencyd.networking");
    [(TransparencyLogSession *)v9 setNetworkingWorkloop:v10];

    [(TransparencyLogSession *)v9 setDelegate:v7];
    v11 = [TransparencyAuthentication alloc];
    v12 = [(TransparencyLogSession *)v9 networkingWorkloop];
    v13 = [(TransparencyAuthentication *)v11 initWithWorkloop:v12];
    [(TransparencyLogSession *)v9 setAuth:v13];
  }
  return v9;
}

+ (BOOL)enablePinning
{
  if (qword_10032F3D0 != -1) {
    dispatch_once(&qword_10032F3D0, &stru_1002CA120);
  }
  return (byte_10032F3C8 & 1) == 0;
}

- (id)createAuthenticatedBackgroundSession:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.apple.transparencyd"];
  [v8 setDiscretionary:1];
  if (+[TransparencyLogSession enablePinning]) {
    [v8 set_tlsTrustPinningPolicyName:kSecPolicyNameAppleIDSService];
  }
  v18 = off_1003264E8;
  v9 = +[TransparencySettings deviceUserAgent];
  v19 = v9;
  dispatch_workloop_t v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v11 = [v10 mutableCopy];

  v12 = +[TransparencySettings automatedDeviceGroup];
  [v11 setObject:v12 forKeyedSubscript:off_100326508];

  uint64_t v13 = +[TransparencySettings transparencyVersionStr];
  [v11 setObject:v13 forKeyedSubscript:off_100326510];

  [v8 setHTTPAdditionalHeaders:v11];
  [v8 setTimeoutIntervalForResource:(double)kTransparencyMaxmimumDownloadRecordLifetime];
  [v8 setHTTPCookieStorage:0];
  [v8 setURLCache:0];
  [v8 set_alternativeServicesStorage:0];
  v14 = [(TransparencyLogSession *)self auth];
  LOBYTE(v13) = [v14 isSupported];

  if ((v13 & 1) == 0)
  {
    objc_super v15 = +[TransparencyAccount createAuthkitSession];
    [v8 set_appleIDContext:v15];
  }
  v16 = +[NSURLSession sessionWithConfiguration:v8 delegate:v6 delegateQueue:v7];

  return v16;
}

- (id)createAuthenticatedForegroundSession
{
  v3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  [v3 setDiscretionary:0];
  if (+[TransparencyLogSession enablePinning]) {
    [v3 set_tlsTrustPinningPolicyName:kSecPolicyNameAppleIDSService];
  }
  v16 = off_1003264E8;
  v4 = +[TransparencySettings deviceUserAgent];
  v17 = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v6 = [(id)v5 mutableCopy];

  id v7 = +[TransparencySettings automatedDeviceGroup];
  [v6 setObject:v7 forKeyedSubscript:off_100326508];

  v8 = +[TransparencySettings transparencyVersionStr];
  [v6 setObject:v8 forKeyedSubscript:off_100326510];

  [v3 setHTTPAdditionalHeaders:v6];
  [v3 setHTTPCookieStorage:0];
  [v3 setURLCache:0];
  [v3 set_alternativeServicesStorage:];
  v9 = [(TransparencyLogSession *)self auth];
  LOBYTE(v5) = [v9 isSupported];

  if ((v5 & 1) == 0)
  {
    dispatch_workloop_t v10 = +[TransparencyAccount createAuthkitSession];
    [v3 set_appleIDContext:v10];
  }
  id v11 = objc_alloc_init((Class)NSOperationQueue);
  v12 = [(TransparencyLogSession *)self backgroundSession];

  if (v12) {
    [(TransparencyLogSession *)self networkingWorkloop];
  }
  else {
  uint64_t v13 = [(TransparencyLogSession *)self callbackWorkloop];
  }
  [v11 setUnderlyingQueue:v13];

  v14 = +[NSURLSession sessionWithConfiguration:v3 delegate:0 delegateQueue:v11];

  return v14;
}

+ (id)createErrorFromURLResonse:(id)a3 data:(id)a4 allowEmptyData:(BOOL)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v9 requiresAuthorization])
  {
    id v12 = +[TransparencyError errorWithDomain:kTransparencyErrorNetwork code:-174 underlyingError:v11 description:@"HTTP request requires authorization code (401)"];
    if (qword_10032F3D8 != -1) {
      dispatch_once(&qword_10032F3D8, &stru_1002CA140);
    }
    uint64_t v13 = qword_10032F3E0;
    if (os_log_type_enabled((os_log_t)qword_10032F3E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "HTTP request requires authorization code (401)";
LABEL_6:
      objc_super v15 = v13;
      uint32_t v16 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    }
  }
  else if ([v9 successful])
  {
    if (v11)
    {
      id v12 = v11;
      goto LABEL_17;
    }
    if (a5 || v10 && [v10 length])
    {
      id v12 = 0;
    }
    else
    {
      id v12 = +[TransparencyError errorWithDomain:kTransparencyErrorNetwork code:-145 underlyingError:0 description:@"HTTP response contains nil or empty data"];
      if (qword_10032F3D8 != -1) {
        dispatch_once(&qword_10032F3D8, &stru_1002CA180);
      }
      uint64_t v13 = qword_10032F3E0;
      if (os_log_type_enabled((os_log_t)qword_10032F3E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v14 = "HTTP response contains nil or empty data";
        goto LABEL_6;
      }
    }
  }
  else
  {
    id v12 = v11;
    if (!v12)
    {
      +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorNetwork, [v9 responseCode], @"Unsuccessful HTTP response code: %llu", [v9 responseCode]);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (qword_10032F3D8 != -1) {
      dispatch_once(&qword_10032F3D8, &stru_1002CA160);
    }
    uint64_t v17 = qword_10032F3E0;
    if (os_log_type_enabled((os_log_t)qword_10032F3E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      v14 = "Unsuccessful HTTP response: %@";
      objc_super v15 = v17;
      uint32_t v16 = 12;
      goto LABEL_16;
    }
  }
LABEL_17:

  return v12;
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = self;
  objc_sync_enter(v12);
  uint64_t v13 = [(TransparencyLogSession *)v12 foregroundSession];

  if (!v13)
  {
    v14 = [(TransparencyLogSession *)v12 createAuthenticatedForegroundSession];
    [(TransparencyLogSession *)v12 setForegroundSession:v14];
  }
  objc_sync_exit(v12);

  [(TransparencyLogSession *)v12 setFetchCount:(char *)[(TransparencyLogSession *)v12 fetchCount] + 1];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_10020DAD0;
  v31[4] = sub_10020DAE0;
  id v32 = 0;
  id v32 = (id)os_transaction_create();
  objc_super v15 = [(TransparencyLogSession *)v12 foregroundSession];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_10020DAE8;
  v26 = &unk_1002CA1D0;
  BOOL v30 = a4;
  v27 = v12;
  id v16 = v11;
  id v28 = v16;
  v29 = v31;
  uint64_t v17 = [v15 dataTaskWithRequest:v10 completionHandler:&v23];

  v18 = [v10 kt_requestId:v23, v24, v25, v26, v27];
  v19 = [v18 UUIDString];
  [v17 setTaskDescription:v19];

  if (v7) {
    [v17 set_APSRelayTopic:@"com.apple.private.alloy.kt.webtunnel"];
  }
  [v17 resume];
  if (qword_10032F3D8 != -1) {
    dispatch_once(&qword_10032F3D8, &stru_1002CA1F0);
  }
  id v20 = (id)qword_10032F3E0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [v10 kt_requestId];
    *(_DWORD *)buf = 138543362;
    v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting fetch for fetchId %{public}@", buf, 0xCu);
  }
  _Block_object_dispose(v31, 8);

  return 1;
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5
{
  return [(TransparencyLogSession *)self fetch:a3 allowEmptyData:a4 useReversePush:0 completionHandler:a5];
}

+ (void)dispatchToQueue:(id)a3 block:(id)a4
{
  uint64_t v5 = a3;
  id v6 = (void (**)(void))a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10020DAD0;
  objc_super v15 = sub_10020DAE0;
  id v16 = 0;
  id v16 = (id)os_transaction_create();
  if (+[TransparencySettings getBool:kTransparencyFlagSwitchAsyncToSync])
  {
    v6[2](v6);
    BOOL v7 = (void *)v12[5];
    v12[5] = 0;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10020DE7C;
    v8[3] = &unk_1002BB190;
    id v9 = v6;
    id v10 = &v11;
    dispatch_async(v5, v8);
    BOOL v7 = v9;
  }

  _Block_object_dispose(&v11, 8);
}

- (unint64_t)fetchCount
{
  return self->_fetchCount;
}

- (void)setFetchCount:(unint64_t)a3
{
  self->_fetchCount = a3;
}

- (TransparencyLogSessionDelegate)delegate
{
  return (TransparencyLogSessionDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (TransparencyAuthentication)auth
{
  return (TransparencyAuthentication *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuth:(id)a3
{
}

- (NSURLSession)backgroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBackgroundSession:(id)a3
{
}

- (NSURLSession)foregroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setForegroundSession:(id)a3
{
}

- (OS_dispatch_workloop)callbackWorkloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCallbackWorkloop:(id)a3
{
}

- (OS_dispatch_workloop)networkingWorkloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetworkingWorkloop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkingWorkloop, 0);
  objc_storeStrong((id *)&self->_callbackWorkloop, 0);
  objc_storeStrong((id *)&self->_foregroundSession, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_auth, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end