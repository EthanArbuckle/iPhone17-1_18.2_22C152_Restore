@interface CRLTemporaryDirectory
- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (CRLTemporaryDirectory)init;
- (CRLTemporaryDirectory)initWithError:(id *)a3;
- (CRLTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4;
- (CRLTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (NSString)path;
- (NSURL)URL;
- (id)initForWritingToURL:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)leakTemporaryDirectory;
- (void)removeDirectory;
- (void)setAssociatedLifetimeObject:(id)a3;
@end

@implementation CRLTemporaryDirectory

- (CRLTemporaryDirectory)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D0BF8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLTemporaryDirectory init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTemporaryDirectory.m";
    __int16 v17 = 1024;
    int v18 = 23;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D0C18);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTemporaryDirectory init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTemporaryDirectory.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:23 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLTemporaryDirectory init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLTemporaryDirectory)initWithError:(id *)a3
{
  return [(CRLTemporaryDirectory *)self initWithSignature:&stru_101538650 subdirectory:0 error:a3];
}

- (CRLTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4
{
  return [(CRLTemporaryDirectory *)self initWithSignature:a3 subdirectory:0 error:a4];
}

- (CRLTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLTemporaryDirectory;
  id v10 = [(CRLTemporaryDirectory *)&v13 init];
  v11 = v10;
  if (v10
    && ![(CRLTemporaryDirectory *)v10 _createDirectoryWithSignature:v8 subdirectory:v9 error:a5])
  {

    v11 = 0;
  }

  return v11;
}

- (id)initForWritingToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLTemporaryDirectory;
  v7 = [(CRLTemporaryDirectory *)&v13 init];
  if (v7)
  {
    id v8 = +[NSFileManager defaultManager];
    id v9 = [v8 URLForDirectory:99 inDomain:1 appropriateForURL:v6 create:1 error:a4];

    uint64_t v10 = [v9 path];
    path = v7->_path;
    v7->_path = (NSString *)v10;

    if (!v9)
    {

      v7 = 0;
    }
  }
  return v7;
}

- (void)setAssociatedLifetimeObject:(id)a3
{
}

- (void)dealloc
{
  if (self->_path && !self->_leak) {
    [(CRLTemporaryDirectory *)self removeDirectory];
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLTemporaryDirectory;
  [(CRLTemporaryDirectory *)&v3 dealloc];
}

- (NSString)path
{
  path = self->_path;
  if (!path)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0C38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070214();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0C58);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTemporaryDirectory path]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTemporaryDirectory.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:71 isFatal:0 description:"Directory has already been removed"];

    path = self->_path;
  }

  return path;
}

- (NSURL)URL
{
  unsigned int v2 = [(CRLTemporaryDirectory *)self path];
  objc_super v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];

  return (NSURL *)v3;
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
    id v12 = 0;
    unsigned __int8 v5 = [v3 removeItemAtPath:v4 error:&v12];
    id v6 = v12;
    v7 = v6;
    if (v5)
    {
    }
    else
    {
      unsigned __int8 v10 = [v6 crl_isNoSuchFileError];

      if ((v10 & 1) == 0)
      {
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014D0C78);
        }
        v11 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
          sub_10107033C((uint64_t)v7, p_path, v11);
        }
      }
    }
    id v9 = (void *)*p_path;
    uint64_t *p_path = 0;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0C98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010702A8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0CB8);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTemporaryDirectory removeDirectory]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTemporaryDirectory.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v9 lineNumber:92 isFatal:0 description:"Directory has already been removed"];
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
    unsigned __int8 v10 = &stru_101538650;
  }
  if (qword_1016A8F88 != -1) {
    dispatch_once(&qword_1016A8F88, &stru_1014D0CD8);
  }
  v11 = [(id)qword_1016A8F80 stringByAppendingFormat:@"_%@_%d_%d", v10, (int)CFAbsoluteTimeGetCurrent(), atomic_fetch_add(&dword_1016A8F90, 1u) + 1];
  if ((unint64_t)[v11 length] >= 0x100)
  {
    uint64_t v12 = [v11 substringToIndex:255];

    v11 = (void *)v12;
  }
  objc_super v13 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v13) {
    +[NSString stringWithUTF8String:v13];
  }
  else {
  v14 = NSTemporaryDirectory();
  }
  __int16 v15 = v14;
  if (v9)
  {
    uint64_t v16 = [v14 stringByAppendingPathComponent:v9];

    __int16 v15 = (void *)v16;
  }
  __int16 v17 = [v15 stringByAppendingPathComponent:v11];
  int v18 = +[NSFileManager defaultManager];
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
      id v21 = +[NSError crl_fileWriteUnknownErrorWithUserInfo:0];
      *a5 = v21;
    }
  }

  return v19;
}

- (void).cxx_destruct
{
}

@end