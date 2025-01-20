@interface PXScrollSpeedometer
- (BOOL)hasRampedUpForCurrentAnimatedScroll;
- (BOOL)isAnimatingScroll;
- (BOOL)isManuallyChanging;
- (BOOL)isScrubbing;
- (CGPoint)lastScrollDirection;
- (CGPoint)scrollAcceleration;
- (CGPoint)scrollVelocity;
- (CGRect)_lastVisibleRect;
- (NSString)description;
- (NSTimer)_timeoutTimer;
- (PXScrollSpeedometer)init;
- (double)_lastTime;
- (double)fastLowerThreshold;
- (double)fastUpperThreshold;
- (double)mediumLowerThreshold;
- (double)mediumUpperThreshold;
- (id)scrollView;
- (id)scrollview;
- (int64_t)_nextRegime;
- (int64_t)_nextRegimeCount;
- (int64_t)previousRegime;
- (int64_t)regime;
- (void)_handleScrubbingTimeout;
- (void)_handleTimeoutTimer:(id)a3;
- (void)_rescheduleTimeout;
- (void)_scheduleScrubbingTimeout;
- (void)_setLastTime:(double)a3;
- (void)_setLastVisibleRect:(CGRect)a3;
- (void)_setNextRegime:(int64_t)a3;
- (void)_setNextRegimeCount:(int64_t)a3;
- (void)_setPreviousRegime:(int64_t)a3;
- (void)_setRegime:(int64_t)a3;
- (void)_setTimeoutTimer:(id)a3;
- (void)_updateScrollRegime;
- (void)didPerformChanges;
- (void)handleScrollEventVisibleRect:(CGRect)a3 didEnd:(BOOL)a4;
- (void)setHasRampedUpForCurrentAnimatedScroll:(BOOL)a3;
- (void)setIsAnimatingScroll:(BOOL)a3;
- (void)setLastScrollDirection:(CGPoint)a3;
- (void)setScrollAcceleration:(CGPoint)a3;
- (void)setScrollVelocity:(CGPoint)a3;
@end

@implementation PXScrollSpeedometer

- (void)setScrollVelocity:(CGPoint)a3
{
  if (a3.x != self->_scrollVelocity.x || a3.y != self->_scrollVelocity.y)
  {
    self->_scrollVelocity = a3;
    [(PXObservable *)self signalChange:1];
  }
}

- (int64_t)regime
{
  return self->_regime;
}

- (CGPoint)lastScrollDirection
{
  double x = self->_lastScrollDirection.x;
  double y = self->_lastScrollDirection.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PXScrollSpeedometer)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXScrollSpeedometer;
  return [(PXObservable *)&v3 init];
}

uint64_t __59__PXScrollSpeedometer_handleScrollEventVisibleRect_didEnd___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setScrollAcceleration:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "setScrollVelocity:", v2, v3);
}

- (void)setScrollAcceleration:(CGPoint)a3
{
  self->_scrollAcceleration = a3;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXScrollSpeedometer;
  [(PXObservable *)&v3 didPerformChanges];
  [(PXScrollSpeedometer *)self _updateScrollRegime];
}

