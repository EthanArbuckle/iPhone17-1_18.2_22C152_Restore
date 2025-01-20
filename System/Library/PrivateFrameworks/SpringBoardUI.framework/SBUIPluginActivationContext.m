@interface SBUIPluginActivationContext
- (UIScreen)screen;
- (int)activationEvent;
- (void)setActivationEvent:(int)a3;
- (void)setScreen:(id)a3;
@end

@implementation SBUIPluginActivationContext

- (int)activationEvent
{
  return self->_activationEvent;
}

- (void)setActivationEvent:(int)a3
{
  self->_activationEvent = a3;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
}

- (void).cxx_destruct
{
}

@end