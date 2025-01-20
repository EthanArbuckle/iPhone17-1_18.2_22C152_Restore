@interface TSDAutoscroll
+ (void)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4;
- (BOOL)active;
- (BOOL)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4 directions:(int)a5 repeatInterval:(double)a6;
- (BOOL)targetIsAutoscrolling;
- (CGPoint)lastAutoscrollDelta;
- (CGPoint)point;
- (TSDAutoscrollDelegate)target;
- (double)repeatInterval;
- (int)directions;
- (unint64_t)count;
- (unint64_t)p_deltaForCount:(unint64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)p_cleanup;
- (void)setActive:(BOOL)a3;
- (void)setCount:(unint64_t)a3;
- (void)setDirections:(int)a3;
- (void)setPoint:(CGPoint)a3;
- (void)setRepeatInterval:(double)a3;
- (void)setTarget:(id)a3;
- (void)setTargetIsAutoscrolling:(BOOL)a3;
- (void)timerFired:(id)a3;
@end

@implementation TSDAutoscroll

- (void)dealloc
{
  self->mTarget = 0;
  [(TSDAutoscroll *)self p_cleanup];
  v3.receiver = self;
  v3.super_class = (Class)TSDAutoscroll;
  [(TSDAutoscroll *)&v3 dealloc];
}

- (void)setTarget:(id)a3
{
  mTarget = self->mTarget;
  if (mTarget != a3)
  {

    self->mTarget = (TSDAutoscrollDelegate *)a3;
  }
}

+ (void)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v7 = (void *)[a3 icc];
  [v7 viewScale];
  double v9 = 20.0 / v8;
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [a3 unscaledStartAutoscrollThreshold];
    double v11 = v10;
    [v7 viewScale];
    double v9 = v11 / v12;
  }
  [v7 visibleUnscaledRectForAutoscroll];
  CGRect v57 = CGRectInset(v56, v9, v9);
  CGFloat v13 = v57.origin.x;
  CGFloat v14 = v57.origin.y;
  CGFloat width = v57.size.width;
  CGFloat height = v57.size.height;
  v55.double x = x;
  v55.double y = y;
  if (CGRectContainsPoint(v57, v55) || ![v7 allowAutoscroll]) {
    goto LABEL_45;
  }
  if (![a3 autoscroll])
  {
    v17 = objc_alloc_init(TSDAutoscroll);
    [a3 setAutoscroll:v17];
  }
  v18 = objc_msgSend((id)objc_msgSend(v7, "canvasView"), "enclosingScrollView");
  [v7 contentOffset];
  double v53 = v19;
  double v52 = v20;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "layerHost"), "canvasView"), "bounds");
  double v22 = v21;
  double v24 = v23;
  [v7 viewScale];
  double v50 = TSDMultiplySizeScalar(v22, v24, 1.0 / v25);
  double v51 = v26;
  [v18 scrollableAreaBounds];
  double v28 = v27;
  double v30 = v29;
  [v7 viewScale];
  double v32 = TSDMultiplySizeScalar(v28, v30, 1.0 / v31);
  double v34 = v33;
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v35 = [a3 allowedAutoscrollDirections];
  }
  else {
    char v35 = 15;
  }
  int v36 = [v7 allowNegativeAutoscroll];
  int v37 = v36;
  double v38 = v53;
  if (v53 > 0.0) {
    int v39 = 1;
  }
  else {
    int v39 = v36;
  }
  if ((v35 & 1) != 0
    && v39
    && (v58.origin.double x = v13,
        v58.origin.double y = v14,
        v58.size.CGFloat width = width,
        v58.size.CGFloat height = height,
        CGFloat MinX = CGRectGetMinX(v58),
        double v38 = v53,
        x < MinX))
  {
    char v41 = 0;
    uint64_t v42 = 1;
  }
  else
  {
    uint64_t v42 = 0;
    if (v38 >= 0.0) {
      int v43 = 1;
    }
    else {
      int v43 = v37;
    }
    char v41 = 1;
    if ((v35 & 2) != 0 && v43)
    {
      BOOL v44 = v38 < v50 - v32;
      double v45 = v52;
      if (v44)
      {
        v59.origin.double x = v13;
        v59.origin.double y = v14;
        v59.size.CGFloat width = width;
        v59.size.CGFloat height = height;
        if (x >= CGRectGetMaxX(v59))
        {
          char v41 = 0;
          uint64_t v42 = 2;
        }
        else
        {
          uint64_t v42 = 0;
        }
      }
      goto LABEL_30;
    }
  }
  double v45 = v52;
