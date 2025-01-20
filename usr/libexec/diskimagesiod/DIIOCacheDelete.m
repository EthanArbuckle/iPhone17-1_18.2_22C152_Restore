@interface DIIOCacheDelete
- (BOOL)registerPeriodicCallback;
- (BOOL)setupNewConnection:(id)a3;
- (DIIOCacheDelete)initWithDebugServiceName:(id)a3;
- (NSString)debugServiceName;
- (NSTimer)exitTimer;
- (OS_dispatch_source)sigtermHandler;
- (id)onPeriodicWithInfo:(id)a3 urgency:(int)a4;
- (id)sandboxProfile;
- (id)serviceName;
- (unint64_t)eraseOldCacheFiles;
- (void)restartExitTimer;
- (void)setExitTimer:(id)a3;
- (void)setSigtermHandler:(id)a3;
- (void)setupExitTimer:(id)a3;
- (void)setupSigtermHandler;
@end

@implementation DIIOCacheDelete

- (DIIOCacheDelete)initWithDebugServiceName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIIOCacheDelete;
  v6 = [(DIBaseServiceDelegate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_debugServiceName, a3);
    [(DIIOCacheDelete *)v7 setupSigtermHandler];
  }

  return v7;
}

- (id)sandboxProfile
{
  return @"com.apple.diskimagesiod";
}

- (void)setupSigtermHandler
{
  signal(15, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  sigtermHandler = self->_sigtermHandler;
  self->_sigtermHandler = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_sigtermHandler, &stru_100191558);
  id v5 = self->_sigtermHandler;

  dispatch_resume(v5);
}

- (void)restartExitTimer
{
  v3 = [(DIIOCacheDelete *)self exitTimer];

  if (v3)
  {
    v4 = [(DIIOCacheDelete *)self exitTimer];
    [v4 invalidate];

    [(DIIOCacheDelete *)self setExitTimer:0];
  }

  [(DIIOCacheDelete *)self performSelectorOnMainThread:"setupExitTimer:" withObject:0 waitUntilDone:0];
}

