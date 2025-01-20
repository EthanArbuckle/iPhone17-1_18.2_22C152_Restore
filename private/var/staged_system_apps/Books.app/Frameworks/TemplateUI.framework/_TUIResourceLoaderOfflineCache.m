@interface _TUIResourceLoaderOfflineCache
+ (id)sharedOfflineCache;
- (NSURLCache)urlCache;
- (_TUIResourceLoaderOfflineCache)init;
- (id)_loadCacheFromCandidatePaths:(id)a3;
- (id)valueForKey:(id)a3;
- (void)_aq_loadPostLaunchCaches;
- (void)_aq_saveOfflineCache;
- (void)_saveOfflineCache:(id)a3;
- (void)dealloc;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)incrementPostLaunchCacheCount;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _TUIResourceLoaderOfflineCache

+ (id)sharedOfflineCache
{
  if (qword_2DF510 != -1) {
    dispatch_once(&qword_2DF510, &stru_254300);
  }
  v2 = (void *)qword_2DF508;

  return v2;
}

- (_TUIResourceLoaderOfflineCache)init
{
  v29.receiver = self;
  v29.super_class = (Class)_TUIResourceLoaderOfflineCache;
  v2 = [(_TUIResourceLoaderOfflineCache *)&v29 init];
  if (!v2) {
    return v2;
  }
  v3 = TUISignpostDefault();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, v2);

  v5 = TUISignpostDefault();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_141F14, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Load offline cache", (const char *)&unk_243F7A, buf, 2u);
  }

  v2->_postLaunchCacheCount = -1;
  v7 = +[TUIOfflineCache provider];
  v2->_generateOfflineCache = [v7 generateCache];
  unsigned int runFromOfflineCache = [v7 runFromCache];
  v2->_unsigned int runFromOfflineCache = runFromOfflineCache;
  if (v2->_generateOfflineCache || runFromOfflineCache != 0)
  {
    dispatch_queue_t v10 = dispatch_queue_create("TUIResourceLoader.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v10;

    unsigned int runFromOfflineCache = v2->_runFromOfflineCache;
  }
  if (runFromOfflineCache)
  {
    v12 = [v7 cacheFileCandidatesForPreLaunch];
    uint64_t v13 = [(_TUIResourceLoaderOfflineCache *)v2 _loadCacheFromCandidatePaths:v12];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v13;

    if (v2->_cache)
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = +[NSString stringWithFormat:@"%@-OfflineCache", v16];

      v18 = (NSURLCache *)[objc_alloc((Class)NSURLCache) initWithMemoryCapacity:79155201 diskCapacity:0 diskPath:v17];
      urlCache = v2->_urlCache;
      v2->_urlCache = v18;

      [(NSURLCache *)v2->_urlCache removeAllCachedResponses];
      v20 = v2->_cache;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_908F4;
      v26[3] = &unk_254328;
      v27 = v2;
      [(NSMutableDictionary *)v20 enumerateKeysAndObjectsUsingBlock:v26];
    }
  }
  else
  {
    if (!v2->_generateOfflineCache) {
      goto LABEL_16;
    }
    uint64_t v21 = objc_opt_new();
    v22 = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v21;

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_saveOfflineCache:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }

LABEL_16:
  v23 = TUISignpostDefault();
  v24 = v23;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_141F14, v24, OS_SIGNPOST_INTERVAL_END, v4, "Load offline cache", (const char *)&unk_243F7A, buf, 2u);
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_TUIResourceLoaderOfflineCache;
  [(_TUIResourceLoaderOfflineCache *)&v4 dealloc];
}

- (NSURLCache)urlCache
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_90AE4;
  dispatch_queue_t v10 = sub_90AF4;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_90AFC;
  v5[3] = &unk_252B50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURLCache *)v3;
}

