@interface PUIPosterSnapshotFilesystemCache
+ (id)_determineProviderFromSnapshotURL:(id)a3;
+ (id)_snapshotURLForPosterPath:(id)a3 relativeTo:(id)a4;
+ (id)_snapshotURLForPosterPath:(id)a3 snapshotCacheIdentifier:(id)a4 interfaceOrientation:(int64_t)a5 hardwareIdentifier:(id)a6 userInterfaceStyle:(int64_t)a7 relativeTo:(id)a8;
- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4;
- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (BOOL)checkCacheIsReachable:(id *)a3;
- (NSURL)cacheURL;
- (PUIPosterSnapshotFilesystemCache)initWithURL:(id)a3;
- (id)latestSnapshotBundleForPoster:(id)a3 snapshotCacheIdentifier:(id)a4 interfaceOrientation:(int64_t)a5 userInterfaceStyle:(int64_t)a6 hardwareIdentifier:(id)a7 error:(id *)a8;
- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4;
- (void)_cacheLock_cleanupPostersBefore:(id)a3;
- (void)_prepareSnapshotCache;
- (void)cleanup;
- (void)dealloc;
- (void)discardSnapshotsForPosters:(id)a3;
- (void)discardSnapshotsForPostersMatchingPredicate:(id)a3;
- (void)invalidate;
@end

@implementation PUIPosterSnapshotFilesystemCache

- (PUIPosterSnapshotFilesystemCache)initWithURL:(id)a3
{
  id v5 = a3;
  if ([v5 checkResourceIsReachableAndReturnError:0])
  {
    v30.receiver = self;
    v30.super_class = (Class)PUIPosterSnapshotFilesystemCache;
    v6 = [(PUIPosterSnapshotFilesystemCache *)&v30 init];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x263F29BD0]) initWithFlag:0];
      invalidationFlag = v6->_invalidationFlag;
      v6->_invalidationFlag = (BSAtomicFlag *)v7;

      v6->_cacheLock._os_unfair_lock_opaque = 0;
      v9 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
      cacheLock_URLToSnapshotBundleCache = v6->_cacheLock_URLToSnapshotBundleCache;
      v6->_cacheLock_URLToSnapshotBundleCache = v9;

      uint64_t v11 = [v5 copy];
      cacheURL = v6->_cacheURL;
      v6->_cacheURL = (NSURL *)v11;

      v13 = [(NSURL *)v6->_cacheURL URLByAppendingPathComponent:@"PosterSnapshots" isDirectory:1];
      uint64_t v14 = [v13 URLByStandardizingPath];
      cacheURLInternalDirectory = v6->_cacheURLInternalDirectory;
      v6->_cacheURLInternalDirectory = (NSURL *)v14;

      v16 = [v5 path];
      v17 = [v16 stringByAppendingFormat:@"-%@", @"PostersFileSystemCacheCompletionQueue"];
      v18 = [MEMORY[0x263F29C50] serial];
      v19 = [v18 serviceClass:25];
      uint64_t v20 = BSDispatchQueueCreate();
      completionQueue = v6->_completionQueue;
      v6->_completionQueue = (OS_dispatch_queue *)v20;

      v22 = (void *)MEMORY[0x263F5F450];
      v23 = NSString;
      v24 = [(NSURL *)v6->_cacheURL path];
      v25 = [v23 stringWithFormat:@"PostersFileSystemCache-Workloop-%@", v24];
      uint64_t v26 = [v22 serialQueueTargetingSharedWorkloop:v25];
      fileSystemQueue = v6->_fileSystemQueue;
      v6->_fileSystemQueue = (OS_dispatch_queue *)v26;

      [(PUIPosterSnapshotFilesystemCache *)v6 _prepareSnapshotCache];
    }

    return v6;
  }
  else
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[cacheURL checkResourceIsReachableAndReturnError:((void *)0)]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotFilesystemCache initWithURL:](a2);
    }
    [v29 UTF8String];
    result = (PUIPosterSnapshotFilesystemCache *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  [(PUIPosterSnapshotFilesystemCache *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PUIPosterSnapshotFilesystemCache;
  [(PUIPosterSnapshotFilesystemCache *)&v3 dealloc];
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    os_unfair_lock_lock(&self->_cacheLock);
    [(NSCache *)self->_cacheLock_URLToSnapshotBundleCache removeAllObjects];
    cacheLock_URLToSnapshotBundleCache = self->_cacheLock_URLToSnapshotBundleCache;
    self->_cacheLock_URLToSnapshotBundleCache = 0;

    os_unfair_lock_unlock(&self->_cacheLock);
  }
}

+ (id)_snapshotURLForPosterPath:(id)a3 relativeTo:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 serverIdentity];
  uint64_t v8 = [v7 provider];

  v9 = [v5 serverIdentity];
  v10 = [v9 posterUUID];
  uint64_t v11 = [v10 UUIDString];

  v12 = NSString;
  v13 = [v5 serverIdentity];
  uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", @"%llu", objc_msgSend(v13, "version"));

  v15 = NSString;
  v16 = [v5 serverIdentity];
  v17 = objc_msgSend(v15, "stringWithFormat:", @"%llu", objc_msgSend(v16, "supplement"));

  v18 = PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier();
  v29 = v6;
  v19 = (void *)[v6 copy];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v34[0] = v18;
  v34[1] = v8;
  v27 = (void *)v11;
  v28 = (void *)v8;
  v34[2] = v11;
  v34[3] = v14;
  v34[4] = v17;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:5];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v24 = 0;
      v25 = v19;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        v19 = [v25 URLByAppendingPathComponent:*(void *)(*((void *)&v30 + 1) + 8 * v24) isDirectory:1];

        ++v24;
        v25 = v19;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v22);
  }

  return v19;
}

