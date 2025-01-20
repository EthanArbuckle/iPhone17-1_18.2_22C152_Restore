@interface TSUTemporaryDirectory
- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (TSUTemporaryDirectory)init;
- (TSUTemporaryDirectory)initWithError:(id *)a3;
- (TSUTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4;
- (TSUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (id)URL;
- (id)initForWritingToURL:(id)a3 error:(id *)a4;
- (id)path;
- (void)dealloc;
- (void)leakTemporaryDirectory;
- (void)removeDirectory;
@end

@implementation TSUTemporaryDirectory

- (TSUTemporaryDirectory)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CEA68);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSUTemporaryDirectory init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUTemporaryDirectory.m";
    __int16 v14 = 1024;
    int v15 = 26;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUTemporaryDirectory init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUTemporaryDirectory.m"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:26 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUTemporaryDirectory init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSUTemporaryDirectory)initWithError:(id *)a3
{
  return [(TSUTemporaryDirectory *)self initWithSignature:&stru_1001D3790 subdirectory:0 error:a3];
}

- (TSUTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4
{
  return [(TSUTemporaryDirectory *)self initWithSignature:a3 subdirectory:0 error:a4];
}

- (TSUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TSUTemporaryDirectory;
  __int16 v10 = [(TSUTemporaryDirectory *)&v13 init];
  v11 = v10;
  if (v10
    && ![(TSUTemporaryDirectory *)v10 _createDirectoryWithSignature:v8 subdirectory:v9 error:a5])
  {

    v11 = 0;
  }

  return v11;
}

- (id)initForWritingToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSUTemporaryDirectory;
  id v7 = [(TSUTemporaryDirectory *)&v13 init];
  if (v7)
  {
    id v8 = +[NSFileManager defaultManager];
    id v9 = [v8 URLForDirectory:99 inDomain:1 appropriateForURL:v6 create:1 error:a4];

    uint64_t v10 = [v9 path];
    path = v7->_path;
    v7->_path = (NSString *)v10;

    if (!v9)
    {

      id v7 = 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  if (self->_path && !self->_leak) {
    [(TSUTemporaryDirectory *)self removeDirectory];
  }
  v3.receiver = self;
  v3.super_class = (Class)TSUTemporaryDirectory;
  [(TSUTemporaryDirectory *)&v3 dealloc];
}

- (id)path
{
  path = self->_path;
  if (!path)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEA88);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A580();
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUTemporaryDirectory path]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUTemporaryDirectory.m"];
    +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:69 isFatal:0 description:"Directory has already been removed"];

    +[TSUAssertionHandler logBacktraceThrottled];
    path = self->_path;
  }
  return path;
}

- (id)URL
{
  unsigned int v2 = [(TSUTemporaryDirectory *)self path];
  objc_super v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];

  return v3;
}

- (void)leakTemporaryDirectory
{
  self->_leak = 1;
}

- (void)removeDirectory
{
  p_path = (uint64_t *)&self->_path;
  if (self->_path)
  {
    objc_super v3 = +[NSFileManager defaultManager];
    uint64_t v4 = *p_path;
    id v13 = 0;
    unsigned __int8 v5 = [v3 removeItemAtPath:v4 error:&v13];
    id v6 = v13;
    id v7 = v6;
    if (v5)
    {
    }
    else
    {
      unsigned __int8 v10 = objc_msgSend(v6, "tsu_isNoSuchFileError");

      if ((v10 & 1) == 0)
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001CEAA8);
        }
        v11 = TSUDefaultCat_log_t;
        if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10016A6A8((uint64_t)v7, p_path, v11);
        }
      }
    }
    __int16 v12 = (void *)*p_path;
    uint64_t *p_path = 0;
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEAC8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A614();
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUTemporaryDirectory removeDirectory]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUTemporaryDirectory.m"];
    +[TSUAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:90 isFatal:0 description:"Directory has already been removed"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
}

- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  if (v8) {
    unsigned __int8 v10 = v8;
  }
  else {
    unsigned __int8 v10 = &stru_1001D3790;
  }
  if (qword_1001EB998 != -1) {
    dispatch_once(&qword_1001EB998, &stru_1001CEAE8);
  }
  v11 = [(id)qword_1001EB990 stringByAppendingFormat:@"_%@_%d_%d", v10, (int)CFAbsoluteTimeGetCurrent(), atomic_fetch_add(&dword_1001EB9A0, 1u) + 1];
  if ((unint64_t)[v11 length] >= 0x100)
  {
    uint64_t v12 = [v11 substringToIndex:255];

    v11 = (void *)v12;
  }
  id v13 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v13) {
    +[NSString stringWithUTF8String:v13];
  }
  else {
  __int16 v14 = NSTemporaryDirectory();
  }
  int v15 = v14;
  if (v9)
  {
    uint64_t v16 = [v14 stringByAppendingPathComponent:v9];

    int v15 = (void *)v16;
  }
  v17 = [v15 stringByAppendingPathComponent:v11];
  v18 = +[NSFileManager defaultManager];
  id v23 = 0;
  unsigned __int8 v19 = [v18 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v23];
  id v20 = v23;

  objc_storeStrong((id *)&self->_path, v17);
  if (a5 && (v19 & 1) == 0)
  {
    if (v20)
    {
      *a5 = v20;
    }
    else
    {
      id v21 = +[NSError tsu_fileWriteUnknownErrorWithUserInfo:0];
      *a5 = v21;
    }
  }

  return v19;
}

- (void).cxx_destruct
{
}

@end