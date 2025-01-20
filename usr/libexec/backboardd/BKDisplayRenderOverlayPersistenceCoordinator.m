@interface BKDisplayRenderOverlayPersistenceCoordinator
+ (BKDisplayRenderOverlayPersistenceCoordinator)sharedInstance;
- (BKDisplayRenderOverlayPersistenceCoordinator)init;
- (BOOL)destroyOverlay:(id)a3;
- (BOOL)saveOverlay:(id)a3;
- (id)_fileNameForOverlay:(id)a3;
- (id)_filePathForOverlay:(id)a3;
- (id)rebuildPersistentOverlays;
@end

@implementation BKDisplayRenderOverlayPersistenceCoordinator

- (void).cxx_destruct
{
}

- (id)_fileNameForOverlay:(id)a3
{
  id v3 = a3;
  v4 = [v3 descriptor];
  uint64_t v5 = [v4 displayUUID];
  v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = @"main";
  }
  v8 = [v3 name];

  v9 = +[NSString stringWithFormat:@"%@|%@", v7, v8];

  return v9;
}

- (id)_filePathForOverlay:(id)a3
{
  v4 = [(BKDisplayRenderOverlayPersistenceCoordinator *)self _fileNameForOverlay:a3];
  rootPersistencePath = self->_rootPersistencePath;
  v6 = [v4 stringByAppendingPathExtension:@"libitmap"];
  CFStringRef v7 = [(NSString *)rootPersistencePath stringByAppendingPathComponent:v6];

  return v7;
}

- (BOOL)destroyOverlay:(id)a3
{
  id v3 = [(BKDisplayRenderOverlayPersistenceCoordinator *)self _filePathForOverlay:a3];
  if (v3)
  {
    v4 = +[NSFileManager defaultManager];
    unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:0];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)saveOverlay:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = BKLogDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v32 = [v4 name];
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = (uint64_t)v32;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[BKDisplayRenderOverlayPersistenceCoordinator] Persisting overlay: %{public}@", buf, 0xCu);
    }
    v6 = [v4 _persistenceData];
    CFStringRef v7 = [v6 bs_secureEncoded];

    v8 = [(BKDisplayRenderOverlayPersistenceCoordinator *)self _fileNameForOverlay:v4];
    uint64_t v35 = [(BKDisplayRenderOverlayPersistenceCoordinator *)self _filePathForOverlay:v4];
    v9 = +[NSFileManager defaultManager];
    NSFileAttributeKey v47 = NSFilePosixPermissions;
    v48 = &off_100103748;
    unsigned int v10 = 1;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v34 = (void *)v11;
    if ([v9 fileExistsAtPath:self->_rootPersistencePath isDirectory:0])
    {
      id v12 = 0;
    }
    else
    {
      rootPersistencePath = self->_rootPersistencePath;
      id v38 = 0;
      unsigned int v10 = [v9 createDirectoryAtPath:rootPersistencePath withIntermediateDirectories:1 attributes:v11 error:&v38];
      id v15 = v38;
      if ((v10 & 1) == 0)
      {
        v16 = BKLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = self->_rootPersistencePath;
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = (uint64_t)v17;
          __int16 v41 = 2114;
          uint64_t v42 = (uint64_t)v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to create path: %{public}@: %{public}@", buf, 0x16u);
        }
      }
      v18 = +[NSURL fileURLWithPath:self->_rootPersistencePath isDirectory:1];
      id v37 = 0;
      unsigned __int8 v19 = [v18 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v37];
      id v12 = v37;
      if ((v19 & 1) == 0)
      {
        v20 = BKLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->_rootPersistencePath;
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = (uint64_t)v21;
          __int16 v41 = 2114;
          uint64_t v42 = (uint64_t)v12;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to exclude path from backups: %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }
    NSFileAttributeKey v45 = NSFilePosixPermissions;
    v46 = &off_100103760;
    v22 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    NSTemporaryDirectory();
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23) {
      v23 = @"/tmp";
    }
    v25 = [(__CFString *)v23 stringByAppendingPathComponent:v8];

    if (!v10)
    {
      LOBYTE(v13) = 0;
      v26 = (void *)v35;
LABEL_33:

      goto LABEL_34;
    }
    v26 = (void *)v35;
    if ([v9 createFileAtPath:v25 contents:v7 attributes:v22])
    {
      id v36 = v12;
      unsigned int v13 = [v9 moveItemAtPath:v25 toPath:v35 error:&v36];
      id v33 = v36;

      if (v13)
      {
        v27 = BKLogDisplay();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v40 = v35;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[BKDisplayRenderOverlayPersistenceCoordinator] Wrote overlay to file: %{public}@", buf, 0xCu);
        }
        LOBYTE(v13) = 1;
        goto LABEL_31;
      }
      v27 = BKLogCommon();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:
        id v12 = v33;
        goto LABEL_32;
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = (uint64_t)v25;
      __int16 v41 = 2114;
      uint64_t v42 = v35;
      __int16 v43 = 2114;
      id v12 = v33;
      id v44 = v33;
      v28 = "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to move temporary file (%{public}@) to real location i"
            "n the shared container (%{public}@): %{public}@";
      v29 = v27;
      uint32_t v30 = 32;
    }
    else
    {
      v27 = BKLogCommon();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        LOBYTE(v13) = 0;
LABEL_32:

        goto LABEL_33;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = (uint64_t)v25;
      v28 = "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to save temporary snapshot to disk at %{public}@";
      v29 = v27;
      uint32_t v30 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
    goto LABEL_30;
  }
  LOBYTE(v13) = 0;
