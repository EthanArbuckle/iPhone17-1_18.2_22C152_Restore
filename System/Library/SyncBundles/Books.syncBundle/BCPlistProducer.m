@interface BCPlistProducer
- (BCPlistProducer)initWithPath:(id)a3;
- (BOOL)shouldRetry;
- (BOOL)write;
- (id)produceData;
- (void)dealloc;
@end

@implementation BCPlistProducer

- (BCPlistProducer)initWithPath:(id)a3
{
  if (![a3 length]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCPlistProducer.m", 22, @"Path not specified: %@", a3 object file lineNumber description];
  }
  v6 = [(BCPlistProducer *)self init];
  if (v6)
  {
    v6->_path = (NSString *)[a3 copy];
    v6->_attemptCount = 0;
    v6->_dataUnchanged = 0;
    v6->_lockout = objc_alloc_init(BCLockout);
    CFStringRef v9 = @"com.apple.sync.books.began";
    [(BCLockout *)v6->_lockout setStartNotifications:+[NSArray arrayWithObjects:&v9 count:1]];
    v8[0] = @"com.apple.sync.books.finished";
    v8[1] = @"com.apple.books.plist.changed";
    [(BCLockout *)v6->_lockout setEndNotifications:+[NSArray arrayWithObjects:v8 count:2]];
    -[BCLockout setPath:](v6->_lockout, "setPath:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/.%@.lock", [a3 stringByDeletingLastPathComponent], objc_msgSend(a3, "lastPathComponent")));
  }
  return v6;
}

- (void)dealloc
{
  self->_path = 0;
  [(BCLockout *)self->_lockout unlock];

  self->_lockout = 0;
  v3.receiver = self;
  v3.super_class = (Class)BCPlistProducer;
  [(BCPlistProducer *)&v3 dealloc];
}

- (BOOL)write
{
  BOOL v4 = 0;
  int v5 = 1;
  *(void *)&long long v2 = 138412802;
  long long v25 = v2;
  while ([(BCPlistProducer *)self shouldRetry])
  {
    [(BCLockout *)self->_lockout lock:1];
    unint64_t v7 = [+[NSFileManager defaultManager] attributesOfItemAtPath:self->_path error:0];
    id v8 = [(BCPlistProducer *)self produceData];
    if (self->_dataUnchanged)
    {
      CFStringRef v9 = BCDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        path = self->_path;
        *(_DWORD *)buf = 138412546;
        v27 = path;
        __int16 v28 = 2112;
        v29 = self;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Plist modification resulted in no changes -- skipping rewrite %@ -- %@", buf, 0x16u);
      }
    }
    else
    {
      v11 = v8;
      unint64_t v12 = [+[NSFileManager defaultManager] attributesOfItemAtPath:self->_path error:0];
      v13 = (void *)v12;
      if (v7 | v12)
      {
        if (!v7
          || !v12
          || (id v14 = [(id)v7 fileSize], v14 != objc_msgSend(v13, "fileSize"))
          || (objc_msgSend(objc_msgSend((id)v7, "fileModificationDate"), "isEqualToDate:", objc_msgSend(v13, "fileModificationDate")) & 1) == 0)
        {
          v17 = BCDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v22 = self->_path;
            *(_DWORD *)buf = v25;
            v27 = v22;
            __int16 v28 = 2112;
            v29 = self;
            __int16 v30 = 1024;
            int v31 = v5;
            _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "--- --- ---modification time changed during processing--- --- ---%@ -- %@ -- Attempt # %d", buf, 0x1Cu);
          }
          [(BCPlistProducer *)self fileWasModifiedDuringDataProduction];
          char v18 = 0;
          goto LABEL_23;
        }
      }
      if (v11)
      {
        if (([v11 writeToFile:self->_path atomically:1] & 1) == 0)
        {
          v21 = BCDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v23 = self->_path;
            *(_DWORD *)buf = v25;
            v27 = v23;
            __int16 v28 = 2112;
            v29 = self;
            __int16 v30 = 1024;
            int v31 = v5;
            _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Failed to write plist %@ -- %@ -- Attempt # %d", buf, 0x1Cu);
          }
          BOOL v4 = 0;
          [(BCPlistProducer *)self fileWriteFailed];
          char v18 = 1;
          goto LABEL_23;
        }
        v15 = BCDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_path;
          *(_DWORD *)buf = v25;
          v27 = v16;
          __int16 v28 = 2112;
          v29 = self;
          __int16 v30 = 1024;
          int v31 = v5;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Successfully rewrote plist %@ -- %@ -- Attempt # %d", buf, 0x1Cu);
        }
        BOOL v4 = 1;
      }
      else
      {
        v19 = BCDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_path;
          *(_DWORD *)buf = v25;
          v27 = v20;
          __int16 v28 = 2112;
          v29 = self;
          __int16 v30 = 1024;
          int v31 = v5;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Deleting plist %@ -- %@ -- Attempt # %d", buf, 0x1Cu);
        }
        BOOL v4 = 1;
        [+[NSFileManager defaultManager] removeItemAtPath:self->_path error:0];
      }
    }
    char v18 = 1;
LABEL_23:
    [(BCLockout *)self->_lockout unlock];
    ++v5;
    if (v18) {
      return v4;
    }
  }
  return v4;
}

- (BOOL)shouldRetry
{
  int attemptCount = self->_attemptCount;
  self->_int attemptCount = attemptCount + 1;
  return attemptCount < 4;
}

- (id)produceData
{
  return 0;
}

@end