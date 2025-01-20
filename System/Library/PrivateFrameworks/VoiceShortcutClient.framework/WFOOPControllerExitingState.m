@interface WFOOPControllerExitingState
- (BOOL)canTransitionToState:(id)a3;
- (unint64_t)stage;
@end

@implementation WFOOPControllerExitingState

- (BOOL)canTransitionToState:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v4 stage] == 2)
    {
      BOOL v5 = 1;
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)WFOOPControllerExitingState;
      BOOL v5 = [(WFOOPControllerState *)&v8 canTransitionToState:v4];
    }
    v6 = v4;
  }
  else
  {

    v6 = 0;
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)stage
{
  return 9;
}

@end