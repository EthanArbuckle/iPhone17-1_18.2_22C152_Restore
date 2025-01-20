@interface NRGCompanionDaemon
+ (id)sharedInstance;
- (BOOL)handleFullSyncResponseForIdentifier:(id)a3 error:(id)a4;
- (BOOL)handleFullSyncResponseForIdentifier:(id)a3 responseURL:(id)a4 error:(id)a5;
- (BOOL)queueFullSyncRequestOperation:(id)a3;
- (NRGCompanionDaemon)init;
- (NRGIconVersionTracker)iconVersionTracker;
- (NSMutableArray)appViewListImageResponseHandlers;
- (NSOperationQueue)syncOperationQueue;
- (NSString)fullSyncIdentifier;
- (PCPersistentTimer)appViewListImageTimer;
- (PCPersistentTimer)fullSyncTimer;
- (_opaque_pthread_mutex_t)lock;
- (id)fullSyncResponseHandler;
- (id)requestUnsuccessfulError;
- (int64_t)_appViewListImageAddResponseHandler:(id)a3;
- (void)_appViewListImageHandleResponse:(id)a3 error:(id)a4;
- (void)_appViewListImageRequestTimedOut:(id)a3;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)devicePaired;
- (void)deviceSwitched;
- (void)fullSyncRequestTimedOut:(id)a3;
- (void)handleFullSyncResponse:(id)a3;
- (void)handleResourceResponse:(id)a3;
- (void)iconVersionTracker:(id)a3 detectedOutOfDateIcons:(id)a4;
- (void)iconVersionTracker:(id)a3 detectedUnusedIcons:(id)a4;
- (void)pairedSyncInProgress;
- (void)sendFullSyncRequest:(id)a3 requestHandler:(id)a4 responseHandler:(id)a5;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setAppViewListImageResponseHandlers:(id)a3;
- (void)setAppViewListImageTimer:(id)a3;
- (void)setFullSyncIdentifier:(id)a3;
- (void)setFullSyncResponseHandler:(id)a3;
- (void)setFullSyncTimer:(id)a3;
- (void)setIconVersionTracker:(id)a3;
- (void)setLock:(_opaque_pthread_mutex_t *)a3;
- (void)setSyncOperationQueue:(id)a3;
- (void)start;
- (void)xpcGetAppViewListImage:(CGSize)a3 scale:(double)a4 reply:(id)a5;
@end

@implementation NRGCompanionDaemon

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C600;
  block[3] = &unk_100020900;
  block[4] = a1;
  if (qword_1000288F8 != -1) {
    dispatch_once(&qword_1000288F8, block);
  }
  v2 = (void *)qword_1000288F0;

  return v2;
}

