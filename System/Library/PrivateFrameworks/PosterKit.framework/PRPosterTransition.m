@interface PRPosterTransition
- (BOOL)contentSignificantlyChanged;
- (BOOL)fromWakeTimer;
- (BSAnimationSettings)animationSettings;
- (FBSSceneSettingsDiff)settingsDiff;
- (NSArray)actions;
- (unint64_t)significantEvent;
- (void)setActions:(id)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setContentSignificantlyChanged:(BOOL)a3;
- (void)setSettingsDiff:(id)a3;
- (void)setSignificantEvent:(unint64_t)a3;
@end

@implementation PRPosterTransition

- (BOOL)fromWakeTimer
{
  return self->_significantEvent == 1;
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (FBSSceneSettingsDiff)settingsDiff
{
  return self->_settingsDiff;
}

- (void)setSettingsDiff:(id)a3
{
  self->_settingsDiff = (FBSSceneSettingsDiff *)a3;
}

- (unint64_t)significantEvent
{
  return self->_significantEvent;
}

- (void)setSignificantEvent:(unint64_t)a3
{
  self->_significantEvent = a3;
}

- (BOOL)contentSignificantlyChanged
{
  return self->_contentSignificantlyChanged;
}

- (void)setContentSignificantlyChanged:(BOOL)a3
{
  self->_contentSignificantlyChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end