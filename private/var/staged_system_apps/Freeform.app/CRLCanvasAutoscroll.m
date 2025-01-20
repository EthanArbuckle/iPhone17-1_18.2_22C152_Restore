@interface CRLCanvasAutoscroll
+ (void)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4;
- (BOOL)p_startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4 unscaledDistancePastVisibleRect:(double)a5 unscaledInset:(double)a6 directions:(int)a7 repeatInterval:(double)a8;
- (CGPoint)adjustedUnscaledAutoscrollPoint;
- (CGPoint)lastAutoscrollDelta;
- (CGPoint)unscaledAutoscrollPoint;
- (CRLCanvasAutoscrollDelegate)target;
- (double)repeatInterval;
- (double)unscaledDistancePastVisibleRect;
- (double)unscaledInset;
- (int)directions;
- (unint64_t)count;
- (unint64_t)p_unscaledDeltaForCount:(unint64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)p_autoscrollIfPossibleWithDelta:(unint64_t)a3;
- (void)setAdjustedUnscaledAutoscrollPoint:(CGPoint)a3;
- (void)setCount:(unint64_t)a3;
- (void)setDirections:(int)a3;
- (void)setLastAutoscrollDelta:(CGPoint)a3;
- (void)setRepeatInterval:(double)a3;
- (void)setTarget:(id)a3;
- (void)setUnscaledAutoscrollPoint:(CGPoint)a3;
- (void)setUnscaledDistancePastVisibleRect:(double)a3;
- (void)setUnscaledInset:(double)a3;
- (void)timerFired:(id)a3;
@end

@implementation CRLCanvasAutoscroll

