@interface SBScreenLongevityTimer
- (BOOL)_isValidCurrentTimer:(id)a3;
- (BOOL)isValid;
- (SBScreenLongevityTimer)init;
- (SBScreenLongevityTimerDelegate)delegate;
- (double)dimInterval;
- (double)elapsedTime;
- (double)minimalFaceDetectionInterval;
- (double)waitInterval;
- (void)dealloc;
- (void)dimTimerFired;
- (void)invalidate;
- (void)scheduleFaceDetection;
- (void)setDelegate:(id)a3;
- (void)setDimInterval:(double)a3;
- (void)setMinimalFaceDetectionInterval:(double)a3;
- (void)setWaitInterval:(double)a3;
- (void)start;
- (void)startFaceDetection;
@end

@implementation SBScreenLongevityTimer

- (SBScreenLongevityTimer)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBScreenLongevityTimer;
  v2 = [(SBScreenLongevityTimer *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[SBScreenLongevityDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBScreenLongevitySettings *)v3;

    [(SBScreenLongevitySettings *)v2->_settings dimInterval];
    v2->_dimInterval = v5;
    [(SBScreenLongevitySettings *)v2->_settings waitInterval];
    v2->_waitInterval = v6;
    [(SBScreenLongevitySettings *)v2->_settings minimalFaceDetectionInterval];
    v2->_minimalFaceDetectionInterval = v7;
  }
  return v2;
}

- (void)dealloc
{
  [(SBScreenLongevityTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBScreenLongevityTimer;
  [(SBScreenLongevityTimer *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(NSTimer *)self->_timer isValid])
  {
    objc_super v3 = SBLogScreenLongevityController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      double v6 = self;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Dimming timer invalidate %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [(NSTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (BOOL)isValid
{
  return [(NSTimer *)self->_timer isValid];
}

- (double)elapsedTime
{
  BOOL v3 = [(NSTimer *)self->_timer isValid];
  double result = 0.0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", 0.0);
    return v5 - self->_startTime;
  }
  return result;
}

- (void)start
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Dimming timer start %{public}@", buf, 0xCu);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_startTime = v4;
  if (self->_waitInterval >= self->_dimInterval)
  {
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__SBScreenLongevityTimer_start__block_invoke;
    block[3] = &unk_1E6AFC630;
    block[4] = self;
    double v5 = &v11;
    objc_copyWeak(&v11, (id *)buf);
    double v6 = MEMORY[0x1E4F14428];
    uint64_t v7 = block;
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__SBScreenLongevityTimer_start__block_invoke_3;
    v8[3] = &unk_1E6AFC630;
    v8[4] = self;
    double v5 = &v9;
    objc_copyWeak(&v9, (id *)buf);
    double v6 = MEMORY[0x1E4F14428];
    uint64_t v7 = v8;
  }
  dispatch_async(v6, v7);
  objc_destroyWeak(v5);
  objc_destroyWeak((id *)buf);
}

void __31__SBScreenLongevityTimer_start__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  double v4 = (void *)MEMORY[0x1E4F1CB00];
  double v5 = *(double *)(*(void *)(a1 + 32) + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__SBScreenLongevityTimer_start__block_invoke_2;
  v9[3] = &unk_1E6AF61A0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v6 = [v4 scheduledTimerWithTimeInterval:0 repeats:v9 block:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  objc_destroyWeak(&v10);
}

void __31__SBScreenLongevityTimer_start__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [WeakRetained _isValidCurrentTimer:v3];

  if (v2) {
    [WeakRetained dimTimerFired];
  }
}

void __31__SBScreenLongevityTimer_start__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  double v4 = (void *)MEMORY[0x1E4F1CB00];
  double v5 = *(double *)(*(void *)(a1 + 32) + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__SBScreenLongevityTimer_start__block_invoke_4;
  v9[3] = &unk_1E6AF61A0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v6 = [v4 scheduledTimerWithTimeInterval:0 repeats:v9 block:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  objc_destroyWeak(&v10);
}

void __31__SBScreenLongevityTimer_start__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [WeakRetained _isValidCurrentTimer:v3];

  if (v2) {
    [WeakRetained startFaceDetection];
  }
}

- (void)startFaceDetection
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  self->_currentFaceDetectionTimerInterval = self->_dimInterval
                                           - self->_waitInterval
                                           + self->_minimalFaceDetectionInterval;
  id v3 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    double v5 = self;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Dimming timer start face detection %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [(SBScreenLongevityTimer *)self scheduleFaceDetection];
}

- (void)dimTimerFired
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dimTimerDidExpireForTimer:self];
}

- (void)scheduleFaceDetection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained faceDetectionTimerDidExpire:self];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (v4 - self->_startTime <= self->_dimInterval)
  {
    self->_currentFaceDetectionTimerInterval = self->_currentFaceDetectionTimerInterval * 0.5;
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SBScreenLongevityTimer_scheduleFaceDetection__block_invoke;
    block[3] = &unk_1E6AFC630;
    block[4] = self;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SBScreenLongevityTimer *)self dimTimerFired];
  }
}

void __47__SBScreenLongevityTimer_scheduleFaceDetection__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  double v4 = (void *)MEMORY[0x1E4F1CB00];
  double v5 = *(double *)(*(void *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SBScreenLongevityTimer_scheduleFaceDetection__block_invoke_2;
  v9[3] = &unk_1E6AF61A0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v6 = [v4 scheduledTimerWithTimeInterval:0 repeats:v9 block:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  objc_destroyWeak(&v10);
}

void __47__SBScreenLongevityTimer_scheduleFaceDetection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [WeakRetained _isValidCurrentTimer:v3];

  if (v2) {
    [WeakRetained scheduleFaceDetection];
  }
}

- (BOOL)_isValidCurrentTimer:(id)a3
{
  if (self->_timer == a3) {
    return [a3 isValid];
  }
  else {
    return 0;
  }
}

- (SBScreenLongevityTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBScreenLongevityTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)waitInterval
{
  return self->_waitInterval;
}

- (void)setWaitInterval:(double)a3
{
  self->_waitInterval = a3;
}

- (double)dimInterval
{
  return self->_dimInterval;
}

- (void)setDimInterval:(double)a3
{
  self->_dimInterval = a3;
}

- (double)minimalFaceDetectionInterval
{
  return self->_minimalFaceDetectionInterval;
}

- (void)setMinimalFaceDetectionInterval:(double)a3
{
  self->_minimalFaceDetectionInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end