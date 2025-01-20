@interface SBUIPluginController
- (BOOL)handleActivationEvent:(int)a3 eventSource:(int)a4 context:(void *)a5;
- (BOOL)handledButtonDownEventFromSource:(int)a3;
- (BOOL)handledButtonTapFromSource:(int)a3;
- (BOOL)handledButtonUpEventFromSource:(int)a3;
- (BOOL)handledPasscodeUnlockWithCompletion:(id)a3;
- (BOOL)isVisible;
- (BOOL)supportedAndEnabled;
- (BOOL)wantsActivationEvent:(int)a3 eventSource:(int)a4 interval:(double *)a5;
- (SBUIPluginControllerHost)host;
- (id)viewControllerForActivationContext:(id)a3;
- (void)setHost:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SBUIPluginController

- (void)setVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"SBUIPluginVisibilityDidChangeNotification" object:self userInfo:0];
  }
}

- (BOOL)supportedAndEnabled
{
  return 1;
}

- (BOOL)wantsActivationEvent:(int)a3 eventSource:(int)a4 interval:(double *)a5
{
  return 0;
}

- (BOOL)handleActivationEvent:(int)a3 eventSource:(int)a4 context:(void *)a5
{
  return 0;
}

- (BOOL)handledPasscodeUnlockWithCompletion:(id)a3
{
  return 0;
}

- (BOOL)handledButtonDownEventFromSource:(int)a3
{
  return 0;
}

- (BOOL)handledButtonUpEventFromSource:(int)a3
{
  return 0;
}

- (BOOL)handledButtonTapFromSource:(int)a3
{
  return 0;
}

- (id)viewControllerForActivationContext:(id)a3
{
  return 0;
}

- (SBUIPluginControllerHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (SBUIPluginControllerHost *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void).cxx_destruct
{
}

@end