@interface CloudLibraryConnection
- (CloudLibraryConnection)initWithConfiguration:(id)a3;
- (ICConnectionConfiguration)configuration;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (OS_dispatch_queue)queue;
- (int64_t)connectionState;
- (unsigned)databaseID;
- (void)_onQueue_sendRequest:(id)a3 withInternalResponseHandler:(id)a4;
- (void)connectWithCompletionHandler:(id)a3;
- (void)disconnect;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)setConfiguration:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CloudLibraryConnection

- (ICUserIdentity)userIdentity
{
  v2 = [(CloudLibraryConnection *)self configuration];
  v3 = [v2 userIdentity];

  return (ICUserIdentity *)v3;
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CloudLibraryConnection *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000058C8;
  block[3] = &unk_1001BEC98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (void)_onQueue_sendRequest:(id)a3 withInternalResponseHandler:(id)a4
{
  id v6 = a3;
  id v62 = a4;
  id v7 = [(ICConnectionConfiguration *)self->_configuration baseURL];
  v66 = [v6 requestURLForBaseURL:v7 sessionID:0];

  v8 = +[NSMutableURLRequest requestWithURL:v66];
  id v9 = [v6 bodyData];
  id v10 = [v9 length];

  if (v10)
  {
    [v8 setHTTPMethod:@"POST"];
    v11 = [v6 bodyData];
    [v8 setHTTPBody:v11];

    [v8 setValue:@"application/x-dmap-tagged" forHTTPHeaderField:@"Content-Type"];
  }
  id v12 = [(ICConnectionConfiguration *)self->_configuration buildIdentifier];
  [v8 setValue:v12 forHTTPHeaderField:@"Client-Cloud-Daap-Version"];

  id v13 = [(ICConnectionConfiguration *)self->_configuration purchaseClientIdentifier];
  [v8 setValue:v13 forHTTPHeaderField:@"Client-Cloud-Purchase-DAAP-Version"];

  v14 = [(ICConnectionConfiguration *)self->_configuration familyMemberStoreID];
  v15 = [v14 stringValue];
  [v8 setValue:v15 forHTTPHeaderField:@"X-FM-Dsid"];

  v16 = +[ICDeviceInfo currentDeviceInfo];
  v65 = [v16 deviceGUID];

  if ([v65 length]) {
    [v8 setValue:v65 forHTTPHeaderField:ICStoreHTTPHeaderKeyXGUID];
  }
  id v17 = [v6 reason];
  if (v17 || (id v17 = [(ICConnectionConfiguration *)self->_configuration requestReason]) != 0)
  {
    if (v17 == (id)1000)
    {
      uint64_t v18 = 2;
    }
    else if (v17 == (id)1001)
    {
      uint64_t v18 = 1;
    }
    else
    {
      uint64_t v18 = (uint64_t)v17;
    }
    v19 = +[NSString stringWithFormat:@"%li", v18];
    [v8 setValue:v19 forHTTPHeaderField:@"Client-Cloud-DAAP-Request-Reason"];
  }
  v64 = [v6 requestingBundleID];
  if ([v64 length]) {
    [v8 setValue:v64 forHTTPHeaderField:ICStoreHTTPHeaderKeyXAppleRequestingBundleID];
  }
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2050000000;
  v20 = (void *)qword_1001F39B0;
  uint64_t v79 = qword_1001F39B0;
  if (!qword_1001F39B0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000E81EC;
    CFStringRef v81 = (const __CFString *)&unk_1001BE9E8;
    *(void *)v82 = &v76;
    sub_1000E81EC((uint64_t)buf);
    v20 = (void *)v77[3];
  }
  id v21 = v20;
  _Block_object_dispose(&v76, 8);
  v63 = [v21 standardUserDefaults];
  v67 = [v63 isPrivateListeningEnabled];
  if (v67)
  {
    if ([v67 BOOLValue]) {
      CFStringRef v22 = @"true";
    }
    else {
      CFStringRef v22 = @"false";
    }
    [v8 setValue:v22 forHTTPHeaderField:ICStoreHTTPHeaderKeyXApplePrivateListening];
  }
  if (_os_feature_enabled_impl())
  {
    v23 = [v6 sagaClientFeaturesVersion];
    if ([(__CFString *)v23 length]) {
      CFStringRef v24 = v23;
    }
    else {
      CFStringRef v24 = &stru_1001BF9F0;
    }
    [v8 setValue:v24 forHTTPHeaderField:ICStoreHTTPHeaderKeyXDAAPClientFeaturesVersion];

    unsigned int v25 = 3;
  }
  else
  {
    unsigned int v25 = 1;
  }
  if (_os_feature_enabled_impl()) {
    v25 |= 8u;
  }
  if (_os_feature_enabled_impl()) {
    uint64_t quot = v25 | 0x10;
  }
  else {
    uint64_t quot = v25;
  }
  v27 = &v81;
  do
  {
    ldiv_t v28 = ldiv(quot, 10);
    uint64_t quot = v28.quot;
    if (v28.rem >= 0) {
      LOBYTE(v29) = v28.rem;
    }
    else {
      uint64_t v29 = -v28.rem;
    }
    *((unsigned char *)v27 - 1) = v29 + 48;
    v27 = (const __CFString **)((char *)v27 - 1);
  }
  while (v28.quot);
  v30 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)v27, (char *)&v81 - (char *)v27, 0x8000100u, 0);
  [v8 setValue:v30 forHTTPHeaderField:ICStoreHTTPHeaderKeyXDAAPSupportedFeatures];

  [v8 setTimeoutInterval:120.0];
  if (MSVDeviceOSIsInternalInstall())
  {
    if ([v6 includeCloudLibraryDAAPDebugFeature])
    {
      v31 = +[ICDefaults standardDefaults];
      unsigned int v32 = [v31 shouldForceServerToUseDAAPDebugFeatureAlwaysPerformResetSync];

      v33 = +[ICDefaults standardDefaults];
      unsigned int v34 = [v33 shouldForceServerToUseDAAPDebugFeatureAlwaysBackoff];

      uint64_t v35 = v34 ? v32 | 2 : v32;
      if (v35)
      {
        uint64_t v36 = v35;
        v37 = &v81;
        do
        {
          ldiv_t v38 = ldiv(v36, 10);
          uint64_t v36 = v38.quot;
          if (v38.rem >= 0) {
            LOBYTE(v39) = v38.rem;
          }
          else {
            uint64_t v39 = -v38.rem;
          }
          *((unsigned char *)v37 - 1) = v39 + 48;
          v37 = (const __CFString **)((char *)v37 - 1);
        }
        while (v38.quot);
        v40 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)v37, (char *)&v81 - (char *)v37, 0x8000100u, 0);
        [v8 setValue:v40 forHTTPHeaderField:ICStoreHTTPHeaderKeyXDAAPClientDebugFeatures];

        v41 = os_log_create("com.apple.amp.itunescloudd", "Connections");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v35;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Setting debugFeaturesValue=%d for header DAAP-debug-features", buf, 8u);
        }
      }
    }
    v42 = +[ICDefaults standardDefaults];
    [v42 clearShouldForceServerToUseDAAPDebugFeatures];
  }
  v43 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    if ([v6 method]) {
      CFStringRef v46 = @"POST";
    }
    else {
      CFStringRef v46 = @"GET";
    }
    v47 = [v6 action];
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v45;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    CFStringRef v81 = v46;
    *(_WORD *)v82 = 2114;
    *(void *)&v82[2] = v47;
    __int16 v83 = 2114;
    v84 = v66;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Sending request: <%{public}@: %p method=%{public}@ action=%{public}@> to URL: %{public}@", buf, 0x34u);
  }
  v48 = os_log_create("com.apple.amp.itunescloudd", "Connections_Oversize");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = [v8 allHTTPHeaderFields];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v49;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Request headers: %{public}@", buf, 0xCu);
  }
  id v50 = objc_alloc((Class)ICStoreRequestContext);
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100008DF4;
  v74[3] = &unk_1001BEB38;
  v74[4] = self;
  id v51 = v6;
  id v75 = v51;
  id v52 = [v50 initWithBlock:v74];
  id v53 = [objc_alloc((Class)ICStoreURLRequest) initWithURLRequest:v8 requestContext:v52];
  [v53 setCancelOnHTTPErrors:0];
  v54 = [v51 responseDataDestinationFileURL];
  if (v54)
  {
    v55 = os_log_create("com.apple.amp.itunescloudd", "Connections");
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v54;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Downloading response to: %{public}@", buf, 0xCu);
    }
  }
  v56 = +[ICURLSessionManager sharedSessionManager];
  v57 = [v56 sessionWithIdentifier:@"com.apple.itunescloudd.CloudLibraryConnection" creationBlock:&stru_1001BD820];

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10000A628;
  v68[3] = &unk_1001BD848;
  id v69 = v66;
  id v70 = v54;
  v72 = self;
  id v73 = v62;
  id v71 = v51;
  id v58 = v62;
  id v59 = v51;
  id v60 = v54;
  id v61 = v66;
  [v57 enqueueDataRequest:v53 withCompletionHandler:v68];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setQueue:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (unsigned)databaseID
{
  return self->_databaseID;
}

- (void)disconnect
{
  v3 = [(CloudLibraryConnection *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7934;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)connectWithCompletionHandler:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E7A58;
  v10[3] = &unk_1001BD898;
  id v11 = a3;
  id v4 = v11;
  v5 = objc_retainBlock(v10);
  id v6 = [(CloudLibraryConnection *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7B28;
  block[3] = &unk_1001BEC48;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (ICUserIdentityStore)userIdentityStore
{
  v2 = [(CloudLibraryConnection *)self configuration];
  v3 = [v2 userIdentityStore];

  return (ICUserIdentityStore *)v3;
}

- (CloudLibraryConnection)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CloudLibraryConnection;
  id v6 = [(CloudLibraryConnection *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunescloudd.CloudLibraryConnection.serial", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

@end