- (void)setupExitTimer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004628;
  v6[3] = &unk_100191580;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v6 block:20.0];
  [(DIIOCacheDelete *)self setExitTimer:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (unint64_t)eraseOldCacheFiles
{
  if (confstr(65538, v82, 0x400uLL))
  {
    uint64_t v2 = +[NSURL fileURLWithFileSystemRepresentation:v82 isDirectory:1 relativeToURL:0];
    v52 = +[NSString stringWithFormat:@"^%@.*\\.%@$", @"diskimage_", @"cache"];
    v58 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:");
    v3 = +[NSFileManager defaultManager];
    v81[0] = NSURLContentAccessDateKey;
    v81[1] = NSURLFileSizeKey;
    v81[2] = NSURLNameKey;
    id v4 = +[NSArray arrayWithObjects:v81 count:3];
    v53 = (void *)v2;
    id v5 = [v3 enumeratorAtURL:v2 includingPropertiesForKeys:v4 options:5 errorHandler:&stru_1001915C0];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
    if (!v6)
    {
      unint64_t v56 = 0;
      unint64_t v55 = 0;
      int v54 = 0;
      int v57 = 0;
      goto LABEL_51;
    }
    id v7 = v6;
    unint64_t v56 = 0;
    unint64_t v55 = 0;
    int v54 = 0;
    int v57 = 0;
    uint64_t v8 = *(void *)v68;
    NSURLResourceKey v9 = NSURLNameKey;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(void *)v68 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v10);
        id v66 = 0;
        unsigned int v12 = [v11 getResourceValue:&v66 forKey:v9 error:v50, v51];
        id v13 = v66;
        v14 = v13;
        if (v12
          && objc_msgSend(v58, "numberOfMatchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length")))
        {
          id v64 = 0;
          id v65 = 0;
          unsigned int v15 = [v11 getResourceValue:&v65 forKey:NSURLContentAccessDateKey error:&v64];
          id v16 = v65;
          id v17 = v64;
          v60 = v16;
          if (v15)
          {
            id v62 = 0;
            id v63 = 0;
            unsigned __int8 v18 = [v11 getResourceValue:&v63 forKey:NSURLFileSizeKey error:&v62];
            id v19 = v63;
            id v20 = v62;

            if (v18)
            {
              ++v57;
              v56 += (unint64_t)[v19 unsignedLongLongValue];
              [v16 timeIntervalSinceNow];
              double v22 = v21;
              int v23 = *__error();
              int v24 = sub_1000D29A0();
              if (v22 >= -259200.0)
              {
                if (v24)
                {
                  uint64_t v71 = 0;
                  v33 = sub_1000D2920();
                  os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
                  *(_DWORD *)buf = 68158466;
                  int v73 = 37;
                  __int16 v74 = 2080;
                  v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                  __int16 v76 = 2114;
                  *(void *)v77 = v11;
                  *(_WORD *)&v77[8] = 2048;
                  *(double *)&v77[10] = v22 / -86400.0;
                  LODWORD(v51) = 38;
                  v50 = buf;
                  v34 = (char *)_os_log_send_and_compose_impl();

                  if (v34)
                  {
                    fprintf(__stderrp, "%s\n", v34);
                    free(v34);
                  }
                  NSURLResourceKey v9 = NSURLNameKey;
                }
                else
                {
                  v38 = sub_1000D2920();
                  NSURLResourceKey v9 = NSURLNameKey;
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 68158466;
                    int v73 = 37;
                    __int16 v74 = 2080;
                    v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                    __int16 v76 = 2114;
                    *(void *)v77 = v11;
                    *(_WORD *)&v77[8] = 2048;
                    *(double *)&v77[10] = v22 / -86400.0;
                    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%.*s: Skipping %{public}@ (last access time was %.2f days ago)", buf, 0x26u);
                  }
                }
                *__error() = v23;
                id v17 = v20;
                goto LABEL_26;
              }
              if (v24)
              {
                uint64_t v71 = 0;
                v25 = sub_1000D2920();
                os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
                *(_DWORD *)buf = 68158466;
                int v73 = 37;
                __int16 v74 = 2080;
                v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                __int16 v76 = 2114;
                *(void *)v77 = v11;
                *(_WORD *)&v77[8] = 2048;
                *(double *)&v77[10] = v22 / -86400.0;
                LODWORD(v51) = 38;
                v50 = buf;
                v26 = (char *)_os_log_send_and_compose_impl();

                if (v26)
                {
                  fprintf(__stderrp, "%s\n", v26);
                  free(v26);
                }
              }
              else
              {
                v35 = sub_1000D2920();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 68158466;
                  int v73 = 37;
                  __int16 v74 = 2080;
                  v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                  __int16 v76 = 2114;
                  *(void *)v77 = v11;
                  *(_WORD *)&v77[8] = 2048;
                  *(double *)&v77[10] = v22 / -86400.0;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%.*s: Last access time expired for %{public}@ (%.2f days), removing", buf, 0x26u);
                }
              }
              *__error() = v23;
              v36 = +[NSFileManager defaultManager];
              id v61 = v20;
              unsigned int v37 = [v36 removeItemAtURL:v11 error:&v61];
              id v17 = v61;

              if (v37)
              {
                ++v54;
                v55 += (unint64_t)[v19 unsignedLongLongValue];
                NSURLResourceKey v9 = NSURLNameKey;
                goto LABEL_26;
              }
              int v27 = *__error();
              if (!sub_1000D29A0())
              {
                v30 = sub_1000D2920();
                NSURLResourceKey v9 = NSURLNameKey;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 68158466;
                  int v73 = 37;
                  __int16 v74 = 2080;
                  v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                  __int16 v76 = 2114;
                  *(void *)v77 = v11;
                  *(_WORD *)&v77[8] = 2114;
                  *(void *)&v77[10] = v17;
                  v31 = v30;
                  v32 = "%.*s: Failed to remove %{public}@: %{public}@";
LABEL_23:
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x26u);
                }
                goto LABEL_24;
              }
