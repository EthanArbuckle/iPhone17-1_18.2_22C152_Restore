@interface WFRunnerState
- (BOOL)canTransitionToState:(id)a3;
- (NSString)description;
- (unint64_t)stage;
- (void)setStage:(unint64_t)a3;
@end

@implementation WFRunnerState

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (BOOL)canTransitionToState:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v5 = [v4 stage];
    BOOL v6 = v5 > [(WFRunnerState *)self stage];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  unint64_t v4 = [(WFRunnerState *)self stage];
  if (v4 > 5) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E6553DF8[v4];
  }
  v9.receiver = self;
  v9.super_class = (Class)WFRunnerState;
  BOOL v6 = [(WFRunnerState *)&v9 description];
  v7 = [v3 stringWithFormat:@"%@ (%@)", v5, v6];

  return (NSString *)v7;
}

@end