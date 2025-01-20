@interface ISRateCurveRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetTime;
- (ISAVPlayer)avPlayer;
- (ISRateCurveRequest)initWithTargetTime:(id *)a3 duration:(double)a4 initialRate:(float)a5 avPlayer:(id)a6 progressHandler:(id)a7;
- (double)duration;
- (float)initialRate;
- (id)progressHandler;
- (void)_didReachTargetTime;
- (void)_stepDownRate;
- (void)_stopObservingPlayer;
- (void)cancel;
- (void)dealloc;
- (void)start;
@end

@implementation ISRateCurveRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_destroyWeak((id *)&self->_avPlayer);

  objc_storeStrong(&self->_boundaryObserver, 0);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (ISAVPlayer)avPlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);

  return (ISAVPlayer *)WeakRetained;
}

- (float)initialRate
{
  return self->_initialRate;
}

- (double)duration
{
  return self->_duration;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (void)_stopObservingPlayer
{
  if (self->_boundaryObserver)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);
    [WeakRetained removeTimeObserver:self->_boundaryObserver];

    id boundaryObserver = self->_boundaryObserver;
    self->_id boundaryObserver = 0;
  }
}

- (void)dealloc
{
  [(ISRateCurveRequest *)self _stopObservingPlayer];
  v3.receiver = self;
  v3.super_class = (Class)ISRateCurveRequest;
  [(ISRateCurveRequest *)&v3 dealloc];
}

- (void)cancel
{
  self->_cancelled = 1;
  [(ISRateCurveRequest *)self _stopObservingPlayer];
}

- (void)_didReachTargetTime
{
  if (!self->_cancelled)
  {
    self->_cancelled = 1;
    p_avPlayer = &self->_avPlayer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);
    [WeakRetained _setRate:0.0];

    id v5 = objc_loadWeakRetained((id *)p_avPlayer);
    $95D729B680665BEAEFA1D6FCA8238556 targetTime = self->_targetTime;
    long long v13 = *MEMORY[0x1E4F1FA48];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v11 = v13;
    uint64_t v12 = v14;
    [v5 seekToTime:&targetTime toleranceBefore:&v13 toleranceAfter:&v11];

    v6 = [(ISRateCurveRequest *)self progressHandler];

    if (v6)
    {
      v7 = [(ISRateCurveRequest *)self progressHandler];
      id v8 = objc_loadWeakRetained((id *)p_avPlayer);
      v9 = v8;
      if (v8) {
        [v8 currentTime];
      }
      else {
        memset(v10, 0, sizeof(v10));
      }
      ((void (**)(void, void *, double))v7)[2](v7, v10, 1.0);
    }
  }
}

- (void)_stepDownRate
{
  if (!self->_cancelled)
  {
    memset(&v24, 0, sizeof(v24));
    p_avPlayer = &self->_avPlayer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);
    id v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained currentTime];
    }
    else {
      memset(&v24, 0, sizeof(v24));
    }

    memset(&v23, 0, sizeof(v23));
    CMTime lhs = (CMTime)self->_targetTime;
    CMTime rhs = v24;
    CMTimeSubtract(&v23, &lhs, &rhs);
    memset(&lhs, 0, sizeof(lhs));
    CMTime rhs = (CMTime)self->_targetTime;
    $95D729B680665BEAEFA1D6FCA8238556 startVideoTime = self->_startVideoTime;
    CMTimeSubtract(&lhs, &rhs, (CMTime *)&startVideoTime);
    CMTime rhs = v23;
    double Seconds = CMTimeGetSeconds(&rhs);
    CMTime rhs = lhs;
    double v7 = CMTimeGetSeconds(&rhs);
    id v8 = [(ISRateCurveRequest *)self progressHandler];

    if (v8)
    {
      if (Seconds / v7 <= 1.0) {
        double v9 = Seconds / v7;
      }
      else {
        double v9 = 1.0;
      }
      v10 = [(ISRateCurveRequest *)self progressHandler];
      long long v11 = (void (*)(void *, CMTime *, double))v10[2];
      CMTime rhs = v24;
      v11(v10, &rhs, v9);
    }
    int64_t v12 = self->_stepIndex + 1;
    self->_stepIndex = v12;
    if (v12 == 4)
    {
      id v13 = objc_loadWeakRetained((id *)p_avPlayer);
      uint64_t v14 = v13;
      double v15 = 0.0;
    }
    else
    {
      v16 = +[ISPlayerSettings sharedInstance];
      [v16 vitalityEaseMinRate];
      float v18 = v17;

      float v19 = v18 + (float)((float)(self->_initialRate - v18) * (float)((float)((float)self->_stepIndex * -0.25) + 1.0));
      id v13 = objc_loadWeakRetained((id *)p_avPlayer);
      uint64_t v14 = v13;
      *(float *)&double v15 = v19;
    }
    [v13 _setRate:v15];
  }
}

- (void)start
{
  if (!self->_cancelled)
  {
    objc_super v3 = [(ISRateCurveRequest *)self avPlayer];
    v4 = v3;
    if (v3)
    {
      memset(&v21, 0, sizeof(v21));
      [v3 currentTime];
      CMTime lhs = (CMTime)self->_targetTime;
      memset(&v20, 0, sizeof(v20));
      CMTime rhs = v21;
      CMTimeSubtract(&v20, &lhs, &rhs);
      self->_stepIndex = 0;
      id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
      uint64_t v6 = -4;
      do
      {
        memset(&lhs, 0, sizeof(lhs));
        CMTime rhs = v20;
        CMTimeMultiplyByRatio(&lhs, &rhs, v6 + 5, 4);
        memset(&rhs, 0, sizeof(rhs));
        CMTime v17 = v21;
        CMTime v16 = lhs;
        CMTimeAdd(&rhs, &v17, &v16);
        CMTime v17 = rhs;
        double v7 = [MEMORY[0x1E4F29238] valueWithCMTime:&v17];
        [v5 addObject:v7];
      }
      while (!__CFADD__(v6++, 1));
      *(float *)&double v8 = self->_initialRate;
      [v4 _setRate:v8];
      objc_initWeak((id *)&lhs, self);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);
      long long v11 = [WeakRetained dispatchQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __27__ISRateCurveRequest_start__block_invoke;
      v14[3] = &unk_1E6BECB10;
      objc_copyWeak(&v15, (id *)&lhs);
      int64_t v12 = [v4 addBoundaryTimeObserverForTimes:v5 queue:v11 usingBlock:v14];
      id boundaryObserver = self->_boundaryObserver;
      self->_id boundaryObserver = v12;

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)&lhs);
    }
  }
}

void __27__ISRateCurveRequest_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stepDownRate];
}

- (ISRateCurveRequest)initWithTargetTime:(id *)a3 duration:(double)a4 initialRate:(float)a5 avPlayer:(id)a6 progressHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ISRateCurveRequest;
  uint64_t v14 = [(ISRateCurveRequest *)&v20 init];
  id v15 = (ISRateCurveRequest *)v14;
  if (v14)
  {
    long long v16 = *(_OWORD *)&a3->var0;
    *((void *)v14 + 15) = a3->var3;
    *(_OWORD *)(v14 + 104) = v16;
    *((double *)v14 + 10) = a4;
    *((float *)v14 + 18) = a5;
    objc_storeWeak((id *)v14 + 11, v12);
    uint64_t v17 = [v13 copy];
    id progressHandler = v15->_progressHandler;
    v15->_id progressHandler = (id)v17;
  }
  return v15;
}

@end