LABEL_18:
              uint64_t v71 = 0;
              v28 = sub_1000D2920();
              os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
              *(_DWORD *)buf = 68158466;
              int v73 = 37;
              __int16 v74 = 2080;
              v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
              __int16 v76 = 2114;
              *(void *)v77 = v11;
              *(_WORD *)&v77[8] = 2114;
              *(void *)&v77[10] = v17;
              LODWORD(v51) = 38;
              v50 = buf;
              v29 = (char *)_os_log_send_and_compose_impl();

              if (v29)
              {
                fprintf(__stderrp, "%s\n", v29);
                free(v29);
              }
              NSURLResourceKey v9 = NSURLNameKey;
              goto LABEL_25;
            }
            id v17 = v20;
            NSURLResourceKey v9 = NSURLNameKey;
          }
          else
          {
            id v19 = 0;
          }
          int v27 = *__error();
          if (sub_1000D29A0()) {
            goto LABEL_18;
          }
          v30 = sub_1000D2920();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158466;
            int v73 = 37;
            __int16 v74 = 2080;
            v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
            __int16 v76 = 2114;
            *(void *)v77 = v11;
            *(_WORD *)&v77[8] = 2114;
            *(void *)&v77[10] = v17;
            v31 = v30;
            v32 = "%.*s: Failed retrieving property for %{public}@: %{public}@";
            goto LABEL_23;
          }
LABEL_24:

LABEL_25:
          *__error() = v27;
LABEL_26:
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v39 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
      id v7 = v39;
      if (!v39)
      {
LABEL_51:

        int v43 = *__error();
        if (sub_1000D29A0())
        {
          uint64_t v71 = 0;
          v44 = sub_1000D2920();
          os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68158978;
          int v73 = 37;
          __int16 v74 = 2080;
          unint64_t v45 = v55;
          v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
          __int16 v76 = 1024;
          *(_DWORD *)v77 = v54;
          *(_WORD *)&v77[4] = 2048;
          *(void *)&v77[6] = v55 >> 20;
          *(_WORD *)&v77[14] = 1024;
          *(_DWORD *)&v77[16] = v57;
          __int16 v78 = 2048;
          unint64_t v79 = v56 >> 20;
          v46 = (char *)_os_log_send_and_compose_impl();

          if (v46)
          {
            fprintf(__stderrp, "%s\n", v46);
            free(v46);
          }
        }
        else
        {
          v47 = sub_1000D2920();
          unint64_t v45 = v55;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68158978;
            int v73 = 37;
            __int16 v74 = 2080;
            v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
            __int16 v76 = 1024;
            *(_DWORD *)v77 = v54;
            *(_WORD *)&v77[4] = 2048;
            *(void *)&v77[6] = v55 >> 20;
            *(_WORD *)&v77[14] = 1024;
            *(_DWORD *)&v77[16] = v57;
            __int16 v78 = 2048;
            unint64_t v79 = v56 >> 20;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%.*s: Summary: removed %u files (%llu MB) out of %u files (%llu MB) of cache", buf, 0x32u);
          }
        }
        *__error() = v43;

        return v45;
      }
    }
  }
  int v40 = *__error();
  if (sub_1000D29A0())
  {
    uint64_t v71 = 0;
    v41 = sub_1000D2920();
    os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v73 = 37;
    __int16 v74 = 2080;
    v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
    v42 = (char *)_os_log_send_and_compose_impl();

    if (v42)
    {
      fprintf(__stderrp, "%s\n", v42);
      free(v42);
    }
  }
  else
  {
    v48 = sub_1000D2920();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v73 = 37;
      __int16 v74 = 2080;
      v75 = "-[DIIOCacheDelete eraseOldCacheFiles]";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%.*s: Could not determine cache dir", buf, 0x12u);
    }
  }
  unint64_t v45 = 0;
  *__error() = v40;
  return v45;
}