+ (id)_snapshotURLForPosterPath:(id)a3 snapshotCacheIdentifier:(id)a4 interfaceOrientation:(int64_t)a5 hardwareIdentifier:(id)a6 userInterfaceStyle:(int64_t)a7 relativeTo:(id)a8
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v45 = a4;
  id v13 = a6;
  id v14 = a8;
  v15 = [v12 serverIdentity];
  v39 = [v15 provider];

  v16 = [v12 serverIdentity];
  v17 = [v16 posterUUID];
  uint64_t v18 = [v17 UUIDString];

  v19 = NSString;
  uint64_t v20 = [v12 serverIdentity];
  uint64_t v21 = objc_msgSend(v19, "stringWithFormat:", @"%llu", objc_msgSend(v20, "version"));

  uint64_t v22 = NSString;
  uint64_t v23 = [v12 serverIdentity];
  uint64_t v24 = objc_msgSend(v22, "stringWithFormat:", @"%llu", objc_msgSend(v23, "supplement"));

  uint64_t v25 = PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier();
  uint64_t v26 = BSInterfaceOrientationDescription();
  v27 = @"Unknown";
  if (a7 == 1) {
    v27 = @"LightMode";
  }
  if (a7 == 2) {
    v27 = @"DarkMode";
  }
  v28 = v27;
  v29 = (void *)[v14 copy];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v41 = (void *)v25;
  v42 = (void *)v24;
  v50[0] = v25;
  v50[1] = v39;
  v43 = (void *)v18;
  v50[2] = v18;
  v50[3] = v21;
  long long v30 = (void *)v21;
  v50[4] = v24;
  v50[5] = v26;
  v40 = (void *)v26;
  v50[6] = v45;
  v50[7] = v28;
  v44 = v13;
  v50[8] = v13;
  long long v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:9];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v47;
    do
    {
      uint64_t v35 = 0;
      uint64_t v36 = v29;
      do
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(v31);
        }
        v29 = [v36 URLByAppendingPathComponent:*(void *)(*((void *)&v46 + 1) + 8 * v35) isDirectory:1];

        ++v35;
        uint64_t v36 = v29;
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v33);
  }

  v37 = [v29 URLByAppendingPathComponent:@"Snapshot.pks" isDirectory:0];

  return v37;
}

+ (id)_determineProviderFromSnapshotURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = [a3 path];
  v4 = [v3 componentsSeparatedByString:@"/"];
  id v5 = PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "isEqualToString:", v5, (void)v14);
        if ((v12 & 1) == 0 && ((v8 ^ 1) & 1) == 0)
        {
          id v7 = v11;
          goto LABEL_12;
        }
        v8 |= v12;
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)latestSnapshotBundleForPoster:(id)a3 snapshotCacheIdentifier:(id)a4 interfaceOrientation:(int64_t)a5 userInterfaceStyle:(int64_t)a6 hardwareIdentifier:(id)a7 error:(id *)a8
{
  *(void *)&v57[5] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v19 = PUILogSnapshotCache();
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    uint64_t v21 = PUILogSnapshotCache();
    uint64_t v22 = v21;
    os_signpost_id_t spid = v20;
    unint64_t v23 = v20 - 1;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v22, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SnapshotCacheRetrieval", (const char *)&unk_25A117B91, buf, 2u);
    }

    if (([v15 isServerPosterPath] & 1) == 0)
    {
      v51 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path isServerPosterPath]"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForPoster:snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:](a2);
      }
      [v51 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x25A0DDDC0);
    }
    if (![v16 length])
    {
      uint64_t v52 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[snapshotCacheIdentifier length] > 0"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForPoster:snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:](a2);
      }
      [v52 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x25A0DDE24);
    }
    uint64_t v24 = self->_cacheLock_URLToSnapshotBundleCache;
    uint64_t v25 = [(id)objc_opt_class() _snapshotURLForPosterPath:v15 snapshotCacheIdentifier:v16 interfaceOrientation:a5 hardwareIdentifier:v17 userInterfaceStyle:a6 relativeTo:self->_cacheURLInternalDirectory];
    uint64_t v26 = PUILogSnapshotCache();
    v27 = v26;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v27, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SnapshotCacheRetrieval-unlocked", (const char *)&unk_25A117B91, buf, 2u);
    }

    v28 = [(NSCache *)v24 objectForKey:v25];
    v29 = PUILogSnapshotCache();
    long long v30 = v29;
    if (v28)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v57 = v25;
        _os_log_impl(&dword_25A0AF000, v30, OS_LOG_TYPE_DEFAULT, "pre _cacheLock; snapshotBundle found @ %@", buf, 0xCu);
      }

      long long v31 = PUILogSnapshotCache();
      uint64_t v32 = v31;
      if (v23 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v31)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 67109378;
      v57[0] = 1;
      LOWORD(v57[1]) = 2114;
      *(void *)((char *)&v57[1] + 2) = v25;
      uint64_t v33 = "SnapshotCacheRetrieval-unlocked";
    }
    else
    {
      if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v57 = v25;
        _os_signpost_emit_with_name_impl(&dword_25A0AF000, v30, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCacheRetrieval-unlocked", "Failed / %{public}@", buf, 0xCu);
      }

      uint64_t v34 = PUILogSnapshotCache();
      uint64_t v35 = v34;
      if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25A0AF000, v35, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SnapshotCacheRetrieval-locked", (const char *)&unk_25A117B91, buf, 2u);
      }

      p_cacheLock = &self->_cacheLock;
      os_unfair_lock_lock(p_cacheLock);
      uint64_t v37 = [(NSCache *)v24 objectForKey:v25];
      if (!v37)
      {
        v41 = PUILogSnapshotCache();
        v42 = v41;
        if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_25A0AF000, v42, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SnapshotCacheRetrieval-loadFromDisk-locked", (const char *)&unk_25A117B91, buf, 2u);
        }

        id v55 = 0;
        v43 = +[PUIPosterSnapshotBundle snapshotBundleAtURL:v25 error:&v55];
        id v53 = v55;
        v44 = PUILogSnapshotCache();
        id v45 = v44;
        if (v43)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v57 = v25;
            _os_log_impl(&dword_25A0AF000, v45, OS_LOG_TYPE_DEFAULT, "loaded snapshotBundle %@", buf, 0xCu);
          }

          [(NSCache *)v24 setObject:v43 forKey:v25];
          long long v46 = v53;
        }
        else
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForPoster:snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:]((uint64_t)v25, (uint64_t)v53, v45);
          }

          long long v46 = v53;
          if (a8) {
            *a8 = v53;
          }
        }
        long long v47 = PUILogSnapshotCache();
        long long v48 = v47;
        if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_DWORD *)buf = 67109378;
          v57[0] = v43 != 0;
          LOWORD(v57[1]) = 2114;
          *(void *)((char *)&v57[1] + 2) = v25;
          _os_signpost_emit_with_name_impl(&dword_25A0AF000, v48, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCacheRetrieval-loadFromDisk-locked", "Success? %{BOOL}u  %{public}@", buf, 0x12u);
        }

        os_unfair_lock_unlock(p_cacheLock);
        long long v49 = PUILogSnapshotCache();
        v50 = v49;
        if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_DWORD *)buf = 67109378;
          v57[0] = v43 != 0;
          LOWORD(v57[1]) = 2114;
          *(void *)((char *)&v57[1] + 2) = v25;
          _os_signpost_emit_with_name_impl(&dword_25A0AF000, v50, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCacheRetrieval-locked", "Success? %{BOOL}u  %{public}@", buf, 0x12u);
        }

        id v18 = v43;
        goto LABEL_33;
      }
      v28 = (void *)v37;
      os_unfair_lock_unlock(p_cacheLock);
      v38 = PUILogSnapshotCache();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v57 = v25;
        _os_log_impl(&dword_25A0AF000, v38, OS_LOG_TYPE_DEFAULT, "post _cacheLock; snapshotBundle found @ %@",
          buf,
          0xCu);
      }

      v39 = PUILogSnapshotCache();
      uint64_t v32 = v39;
      if (v23 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v39))
      {
LABEL_32:

        id v18 = v28;
LABEL_33:

        goto LABEL_34;
      }
      *(_DWORD *)buf = 67109378;
      v57[0] = 1;
      LOWORD(v57[1]) = 2114;
      *(void *)((char *)&v57[1] + 2) = v25;
      uint64_t v33 = "SnapshotCacheRetrieval-locked";
    }
    _os_signpost_emit_with_name_impl(&dword_25A0AF000, v32, OS_SIGNPOST_INTERVAL_END, spid, v33, "Success? %{BOOL}u  %{public}@", buf, 0x12u);
    goto LABEL_32;
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
    id v18 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }
LABEL_34:

  return v18;
}

- (void)discardSnapshotsForPosters:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_cacheLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend((id)objc_opt_class(), "_snapshotURLForPosterPath:relativeTo:", *(void *)(*((void *)&v12 + 1) + 8 * v9), self->_cacheURLInternalDirectory, (void)v12);
        uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
        [v11 removeItemAtURL:v10 error:0];

        [(NSCache *)self->_cacheLock_URLToSnapshotBundleCache removeObjectForKey:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_cacheLock);
}

- (BOOL)checkCacheIsReachable:(id *)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
      char v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    cacheURLInternalDirectory = self->_cacheURLInternalDirectory;
    id v19 = 0;
    BOOL v7 = [(NSURL *)cacheURLInternalDirectory checkResourceIsReachableAndReturnError:&v19];
    id v8 = v19;
    if (v7)
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
      v10 = self->_cacheURLInternalDirectory;
      uint64_t v11 = PFPosterPathFileAttributes();
      id v18 = 0;
      char v5 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v11 error:&v18];
      id v12 = v18;

      if ((v5 & 1) == 0)
      {
        if (v12)
        {
          long long v13 = (void *)MEMORY[0x263F087E8];
          uint64_t v14 = *MEMORY[0x263F083F0];
          v20[1] = v12;
          uint64_t v21 = v14;
          v20[0] = v8;
          long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
          v22[0] = v15;
          id v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
          objc_msgSend(v13, "pui_errorWithCode:userInfo:", 3, v16);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          *a3 = v8;
        }
      }
    }
  }
  return v5;
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    id v8 = [v6 path];
    uint64_t v9 = [v6 snapshotCacheIdentifier];
    uint64_t v17 = [v6 settings];
    uint64_t v16 = objc_msgSend(v17, "pui_deviceOrientation");
    v10 = [v6 settings];
    uint64_t v11 = objc_msgSend(v10, "pui_userInterfaceStyle");
    id v12 = [v6 settings];
    long long v13 = [v12 displayConfiguration];
    uint64_t v14 = objc_msgSend(v13, "pui_displayConfigurationIdentifier");
    BOOL v7 = [(PUIPosterSnapshotFilesystemCache *)self latestSnapshotBundleForPoster:v8 snapshotCacheIdentifier:v9 interfaceOrientation:v16 userInterfaceStyle:v11 hardwareIdentifier:v14 error:a4];
  }
  return v7;
}

- (void)discardSnapshotsForPostersMatchingPredicate:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v29 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    objc_super v3 = PUILogSnapshotCache();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    char v5 = PUILogSnapshotCache();
    id v6 = v5;
    unint64_t v27 = v4 - 1;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v29;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SnapshotCacheCleanupMatchingPredicate", "Predicate %{public}@", buf, 0xCu);
    }
    os_signpost_id_t spid = v4;

    BOOL v7 = objc_opt_new();
    os_unfair_lock_lock(&self->_cacheLock);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = [v8 enumeratorAtURL:self->_cacheURLInternalDirectory includingPropertiesForKeys:0 options:4 errorHandler:0];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v15 = [v14 pathExtension];
          uint64_t v16 = [v15 localizedCompare:@"pks"];

          if (!v16 && [v29 evaluateWithObject:v14])
          {
            [v7 addObject:v14];
            [(NSCache *)self->_cacheLock_URLToSnapshotBundleCache removeObjectForKey:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v11);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          unint64_t v23 = [MEMORY[0x263F08850] defaultManager];
          [v23 removeItemAtURL:v22 error:0];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v19);
    }

    os_unfair_lock_unlock(&self->_cacheLock);
    uint64_t v24 = PUILogSnapshotCache();
    uint64_t v25 = v24;
    if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 138543618;
      id v39 = v29;
      __int16 v40 = 2114;
      id v41 = v17;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v25, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCacheCleanupMatchingPredicate", "Predicate %{public}@; cleanedup urls: %{public}@",
        buf,
        0x16u);
    }
  }
}

- (void)cleanup
{
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(p_cacheLock);
    os_unfair_lock_unlock(p_cacheLock);
  }
}

- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4
{
  return [(PUIPosterSnapshotFilesystemCache *)self cacheSnapshotBundle:a3 forRequest:a4 completion:0];
}

- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self->_completionQueue;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (!v10)
    {
      char v12 = 0;
      goto LABEL_9;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke;
    block[3] = &unk_265471250;
    id v40 = v10;
    dispatch_async((dispatch_queue_t)v11, block);
    char v12 = 0;
    id v13 = v40;
  }
  else
  {
    id v13 = [v9 path];
    uint64_t v14 = [v9 path];
    char v12 = [v14 isServerPosterPath];

    if (v12)
    {
      long long v15 = PUILogSnapshotCache();
      os_signpost_id_t v28 = os_signpost_id_generate(v15);

      uint64_t v25 = objc_opt_class();
      uint64_t v16 = [v9 snapshotCacheIdentifier];
      unint64_t v27 = [v9 settings];
      uint64_t v24 = objc_msgSend(v27, "pui_deviceOrientation");
      [v9 settings];
      v17 = long long v30 = v8;
      [v17 displayConfiguration];
      uint64_t v18 = v29 = v11;
      uint64_t v19 = objc_msgSend(v18, "pui_displayConfigurationIdentifier");
      uint64_t v20 = [v9 settings];
      uint64_t v26 = objc_msgSend(v25, "_snapshotURLForPosterPath:snapshotCacheIdentifier:interfaceOrientation:hardwareIdentifier:userInterfaceStyle:relativeTo:", v13, v16, v24, v19, objc_msgSend(v20, "pui_userInterfaceStyle"), self->_cacheURLInternalDirectory);

      uint64_t v11 = v29;
      id v8 = v30;

      fileSystemQueue = self->_fileSystemQueue;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_2;
      v31[3] = &unk_265471698;
      v31[4] = self;
      id v37 = v10;
      os_signpost_id_t v38 = v28;
      id v32 = v30;
      id v33 = v26;
      id v34 = v9;
      long long v35 = v29;
      id v13 = v13;
      id v36 = v13;
      id v22 = v26;
      dispatch_async(fileSystemQueue, v31);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }

LABEL_9:
  return v12;
}

