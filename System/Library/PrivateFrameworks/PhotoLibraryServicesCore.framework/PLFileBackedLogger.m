@interface PLFileBackedLogger
+ (BOOL)_getResourceValue:(id *)a3 key:(id)a4 url:(id)a5 error:(id *)a6;
+ (id)_openLoggerAtURL:(id)a3 logRotate:(BOOL)a4 error:(id *)a5;
+ (id)_removeAndCreateLoggerAtURL:(id)a3 logRotate:(BOOL)a4 error:(id *)a5;
+ (id)_setupWithLibraryIdentifier:(id)a3 type:(char)a4 logURL:(id)a5;
+ (id)setupWithLibraryIdentifier:(id)a3 type:(char)a4;
- (BOOL)enableAutoFlush;
- (BOOL)isClosed;
- (NSString)tag;
- (PLFileBackedLogger)init;
- (PLFileBackedLogger)initWithLogFileURL:(id)a3 logRotate:(BOOL)a4;
- (char)loggerType;
- (id)_inlock_createLoggerRecordWithLogFileURL:(id)a3 logRotate:(BOOL)a4 didRebuildLogArchive:(BOOL *)a5 error:(id *)a6;
- (int)fileRefCount;
- (void)_inlock_flush;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)logWithMessage:(const char *)a3 fromCodeLocation:(id)a4 type:(unsigned __int8)a5;
- (void)setEnableAutoFlush:(BOOL)a3;
- (void)setLoggerType:(char)a3;
- (void)setTag:(id)a3;
@end

@implementation PLFileBackedLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_lock_loggerRecord, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)setTag:(id)a3
{
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLoggerType:(char)a3
{
  self->_loggerType = a3;
}

- (char)loggerType
{
  return self->_loggerType;
}

- (void)setEnableAutoFlush:(BOOL)a3
{
  self->_enableAutoFlush = a3;
}

- (BOOL)enableAutoFlush
{
  return self->_enableAutoFlush;
}

- (BOOL)isClosed
{
  LOBYTE(self) = self->_lock_closed;
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  return (char)self;
}

- (int)fileRefCount
{
  LODWORD(self) = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord refCount];
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  return (int)self;
}

