@interface _JSAStoreHTTPReqestOfflineCache
+ (id)sharedOfflineCache;
- (_JSAStoreHTTPReqestOfflineCache)init;
- (id)_loadCacheFromCandidatePaths:(id)a3;
- (id)responseForKey:(id)a3;
- (void)_aq_loadPostLaunchCaches;
- (void)_aq_saveOfflineCache;
- (void)_saveOfflineCache:(id)a3;
- (void)dealloc;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)incrementPostLaunchCacheCount;
- (void)setResponse:(id)a3 forKey:(id)a4;
@end

@implementation _JSAStoreHTTPReqestOfflineCache

+ (id)sharedOfflineCache
{
  if (qword_CE368 != -1) {
    dispatch_once(&qword_CE368, &stru_B29D0);
  }
  v2 = (void *)qword_CE360;

  return v2;
}

- (_JSAStoreHTTPReqestOfflineCache)init
{
  v3 = JSASignpost();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = JSASignpost();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Load offline cache", "", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)_JSAStoreHTTPReqestOfflineCache;
  v7 = [(_JSAStoreHTTPReqestOfflineCache *)&v22 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_18;
  }
  v7->_postLaunchCacheCount = -1;
  if (+[JSAOfflineCache generateCache]
    || +[JSAOfflineCache runFromCache])
  {
    if (+[JSAOfflineCache generateCache]) {
      dispatch_qos_class_t v9 = QOS_CLASS_USER_INTERACTIVE;
    }
    else {
      dispatch_qos_class_t v9 = QOS_CLASS_USER_INITIATED;
    }
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, v9, 0);
    dispatch_queue_t v12 = dispatch_queue_create("JSAStoreHTTPRequest.access", v11);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v12;
  }
  if (+[JSAOfflineCache runFromCache])
  {
    v14 = +[JSAOfflineCache cacheFileCandidatesForHTTPPreLaunch];
    uint64_t v15 = [(_JSAStoreHTTPReqestOfflineCache *)v8 _loadCacheFromCandidatePaths:v14];
    cache = v8->_cache;
    v8->_cache = (NSMutableDictionary *)v15;

    if (!v8->_cache)
    {
      BUReportAssertionFailureWithMessage();
      BUCrashBreakpoint();
      result = (_JSAStoreHTTPReqestOfflineCache *)BUIsRunningTests();
      if ((result & 1) == 0)
      {
        __break(1u);
        return result;
      }
      BUCrashFinalThrow();
    }
    goto LABEL_17;
  }
  if (+[JSAOfflineCache generateCache])
  {
    uint64_t v18 = objc_opt_new();
    v19 = v8->_cache;
    v8->_cache = (NSMutableDictionary *)v18;

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v8 selector:"_saveOfflineCache:" name:UIApplicationDidEnterBackgroundNotification object:0];
LABEL_17:
  }
LABEL_18:
  v20 = JSASignpost();
  v21 = v20;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v21, OS_SIGNPOST_INTERVAL_END, v4, "Load offline cache", "", buf, 2u);
  }

  return v8;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_JSAStoreHTTPReqestOfflineCache;
  [(_JSAStoreHTTPReqestOfflineCache *)&v4 dealloc];
}

