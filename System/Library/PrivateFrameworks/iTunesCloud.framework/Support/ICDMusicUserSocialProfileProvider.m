@interface ICDMusicUserSocialProfileProvider
- (BOOL)_errorIsRecoverable:(id)a3;
- (ICDMusicUserSocialProfileProvider)initWithDelegate:(id)a3;
- (id)_cacheContainerPath;
- (id)_getCachedResponseForContext:(id)a3;
- (void)_cacheResponse:(id)a3 forContext:(id)a4;
- (void)_clearCacheForContext:(id)a3;
- (void)_onQueue_retryPendingUpdateAttempt:(unsigned int)a3;
- (void)_onQueue_setupRetrySourceForAttempt:(unsigned int)a3;
- (void)_onQueue_teardownRetrySource;
- (void)_performMusicKitRequestWithURL:(id)a3 storeRequestContext:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6;
- (void)_performMusicUserProfileRequestWithUserProfileContext:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)fetchMusicUserProfileWithStoreRequestContext:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5;
@end

@implementation ICDMusicUserSocialProfileProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_contextsPendingUserProfileUpdate, 0);
}

- (void)_onQueue_retryPendingUpdateAttempt:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(ICDMusicUserSocialProfileProvider *)self _onQueue_teardownRetrySource];
  v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v12 = self;
    __int16 v13 = 1024;
    unsigned int v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<ICDMusicUserSocialProfileProvider: %p> Retrying attempt %u", buf, 0x12u);
  }

  contextsPendingUserProfileUpdate = self->_contextsPendingUserProfileUpdate;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DB200;
  v9[3] = &unk_1001BD508;
  v9[4] = self;
  unsigned int v10 = a3;
  [(NSMutableSet *)contextsPendingUserProfileUpdate enumerateObjectsUsingBlock:v9];
  v7 = +[NSMutableSet set];
  v8 = self->_contextsPendingUserProfileUpdate;
  self->_contextsPendingUserProfileUpdate = v7;
}

- (void)_onQueue_teardownRetrySource
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    v4 = self->_retryTimer;
    self->_retryTimer = 0;
  }
}

- (void)_onQueue_setupRetrySourceForAttempt:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(ICDMusicUserSocialProfileProvider *)self _onQueue_teardownRetrySource];
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_serialQueue);
  retryTimer = self->_retryTimer;
  self->_retryTimer = v5;

  long double v7 = exp2((double)a3);
  dispatch_time_t v8 = dispatch_time(0, 1000000000 * v7);
  dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  v9 = self->_retryTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DB7A4;
  v10[3] = &unk_1001BD490;
  objc_copyWeak(&v11, &location);
  unsigned int v12 = a3;
  v10[4] = self;
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume((dispatch_object_t)self->_retryTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_performMusicKitRequestWithURL:(id)a3 storeRequestContext:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc((Class)ICMusicKitRequestContext);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000DBB40;
  v26[3] = &unk_1001BD468;
  id v14 = v11;
  id v27 = v14;
  id v15 = [v13 initWithBlock:v26];
  v16 = +[NSMutableURLRequest requestWithURL:v10];
  v17 = v16;
  if (v7) {
    [v16 setCachePolicy:1];
  }
  id v18 = [objc_alloc((Class)ICMusicKitURLRequest) initWithURLRequest:v17 requestContext:v15 resumeData:0];
  v19 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v29 = self;
    __int16 v30 = 2114;
    id v31 = v18;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<ICDMusicUserSocialProfileProvider: %p> Performing MusicKit request %{public}@ with URL: %{public}@", buf, 0x20u);
  }

  v20 = +[ICURLSessionManager defaultSession];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000DBC54;
  v23[3] = &unk_1001BD440;
  v23[4] = self;
  id v24 = v18;
  id v25 = v12;
  id v21 = v12;
  id v22 = v18;
  [v20 enqueueDataRequest:v22 withCompletionHandler:v23];
}

- (BOOL)_errorIsRecoverable:(id)a3
{
  id v4 = a3;
  v5 = [v4 domain];
  unsigned int v6 = [v5 isEqualToString:ICErrorDomain];

  if (!v6 || (id v7 = [v4 code], v8 = 1, v7 != (id)-7103) && v7 != (id)-7100 && v7 != (id)-7003)
  {
    v9 = [v4 domain];
    unsigned int v10 = [v9 isEqualToString:NSURLErrorDomain];

    if (v10 && (unint64_t v11 = (unint64_t)[v4 code] + 1009, v11 <= 8) && ((1 << v11) & 0x111) != 0)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v12 = [v4 userInfo];
      id v13 = [v12 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (v13) {
        BOOL v8 = [(ICDMusicUserSocialProfileProvider *)self _errorIsRecoverable:v13];
      }
      else {
        BOOL v8 = 0;
      }
    }
  }

  return v8;
}

