@interface SBPressCollector
+ (double)currentTimeStamp;
- (SBPressCollector)init;
- (SBPressCollectorDelegate)delegate;
- (double)maxPressDownDuration;
- (double)maxPressUpDuration;
- (void)_end;
- (void)_fireEndTimerWithDelay:(double)a3 isButtonDown:(BOOL)a4;
- (void)_handlePressDownWithTimeStamp:(double)a3;
- (void)_handlePressUpWithTimeStamp:(double)a3;
- (void)_reset;
- (void)_resetTimersIfNecessary;
- (void)dealloc;
- (void)endCurrentSequence;
- (void)registerPressDownWithTimeStamp:(double)a3;
- (void)registerPressUpWithTimeStamp:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxPressDownDuration:(double)a3;
- (void)setMaxPressUpDuration:(double)a3;
@end

@implementation SBPressCollector

- (SBPressCollector)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBPressCollector;
  v2 = [(SBPressCollector *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    __asm { FMOV            V0.2D, #2.0 }
    *(_OWORD *)(v2 + 56) = _Q0;
  }
  return (SBPressCollector *)v2;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_hardEndTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBPressCollector;
  [(SBPressCollector *)&v3 dealloc];
}

+ (double)currentTimeStamp
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  [v2 systemUptime];
  double v4 = v3;

  return v4;
}

- (void)registerPressUpWithTimeStamp:(double)a3
{
  [(SBPressCollector *)self _resetTimersIfNecessary];
  [(SBPressCollector *)self _handlePressUpWithTimeStamp:a3];
}

- (void)registerPressDownWithTimeStamp:(double)a3
{
  [(SBPressCollector *)self _resetTimersIfNecessary];
  [(SBPressCollector *)self _handlePressDownWithTimeStamp:a3];
}

- (void)endCurrentSequence
{
  +[SBPressCollector currentTimeStamp];
  currentTuple = self->_currentTuple;
  if (currentTuple)
  {
    [(SBPressTuple *)currentTuple setDurationUp:v3 - self->_lastHandledUpEvent];
    v5 = self->_currentTuple;
    self->_currentTuple = 0;
  }
  [(SBPressCollector *)self _end];
}

- (void)_handlePressDownWithTimeStamp:(double)a3
{
  double v5 = a3 - self->_lastHandledUpEvent;
  if (self->_currentTuple) {
    goto LABEL_2;
  }
  if (![(NSMutableArray *)self->_currentSequence count]) {
    goto LABEL_8;
  }
  if (self->_currentTuple)
  {
LABEL_2:
    [(SBPressCollector *)self maxPressUpDuration];
    if (v5 <= v6)
    {
      [(SBPressTuple *)self->_currentTuple setDurationUp:v5];
      currentTuple = self->_currentTuple;
      self->_currentTuple = 0;

      goto LABEL_8;
    }
  }
  [(SBPressCollector *)self maxPressUpDuration];
  if (v5 > v8) {
    [(SBPressCollector *)self _end];
  }
LABEL_8:
  self->_lastHandledDownEvent = a3;
  [(SBPressCollector *)self maxPressDownDuration];
  -[SBPressCollector _fireEndTimerWithDelay:isButtonDown:](self, "_fireEndTimerWithDelay:isButtonDown:", 1);
}

- (void)_handlePressUpWithTimeStamp:(double)a3
{
  if (!self->_currentTuple)
  {
    double v5 = a3 - self->_lastHandledDownEvent;
    [(SBPressCollector *)self maxPressDownDuration];
    if (v5 <= v6)
    {
      v7 = [[SBPressTuple alloc] initWithDurationDown:v5 durationUp:0.0];
      currentTuple = self->_currentTuple;
      self->_currentTuple = v7;

      [(NSMutableArray *)self->_currentSequence addObject:self->_currentTuple];
    }
  }
  self->_lastHandledUpEvent = a3;
  [(SBPressCollector *)self maxPressUpDuration];
  -[SBPressCollector _fireEndTimerWithDelay:isButtonDown:](self, "_fireEndTimerWithDelay:isButtonDown:", 0);
}

- (void)_resetTimersIfNecessary
{
  hardEndTimer = self->_hardEndTimer;
  if (hardEndTimer)
  {
    [(BSAbsoluteMachTimer *)hardEndTimer invalidate];
    double v4 = self->_hardEndTimer;
    self->_hardEndTimer = 0;
  }
}

- (void)_fireEndTimerWithDelay:(double)a3 isButtonDown:(BOOL)a4
{
  double v6 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBPressCollector.hardEndTimer"];
  hardEndTimer = self->_hardEndTimer;
  self->_hardEndTimer = v6;

  double v8 = self->_hardEndTimer;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SBPressCollector__fireEndTimerWithDelay_isButtonDown___block_invoke;
  v9[3] = &unk_1E6AF7810;
  v9[4] = self;
  [(BSAbsoluteMachTimer *)v8 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v9 queue:a3 handler:0.0];
}

uint64_t __56__SBPressCollector__fireEndTimerWithDelay_isButtonDown___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _end];
}

- (void)_end
{
  currentTuple = self->_currentTuple;
  if (currentTuple)
  {
    [(SBPressCollector *)self maxPressUpDuration];
    -[SBPressTuple setDurationUp:](currentTuple, "setDurationUp:");
  }
  double v4 = [(SBPressCollector *)self delegate];
  double v5 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_currentSequence];
  [v4 pressCollector:self didCollectSequence:v5];

  [(SBPressCollector *)self _reset];
}

- (void)_reset
{
  currentTuple = self->_currentTuple;
  self->_currentTuple = 0;

  [(NSMutableArray *)self->_currentSequence removeAllObjects];
  [(SBPressCollector *)self _resetTimersIfNecessary];
}

- (SBPressCollectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPressCollectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)maxPressDownDuration
{
  return self->_maxPressDownDuration;
}

- (void)setMaxPressDownDuration:(double)a3
{
  self->_maxPressDownDuration = a3;
}

- (double)maxPressUpDuration
{
  return self->_maxPressUpDuration;
}

- (void)setMaxPressUpDuration:(double)a3
{
  self->_maxPressUpDuration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTuple, 0);
  objc_storeStrong((id *)&self->_currentSequence, 0);
  objc_storeStrong((id *)&self->_hardEndTimer, 0);
}

@end