- (id)_loadCacheFromCandidatePaths:(id)a3
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v31;
    uint64_t v6 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    uint64_t v25 = *(void *)v31;
    while (2)
    {
      v7 = 0;
      id v26 = v4;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v7);
        v9 = [v6[420] defaultManager];
        unsigned int v10 = [v9 fileExistsAtPath:v8];

        if (v10)
        {
          id v29 = 0;
          id v11 = +[NSData dataWithContentsOfFile:v8 options:0 error:&v29];
          id v12 = v29;
          if (v11)
          {
            uint64_t v13 = objc_opt_class();
            uint64_t v14 = objc_opt_class();
            uint64_t v15 = objc_opt_class();
            uint64_t v16 = objc_opt_class();
            v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
            uint64_t v18 = objc_opt_class();
            id v28 = v12;
            v19 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v17 fromData:v11 error:&v28];
            id v20 = v28;

            uint64_t v21 = TUIDynamicCast(v18, v19);

            v22 = TUIInstallBundleLog();
            v23 = v22;
            if (v21)
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v35 = v8;
                _os_log_impl(&def_141F14, v23, OS_LOG_TYPE_DEFAULT, "Using offline cache for TUI from %{public}@", buf, 0xCu);
              }

              goto LABEL_22;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v35 = v8;
              __int16 v36 = 2114;
              id v37 = v20;
              _os_log_error_impl(&def_141F14, v23, OS_LOG_TYPE_ERROR, "Could not unarchive cache at %@ (error): %{public}@", buf, 0x16u);
            }

            id v4 = v26;
            uint64_t v6 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
            uint64_t v5 = v25;
          }
          else
          {
            v17 = TUIInstallBundleLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v35 = v8;
              _os_log_error_impl(&def_141F14, v17, OS_LOG_TYPE_ERROR, "Could not read cache file from disk: %{public}@", buf, 0xCu);
            }
            id v20 = v12;
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v21 = 0;
LABEL_22:

  return v21;
}

- (void)incrementPostLaunchCacheCount
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_90F10;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_aq_loadPostLaunchCaches
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = +[TUIOfflineCache provider];
  uint64_t v5 = [v4 cacheDirCandidatesForPostLaunch];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_912B4;
  v32[3] = &unk_254350;
  id v6 = v3;
  id v33 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v32];
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:v7];
    if (v8)
    {
      v9 = (void *)v8;
      id v31 = 0;
      unsigned int v10 = [v6 contentsOfDirectoryAtPath:v8 error:&v31];
      id v23 = v31;
      id v11 = [v10 sortedArrayUsingSelector:"compare:"];

      if (!v11)
      {
        id v12 = TUIInstallBundleLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_191540();
        }
      }
      id v24 = v6;
      uint64_t v25 = v5;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v11;
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v18 hasSuffix:@".plist"])
            {
              v19 = v9;
              id v20 = [v9 stringByAppendingPathComponent:v18];
              v34 = v20;
              uint64_t v21 = +[NSArray arrayWithObjects:&v34 count:1];
              v22 = [(_TUIResourceLoaderOfflineCache *)self _loadCacheFromCandidatePaths:v21];

              if (v22)
              {
                [(NSMutableDictionary *)self->_cache addEntriesFromDictionary:v22];
                v26[0] = _NSConcreteStackBlock;
                v26[1] = 3221225472;
                v26[2] = sub_912F0;
                v26[3] = &unk_254328;
                void v26[4] = self;
                [v22 enumerateKeysAndObjectsUsingBlock:v26];
              }

              v9 = v19;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v15);
      }

      id v6 = v24;
      uint64_t v5 = v25;
    }
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_generateOfflineCache)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_91458;
    block[3] = &unk_252320;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(accessQueue, block);
  }
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_90AE4;
  v17 = sub_90AF4;
  id v18 = 0;
  if (self->_runFromOfflineCache)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_91598;
    block[3] = &unk_2528A0;
    id v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(accessQueue, block);

    id v7 = (void *)v14[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_91680;
  v7[3] = &unk_2525D8;
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
  block[2] = sub_91700;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_aq_saveOfflineCache
{
  id v3 = +[TUIOfflineCache provider];
  if ([(NSMutableDictionary *)self->_cache count])
  {
    cache = self->_cache;
    id v16 = 0;
    uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:cache requiringSecureCoding:1 error:&v16];
    id v6 = v16;
  }
  else
  {
    uint64_t v5 = 0;
    id v6 = 0;
  }
  if (self->_postLaunchCacheCount < 0)
  {
    id v8 = [v3 cacheFileCandidatesForPreLaunch];
    id v11 = [v8 objectAtIndexedSubscript:0];
  }
  else
  {
    id v7 = [v3 cacheDirCandidatesForPostLaunch];
    id v8 = [v7 objectAtIndexedSubscript:0];

    if (v8)
    {
      v9 = +[NSFileManager defaultManager];
      [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

      id v10 = +[NSString stringWithFormat:@"%02ld.plist", self->_postLaunchCacheCount];
      id v11 = [v8 stringByAppendingPathComponent:v10];
    }
    else
    {
      id v11 = 0;
    }
  }

  if (!v5 || !v11)
  {
    id v14 = TUIInstallBundleLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191610();
    }
    id v13 = v6;
    goto LABEL_17;
  }
  id v15 = v6;
  unsigned __int8 v12 = [v5 writeToFile:v11 options:1 error:&v15];
  id v13 = v15;

  if ((v12 & 1) == 0)
  {
    id v14 = TUIInstallBundleLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1915A8();
    }
LABEL_17:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCache, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end