- (id)_loadCacheFromCandidatePaths:(id)a3
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v33;
    v5 = &swift_arrayDestroy_ptr;
    v6 = &swift_arrayDestroy_ptr;
    uint64_t v26 = *(void *)v33;
    while (2)
    {
      v7 = 0;
      id v27 = v3;
      do
      {
        if (*(void *)v33 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v7);
        dispatch_qos_class_t v9 = [v5[270] defaultManager];
        unsigned int v10 = [v9 fileExistsAtPath:v8];

        if (v10)
        {
          v11 = v6[263];
          id v31 = 0;
          dispatch_queue_t v12 = [v11 dataWithContentsOfFile:v8 options:0 error:&v31];
          id v13 = v31;
          if (v12)
          {
            uint64_t v29 = objc_opt_class();
            uint64_t v14 = objc_opt_class();
            uint64_t v15 = objc_opt_class();
            uint64_t v16 = objc_opt_class();
            uint64_t v17 = objc_opt_class();
            uint64_t v18 = objc_opt_class();
            uint64_t v25 = objc_opt_class();
            v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, v14, v15, v16, v17, v18, v25, objc_opt_class(), 0);
            objc_opt_class();
            id v30 = v13;
            v20 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v19 fromData:v12 error:&v30];
            id v21 = v30;

            BUDynamicCast();
            id v3 = (id)objc_claimAutoreleasedReturnValue();

            objc_super v22 = JSALog();
            v23 = v22;
            if (v3)
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v37 = v8;
                _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Using offline cache from %{public}@", buf, 0xCu);
              }

              goto LABEL_22;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v37 = v8;
              __int16 v38 = 2114;
              id v39 = v21;
              _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Could not unarchive cache at %@ (error): %{public}@", buf, 0x16u);
            }

            uint64_t v4 = v26;
            v5 = &swift_arrayDestroy_ptr;
            v6 = &swift_arrayDestroy_ptr;
          }
          else
          {
            v19 = JSALog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v37 = v8;
              _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "Could not read cache file from disk: %{public}@", buf, 0xCu);
            }
            id v21 = v13;
          }
          id v3 = v27;
        }
        v7 = (char *)v7 + 1;
      }
      while (v3 != v7);
      id v3 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  return v3;
}

- (void)incrementPostLaunchCacheCount
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1547C;
  block[3] = &unk_B2000;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_aq_loadPostLaunchCaches
{
  id v3 = +[NSFileManager defaultManager];
  uint64_t v4 = +[JSAOfflineCache cacheDirCandidatesForHTTPPostLaunch];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_157B8;
  v29[3] = &unk_B29F8;
  id v5 = v3;
  id v30 = v5;
  id v6 = [v4 indexOfObjectPassingTest:v29];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:v6];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v28 = 0;
      dispatch_qos_class_t v9 = [v5 contentsOfDirectoryAtPath:v7 error:&v28];
      id v21 = v28;
      unsigned int v10 = [v9 sortedArrayUsingSelector:"compare:"];

      if (!v10)
      {
        v11 = JSALog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_85104();
        }
      }
      id v22 = v5;
      v23 = v4;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if ([v17 hasSuffix:@".plist"])
            {
              uint64_t v18 = [v8 stringByAppendingPathComponent:v17];
              id v31 = v18;
              v19 = +[NSArray arrayWithObjects:&v31 count:1];
              v20 = [(_JSAStoreHTTPReqestOfflineCache *)self _loadCacheFromCandidatePaths:v19];

              if (v20) {
                [(NSMutableDictionary *)self->_cache addEntriesFromDictionary:v20];
              }
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v14);
      }

      id v5 = v22;
      uint64_t v4 = v23;
    }
  }
}

- (void)setResponse:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[JSAOfflineCache generateCache])
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_158C8;
    block[3] = &unk_B2560;
    block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_sync(accessQueue, block);
  }
}

