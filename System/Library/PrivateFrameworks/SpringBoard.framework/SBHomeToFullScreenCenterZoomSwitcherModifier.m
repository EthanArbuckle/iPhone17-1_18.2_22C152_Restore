@interface SBHomeToFullScreenCenterZoomSwitcherModifier
- (BOOL)_isToAppLayoutAtIndex:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (BOOL)shouldForceDefaultAnchorPointForTransition;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBHomeToFullScreenCenterZoomSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenScale;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_layoutSettings;
- (id)_opacitySettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleResizeProgressEvent:(id)a3;
- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3;
@end

@implementation SBHomeToFullScreenCenterZoomSwitcherModifier

- (SBHomeToFullScreenCenterZoomSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBHomeToFullScreenCenterZoomSwitcherModifier.m", 29, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  v9 = [(SBTransitionSwitcherModifier *)&v13 initWithTransitionID:v7];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_toAppLayout, a4);
  }

  return v10;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  v5 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  v6 = [v5 animationSettings];
  [v6 disableAsyncRenderingTransitionPercentage];
  double v8 = v7;

  v9 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self _layoutSettings];
  [v9 settlingDuration];
  double v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (id)transitionWillBegin
{
  v20.receiver = self;
  v20.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v20 transitionWillBegin];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:2];
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  v6 = +[SBBlurItemContainerParameters defaultCrossblurBlurParameters];
  double v7 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  double v8 = [v7 animationSettings];

  v9 = [SBBlurItemContainerParameters alloc];
  [v8 homeScreenCenterZoomInitialBlur];
  double v11 = v10;
  uint64_t v12 = [v6 shouldRasterize];
  [v6 rasterizationScale];
  double v14 = v13;
  v15 = [v6 blurAnimationSettings];
  v16 = [(SBBlurItemContainerParameters *)v9 initWithBlurRadius:v12 shouldRasterize:1 rasterizationScale:1 inputQuality:v15 inputIntermediateBitDepth:v11 blurAnimationSettings:v14];

  v17 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_toAppLayout shouldBlur:1 blurParameters:v16 animationUpdateMode:2];
  v18 = +[SBChainableModifierEventResponse responseByAppendingResponse:v17 toResponse:v5];

  return v18;
}

- (id)transitionWillUpdate
{
  v20.receiver = self;
  v20.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v20 transitionWillUpdate];
  v4 = +[SBBlurItemContainerParameters defaultCrossblurBlurParameters];
  v5 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  v6 = [v5 animationSettings];

  [v6 homeScreenCenterZoomInitialBlur];
  double v8 = v7;
  [v6 homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete];
  double v10 = v8 * (v9 + -1.0) / v9;
  double v11 = [SBBlurItemContainerParameters alloc];
  uint64_t v12 = [v4 shouldRasterize];
  [v4 rasterizationScale];
  double v14 = v13;
  v15 = [v4 blurAnimationSettings];
  v16 = [(SBBlurItemContainerParameters *)v11 initWithBlurRadius:v12 shouldRasterize:1 rasterizationScale:1 inputQuality:v15 inputIntermediateBitDepth:v10 blurAnimationSettings:v14];

  v17 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_toAppLayout shouldBlur:1 blurParameters:v16 animationUpdateMode:3];
  v18 = +[SBChainableModifierEventResponse responseByAppendingResponse:v17 toResponse:v3];

  return v18;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  v4 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_toAppLayout shouldBlur:0 animationUpdateMode:2];
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  return v5;
}

- (id)handleResizeProgressEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v11 handleResizeProgressEvent:v4];
  objc_msgSend(v4, "progress", v11.receiver, v11.super_class);

  v6 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  objc_super v7 = [v6 animationSettings];

  [v7 homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete];
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    double v8 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_toAppLayout shouldBlur:0 animationUpdateMode:2];
    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v5];

    v5 = (void *)v9;
  }

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if (![(SBHomeToFullScreenCenterZoomSwitcherModifier *)self _isToAppLayoutAtIndex:"_isToAppLayoutAtIndex:"])
  {
    v24.receiver = self;
    v24.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v24 frameForIndex:a3];
LABEL_6:
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
    goto LABEL_7;
  }
  if (![(SBHomeToFullScreenCenterZoomSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self containerViewBounds];
    goto LABEL_6;
  }
  v5 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  objc_super v7 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v6];
  [v7 boundingBox];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