- (void)logWithMessage:(const char *)a3 fromCodeLocation:(id)a4 type:(unsigned __int8)a5
{
  int v5 = a5;
  uint64_t v6 = *(void *)&a4.var1;
  var0 = a4.var0;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  __uint64_t v30 = 0;
  pthread_threadid_np(0, &v30);
  uint64_t v10 = getpid();
  v11 = [MEMORY[0x1E4F28F80] processInfo];
  id v12 = [v11 processName];
  uint64_t v13 = [v12 UTF8String];

  if (var0)
  {
    v14 = [NSString stringWithUTF8String:var0];
    v15 = [v14 lastPathComponent];
  }
  else
  {
    v15 = @"unknown";
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  dateFormatter = self->_dateFormatter;
  v18 = [MEMORY[0x1E4F1C9C8] date];
  v19 = [(NSDateFormatter *)dateFormatter stringFromDate:v18];
  [v16 appendString:v19];

  if (v5 <= 1)
  {
    if (!v5)
    {
      v20 = "Default";
      goto LABEL_16;
    }
    if (v5 == 1)
    {
      v20 = "Info";
      goto LABEL_16;
    }
  }
  else
  {
    switch(v5)
    {
      case 2:
        v20 = "Debug";
        goto LABEL_16;
      case 16:
        v20 = "Error";
        goto LABEL_16;
      case 17:
        v20 = "Fault";
        goto LABEL_16;
    }
  }
  v20 = "Unknown";
LABEL_16:
  [v16 appendFormat:@"0x%-8llx %-8s %8d %s: %@:%-5d ", v30, v20, v10, v13, v15, v6];
  if (self->_tag) {
    [v16 appendFormat:@"id:%@ ", self->_tag];
  }
  objc_msgSend(v16, "appendFormat:", @"%s\n", a3);
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  lock_loggerRecord = self->_lock_loggerRecord;
  if (lock_loggerRecord)
  {
    v22 = [(PLAppleArchiveLoggerRecord *)lock_loggerRecord logger];
    id v23 = v16;
    id v29 = 0;
    char v24 = objc_msgSend(v22, "encodeBuffer:size:error:", objc_msgSend(v23, "cStringUsingEncoding:", 4), objc_msgSend(v23, "lengthOfBytesUsingEncoding:", 4), &v29);
    id v25 = v29;

    if (v24)
    {
      if (self->_enableAutoFlush)
      {
        v26 = self->_lock_loggerRecord;
        unint64_t v27 = [(PLAppleArchiveLoggerRecord *)v26 autoFlushCounter] + 1;
        [(PLAppleArchiveLoggerRecord *)v26 setAutoFlushCounter:v27];
        if (v27 >= 0xB)
        {
          [(PLFileBackedLogger *)self _inlock_flush];
          [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord setAutoFlushCounter:0];
        }
      }
    }
    else
    {
      v28 = PLBackendGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v25;
        _os_log_impl(&dword_19BCFB000, v28, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Failed while logging to archive logger: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v25 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
}

- (void)_inlock_flush
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&s_lock);
  if ([(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord refCount] >= 1)
  {
    id v3 = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord logger];
    [v3 flush:0];
  }
}

- (void)flush
{
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  [(PLFileBackedLogger *)self _inlock_flush];
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
}

- (void)dealloc
{
  [(PLFileBackedLogger *)self close];
  v3.receiver = self;
  v3.super_class = (Class)PLFileBackedLogger;
  [(PLFileBackedLogger *)&v3 dealloc];
}

- (void)close
{
  *(void *)&v20[5] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  if (!self->_lock_closed)
  {
    lock_loggerRecord = self->_lock_loggerRecord;
    if (lock_loggerRecord)
    {
      if ([(PLAppleArchiveLoggerRecord *)lock_loggerRecord refCount] <= 0)
      {
        id v16 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v17 = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord refCount];
        v18 = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord url];
        [v16 handleFailureInMethod:a2, self, @"PLFileBackedLog.m", 231, @"already closed. Ref count: %d. url: %@", v17, v18 object file lineNumber description];
      }
      int v5 = self->_lock_loggerRecord;
      uint64_t v6 = [(PLAppleArchiveLoggerRecord *)v5 refCount] - 1;
      [(PLAppleArchiveLoggerRecord *)v5 setRefCount:v6];
      if (v6)
      {
        [(PLFileBackedLogger *)self _inlock_flush];
        p_super = PLBackendGetLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        {
          int v8 = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord refCount];
          v9 = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord url];
          uint64_t v10 = [v9 lastPathComponent];
          *(_DWORD *)buf = 67109378;
          v20[0] = v8;
          LOWORD(v20[1]) = 2114;
          *(void *)((char *)&v20[1] + 2) = v10;
          _os_log_impl(&dword_19BCFB000, p_super, OS_LOG_TYPE_INFO, "PLFileBackedLogger: decrement logger ref count to %d for log: %{public}@", buf, 0x12u);
        }
      }
      else
      {
        v11 = PLBackendGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord url];
          *(_DWORD *)buf = 138543362;
          *(void *)v20 = v12;
          _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_DEFAULT, "PLFileBackedLogger: close url backed logger: %{public}@", buf, 0xCu);
        }
        uint64_t v13 = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord logger];
        [v13 close:0];

        v14 = (void *)s_lock_loggers;
        v15 = [(PLAppleArchiveLoggerRecord *)self->_lock_loggerRecord url];
        [v14 setObject:0 forKeyedSubscript:v15];

        p_super = &self->_lock_loggerRecord->super;
        self->_lock_loggerRecord = 0;
      }

      self->_lock_closed = 1;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
}

