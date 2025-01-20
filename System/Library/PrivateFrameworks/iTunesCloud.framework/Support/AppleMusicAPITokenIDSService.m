@interface AppleMusicAPITokenIDSService
+ (AppleMusicAPITokenIDSService)sharedService;
- (id)_init;
- (void)_performTokenRequest:(id)a3 completionHandler:(id)a4;
- (void)_start;
- (void)_stop;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)start;
- (void)stop;
@end

@implementation AppleMusicAPITokenIDSService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_stop
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  [(IDSService *)self->_service removeDelegate:self];
  v3 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    serviceName = self->_serviceName;
    int v5 = 138543618;
    v6 = self;
    __int16 v7 = 2114;
    v8 = serviceName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ Stopped IDS service with name %{public}@.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  [(IDSService *)self->_service addDelegate:self queue:self->_accessQueue];
  v3 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    serviceName = self->_serviceName;
    int v5 = 138543618;
    v6 = self;
    __int16 v7 = 2114;
    v8 = serviceName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ Started IDS service with name %{public}@.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_performTokenRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  uint64_t v9 = [v6 clientIdentifier];
  uint64_t v10 = [v6 clientVersion];
  if (v9 | v10)
  {
    v11 = (void *)v10;
  }
  else
  {
    v12 = +[ICClientInfo _clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:v8];
    uint64_t v9 = [v12 clientIdentifier];
    v11 = [v12 clientVersion];
    v13 = os_log_create("com.apple.amp.itunescloudd", "Connections");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v34 = self;
      __int16 v35 = 2114;
      uint64_t v36 = v9;
      __int16 v37 = 2114;
      id v38 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@ No client identifier or version was specified in the ICAppleMusicAPITokenRequest instance. Falling back to default client identifier for daemon: %{public}@/%{public}@.", buf, 0x20u);
    }
  }
  v14 = +[ICMutableClientInfo clientInfoForMusicKitRequestWithClientIdentifier:v9 clientVersion:v11 bundleIdentifier:v8];
  v15 = [v6 bagProfile];
  [v14 setBagProfile:v15];

  v16 = [v6 bagProfileVersion];
  [v14 setBagProfileVersion:v16];

  id v17 = [v14 copy];
  v18 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v34 = self;
    __int16 v35 = 2114;
    uint64_t v36 = (uint64_t)v6;
    __int16 v37 = 2114;
    id v38 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@ Performing token request %{public}@ and %{public}@.", buf, 0x20u);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100109074;
  v30[3] = &unk_1001BE370;
  v30[4] = self;
  id v19 = v6;
  id v31 = v19;
  id v32 = v7;
  id v20 = v7;
  v21 = objc_retainBlock(v30);
  id v22 = objc_msgSend(objc_alloc((Class)ICDeveloperTokenFetchRequest), "initWithClientInfo:options:", v17, objc_msgSend(v19, "shouldIgnoreDeveloperTokenCache"));
  [v22 setClientType:0];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001091F4;
  v26[3] = &unk_1001BE3C0;
  v26[4] = self;
  id v27 = v19;
  id v28 = v17;
  id v29 = v21;
  id v23 = v17;
  id v24 = v19;
  v25 = v21;
  [v22 performRequestWithResponseHandler:v26];
}

- (void)stop
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010958C;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)start
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109608;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  unsigned int v11 = [v9 type];
  v12 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v13 = "requestTokens";
    id v19 = self;
    __int16 v20 = 2048;
    if (v11 != 1000) {
      v13 = 0;
    }
    uint64_t v21 = v11;
    __int16 v22 = 2082;
    id v23 = v13;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ Received IDS message %lu:'%{public}s' from ID %{public}@", buf, 0x2Au);
  }

  if (v11 == 1000)
  {
    v14 = [ICAppleMusicAPITokenRequest alloc];
    v15 = [v9 data];
    v16 = [(ICAppleMusicAPITokenRequest *)v14 initWithData:v15];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100109854;
    v17[3] = &unk_1001BE348;
    v17[4] = self;
    [(AppleMusicAPITokenIDSService *)self _performTokenRequest:v16 completionHandler:v17];
  }
  else
  {
    v16 = os_log_create("com.apple.amp.itunescloudd", "Connections");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      id v19 = self;
      __int16 v20 = 2048;
      uint64_t v21 = v11;
      __int16 v22 = 2082;
      id v23 = 0;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@ Received IDS message of unknown type %lu:'%{public}s' from ID %{public}@", buf, 0x2Au);
    }
  }
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109B58;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)AppleMusicAPITokenIDSService;
  [(AppleMusicAPITokenIDSService *)&v4 dealloc];
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)AppleMusicAPITokenIDSService;
  v2 = [(AppleMusicAPITokenIDSService *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.AppleMusicAPITokenIDSService.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSString stringWithUTF8String:"com.apple.private.alloy.itunescloudd"];
    serviceName = v2->_serviceName;
    v2->_serviceName = (NSString *)v5;

    id v7 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:v2->_serviceName];
    service = v2->_service;
    v2->_service = v7;
  }
  return v2;
}

+ (AppleMusicAPITokenIDSService)sharedService
{
  if (qword_1001F3A50 != -1) {
    dispatch_once(&qword_1001F3A50, &stru_1001BE320);
  }
  v2 = (void *)qword_1001F3A48;

  return (AppleMusicAPITokenIDSService *)v2;
}

@end