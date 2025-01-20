@interface TVPProgressiveJumpingScrubber
- (NSTimer)skipTimer;
- (TVPPlayer)player;
- (double)_nextTimeToAdvanceFromTime:(double)a3;
- (double)nextSkipAdjustTime;
- (double)rate;
- (double)skipAdjustPeriod;
- (double)skipAdjustTime;
- (unint64_t)skipCount;
- (void)_skipTimerFired:(id)a3;
- (void)cancelScrub;
- (void)setNextSkipAdjustTime:(double)a3;
- (void)setPlayer:(id)a3;
- (void)setRate:(double)a3;
- (void)setSkipAdjustPeriod:(double)a3;
- (void)setSkipAdjustTime:(double)a3;
- (void)setSkipCount:(unint64_t)a3;
- (void)setSkipTimer:(id)a3;
- (void)startScrubWithRate:(double)a3;
@end

@implementation TVPProgressiveJumpingScrubber

- (void)startScrubWithRate:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);

  if (WeakRetained)
  {
    self->_skipCount = 0;
    self->_skipAdjustPeriod = 0.5;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v7 = -5.0;
    if (a3 > 0.0) {
      double v7 = 5.0;
    }
    self->_skipAdjustTime = v7;
    self->_nextSkipAdjustTime = v6;
    self->_rate = a3;
    self->_skipTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__skipTimerFired_ selector:0 userInfo:1 repeats:0.5];
    MEMORY[0x270F9A758]();
  }
}

- (void)cancelScrub
{
  [(NSTimer *)self->_skipTimer invalidate];
  skipTimer = self->_skipTimer;
  self->_skipTimer = 0;
}

- (double)_nextTimeToAdvanceFromTime:(double)a3
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double nextSkipAdjustTime = self->_nextSkipAdjustTime;
  if (v6 >= nextSkipAdjustTime)
  {
    double skipAdjustPeriod = self->_skipAdjustPeriod;
    double v8 = nextSkipAdjustTime + skipAdjustPeriod;
    unint64_t v9 = self->_skipCount + 1;
    self->_skipCount = v9;
    double v10 = skipAdjustPeriod + -0.0333333333;
    if (v10 < 0.25) {
      double v10 = 0.25;
    }
    self->_double nextSkipAdjustTime = v8;
    self->_double skipAdjustPeriod = v10;
    if (v9 >= 0xB)
    {
      unint64_t v9 = 10;
      self->_skipCount = 10;
    }
    if (self->_skipAdjustTime + self->_skipAdjustTime * (double)(v9 * v9) * 3.0 / 100.0 + a3 >= 0.0) {
      return self->_skipAdjustTime + self->_skipAdjustTime * (double)(v9 * v9) * 3.0 / 100.0 + a3;
    }
    else {
      return -1.0;
    }
  }
  return a3;
}

- (void)_skipTimerFired:(id)a3
{
  p_player = &self->_player;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);

  if (!WeakRetained)
  {
LABEL_12:
    [(TVPProgressiveJumpingScrubber *)self cancelScrub];
    return;
  }
  id v6 = objc_loadWeakRetained((id *)p_player);
  [v6 elapsedTime];
  -[TVPProgressiveJumpingScrubber _nextTimeToAdvanceFromTime:](self, "_nextTimeToAdvanceFromTime:");
  double v8 = v7;

  id v9 = objc_loadWeakRetained((id *)p_player);
  [v9 duration];
  double v11 = v10;

  if (v8 == -1.0 || (v11 != 3.40282347e38 ? (BOOL v12 = v8 < v11) : (BOOL v12 = 1), !v12))
  {
    id v13 = objc_loadWeakRetained((id *)p_player);
    [v13 playerDidHitBeginningOrEnd];

    goto LABEL_12;
  }
  id v14 = objc_loadWeakRetained((id *)p_player);
  [v14 setElapsedTime:v8];
}

- (TVPPlayer)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  return (TVPPlayer *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (double)rate
{
  return self->_rate;
}

- (void)setRate:(double)a3
{
  self->_rate = a3;
}

- (unint64_t)skipCount
{
  return self->_skipCount;
}

- (void)setSkipCount:(unint64_t)a3
{
  self->_skipCount = a3;
}

- (double)skipAdjustTime
{
  return self->_skipAdjustTime;
}

- (void)setSkipAdjustTime:(double)a3
{
  self->_skipAdjustTime = a3;
}

- (double)nextSkipAdjustTime
{
  return self->_nextSkipAdjustTime;
}

- (void)setNextSkipAdjustTime:(double)a3
{
  self->_double nextSkipAdjustTime = a3;
}

- (double)skipAdjustPeriod
{
  return self->_skipAdjustPeriod;
}

- (void)setSkipAdjustPeriod:(double)a3
{
  self->_double skipAdjustPeriod = a3;
}

- (NSTimer)skipTimer
{
  return self->_skipTimer;
}

- (void)setSkipTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipTimer, 0);
  objc_destroyWeak((id *)&self->_player);
}

@end