- (id)_inlock_createLoggerRecordWithLogFileURL:(id)a3 logRotate:(BOOL)a4 didRebuildLogArchive:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&s_lock);
  uint64_t v10 = PLBackendGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEFAULT, "PLFileBackedLogger: open url backed logger: %{public}@", buf, 0xCu);
  }

  id v23 = 0;
  v11 = +[PLFileBackedLogger _openLoggerAtURL:v9 logRotate:v8 error:&v23];
  id v12 = v23;
  id v13 = v12;
  if (v11) {
    goto LABEL_4;
  }
  BOOL HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode(v12, (void *)*MEMORY[0x1E4F8CEC8], 500300);
  uint64_t v17 = (void *)*MEMORY[0x1E4F28798];
  BOOL v18 = HasDomainAndCode && PLErrorOrUnderlyingErrorHasDomainAndCode(v13, (void *)*MEMORY[0x1E4F28798], 0);
  if (!PLErrorOrUnderlyingErrorHasDomainAndCode(v13, v17, 17) && !v18) {
    goto LABEL_18;
  }
  v19 = PLBackendGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl(&dword_19BCFB000, v19, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: open url found a corrupt log file. Attempting repair for: %{public}@", buf, 0xCu);
  }

  id v22 = v13;
  v11 = +[PLFileBackedLogger _removeAndCreateLoggerAtURL:v9 logRotate:v8 error:&v22];
  id v20 = v22;

  if (a5) {
    *a5 = 1;
  }
  id v13 = v20;
  if (v11)
  {
LABEL_4:
    v14 = [[PLAppleArchiveLoggerRecord alloc] initWithURL:v9 logger:v11];
  }
  else
  {
LABEL_18:
    v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl(&dword_19BCFB000, v21, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Failed to open log file. Error: %@", buf, 0xCu);
    }

    if (a6)
    {
      id v13 = v13;
      v14 = 0;
      *a6 = v13;
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (PLFileBackedLogger)initWithLogFileURL:(id)a3 logRotate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PLFileBackedLogger;
  v7 = [(PLFileBackedLogger *)&v33 init];
  if (v7)
  {
    BOOL v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    [(NSDateFormatter *)v7->_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS "];
    uint64_t v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)v7->_dateFormatter setLocale:v10];
    v7->_enableAutoFlush = 0;
    char v32 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
    v11 = (void *)s_lock_loggers;
    if (!s_lock_loggers)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = (void *)s_lock_loggers;
      s_lock_loggers = (uint64_t)v12;

      v11 = (void *)s_lock_loggers;
    }
    uint64_t v14 = [v11 objectForKeyedSubscript:v6];
    lock_loggerRecord = v7->_lock_loggerRecord;
    v7->_lock_loggerRecord = (PLAppleArchiveLoggerRecord *)v14;

    id v16 = v7->_lock_loggerRecord;
    if (!v16)
    {
      id v31 = 0;
      uint64_t v17 = [(PLFileBackedLogger *)v7 _inlock_createLoggerRecordWithLogFileURL:v6 logRotate:v4 didRebuildLogArchive:&v32 error:&v31];
      id v18 = v31;
      if (!v17)
      {
        v28 = PLBackendGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v18;
          _os_log_impl(&dword_19BCFB000, v28, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Failed to create logger record. Invalidating logger initialization. Error: %@", buf, 0xCu);
        }

        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        v7 = 0;
        goto LABEL_16;
      }
      [(id)s_lock_loggers setObject:v17 forKeyedSubscript:v6];
      uint64_t v19 = [(id)s_lock_loggers objectForKeyedSubscript:v6];
      id v20 = v7->_lock_loggerRecord;
      v7->_lock_loggerRecord = (PLAppleArchiveLoggerRecord *)v19;

      id v16 = v7->_lock_loggerRecord;
    }
    [(PLAppleArchiveLoggerRecord *)v16 setRefCount:[(PLAppleArchiveLoggerRecord *)v16 refCount] + 1];
    v7->_lock_closed = 0;
    v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = [(PLAppleArchiveLoggerRecord *)v7->_lock_loggerRecord refCount];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[8] = 2114;
      *(void *)&buf[10] = v6;
      _os_log_impl(&dword_19BCFB000, v21, OS_LOG_TYPE_INFO, "PLFileBackedLogger: url backed logger ref count %d for log %{public}@", buf, 0x12u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
    if (v32)
    {
      id v23 = PLBackendGetLog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v24)
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        memset(buf, 0, sizeof(buf));
        id v25 = PLBackendGetLog();
        os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        uint64_t v26 = [MEMORY[0x1E4F1C9C8] now];
        int v34 = 138412290;
        v35 = v26;
        LODWORD(v30) = 12;
        unint64_t v27 = (uint8_t *)_os_log_send_and_compose_impl();

        -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](v7, "logWithMessage:fromCodeLocation:type:", v27, "PLFileBackedLog.m", 188, 0, &v34, v30);
        if (v27 != buf) {
          free(v27);
        }
      }
    }
LABEL_16:
  }
  return v7;
}

