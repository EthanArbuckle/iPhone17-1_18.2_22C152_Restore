@interface SBPressSequenceRecognizer
- (SBPressSequenceRecognizer)init;
- (SBPressSequenceRecognizer)initWithValidator:(id)a3 numberOfPresses:(unint64_t)a4;
- (SBPressSequenceRecognizerDelegate)delegate;
- (SBPressSequenceValidator)validator;
- (double)_watchdogTimeIntervalFromDelay:(double)a3;
- (unint64_t)numberOfPresses;
- (void)_complete;
- (void)_handlePressDownWithTimestamp:(double)a3;
- (void)_handlePressUpWithTimestamp:(double)a3;
- (void)_reset;
- (void)_resetAfterDelay:(double)a3;
- (void)_resetAndNotify;
- (void)_resetWatchdogIfNecessary;
- (void)dealloc;
- (void)registerPressDownWithTimestamp:(double)a3;
- (void)registerPressUpWithTimestamp:(double)a3;
- (void)resetWithNewValidator:(id)a3 numberOfPresses:(unint64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBPressSequenceRecognizer

- (SBPressSequenceRecognizer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBPressSequenceRecognizer.m" lineNumber:35 description:@"Use initWithValidator:"];

  return [(SBPressSequenceRecognizer *)self initWithValidator:0 numberOfPresses:0];
}

- (SBPressSequenceRecognizer)initWithValidator:(id)a3 numberOfPresses:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBPressSequenceRecognizer.m" lineNumber:40 description:@"SBPressSequenceRecognizer must be given non nil validator"];
  }
  v15.receiver = self;
  v15.super_class = (Class)SBPressSequenceRecognizer;
  v9 = [(SBPressSequenceRecognizer *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_validator, a3);
    v10->_numberOfPresses = a4;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentSequence = v10->_currentSequence;
    v10->_currentSequence = v11;
  }
  return v10;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_watchdogTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBPressSequenceRecognizer;
  [(SBPressSequenceRecognizer *)&v3 dealloc];
}

- (void)registerPressDownWithTimestamp:(double)a3
{
  if (self->_currentPressTuple)
  {
    [(SBPressSequenceRecognizer *)self _handlePressDownWithTimestamp:a3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pressSequenceRecognizer:self didBeginPressDownAtIndex:0];
  }
  self->_lastPressDownEvent = a3;
}

- (void)registerPressUpWithTimestamp:(double)a3
{
  if (!self->_currentPressTuple && (BSFloatIsZero() & 1) == 0) {
    [(SBPressSequenceRecognizer *)self _handlePressUpWithTimestamp:a3];
  }
  self->_lastPressUpEvent = a3;
}

- (void)resetWithNewValidator:(id)a3 numberOfPresses:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_validator, a3);
  self->_numberOfPresses = a4;
  [(SBPressSequenceRecognizer *)self _resetAndNotify];
}

- (void)_handlePressDownWithTimestamp:(double)a3
{
  [(SBPressSequenceRecognizer *)self _resetWatchdogIfNecessary];
  double v5 = a3 - self->_lastPressUpEvent;
  validator = self->_validator;
  v7 = (void *)[(NSMutableArray *)self->_currentSequence copy];
  LODWORD(validator) = [(SBPressSequenceValidator *)validator pressEventIsValidInSequence:v7 endingDownEvent:0 duration:v5];

  if (validator)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pressSequenceRecognizer:didBeginPressDownAtIndex:", self, -[NSMutableArray indexOfObject:](self->_currentSequence, "indexOfObject:", self->_currentPressTuple) + 1);

    [(SBPressTuple *)self->_currentPressTuple setDurationUp:v5];
    currentPressTuple = self->_currentPressTuple;
    self->_currentPressTuple = 0;

    [(SBPressSequenceValidator *)self->_validator timeUntilNextPressEventIsInValidInSequence:self->_currentSequence lastPressEventInSequenceIsDown:0];
  }
  else
  {
    v11 = SBLogButtonsCombo();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SBPressSequenceRecognizer _handlePressDownWithTimestamp:]();
    }

    double v10 = 0.0;
  }
  [(SBPressSequenceRecognizer *)self _resetAfterDelay:v10];
}