- (NRGCompanionDaemon)init
{
  v21.receiver = self;
  v21.super_class = (Class)NRGCompanionDaemon;
  v2 = [(NRGDaemon *)&v21 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    objc_initWeak(&location, v3);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000C924;
    v18[3] = &unk_100020928;
    objc_copyWeak(&v19, &location);
    v4 = objc_retainBlock(v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C980;
    v16[3] = &unk_100020928;
    objc_copyWeak(&v17, &location);
    v5 = objc_retainBlock(v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000C9DC;
    v14[3] = &unk_100020928;
    objc_copyWeak(&v15, &location);
    v6 = objc_retainBlock(v14);
    v22[0] = &off_100021830;
    v7 = objc_retainBlock(v4);
    v23[0] = v7;
    v22[1] = &off_100021848;
    v8 = objc_retainBlock(v5);
    v23[1] = v8;
    v22[2] = &off_100021860;
    v9 = objc_retainBlock(v6);
    v23[2] = v9;
    v10 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    [(NRGDaemon *)v3 setProtobufResponseHandlers:v10];

    v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    syncOperationQueue = v3->_syncOperationQueue;
    v3->_syncOperationQueue = v11;

    [(NSOperationQueue *)v3->_syncOperationQueue setMaxConcurrentOperationCount:1];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)NRGCompanionDaemon;
  [(NRGDaemon *)&v3 dealloc];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  pthread_mutex_lock(p_lock);
  v4[2](v4);

  pthread_mutex_unlock(p_lock);
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)NRGCompanionDaemon;
  [(NRGDaemon *)&v5 start];
  objc_super v3 = [[NRGIconVersionTracker alloc] initWithDelegate:self];
  iconVersionTracker = self->_iconVersionTracker;
  self->_iconVersionTracker = v3;
}

- (void)pairedSyncInProgress
{
}

- (void)devicePaired
{
}

- (void)deviceSwitched
{
}

- (BOOL)queueFullSyncRequestOperation:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000CD24;
  v6[3] = &unk_100020950;
  v7 = self;
  id v3 = a3;
  id v8 = v3;
  v9 = &v10;
  [(NRGCompanionDaemon *)v7 _withLock:v6];
  char v4 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)handleResourceResponse:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 context];
  v6 = [v5 incomingResponseIdentifier];

  v7 = [(NRGDaemon *)self getResourceRequest:v6];
  if (v7)
  {
    id v8 = [NRGPBResourceResponse alloc];
    v9 = [v4 data];
    uint64_t v10 = [(NRGPBResourceResponse *)v8 initWithData:v9];

    [v7 handleResponse:v10];
  }
  else
  {
    uint64_t v10 = nrg_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000150FC();
    }
  }
}

- (void)handleFullSyncResponse:(id)a3
{
  id v3 = a3;
  id v4 = nrg_daemon_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received full sync response", buf, 2u);
  }

  objc_super v5 = [NRGPBFullSyncResponse alloc];
  v6 = [v3 data];
  v7 = [(NRGPBFullSyncResponse *)v5 initWithData:v6];

  id v8 = nrg_daemon_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[NSNumber numberWithUnsignedInteger:[(NRGPBFullSyncResponse *)v7 iconsCount]];
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "full sync returned %{public}@ icons (with variants)", buf, 0xCu);
  }
  v27 = NRGGetActivePairedDeviceStorePath();
  if ([(NRGPBFullSyncResponse *)v7 iconsCount])
  {
    id v26 = v3;
    unint64_t v10 = 0;
    do
    {
      uint64_t v12 = [(NRGPBFullSyncResponse *)v7 iconsAtIndex:v10];
      char v13 = nrg_daemon_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = +[NSNumber numberWithInt:v10];
        id v15 = [v12 bundleID];
        v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 iconVariant]);
        id v17 = [v12 iconData];
        v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 length]);
        *(_DWORD *)buf = 138413058;
        v30 = v14;
        __int16 v31 = 2112;
        v32 = v15;
        __int16 v33 = 2112;
        v34 = v16;
        __int16 v35 = 2112;
        v36 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "icon at index %@ is %@ (%@) length %@", buf, 0x2Au);
      }
      iconVersionTracker = self->_iconVersionTracker;
      v20 = [v12 version];
      objc_super v21 = [v12 bundleID];
      [(NRGIconVersionTracker *)iconVersionTracker setVersion:v20 forBundleID:v21];

      v22 = [v12 iconData];
      id v23 = [v12 iconVariant];
      v24 = [v12 bundleID];
      +[NRGResourceCache setIcon:v22 forIconVariant:v23 inBundleID:v24 withPairedDeviceStorePath:v27];

      ++v10;
    }
    while ([(NRGPBFullSyncResponse *)v7 iconsCount] > v10);
    id v3 = v26;
  }
  [(NRGIconVersionTracker *)self->_iconVersionTracker commit];
  v25 = [(NRGCompanionDaemon *)self fullSyncIdentifier];
  [(NRGCompanionDaemon *)self handleFullSyncResponseForIdentifier:v25 error:0];
}