- (id)onPeriodicWithInfo:(id)a3 urgency:(int)a4
{
  id v6 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v7 = *__error();
  if (sub_1000D29A0())
  {
    uint64_t v8 = sub_1000D2920();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158467;
    int v17 = 46;
    __int16 v18 = 2080;
    id v19 = "-[DIIOCacheDelete onPeriodicWithInfo:urgency:]";
    __int16 v20 = 1024;
    int v21 = a4;
    __int16 v22 = 2113;
    int v23 = v6;
    NSURLResourceKey v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    v10 = sub_1000D2920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158467;
      int v17 = 46;
      __int16 v18 = 2080;
      id v19 = "-[DIIOCacheDelete onPeriodicWithInfo:urgency:]";
      __int16 v20 = 1024;
      int v21 = a4;
      __int16 v22 = 2113;
      int v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Reached periodic cache delete with urgency %d, volume: %{private}@", buf, 0x22u);
    }
  }
  *__error() = v7;
  v11 = +[NSNumber numberWithUnsignedLongLong:[(DIIOCacheDelete *)self eraseOldCacheFiles]];
  [(DIIOCacheDelete *)self restartExitTimer];
  v14[0] = @"CACHE_DELETE_VOLUME";
  v14[1] = @"CACHE_DELETE_AMOUNT";
  v15[0] = v6;
  v15[1] = v11;
  unsigned int v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (BOOL)registerPeriodicCallback
{
  objc_initWeak(&location, self);
  int v17 = &_CacheDeleteRegisterInfoCallbacks;
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    objc_copyWeak(&v15, &location);
    int v2 = CacheDeleteRegisterInfoCallbacks();
    BOOL v3 = v2 == 0;
    if (v2)
    {
      int v4 = *__error();
      if (!sub_1000D29A0())
      {
        v11 = sub_1000D2920();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68157954;
          int v20 = 43;
          __int16 v21 = 2080;
          __int16 v22 = "-[DIIOCacheDelete registerPeriodicCallback]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%.*s: CacheDelete registration failed", buf, 0x12u);
        }

        goto LABEL_23;
      }
      uint64_t v16 = 0;
      id v5 = sub_1000D2920();
      os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v20 = 43;
      __int16 v21 = 2080;
      __int16 v22 = "-[DIIOCacheDelete registerPeriodicCallback]";
      id v6 = (char *)_os_log_send_and_compose_impl();

      if (v6) {
        goto LABEL_11;
      }
    }
    else
    {
      int v4 = *__error();
      if (!sub_1000D29A0())
      {
        id v13 = sub_1000D2920();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v20 = 43;
          __int16 v21 = 2080;
          __int16 v22 = "-[DIIOCacheDelete registerPeriodicCallback]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Cache delete periodic registered", buf, 0x12u);
        }

        goto LABEL_23;
      }
      uint64_t v16 = 0;
      v10 = sub_1000D2920();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v20 = 43;
      __int16 v21 = 2080;
      __int16 v22 = "-[DIIOCacheDelete registerPeriodicCallback]";
      id v6 = (char *)_os_log_send_and_compose_impl();

      if (v6)
      {
LABEL_11:
        fprintf(__stderrp, "%s\n", v6);
        free(v6);
      }
    }
LABEL_23:
    *__error() = v4;
    objc_destroyWeak(&v15);
    goto LABEL_24;
  }
  int v7 = *__error();
  if (sub_1000D29A0())
  {
    uint64_t v16 = 0;
    uint64_t v8 = sub_1000D2920();
    os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v20 = 43;
    __int16 v21 = 2080;
    __int16 v22 = "-[DIIOCacheDelete registerPeriodicCallback]";
    NSURLResourceKey v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    unsigned int v12 = sub_1000D2920();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v20 = 43;
      __int16 v21 = 2080;
      __int16 v22 = "-[DIIOCacheDelete registerPeriodicCallback]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%.*s: CacheDelete is not supported, daemon was launched unexpectedly without an instance ID", buf, 0x12u);
    }
  }
  BOOL v3 = 0;
  *__error() = v7;
LABEL_24:
  objc_destroyWeak(&location);
  return v3;
}

- (id)serviceName
{
  return [(DIIOCacheDelete *)self debugServiceName];
}

- (BOOL)setupNewConnection:(id)a3
{
  id v3 = a3;
  int v4 = *__error();
  if (sub_1000D29A0())
  {
    id v5 = sub_1000D2920();
    os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v9 = 38;
    __int16 v10 = 2080;
    v11 = "-[DIIOCacheDelete setupNewConnection:]";
    id v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf(__stderrp, "%s\n", v6);
      free(v6);
    }
  }
  else
  {
    int v7 = sub_1000D2920();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v9 = 38;
      __int16 v10 = 2080;
      v11 = "-[DIIOCacheDelete setupNewConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%.*s: Connection to cache delete instance is not allowed, quitting", buf, 0x12u);
    }
  }
  *__error() = v4;
  exit(0);
}

- (NSString)debugServiceName
{
  return self->_debugServiceName;
}

- (OS_dispatch_source)sigtermHandler
{
  return self->_sigtermHandler;
}

- (void)setSigtermHandler:(id)a3
{
}

- (NSTimer)exitTimer
{
  return self->_exitTimer;
}

- (void)setExitTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_sigtermHandler, 0);

  objc_storeStrong((id *)&self->_debugServiceName, 0);
}

@end