- (void)_handlePressUpWithTimestamp:(double)a3
{
  [(SBPressSequenceRecognizer *)self _resetWatchdogIfNecessary];
  double v5 = a3 - self->_lastPressDownEvent;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke;
  v10[3] = &unk_1E6B0A1E0;
  v10[4] = self;
  *(double *)&v10[5] = v5;
  v6 = (uint64_t (**)(void))MEMORY[0x1D948C7A0](v10);
  int v7 = v6[2]();
  uint64_t v8 = [(NSMutableArray *)self->_currentSequence count];
  uint64_t v9 = v8;
  if (!v7)
  {
    [(SBPressSequenceRecognizer *)self _reset];
    if (v9)
    {
      [(SBPressSequenceRecognizer *)self _resetAndNotify];
      goto LABEL_8;
    }
    if ((((uint64_t (*)(uint64_t (**)(void)))v6[2])(v6) & 1) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    [(SBPressSequenceValidator *)self->_validator timeUntilNextPressEventIsInValidInSequence:self->_currentSequence lastPressEventInSequenceIsDown:1];
    -[SBPressSequenceRecognizer _resetAfterDelay:](self, "_resetAfterDelay:");
    goto LABEL_8;
  }
  if (v8 != self->_numberOfPresses) {
    goto LABEL_7;
  }
  [(SBPressSequenceRecognizer *)self _complete];
LABEL_8:
}

uint64_t __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  v4 = *(void **)(v2 + 56);
  double v5 = (void *)[*(id *)(v2 + 40) copy];
  uint64_t v6 = [v4 pressEventIsValidInSequence:v5 endingDownEvent:1 duration:*(double *)(v3 + 8)];

  if (v6)
  {
    int v7 = [[SBPressTuple alloc] initWithDurationDown:*(double *)(a1 + 40) durationUp:0.0];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;

    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(*(void *)(a1 + 32) + 32)];
    double v10 = SBLogButtonsCombo();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke_cold_1(v3, v10);
    }
  }
  else
  {
    double v10 = SBLogButtonsCombo();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke_cold_2();
    }
  }

  return v6;
}

- (void)_complete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pressSequenceRecognizerDidCompleteSequence:self];

  [(SBPressSequenceRecognizer *)self _reset];
}

- (void)_reset
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ - Reset", v4, v5, v6, v7, 2u);
}

- (void)_resetAndNotify
{
  [(SBPressSequenceRecognizer *)self _reset];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pressSequenceRecognizerDidFail:self];
}

- (void)_resetWatchdogIfNecessary
{
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    [(BSAbsoluteMachTimer *)watchdogTimer invalidate];
    uint64_t v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;
  }
}

- (void)_resetAfterDelay:(double)a3
{
  if (BSFloatLessThanOrEqualToFloat())
  {
    [(SBPressSequenceRecognizer *)self _resetAndNotify];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBPressSequenceRecognizer.watchdogTimer"];
    watchdogTimer = self->_watchdogTimer;
    self->_watchdogTimer = v5;

    uint64_t v7 = self->_watchdogTimer;
    [(SBPressSequenceRecognizer *)self _watchdogTimeIntervalFromDelay:a3];
    double v9 = v8;
    uint64_t v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__SBPressSequenceRecognizer__resetAfterDelay___block_invoke;
    v12[3] = &unk_1E6AF5838;
    objc_copyWeak(&v13, &location);
    [(BSAbsoluteMachTimer *)v7 scheduleWithFireInterval:v10 leewayInterval:v12 queue:v9 handler:0.0];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __46__SBPressSequenceRecognizer__resetAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetAndNotify];
}

- (double)_watchdogTimeIntervalFromDelay:(double)a3
{
  return a3 * 10.0;
}

- (SBPressSequenceRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPressSequenceRecognizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBPressSequenceValidator)validator
{
  return self->_validator;
}

- (unint64_t)numberOfPresses
{
  return self->_numberOfPresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSequence, 0);
  objc_storeStrong((id *)&self->_currentPressTuple, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
}

- (void)_handlePressDownWithTimestamp:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ - press down event is not valid.", v4, v5, v6, v7, 2u);
}

void __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = [*(id *)(*(void *)a1 + 40) count];
  int v7 = 138543618;
  double v8 = v5;
  __int16 v9 = 1024;
  int v10 = v6;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ - Added press tuple on press up. Current sequence count: %d.", (uint8_t *)&v7, 0x12u);
}

void __57__SBPressSequenceRecognizer__handlePressUpWithTimestamp___block_invoke_cold_2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ - press up event is not valid.", v4, v5, v6, v7, 2u);
}

@end