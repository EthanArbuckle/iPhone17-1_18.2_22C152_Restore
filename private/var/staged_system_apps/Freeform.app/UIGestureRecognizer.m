@interface UIGestureRecognizer
- (BOOL)isDone;
- (CGPoint)unscaledLocationForICC:(id)a3;
- (CRLCanvasRep)targetRep;
- (CRLGestureDelegate)gestureDelegate;
- (NSString)gestureKind;
- (UIGestureRecognizer)initWithGestureDispatcher:(id)a3 gestureKind:(id)a4;
- (id)cachedGestureTarget;
- (int)gestureState;
- (int64_t)inputType;
- (void)setCachedGestureTarget:(id)a3;
- (void)setGestureDelegate:(id)a3;
- (void)setGestureKind:(id)a3;
- (void)setTargetRep:(id)a3;
@end

@implementation UIGestureRecognizer

- (UIGestureRecognizer)initWithGestureDispatcher:(id)a3 gestureKind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIGestureRecognizer *)self initWithTarget:v6 action:"handleGesture:"];
  v9 = v8;
  if (v8)
  {
    [(UIGestureRecognizer *)v8 setGestureDelegate:v6];
    [(UIGestureRecognizer *)v9 setGestureKind:v7];
    [(UIGestureRecognizer *)v9 setName:v7];
  }

  return v9;
}

- (void)setGestureKind:(id)a3
{
}

- (NSString)gestureKind
{
  objc_getAssociatedObject(self, &unk_1016A9060);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2) {
    v2 = @"CRLWPUndefinedGestureKind";
  }
  v4 = v2;

  return v4;
}

- (void)setCachedGestureTarget:(id)a3
{
  id v4 = a3;
  value = [[TSDCachedGestureTargetHolder alloc] initWithTarget:v4];

  objc_setAssociatedObject(self, &unk_1016A9061, value, (void *)0x301);
}

- (id)cachedGestureTarget
{
  v2 = objc_getAssociatedObject(self, &unk_1016A9061);
  v3 = [v2 weakCachedGestureTarget];

  return v3;
}

- (void)setTargetRep:(id)a3
{
}

- (CRLCanvasRep)targetRep
{
  return (CRLCanvasRep *)objc_getAssociatedObject(self, &unk_1016A9062);
}

- (int64_t)inputType
{
  return 1;
}

- (CGPoint)unscaledLocationForICC:(id)a3
{
  id v4 = a3;
  v5 = [v4 canvasView];
  [(UIGestureRecognizer *)self locationInView:v5];
  [v4 convertBoundsToUnscaledPoint:];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CRLGestureDelegate)gestureDelegate
{
  v2 = [(UIGestureRecognizer *)self delegate];
  double v9 = sub_100246AC8(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);

  return (CRLGestureDelegate *)v9;
}

- (void)setGestureDelegate:(id)a3
{
  double v9 = sub_100246AC8(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___UIGestureRecognizerDelegate);
  if (!v9)
  {
    int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D48B0);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076A04(v10, v11);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D48D0);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v12, v10);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIGestureRecognizer(CRLGestureDispatcher) setGestureDelegate:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/UIGestureRecognizer+Text.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 84, 0, "invalid nil value for '%{public}s'", "grDelegate");
  }
  [(UIGestureRecognizer *)self setDelegate:v9];
}

- (int)gestureState
{
  return [(UIGestureRecognizer *)self state];
}

- (BOOL)isDone
{
  return [(UIGestureRecognizer *)self gestureState] - 3 < 3;
}

@end