@interface CRLPlatformControlState
+ (id)stateWithUIMenuElementState:(int64_t)a3;
+ (id)stateWithValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CRLPlatformControlState)initWithUIMenuElementState:(int64_t)a3;
- (CRLPlatformControlState)initWithValue:(unint64_t)a3;
- (int64_t)stateValue;
- (unint64_t)hash;
@end

@implementation CRLPlatformControlState

+ (id)stateWithValue:(unint64_t)a3
{
  v3 = [[CRLPlatformControlState alloc] initWithValue:a3];

  return v3;
}

- (CRLPlatformControlState)initWithValue:(unint64_t)a3
{
  v3 = self;
  if (a3 <= 2) {
    v3 = -[CRLPlatformControlState initWithUIMenuElementState:](self, "initWithUIMenuElementState:");
  }

  return v3;
}

- (unint64_t)hash
{
  p_mStateValue = &self->mStateValue;
  unint64_t result = self->mStateValue;
  if (result >= 3)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD1B0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101068D38(p_mStateValue, v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CD1D0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v6, v4);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPlatformControlState hash]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPlatformControlState.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 65, 0, "Bad value: %zd", *p_mStateValue);

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  if (v6) {
    BOOL v7 = self->mStateValue == v6[1];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)stateWithUIMenuElementState:(int64_t)a3
{
  v3 = [[CRLPlatformControlState alloc] initWithUIMenuElementState:a3];

  return v3;
}

- (CRLPlatformControlState)initWithUIMenuElementState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLPlatformControlState;
  unint64_t result = [(CRLPlatformControlState *)&v5 init];
  if (result) {
    result->mStateValue = a3;
  }
  return result;
}

- (int64_t)stateValue
{
  return self->mStateValue;
}

@end