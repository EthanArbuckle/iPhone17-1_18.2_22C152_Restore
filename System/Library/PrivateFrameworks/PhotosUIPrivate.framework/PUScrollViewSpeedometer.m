@interface PUScrollViewSpeedometer
- (CGPoint)_lastContentOffset;
- (CGPoint)scrollSpeed;
- (CGSize)_lastContentSize;
- (NSTimer)_timeoutTimer;
- (PUScrollViewSpeedometerDelegate)delegate;
- (UIScrollView)_lastScrollView;
- (double)_lastTime;
- (double)fastLowerThreshold;
- (double)fastUpperThreshold;
- (double)mediumLowerThreshold;
- (double)mediumUpperThreshold;
- (int64_t)_newRegimeForScrollSpeed:(CGPoint)a3;
- (int64_t)_nextRegime;
- (int64_t)_nextRegimeCount;
- (int64_t)regime;
- (void)_handleTimeoutTimer:(id)a3;
- (void)_rescheduleTimeout;
- (void)_setLastContentOffset:(CGPoint)a3;
- (void)_setLastContentSize:(CGSize)a3;
- (void)_setLastScrollView:(id)a3;
- (void)_setLastTime:(double)a3;
- (void)_setNextRegime:(int64_t)a3;
- (void)_setNextRegimeCount:(int64_t)a3;
- (void)_setRegime:(int64_t)a3;
- (void)_setScrollSpeed:(CGPoint)a3;
- (void)_setTimeoutTimer:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFastLowerThreshold:(double)a3;
- (void)setFastUpperThreshold:(double)a3;
- (void)setMediumLowerThreshold:(double)a3;
- (void)setMediumUpperThreshold:(double)a3;
@end

@implementation PUScrollViewSpeedometer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timeoutTimer, 0);
  objc_destroyWeak((id *)&self->__lastScrollView);
  objc_destroyWeak((id *)&self->_delegate);
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

- (void)_setTimeoutTimer:(id)a3
{
}

- (NSTimer)_timeoutTimer
{
  return self->__timeoutTimer;
}

- (void)_setLastContentOffset:(CGPoint)a3
{
  self->__lastContentOffset = a3;
}

