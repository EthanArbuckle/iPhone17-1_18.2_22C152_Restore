@interface UIKeyboardTypingStyleEstimator
- (UIKeyboardTypingStyleEstimatorDelegate)delegate;
- (unint64_t)currentTypingStyleEstimation;
- (void)_setTypingStyleEstimation:(unint64_t)a3;
- (void)beganContinuousPath;
- (void)cancelContinuousPath;
- (void)endedContinuousPath;
- (void)setDelegate:(id)a3;
- (void)tapTypedKey;
@end

@implementation UIKeyboardTypingStyleEstimator

- (void)_setTypingStyleEstimation:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_currentTypingStyle != a3)
  {
    self->_currentTypingStyle = a3;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("TypingStyleDebug", &_setTypingStyleEstimation____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        if (a3 - 1 > 2) {
          v10 = @"(None)";
        }
        else {
          v10 = off_1E52FEDE8[a3 - 1];
        }
        int v12 = 138412290;
        v13 = v10;
        v11 = v9;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "TypingStyle: guessing %@", (uint8_t *)&v12, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 typingStyleEstimator:self didChangeTypingStyleEstimate:a3];
    }
  }
}

- (void)beganContinuousPath
{
  [(NSTimer *)self->_tapTypingFlipTimer invalidate];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastContinuousPathEvent < 1.0) {
    [(UIKeyboardTypingStyleEstimator *)self _setTypingStyleEstimation:3];
  }
  self->_lastContinuousPathEvent = Current;
}

- (void)endedContinuousPath
{
  [(UIKeyboardTypingStyleEstimator *)self _setTypingStyleEstimation:3];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E4F1CB00];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__UIKeyboardTypingStyleEstimator_endedContinuousPath__block_invoke;
  v6[3] = &unk_1E52FEDC8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:1.0];
  tapTypingFlipTimer = self->_tapTypingFlipTimer;
  self->_tapTypingFlipTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __53__UIKeyboardTypingStyleEstimator_endedContinuousPath__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained currentTypingStyleEstimation];

  if (v3 != 1)
  {
    v4 = *(void **)(a1 + 32);
    [v4 _setTypingStyleEstimation:2];
  }
}

- (void)cancelContinuousPath
{
  [(UIKeyboardTypingStyleEstimator *)self _setTypingStyleEstimation:1];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__UIKeyboardTypingStyleEstimator_cancelContinuousPath__block_invoke;
  v5[3] = &unk_1E52EC0A8;
  v5[4] = self;
  uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:1.0];
  tapTypingFlipTimer = self->_tapTypingFlipTimer;
  self->_tapTypingFlipTimer = v3;

  objc_destroyWeak(&location);
}

uint64_t __54__UIKeyboardTypingStyleEstimator_cancelContinuousPath__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTypingStyleEstimation:2];
}

- (void)tapTypedKey
{
}

- (unint64_t)currentTypingStyleEstimation
{
  return self->_currentTypingStyle;
}

- (UIKeyboardTypingStyleEstimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardTypingStyleEstimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapTypingFlipTimer, 0);
}

@end