LABEL_30:
  if (v45 > 0.0) {
    int v46 = 1;
  }
  else {
    int v46 = v37;
  }
  if ((v35 & 4) != 0)
  {
    if (v46)
    {
      v60.origin.double x = v13;
      v60.origin.double y = v14;
      v60.size.CGFloat width = width;
      v60.size.CGFloat height = height;
      if (y < CGRectGetMinY(v60))
      {
        uint64_t v42 = v42 | 4;
        goto LABEL_49;
      }
    }
  }
  if (v45 >= 0.0) {
    int v47 = 1;
  }
  else {
    int v47 = v37;
  }
  if ((v35 & 8) != 0)
  {
    if (v47)
    {
      if (v45 < v51 - v34)
      {
        v61.origin.double x = v13;
        v61.origin.double y = v14;
        v61.size.CGFloat width = width;
        v61.size.CGFloat height = height;
        if (y >= CGRectGetMaxY(v61))
        {
          uint64_t v42 = v42 | 8;
          goto LABEL_49;
        }
      }
    }
  }
  if ((v41 & 1) == 0)
  {
LABEL_49:
    objc_msgSend((id)objc_msgSend(a3, "autoscroll"), "startAutoscroll:unscaledPoint:directions:repeatInterval:", a3, v42, x, y, 0.035);
    v49 = objc_msgSend((id)objc_msgSend(v7, "layerHost"), "canvasView");
    objc_msgSend(v7, "convertUnscaledToBoundsPoint:", x, y);
    objc_msgSend(v49, "convertPoint:toView:", 0);
    objc_msgSend(a3, "setAutoscrollPoint:");
    return;
  }
LABEL_45:
  v48 = (void *)[a3 autoscroll];

  [v48 invalidate];
}

- (BOOL)startAutoscroll:(id)a3 unscaledPoint:(CGPoint)a4 directions:(int)a5 repeatInterval:(double)a6
{
  uint64_t v7 = *(void *)&a5;
  double y = a4.y;
  double x = a4.x;
  if (self->mTimer && [(TSDAutoscroll *)self target] == a3)
  {
    [(TSDAutoscroll *)self point];
    if (v13 == x && v12 == y && [(TSDAutoscroll *)self directions] == v7)
    {
      [(TSDAutoscroll *)self repeatInterval];
      if (v15 == a6) {
        return 1;
      }
    }
  }
  char v17 = objc_opt_respondsToSelector();
  BOOL v18 = a6 == 0.0 || v7 == 0;
  if (v18 || (v17 & 1) == 0)
  {
    [(TSDAutoscroll *)self invalidate];
    return 0;
  }
  else
  {
    double v19 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:0.0];
    mTimer = self->mTimer;
    if (mTimer)
    {
      [(NSTimer *)mTimer setFireDate:v19];
    }
    else
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      self->mLastFired = v21;
      self->mTimer = (NSTimer *)[objc_alloc(MEMORY[0x263EFFA20]) initWithFireDate:v19 interval:self target:sel_timerFired_ selector:0 userInfo:1 repeats:a6];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF9F0], "currentRunLoop"), "addTimer:forMode:", self->mTimer, *MEMORY[0x263EFF478]);
    }

    if ([(TSDAutoscroll *)self directions] != v7) {
      [(TSDAutoscroll *)self setCount:0];
    }
    [(TSDAutoscroll *)self setTarget:a3];
    -[TSDAutoscroll setPoint:](self, "setPoint:", x, y);
    [(TSDAutoscroll *)self setDirections:v7];
    [(TSDAutoscroll *)self setRepeatInterval:a6];
    BOOL v16 = 1;
    [(TSDAutoscroll *)self setActive:1];
  }
  return v16;
}

