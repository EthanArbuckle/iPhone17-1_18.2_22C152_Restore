@interface SBIconLaunchContext
- (NSSet)actions;
- (SBActivationSettings)activationSettings;
- (SBIconView)iconView;
- (void)setActions:(id)a3;
- (void)setActivationSettings:(id)a3;
- (void)setIconView:(id)a3;
@end

@implementation SBIconLaunchContext

- (void)setIconView:(id)a3
{
}

- (void)setActivationSettings:(id)a3
{
}

- (void)setActions:(id)a3
{
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBActivationSettings)activationSettings
{
  return self->_activationSettings;
}

- (NSSet)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_activationSettings, 0);
}

@end