- (void)dealloc
{
  [(CRLCanvasAutoscroll *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasAutoscroll;
  [(CRLCanvasAutoscroll *)&v3 dealloc];
}

+ (void)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v84 = a3;
  v6 = [v84 icc];
  [v6 viewScale];
  double v8 = 20.0 / v7;
  if (v84 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v84 unscaledStartAutoscrollThreshold];
    double v10 = v9;
    [v6 viewScale];
    double v8 = v10 / v11;
  }
  [v6 visibleUnscaledRectForAutoscroll];
  CGRect v88 = CGRectInset(v87, v8, v8);
  CGFloat v12 = v88.origin.x;
  CGFloat v13 = v88.origin.y;
  CGFloat width = v88.size.width;
  CGFloat height = v88.size.height;
  v86.CGFloat x = x;
  v86.CGFloat y = y;
  if (CGRectContainsPoint(v88, v86) || ![v6 allowAutoscroll])
  {
    v19 = [v84 autoscroll];
    [v19 invalidate];
    goto LABEL_60;
  }
  double v79 = v8;
  double v81 = x;
  double v82 = y;
  v16 = [v84 autoscroll];

  if (!v16)
  {
    v17 = objc_alloc_init(CRLCanvasAutoscroll);
    [v84 setAutoscroll:v17];
  }
  v18 = [v6 canvasView];
  v19 = [v18 enclosingScrollView];

  [v6 contentOffset];
  double v80 = v20;
  double v83 = v21;
  v22 = [v6 layerHost];
  v23 = [v22 canvasView];
  [v23 bounds];
  double v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  [v6 viewScale];
  double v33 = sub_1000652FC(v25, v27, v29, v31, 1.0 / v32);
  CGFloat v77 = v34;
  CGFloat v78 = v33;
  CGFloat v75 = v36;
  CGFloat v76 = v35;

  [v19 scrollableAreaBounds];
  double v38 = v37;
  double v40 = v39;
  [v19 scrollableAreaContentInsets];
  double v43 = v38 - (v41 + v42);
  double v46 = v40 - (v44 + v45);
  [v6 viewScale];
  double v72 = sub_1000646A4(v43, v46, 1.0 / v47);
  double v74 = v48;
  if (v84 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v49 = [v84 allowedAutoscrollDirections];
  }
  else {
    unsigned __int8 v49 = 15;
  }
  unsigned int v50 = [v6 allowNegativeAutoscroll:v72];
  v89.origin.CGFloat x = v12;
  v89.origin.CGFloat y = v13;
  v89.size.CGFloat width = width;
  v89.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v89);
  v90.origin.CGFloat x = v12;
  v90.origin.CGFloat y = v13;
  v90.size.CGFloat width = width;
  v90.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v90);
  if (v80 > 0.0) {
    int v53 = 1;
  }
  else {
    int v53 = v50;
  }
  if ((v49 & 1) == 0 || (v81 < MinX ? (BOOL v54 = v53 == 0) : (BOOL v54 = 1), v54))
  {
    uint64_t v57 = 0;
    if (v80 >= 0.0) {
      int v58 = 1;
    }
    else {
      int v58 = v50;
    }
    char v55 = 1;
    if ((v49 & 2) == 0 || (v81 >= MaxX ? (BOOL v59 = v58 == 0) : (BOOL v59 = 1), v59))
    {
      double v56 = 0.0;
    }
    else
    {
      v92.origin.CGFloat y = v77;
      v92.origin.CGFloat x = v78;
      v92.size.CGFloat height = v75;
      v92.size.CGFloat width = v76;
      if (v80 >= CGRectGetMaxX(v92) - v73)
      {
        double v56 = 0.0;
        uint64_t v57 = 0;
      }
      else
      {
        v93.origin.CGFloat x = v12;
        v93.origin.CGFloat y = v13;
        v93.size.CGFloat width = width;
        v93.size.CGFloat height = height;
        char v55 = 0;
        double v56 = v81 - CGRectGetMaxX(v93);
        uint64_t v57 = 2;
      }
    }
  }
  else
  {
    v91.origin.CGFloat x = v12;
    v91.origin.CGFloat y = v13;
    v91.size.CGFloat width = width;
    v91.size.CGFloat height = height;
    char v55 = 0;
    double v56 = CGRectGetMinX(v91) - v81;
    uint64_t v57 = 1;
  }
  v94.origin.CGFloat x = v12;
  v94.origin.CGFloat y = v13;
  v94.size.CGFloat width = width;
  v94.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v94);
  v95.origin.CGFloat x = v12;
  v95.origin.CGFloat y = v13;
  v95.size.CGFloat width = width;
  v95.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v95);
  double v62 = v83;
  if (v83 > 0.0) {
    int v63 = 1;
  }
  else {
    int v63 = v50;
  }
  if ((v49 & 4) != 0 && v82 < MinY && v63 != 0)
  {
    uint64_t v57 = v57 | 4;
    v96.origin.CGFloat x = v12;
    v96.origin.CGFloat y = v13;
    v96.size.CGFloat width = width;
    v96.size.CGFloat height = height;
    double v65 = CGRectGetMinY(v96) - v82;
    goto LABEL_53;
  }
  if (v83 >= 0.0) {
    int v66 = 1;
  }
  else {
    int v66 = v50;
  }
  if ((v49 & 8) != 0 && v82 >= MaxY && v66 != 0)
  {
    v97.origin.CGFloat y = v77;
    v97.origin.CGFloat x = v78;
    v97.size.CGFloat height = v75;
    v97.size.CGFloat width = v76;
    CGFloat v68 = CGRectGetMaxY(v97);
    double v62 = v74;
    double MaxY = v68 - v74;
    if (v83 < MaxY)
    {
      uint64_t v57 = v57 | 8;
      v98.origin.CGFloat x = v12;
      v98.origin.CGFloat y = v13;
      v98.size.CGFloat width = width;
      v98.size.CGFloat height = height;
      double v65 = v82 - CGRectGetMaxY(v98);
LABEL_53:
      if (v56 < v65) {
        double v56 = v65;
      }
      goto LABEL_58;
    }
  }
  if ((v55 & 1) == 0)
  {
LABEL_58:
    v70 = [v6 editingCoordinator];
    v71 = [v70 followCoordinator];
    [v71 endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:1];

    v69 = [v84 autoscroll];
    [v69 p_startAutoscroll:v84 unscaledPoint:v57 unscaledDistancePastVisibleRect:v81 unscaledInset:v82 directions:v56 repeatInterval:0.035];
    goto LABEL_59;
  }
  v69 = [v84 autoscroll:MaxY, v62];
  [v69 invalidate];
LABEL_59:

LABEL_60:
}

