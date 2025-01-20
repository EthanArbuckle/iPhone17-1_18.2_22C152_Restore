@interface SBZionUnlockTrigger
- (BOOL)_isRestToOpenAvailable;
- (BOOL)bioUnlock;
- (SBZionUnlockTrigger)initWithUnlockBehaviorConfigurationDelegate:(id)a3;
- (id)description;
- (id)succinctDescriptionBuilder;
- (void)_cancelMinTouchIDTimer;
- (void)_cancelRestToOpenTimer;
- (void)_evaluateRestToOpenTimer;
- (void)_startRestToOpenTimer;
- (void)_startRestToOpenTimerWithDuration:(double)a3;
- (void)dealloc;
- (void)fingerOff;
- (void)fingerOn;
- (void)lockButtonDown;
- (void)screenOff;
- (void)screenOn;
@end

@implementation SBZionUnlockTrigger

- (SBZionUnlockTrigger)initWithUnlockBehaviorConfigurationDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBZionUnlockTrigger;
  v5 = [(SBZionUnlockTrigger *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_behaviorConfigurationDelegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_restToOpenTimer invalidate];
  [(BSAbsoluteMachTimer *)self->_minTouchIDTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBZionUnlockTrigger;
  [(SBZionUnlockTrigger *)&v3 dealloc];
}

- (id)description
{
  return [(SBMesaUnlockTrigger *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescriptionBuilder
{
  v9.receiver = self;
  v9.super_class = (Class)SBZionUnlockTrigger;
  objc_super v3 = [(SBMesaUnlockTrigger *)&v9 succinctDescriptionBuilder];
  id v4 = (id)[v3 appendBool:self->_fingerOn withName:@"fingerOn"];
  id v5 = (id)[v3 appendBool:self->_fingerOffSinceWake withName:@"fingerOffSinceWake"];
  id v6 = (id)[v3 appendBool:self->_restToOpenTimer != 0 withName:@"restToOpenTimer"];
  id v7 = (id)[v3 appendBool:self->_minTouchIDTimer != 0 withName:@"minTouchIDTimer"];
  return v3;
}

- (BOOL)bioUnlock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
  if ([(SBZionUnlockTrigger *)self _isRestToOpenAvailable])
  {
    if (self->_fingerOn)
    {
      if ([WeakRetained lockScreenWakeSource] == 1 && !self->_fingerOffSinceWake)
      {
        [(SBZionUnlockTrigger *)self _cancelMinTouchIDTimer];
        objc_initWeak(&location, self);
        id v7 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBZionUnlockTrigger.minTouchIDTimer"];
        minTouchIDTimer = self->_minTouchIDTimer;
        self->_minTouchIDTimer = v7;

        objc_super v9 = self->_minTouchIDTimer;
        uint64_t v10 = MEMORY[0x1E4F14428];
        id v11 = MEMORY[0x1E4F14428];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __32__SBZionUnlockTrigger_bioUnlock__block_invoke;
        v17[3] = &unk_1E6B02898;
        objc_copyWeak(&v18, &location);
        v17[4] = self;
        [(BSAbsoluteMachTimer *)v9 scheduleWithFireInterval:v10 leewayInterval:v17 queue:0.1 handler:0.0];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __32__SBZionUnlockTrigger_bioUnlock__block_invoke_2;
      v15 = &unk_1E6AF5350;
      v16 = self;
      id v4 = &v12;
      id v5 = WeakRetained;
    }
    else
    {
      id v5 = WeakRetained;
      id v4 = 0;
    }
    objc_msgSend(v5, "startRestToOpenCoachingWithCompletion:", v4, v12, v13, v14, v15, v16);
  }
LABEL_8:

  return 0;
}

void __32__SBZionUnlockTrigger_bioUnlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startRestToOpenTimerWithDuration:dbl_1D8FD2430[*(unsigned char *)(*(void *)(a1 + 32) + 32) == 0]];
    [v3 _cancelMinTouchIDTimer];
    id WeakRetained = v3;
  }
}

uint64_t __32__SBZionUnlockTrigger_bioUnlock__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRestToOpenTimer];
}