- (void)p_cleanup
{
  mTimer = self->mTimer;
  if (mTimer)
  {
    self->mTimer = 0;
    [(NSTimer *)mTimer invalidate];
  }
  [(TSDAutoscrollDelegate *)[(TSDAutoscroll *)self target] autoscrollWillNotStart];
  [(TSDAutoscroll *)self setTarget:0];
  -[TSDAutoscroll setPoint:](self, "setPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(TSDAutoscroll *)self setDirections:0];
  [(TSDAutoscroll *)self setRepeatInterval:0.0];
  [(TSDAutoscroll *)self setActive:0];

  [(TSDAutoscroll *)self setCount:0];
}

- (void)invalidate
{
  if (pthread_main_np())
  {
    [(TSDAutoscroll *)self p_cleanup];
  }
  else
  {
    [(TSDAutoscroll *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (unint64_t)p_deltaForCount:(unint64_t)a3
{
  if (self->mTarget && (objc_opt_respondsToSelector() & 1) != 0) {
    double v5 = (double)(unint64_t)[(TSDAutoscrollDelegate *)self->mTarget maximumAutoscrollDeltaForCount:a3];
  }
  else {
    double v5 = 48.0;
  }
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v7 = v6 - self->mLastFired;
  [(TSDAutoscroll *)self repeatInterval];
  unint64_t result = (unint64_t)(v5 * (v7 / v8));
  if (a3 <= 0x18) {
    return (unint64_t)(float)((float)(1.0 / (float)(26 - a3)) * (float)result);
  }
  return result;
}

- (void)timerFired:(id)a3
{
  [(TSDAutoscroll *)self setCount:[(TSDAutoscroll *)self count] + 1];
  if ([(TSDAutoscroll *)self targetIsAutoscrolling]) {
    return;
  }
  v4 = (void *)[(TSDAutoscrollDelegate *)self->mTarget icc];
  double v5 = objc_msgSend((id)objc_msgSend(v4, "canvasView"), "enclosingScrollView");
  [v4 contentOffset];
  double v7 = v6;
  double v9 = v8;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "layerHost"), "canvasLayer"), "contentInset");
  double v11 = v10;
  double v13 = v12;
  [v4 viewScale];
  float v15 = v14;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "layerHost"), "canvasView"), "bounds");
  double v16 = 1.0 / v15;
  double v19 = TSDMultiplySizeScalar(v17, v18, v16);
  double v49 = v20;
  [v5 bounds];
  double v23 = TSDMultiplySizeScalar(v21, v22, v16);
  double v25 = v24;
  double v26 = TSDMultiplyPointScalar(v13, v11, v16);
  double v28 = v27;
  uint64_t v29 = [(TSDAutoscroll *)self directions];
  if (self->mTarget)
  {
    if (objc_opt_respondsToSelector())
    {
      int v30 = [(TSDAutoscrollDelegate *)self->mTarget allowedAutoscrollDirections];
      if ((v29 & ~v30) != 0)
      {
        self->mCount = 0;
        [(TSDAutoscroll *)self setDirections:v30 & v29];
        uint64_t v29 = [(TSDAutoscroll *)self directions];
      }
    }
  }
  unint64_t v31 = [(TSDAutoscroll *)self p_deltaForCount:[(TSDAutoscroll *)self count]];
  if ((v29 & 1) == 0)
  {
    if ((v29 & 2) != 0)
    {
      double v32 = v19 - v23 + v26;
      if (v7 < v32)
      {
        float v33 = v7 + (double)v31;
        float v34 = v32;
        float v35 = fminf(v33, v34);
        goto LABEL_12;
      }
      uint64_t v29 = v29 & 0xFFFFFFFD;
    }
LABEL_18:
    double v38 = v7;
    if ((v29 & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
  if (v7 <= v26)
  {
    uint64_t v29 = v29 & 0xFFFFFFFE;
    goto LABEL_18;
  }
  float v36 = v7 - (double)v31;
  float v37 = v26;
  float v35 = fmaxf(v36, v37);
LABEL_12:
  double v38 = v35;
  if ((v29 & 4) != 0)
  {
LABEL_13:
    if (v9 > v28)
    {
      float v39 = v9 - (double)v31;
      float v40 = v28;
      float v41 = fmaxf(v39, v40);
LABEL_22:
      double v45 = v41;
      goto LABEL_25;
    }
    uint64_t v29 = v29 & 0xFFFFFFFB;
    goto LABEL_24;
  }
LABEL_19:
  if ((v29 & 8) != 0)
  {
    double v42 = v49 - v25 + v28;
    if (v9 < v42)
    {
      float v43 = v9 + (double)v31;
      float v44 = v42;
      float v41 = fminf(v43, v44);
      goto LABEL_22;
    }
    uint64_t v29 = v29 & 0xFFFFFFF7;
  }
LABEL_24:
  double v45 = v9;
  if (!v29)
  {
    [(TSDAutoscroll *)self invalidate];
    return;
  }
LABEL_25:
  [(TSDAutoscroll *)self target];
  if (objc_opt_respondsToSelector())
  {
    [(TSDAutoscroll *)self setTargetIsAutoscrolling:1];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __28__TSDAutoscroll_timerFired___block_invoke;
    v50[3] = &unk_2646B0750;
    v50[4] = self;
    v50[5] = v4;
    if (-[TSDAutoscrollDelegate autoscrollWithDirection:proposedContentOffset:completionBlock:]([(TSDAutoscroll *)self target], "autoscrollWithDirection:proposedContentOffset:completionBlock:", v29, v50, v38, v45))return; {
    [(TSDAutoscroll *)self setTargetIsAutoscrolling:0];
    }
  }
  objc_msgSend(v4, "setContentOffset:animated:", 0, v38, v45);
  int v46 = (void *)[v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v46 interactiveCanvasController:v4 didScrollForAutoscroll:self];
  }
  self->mLastAutoscrollDelta.double x = TSDSubtractPoints(v38, v45, v7);
  self->mLastAutoscrollDelta.double y = v47;
  [(TSDAutoscrollDelegate *)self->mTarget updateAfterAutoscroll:self];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->mLastFired = v48;
}

uint64_t __28__TSDAutoscroll_timerFired___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTargetIsAutoscrolling:0];
  v2 = (void *)[*(id *)(a1 + 40) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 interactiveCanvasController:*(void *)(a1 + 40) didScrollForAutoscroll:*(void *)(a1 + 32)];
  }
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 8);

  return objc_msgSend(v3, "updateAfterAutoscroll:");
}

- (TSDAutoscrollDelegate)target
{
  return self->mTarget;
}

- (CGPoint)point
{
  double x = self->mPoint.x;
  double y = self->mPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->mPoint = a3;
}

- (int)directions
{
  return self->mDirections;
}

- (void)setDirections:(int)a3
{
  self->mDirections = a3;
}

- (double)repeatInterval
{
  return self->mRepeatInterval;
}

- (void)setRepeatInterval:(double)a3
{
  self->mRepeatInterval = a3;
}

- (unint64_t)count
{
  return self->mCount;
}

- (void)setCount:(unint64_t)a3
{
  self->mCount = a3;
}

- (BOOL)active
{
  return self->mActive;
}

- (void)setActive:(BOOL)a3
{
  self->mActive = a3;
}

- (CGPoint)lastAutoscrollDelta
{
  double x = self->mLastAutoscrollDelta.x;
  double y = self->mLastAutoscrollDelta.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)targetIsAutoscrolling
{
  return self->mTargetIsAutoscrolling;
}

- (void)setTargetIsAutoscrolling:(BOOL)a3
{
  self->mTargetIsAutoscrolling = a3;
}

@end