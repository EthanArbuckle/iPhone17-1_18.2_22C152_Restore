@interface CRLCounterRotateRep
- (BOOL)isInDynamicOperation;
- (CGRect)clipRect;
- (id)dynamicResizeDidBegin;
- (id)p_childRep;
- (id)p_counterRotateInfo;
- (id)p_possibleChildRep;
- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3;
- (void)dynamicFreeTransformDidEndWithTracker:(id)a3;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)dynamicallyFreeTransformingWithTracker:(id)a3;
- (void)dynamicallyResizingWithTracker:(id)a3;
- (void)setNeedsDisplay;
@end

@implementation CRLCounterRotateRep

- (id)p_counterRotateInfo
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self info];
  v5 = sub_1002469D0(v3, v4);

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE9E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA8D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FEA00);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateRep p_counterRotateInfo]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 25, 0, "invalid nil value for '%{public}s'", "counterRotateInfo");
  }

  return v5;
}

- (id)p_possibleChildRep
{
  uint64_t v3 = [(CRLCanvasRep *)self childReps];
  if ((unint64_t)[v3 count] >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FEA20);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA980();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FEA40);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateRep p_possibleChildRep]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:31 isFatal:0 description:"Should have either one or zero child reps."];
  }
  v7 = [(CRLCanvasRep *)self childReps];
  v8 = [v7 firstObject];

  return v8;
}

- (id)p_childRep
{
  v2 = [(CRLCounterRotateRep *)self p_possibleChildRep];
  if (!v2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FEA60);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BAA20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FEA80);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateRep p_childRep]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 37, 0, "invalid nil value for '%{public}s'", "childRepToReturn");
  }

  return v2;
}

- (CGRect)clipRect
{
  v2 = [(CRLCounterRotateRep *)self p_childRep];
  [v2 clipRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [v2 layout];
  v12 = v11;
  if (v11) {
    [v11 transform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  v22.origin.CGFloat x = v4;
  v22.origin.CGFloat y = v6;
  v22.size.CGFloat width = v8;
  v22.size.CGFloat height = v10;
  CGRect v23 = CGRectApplyAffineTransform(v22, &v21);
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)setNeedsDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCounterRotateRep;
  [(CRLCanvasRep *)&v4 setNeedsDisplay];
  double v3 = [(CRLCounterRotateRep *)self p_childRep];
  [v3 setNeedsDisplay];
}

- (BOOL)isInDynamicOperation
{
  v2 = [(CRLCounterRotateRep *)self p_possibleChildRep];
  unsigned __int8 v3 = [v2 isInDynamicOperation];

  return v3;
}

- (id)dynamicResizeDidBegin
{
  v7.receiver = self;
  v7.super_class = (Class)CRLCounterRotateRep;
  unsigned __int8 v3 = [(CRLCanvasRep *)&v7 dynamicResizeDidBegin];
  objc_super v4 = [(CRLCounterRotateRep *)self p_childRep];
  id v5 = [v4 dynamicResizeDidBegin];

  return v3;
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  id v4 = a3;
  [(CRLCanvasRep *)&v6 dynamicallyResizingWithTracker:v4];
  id v5 = [(CRLCounterRotateRep *)self p_childRep];
  [v5 dynamicallyResizingWithTracker:v4];
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCounterRotateRep *)self p_childRep];
  [v4 applyNewBoundsToRep:v5];

  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  [(CRLCanvasRep *)&v6 dynamicResizeDidEndWithTracker:v4];
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  id v4 = a3;
  [(CRLCanvasRep *)&v6 dynamicFreeTransformDidBeginWithTracker:v4];
  id v5 = [(CRLCounterRotateRep *)self p_childRep];
  [v5 dynamicFreeTransformDidBeginWithTracker:v4];
}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  id v4 = a3;
  [(CRLCanvasRep *)&v6 dynamicallyFreeTransformingWithTracker:v4];
  id v5 = [(CRLCounterRotateRep *)self p_childRep];
  [v5 dynamicallyFreeTransformingWithTracker:v4];
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCounterRotateRep *)self p_childRep];
  [v4 applyNewBoundsToRep:v5];

  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  [(CRLCanvasRep *)&v6 dynamicFreeTransformDidEndWithTracker:v4];
}

@end