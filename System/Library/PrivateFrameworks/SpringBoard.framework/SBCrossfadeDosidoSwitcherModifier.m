@interface SBCrossfadeDosidoSwitcherModifier
- (BOOL)_isFromAppLayoutAtIndex:(unint64_t)a3;
- (BOOL)_isToAppLayoutAtIndex:(unint64_t)a3;
- (BOOL)_isToOrFromAppLayoutAtIndex:(unint64_t)a3;
- (BOOL)_shouldEnsureHomeScreenVisible;
- (BOOL)isFullScreenTransition;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBCrossfadeDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)_opacitySettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (unint64_t)transactionCompletionOptions;
- (void)setFullScreenTransition:(BOOL)a3;
@end

@implementation SBCrossfadeDosidoSwitcherModifier

- (SBCrossfadeDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v14 initWithTransitionID:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fromAppLayout, a4);
    objc_storeStrong((id *)&v12->_toAppLayout, a5);
  }

  return v12;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:2];
  v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self isFullScreenTransition]
    && [(SBCrossfadeDosidoSwitcherModifier *)self _isToOrFromAppLayoutAtIndex:a3])
  {
    [(SBCrossfadeDosidoSwitcherModifier *)self containerViewBounds];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    [(SBCrossfadeDosidoSwitcherModifier *)&v9 frameForIndex:a3];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if (![(SBCrossfadeDosidoSwitcherModifier *)self isFullScreenTransition]
    || (BOOL v6 = [(SBCrossfadeDosidoSwitcherModifier *)self _isToOrFromAppLayoutAtIndex:a3],
        double result = 1.0,
        !v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    -[SBCrossfadeDosidoSwitcherModifier scaleForIndex:](&v7, sel_scaleForIndex_, a3, result);
  }
  return result;
}

- (id)visibleAppLayouts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = v3;
  if (self->_fromAppLayout) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_toAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  BOOL v6 = [(SBCrossfadeDosidoSwitcherModifier *)self _opacitySettings];
  [v5 setOpacitySettings:v6];

  [v5 setUpdateMode:3];
  return v5;
}

- (id)_opacitySettings
{
  v2 = [(SBCrossfadeDosidoSwitcherModifier *)self switcherSettings];
  id v3 = [v2 animationSettings];
  v4 = [v3 crossfadeDosidoSettings];

  return v4;
}

- (double)homeScreenAlpha
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible])
  {
    id v3 = [(SBCrossfadeDosidoSwitcherModifier *)self switcherSettings];
    v4 = [v3 animationSettings];
    [v4 homeScreenAlphaForMode:1];
    double v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    [(SBCrossfadeDosidoSwitcherModifier *)&v8 homeScreenAlpha];
  }
  return result;
}

- (double)homeScreenScale
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible])
  {
    id v3 = [(SBCrossfadeDosidoSwitcherModifier *)self switcherSettings];
    v4 = [v3 animationSettings];
    [v4 homeScreenScaleForMode:1];
    double v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    [(SBCrossfadeDosidoSwitcherModifier *)&v8 homeScreenScale];
  }
  return result;
}

- (double)wallpaperScale
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible])
  {
    id v3 = [(SBCrossfadeDosidoSwitcherModifier *)self switcherSettings];
    v4 = [v3 animationSettings];
    [v4 wallpaperScaleForMode:1];
    double v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    [(SBCrossfadeDosidoSwitcherModifier *)&v8 wallpaperScale];
  }
  return result;
}

- (double)homeScreenDimmingAlpha
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible])
  {
    id v3 = [(SBCrossfadeDosidoSwitcherModifier *)self switcherSettings];
    v4 = [v3 animationSettings];
    [v4 homeScreenDimmingAlphaForMode:1];
    double v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    [(SBCrossfadeDosidoSwitcherModifier *)&v8 homeScreenDimmingAlpha];
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible]) {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  return [(SBCrossfadeDosidoSwitcherModifier *)&v4 homeScreenBackdropBlurType];
}

- (double)homeScreenBackdropBlurProgress
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible])
  {
    id v3 = [(SBCrossfadeDosidoSwitcherModifier *)self switcherSettings];
    objc_super v4 = [v3 animationSettings];
    [v4 homeScreenBlurProgressForMode:1];
    double v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    [(SBCrossfadeDosidoSwitcherModifier *)&v8 homeScreenBackdropBlurProgress];
  }
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  return [(SBCrossfadeDosidoSwitcherModifier *)&v4 isWallpaperRequiredForSwitcher];
}

- (BOOL)isHomeScreenContentRequired
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  return [(SBCrossfadeDosidoSwitcherModifier *)&v4 isHomeScreenContentRequired];
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _shouldEnsureHomeScreenVisible]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
  return [(SBCrossfadeDosidoSwitcherModifier *)&v4 wallpaperStyle];
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  unint64_t v9 = [(SBTransitionSwitcherModifier *)self transitionPhase];
  BOOL v10 = [(SBCrossfadeDosidoSwitcherModifier *)self _isFromAppLayoutAtIndex:a5];
  if (v9 > 1)
  {
    double v11 = 0.0;
    if (!v10)
    {
      double v11 = 1.0;
      if (![(SBCrossfadeDosidoSwitcherModifier *)self _isToAppLayoutAtIndex:a5])
      {
        v15 = self;
        v12 = &v15;
        goto LABEL_8;
      }
    }
  }
  else
  {
    double v11 = 1.0;
    if (!v10)
    {
      double v11 = 0.0;
      if (![(SBCrossfadeDosidoSwitcherModifier *)self _isToAppLayoutAtIndex:a5])
      {
        v16 = self;
        v12 = &v16;
LABEL_8:
        v12[1] = (SBCrossfadeDosidoSwitcherModifier *)SBCrossfadeDosidoSwitcherModifier;
        objc_msgSendSuper2((objc_super *)v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5, v15);
        double v11 = v13;
      }
    }
  }

  return v11;
}

- (id)topMostLayoutElements
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_toAppLayout)
  {
    v5[0] = self->_toAppLayout;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBCrossfadeDosidoSwitcherModifier;
    v2 = [(SBCrossfadeDosidoSwitcherModifier *)&v4 topMostLayoutElements];
  }
  return v2;
}

- (unint64_t)transactionCompletionOptions
{
  return 6;
}

- (BOOL)_isFromAppLayoutAtIndex:(unint64_t)a3
{
  if (!self->_fromAppLayout) {
    return 0;
  }
  objc_super v4 = self;
  double v5 = [(SBCrossfadeDosidoSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_fromAppLayout];
  return (char)v4;
}

- (BOOL)_isToAppLayoutAtIndex:(unint64_t)a3
{
  if (!self->_toAppLayout) {
    return 0;
  }
  objc_super v4 = self;
  double v5 = [(SBCrossfadeDosidoSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_toAppLayout];
  return (char)v4;
}

- (BOOL)_isToOrFromAppLayoutAtIndex:(unint64_t)a3
{
  if ([(SBCrossfadeDosidoSwitcherModifier *)self _isFromAppLayoutAtIndex:"_isFromAppLayoutAtIndex:"]) {
    return 1;
  }
  return [(SBCrossfadeDosidoSwitcherModifier *)self _isToAppLayoutAtIndex:a3];
}

- (BOOL)_shouldEnsureHomeScreenVisible
{
  return !self->_fromAppLayout || self->_toAppLayout == 0;
}

- (BOOL)isFullScreenTransition
{
  return self->_fullScreenTransition;
}

- (void)setFullScreenTransition:(BOOL)a3
{
  self->_fullScreenTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_homeScreenModifier, 0);
}

@end