- (BOOL)handleFullSyncResponseForIdentifier:(id)a3 error:(id)a4
{
  return [(NRGCompanionDaemon *)self handleFullSyncResponseForIdentifier:a3 responseURL:0 error:a4];
}

- (BOOL)handleFullSyncResponseForIdentifier:(id)a3 responseURL:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10000D620;
  v28 = sub_10000D64C;
  id v29 = 0;
  v11 = nrg_daemon_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    fullSyncIdentifier = self->_fullSyncIdentifier;
    *(_DWORD *)buf = 138412802;
    id v35 = v8;
    __int16 v36 = 2112;
    v37 = fullSyncIdentifier;
    __int16 v38 = 2112;
    id v39 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "identifier = %@, fullSyncIdentifier = %@, error =%@", buf, 0x20u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000D654;
  v20[3] = &unk_100020978;
  v20[4] = self;
  id v13 = v8;
  id v21 = v13;
  v22 = &v30;
  id v23 = &v24;
  [(NRGCompanionDaemon *)self _withLock:v20];
  v14 = nrg_daemon_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = self->_fullSyncIdentifier;
    id v16 = objc_retainBlock((id)v25[5]);
    *(_DWORD *)buf = 138413058;
    id v35 = v13;
    __int16 v36 = 2112;
    v37 = v15;
    __int16 v38 = 2112;
    id v39 = v16;
    __int16 v40 = 2112;
    id v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "identifier = %@, fullSyncIdentifier = %@, handler = %@, error = %@", buf, 0x2Au);
  }
  if (*((unsigned char *)v31 + 24))
  {
    uint64_t v17 = v25[5];
    if (v17)
    {
      (*(void (**)(uint64_t, id, id, NRGIconVersionTracker *, id))(v17 + 16))(v17, v13, v9, self->_iconVersionTracker, v10);
      BOOL v18 = *((unsigned char *)v31 + 24) != 0;
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (id)requestUnsuccessfulError
{
  return +[NSError errorWithDomain:@"com.apple.NanoResourceGrabber" code:1 userInfo:&off_1000218D8];
}

- (void)sendFullSyncRequest:(id)a3 requestHandler:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a4;
  id v10 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000DB90;
  v24[3] = &unk_1000209A0;
  v24[4] = self;
  v24[5] = &v25;
  [(NRGCompanionDaemon *)self _withLock:v24];
  if (*((unsigned char *)v26 + 24))
  {
    v11 = nrg_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sending sync request %@", (uint8_t *)&buf, 0xCu);
    }

    objc_initWeak(&location, self);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000;
    __int16 v31 = sub_10000DBFC;
    uint64_t v32 = sub_10000DC0C;
    id v33 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000DC14;
    v19[3] = &unk_1000209C8;
    objc_copyWeak(&v22, &location);
    p_long long buf = &buf;
    id v12 = v10;
    v19[4] = self;
    id v20 = v12;
    uint64_t v13 = [(NRGDaemon *)self sendProtobufRequest:v8 type:2 priority:200 expectsResponse:1 requestHandler:v9 errorHandler:v19 withTimeout:180.0];
    v14 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v13;

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000DD44;
      v16[3] = &unk_1000209F0;
      BOOL v18 = &buf;
      void v16[4] = self;
      id v17 = v12;
      [(NRGCompanionDaemon *)self _withLock:v16];
    }
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = [(NRGCompanionDaemon *)self requestUnsuccessfulError];
    v9[2](v9, 0, v15);
  }
  _Block_object_dispose(&v25, 8);
}

- (void)fullSyncRequestTimedOut:(id)a3
{
  id v4 = a3;
  objc_super v5 = nrg_daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000151A8();
  }

  v6 = [v4 userInfo];
  v7 = +[NSString stringWithFormat:@"No response received from full sync request %@", v6];
  id v8 = +[NRGFullSyncError errorWithCode:2 description:v7];
  [(NRGCompanionDaemon *)self handleFullSyncResponseForIdentifier:v6 error:v8];
}

