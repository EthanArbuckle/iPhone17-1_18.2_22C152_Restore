@interface WFOOPControllerState
- (BOOL)canTransitionToState:(id)a3;
- (NSString)description;
- (unint64_t)stage;
- (void)setStage:(unint64_t)a3;
@end

@implementation WFOOPControllerState

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (NSString)description
{
  v3 = NSString;
  unint64_t v4 = [(WFOOPControllerState *)self stage];
  if (v4 > 9) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E6076F88[v4];
  }
  v9.receiver = self;
  v9.super_class = (Class)WFOOPControllerState;
  v6 = [(WFOOPControllerState *)&v9 description];
  v7 = [v3 stringWithFormat:@"%@ (%@)", v5, v6];

  return (NSString *)v7;
}

- (BOOL)canTransitionToState:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v5 = [v4 stage];
    BOOL v6 = v5 > [(WFOOPControllerState *)self stage];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end