- (void)_updateScrollRegime
{
  [(PXScrollSpeedometer *)self scrollVelocity];
  long double v5 = v4;
  long double v7 = v6;
  [(PXScrollSpeedometer *)self scrollAcceleration];
  double v9 = v8;
  double v11 = v10;
  double v12 = hypot(v5, v7);
  if (v12 == 0.0 && ![(PXScrollSpeedometer *)self isScrubbing])
  {
    int64_t v13 = 0;
  }
  else
  {
    int64_t v13 = [(PXScrollSpeedometer *)self regime];
    BOOL v14 = [(PXScrollSpeedometer *)self isAnimatingScroll];
    double v15 = 0.0;
    double v16 = 0.0;
    switch(v13)
    {
      case -1:
        v18 = [MEMORY[0x263F08690] currentHandler];
        [v18 handleFailureInMethod:a2 object:self file:@"PXScrollSpeedometer.m" lineNumber:89 description:@"undefined regime"];

        break;
      case 0:
      case 1:
        [(PXScrollSpeedometer *)self mediumUpperThreshold];
        goto LABEL_8;
      case 2:
        [(PXScrollSpeedometer *)self mediumLowerThreshold];
LABEL_8:
        double v16 = v17;
        [(PXScrollSpeedometer *)self fastUpperThreshold];
        goto LABEL_10;
      case 3:
        [(PXScrollSpeedometer *)self mediumLowerThreshold];
        double v16 = v20;
        [(PXScrollSpeedometer *)self fastLowerThreshold];
LABEL_10:
        double v15 = v19;
        break;
      default:
        break;
    }
    double v21 = -1.0;
    if (v5 >= 0.0) {
      double v22 = 0.0;
    }
    else {
      double v22 = -1.0;
    }
    if (v5 > 0.0) {
      double v22 = 1.0;
    }
    if (v9 >= 0.0) {
      double v23 = 0.0;
    }
    else {
      double v23 = -1.0;
    }
    if (v9 > 0.0) {
      double v23 = 1.0;
    }
    BOOL v24 = v22 == v23;
    if (v9 == 0.0) {
      BOOL v24 = 0;
    }
    if (v7 >= 0.0) {
      double v25 = 0.0;
    }
    else {
      double v25 = -1.0;
    }
    if (v7 > 0.0) {
      double v25 = 1.0;
    }
    if (v11 >= 0.0) {
      double v21 = 0.0;
    }
    if (v11 > 0.0) {
      double v21 = 1.0;
    }
    BOOL v26 = v25 == v21;
    if (v11 == 0.0) {
      BOOL v26 = 0;
    }
    int v27 = v24 || v26;
    if (v14
      && (v24 || v26)
      && ![(PXScrollSpeedometer *)self hasRampedUpForCurrentAnimatedScroll])
    {
      [(PXScrollSpeedometer *)self setHasRampedUpForCurrentAnimatedScroll:1];
      double v15 = 0.0;
    }
    uint64_t v28 = 2;
    if (v12 <= v16) {
      uint64_t v28 = 1;
    }
    if (v12 <= v15) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = 3;
    }
    if (v13)
    {
      if (v29 == [(PXScrollSpeedometer *)self _nextRegime])
      {
        uint64_t v30 = [(PXScrollSpeedometer *)self _nextRegimeCount];
        uint64_t v31 = v30 + 1;
        if (v30 >= 2) {
          int64_t v13 = v29;
        }
      }
      else
      {
        uint64_t v31 = 0;
      }
    }
    else
    {
      uint64_t v31 = 0;
      int64_t v13 = v29;
    }
    BOOL v32 = v12 > v15 && v14;
    if ((v32 & v27) != 0) {
      int64_t v13 = 3;
    }
    [(PXScrollSpeedometer *)self _setNextRegime:v29];
    [(PXScrollSpeedometer *)self _setNextRegimeCount:v31];
    -[PXScrollSpeedometer setLastScrollDirection:](self, "setLastScrollDirection:", (double)(v5 / v12), (double)(v7 / v12), 0.0);
  }
  v33 = [(PXScrollSpeedometer *)self scrollView];
  [(PXScrollSpeedometer *)self _lastVisibleRect];
  kdebug_trace();
  kdebug_trace();

  [(PXScrollSpeedometer *)self _setRegime:v13];
}