- (PLFileBackedLogger)init
{
  PLMethodNotImplementedException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)_openLoggerAtURL:(id)a3 logRotate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v69[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 isFileURL])
  {
    BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [v7 URLByDeletingLastPathComponent];
    id v61 = 0;
    char v10 = [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v61];
    v11 = v61;

    if (v10)
    {
      if (!v6)
      {
LABEL_37:
        long long v51 = (void *)[objc_alloc(MEMORY[0x1E4F8CBA8]) initWithArchiveURL:v7];
        long long v57 = v11;
        char v52 = [v51 openForWriting:&v57];
        v28 = v57;

        if (v52)
        {
          id v30 = v51;
        }
        else
        {
          long long v53 = PLBackendGetLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            long long v54 = [v7 path];
            *(_DWORD *)buf = 138412546;
            long long v63 = v54;
            __int16 v64 = 2112;
            long long v65 = v28;
            _os_log_impl(&dword_19BCFB000, v53, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Unable to write-open file descriptor at %@: Error: %@", buf, 0x16u);
          }
          id v30 = 0;
          if (a5) {
            *a5 = v28;
          }
        }

        goto LABEL_44;
      }
      id v12 = [v7 URLByDeletingPathExtension];
      id v13 = [v12 URLByAppendingPathExtension:@"log"];

      uint64_t v14 = [v7 URLByAppendingPathExtension:@"old"];
      v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v16 = [v13 path];
      int v17 = [v15 fileExistsAtPath:v16];

      if (v17)
      {
        id v18 = [v14 path];
        int v19 = [v15 fileExistsAtPath:v18];

        if (v19)
        {
          id v20 = PLBackendGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = [v13 path];
            int v22 = [v14 path];
            *(_DWORD *)buf = 138412546;
            long long v63 = v21;
            __int16 v64 = 2112;
            long long v65 = v22;
            _os_log_impl(&dword_19BCFB000, v20, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: cannot rotate %@ to %@: destination exists", buf, 0x16u);
          }
          id v23 = 0;
LABEL_27:

          int v34 = v23;
          goto LABEL_28;
        }
        id v60 = 0;
        char v35 = [MEMORY[0x1E4F8CBA8] encodeFile:v13 destination:v14 error:&v60];
        v36 = v60;
        id v23 = v36;
        if ((v35 & 1) == 0)
        {
          id v20 = PLBackendGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            long long v39 = [v13 path];
            [v14 path];
            long long v40 = v56 = v13;
            *(_DWORD *)buf = 138412802;
            long long v63 = v39;
            __int16 v64 = 2112;
            long long v65 = v40;
            __int16 v66 = 2112;
            uint64_t v67 = v23;
            _os_log_impl(&dword_19BCFB000, v20, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: cannot rotate %@ to %@: %@", buf, 0x20u);
          }
          goto LABEL_27;
        }
        long long v59 = v36;
        char v37 = [v15 removeItemAtURL:v13 error:&v59];
        int v34 = v59;

        if ((v37 & 1) == 0)
        {
          id v20 = PLBackendGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            long long v38 = [v13 path];
            *(_DWORD *)buf = 138412546;
            long long v63 = v38;
            __int16 v64 = 2112;
            long long v65 = v34;
            _os_log_impl(&dword_19BCFB000, v20, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: error removing legacy log file %@: %@", buf, 0x16u);
          }
          id v23 = v34;
          goto LABEL_27;
        }
      }
      else
      {
        int v34 = 0;
      }
LABEL_28:
      long long v41 = objc_msgSend(v7, "path", v56);
      int v42 = [v15 fileExistsAtPath:v41];

      if (v42)
      {
        long long v43 = [v7 path];
        long long v44 = [v15 attributesOfItemAtPath:v43 error:0];
        unint64_t v45 = [v44 fileSize];

        if (v45 >> 22 < 0x19)
        {
          long long v47 = v34;
        }
        else
        {
          long long v58 = v34;
          char v46 = [v15 moveItemAtURL:v7 toURL:v14 error:&v58];
          long long v47 = v58;

          if ((v46 & 1) == 0)
          {
            long long v48 = PLBackendGetLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              long long v49 = [v7 path];
              long long v50 = [v14 path];
              *(_DWORD *)buf = 138412802;
              long long v63 = v49;
              __int16 v64 = 2112;
              long long v65 = v50;
              __int16 v66 = 2112;
              uint64_t v67 = v47;
              _os_log_impl(&dword_19BCFB000, v48, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: cannot rotate %@ to %@: %@", buf, 0x20u);
            }
          }
        }
      }
      else
      {
        long long v47 = v34;
      }

      goto LABEL_37;
    }
    id v31 = PLBackendGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      char v32 = [v7 URLByDeletingLastPathComponent];
      objc_super v33 = [v32 path];
      *(_DWORD *)buf = 138412546;
      long long v63 = v33;
      __int16 v64 = 2112;
      long long v65 = v11;
      _os_log_impl(&dword_19BCFB000, v31, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Unable to create a log file directory at %@, error:%@", buf, 0x16u);
    }
    if (a5)
    {
      v28 = v11;
      id v30 = 0;
      *a5 = v28;
    }
    else
    {
      id v30 = 0;
      v28 = v11;
    }
  }
  else
  {
    BOOL v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v68 = *MEMORY[0x1E4F28228];
    v69[0] = @"url parameter is not a file url";
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
    uint64_t v26 = [v24 errorWithDomain:@"com.apple.photos.error" code:46102 userInfo:v25];
    unint64_t v27 = v26;
    if (a5) {
      *a5 = v26;
    }

    v28 = PLBackendGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [v7 lastPathComponent];
      *(_DWORD *)buf = 138543362;
      long long v63 = v29;
      _os_log_impl(&dword_19BCFB000, v28, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Backend logging requires a file URL. Url specified %{public}@", buf, 0xCu);
    }
    id v30 = 0;
  }