- (BOOL)p_startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4 unscaledDistancePastVisibleRect:(double)a5 unscaledInset:(double)a6 directions:(int)a7 repeatInterval:(double)a8
{
  uint64_t v9 = *(void *)&a7;
  double y = a4.y;
  double x = a4.x;
  id v15 = a3;
  if (self->_timer)
  {
    id v16 = [(CRLCanvasAutoscroll *)self target];
    if (v16 == v15
      && ([(CRLCanvasAutoscroll *)self unscaledAutoscrollPoint], v23 == x)
      && v22 == y
      && [(CRLCanvasAutoscroll *)self directions] == v9)
    {
      [(CRLCanvasAutoscroll *)self repeatInterval];
      double v25 = v24;

      if (v25 == a8)
      {
LABEL_31:
        BOOL v21 = 1;
        goto LABEL_32;
      }
    }
    else
    {
    }
  }
  char v17 = objc_opt_respondsToSelector();
  BOOL v18 = a8 == 0.0 || v9 == 0;
  if (!v18 && (v17 & 1) != 0)
  {
    id v19 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:0.0];
    timer = self->_timer;
    if (timer)
    {
      [(NSTimer *)timer setFireDate:v19];
    }
    else
    {
      +[NSDate timeIntervalSinceReferenceDate];
      self->_lastFired = v26;
      if (!+[NSThread isMainThread])
      {
        int v27 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DE508);
        }
        double v28 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101084FE8(v27, v28);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DE528);
        }
        CGFloat v29 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101066770(v29, v27);
        }
        double v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAutoscroll p_startAutoscroll:unscaledPoint:unscaledDistancePastVisibleRect:unscaledInset:directions:repeatInterval:]");
        CGFloat v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAutoscroll.m"];
        +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:170 isFatal:0 description:"This operation must only be performed on the main thread."];
      }
      double v32 = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:v19 interval:self target:"timerFired:" selector:0 userInfo:1 repeats:a8];
      double v33 = self->_timer;
      self->_timer = v32;

      double v34 = +[NSRunLoop currentRunLoop];
      [v34 addTimer:self->_timer forMode:NSDefaultRunLoopMode];
    }
    if ([(CRLCanvasAutoscroll *)self directions] != v9) {
      [(CRLCanvasAutoscroll *)self setCount:0];
    }
    [(CRLCanvasAutoscroll *)self setTarget:v15];
    -[CRLCanvasAutoscroll setUnscaledAutoscrollPoint:](self, "setUnscaledAutoscrollPoint:", x, y);
    -[CRLCanvasAutoscroll setAdjustedUnscaledAutoscrollPoint:](self, "setAdjustedUnscaledAutoscrollPoint:", x, y);
    [(CRLCanvasAutoscroll *)self setDirections:v9];
    [(CRLCanvasAutoscroll *)self setRepeatInterval:a8];
    [(CRLCanvasAutoscroll *)self setUnscaledDistancePastVisibleRect:a5];
    [(CRLCanvasAutoscroll *)self setUnscaledInset:a6];

    goto LABEL_31;
  }
  [(CRLCanvasAutoscroll *)self invalidate];
  BOOL v21 = 0;
LABEL_32:

  return v21;
}

- (void)invalidate
{
  timer = self->_timer;
  if (timer)
  {
    v4 = timer;
    v5 = self->_timer;
    self->_timer = 0;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B4340;
    block[3] = &unk_1014CBBB0;
    double v10 = v4;
    v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  double v7 = [(CRLCanvasAutoscroll *)self target];
  [v7 autoscrollWillNotStart];

  [(CRLCanvasAutoscroll *)self setTarget:0];
  double y = CGPointZero.y;
  -[CRLCanvasAutoscroll setUnscaledAutoscrollPoint:](self, "setUnscaledAutoscrollPoint:", CGPointZero.x, y);
  -[CRLCanvasAutoscroll setAdjustedUnscaledAutoscrollPoint:](self, "setAdjustedUnscaledAutoscrollPoint:", CGPointZero.x, y);
  [(CRLCanvasAutoscroll *)self setDirections:0];
  [(CRLCanvasAutoscroll *)self setRepeatInterval:0.0];
  [(CRLCanvasAutoscroll *)self setCount:0];
  [(CRLCanvasAutoscroll *)self setUnscaledDistancePastVisibleRect:0.0];
  [(CRLCanvasAutoscroll *)self setUnscaledInset:1.0];
}

- (unint64_t)p_unscaledDeltaForCount:(unint64_t)a3
{
  uint64_t v5 = [(CRLCanvasAutoscroll *)self target];
  if (v5
    && (v6 = (void *)v5,
        [(CRLCanvasAutoscroll *)self target],
        double v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    uint64_t v9 = [(CRLCanvasAutoscroll *)self target];
    id v10 = [v9 maximumAutoscrollDeltaForCount:a3];

    double v11 = (double)(unint64_t)v10;
  }
  else
  {
    double v11 = 48.0;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v13 = v12 - self->_lastFired;
  [(CRLCanvasAutoscroll *)self repeatInterval];
  unint64_t result = (unint64_t)(v11 * (v13 / v14));
  if (a3 <= 0x18) {
    return (unint64_t)(float)((float)(1.0 / (float)(26 - a3)) * (float)result);
  }
  return result;
}

- (void)timerFired:(id)a3
{
  [(CRLCanvasAutoscroll *)self setCount:(char *)[(CRLCanvasAutoscroll *)self count] + 1];
  uint64_t v4 = [(CRLCanvasAutoscroll *)self target];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    v6 = [(CRLCanvasAutoscroll *)self target];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(CRLCanvasAutoscroll *)self target];
      unsigned int v9 = [v8 allowedAutoscrollDirections];

      unsigned int v10 = [(CRLCanvasAutoscroll *)self directions];
      if ((v10 & ~v9) != 0)
      {
        unsigned int v11 = v10;
        [(CRLCanvasAutoscroll *)self setCount:0];
        [(CRLCanvasAutoscroll *)self setDirections:v11 & v9];
      }
    }
  }
  unint64_t v12 = [(CRLCanvasAutoscroll *)self p_unscaledDeltaForCount:[(CRLCanvasAutoscroll *)self count]];

  [(CRLCanvasAutoscroll *)self p_autoscrollIfPossibleWithDelta:v12];
}

