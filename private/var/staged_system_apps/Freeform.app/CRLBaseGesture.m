@interface CRLBaseGesture
- (BOOL)gestureShouldEnd;
- (BOOL)isDone;
- (CGPoint)unscaledLocation;
- (CGPoint)unscaledLocationForICC:(id)a3;
- (CRLBaseGesture)init;
- (CRLBaseGesture)initWithGestureDispatcher:(id)a3 gestureKind:(id)a4;
- (CRLBaseGesture)initWithTarget:(id)a3 action:(SEL)a4;
- (CRLCanvasRep)targetRep;
- (CRLGestureDelegate)gestureDelegate;
- (NSString)description;
- (NSString)gestureKind;
- (id)cachedGestureTarget;
- (int)gestureState;
- (int64_t)inputType;
- (int64_t)tsdModifierFlags;
- (void)gestureBeganAtLocation:(CGPoint)a3;
- (void)gestureCancelledAtLocation:(CGPoint)a3;
- (void)gestureEndedAtLocation:(CGPoint)a3;
- (void)gestureMovedToLocation:(CGPoint)a3;
- (void)gestureRecognizedAtLocation:(CGPoint)a3;
- (void)reset;
- (void)setCachedGestureTarget:(id)a3;
- (void)setGestureDelegate:(id)a3;
- (void)setGestureKind:(id)a3;
- (void)setGestureShouldEnd:(BOOL)a3;
- (void)setGestureState:(int)a3;
- (void)setInputType:(int64_t)a3;
- (void)setTargetRep:(id)a3;
- (void)setTsdModifierFlags:(int64_t)a3;
- (void)setUnscaledLocation:(CGPoint)a3;
@end

@implementation CRLBaseGesture

- (CRLBaseGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLBaseGesture;
  v8 = [(CRLBaseGesture *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->mGestureState = 0;
    objc_storeStrong(&v8->mTarget, a3);
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v9->mAction = v10;
  }

  return v9;
}

- (CRLBaseGesture)initWithGestureDispatcher:(id)a3 gestureKind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CRLBaseGesture *)self initWithTarget:v6 action:"handleGesture:"];
  v9 = v8;
  if (v8)
  {
    [(CRLBaseGesture *)v8 setGestureDelegate:v6];
    [(CRLBaseGesture *)v9 setGestureKind:v7];
    [(CRLBaseGesture *)v9 setInputType:1];
  }

  return v9;
}

- (CRLBaseGesture)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF570);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLBaseGesture init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBaseGesture.m";
    __int16 v17 = 1024;
    int v18 = 72;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FF590);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    id v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBaseGesture init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBaseGesture.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:72 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLBaseGesture init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setCachedGestureTarget:(id)a3
{
}

- (id)cachedGestureTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mWeaklyCachedGestureTarget);

  return WeakRetained;
}

- (void)gestureBeganAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(CRLBaseGesture *)self gestureState])
  {
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF5B0);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BBCF0(v7, self, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF5D0);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v8, v6);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBaseGesture gestureBeganAtLocation:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBaseGesture.m"];
    v11 = [(CRLBaseGesture *)self gestureKind];
    unsigned int v12 = sub_10033005C([(CRLBaseGesture *)self gestureState]);
    +[CRLAssertionHandler handleFailureInFunction:v9, v10, 85, 0, "Gesture %@ in invalid state %@", v11, v12 file lineNumber isFatal description];
  }
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", x, y);
  __int16 v13 = [(CRLBaseGesture *)self gestureDelegate];
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0
    && ([(CRLBaseGesture *)self gestureDelegate],
        __int16 v15 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [v15 gestureActionShouldBegin:self],
        v15,
        v16))
  {
    [(CRLBaseGesture *)self setGestureState:1];
    mAction = self->mAction;
    id mTarget = self->mTarget;
    if (mAction) {
      [mTarget mAction:self];
    }
    else {
      [mTarget];
    }
  }
  else
  {
    [(CRLBaseGesture *)self setGestureState:5];
  }
}

- (void)gestureMovedToLocation:(CGPoint)a3
{
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", a3.x, a3.y);
  if ([(CRLBaseGesture *)self isDone])
  {
    [(CRLBaseGesture *)self setGestureState:5];
  }
  else
  {
    [(CRLBaseGesture *)self setGestureState:2];
    id mTarget = self->mTarget;
    if (self->mAction) {
      mAction = self->mAction;
    }
    else {
      mAction = 0;
    }
    [mTarget mAction:self];
  }
}

