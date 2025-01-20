@interface NPHMagicPickupAutomaton
- (NPHMagicPickupAutomaton)init;
- (NPHStateManager)stateManager;
- (void)setStateManager:(id)a3;
- (void)stateManager:(id)a3 callConfigurationUpdated:(id)a4;
@end

@implementation NPHMagicPickupAutomaton

- (NPHMagicPickupAutomaton)init
{
  v8.receiver = self;
  v8.super_class = (Class)NPHMagicPickupAutomaton;
  v2 = [(NPHMagicPickupAutomaton *)&v8 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"NPHMagicPickupAutomaton"];

    if (v4)
    {
      v5 = [[NPHStateManager alloc] initWithDelegate:v2];
      stateManager = v2->_stateManager;
      v2->_stateManager = v5;
    }
  }
  return v2;
}

- (void)stateManager:(id)a3 callConfigurationUpdated:(id)a4
{
  [a4 incomingCall:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    unsigned int v4 = +[TUCallCenter sharedInstance];
    v5 = [v6 onlyTUCall];
    [v4 answerCall:v5];
  }
}

- (NPHStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end