LABEL_44:

  return v30;
}

+ (id)_removeAndCreateLoggerAtURL:(id)a3 logRotate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v66[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 isFileURL])
  {
    id v54 = 0;
    uint64_t v9 = *MEMORY[0x1E4F1C628];
    id v53 = 0;
    char v10 = [a1 _getResourceValue:&v54 key:v9 url:v8 error:&v53];
    id v11 = v54;
    id v12 = v53;
    id v13 = v12;
    if ((v10 & 1) == 0)
    {
      if (a5)
      {
        id v13 = v12;
        id v25 = 0;
        *a5 = v13;
LABEL_34:

        goto LABEL_35;
      }
LABEL_16:
      id v25 = 0;
      goto LABEL_34;
    }
    if ([v11 BOOLValue])
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = *MEMORY[0x1E4F28228];
      __int16 v64 = @"url parameter is a directory";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v16 = [v14 errorWithDomain:@"com.apple.photos.error" code:46102 userInfo:v15];
      int v17 = v16;
      if (a5) {
        *a5 = v16;
      }

      id v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = [v8 lastPathComponent];
        *(_DWORD *)buf = 138543362;
        long long v56 = v19;
        _os_log_impl(&dword_19BCFB000, v18, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Backend logging requires a file URL. Url specified is a directory %{public}@", buf, 0xCu);
      }
      goto LABEL_16;
    }
    id v52 = 0;
    uint64_t v26 = *MEMORY[0x1E4F1C6E8];
    long long v51 = v13;
    char v27 = [a1 _getResourceValue:&v52 key:v26 url:v8 error:&v51];
    id v28 = v52;
    id v29 = v51;

    if (v27)
    {
      id v30 = [v28 pathExtension];
      char v31 = [v30 isEqualToString:@"aapbz"];

      if (v31)
      {
        id v32 = v8;
        if (unlink((const char *)[v32 fileSystemRepresentation]))
        {
          long long v50 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v49 = *MEMORY[0x1E4F28798];
          uint64_t v33 = *__error();
          v59[0] = *MEMORY[0x1E4F28228];
          int v34 = NSString;
          char v35 = __error();
          v36 = [v34 stringWithUTF8String:strerror(*v35)];
          v60[0] = v36;
          v59[1] = *MEMORY[0x1E4F28328];
          char v37 = [v32 path];
          v60[1] = v37;
          long long v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
          long long v39 = [v50 errorWithDomain:v49 code:v33 userInfo:v38];

          if (a5) {
            *a5 = v39;
          }
          long long v40 = PLBackendGetLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            long long v41 = [v32 lastPathComponent];
            *(_DWORD *)buf = 138543618;
            long long v56 = v41;
            __int16 v57 = 2112;
            long long v58 = v39;
            _os_log_impl(&dword_19BCFB000, v40, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Backend logging failed to removed corrupt log file %{public}@. Error: %@", buf, 0x16u);
          }
          id v25 = 0;
          id v29 = v39;
        }
        else
        {
          id v25 = [a1 _openLoggerAtURL:v32 logRotate:v6 error:a5];
        }
        goto LABEL_33;
      }
      int v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = *MEMORY[0x1E4F28228];
      long long v62 = @"url filename is of an unknown type";
      long long v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      long long v44 = [v42 errorWithDomain:@"com.apple.photos.error" code:46102 userInfo:v43];
      unint64_t v45 = v44;
      if (a5) {
        *a5 = v44;
      }

      char v46 = PLBackendGetLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        long long v47 = [v8 lastPathComponent];
        *(_DWORD *)buf = 138543362;
        long long v56 = v47;
        _os_log_impl(&dword_19BCFB000, v46, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Backend logging requires a file URL with an expected path extension %{public}@", buf, 0xCu);
      }
    }
    else if (a5)
    {
      id v29 = v29;
      id v25 = 0;
      *a5 = v29;
LABEL_33:

      id v13 = v29;
      goto LABEL_34;
    }
    id v25 = 0;
    goto LABEL_33;
  }
  id v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v65 = *MEMORY[0x1E4F28228];
  v66[0] = @"url parameter is not a file url";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
  int v22 = [v20 errorWithDomain:@"com.apple.photos.error" code:46102 userInfo:v21];
  id v23 = v22;
  if (a5) {
    *a5 = v22;
  }

  id v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    BOOL v24 = [v8 lastPathComponent];
    *(_DWORD *)buf = 138543362;
    long long v56 = v24;
    _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Backend logging requires a file URL. Url specified %{public}@", buf, 0xCu);
  }
  id v25 = 0;