- (void)iconVersionTracker:(id)a3 detectedOutOfDateIcons:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    v6 = nrg_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "building request to retrieve out of date icons", buf, 2u);
    }

    v7 = objc_opt_new();
    id v8 = +[NanoResourceGrabber nrgIconVariants];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000E1DC;
    v17[3] = &unk_100020A18;
    id v9 = v7;
    id v18 = v9;
    [v8 enumerateObjectsUsingBlock:v17];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E21C;
    v15[3] = &unk_100020630;
    id v10 = v9;
    id v16 = v10;
    [v5 enumerateObjectsUsingBlock:v15];
    v11 = [[NRGFullSyncRequestOperation alloc] initWithRequest:v10];
    [(NRGFullSyncRequestOperation *)v11 setDaemon:self];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000E228;
    v13[3] = &unk_1000208B8;
    id v14 = v10;
    id v12 = v10;
    [(NRGFullSyncRequestOperation *)v11 setRequestSentHandler:v13];
    [(NRGFullSyncRequestOperation *)v11 setCompletionHandler:&stru_100020A38];
    [(NRGCompanionDaemon *)self queueFullSyncRequestOperation:v11];
  }
}

- (void)iconVersionTracker:(id)a3 detectedUnusedIcons:(id)a4
{
  id v4 = a4;
  NRGGetActivePairedDeviceStorePath();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E438;
  v6[3] = &unk_100020630;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  [v4 enumerateObjectsUsingBlock:v6];
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a8;
  id v14 = nrg_daemon_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "received resource %@ %@", (uint8_t *)&v16, 0x16u);
  }

  id v15 = [v13 incomingResponseIdentifier];

  [(NRGCompanionDaemon *)self handleFullSyncResponseForIdentifier:v15 responseURL:v11 error:0];
}

- (void)xpcGetAppViewListImage:(CGSize)a3 scale:(double)a4 reply:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  id v10 = objc_alloc_init(NRGPBAppViewListImageRequest);
  *(float *)&double v11 = width;
  [(NRGPBAppViewListImageRequest *)v10 setWidth:v11];
  *(float *)&double v12 = height;
  [(NRGPBAppViewListImageRequest *)v10 setHeight:v12];
  *(float *)&double v13 = a4;
  [(NRGPBAppViewListImageRequest *)v10 setScale:v13];
  id v14 = nrg_daemon_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "xpcGetAppViewList sending %@", buf, 0xCu);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000E830;
  v24[3] = &unk_100020A60;
  id v15 = v9;
  id v25 = v15;
  int v16 = objc_retainBlock(v24);
  if ((id)[(NRGCompanionDaemon *)self _appViewListImageAddResponseHandler:v16] == (id)1)
  {
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000E840;
    v21[3] = &unk_100020A88;
    objc_copyWeak(&v22, &location);
    id v17 = objc_retainBlock(v21);
    __int16 v18 = nrg_daemon_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sending app view list image request %@", buf, 0xCu);
    }

    v20.receiver = self;
    v20.super_class = (Class)NRGCompanionDaemon;
    id v19 = [(NRGDaemon *)&v20 sendProtobufRequest:v10 type:(unsigned __int16)[(NRGPBAppViewListImageRequest *)v10 requestTypeCode] priority:200 expectsResponse:1 requestHandler:v17 errorHandler:0 withTimeout:30.0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (int64_t)_appViewListImageAddResponseHandler:(id)a3
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E9BC;
  v6[3] = &unk_100020AB0;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  id v9 = &v10;
  [(NRGCompanionDaemon *)v7 _withLock:v6];
  int64_t v4 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)_appViewListImageRequestTimedOut:(id)a3
{
  id v4 = a3;
  id v5 = nrg_daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000151A8();
  }

  v6 = +[NRGError errorWithCode:4];
  [(NRGCompanionDaemon *)self _appViewListImageHandleResponse:0 error:v6];
}