- (id)responseForKey:(id)a3
{
  id v4 = a3;
  if (+[JSAOfflineCache runFromCache])
  {
    id v39 = +[NSDate now];
    id v5 = +[NSDate now];
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = sub_15EE4;
    v53 = sub_15EF4;
    id v54 = 0;
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15EFC;
    block[3] = &unk_B2768;
    v48 = &v49;
    block[4] = self;
    id v7 = v4;
    id v47 = v7;
    dispatch_sync(accessQueue, block);
    objc_opt_class();
    uint64_t v8 = BUDynamicCast();
    dispatch_qos_class_t v9 = (JSAStoreHTTPResponse *)v8;
    if (!v50[5] || v8)
    {
LABEL_22:
      long long v26 = +[NSDate now];
      if (v9)
      {
        id v16 = [(JSAStoreHTTPResponse *)v9 copy];

        v55[0] = @"requestStartTime";
        [v39 timeIntervalSince1970];
        id v28 = +[NSNumber numberWithDouble:v27 * 1000.0];
        v56[0] = v28;
        v55[1] = @"responseStartTime";
        [v5 timeIntervalSince1970];
        id v30 = +[NSNumber numberWithDouble:v29 * 1000.0];
        v56[1] = v30;
        v55[2] = @"responseEndTime";
        [v26 timeIntervalSince1970];
        long long v32 = +[NSNumber numberWithDouble:v31 * 1000.0];
        v55[3] = @"responseCached";
        v56[2] = v32;
        v56[3] = &__kCFBooleanTrue;
        long long v33 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:4];
        [v16 setPerformanceMetrics:v33];
      }
      else
      {
        id v16 = 0;
      }

      _Block_object_dispose(&v49, 8);
      goto LABEL_26;
    }
    objc_opt_class();
    id v10 = BUDynamicCast();
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 bu_gzipInflate];

      objc_opt_class();
      id v45 = 0;
      id v13 = +[NSJSONSerialization JSONObjectWithData:v12 options:0 error:&v45];
      __int16 v38 = v45;
      id v14 = BUDynamicCast();

      if (v14)
      {
        id v15 = 0;
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v37 = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v35 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v37, v36, v35, v17, v18, v19, objc_opt_class(), 0);
      objc_opt_class();
      id v44 = 0;
      id v21 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v20 fromData:v12 error:&v44];
      id v15 = v44;
      id v14 = BUDynamicCast();

      if (v14) {
        goto LABEL_11;
      }
      long long v24 = JSALog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_851B0();
      }

      v23 = v38;
    }
    else
    {
      objc_opt_class();
      id v14 = BUDynamicCast();
      if (v14)
      {
        id v12 = 0;
LABEL_12:
        id v22 = [[JSAStoreHTTPResponse alloc] initWithDictionary:v14];
LABEL_21:
        long long v25 = self->_accessQueue;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_15F4C;
        v40[3] = &unk_B2560;
        dispatch_qos_class_t v9 = v22;
        v41 = v9;
        v42 = self;
        id v43 = v7;
        dispatch_sync(v25, v40);

        goto LABEL_22;
      }
      v23 = JSALog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_8516C(v23);
      }
      id v12 = 0;
    }

    id v14 = 0;
    id v22 = 0;
    goto LABEL_21;
  }
  id v16 = 0;
LABEL_26:

  return v16;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_16004;
  v7[3] = &unk_B2650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)_saveOfflineCache:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16274;
  block[3] = &unk_B2000;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_aq_saveOfflineCache
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = +[JSAOfflineCache cachePath];
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

  if ([(NSMutableDictionary *)self->_cache count])
  {
    id v5 = sub_16010((id *)&self->super.isa);
    id v17 = 0;
    id v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v17];
    id v7 = v17;
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }
  if (self->_postLaunchCacheCount < 0)
  {
    dispatch_qos_class_t v9 = +[JSAOfflineCache cacheFileCandidatesForHTTPPreLaunch];
    id v12 = [v9 objectAtIndexedSubscript:0];
  }
  else
  {
    id v8 = +[JSAOfflineCache cacheDirCandidatesForHTTPPostLaunch];
    dispatch_qos_class_t v9 = [v8 objectAtIndexedSubscript:0];

    if (v9)
    {
      id v10 = +[NSFileManager defaultManager];
      [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];

      id v11 = +[NSString stringWithFormat:@"%02ld.plist", self->_postLaunchCacheCount];
      id v12 = [v9 stringByAppendingPathComponent:v11];
    }
    else
    {
      id v12 = 0;
    }
  }

  if (!v6 || !v12)
  {
    id v15 = JSALog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_85018();
    }
    id v14 = v7;
    goto LABEL_17;
  }
  id v16 = v7;
  unsigned __int8 v13 = [v6 writeToFile:v12 options:1 error:&v16];
  id v14 = v16;

  if ((v13 & 1) == 0)
  {
    id v15 = JSALog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_84FB0();
    }
LABEL_17:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end