- (void)fingerOn
{
  self->_fingerOn = 1;
  id v3 = +[SBCoverSheetPresentationManager sharedInstance];
  char v4 = [v3 hasBeenDismissedSinceKeybagLockAndAuthenticated];

  if ([(SBMesaUnlockTrigger *)self authenticated] && (v4 & 1) == 0)
  {
    if ([(SBZionUnlockTrigger *)self _isRestToOpenAvailable])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __31__SBZionUnlockTrigger_fingerOn__block_invoke;
      v6[3] = &unk_1E6AF5350;
      v6[4] = self;
      [WeakRetained startRestToOpenCoachingWithCompletion:v6];
    }
  }
}

uint64_t __31__SBZionUnlockTrigger_fingerOn__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRestToOpenTimer];
}

- (void)fingerOff
{
  self->_fingerOn = 0;
  self->_fingerOffSinceWake = 1;
  if (self->_restToOpenTimer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
    [WeakRetained resetRestToOpen];
  }
  [(SBZionUnlockTrigger *)self _cancelRestToOpenTimer];
}

- (void)screenOn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
  self->_hasVisibleContentToReveal = [WeakRetained hasVisibleContentToReveal];
}

- (void)screenOff
{
  self->_hasVisibleContentToReveal = 0;
  self->_fingerOffSinceWake = 0;
  [(SBZionUnlockTrigger *)self _cancelRestToOpenTimer];
}

- (void)lockButtonDown
{
  if (self->_restToOpenTimer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
    [WeakRetained resetRestToOpen];
  }
  [(SBZionUnlockTrigger *)self _cancelRestToOpenTimer];
}

- (void)_startRestToOpenTimer
{
  if (self->_fingerOn) {
    [(SBZionUnlockTrigger *)self _startRestToOpenTimerWithDuration:0.375];
  }
}

- (void)_startRestToOpenTimerWithDuration:(double)a3
{
  if (self->_fingerOn)
  {
    [(SBZionUnlockTrigger *)self _cancelRestToOpenTimer];
    objc_initWeak(&location, self);
    id v5 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBZionUnlockTrigger.restToOpenTimer"];
    restToOpenTimer = self->_restToOpenTimer;
    self->_restToOpenTimer = v5;

    id v7 = self->_restToOpenTimer;
    uint64_t v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __57__SBZionUnlockTrigger__startRestToOpenTimerWithDuration___block_invoke;
    v14 = &unk_1E6AF5838;
    objc_copyWeak(&v15, &location);
    [(BSAbsoluteMachTimer *)v7 scheduleWithFireInterval:v8 leewayInterval:&v11 queue:a3 handler:0.0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
    objc_msgSend(WeakRetained, "fillRestToOpenWithDuration:", a3, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __57__SBZionUnlockTrigger__startRestToOpenTimerWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateRestToOpenTimer];
}

- (void)_evaluateRestToOpenTimer
{
  if (self->_restToOpenTimer
    && self->_fingerOn
    && [(SBZionUnlockTrigger *)self _isRestToOpenAvailable])
  {
    id v3 = [(SBMesaUnlockTrigger *)self delegate];
    [v3 mesaUnlockTriggerFired:self];
  }
  [(SBZionUnlockTrigger *)self _cancelRestToOpenTimer];
}

- (void)_cancelRestToOpenTimer
{
  restToOpenTimer = self->_restToOpenTimer;
  if (restToOpenTimer)
  {
    [(BSAbsoluteMachTimer *)restToOpenTimer invalidate];
    char v4 = self->_restToOpenTimer;
    self->_restToOpenTimer = 0;
  }
}

- (void)_cancelMinTouchIDTimer
{
  minTouchIDTimer = self->_minTouchIDTimer;
  if (minTouchIDTimer)
  {
    [(BSAbsoluteMachTimer *)minTouchIDTimer invalidate];
    char v4 = self->_minTouchIDTimer;
    self->_minTouchIDTimer = 0;
  }
}

- (BOOL)_isRestToOpenAvailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
  char v3 = [WeakRetained isRestToOpenAvailable];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minTouchIDTimer, 0);
  objc_storeStrong((id *)&self->_restToOpenTimer, 0);
  objc_destroyWeak((id *)&self->_behaviorConfigurationDelegate);
}

@end