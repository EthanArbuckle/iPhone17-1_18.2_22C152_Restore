@interface SDCacheDeleter
+ (void)registerCallbacks;
- (NSString)archivesDirectory;
- (SDCacheDeleter)init;
- (SDCacheDeleter)initWithArchivesDirectory:(id)a3;
- (__CFDictionary)periodicAPFSMarkAsPurgeable:(id)a3;
- (id)getEnumeratorForVolume:(id)a3;
- (void)setArchivesDirectory:(id)a3;
@end

@implementation SDCacheDeleter

- (SDCacheDeleter)init
{
  v3 = +[SDCacheEnumerator sysdiagnoseDirectory];
  v4 = [(SDCacheDeleter *)self initWithArchivesDirectory:v3];

  return v4;
}

- (SDCacheDeleter)initWithArchivesDirectory:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SDCacheDeleter;
  v6 = [(SDCacheDeleter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archivesDirectory, a3);
    v8 = v7;
  }

  return v7;
}

- (id)getEnumeratorForVolume:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SDCacheDeleter *)self archivesDirectory];
    v6 = [v4 stringByAppendingPathComponent:v5];
    v7 = +[NSURL fileURLWithPath:v6];

    if (v7) {
      id v8 = [[SDCacheEnumerator alloc] initCacheEnumeratorWithVolume:v4 WithFlags:16];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (__CFDictionary)periodicAPFSMarkAsPurgeable:(id)a3
{
  v3 = [(SDCacheDeleter *)self getEnumeratorForVolume:a3];
  if (v3)
  {
    id v4 = +[NSDate dateWithTimeIntervalSinceNow:-3600.0];
    uint64_t v5 = [v3 nextSysdiagnoseFile];
    if (v5)
    {
      v7 = (void *)v5;
      *(void *)&long long v6 = 136446978;
      long long v25 = v6;
      do
      {
        id v27 = 0;
        [v7 getResourceValue:&v27 forKey:NSURLCreationDateKey error:v25];
        id v8 = v27;
        if ([v8 compare:v4] != (id)1)
        {
          uint64_t v26 = 0;
          id v9 = v7;
          int v10 = open((const char *)[v9 fileSystemRepresentation], 0);
          if (v10 < 0)
          {
            v18 = sub_100056DA8();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              id v21 = [v9 fileSystemRepresentation];
              v22 = __error();
              v23 = strerror(*v22);
              *(_DWORD *)buf = 136446466;
              id v29 = v21;
              __int16 v30 = 2082;
              *(void *)v31 = v23;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to open '%{public}s' with error: %{public}s", buf, 0x16u);
            }
          }
          else
          {
            int v11 = v10;
            uint64_t v26 = 66052;
            int v12 = ffsctl(v10, 0xC0084A44uLL, &v26, 0);
            v13 = sub_100056DA8();
            v14 = v13;
            if (v12)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                id v15 = [v9 fileSystemRepresentation];
                v16 = __error();
                v17 = strerror(*v16);
                *(_DWORD *)buf = v25;
                id v29 = v15;
                __int16 v30 = 1024;
                *(_DWORD *)v31 = v12;
                *(_WORD *)&v31[4] = 2082;
                *(void *)&v31[6] = v17;
                __int16 v32 = 2048;
                uint64_t v33 = v26;
                _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to mark '%{public}s' as purgeable with error %d (%{public}s) (flags 0x%llx)", buf, 0x26u);
              }
            }
            else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = [v9 fileSystemRepresentation];
              *(_DWORD *)buf = 136446466;
              id v29 = v19;
              __int16 v30 = 2048;
              *(void *)v31 = v26;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Marked '%{public}s' purgeable with flags 0x%llx", buf, 0x16u);
            }

            close(v11);
          }
        }

        uint64_t v20 = [v3 nextSysdiagnoseFile];

        v7 = (void *)v20;
      }
      while (v20);
    }
  }
  return 0;
}

+ (void)registerCallbacks
{
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    *(void *)buf = 0;
    id v4 = buf;
    uint64_t v5 = 0x3032000000;
    long long v6 = sub_100056F5C;
    v7 = sub_100056F6C;
    id v8 = objc_alloc_init(SDCacheDeleter);
    CacheDeleteRegisterInfoCallbacks();
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v2 = sub_100056DA8();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Not registering for CacheDelete, as the framework is missing", buf, 2u);
    }
  }
}

- (NSString)archivesDirectory
{
  return self->_archivesDirectory;
}

- (void)setArchivesDirectory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end