LABEL_34:

  return v13;
}

- (id)rebuildPersistentOverlays
{
  id v22 = +[NSMutableArray array];
  id v3 = +[NSFileManager defaultManager];
  v23 = self;
  id v4 = [v3 enumeratorAtPath:self->_rootPersistencePath];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v27;
    *(void *)&long long v6 = 138543618;
    long long v21 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned int v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSuffix:", @"libitmap", v21))
        {
          uint64_t v11 = [(NSString *)v23->_rootPersistencePath stringByAppendingPathComponent:v10];
          id v12 = objc_alloc((Class)NSData);
          id v25 = 0;
          id v13 = [v12 initWithContentsOfFile:v11 options:8 error:&v25];
          id v14 = v25;
          id v15 = +[_BKDisplayRenderOverlayPersistenceData classesRequiredToDecode];
          v16 = +[_BKDisplayRenderOverlayPersistenceData bs_secureDecodedFromData:v13 withAdditionalClasses:v15];

          id v17 = [v16 overlayType];
          if ((unint64_t)v17 <= 4)
          {
            objc_opt_class();
            id v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v18 = [objc_alloc((Class)v17) _initWithPersistenceData:v16];
          if (v18)
          {
            unsigned __int8 v19 = BKLogDisplay();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v21;
              id v31 = v18;
              __int16 v32 = 2114;
              id v33 = v11;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[BKDisplayRenderOverlayPersistenceCoordinator] Loaded overlay from persistence: %{public}@ from location: %{public}@", buf, 0x16u);
            }

            [v22 addObject:v18];
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v7);
  }

  return v22;
}

- (BKDisplayRenderOverlayPersistenceCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKDisplayRenderOverlayPersistenceCoordinator;
  v2 = [(BKDisplayRenderOverlayPersistenceCoordinator *)&v8 init];
  if (v2)
  {
    id v3 = BSSystemSharedDirectoryForCurrentProcess();
    id v4 = [v3 stringByAppendingPathComponent:@"RenderOverlay"];
    id v5 = (NSString *)[v4 copy];
    rootPersistencePath = v2->_rootPersistencePath;
    v2->_rootPersistencePath = v5;
  }
  return v2;
}

+ (BKDisplayRenderOverlayPersistenceCoordinator)sharedInstance
{
  if (qword_100123178 != -1) {
    dispatch_once(&qword_100123178, &stru_1000F8D30);
  }
  v2 = (void *)qword_100123170;

  return (BKDisplayRenderOverlayPersistenceCoordinator *)v2;
}

@end