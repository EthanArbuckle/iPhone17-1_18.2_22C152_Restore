@interface WFRunnerRunningState
- (BOOL)isPersonalAutomation;
- (BOOL)shouldStartTimer;
- (WFRunnerRunningState)initWithEnvironment:(int64_t)a3 isPersonalAutomation:(BOOL)a4;
- (double)timeoutDuration;
- (id)timeoutHandler;
- (int64_t)environment;
- (unint64_t)stage;
- (void)cancel;
- (void)setTimeoutHandler:(id)a3;
@end

@implementation WFRunnerRunningState

- (void).cxx_destruct
{
}

- (void)setTimeoutHandler:(id)a3
{
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (BOOL)isPersonalAutomation
{
  return self->_isPersonalAutomation;
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)cancel
{
  v2 = [(WFRunnerRunningState *)self timeoutHandler];
  v2[2]();
}

- (double)timeoutDuration
{
  int64_t v2 = [(WFRunnerRunningState *)self environment];
  v3 = (double *)MEMORY[0x1E4FB4DA0];
  if (v2 != 1) {
    v3 = (double *)MEMORY[0x1E4FB4D98];
  }
  return *v3;
}

- (BOOL)shouldStartTimer
{
  int64_t v3 = [(WFRunnerRunningState *)self environment];
  int64_t v4 = [(WFRunnerRunningState *)self environment];
  if (v3 == 1 || v4 == 3) {
    return 1;
  }
  return [(WFRunnerRunningState *)self isPersonalAutomation];
}

- (unint64_t)stage
{
  return 2;
}

- (WFRunnerRunningState)initWithEnvironment:(int64_t)a3 isPersonalAutomation:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFRunnerRunningState;
  v5 = [(WFRunnerRunningState *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_isPersonalAutomation = a4;
    v7 = v5;
  }

  return v6;
}

@end