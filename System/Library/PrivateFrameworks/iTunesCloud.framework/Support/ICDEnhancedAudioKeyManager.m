@interface ICDEnhancedAudioKeyManager
- (ICDEnhancedAudioKeyManager)init;
- (id)_storeRequestContext;
- (void)_fetchSharedKeysForcingRefresh:(BOOL)a3;
- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6;
- (void)fetchMissingOfflineKeys;
- (void)processPendingKeyInvalidations;
- (void)refreshSharedKeys;
@end

@implementation ICDEnhancedAudioKeyManager

- (void).cxx_destruct
{
}

- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12 && [v12 bulkRefreshWaitInterval])
  {
    v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543874;
      v16 = self;
      __int16 v17 = 2048;
      id v18 = [v12 bulkRefreshWaitInterval];
      __int16 v19 = 2114;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@ Received wait interval %lu in response to key %{public}@ - cancelling remaining key requests", (uint8_t *)&v15, 0x20u);
    }

    [(NSOperationQueue *)self->_hlsKeyRefreshOperationQueue cancelAllOperations];
  }
}

- (void)_fetchSharedKeysForcingRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching shared key. forceRefresh = %{BOOL}u", buf, 0x12u);
  }

  v6 = [(ICDEnhancedAudioKeyManager *)self _storeRequestContext];
  v7 = +[ICURLBagProvider sharedBagProvider];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CC81C;
  v9[3] = &unk_1001BCFF0;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = v3;
  id v8 = v6;
  [v7 getBagForRequestContext:v8 forceRefetch:0 withCompletionHandler:v9];
}

- (id)_storeRequestContext
{
  id v2 = [objc_alloc((Class)ICStoreRequestContext) initWithBlock:&stru_1001BCFA0];

  return v2;
}

- (void)processPendingKeyInvalidations
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000CCDD8;
  v4[3] = &unk_1001BDF98;
  v4[4] = self;
  id v3 = [objc_alloc((Class)ICAsyncBlockOperation) initWithStartHandler:v4];
  [(NSOperationQueue *)self->_hlsKeyRefreshOperationQueue addOperation:v3];
}

- (void)fetchMissingOfflineKeys
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching missing offline keys for downloads", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v4 = +[NSMutableDictionary dictionary];
  +[ML3MusicLibrary autoupdatingSharedLibrary];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000CD934;
  v19[3] = &unk_1001BCEA0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v5;
  v21 = self;
  p_long long buf = &buf;
  id v6 = v4;
  id v22 = v6;
  [v5 databaseConnectionAllowingWrites:0 withBlock:v19];
  v7 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 count];
    *(_DWORD *)v24 = 138543618;
    v25 = self;
    __int16 v26 = 2048;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %lu offline HLS assets to check", v24, 0x16u);
  }

  objc_initWeak(&location, self);
  hlsKeyRefreshOperationQueue = self->_hlsKeyRefreshOperationQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000CDB70;
  v15[3] = &unk_1001BCF18;
  id v10 = v6;
  id v16 = v10;
  objc_copyWeak(&v17, &location);
  [(NSOperationQueue *)hlsKeyRefreshOperationQueue addBarrierBlock:v15];
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    BOOL v11 = +[ICContentKeySession enhancedAudioSharedContentKeyPath];
    id v12 = +[NSFileManager defaultManager];
    unsigned __int8 v13 = [v12 fileExistsAtPath:v11];

    if ((v13 & 1) == 0)
    {
      __int16 v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 138543362;
        v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@ Fetching shared keys needed for offline HLS assets", v24, 0xCu);
      }

      [(ICDEnhancedAudioKeyManager *)self _fetchSharedKeysForcingRefresh:0];
    }
  }
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

- (void)refreshSharedKeys
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing shared keys", (uint8_t *)&v8, 0xCu);
  }

  v4 = +[ICContentKeySession enhancedAudioSharedContentKeyPath];
  id v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    [(ICDEnhancedAudioKeyManager *)self _fetchSharedKeysForcingRefresh:1];
  }
  else
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@ Skipping refreshing shared keys because we haven't tried to use them yet", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (ICDEnhancedAudioKeyManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICDEnhancedAudioKeyManager;
  id v2 = [(ICDEnhancedAudioKeyManager *)&v6 init];
  if (v2)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    hlsKeyRefreshOperationQueue = v2->_hlsKeyRefreshOperationQueue;
    v2->_hlsKeyRefreshOperationQueue = v3;

    [(NSOperationQueue *)v2->_hlsKeyRefreshOperationQueue setMaxConcurrentOperationCount:2];
    [(NSOperationQueue *)v2->_hlsKeyRefreshOperationQueue setQualityOfService:17];
    [(NSOperationQueue *)v2->_hlsKeyRefreshOperationQueue setName:@"com.apple.itunescloudd.ICDEnhancedAudioKeyManager.HLSKeyRefreshOperationQueue"];
  }
  return v2;
}

@end