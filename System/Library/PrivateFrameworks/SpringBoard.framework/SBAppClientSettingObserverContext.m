@interface SBAppClientSettingObserverContext
- (FBSSceneTransitionContext)transition;
- (FBScene)scene;
- (SBApplication)app;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (UIApplicationSceneClientSettings)oldClientSettings;
- (UIApplicationSceneClientSettings)updatedClientSettings;
- (UIApplicationSceneSettings)settings;
- (void)setApp:(id)a3;
- (void)setOldClientSettings:(id)a3;
- (void)setScene:(id)a3;
- (void)setSceneHandle:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTransition:(id)a3;
- (void)setUpdatedClientSettings:(id)a3;
@end

@implementation SBAppClientSettingObserverContext

- (void)setUpdatedClientSettings:(id)a3
{
}

- (void)setTransition:(id)a3
{
}

- (void)setSettings:(id)a3
{
}

- (void)setSceneHandle:(id)a3
{
}

- (void)setScene:(id)a3
{
}

- (void)setOldClientSettings:(id)a3
{
}

- (void)setApp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_updatedClientSettings, 0);
  objc_storeStrong((id *)&self->_oldClientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIApplicationSceneClientSettings)updatedClientSettings
{
  return self->_updatedClientSettings;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBApplication)app
{
  return self->_app;
}

- (UIApplicationSceneSettings)settings
{
  return self->_settings;
}

- (UIApplicationSceneClientSettings)oldClientSettings
{
  return self->_oldClientSettings;
}

- (FBSSceneTransitionContext)transition
{
  return self->_transition;
}

@end