void __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 5);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_2(uint64_t a1)
{
  v85[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F29BD0]) initWithFlag:0];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_3;
  v71[3] = &unk_265471670;
  id v61 = v2;
  id v72 = v61;
  id v73 = *(id *)(a1 + 80);
  objc_super v3 = (void *)MEMORY[0x25A2F6090](v71);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  os_signpost_id_t v4 = PUILogSnapshotCache();
  char v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 88);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    BOOL v7 = [*(id *)(a1 + 40) bundleURL];
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v75 = v7;
    __int16 v76 = 2114;
    uint64_t v77 = v8;
    _os_signpost_emit_with_name_impl(&dword_25A0AF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "cacheSnapshotBundle", "snapshotBundle URL %{public}@ -> %{public}@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 48) checkResourceIsReachableAndReturnError:0])
  {
    id v9 = [MEMORY[0x263F08850] defaultManager];
    [v9 removeItemAtURL:*(void *)(a1 + 48) error:0];

    int v60 = 1;
  }
  else
  {
    int v60 = 0;
  }
  id v10 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v11 = [*(id *)(a1 + 48) URLByDeletingLastPathComponent];
  char v12 = PFPosterPathFileAttributes();
  id v70 = 0;
  int v13 = [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:v12 error:&v70];
  id v14 = v70;

  if (v13)
  {
    id v59 = v14;
    long long v15 = (void *)MEMORY[0x25A2F5E70]();
    uint64_t v16 = [*(id *)(a1 + 40) bundleURL];
    if (v16
      && (id v17 = (void *)v16,
          [*(id *)(a1 + 40) bundleURL],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 checkResourceIsReachableAndReturnError:0],
          v18,
          v17,
          v19))
    {
      uint64_t v20 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v21 = [*(id *)(a1 + 40) bundleURL];
      uint64_t v22 = *(void *)(a1 + 48);
      id v69 = 0;
      int v23 = [v20 copyItemAtURL:v21 toURL:v22 error:&v69];
      id v24 = v69;

      if (!v23)
      {
        LODWORD(v26) = 0;
        goto LABEL_24;
      }
      uint64_t v25 = [[PUIPosterSnapshotBundle alloc] initWithURL:*(void *)(a1 + 48)];
      if ([(PUIPosterSnapshotBundle *)v25 isValidBundle])
      {
        [*(id *)(*(void *)(a1 + 32) + 16) setObject:v25 forKey:*(void *)(a1 + 48)];
        LODWORD(v26) = 1;
      }
      else
      {
        v51 = [MEMORY[0x263F08850] defaultManager];
        [v51 removeItemAtURL:*(void *)(a1 + 48) error:0];

        uint64_t v52 = (void *)MEMORY[0x263F087E8];
        uint64_t v84 = *MEMORY[0x263F08338];
        uint64_t v26 = NSString;
        id v53 = [*(id *)(a1 + 56) description];
        v54 = [v26 stringWithFormat:@"Bundle failed to be cached for request %@", v53];
        v85[0] = v54;
        LODWORD(v26) = 1;
        id v55 = [NSDictionary dictionaryWithObjects:v85 forKeys:&v84 count:1];
        uint64_t v56 = objc_msgSend(v52, "pui_errorWithCode:userInfo:", 7, v55);

        id v24 = (id)v56;
      }
    }
    else
    {
      uint64_t v25 = [[PUIPosterSnapshotBundleBuilder alloc] initWithSnapshotBundle:*(void *)(a1 + 40)];
      long long v30 = [*(id *)(a1 + 40) ondiskFormat];
      long long v31 = v30;
      if (v30)
      {
        id v32 = v30;
      }
      else
      {
        id v32 = +[PUIImageOnDiskFormat defaultFormat];
      }
      id v33 = v32;

      uint64_t v34 = *(void *)(a1 + 48);
      id v68 = 0;
      uint64_t v26 = [(PUIPosterSnapshotBundle *)v25 buildWithOutputURL:v34 diskFormat:v33 error:&v68];
      id v24 = v68;

      if (v26)
      {
        long long v35 = [[PUIPosterSnapshotBundle alloc] initWithURL:*(void *)(a1 + 48)];
        LODWORD(v26) = [(PUIPosterSnapshotBundle *)v35 isValidBundle];
        if (v26)
        {
          [*(id *)(*(void *)(a1 + 32) + 16) setObject:v35 forKey:*(void *)(a1 + 48)];
        }
        else
        {
          [MEMORY[0x263F08850] defaultManager];
          id v36 = v58 = v15;
          [v36 removeItemAtURL:*(void *)(a1 + 48) error:0];

          id v37 = (void *)MEMORY[0x263F087E8];
          uint64_t v82 = *MEMORY[0x263F08338];
          os_signpost_id_t v38 = NSString;
          v57 = [*(id *)(a1 + 56) description];
          id v39 = [v38 stringWithFormat:@"Bundle failed to be cached for request %@", v57];
          v83 = v39;
          [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          v41 = id v40 = v25;
          objc_msgSend(v37, "pui_errorWithCode:userInfo:", 7, v41);
          uint64_t v43 = v42 = v3;

          uint64_t v25 = v40;
          long long v15 = v58;

          id v24 = (id)v43;
          objc_super v3 = v42;
        }
      }
    }

LABEL_24:
    uint64_t v44 = *(NSObject **)(a1 + 64);
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_65;
    v65[3] = &unk_265471648;
    os_signpost_id_t v28 = v3;
    id v66 = v24;
    id v67 = v3;
    id v45 = v24;
    dispatch_async(v44, v65);

    if (v26)
    {
      objc_msgSend(*(id *)(a1 + 32), "_cacheLock_cleanupPostersBefore:", *(void *)(a1 + 72));
      int v29 = 1;
    }
    else
    {
      int v29 = 0;
    }
    id v14 = v59;
    goto LABEL_28;
  }
  unint64_t v27 = *(NSObject **)(a1 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_2_66;
  block[3] = &unk_265471648;
  os_signpost_id_t v28 = v3;
  id v64 = v3;
  id v63 = v14;
  dispatch_async(v27, block);

  int v29 = 0;
LABEL_28:
  long long v46 = PUILogSnapshotCache();
  long long v47 = v46;
  os_signpost_id_t v48 = *(void *)(a1 + 88);
  if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    long long v49 = [*(id *)(a1 + 40) bundleURL];
    uint64_t v50 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    v75 = v49;
    __int16 v76 = 2114;
    uint64_t v77 = v50;
    __int16 v78 = 1024;
    int v79 = v29;
    __int16 v80 = 1024;
    int v81 = v60;
    _os_signpost_emit_with_name_impl(&dword_25A0AF000, v47, OS_SIGNPOST_INTERVAL_END, v48, "cacheSnapshotBundle", "snapshotBundle URL %{public}@ -> %{public}@; did succeed? %{BOOL}u; did cleanup existing entry? %{BOOL}u",
      buf,
      0x22u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

void __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) setFlag:1])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
    }
  }
}

