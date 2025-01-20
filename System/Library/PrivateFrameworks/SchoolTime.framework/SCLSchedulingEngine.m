@interface SCLSchedulingEngine
- (BOOL)_evaluateChangeFromParameters:(id)a3 toParameters:(id)a4;
- (NSDate)lastEvaluationDate;
- (NSDate)nextEvaluationDate;
- (SCLSchedulingEngine)initWithParametersBlock:(id)a3 shouldStartManuallyActive:(BOOL)a4;
- (SCLSchedulingEngineDelegate)delegate;
- (SCLSchedulingParameters)schedulingParameters;
- (SCLState)state;
- (void)reevaluateStateAtDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSchedulingParameters:(id)a3;
- (void)updateParametersWithBlock:(id)a3;
@end

@implementation SCLSchedulingEngine

- (SCLSchedulingEngine)initWithParametersBlock:(id)a3 shouldStartManuallyActive:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void (**)(id, SCLSchedulingParameters *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SCLSchedulingEngine;
  v7 = [(SCLSchedulingEngine *)&v12 init];
  if (v7)
  {
    v8 = objc_alloc_init(SCLSchedulingParameters);
    [(SCLSchedulingParameters *)v8 setActivationSetting:0];
    v6[2](v6, v8);
    [(SCLSchedulingEngine *)v7 _evaluateChangeFromParameters:0 toParameters:v8];
    if (v4 && ![(SCLState *)v7->_state activeState])
    {
      v9 = [[SCLState alloc] initWithActiveState:2 scheduleEnabled:[(SCLState *)v7->_state isScheduleEnabled] inSchedule:[(SCLState *)v7->_state isInSchedule]];
      state = v7->_state;
      v7->_state = v9;
    }
  }

  return v7;
}

- (void)updateParametersWithBlock:(id)a3
{
  v11 = (void (**)(id, SCLSchedulingParameters *))a3;
  BOOL v4 = [(SCLSchedulingEngine *)self schedulingParameters];
  v5 = (SCLSchedulingParameters *)[v4 copy];
  if (!v5) {
    v5 = objc_alloc_init(SCLSchedulingParameters);
  }
  v11[2](v11, v5);
  v6 = self->_state;
  BOOL v7 = [(SCLSchedulingEngine *)self _evaluateChangeFromParameters:v4 toParameters:v5];
  v8 = self->_state;
  if (v7)
  {
    v9 = self->_nextEvaluationDate;
    v10 = [(SCLSchedulingEngine *)self delegate];
    [v10 schedulingEngine:self didUpdateState:v8 fromState:v6 nextEvaluationDate:v9];
  }
}

- (BOOL)_evaluateChangeFromParameters:(id)a3 toParameters:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 evaluationDate];
  v8 = [v6 scheduleSettings];
  uint64_t v9 = [v6 calendar];
  p_state = &self->_state;
  v33 = self->_state;
  v11 = [v6 scheduleSettings];
  unsigned int v32 = [v11 isEnabled];

  objc_super v12 = [v6 scheduleSettings];
  v13 = [v6 calendar];
  unsigned int v34 = [v12 isActiveAtDate:v7 calendar:v13];

  v30 = (void *)v9;
  v14 = [v8 dateIntervalForActiveScheduleOnOrAfterDate:v7 calendar:v9];
  if ([v14 containsDate:v7])
  {
    uint64_t v15 = [v14 endDate];
LABEL_5:
    v16 = (NSDate *)v15;
    goto LABEL_7;
  }
  if (v14)
  {
    uint64_t v15 = [v14 startDate];
    goto LABEL_5;
  }
  v16 = 0;
LABEL_7:
  v31 = self->_nextEvaluationDate;
  objc_storeStrong((id *)&self->_nextEvaluationDate, v16);
  objc_storeStrong((id *)&self->_lastEvaluationDate, v7);
  uint64_t v17 = [v6 activationSetting];
  if (v17)
  {
    uint64_t v18 = v17;
    v19 = v8;
    int v20 = v32 ^ [(SCLState *)v33 isScheduleEnabled];
    p_state = &self->_state;
    int v21 = v34 ^ [(SCLState *)v33 isInSchedule] | v20;
    v8 = v19;
    if (v21) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v18;
    }
    [v6 setActivationSetting:v22];
  }
  uint64_t v23 = [v6 activationSetting];
  if (v23 == 1 || !v23 && v34)
  {
    if ([v6 isSuppressed]) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = 2;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  v25 = [[SCLState alloc] initWithActiveState:v24 scheduleEnabled:v32 inSchedule:v34];
  objc_storeStrong((id *)p_state, v25);
  objc_storeStrong((id *)&self->_schedulingParameters, a4);
  if ([(SCLState *)v25 isEqual:v33])
  {
    v26 = v31;
    if (v31 == v16) {
      LOBYTE(v27) = 0;
    }
    else {
      int v27 = [(NSDate *)v31 isEqual:v16] ^ 1;
    }
    v28 = v30;
  }
  else
  {
    LOBYTE(v27) = 1;
    v28 = v30;
    v26 = v31;
  }

  return v27;
}

- (void)reevaluateStateAtDate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SCLSchedulingEngine_reevaluateStateAtDate___block_invoke;
  v6[3] = &unk_2648AC5E0;
  id v7 = v4;
  id v5 = v4;
  [(SCLSchedulingEngine *)self updateParametersWithBlock:v6];
}

uint64_t __45__SCLSchedulingEngine_reevaluateStateAtDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEvaluationDate:*(void *)(a1 + 32)];
}

- (NSDate)lastEvaluationDate
{
  v2 = self->_lastEvaluationDate;
  return v2;
}

- (NSDate)nextEvaluationDate
{
  v2 = self->_nextEvaluationDate;
  return v2;
}

- (SCLSchedulingEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCLSchedulingEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCLState)state
{
  return self->_state;
}

- (SCLSchedulingParameters)schedulingParameters
{
  return self->_schedulingParameters;
}

- (void)setSchedulingParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulingParameters, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextEvaluationDate, 0);
  objc_storeStrong((id *)&self->_lastEvaluationDate, 0);
}

@end