- (void)p_autoscrollIfPossibleWithDelta:(unint64_t)a3
{
  unsigned int v5 = [(CRLCanvasAutoscroll *)self directions];
  v6 = [(CRLCanvasAutoscroll *)self target];
  id v85 = [v6 icc];

  char v7 = [v85 canvasView];
  char v8 = [v7 enclosingScrollView];
  [v85 contentOffset];
  double v84 = v9;
  double v81 = v10;
  unsigned int v11 = [v85 layerHost];
  unint64_t v12 = [v11 canvasLayer];
  [v12 contentInset];
  double v14 = v13;
  double v16 = v15;

  [v85 viewScale];
  double v18 = v17;
  id v19 = [v85 layerHost];
  double v20 = [v19 canvasView];
  [v20 bounds];
  double v21 = 1.0 / v18;
  double v82 = sub_1000652FC(v22, v23, v24, v25, 1.0 / v18);
  CGFloat v83 = v26;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  [v8 scrollableAreaBounds];
  double v32 = v31;
  double v34 = v33;
  [v8 scrollableAreaContentInsets];
  double v37 = v32 - (v35 + v36);
  double v40 = v34 - (v38 + v39);
  [v85 viewScale];
  double v42 = sub_1000646A4(v37, v40, 1.0 / v41);
  double v44 = v43;
  double v45 = sub_1000646A4(v16, v14, v21);
  double v47 = v46;
  uint64_t v48 = [(CRLCanvasAutoscroll *)self target];
  double MinY = v47;
  if (v48
    && (unsigned __int8 v49 = (void *)v48,
        [(CRLCanvasAutoscroll *)self target],
        unsigned int v50 = objc_claimAutoreleasedReturnValue(),
        char v51 = objc_opt_respondsToSelector(),
        v50,
        v49,
        (v51 & 1) != 0))
  {
    v52 = [(CRLCanvasAutoscroll *)self target];
    unsigned __int8 v53 = [v52 allowScrollingOutsideOfBounds];
  }
  else
  {
    unsigned __int8 v53 = [v85 shouldCanvasScrollingSizeGrowToFitBoardContent:v47];
  }
  if (v5)
  {
    double v54 = v44;
    v87.origin.double x = v82;
    v87.origin.double y = v83;
    v87.size.CGFloat width = v28;
    v87.size.CGFloat height = v30;
    double MinX = CGRectGetMinX(v87);
    double v55 = v84 - (double)a3;
    double v57 = v81;
    if ((v53 & 1) == 0)
    {
      if (v84 <= MinX)
      {
        v5 &= ~1u;
        double v55 = v84;
      }
      else
      {
        float v58 = v55;
        float v59 = MinX;
        double v55 = fmaxf(v58, v59);
      }
    }
    v61 = v85;
  }
  else
  {
    if ((v5 & 2) == 0)
    {
      double v54 = v44;
      double v55 = v84;
LABEL_13:
      v61 = v85;
      double v57 = v81;
      goto LABEL_16;
    }
    v88.origin.double x = v82;
    v88.origin.double y = v83;
    v88.size.CGFloat width = v28;
    v88.size.CGFloat height = v30;
    double MaxX = CGRectGetMaxX(v88);
    double v55 = v84 + (double)a3;
    if (v53)
    {
      double v54 = v44;
      goto LABEL_13;
    }
    double v69 = v42;
    double v54 = v44;
    double v70 = MaxX - v69;
    v61 = v85;
    double v57 = v81;
    if (v84 >= v70)
    {
      v5 &= ~2u;
      double v55 = v84;
    }
    else
    {
      float v71 = v55;
      float v72 = v70;
      double v55 = fminf(v71, v72);
    }
  }
LABEL_16:
  if ((v5 & 4) != 0)
  {
    if ([v61 shouldCanvasScrollingSizeGrowToFitBoardContent])
    {
      v90.origin.double x = v82;
      v90.origin.double y = v83;
      v90.size.CGFloat width = v28;
      v90.size.CGFloat height = v30;
      double MinY = CGRectGetMinY(v90);
    }
    double v63 = v57 - (double)a3;
    if ((v53 & 1) == 0)
    {
      if (v57 <= MinY)
      {
        v5 &= ~4u;
        v61 = v85;
        goto LABEL_31;
      }
      float v67 = v63;
      float v68 = MinY;
      double v63 = fmaxf(v67, v68);
    }
LABEL_26:
    v61 = v85;
    goto LABEL_32;
  }
  if ((v5 & 8) == 0) {
    goto LABEL_31;
  }
  v89.origin.double x = v82;
  v89.origin.double y = v83;
  v89.size.CGFloat width = v28;
  v89.size.CGFloat height = v30;
  double MaxY = CGRectGetMaxY(v89);
  double v63 = v57 + (double)a3;
  if (v53) {
    goto LABEL_26;
  }
  double v64 = MaxY - v54;
  v61 = v85;
  if (v57 < v64)
  {
    float v65 = v63;
    float v66 = v64;
    double v63 = fminf(v65, v66);
LABEL_32:
    [v61 setContentOffset:@"CRLCanvasAutoscrollInteractionSource" source:0 scrollOptions:v55, v63, MinY];
    [(CRLCanvasAutoscroll *)self setLastAutoscrollDelta:sub_100064680(v55, v63, v84)];
    [(CRLCanvasAutoscroll *)self adjustedUnscaledAutoscrollPoint];
    double v74 = v73;
    double v76 = v75;
    [(CRLCanvasAutoscroll *)self lastAutoscrollDelta];
    [(CRLCanvasAutoscroll *)self setAdjustedUnscaledAutoscrollPoint:sub_100064698(v74, v76, v77)];
    CGFloat v78 = [(CRLCanvasAutoscroll *)self target];
    [v78 updateAfterAutoscroll:self];

    +[NSDate timeIntervalSinceReferenceDate];
    self->_lastFired = v79;
    goto LABEL_33;
  }
  v5 &= ~8u;
LABEL_31:
  double v63 = v57;
  if (v5) {
    goto LABEL_32;
  }
  [(CRLCanvasAutoscroll *)self invalidate];
LABEL_33:
}

