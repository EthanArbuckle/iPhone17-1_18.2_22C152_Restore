@interface SBClientSettingObserverContext
@end

@implementation SBClientSettingObserverContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_oldClientSettings, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end