LABEL_35:

  return v25;
}

+ (BOOL)_getResourceValue:(id *)a3 key:(id)a4 url:(id)a5 error:(id *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v16 = 0;
  char v10 = [v9 getResourceValue:a3 forKey:a4 error:&v16];
  id v11 = v16;
  id v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (a6) {
      *a6 = v11;
    }
    id v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v9 lastPathComponent];
      *(_DWORD *)buf = 138543618;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_ERROR, "PLFileBackedLogger: Backend logging failed to determine the url status for %{public}@. Error: %@", buf, 0x16u);
    }
  }

  return v10;
}

+ (id)_setupWithLibraryIdentifier:(id)a3 type:(char)a4 logURL:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (v8) {
    id v9 = [[PLFileBackedLogger alloc] initWithLogFileURL:v8 logRotate:1];
  }
  else {
    id v9 = 0;
  }
  [(PLFileBackedLogger *)v9 setLoggerType:v6];
  if ((unint64_t)[v7 length] < 9)
  {
    if (v7)
    {
      id v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v7;
        _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_DEFAULT, "PLFileBackedLogger: Tag length shorter than expected for identifier %{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
    char v10 = (void *)[v7 copy];
    [(PLFileBackedLogger *)v9 setTag:v10];
  }
  else
  {
    char v10 = [v7 substringToIndex:8];
    id v11 = (void *)[v10 copy];
    [(PLFileBackedLogger *)v9 setTag:v11];
  }
  return v9;
}

+ (id)setupWithLibraryIdentifier:(id)a3 type:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
  {
    id v7 = @"PhotosUpgrade";
    if (v4 != 1) {
      id v7 = 0;
    }
    if (v4 == 2) {
      id v8 = @"PhotosSearch";
    }
    else {
      id v8 = v7;
    }
    if (v8)
    {
      id v9 = objc_msgSend(@"Logs/com.apple.assetsd", "stringByAppendingPathComponent:");
      char v10 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
      id v11 = [v10 lastObject];

      id v12 = [v11 stringByAppendingPathComponent:v9];
      id v13 = [v12 stringByAppendingPathExtension:@"aapbz"];

      int v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];

      goto LABEL_13;
    }
    id v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18[0] = 67109120;
      v18[1] = v4;
      _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_ERROR, "failed to obtain name for file backed log for type: %d", (uint8_t *)v18, 8u);
    }
  }
  int v14 = 0;
LABEL_13:
  uint64_t v16 = [a1 _setupWithLibraryIdentifier:v6 type:v4 logURL:v14];

  return v16;
}

@end