uint64_t __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __78__PUIPosterSnapshotFilesystemCache_cacheSnapshotBundle_forRequest_completion___block_invoke_2_66(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_prepareSnapshotCache
{
  objc_initWeak(&location, self);
  id v2 = [MEMORY[0x263F5F450] sharedWorkloop];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__PUIPosterSnapshotFilesystemCache__prepareSnapshotCache__block_invoke;
  v3[3] = &unk_265471278;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__PUIPosterSnapshotFilesystemCache__prepareSnapshotCache__block_invoke(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = PUILogSnapshotCache();
    os_signpost_id_t v3 = os_signpost_id_generate(v2);

    id v4 = PUILogSnapshotCache();
    char v5 = v4;
    unint64_t v6 = v3 - 1;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SnapshotCachePrepare", (const char *)&unk_25A117B91, buf, 2u);
    }

    id v53 = PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier();
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    int v7 = [*((id *)WeakRetained + 3) checkResourceIsReachableAndReturnError:0];
    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    id v9 = v8;
    uint64_t v10 = *((void *)WeakRetained + 3);
    if (v7)
    {
      unint64_t v49 = v3 - 1;
      os_signpost_id_t v50 = v3;
      uint64_t v11 = [v8 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:0 options:1 error:0];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      obuint64_t j = v11;
      uint64_t v12 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v63 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            id v17 = [v16 lastPathComponent];
            char v18 = [v17 containsString:v53];

            if ((v18 & 1) == 0)
            {
              int v19 = [MEMORY[0x263F08850] defaultManager];
              int v20 = [v19 removeItemAtURL:v16 error:0];

              if (v20)
              {
                uint64_t v21 = PUILogSnapshotCache();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v67 = (uint64_t)v16;
                  _os_log_impl(&dword_25A0AF000, v21, OS_LOG_TYPE_DEFAULT, "Pruning old epoch: %{public}@", buf, 0xCu);
                }

                [*((id *)WeakRetained + 2) removeObjectForKey:v16];
              }
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
        }
        while (v13);
      }

      uint64_t v22 = PUILogSnapshotCache();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25A0AF000, v22, OS_LOG_TYPE_INFO, "Scanning for pre-cachable snapshot bundles", buf, 2u);
      }

      v51 = objc_opt_new();
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      int v23 = [MEMORY[0x263F08850] defaultManager];
      id v24 = [v23 enumeratorAtURL:*((void *)WeakRetained + 3) includingPropertiesForKeys:0 options:2 errorHandler:0];

      uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:v71 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v59 != v27) {
              objc_enumerationMutation(v24);
            }
            int v29 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            long long v30 = [v29 pathExtension];
            uint64_t v31 = [v30 localizedCompare:@"pks"];

            if (!v31)
            {
              [v51 addObject:v29];
              id v32 = PUILogSnapshotCache();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v67 = (uint64_t)v29;
                _os_log_impl(&dword_25A0AF000, v32, OS_LOG_TYPE_DEFAULT, "Found precachable url %{public}@", buf, 0xCu);
              }
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v71 count:16];
        }
        while (v26);
      }

      id v33 = PUILogSnapshotCache();
      os_signpost_id_t v3 = v50;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = [v51 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v67 = v34;
        _os_log_impl(&dword_25A0AF000, v33, OS_LOG_TYPE_INFO, "Found %lu pre-cachable snapshot bundles", buf, 0xCu);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v35 = v51;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v70 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v55;
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v55 != v38) {
              objc_enumerationMutation(v35);
            }
            id v40 = *(void **)(*((void *)&v54 + 1) + 8 * k);
            os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
            id v41 = [*((id *)WeakRetained + 2) objectForKey:v40];

            if (v41)
            {
              v42 = PUILogSnapshotCache();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v67 = (uint64_t)v40;
                _os_log_error_impl(&dword_25A0AF000, v42, OS_LOG_TYPE_ERROR, "Already cached %{public}@; moving on...",
                  buf,
                  0xCu);
              }
            }
            else
            {
              v42 = +[PUIPosterSnapshotBundle snapshotBundleAtURL:v40 error:0];
              uint64_t v43 = PUILogSnapshotCache();
              uint64_t v44 = v43;
              if (v42)
              {
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v67 = (uint64_t)v42;
                  __int16 v68 = 2114;
                  id v69 = v40;
                  _os_log_impl(&dword_25A0AF000, v44, OS_LOG_TYPE_DEFAULT, "PRECACHING %{public}@ @ %{public}@", buf, 0x16u);
                }

                [*((id *)WeakRetained + 2) setObject:v42 forKey:v40];
                id v45 = PUILogSnapshotCache();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v67 = (uint64_t)v42;
                  __int16 v68 = 2114;
                  id v69 = v40;
                  _os_log_impl(&dword_25A0AF000, v45, OS_LOG_TYPE_DEFAULT, "PRECACHED %{public}@ @ %{public}@", buf, 0x16u);
                }
              }
              else
              {
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v67 = (uint64_t)v40;
                  _os_log_error_impl(&dword_25A0AF000, v44, OS_LOG_TYPE_ERROR, "Failed to precache %{public}@; removing",
                    buf,
                    0xCu);
                }

                id v45 = [MEMORY[0x263F08850] defaultManager];
                [v45 removeItemAtURL:v40 error:0];
              }
            }
            os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v54 objects:v70 count:16];
        }
        while (v37);
      }

      unint64_t v6 = v49;
    }
    else
    {
      long long v46 = PFPosterPathFileAttributes();
      [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v46 error:0];

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    }
    long long v47 = PUILogSnapshotCache();
    os_signpost_id_t v48 = v47;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v48, OS_SIGNPOST_INTERVAL_END, v3, "SnapshotCachePrepare", (const char *)&unk_25A117B91, buf, 2u);
    }
  }
}

