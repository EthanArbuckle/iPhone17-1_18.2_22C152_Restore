@interface CRLSandboxedURL
+ (id)sandboxedURLByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToURL:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7;
+ (id)sandboxedURLByResolvingBookmarkData:(id)a3 relativeToURL:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6;
- (BOOL)hasSandboxAccess;
- (BOOL)isEqual:(id)a3;
- (CRLSandboxedURL)init;
- (CRLSandboxedURL)initWithURL:(id)a3;
- (NSString)description;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToURL:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7;
- (id)initByResolvingBookmarkData:(id)a3 relativeToURL:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6;
- (id)normalize;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation CRLSandboxedURL

- (CRLSandboxedURL)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CFD68);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLSandboxedURL init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m";
    __int16 v17 = 1024;
    int v18 = 28;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CFD88);
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSandboxedURL init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:28 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLSandboxedURL init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLSandboxedURL)initWithURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)CRLSandboxedURL;
    v5 = [(CRLSandboxedURL *)&v18 init];
    if (v5)
    {
      if ([v4 isFileURL])
      {
        v6 = (NSURL *)[v4 copy];
        URL = v5->_URL;
        v5->_URL = v6;

        unsigned __int8 v8 = [v4 startAccessingSecurityScopedResource];
      }
      else
      {
        int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CFDA8);
        }
        v11 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106E298((uint64_t)v4, v10, v11);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CFDC8);
        }
        unsigned int v12 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v12);
        }
        __int16 v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSandboxedURL initWithURL:]");
        v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"];
        +[CRLAssertionHandler handleFailureInFunction:v13, v14, 39, 0, "Sandboxed URL should not be initialized with a non-file URL. URL=%@", v4 file lineNumber isFatal description];

        __int16 v15 = (NSURL *)[v4 copy];
        v16 = v5->_URL;
        v5->_URL = v15;

        unsigned __int8 v8 = 0;
      }
      v5->_URLStartedAccessingSecurityScopedResource = v8;
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)initByResolvingBookmarkData:(id)a3 relativeToURL:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6
{
  return [(CRLSandboxedURL *)self initByResolvingBookmarkData:a3 options:768 relativeToURL:a4 bookmarkDataIsStale:a5 error:a6];
}

- (id)initByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToURL:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7
{
  unint64_t v11 = a4 | 0x8000;
  id v12 = a5;
  id v13 = a3;
  id v14 = [objc_alloc((Class)NSURL) initByResolvingBookmarkData:v13 options:v11 relativeToURL:v12 bookmarkDataIsStale:a6 error:a7];

  if (v14)
  {
    __int16 v15 = [(CRLSandboxedURL *)self initWithURL:v14];
  }
  else
  {

    __int16 v15 = 0;
  }

  return v15;
}

+ (id)sandboxedURLByResolvingBookmarkData:(id)a3 relativeToURL:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initByResolvingBookmarkData:v11 relativeToURL:v10 bookmarkDataIsStale:a5 error:a6];

  return v12;
}

+ (id)sandboxedURLByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToURL:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initByResolvingBookmarkData:v13 options:a4 relativeToURL:v12 bookmarkDataIsStale:a6 error:a7];

  return v14;
}

- (void)dealloc
{
  if (self->_URLStartedAccessingSecurityScopedResource) {
    [(NSURL *)self->_URL stopAccessingSecurityScopedResource];
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLSandboxedURL;
  [(CRLSandboxedURL *)&v3 dealloc];
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)hasSandboxAccess
{
  return self->_URLStartedAccessingSecurityScopedResource;
}

- (id)normalize
{
  objc_super v3 = [(CRLSandboxedURL *)self URL];
  if (([v3 isFileURL] & 1) == 0)
  {
    p_super = self;
    goto LABEL_12;
  }
  id v4 = [v3 path];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSURL) initFileURLWithPath:v4];
    if (v5 && ([v3 isEqual:v5] & 1) == 0)
    {
      v6 = [(CRLSandboxedURL *)self originalSandboxedURLForNormalizing];
      v7 = v6;
      if (v6 == self
        || ([(CRLSandboxedURL *)v6 URL],
            unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v9 = [v8 isEqual:v5],
            v8,
            (v9 & 1) == 0))
      {
        id v10 = [[TSUNormalizedSandboxedURL alloc] initWithURL:v5 originalSandboxedURL:v7];
      }
      else
      {
        id v10 = v7;
      }
      p_super = &v10->super;

      goto LABEL_11;
    }
  }
  else
  {
    id v5 = 0;
  }
  p_super = self;
LABEL_11:

LABEL_12:

  return p_super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CRLSandboxedURL allocWithZone:a3] initWithURL:self->_URL];
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFDE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E354();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFE08);
    }
    id v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Copy should never be nil.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[CRLSandboxedURL copyWithZone:]");
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSandboxedURL copyWithZone:]");
    v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"];
    +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:125 isFatal:1 description:"Copy should never be nil."];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v21, v22);
    abort();
  }
  id v5 = v4;
  unsigned int v6 = [(CRLSandboxedURL *)v4 hasSandboxAccess];
  if (v6 != [(CRLSandboxedURL *)self hasSandboxAccess])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFE28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E3DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFE48);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    unsigned __int8 v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSandboxedURL copyWithZone:]");
    unsigned __int8 v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:126 isFatal:0 description:"Sanboxing access didn't transfer as expected to sandboxed URL copy."];
  }
  return v5;
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)v4;
  if (self->_URLStartedAccessingSecurityScopedResource) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = +[NSString stringWithFormat:@"<%@: %p URL=%@, hasSandboxAccess=%@>", v4, self, self->_URL, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  CFStringRef v6 = sub_1002469D0(v5, v4);

  if (v6)
  {
    v7 = [(CRLSandboxedURL *)self URL];
    unsigned __int8 v8 = [v6 URL];
    if ([v7 isEqual:v8])
    {
      unsigned int v9 = [(CRLSandboxedURL *)self hasSandboxAccess];
      unsigned int v10 = v9 ^ [v6 hasSandboxAccess] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  objc_super v3 = [(CRLSandboxedURL *)self URL];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = v4 ^ [(CRLSandboxedURL *)self hasSandboxAccess];

  return v5;
}

- (void).cxx_destruct
{
}

@end