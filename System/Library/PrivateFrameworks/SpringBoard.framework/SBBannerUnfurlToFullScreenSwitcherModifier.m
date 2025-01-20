@interface SBBannerUnfurlToFullScreenSwitcherModifier
- (BOOL)_isAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBBannerUnfurlToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 bannerUnfurlSourceContext:(id)a6;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (int64_t)backdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBBannerUnfurlToFullScreenSwitcherModifier

- (SBBannerUnfurlToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 bannerUnfurlSourceContext:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  v15 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:a3];
  if (v15)
  {
    if (!v13)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v15, @"SBBannerUnfurlToFullScreenSwitcherModifier.m", 35, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v15->_fromAppLayout, a4);
    objc_storeStrong((id *)&v15->_toAppLayout, a5);
    objc_storeStrong((id *)&v15->_bannerUnfurlSourceContext, a6);
  }

  return v15;
}

- (id)transitionWillBegin
{
  v22.receiver = self;
  v22.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v22 transitionWillBegin];
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:6 updateMode:2];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v5];

  [(SBBannerUnfurlSourceContext *)self->_bannerUnfurlSourceContext referenceVelocity];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [(SBBannerUnfurlToFullScreenSwitcherModifier *)self switcherInterfaceOrientation];
  double v11 = -v9;
  double v12 = -v7;
  if (v10 == 2) {
    double v13 = -v9;
  }
  else {
    double v13 = v9;
  }
  if (v10 == 2) {
    double v14 = -v7;
  }
  else {
    double v14 = v7;
  }
  if (v10 == 3)
  {
    double v15 = v9;
  }
  else
  {
    double v12 = v13;
    double v15 = v14;
  }
  if (v10 != 4)
  {
    double v7 = v12;
    double v11 = v15;
  }
  if (v11 != *MEMORY[0x1E4F1DAD8] || v7 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    v17 = [SBInjectVelocitySwitcherEventResponse alloc];
    objc_super v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, v7);
    v19 = [(SBInjectVelocitySwitcherEventResponse *)v17 initWithVelocity:v18 forKey:@"position" appLayout:self->_toAppLayout];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v19];
  }
  v20 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  return v20;
}

- (id)transitionWillUpdate
{
  v18.receiver = self;
  v18.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v18 transitionWillUpdate];
  if (self->_fromAppLayout && !self->_isScalingDown)
  {
    self->_isScalingDown = 1;
    v4 = [(SBBannerUnfurlToFullScreenSwitcherModifier *)self switcherSettings];
    v5 = [v4 animationSettings];

    objc_initWeak(&location, self);
    double v6 = [SBTimerEventSwitcherEventResponse alloc];
    [v5 dosidoScaleUpDelay];
    double v8 = v7;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __66__SBBannerUnfurlToFullScreenSwitcherModifier_transitionWillUpdate__block_invoke;
    double v15 = &unk_1E6AF90F0;
    objc_copyWeak(&v16, &location);
    double v9 = [(SBTimerEventSwitcherEventResponse *)v6 initWithDelay:&v12 validator:@"_SBBannerUnfurlToFullScreenSwitcherModifierTimerReasonScaleUp" reason:v8];
    uint64_t v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v3, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    v3 = (void *)v10;
  }
  return v3;
}