- (CGPoint)_lastContentOffset
{
  double x = self->__lastContentOffset.x;
  double y = self->__lastContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setLastTime:(double)a3
{
  self->__lastTime = a3;
}

- (double)_lastTime
{
  return self->__lastTime;
}

- (void)_setLastContentSize:(CGSize)a3
{
  self->__lastContentSize = a3;
}

- (CGSize)_lastContentSize
{
  double width = self->__lastContentSize.width;
  double height = self->__lastContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setLastScrollView:(id)a3
{
}

- (UIScrollView)_lastScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__lastScrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setFastLowerThreshold:(double)a3
{
  self->_fastLowerThreshold = a3;
}

- (double)fastLowerThreshold
{
  return self->_fastLowerThreshold;
}

- (void)setFastUpperThreshold:(double)a3
{
  self->_fastUpperThreshold = a3;
}

- (double)fastUpperThreshold
{
  return self->_fastUpperThreshold;
}

- (void)setMediumLowerThreshold:(double)a3
{
  self->_mediumLowerThreshold = a3;
}

- (double)mediumLowerThreshold
{
  return self->_mediumLowerThreshold;
}

- (void)setMediumUpperThreshold:(double)a3
{
  self->_mediumUpperThreshold = a3;
}

- (double)mediumUpperThreshold
{
  return self->_mediumUpperThreshold;
}

- (int64_t)regime
{
  return self->_regime;
}

- (CGPoint)scrollSpeed
{
  double x = self->_scrollSpeed.x;
  double y = self->_scrollSpeed.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PUScrollViewSpeedometerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUScrollViewSpeedometerDelegate *)WeakRetained;
}

- (int64_t)_newRegimeForScrollSpeed:(CGPoint)a3
{
  double v3 = fmax(fabs(a3.x), fabs(a3.y));
  if (v3 == 0.0) {
    return 0;
  }
  int64_t v4 = [(PUScrollViewSpeedometer *)self regime];
  double v7 = 0.0;
  switch(v4)
  {
    case -1:
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PUScrollViewSpeedometer.m" lineNumber:165 description:@"undefined regime"];

      goto LABEL_12;
    case 0:
    case 1:
      [(PUScrollViewSpeedometer *)self mediumUpperThreshold];
      double v9 = v8;
      [(PUScrollViewSpeedometer *)self fastUpperThreshold];
      uint64_t v11 = 2;
      if (v3 <= v9) {
        uint64_t v11 = 1;
      }
      if (v3 <= v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 3;
      }
      if (v4) {
        goto LABEL_20;
      }
      uint64_t v13 = 0;
      int64_t v4 = v12;
      break;
    case 2:
      [(PUScrollViewSpeedometer *)self mediumLowerThreshold];
      double v7 = v16;
      [(PUScrollViewSpeedometer *)self fastUpperThreshold];
      goto LABEL_15;
    case 3:
      [(PUScrollViewSpeedometer *)self mediumLowerThreshold];
      double v7 = v17;
      [(PUScrollViewSpeedometer *)self fastLowerThreshold];
      goto LABEL_15;
    default:
LABEL_12:
      double v15 = 0.0;
LABEL_15:
      uint64_t v18 = 2;
      if (v3 <= v7) {
        uint64_t v18 = 1;
      }
      if (v3 <= v15) {
        uint64_t v12 = v18;
      }
      else {
        uint64_t v12 = 3;
      }
LABEL_20:
      if (v12 == [(PUScrollViewSpeedometer *)self _nextRegime])
      {
        uint64_t v19 = [(PUScrollViewSpeedometer *)self _nextRegimeCount];
        uint64_t v13 = v19 + 1;
        if (v19 >= 2) {
          int64_t v4 = v12;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
      break;
  }
  [(PUScrollViewSpeedometer *)self _setNextRegime:v12];
  [(PUScrollViewSpeedometer *)self _setNextRegimeCount:v13];
  return v4;
}

- (void)_setRegime:(int64_t)a3
{
  int64_t regime = self->_regime;
  if (regime != a3)
  {
    self->_int64_t regime = a3;
    if (self->_delegateSupportsRegimeChange)
    {
      id v6 = [(PUScrollViewSpeedometer *)self delegate];
      [v6 scrollViewSpeedometer:self regimeDidChange:a3 from:regime];
    }
  }
}

- (void)_setScrollSpeed:(CGPoint)a3
{
  if (a3.x != self->_scrollSpeed.x || a3.y != self->_scrollSpeed.y)
  {
    self->_scrollSpeed = a3;
    int64_t v5 = -[PUScrollViewSpeedometer _newRegimeForScrollSpeed:](self, "_newRegimeForScrollSpeed:");
    [(PUScrollViewSpeedometer *)self _setRegime:v5];
  }
}

- (void)_handleTimeoutTimer:(id)a3
{
  -[PUScrollViewSpeedometer _setScrollSpeed:](self, "_setScrollSpeed:", a3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(PUScrollViewSpeedometer *)self _setTimeoutTimer:0];
}

- (void)_rescheduleTimeout
{
  double v3 = [(PUScrollViewSpeedometer *)self _timeoutTimer];
  if (v3)
  {
    id v7 = v3;
    int64_t v4 = [v3 fireDate];
    [v4 timeIntervalSinceNow];
    if (v5 < 0.5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.5];

      [v7 setFireDate:v6];
      int64_t v4 = (void *)v6;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__handleTimeoutTimer_ selector:0 userInfo:0 repeats:1.5];
    [(PUScrollViewSpeedometer *)self _setTimeoutTimer:v7];
  }
}

- (void)scrollViewDidScrollToTop:(id)a3
{
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    -[PUScrollViewSpeedometer _setScrollSpeed:](self, "_setScrollSpeed:", a3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v28 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  [v28 contentOffset];
  double v7 = v6;
  double v9 = v8;
  [v28 contentSize];
  double v11 = v10;
  double v13 = v12;
  id v14 = [(PUScrollViewSpeedometer *)self _lastScrollView];
  if (v14 != v28
    || (([(PUScrollViewSpeedometer *)self _lastContentSize], v11 == v16)
      ? (BOOL v17 = v13 == v15)
      : (BOOL v17 = 0),
        !v17))
  {

LABEL_7:
    double v18 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(PUScrollViewSpeedometer *)self _setLastScrollView:v28];
    -[PUScrollViewSpeedometer _setLastContentSize:](self, "_setLastContentSize:", v11, v13);
    goto LABEL_8;
  }
  double v20 = *MEMORY[0x1E4F1DB30];
  double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v11 == v20 && v13 == v21) {
    goto LABEL_7;
  }
  [(PUScrollViewSpeedometer *)self _lastTime];
  double v24 = v23;
  [(PUScrollViewSpeedometer *)self _lastContentOffset];
  double v25 = 1.0 / (v5 - v24);
  double v18 = v25 * (v7 - v26);
  double v19 = v25 * (v9 - v27);
LABEL_8:
  -[PUScrollViewSpeedometer _setScrollSpeed:](self, "_setScrollSpeed:", v18, v19);
  [(PUScrollViewSpeedometer *)self _setLastTime:v5];
  -[PUScrollViewSpeedometer _setLastContentOffset:](self, "_setLastContentOffset:", v7, v9);
  [(PUScrollViewSpeedometer *)self _rescheduleTimeout];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateSupportsRegimeChange = objc_opt_respondsToSelector() & 1;
  }
}

@end