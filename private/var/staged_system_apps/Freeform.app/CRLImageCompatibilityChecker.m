@interface CRLImageCompatibilityChecker
+ (void)initialize;
- (BOOL)isCancelled;
- (CRLImageCompatibilityChecker)initWithImageData:(id)a3;
- (NSError)error;
- (int64_t)compatibilityLevel;
- (void)cancel;
- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation CRLImageCompatibilityChecker

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[CRLWidthLimitedQueue alloc] initWithLimit:10];
    v3 = (void *)qword_1016A8F70;
    qword_1016A8F70 = (uint64_t)v2;
  }
}

- (CRLImageCompatibilityChecker)initWithImageData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFEE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E574();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFF08);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityChecker initWithImageData:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityChecker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 40, 0, "Invalid parameter not satisfying: %{public}s", "imageData != nil");
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLImageCompatibilityChecker;
  v9 = [(CRLImageCompatibilityChecker *)&v12 init];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_imageData, a3);
  }

  return v10;
}

- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (a3 <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFF28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E624();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFF48);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityChecker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 49, 0, "Invalid parameter not satisfying: %{public}s", "maxDesiredCompatibilityLevel > CRLMediaCompatibilityLevelNone");
  }
  v10 = (void *)qword_1016A8F70;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100078DE0;
  v12[3] = &unk_1014CFF70;
  id v13 = v6;
  int64_t v14 = a3;
  v12[4] = self;
  id v11 = v6;
  [v10 performAsync:v12];
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (int64_t)compatibilityLevel
{
  return self->_compatibilityLevel;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end