- (void)_appViewListImageHandleResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_10000DBFC;
  uint64_t v26 = sub_10000DC0C;
  id v27 = 0;
  id v8 = nrg_daemon_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)id v29 = v6;
    *(_WORD *)&v29[8] = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "handleAppViewListImageResponse:%@ error %@", buf, 0x16u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000EFF8;
  v21[3] = &unk_1000209A0;
  void v21[4] = self;
  v21[5] = &v22;
  [(NRGCompanionDaemon *)self _withLock:v21];
  if (v23[5])
  {
    id v9 = nrg_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unsigned int v10 = [v6 hasImageData];
      double v11 = [v6 imageData];
      unsigned int v12 = [v11 length];
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)id v29 = v10;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "hasImageData %{BOOL}u, imageData length %d", buf, 0xEu);
    }
    if ([v6 hasImageData])
    {
      uint64_t v13 = [v6 imageData];
    }
    else
    {
      if (!v7)
      {
        id v7 = +[NRGError errorWithCode:6];
      }
      uint64_t v13 = 0;
    }
    id v15 = nrg_daemon_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = (void *)v23[5];
      *(_DWORD *)long long buf = 138412802;
      *(void *)id v29 = v6;
      *(_WORD *)&v29[8] = 2112;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "response = %@, handlers = %@, error = %@", buf, 0x20u);
    }

    id v17 = (void *)v23[5];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000F090;
    v18[3] = &unk_100020AD8;
    id v14 = v13;
    id v19 = v14;
    id v7 = v7;
    id v20 = v7;
    [v17 enumerateObjectsUsingBlock:v18];
  }
  else
  {
    id v14 = nrg_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100015348();
    }
  }

  _Block_object_dispose(&v22, 8);
}

- (_opaque_pthread_mutex_t)lock
{
  long long v3 = *(_OWORD *)&self[2].__opaque[16];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)self[2].__opaque;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[2].__opaque[48];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[2].__opaque[32];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__opaque[40];
  long long v5 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  *(_OWORD *)&self->_lock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = v3;
  *(_OWORD *)&self->_lock.__sig = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
}

- (id)fullSyncResponseHandler
{
  return self->_fullSyncResponseHandler;
}

- (void)setFullSyncResponseHandler:(id)a3
{
}

- (NSString)fullSyncIdentifier
{
  return self->_fullSyncIdentifier;
}

- (void)setFullSyncIdentifier:(id)a3
{
}

- (PCPersistentTimer)fullSyncTimer
{
  return self->_fullSyncTimer;
}

- (void)setFullSyncTimer:(id)a3
{
}

- (NSMutableArray)appViewListImageResponseHandlers
{
  return self->_appViewListImageResponseHandlers;
}

- (void)setAppViewListImageResponseHandlers:(id)a3
{
}

- (PCPersistentTimer)appViewListImageTimer
{
  return self->_appViewListImageTimer;
}

- (void)setAppViewListImageTimer:(id)a3
{
}

- (NRGIconVersionTracker)iconVersionTracker
{
  return self->_iconVersionTracker;
}

- (void)setIconVersionTracker:(id)a3
{
}

- (NSOperationQueue)syncOperationQueue
{
  return self->_syncOperationQueue;
}

- (void)setSyncOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncOperationQueue, 0);
  objc_storeStrong((id *)&self->_iconVersionTracker, 0);
  objc_storeStrong((id *)&self->_appViewListImageTimer, 0);
  objc_storeStrong((id *)&self->_appViewListImageResponseHandlers, 0);
  objc_storeStrong((id *)&self->_fullSyncTimer, 0);
  objc_storeStrong((id *)&self->_fullSyncIdentifier, 0);

  objc_storeStrong(&self->_fullSyncResponseHandler, 0);
}

@end