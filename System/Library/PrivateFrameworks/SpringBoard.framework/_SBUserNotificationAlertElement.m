@interface _SBUserNotificationAlertElement
- (BOOL)preventsAutomaticDismissal;
- (UIColor)keyColor;
- (id)alertHost;
- (void)setAlertHost:(id)a3;
- (void)setKeyColor:(id)a3;
- (void)setPreventsAutomaticDismissal:(BOOL)a3;
@end

@implementation _SBUserNotificationAlertElement

- (void)setAlertHost:(id)a3
{
  id obj = a3;
  if ([(_SBUserNotificationAlertElement *)self preventsAutomaticDismissal])
  {
    objc_storeWeak((id *)&self->_alertHost, obj);
    v4 = [obj alertAssertion];
    [v4 setAutomaticallyInvalidatable:0 lockingWithKey:@"_SBUserNotificationAlertElement" reason:@"_SBUserNotificationAlertElement.preventsAutomaticDismissal is YES"];
  }
}

- (id)alertHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);
  return WeakRetained;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
}

- (BOOL)preventsAutomaticDismissal
{
  return self->_preventsAutomaticDismissal;
}

- (void)setPreventsAutomaticDismissal:(BOOL)a3
{
  self->_preventsAutomaticDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_destroyWeak((id *)&self->_alertHost);
}

@end