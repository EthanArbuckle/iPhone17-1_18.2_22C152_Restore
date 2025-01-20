@interface CRLCursorPlatformObject
+ (id)cursorPlatformObjectWithPointerRegionRequest:(id)a3;
- (CRLCursorPlatformObject)initWithPointerRegionRequest:(id)a3;
- (UIPointerRegionRequest)pointerRequest;
@end

@implementation CRLCursorPlatformObject

+ (id)cursorPlatformObjectWithPointerRegionRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPointerRegionRequest:v4];

  return v5;
}

- (CRLCursorPlatformObject)initWithPointerRegionRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC110);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BEB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC130);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCursorPlatformObject initWithPointerRegionRequest:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 662, 0, "Invalid parameter not satisfying: %{public}s", "pointerRequest != nil");
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLCursorPlatformObject;
  v9 = [(CRLCursorPlatformObject *)&v12 init];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_pointerRequest, a3);
  }

  return v10;
}

- (UIPointerRegionRequest)pointerRequest
{
  return self->_pointerRequest;
}

- (void).cxx_destruct
{
}

@end