- (void)handleScrollEventVisibleRect:(CGRect)a3 didEnd:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(PXScrollSpeedometer *)self isManuallyChanging])
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v11 = v10;
    [(PXScrollSpeedometer *)self _lastTime];
    double v13 = v12;
    [(PXScrollSpeedometer *)self _lastVisibleRect];
    BOOL v16 = width == v15 && height == v14;
    if (!v16
      || (width == *MEMORY[0x263F001B0] ? (BOOL v17 = height == *(double *)(MEMORY[0x263F001B0] + 8)) : (BOOL v17 = 0), v17))
    {
      double v26 = *MEMORY[0x263F00148];
      double v28 = *(double *)(MEMORY[0x263F00148] + 8);
      double v24 = v28;
      double v23 = *MEMORY[0x263F00148];
    }
    else
    {
      double v18 = v11 - v13;
      if (!a4)
      {
        [(PXScrollSpeedometer *)self _lastVisibleRect];
        v36.origin.double x = v29;
        v36.origin.double y = v30;
        v36.size.double width = v31;
        v36.size.double height = v32;
        v35.origin.double x = x;
        v35.origin.double y = y;
        v35.size.double width = width;
        v35.size.double height = height;
        if (CGRectEqualToRect(v35, v36) && v18 < 0.00833333333) {
          return;
        }
      }
      [(PXScrollSpeedometer *)self _lastVisibleRect];
      double v20 = v19;
      double v22 = v21;
      [(PXScrollSpeedometer *)self scrollVelocity];
      double v23 = 1.0 / v18 * (x - v20);
      double v24 = 1.0 / v18 * (y - v22);
      double v26 = 1.0 / v18 * (v23 - v25);
      double v28 = 1.0 / v18 * (v24 - v27);
    }
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __59__PXScrollSpeedometer_handleScrollEventVisibleRect_didEnd___block_invoke;
    v33[3] = &unk_26545A0C0;
    v33[4] = self;
    *(double *)&v33[5] = v26;
    *(double *)&v33[6] = v28;
    *(double *)&v33[7] = v23;
    *(double *)&v33[8] = v24;
    [(PXObservable *)self performChanges:v33];
    [(PXScrollSpeedometer *)self _setLastTime:v11];
    -[PXScrollSpeedometer _setLastVisibleRect:](self, "_setLastVisibleRect:", x, y, width, height);
    [(PXScrollSpeedometer *)self _scheduleScrubbingTimeout];
    [(PXScrollSpeedometer *)self _rescheduleTimeout];
    return;
  }

  -[PXScrollSpeedometer _setLastVisibleRect:](self, "_setLastVisibleRect:", x, y, width, height);
}

- (CGRect)_lastVisibleRect
{
  double x = self->__lastVisibleRect.origin.x;
  double y = self->__lastVisibleRect.origin.y;
  double width = self->__lastVisibleRect.size.width;
  double height = self->__lastVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_lastTime
{
  return self->__lastTime;
}

- (void)_setLastVisibleRect:(CGRect)a3
{
  self->__lastVisibleRect = a3;
}

- (BOOL)isManuallyChanging
{
  return 0;
}

- (CGPoint)scrollVelocity
{
  double x = self->_scrollVelocity.x;
  double y = self->_scrollVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)scrollView
{
  return self->_scrollView;
}

- (CGPoint)scrollAcceleration
{
  double x = self->_scrollAcceleration.x;
  double y = self->_scrollAcceleration.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setRegime:(int64_t)a3
{
  if (self->_regime != a3)
  {
    -[PXScrollSpeedometer _setPreviousRegime:](self, "_setPreviousRegime:");
    self->_regime = a3;
    [(PXObservable *)self signalChange:2];
  }
}

- (void)_setLastTime:(double)a3
{
  self->__lastTime = a3;
}

- (void)_scheduleScrubbingTimeout
{
  v4[1] = *MEMORY[0x263EF8340];
  if ([(PXScrollSpeedometer *)self isScrubbing])
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleScrubbingTimeout object:0];
    v4[0] = *MEMORY[0x263EFF588];
    objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
    [(PXScrollSpeedometer *)self performSelector:sel__handleScrubbingTimeout withObject:0 afterDelay:v3 inModes:0.1];
  }
}

- (BOOL)isScrubbing
{
  return 0;
}

- (void)_rescheduleTimeout
{
  objc_super v3 = [(PXScrollSpeedometer *)self _timeoutTimer];
  if (v3)
  {
    id v7 = v3;
    double v4 = [v3 fireDate];
    [v4 timeIntervalSinceNow];
    if (v5 < 0.5)
    {
      uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:1.5];

      [v7 setFireDate:v6];
      double v4 = (void *)v6;
    }
  }
  else
  {
    id v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__handleTimeoutTimer_ selector:0 userInfo:0 repeats:1.5];
    [(PXScrollSpeedometer *)self _setTimeoutTimer:v7];
  }
}