LABEL_7:
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBTransitionSwitcherModifier *)self transitionPhase];
  v6 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  objc_super v7 = [v6 animationSettings];

  if (![(SBHomeToFullScreenCenterZoomSwitcherModifier *)self _isToAppLayoutAtIndex:a3])
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v11 scaleForIndex:a3];
    goto LABEL_5;
  }
  double v8 = 1.0;
  if (v5 <= 1)
  {
    [v7 homeScreenCenterZoomInitialScale];
LABEL_5:
    double v8 = v9;
  }

  return v8;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (BOOL v5 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self _isToAppLayoutAtIndex:a3],
        double v6 = 0.5,
        double v7 = 0.5,
        !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v8 anchorPointForIndex:a3];
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self _isToAppLayoutAtIndex:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  return [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v6 shouldPinLayoutRolesToSpace:a3];
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self _isToAppLayoutAtIndex:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  return [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v6 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v6 = 0.0, ([v4 isEqual:self->_toAppLayout] & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v9 perspectiveAngleForAppLayout:v5];
    double v6 = v7;
  }

  return v6;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = v9;
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [v9 isEqual:self->_toAppLayout])
  {
    objc_super v11 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self appLayouts];
    -[SBHomeToFullScreenCenterZoomSwitcherModifier frameForIndex:](self, "frameForIndex:", [v11 indexOfObject:self->_toAppLayout]);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
    double v19 = v23;
  }

  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  double v27 = v19;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = v7;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v9 = 0.5, double v10 = 0.5, ([v7 isEqual:self->_toAppLayout] & 1) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    double v9 = v11;
    double v10 = v12;
  }

  double v13 = v9;
  double v14 = v10;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  v3 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_toAppLayout];

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  BOOL v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  id v7 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self _opacitySettings];
  [v5 setOpacitySettings:v7];

  return v5;
}

- (id)_layoutSettings
{
  v2 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  v3 = [v2 animationSettings];
  id v4 = [v3 crossblurDosidoSettings];

  return v4;
}

- (id)_opacitySettings
{
  v2 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  v3 = [v2 animationSettings];
  id v4 = [v3 crossblurDosidoSettings];

  return v4;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  BOOL v5 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v15 resizeProgressNotificationsForLayoutRole:a3 inAppLayout:a4];
  objc_super v6 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  id v7 = [v6 animationSettings];

  [v7 homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete];
  double v9 = v8;
  [v7 homeScreenCenterZoomInitialScale];
  v16[0] = &unk_1F3348A98;
  double v11 = [NSNumber numberWithDouble:(v9 - v10) / (1.0 - v10)];
  v16[1] = v11;
  v16[2] = &unk_1F3348AA8;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  double v13 = [v5 setByAddingObjectsFromArray:v12];

  return v13;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  double v10 = [v9 animationSettings];

  double v11 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self appLayouts];
  if ([v11 indexOfObject:self->_toAppLayout] != a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    [(SBHomeToFullScreenCenterZoomSwitcherModifier *)&v15 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    goto LABEL_5;
  }
  double v12 = 1.0;
  if ([(SBTransitionSwitcherModifier *)self transitionPhase] <= 1)
  {
    [v10 homeScreenCenterZoomInitialOpacity];
LABEL_5:
    double v12 = v13;
  }

  return v12;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  int v4 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self isShowingSpotlightOrTodayView];
  if (v4) {
    LOBYTE(v4) = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self isDevicePad] ^ 1;
  }
  return v4;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (![(SBHomeToFullScreenCenterZoomSwitcherModifier *)self hasHomeButton]) {
    return 3;
  }
  if ([(SBHomeToFullScreenCenterZoomSwitcherModifier *)self isDevicePad]) {
    return 1;
  }
  return 3;
}

- (double)homeScreenBackdropBlurProgress
{
  if ([(SBTransitionSwitcherModifier *)self transitionPhase] <= 1
    && ![(SBHomeToFullScreenCenterZoomSwitcherModifier *)self isDevicePad])
  {
    return 0.0;
  }
  double v3 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  double v4 = [v3 animationSettings];
  [v4 homeScreenBlurProgressForMode:3];
  double v6 = v5;

  return v6;
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

- (double)homeScreenScale
{
  unint64_t v3 = [(SBTransitionSwitcherModifier *)self transitionPhase];
  double v4 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self switcherSettings];
  double v5 = [v4 animationSettings];

  double v6 = 1.0;
  if (v3 >= 2)
  {
    [v5 crossblurDosidoSmallScale];
    double v6 = v7;
  }

  return v6;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)topMostLayoutElements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_toAppLayout;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)_isToAppLayoutAtIndex:(unint64_t)a3
{
  double v4 = self;
  double v5 = [(SBHomeToFullScreenCenterZoomSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_toAppLayout];
  return (char)v4;
}

- (BOOL)shouldForceDefaultAnchorPointForTransition
{
  return self->_shouldForceDefaultAnchorPointForTransition;
}

- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3
{
  self->_shouldForceDefaultAnchorPointForTransition = a3;
}

- (void).cxx_destruct
{
}

@end