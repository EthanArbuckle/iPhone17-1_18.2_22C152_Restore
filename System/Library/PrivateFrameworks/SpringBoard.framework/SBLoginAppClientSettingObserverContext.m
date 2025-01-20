@interface SBLoginAppClientSettingObserverContext
- (SBSUILoginUISceneClientSettings)updatedClientSettings;
- (UIApplicationSceneSettings)settings;
- (void)setSettings:(id)a3;
- (void)setUpdatedClientSettings:(id)a3;
@end

@implementation SBLoginAppClientSettingObserverContext

- (UIApplicationSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (SBSUILoginUISceneClientSettings)updatedClientSettings
{
  return self->_updatedClientSettings;
}

- (void)setUpdatedClientSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedClientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end