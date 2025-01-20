@interface SBSUIRemoteAlertSceneClientComponent
- (SBSRemoteAlertActivationContext)activationContext;
- (SBSRemoteAlertConfigurationContext)configurationContext;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)setActivationContext:(id)a3;
- (void)setConfigurationContext:(id)a3;
@end

@implementation SBSUIRemoteAlertSceneClientComponent

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v5 = a4;
  v6 = [v5 transitionContext];
  id v9 = [v6 remoteAlertActivationContext];

  v7 = [v5 transitionContext];

  v8 = [v7 remoteAlertConfigurationContext];

  if (v9) {
    [(SBSUIRemoteAlertSceneClientComponent *)self setActivationContext:v9];
  }
  if (v8) {
    [(SBSUIRemoteAlertSceneClientComponent *)self setConfigurationContext:v8];
  }
}

- (SBSRemoteAlertConfigurationContext)configurationContext
{
  return (SBSRemoteAlertConfigurationContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigurationContext:(id)a3
{
}

- (SBSRemoteAlertActivationContext)activationContext
{
  return (SBSRemoteAlertActivationContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActivationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_configurationContext, 0);
}

@end