- (void)gestureEndedAtLocation:(CGPoint)a3
{
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", a3.x, a3.y);
  if ([(CRLBaseGesture *)self isDone])
  {
    [(CRLBaseGesture *)self setGestureState:5];
  }
  else
  {
    [(CRLBaseGesture *)self setGestureState:3];
    id mTarget = self->mTarget;
    if (self->mAction) {
      mAction = self->mAction;
    }
    else {
      mAction = 0;
    }
    [mTarget mAction:self];
  }
}

- (void)gestureRecognizedAtLocation:(CGPoint)a3
{
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", a3.x, a3.y);
  if (![(CRLBaseGesture *)self isDone])
  {
    v4 = [(CRLBaseGesture *)self gestureDelegate];
    if (objc_opt_respondsToSelector())
    {
      v5 = [(CRLBaseGesture *)self gestureDelegate];
      unsigned int v6 = [v5 gestureActionShouldBegin:self];

      if (v6)
      {
        [(CRLBaseGesture *)self setGestureState:3];
        id mTarget = self->mTarget;
        if (self->mAction) {
          mAction = self->mAction;
        }
        else {
          mAction = 0;
        }
        [mTarget mAction:self];
        return;
      }
    }
    else
    {
    }
  }

  [(CRLBaseGesture *)self setGestureState:5];
}

- (void)gestureCancelledAtLocation:(CGPoint)a3
{
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", a3.x, a3.y);
  [(CRLBaseGesture *)self setGestureState:4];
  id mTarget = self->mTarget;
  if (self->mAction) {
    mAction = self->mAction;
  }
  else {
    mAction = 0;
  }

  [mTarget performSelector:mAction withObject:self];
}

- (void)reset
{
}

- (CGPoint)unscaledLocationForICC:(id)a3
{
  [(CRLBaseGesture *)self unscaledLocation];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)isDone
{
  return [(CRLBaseGesture *)self gestureState] - 3 < 3;
}

- (NSString)description
{
  mGestureKind = self->mGestureKind;
  double v4 = sub_10033005C(self->mState);
  id mTarget = self->mTarget;
  if (self->mAction) {
    mAction = self->mAction;
  }
  else {
    mAction = 0;
  }
  id v7 = NSStringFromSelector(mAction);
  v8 = +[CRLDescription descriptionWithObject:self, @" { gestureKind:%@ state:%@ target:%p action:%@ }", mGestureKind, v4, mTarget, v7 format];

  v9 = [v8 descriptionString];

  return (NSString *)v9;
}

- (CRLGestureDelegate)gestureDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mGestureDelegate);

  return (CRLGestureDelegate *)WeakRetained;
}

- (void)setGestureDelegate:(id)a3
{
}

- (int)gestureState
{
  return self->mState;
}

- (void)setGestureState:(int)a3
{
  self->mState = a3;
}

- (NSString)gestureKind
{
  return self->mGestureKind;
}

- (void)setGestureKind:(id)a3
{
}

- (CRLCanvasRep)targetRep
{
  return self->mTargetRep;
}

- (void)setTargetRep:(id)a3
{
}

- (BOOL)gestureShouldEnd
{
  return self->mGestureShouldEnd;
}

- (void)setGestureShouldEnd:(BOOL)a3
{
  self->mGestureShouldEnd = a3;
}

- (int64_t)inputType
{
  return self->mInputType;
}

- (void)setInputType:(int64_t)a3
{
  self->mInputType = a3;
}

- (int64_t)tsdModifierFlags
{
  return self->mTSDModifierFlags;
}

- (void)setTsdModifierFlags:(int64_t)a3
{
  self->mTSDModifierFlags = a3;
}

- (CGPoint)unscaledLocation
{
  double x = self->mUnscaledLocation.x;
  double y = self->mUnscaledLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUnscaledLocation:(CGPoint)a3
{
  self->mUnscaledLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetRep, 0);
  objc_storeStrong((id *)&self->mGestureKind, 0);
  objc_destroyWeak((id *)&self->mWeaklyCachedGestureTarget);
  objc_destroyWeak((id *)&self->mGestureDelegate);

  objc_storeStrong(&self->mTarget, 0);
}

@end