- (void)_performMusicUserProfileRequestWithUserProfileContext:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = +[ICMusicUserProfile mediaAPIRequestURL];
  unint64_t v11 = [v8 storeRequestContext];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000DC048;
  v14[3] = &unk_1001BD440;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(ICDMusicUserSocialProfileProvider *)self _performMusicKitRequestWithURL:v10 storeRequestContext:v11 ignoreCache:v6 completion:v14];
}

- (void)_clearCacheForContext:(id)a3
{
  id v26 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v25 = self;
  v5 = [(ICDMusicUserSocialProfileProvider *)self _cacheContainerPath];
  BOOL v6 = [v4 enumeratorAtPath:v5];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v29;
    *(void *)&long long v8 = 134218498;
    long long v24 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (MSVDeviceSupportsMultipleLibraries())
        {
          id v13 = [v26 hashedDSID];
          unsigned int v14 = [v12 hasPrefix:v13];

          if (!v14) {
            continue;
          }
        }
        id v15 = objc_msgSend(v5, "stringByAppendingPathComponent:", v12, v24);
        id v27 = 0;
        unsigned int v16 = [v4 removeItemAtPath:v15 error:&v27];
        id v17 = v27;

        id v18 = os_log_create("com.apple.amp.itunescloudd", "UserState");
        v19 = v18;
        if (v16)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            id v33 = v25;
            __int16 v34 = 2112;
            v35 = v12;
            v20 = v19;
            os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
            id v22 = "<ICDMusicUserSocialProfileProvider: %p> Clearing cache response %@.";
            uint32_t v23 = 22;
            goto LABEL_13;
          }
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v24;
          id v33 = v25;
          __int16 v34 = 2112;
          v35 = v12;
          __int16 v36 = 2114;
          id v37 = v17;
          v20 = v19;
          os_log_type_t v21 = OS_LOG_TYPE_ERROR;
          id v22 = "<ICDMusicUserSocialProfileProvider: %p> Could not clear cache response %@. error=%{public}@";
          uint32_t v23 = 32;
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v20, v21, v22, buf, v23);
        }

        continue;
      }
      id v9 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v9);
  }
}

- (void)_cacheResponse:(id)a3 forContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = +[NSFileManager defaultManager];
  id v9 = [(ICDMusicUserSocialProfileProvider *)self _cacheContainerPath];
  if ([v8 fileExistsAtPath:v9 isDirectory:0]) {
    [(ICDMusicUserSocialProfileProvider *)self _clearCacheForContext:v6];
  }
  else {
    [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
  }
  id v21 = 0;
  uint64_t v10 = +[NSJSONSerialization dataWithJSONObject:v7 options:0 error:&v21];

  id v11 = v21;
  if (!v11)
  {
    id v13 = [v6 cacheKey];
    unsigned int v14 = [v9 stringByAppendingPathComponent:v13];
    id v20 = 0;
    [v10 writeToFile:v14 options:1 error:&v20];
    id v12 = v20;
    id v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    unsigned int v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        uint32_t v23 = self;
        __int16 v24 = 2114;
        id v25 = v12;
        id v17 = "<ICDMusicUserSocialProfileProvider: %p> failed to write JSON cache. error=%{public}@";
        id v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218243;
      uint32_t v23 = self;
      __int16 v24 = 2113;
      id v25 = v14;
      id v17 = "<ICDMusicUserSocialProfileProvider: %p> saved JSON response to cache at path %{private}@";
      id v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_12;
    }

    goto LABEL_14;
  }
  id v12 = v11;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    uint32_t v23 = self;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "<ICDMusicUserSocialProfileProvider: %p> failed to serializ data. error=%{public}@", buf, 0x16u);
  }
LABEL_14:
}

