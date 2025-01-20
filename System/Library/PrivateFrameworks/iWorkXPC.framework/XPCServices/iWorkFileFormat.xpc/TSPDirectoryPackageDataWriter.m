@interface TSPDirectoryPackageDataWriter
- (BOOL)flushPendingWritesReturningError:(id *)a3;
- (BOOL)writeData:(id)a3 toRelativePath:(id)a4 allowEncryption:(BOOL)a5 error:(id *)a6;
- (CGDataConsumer)newCGDataConsumerAtRelativePath:(id)a3;
- (TSPDirectoryPackageDataWriter)init;
- (TSPDirectoryPackageDataWriter)initWithURL:(id)a3;
- (id)targetDataURLForPath:(id)a3;
@end

@implementation TSPDirectoryPackageDataWriter

- (TSPDirectoryPackageDataWriter)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C5CB0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPDirectoryPackageDataWriter init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageDataWriter.mm";
    __int16 v14 = 1024;
    int v15 = 14;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageDataWriter init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageDataWriter.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:14 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPDirectoryPackageDataWriter init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPDirectoryPackageDataWriter)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPDirectoryPackageDataWriter;
  v5 = [(TSPDirectoryPackageDataWriter *)&v9 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    URL = v5->_URL;
    v5->_URL = v6;
  }
  return v5;
}

- (id)targetDataURLForPath:(id)a3
{
  v3 = [(NSURL *)self->_URL URLByAppendingPathComponent:a3 isDirectory:0];
  return v3;
}

- (BOOL)writeData:(id)a3 toRelativePath:(id)a4 allowEncryption:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    if (v9)
    {
      v11 = [(TSPDirectoryPackageDataWriter *)self targetDataURLForPath:v10];
      __int16 v12 = +[NSFileManager defaultManager];
      v13 = [v11 URLByDeletingLastPathComponent];
      id v25 = 0;
      unsigned __int8 v14 = [v12 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v25];
      id v15 = v25;

      if (v14)
      {
        unsigned __int8 v16 = [v9 writeToURL:v11 options:0 error:a6];
      }
      else
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001C5CF0);
        }
        v19 = TSUDefaultCat_log_t;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          v23 = [v15 domain];
          id v24 = [v15 code];
          *(_DWORD *)buf = 138413314;
          v27 = v11;
          __int16 v28 = 2114;
          id v29 = v22;
          __int16 v30 = 2114;
          v31 = v23;
          __int16 v32 = 2048;
          id v33 = v24;
          __int16 v34 = 2112;
          id v35 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "Couldn't create directory at URL %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
        }
        unsigned __int8 v16 = 0;
        if (a6) {
          *a6 = v15;
        }
      }
    }
    else
    {
      unsigned __int8 v16 = 1;
    }
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5CD0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016056C();
    }
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageDataWriter writeData:toRelativePath:allowEncryption:error:]");
    v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageDataWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:31 isFatal:0 description:"Path should be defined."];

    +[TSUAssertionHandler logBacktraceThrottled];
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (CGDataConsumer)newCGDataConsumerAtRelativePath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CFURLRef v5 = [(TSPDirectoryPackageDataWriter *)self targetDataURLForPath:v4];
    v6 = CGDataConsumerCreateWithURL(v5);
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5D10);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100160600();
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageDataWriter newCGDataConsumerAtRelativePath:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageDataWriter.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:57 isFatal:0 description:"Path should be defined."];

    +[TSUAssertionHandler logBacktraceThrottled];
    v6 = 0;
  }

  return v6;
}

- (BOOL)flushPendingWritesReturningError:(id *)a3
{
  unsigned int v3 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C5D30);
  }
  id v4 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v10 = v3;
    __int16 v11 = 2082;
    __int16 v12 = "-[TSPDirectoryPackageDataWriter flushPendingWritesReturningError:]";
    __int16 v13 = 2082;
    unsigned __int8 v14 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageDataWriter.mm";
    __int16 v15 = 1024;
    int v16 = 66;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  CFURLRef v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDirectoryPackageDataWriter flushPendingWritesReturningError:]");
  v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDirectoryPackageDataWriter.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:66 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPDirectoryPackageDataWriter flushPendingWritesReturningError:]");
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void).cxx_destruct
{
}

@end