- (void)_cacheLock_cleanupPostersBefore:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_cacheLock);
  char v5 = PUILogSnapshotCache();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  int v7 = PUILogSnapshotCache();
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    id v76 = v4;
    _os_signpost_emit_with_name_impl(&dword_25A0AF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SnapshotCache-cleanupPostersBefore", "latest path %{public}@", buf, 0xCu);
  }

  id v9 = [(id)objc_opt_class() _snapshotURLForPosterPath:v4 relativeTo:self->_cacheURLInternalDirectory];
  uint64_t v10 = [v9 URLByDeletingLastPathComponent];
  uint64_t v11 = [v10 URLByDeletingLastPathComponent];

  uint64_t v12 = [v4 serverIdentity];
  unint64_t v13 = [v12 version];

  if (v13)
  {
    unint64_t v47 = v6 - 1;
    os_signpost_id_t v48 = self;
    unint64_t v49 = v9;
    id v50 = v4;
    os_signpost_id_t spid = v6;
    uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
    long long v59 = objc_opt_new();
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obuint64_t j = [v14 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:0 options:17 error:0];
    uint64_t v15 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v69;
      id v53 = v14;
      long long v54 = v11;
      uint64_t v51 = *(void *)v69;
      unint64_t v52 = v13;
      do
      {
        uint64_t v18 = 0;
        uint64_t v55 = v16;
        do
        {
          if (*(void *)v69 != v17) {
            objc_enumerationMutation(obj);
          }
          int v19 = *(void **)(*((void *)&v68 + 1) + 8 * v18);
          int v20 = [v19 lastPathComponent];
          uint64_t v21 = [v11 URLByAppendingPathComponent:v20 isDirectory:1];

          uint64_t v22 = [v19 lastPathComponent];
          if ([v22 integerValue] < v13)
          {
            long long v57 = v22;
            uint64_t v58 = v18;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            int v23 = [v14 enumeratorAtURL:v21 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:16 errorHandler:0];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v73 count:16];
            uint64_t v25 = v21;
            if (v24)
            {
              uint64_t v26 = v24;
              uint64_t v27 = *(void *)v65;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v65 != v27) {
                    objc_enumerationMutation(v23);
                  }
                  int v29 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                  long long v30 = [v29 pathExtension];
                  uint64_t v31 = [v30 localizedCompare:@"pks"];

                  if (!v31)
                  {
                    id v32 = [v29 URLByStandardizingPath];
                    id v33 = [v32 URLByDeletingLastPathComponent];
                    uint64_t v34 = [v29 lastPathComponent];
                    [v33 URLByAppendingPathComponent:v34 isDirectory:0];
                    uint64_t v36 = v35 = v25;

                    [v59 addObject:v36];
                    uint64_t v25 = v35;
                  }
                }
                uint64_t v26 = [v23 countByEnumeratingWithState:&v64 objects:v73 count:16];
              }
              while (v26);
            }

            uint64_t v14 = v53;
            uint64_t v11 = v54;
            uint64_t v17 = v51;
            unint64_t v13 = v52;
            uint64_t v21 = v25;
            uint64_t v16 = v55;
            uint64_t v22 = v57;
            uint64_t v18 = v58;
          }

          ++v18;
        }
        while (v18 != v16);
        uint64_t v16 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
      }
      while (v16);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v37 = v59;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v60 objects:v72 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v61 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v60 + 1) + 8 * j);
          if ([v14 removeItemAtURL:v42 error:0]) {
            [(NSCache *)v48->_cacheLock_URLToSnapshotBundleCache removeObjectForKey:v42];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v60 objects:v72 count:16];
      }
      while (v39);
    }

    uint64_t v43 = PUILogSnapshotCache();
    uint64_t v44 = v43;
    id v4 = v50;
    if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_DWORD *)buf = 138543362;
      id v76 = v37;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v44, OS_SIGNPOST_INTERVAL_END, spid, "SnapshotCache-cleanupPostersBefore", "cleanedupPathURLs %{public}@", buf, 0xCu);
    }

    id v9 = v49;
  }
  else
  {
    id v45 = PUILogSnapshotCache();
    uint64_t v14 = v45;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25A0AF000, v14, OS_SIGNPOST_INTERVAL_END, v6, "SnapshotCache-cleanupPostersBefore", "version 0; no cleanup needed",
        buf,
        2u);
    }
  }
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_fileSystemQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_cacheURLInternalDirectory, 0);
  objc_storeStrong((id *)&self->_cacheLock_URLToSnapshotBundleCache, 0);
}

- (void)initWithURL:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  os_signpost_id_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)latestSnapshotBundleForPoster:(const char *)a1 snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  os_signpost_id_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)latestSnapshotBundleForPoster:(os_log_t)log snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25A0AF000, log, OS_LOG_TYPE_ERROR, "failed to load snapshotBundle %@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)latestSnapshotBundleForPoster:(const char *)a1 snapshotCacheIdentifier:interfaceOrientation:userInterfaceStyle:hardwareIdentifier:error:.cold.3(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end