- (id)_getCachedResponseForContext:(id)a3
{
  id v4 = a3;
  long long v28 = self;
  uint64_t v5 = [(ICDMusicUserSocialProfileProvider *)self _cacheContainerPath];
  long long v29 = +[NSFileManager defaultManager];
  long long v30 = (void *)v5;
  id v6 = [v29 enumeratorAtPath:v5];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v34;
    *(void *)&long long v8 = 134218242;
    long long v27 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(NSObject **)(*((void *)&v33 + 1) + 8 * i);
        unsigned int v14 = objc_msgSend(v4, "hashedDSID", v27);
        unsigned int v15 = [v13 hasPrefix:v14];

        if (v15)
        {
          unsigned int v16 = [v4 cacheKey];
          unsigned int v17 = [v13 isEqualToString:v16];

          if (v17)
          {
            id v18 = v10;
            uint64_t v10 = v13;
          }
          else
          {
            os_log_type_t v19 = os_log_create("com.apple.amp.itunescloudd", "UserState");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v27;
              v38 = v28;
              __int16 v39 = 2112;
              v40 = v13;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<ICDMusicUserSocialProfileProvider: %p> Cache response %@ is stale. Removing.", buf, 0x16u);
            }

            id v18 = [v30 stringByAppendingPathComponent:v13];
            [v29 removeItemAtPath:v18 error:0];
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v9);
    if (v10)
    {
      id v20 = [v30 stringByAppendingPathComponent:v10];
      id v32 = 0;
      id v21 = +[NSData dataWithContentsOfFile:v20 options:0 error:&v32];
      id v22 = v32;

      if (v22)
      {
        uint32_t v23 = os_log_create("com.apple.amp.itunescloudd", "UserState");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v27;
          v38 = v28;
          __int16 v39 = 2114;
          v40 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "<ICDMusicUserSocialProfileProvider: %p> Error reading cache file. error=%{public}@", buf, 0x16u);
        }
      }
      else
      {
        id v31 = 0;
        uint32_t v23 = +[NSJSONSerialization JSONObjectWithData:v21 options:0 error:&v31];
        id v22 = v31;
        if (!v22)
        {
          uint32_t v23 = v23;
          __int16 v24 = v23;
          goto LABEL_27;
        }
        id v25 = os_log_create("com.apple.amp.itunescloudd", "UserState");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v27;
          v38 = v28;
          __int16 v39 = 2114;
          v40 = v22;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "<ICDMusicUserSocialProfileProvider: %p> Error deserializing cached response error=%{public}@", buf, 0x16u);
        }
      }
      __int16 v24 = 0;
LABEL_27:

      goto LABEL_28;
    }
  }
  id v22 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "<ICDMusicUserSocialProfileProvider: %p> Cache is empty.", buf, 0xCu);
  }
  uint64_t v10 = 0;
  __int16 v24 = 0;
LABEL_28:

  return v24;
}

- (id)_cacheContainerPath
{
  v5[0] = CPSharedResourcesDirectory();
  v5[1] = @"Library";
  v5[2] = @"com.apple.iTunesCloud";
  v5[3] = @"ICMusicUserProfileResponsesCache";
  v2 = +[NSArray arrayWithObjects:v5 count:4];
  v3 = +[NSString pathWithComponents:v2];

  return v3;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DCE08;
  v7[3] = &unk_1001BECC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)fetchMusicUserProfileWithStoreRequestContext:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 1024;
    BOOL v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<ICDMusicUserSocialProfileProvider: %p> fetchMusicUserProfileWithStoreRequestContext storeRequestContext=%{public}@ ignoreCache=%{BOOL}u", buf, 0x1Cu);
  }

  uint64_t v11 = +[ICDefaults standardDefaults];
  unsigned __int8 v12 = [v11 socialProfileSupported];

  if (v12)
  {
    if (v8)
    {
      id v13 = [v8 identity];
      unsigned int v14 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v13];

      if (v14 && ![v14 privacyAcknowledgementRequiredForMusic])
      {
        id v16 = [objc_alloc((Class)ICMusicSubscriptionStatusRequest) initWithStoreRequestContext:v8];
        os_log_type_t v19 = +[ICMusicSubscriptionStatusController sharedStatusController];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000DD25C;
        v20[3] = &unk_1001BD418;
        v20[4] = self;
        id v21 = v8;
        id v22 = v9;
        BOOL v23 = v6;
        [v19 performSubscriptionStatusRequest:v16 withCompletionHandler:v20];
      }
      else
      {
        unsigned int v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          id v25 = self;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "<ICDMusicUserSocialProfileProvider: %p> Privacy acknowledgement required. Returning nil profile.", buf, 0xCu);
        }

        id v16 = +[NSError errorWithDomain:ICErrorDomain code:-7007 userInfo:0];
        (*((void (**)(id, void, id))v9 + 2))(v9, 0, v16);
      }
    }
    else
    {
      id v18 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:0];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v18);
    }
  }
  else
  {
    unsigned int v17 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<ICDMusicUserSocialProfileProvider: %p> Social Profiles are not supported. Returning nil profile.", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (ICDMusicUserSocialProfileProvider)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICDMusicUserSocialProfileProvider;
  BOOL v6 = [(ICDMusicUserSocialProfileProvider *)&v12 init];
  if (v6)
  {
    uint64_t v7 = +[NSMutableSet set];
    contextsPendingUserProfileUpdate = v6->_contextsPendingUserProfileUpdate;
    v6->_contextsPendingUserProfileUpdate = (NSMutableSet *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iTunesCloud.ICDMusicUserSocialProfileProvider", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v6;
}

@end