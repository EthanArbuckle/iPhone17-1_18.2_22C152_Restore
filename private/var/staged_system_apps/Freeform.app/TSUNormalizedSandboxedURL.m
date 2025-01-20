@interface TSUNormalizedSandboxedURL
- (BOOL)hasSandboxAccess;
- (TSUNormalizedSandboxedURL)initWithURL:(id)a3 originalSandboxedURL:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)originalSandboxedURLForNormalizing;
@end

@implementation TSUNormalizedSandboxedURL

- (TSUNormalizedSandboxedURL)initWithURL:(id)a3 originalSandboxedURL:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TSUNormalizedSandboxedURL;
  v8 = [(CRLSandboxedURL *)&v11 initWithURL:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_originalSandboxedURL, a4);
  }

  return v9;
}

- (BOOL)hasSandboxAccess
{
  v4.receiver = self;
  v4.super_class = (Class)TSUNormalizedSandboxedURL;
  if ([(CRLSandboxedURL *)&v4 hasSandboxAccess]) {
    return 1;
  }
  else {
    return [(CRLSandboxedURL *)self->_originalSandboxedURL hasSandboxAccess];
  }
}

- (id)originalSandboxedURLForNormalizing
{
  v5.receiver = self;
  v5.super_class = (Class)TSUNormalizedSandboxedURL;
  if ([(CRLSandboxedURL *)&v5 hasSandboxAccess])
  {
    v3 = self;
  }
  else
  {
    v3 = [(CRLSandboxedURL *)self->_originalSandboxedURL originalSandboxedURLForNormalizing];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[CRLSandboxedURL copyWithZone:](self->_originalSandboxedURL, "copyWithZone:");
  v6 = +[TSUNormalizedSandboxedURL allocWithZone:a3];
  id v7 = [(CRLSandboxedURL *)self URL];
  v8 = [(TSUNormalizedSandboxedURL *)v6 initWithURL:v7 originalSandboxedURL:v5];

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFE68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E464();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFE88);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Copy should never be nil.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[TSUNormalizedSandboxedURL copyWithZone:]");
    v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUNormalizedSandboxedURL copyWithZone:]");
    v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"];
    +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:178 isFatal:1 description:"Copy should never be nil."];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v24, v25);
    abort();
  }
  unsigned int v9 = [(TSUNormalizedSandboxedURL *)v8 hasSandboxAccess];
  if (v9 != [(TSUNormalizedSandboxedURL *)self hasSandboxAccess])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFEA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E4EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFEC8);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    objc_super v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUNormalizedSandboxedURL copyWithZone:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSandboxedURL.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:179 isFatal:0 description:"Sanboxing access didn't transfer as expected to sandboxed URL copy."];
  }
  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  id v5 = [(CRLSandboxedURL *)self URL];
  v10.receiver = self;
  v10.super_class = (Class)TSUNormalizedSandboxedURL;
  unsigned int v6 = [(CRLSandboxedURL *)&v10 hasSandboxAccess];
  CFStringRef v7 = @"NO";
  if (v6) {
    CFStringRef v7 = @"YES";
  }
  v8 = +[NSString stringWithFormat:@"<%@: %p URL=%@, hasSandboxAccess=%@, originalSandboxedURL=%@>", v4, self, v5, v7, self->_originalSandboxedURL];

  return v8;
}

- (void).cxx_destruct
{
}

@end