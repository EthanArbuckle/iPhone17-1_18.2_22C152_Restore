@interface SBHomeScreenZoomSwitcherModifier
- (BOOL)_isEffectivelyHome;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isWallpaperRequiredForSwitcher;
- (SBHomeScreenZoomSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)wallpaperScale;
- (id)animationAttributesForLayoutElement:(id)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBHomeScreenZoomSwitcherModifier

- (SBHomeScreenZoomSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
  result = [(SBTransitionSwitcherModifier *)&v6 initWithTransitionID:a3];
  if (result) {
    result->_direction = a4;
  }
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  uint64_t v6 = objc_msgSend(v4, "switcherLayoutElementType", v12.receiver, v12.super_class);

  if (v6 == 1)
  {
    v7 = [(SBHomeScreenZoomSwitcherModifier *)self switcherSettings];
    v8 = [v7 animationSettings];

    if ([(SBHomeScreenZoomSwitcherModifier *)self _isEffectivelyHome]) {
      [v8 zoomUpSettings];
    }
    else {
    v9 = [v8 iconZoomDownSettings];
    }
    v10 = (void *)[v5 mutableCopy];
    [v10 setLayoutSettings:v9];

    v5 = v10;
  }
  return v5;
}

- (double)homeScreenAlpha
{
  if ([(SBHomeScreenZoomSwitcherModifier *)self _isEffectivelyHome])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    [(SBHomeScreenZoomSwitcherModifier *)&v8 homeScreenAlpha];
  }
  else
  {
    id v4 = [(SBHomeScreenZoomSwitcherModifier *)self switcherSettings];
    v5 = [v4 animationSettings];
    [v5 homeScreenOpacityInApplication];
    double v7 = v6;

    return v7;
  }
  return result;
}

- (double)homeScreenBackdropBlurProgress
{
  if ([(SBHomeScreenZoomSwitcherModifier *)self _isEffectivelyHome])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    [(SBHomeScreenZoomSwitcherModifier *)&v8 homeScreenBackdropBlurProgress];
  }
  else
  {
    id v4 = [(SBHomeScreenZoomSwitcherModifier *)self switcherSettings];
    v5 = [v4 animationSettings];
    [v5 homeScreenBlurInApplication];
    double v7 = v6;

    return v7;
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if ([(SBHomeScreenZoomSwitcherModifier *)self hasHomeButton]) {
    return 1;
  }
  else {
    return 3;
  }
}

- (double)homeScreenDimmingAlpha
{
  if ([(SBHomeScreenZoomSwitcherModifier *)self _isEffectivelyHome])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    [(SBHomeScreenZoomSwitcherModifier *)&v8 homeScreenDimmingAlpha];
  }
  else
  {
    id v4 = [(SBHomeScreenZoomSwitcherModifier *)self switcherSettings];
    v5 = [v4 animationSettings];
    [v5 dimmingAlphaInApplication];
    double v7 = v6;

    return v7;
  }
  return result;
}

- (double)homeScreenScale
{
  if ([(SBHomeScreenZoomSwitcherModifier *)self _isEffectivelyHome])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    [(SBHomeScreenZoomSwitcherModifier *)&v8 homeScreenScale];
  }
  else
  {
    id v4 = [(SBHomeScreenZoomSwitcherModifier *)self switcherSettings];
    v5 = [v4 animationSettings];
    [v5 homeScreenScaleInApplication];
    double v7 = v6;

    return v7;
  }
  return result;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (double)wallpaperScale
{
  if ([(SBHomeScreenZoomSwitcherModifier *)self _isEffectivelyHome])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeScreenZoomSwitcherModifier;
    [(SBHomeScreenZoomSwitcherModifier *)&v8 wallpaperScale];
  }
  else
  {
    id v4 = [(SBHomeScreenZoomSwitcherModifier *)self switcherSettings];
    v5 = [v4 animationSettings];
    [v5 wallpaperScaleInApplication];
    double v7 = v6;

    return v7;
  }
  return result;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)_isEffectivelyHome
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout] && self->_direction == 2)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(SBTransitionSwitcherModifier *)self isUpdatingLayout];
    if (v3) {
      LOBYTE(v3) = self->_direction == 1;
    }
  }
  return v3;
}

@end