- (NSTimer)_timeoutTimer
{
  return self->__timeoutTimer;
}

- (void)_setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollView, 0);

  objc_storeStrong((id *)&self->__timeoutTimer, 0);
}

- (void)setHasRampedUpForCurrentAnimatedScroll:(BOOL)a3
{
  self->_hasRampedUpForCurrentAnimatedScroll = a3;
}

- (BOOL)hasRampedUpForCurrentAnimatedScroll
{
  return self->_hasRampedUpForCurrentAnimatedScroll;
}

- (void)setIsAnimatingScroll:(BOOL)a3
{
  self->_isAnimatingScroll = a3;
}

- (BOOL)isAnimatingScroll
{
  return self->_isAnimatingScroll;
}

- (void)_setNextRegimeCount:(int64_t)a3
{
  self->__nextRegimeCount = a3;
}

- (int64_t)_nextRegimeCount
{
  return self->__nextRegimeCount;
}

- (void)_setNextRegime:(int64_t)a3
{
  self->__nextRegime = a3;
}

- (int64_t)_nextRegime
{
  return self->__nextRegime;
}

- (int64_t)previousRegime
{
  return self->_previousRegime;
}

- (void)_handleTimeoutTimer:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__PXScrollSpeedometer__handleTimeoutTimer___block_invoke;
  v3[3] = &unk_26545A730;
  v3[4] = self;
  [(PXObservable *)self performChanges:v3];
}

uint64_t __43__PXScrollSpeedometer__handleTimeoutTimer___block_invoke(uint64_t a1)
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(*(id *)(a1 + 32), "setScrollVelocity:", *MEMORY[0x263F00148], v3);
  objc_msgSend(*(id *)(a1 + 32), "setScrollAcceleration:", v2, v3);
  double v4 = *(void **)(a1 + 32);

  return [v4 _setTimeoutTimer:0];
}

- (void)_handleScrubbingTimeout
{
  if ([(PXScrollSpeedometer *)self isScrubbing] && [(PXScrollSpeedometer *)self regime] == 3)
  {
    [(PXScrollSpeedometer *)self _lastVisibleRect];
    -[PXScrollSpeedometer handleScrollEventVisibleRect:didEnd:](self, "handleScrollEventVisibleRect:didEnd:", 0);
    [(PXScrollSpeedometer *)self _scheduleScrubbingTimeout];
  }
}

- (double)fastUpperThreshold
{
  return 5000.0;
}

- (double)fastLowerThreshold
{
  return 1000.0;
}

- (double)mediumUpperThreshold
{
  return 1000.0;
}

- (double)mediumLowerThreshold
{
  return 200.0;
}

- (void)setLastScrollDirection:(CGPoint)a3
{
  if (a3.x != self->_lastScrollDirection.x || a3.y != self->_lastScrollDirection.y)
  {
    self->_lastScrollDirection = a3;
    [(PXObservable *)self signalChange:8];
  }
}

- (void)_setPreviousRegime:(int64_t)a3
{
  if (self->_previousRegime != a3)
  {
    self->_previousRegime = a3;
    [(PXObservable *)self signalChange:4];
  }
}

- (id)scrollview
{
  return 0;
}

- (NSString)description
{
  double v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PXScrollSpeedometer;
  double v4 = [(PXScrollSpeedometer *)&v10 description];
  [(PXScrollSpeedometer *)self scrollVelocity];
  double v5 = NSStringFromCGPoint(v12);
  int64_t v6 = [(PXScrollSpeedometer *)self regime];
  if ((unint64_t)(v6 + 1) > 4) {
    id v7 = @"???";
  }
  else {
    id v7 = off_26545A0E0[v6 + 1];
  }
  double v8 = [v3 stringWithFormat:@"<%@ scrollVelocity:%@ regime:%@>", v4, v5, v7];

  return (NSString *)v8;
}

@end