BOOL __66__SBBannerUnfurlToFullScreenSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  double v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"_SBBannerUnfurlToFullScreenSwitcherModifierTimerReasonScaleUp"];
  if (v4)
  {
    self->_isScalingDown = 0;
    double v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    v5 = (void *)v8;
  }
  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  -[SBBannerUnfurlToFullScreenSwitcherModifier frameForIndex:](&v21, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(SBBannerUnfurlToFullScreenSwitcherModifier *)self _isAppLayout:self->_toAppLayout atIndex:a3])
  {
    if ([(SBTransitionSwitcherModifier *)self isPreparingLayout])
    {
      [(SBBannerUnfurlSourceContext *)self->_bannerUnfurlSourceContext referenceFrame];
      [(SBBannerUnfurlSourceContext *)self->_bannerUnfurlSourceContext referenceCoordinateSpaceBounds];
      [(SBBannerUnfurlToFullScreenSwitcherModifier *)self switcherInterfaceOrientation];
      _UIWindowConvertRectFromOrientationToOrientation();
LABEL_6:
      double v6 = v13;
      double v8 = v14;
      double v10 = v15;
      double v12 = v16;
    }
  }
  else if ([(SBBannerUnfurlToFullScreenSwitcherModifier *)self _isAppLayout:self->_fromAppLayout atIndex:a3])
  {
    [(SBBannerUnfurlToFullScreenSwitcherModifier *)self containerViewBounds];
    goto LABEL_6;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  id v4 = a3;
  double v5 = [(SBTransitionSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  uint64_t v6 = objc_msgSend(v4, "switcherLayoutElementType", v12.receiver, v12.super_class);

  if (!v6)
  {
    double v7 = [(SBBannerUnfurlToFullScreenSwitcherModifier *)self switcherSettings];
    double v8 = [v7 animationSettings];

    double v9 = (void *)[v5 mutableCopy];
    double v10 = [v8 bannerUnfurlSettings];
    [v9 setLayoutSettings:v10];

    double v5 = v9;
  }
  return v5;
}

- (int64_t)backdropBlurType
{
  if ([(SBBannerUnfurlToFullScreenSwitcherModifier *)self hasHomeButton]) {
    return 1;
  }
  else {
    return 3;
  }
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  BOOL v3 = [(SBBannerUnfurlToFullScreenSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = (void *)[v3 mutableCopy];

  [v4 addObject:self->_toAppLayout];
  if (self->_fromAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  if ([(SBBannerUnfurlToFullScreenSwitcherModifier *)self _isAppLayout:self->_toAppLayout atIndex:a3])
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  return [(SBBannerUnfurlToFullScreenSwitcherModifier *)&v6 shouldScaleOverlayToFillBoundsAtIndex:a3];
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
  -[SBBannerUnfurlToFullScreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, a4);
  double v8 = v7;
  if (![(SBBannerUnfurlToFullScreenSwitcherModifier *)self _isAppLayout:self->_toAppLayout atIndex:a5]|| (BOOL v10 = [(SBTransitionSwitcherModifier *)self isPreparingLayout], result = 1.0, !v10))
  {
    BOOL v11 = -[SBBannerUnfurlToFullScreenSwitcherModifier _isAppLayout:atIndex:](self, "_isAppLayout:atIndex:", self->_fromAppLayout, a5, result);
    double result = 1.0;
    if (!v11) {
      return v8;
    }
  }
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if ([(SBBannerUnfurlToFullScreenSwitcherModifier *)self _isAppLayout:self->_toAppLayout atIndex:a3]&& [(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    [(SBBannerUnfurlSourceContext *)self->_bannerUnfurlSourceContext cornerRadius];
  }
  else
  {
    [(SBBannerUnfurlToFullScreenSwitcherModifier *)self displayCornerRadius];
  }
  SBRectCornerRadiiForRadius();
  result.topRight = v7;
  result.bottomRight = v6;
  result.bottomLeft = v5;
  result.topLeft = v4;
  return result;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  return 0;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  if (self->_toAppLayout == a3)
  {
    return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBBannerUnfurlToFullScreenSwitcherModifier;
    return (SBSwitcherAsyncRenderingAttributes)[(SBTransitionSwitcherModifier *)&v4 asyncRenderingAttributesForAppLayout:sel_asyncRenderingAttributesForAppLayout_];
  }
}

- (BOOL)_isAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(SBBannerUnfurlToFullScreenSwitcherModifier *)self appLayouts];
  double v8 = [v7 objectAtIndex:a4];

  LOBYTE(v7) = [v8 isEqual:v6];
  return (char)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenModifier, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlSourceContext, 0);
}

@end