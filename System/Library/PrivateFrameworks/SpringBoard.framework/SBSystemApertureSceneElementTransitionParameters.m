@interface SBSystemApertureSceneElementTransitionParameters
- (BOOL)shouldSetForeground;
- (BOOL)wantsForeground;
- (BSSettings)otherSystemApertureSceneSettingsToApply;
- (CGSize)sceneSize;
- (UIApplicationSceneTransitionContext)transitionContext;
- (void)setOtherSystemApertureSceneSettingsToApply:(id)a3;
- (void)setSceneSize:(CGSize)a3;
- (void)setShouldSetForeground:(BOOL)a3;
- (void)setTransitionContext:(id)a3;
- (void)setWantsForeground:(BOOL)a3;
@end

@implementation SBSystemApertureSceneElementTransitionParameters

- (BOOL)shouldSetForeground
{
  return self->_shouldSetForeground;
}

- (void)setShouldSetForeground:(BOOL)a3
{
  self->_shouldSetForeground = a3;
}

- (CGSize)sceneSize
{
  double width = self->_sceneSize.width;
  double height = self->_sceneSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSceneSize:(CGSize)a3
{
  self->_sceneSize = a3;
}

- (BOOL)wantsForeground
{
  return self->_wantsForeground;
}

- (void)setWantsForeground:(BOOL)a3
{
  self->_wantsForeground = a3;
}

- (UIApplicationSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (BSSettings)otherSystemApertureSceneSettingsToApply
{
  return self->_otherSystemApertureSceneSettingsToApply;
}

- (void)setOtherSystemApertureSceneSettingsToApply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherSystemApertureSceneSettingsToApply, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end