- (CRLCanvasAutoscrollDelegate)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (CGPoint)unscaledAutoscrollPoint
{
  double x = self->_unscaledAutoscrollPoint.x;
  double y = self->_unscaledAutoscrollPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUnscaledAutoscrollPoint:(CGPoint)a3
{
  self->_unscaledAutoscrollPoint = a3;
}

- (CGPoint)adjustedUnscaledAutoscrollPoint
{
  double x = self->_adjustedUnscaledAutoscrollPoint.x;
  double y = self->_adjustedUnscaledAutoscrollPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAdjustedUnscaledAutoscrollPoint:(CGPoint)a3
{
  self->_adjustedUnscaledAutoscrollPoint = a3;
}

- (int)directions
{
  return self->_directions;
}

- (void)setDirections:(int)a3
{
  self->_directions = a3;
}

- (double)repeatInterval
{
  return self->_repeatInterval;
}

- (void)setRepeatInterval:(double)a3
{
  self->_repeatInterval = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (double)unscaledDistancePastVisibleRect
{
  return self->_unscaledDistancePastVisibleRect;
}

- (void)setUnscaledDistancePastVisibleRect:(double)a3
{
  self->_unscaledDistancePastVisibleRect = a3;
}

- (CGPoint)lastAutoscrollDelta
{
  double x = self->_lastAutoscrollDelta.x;
  double y = self->_lastAutoscrollDelta.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastAutoscrollDelta:(CGPoint)a3
{
  self->_lastAutoscrollDelta = a3;
}

- (double)unscaledInset
{
  return self->_unscaledInset;
}

- (void)setUnscaledInset:(double)a3
{
  self->_unscaledInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end