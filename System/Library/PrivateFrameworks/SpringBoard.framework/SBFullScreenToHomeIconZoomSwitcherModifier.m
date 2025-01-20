@interface SBFullScreenToHomeIconZoomSwitcherModifier
- (BOOL)_isEffectivelyHome;
- (BOOL)_isIndexZoomAppLayout:(unint64_t)a3;
- (BOOL)asyncRenderingDisabled;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAcceleratedHomeButtonPressBegin;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (BOOL)shouldDisableAsyncRendering;
- (BOOL)shouldDockOrderFrontDuringTransition;
- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode;
- (BOOL)shouldForceDefaultAnchorPointForTransition;
- (BOOL)shouldMatchMoveToIconView;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldUpdateIconViewVisibility;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (CGRect)fullyPresentedFrameForIndex:(unint64_t)a3 frame:(CGRect)a4;
- (SBAppLayout)appLayout;
- (SBFullScreenToHomeIconZoomSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5;
- (SBFullScreenToHomeIconZoomSwitcherModifier)initWithTransitionID:(id)a3 targetFrame:(CGRect)a4 appLayout:(id)a5 direction:(unint64_t)a6;
- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom:(CGPoint)a3;
- (double)_normalizedHomeScreenTargetZoomPercentBetweenCenterAndEdge:(CGPoint)a3;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)_layoutSettings;
- (id)_settingsByInterpolatingBetween:(id)a3 and:(id)a4 progress:(double)a5;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)layoutSettingsForTargetCenter:(CGPoint)a3;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)dockUpdateMode;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (unint64_t)dockWindowLevelPriority;
- (void)didMoveToParentModifier:(id)a3;
- (void)setShouldDisableAsyncRendering:(BOOL)a3;
- (void)setShouldDockOrderFrontDuringTransition:(BOOL)a3;
- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3;
- (void)setShouldMatchMoveToIconView:(BOOL)a3;
- (void)setShouldUpdateIconViewVisibility:(BOOL)a3;
@end

@implementation SBFullScreenToHomeIconZoomSwitcherModifier

- (double)_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom:(CGPoint)a3
{
  double y = a3.y;
  if ((unint64_t)([(SBFullScreenToHomeIconZoomSwitcherModifier *)self switcherInterfaceOrientation]- 1) >= 2)double v5 = 0.0; {
  else
  }
    double v5 = 102.0;
  [(SBFullScreenToHomeIconZoomSwitcherModifier *)self containerViewBounds];
  return (y - v5) / (v6 - v5);
}

- (BOOL)_isIndexZoomAppLayout:(unint64_t)a3
{
  v4 = self;
  double v5 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_appLayout];
  return (char)v4;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:"_isIndexZoomAppLayout:"]
    && [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isEffectivelyHome])
  {
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v9 cornerRadiiForIndex:a3];
  }
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isEffectivelyHome]
    && [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:a3])
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v15 frameForIndex:a3];
    double v6 = v5;
    double v8 = v7;
    p_homeScreenIconFrame = &self->_homeScreenIconFrame;
    int v10 = BSFloatGreaterThanFloat();
    if (v6 <= v8) {
      double v11 = v6;
    }
    else {
      double v11 = v8;
    }
    if (v10) {
      double v11 = v6;
    }
    double width = p_homeScreenIconFrame->size.width;
    if (width < p_homeScreenIconFrame->size.height) {
      double width = p_homeScreenIconFrame->size.height;
    }
    return width / v11;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v14 scaleForIndex:a3];
  }
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isEffectivelyHome]
    && [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:a3])
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v10 frameForIndex:a3];
    BSFloatGreaterThanFloat();
    UIRectGetCenter();
    SBRectWithSize();
    SBUnintegralizedRectCenteredAboutPoint();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v9 frameForIndex:a3];
  }
  result.size.height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_isEffectivelyHome
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = self->_direction == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v4 = self->_direction == 1;
  }
  else {
    BOOL v4 = 0;
  }
  return v3 || v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 1.0;
  if (![(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:a5])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  BOOL result = 0;
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self isDevicePad])
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v6 frameForIndex:a3];
    SBRectWithSize();
    if (BSFloatLessThanFloat()) {
      return 1;
    }
  }
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  if (![(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:a4]
    || ![(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isEffectivelyHome]
    || !self->_shouldDockOrderFrontDuringTransition
    || self->_direction
    || (double result = 0.0, !self->_homeScreenIconLocationIsFloatingDock))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v8, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4, result);
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self hasHomeButton]) {
    return 1;
  }
  else {
    return 3;
  }
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  BOOL v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  if (CGRectIsNull(self->_homeScreenIconFrame)) {
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)self containerViewBounds];
  }
  UIRectGetCenter();
  return [(SBFullScreenToHomeIconZoomSwitcherModifier *)self layoutSettingsForTargetCenter:"layoutSettingsForTargetCenter:"];
}

- (id)layoutSettingsForTargetCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v6 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];

  if (self->_direction)
  {
    uint64_t v8 = [v7 iconZoomDownSettings];
LABEL_5:
    double v9 = (void *)v8;
    goto LABEL_7;
  }
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self hasHomeButton])
  {
    uint64_t v8 = [v7 zoomUpSettings];
    goto LABEL_5;
  }
  double v10 = [v7 homeGestureEdgeRowZoomUpSettings];
  double v11 = [v7 homeGestureCenterRowZoomUpSettings];
  -[SBFullScreenToHomeIconZoomSwitcherModifier _normalizedHomeScreenTargetZoomPercentBetweenCenterAndEdge:](self, "_normalizedHomeScreenTargetZoomPercentBetweenCenterAndEdge:", x, y);
  double v9 = -[SBFullScreenToHomeIconZoomSwitcherModifier _settingsByInterpolatingBetween:and:progress:](self, "_settingsByInterpolatingBetween:and:progress:", v11, v10);

LABEL_7:
  return v9;
}

- (id)_settingsByInterpolatingBetween:(id)a3 and:(id)a4 progress:(double)a5
{
  objc_super v6 = (objc_class *)MEMORY[0x1E4FA5F08];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setDefaultValues];
  [v8 dampingRatio];
  [v7 dampingRatio];
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setDampingRatio:");
  [v8 response];
  [v7 response];
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setResponse:");
  [v8 retargetImpulse];

  [v7 retargetImpulse];
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v9, "setRetargetImpulse:");
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114114, *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
  return v9;
}

- (double)_normalizedHomeScreenTargetZoomPercentBetweenCenterAndEdge:(CGPoint)a3
{
  -[SBFullScreenToHomeIconZoomSwitcherModifier _normalizedHomeScreenIconZoomPercentBetweenTopAndBottom:](self, "_normalizedHomeScreenIconZoomPercentBetweenTopAndBottom:", a3.x, a3.y);
  return (v3 * 2.0 + -1.0) * (v3 * 2.0 + -1.0);
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  double v3 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v6 visibleAppLayouts];
  BOOL v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (double)homeScreenAlpha
{
  int64_t v3 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenBackdropBlurType];
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenHasOpenFolder]) {
    int v5 = 0;
  }
  else {
    int v5 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenHasWidgetCenterOrLibraryOpen] ^ 1;
  }
  if (v3 == 3 || (double result = 1.0, v5))
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v6 homeScreenAlpha];
  }
  return result;
}

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  int64_t v3 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v6 topMostLayoutElements];
  BOOL v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_appLayout, 0);

  return v4;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBFullScreenToHomeIconZoomSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v24, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isEffectivelyHome]
    && [v11 isEqual:self->_appLayout])
  {
    if (v17 > width) {
      double v17 = width;
    }
    if (v19 > height) {
      double v19 = height;
    }
  }

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = v9;
  if (self->_shouldForceDefaultAnchorPointForTransition && [v9 isEqual:self->_appLayout])
  {
    id v11 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self appLayouts];
    -[SBFullScreenToHomeIconZoomSwitcherModifier frameForIndex:](self, "frameForIndex:", [v11 indexOfObject:self->_appLayout]);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
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
  id v8 = v7;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v9 = 0.5, v10 = 0.5, ([v7 isEqual:self->_appLayout] & 1) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    double v9 = v11;
    double v10 = v12;
  }

  double v13 = v9;
  double v14 = v10;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return self->_wantsDockWindowLevelAssertion;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (BOOL v5 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:a3],
        double v6 = 0.5,
        double v7 = 0.5,
        !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v8 anchorPointForIndex:a3];
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  return [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v6 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldForceDefaultAnchorPointForTransition
    && [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:a3])
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  return [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v6 shouldPinLayoutRolesToSpace:a3];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (double v6 = 0.0, ([v4 isEqual:self->_appLayout] & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v9 perspectiveAngleForAppLayout:v5];
    double v6 = v7;
  }

  return v6;
}

- (CGRect)fullyPresentedFrameForIndex:(unint64_t)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isEffectivelyHome]
    && [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _isIndexZoomAppLayout:a3])
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v15 frameForIndex:a3];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
    -[SBFullScreenToHomeIconZoomSwitcherModifier fullyPresentedFrameForIndex:frame:](&v14, sel_fullyPresentedFrameForIndex_frame_, a3, x, y, width, height);
  }
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return self->_direction != 1;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return self->_direction == 1;
}

- (id)handleTimerEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  BOOL v5 = [(SBTransitionSwitcherModifier *)&v15 handleTimerEvent:v4];
  double v6 = [v4 reason];
  char v7 = [v6 isEqualToString:@"kSBIconZoomDisallowAcceleratedHomeButtonPressReason"];

  if (v7)
  {
    char v8 = 0;
    objc_super v9 = &OBJC_IVAR___SBFullScreenToHomeIconZoomSwitcherModifier__shouldAcceleratedHomeButtonPressBegin;
  }
  else
  {
    double v10 = [v4 reason];
    char v11 = [v10 isEqualToString:@"kSBIconZoomSwitcherModifierTakeDockWindowLevelAssertionReason"];

    if (v11)
    {
      char v8 = 1;
    }
    else
    {
      double v12 = [v4 reason];
      int v13 = [v12 isEqualToString:@"kSBIconZoomSwitcherModifierRelinquishDockWindowLevelAssertionReason"];

      if (!v13) {
        goto LABEL_9;
      }
      char v8 = 0;
    }
    objc_super v9 = &OBJC_IVAR___SBFullScreenToHomeIconZoomSwitcherModifier__wantsDockWindowLevelAssertion;
  }
  *((unsigned char *)&self->super.super.super.super.isa + *v9) = v8;
LABEL_9:

  return v5;
}

- (id)transitionDidEnd
{
  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  int64_t v3 = [(SBTransitionSwitcherModifier *)&v11 transitionDidEnd];
  if (self->_direction)
  {
    if (!self->_shouldUpdateIconViewVisibility) {
      goto LABEL_10;
    }
LABEL_6:
    id v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
    goto LABEL_7;
  }
  id v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  BOOL v5 = [[SBRequestFolderSnapshotsSwitcherEventResponse alloc] initWithSnapshotRequest:0];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v5];

  if (!self->_shouldUpdateIconViewVisibility) {
    goto LABEL_8;
  }
  if (!v4) {
    goto LABEL_6;
  }
LABEL_7:
  double v6 = [[SBIconOverlayVisibilitySwitcherEventResponse alloc] initWithAppLayout:self->_appLayout visible:0];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v6];

  char v7 = [[SBIconViewVisibilitySwitcherEventResponse alloc] initWithAppLayout:self->_appLayout visible:1 animationSettings:0 excludedIconLocations:0];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v7];

  char v8 = [[SBMatchMoveToIconViewSwitcherEventResponse alloc] initWithDeactivatingAppLayout:self->_appLayout];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v8];

LABEL_8:
  if (v4)
  {
    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    int64_t v3 = (void *)v9;
  }
LABEL_10:
  return v3;
}

- (id)transitionWillBegin
{
  v69.receiver = self;
  v69.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  int64_t v3 = [(SBTransitionSwitcherModifier *)&v69 transitionWillBegin];
  id v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  int64_t v5 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenBackdropBlurType];
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenHasOpenFolder]) {
    int v6 = 1;
  }
  else {
    int v6 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenHasWidgetCenterOrLibraryOpen];
  }
  if (self->_direction)
  {
    if (v5 == 3) {
      int v7 = 0;
    }
    else {
      int v7 = v6;
    }
    char v8 = [SBUpdateLayoutSwitcherEventResponse alloc];
    if (v7 == 1) {
      uint64_t v9 = 10;
    }
    else {
      uint64_t v9 = 2;
    }
    objc_super v11 = [(SBUpdateLayoutSwitcherEventResponse *)v8 initWithOptions:v9 updateMode:2];
  }
  else
  {
    double v10 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:2];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v10];

    objc_super v11 = [[SBRequestFolderSnapshotsSwitcherEventResponse alloc] initWithSnapshotRequest:1];
  }
  double v12 = v11;
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v11];

  unint64_t direction = self->_direction;
  if (direction == 1)
  {
    if (self->_homeScreenIconLocationIsFloatingDock)
    {
      int v14 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self isFloatingDockFullyPresented];
      BOOL homeScreenIconLocationIsFloatingDock = 0;
      int v16 = 1;
    }
    else
    {
      int v14 = 0;
      int v16 = 0;
      BOOL homeScreenIconLocationIsFloatingDock = 0;
    }
  }
  else
  {
    int v14 = 0;
    int v16 = 0;
    BOOL homeScreenIconLocationIsFloatingDock = self->_homeScreenIconLocationIsFloatingDock;
  }
  double v17 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self switcherSettings];
  double v18 = [v17 animationSettings];

  if (v14)
  {
    double v19 = [v18 floatingDockIconFadeSettings];
  }
  else
  {
    double v19 = 0;
  }
  if (self->_shouldUpdateIconViewVisibility)
  {
    double v20 = [[SBIconOverlayVisibilitySwitcherEventResponse alloc] initWithAppLayout:self->_appLayout visible:1];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v20];

    double v21 = [[SBIconViewVisibilitySwitcherEventResponse alloc] initWithAppLayout:self->_appLayout visible:0 animationSettings:v19 excludedIconLocations:0];
    if (v14)
    {
      objc_initWeak(&location, self);
      [v18 iconZoomFloatingDockFadeDelay];
      double v23 = v22;
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke;
      v66[3] = &unk_1E6AF90F0;
      objc_copyWeak(&v67, &location);
      [(SBChainableModifierEventResponse *)v21 setDelay:v66 withValidator:v23];
      objc_destroyWeak(&v67);
      objc_destroyWeak(&location);
    }
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v21];
  }
  if (direction == 1)
  {
    double v24 = [[SBNotifyIconWillZoomDownSwitcherEventResponse alloc] initWithAppLayout:self->_appLayout];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v24];

    if (self->_shouldMatchMoveToIconView)
    {
      double v25 = -[SBMatchMoveToIconViewSwitcherEventResponse initWithActivatingAppLayout:iconFrame:]([SBMatchMoveToIconViewSwitcherEventResponse alloc], "initWithActivatingAppLayout:iconFrame:", self->_appLayout, self->_homeScreenIconFrame.origin.x, self->_homeScreenIconFrame.origin.y, self->_homeScreenIconFrame.size.width, self->_homeScreenIconFrame.size.height);
      [(SBChainableModifierEventResponse *)v4 addChildResponse:v25];
    }
  }
  if (self->_shouldAcceleratedHomeButtonPressBegin)
  {
    objc_initWeak(&location, self);
    double v26 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _layoutSettings];
    [v26 settlingDuration];
    double v28 = v27;
    [v18 disallowAcceleratedHomeButtonPressTransitionPercentage];
    double v30 = v29;

    v31 = [SBTimerEventSwitcherEventResponse alloc];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_2;
    v64[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v65, &location);
    v32 = [(SBTimerEventSwitcherEventResponse *)v31 initWithDelay:v64 validator:@"kSBIconZoomDisallowAcceleratedHomeButtonPressReason" reason:v28 * v30];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v32];

    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }
  if (v16 && self->_itemContainerOverlapsDock)
  {
    v33 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self switcherSettings];
    v34 = [v33 animationSettings];

    [v34 dockHurdlingIconZoomInitialVelocity];
    double v36 = v35;
    v37 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self currentVelocityValueForVisibleAppLayout:self->_appLayout key:@"position"];
    [v37 CGPointValue];
    double v39 = v38;
    double v41 = v40;

    if (v41 <= v36) {
      double v36 = v41;
    }
    v42 = [SBInjectVelocitySwitcherEventResponse alloc];
    v43 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v39, v36);
    v44 = [(SBInjectVelocitySwitcherEventResponse *)v42 initWithVelocity:v43 forKey:@"position" appLayout:self->_appLayout];

    [(SBChainableModifierEventResponse *)v4 addChildResponse:v44];
    [v34 dockHurdlingIconZoomDockToBackTiming];
    double v46 = v45;
    UIAnimationDragCoefficient();
    float v48 = v47;
    objc_initWeak(&location, self);
    v49 = [SBTimerEventSwitcherEventResponse alloc];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_3;
    v62[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v63, &location);
    v50 = [(SBTimerEventSwitcherEventResponse *)v49 initWithDelay:v62 validator:@"kSBIconZoomSwitcherModifierTakeDockWindowLevelAssertionReason" reason:v46 * v48];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v50];

    objc_destroyWeak(&v63);
    objc_destroyWeak(&location);

    goto LABEL_38;
  }
  if (homeScreenIconLocationIsFloatingDock && self->_shouldDockOrderFrontDuringTransition)
  {
    v51 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self switcherSettings];
    v34 = [v51 animationSettings];

    [v34 dockHurdlingIconZoomDockToFrontTiming];
    double v53 = v52;
    UIAnimationDragCoefficient();
    float v55 = v54;
    objc_initWeak(&location, self);
    v56 = [SBTimerEventSwitcherEventResponse alloc];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_4;
    v60[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v61, &location);
    v57 = [(SBTimerEventSwitcherEventResponse *)v56 initWithDelay:v60 validator:@"kSBIconZoomSwitcherModifierRelinquishDockWindowLevelAssertionReason" reason:v53 * v55];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v57];

    objc_destroyWeak(&v61);
    objc_destroyWeak(&location);
LABEL_38:
  }
  v58 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  return v58;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  if (self->_direction || self->_shouldDisableAsyncRendering) {
    return 0;
  }
  int v6 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self switcherSettings];
  int v7 = [v6 animationSettings];
  [v7 disableAsyncRenderingTransitionPercentage];
  double v9 = v8;

  double v10 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self _layoutSettings];
  [v10 settlingDuration];
  double v12 = v9 * v11;
  UIAnimationDragCoefficient();
  *a3 = v12 * v13;

  return 1;
}

- (BOOL)asyncRenderingDisabled
{
  return self->_shouldDisableAsyncRendering;
}

BOOL __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)didMoveToParentModifier:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v16, sel_didMoveToParentModifier_);
  if (a3 && ![(SBChainableModifier *)self containsChildModifier:self->_coplanarModifier])
  {
    int64_t v5 = [[SBCoplanarSwitcherModifier alloc] initWithActiveAppLayout:self->_appLayout];
    coplanarModifier = self->_coplanarModifier;
    self->_coplanarModifier = v5;

    [(SBCoplanarSwitcherModifier *)self->_coplanarModifier setUsesContainerViewBoundsAsActiveFrame:1];
    [(SBChainableModifier *)self addChildModifier:self->_coplanarModifier];
    if (CGRectEqualToRect(self->_homeScreenIconFrame, *MEMORY[0x1E4F1DB28]))
    {
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenIconFrameForAppLayout:self->_appLayout];
      self->_homeScreenIconFrame.origin.double x = v7;
      self->_homeScreenIconFrame.origin.double y = v8;
      self->_homeScreenIconFrame.size.double width = v9;
      self->_homeScreenIconFrame.size.double height = v10;
    }
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenIconCornerRadiusForAppLayout:self->_appLayout];
    self->_homeScreenIconCornerRadius = v11;
    [(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenIconScaleForAppLayout:self->_appLayout];
    self->_homeScreenIconScale = v12;
    float v13 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self homeScreenIconLocationForAppLayout:self->_appLayout];
    self->_BOOL homeScreenIconLocationIsFloatingDock = SBIconLocationGroupContainsLocation();
    char v14 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self itemContainerForAppLayoutOverlapsFloatingDock:self->_appLayout];
    self->_itemContainerOverlapsDock = v14;
    if (self->_homeScreenIconLocationIsFloatingDock)
    {
      if (self->_direction) {
        char v15 = v14;
      }
      else {
        char v15 = 0;
      }
      if ((v15 & 1) == 0) {
        self->_wantsDockWindowLevelAssertion = 1;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
}

- (SBFullScreenToHomeIconZoomSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  CGFloat v10 = [(SBTransitionSwitcherModifier *)&v13 initWithTransitionID:a3];
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a4);
    v11->_unint64_t direction = a5;
    v11->_shouldAcceleratedHomeButtonPressBegin = a5 == 0;
    v11->_shouldUpdateIconViewVisibilitdouble y = 1;
    v11->_shouldMatchMoveToIconView = 1;
    v11->_shouldDisableAsyncRendering = 0;
  }

  return v11;
}

- (SBFullScreenToHomeIconZoomSwitcherModifier)initWithTransitionID:(id)a3 targetFrame:(CGRect)a4 appLayout:(id)a5 direction:(unint64_t)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGRect result = [(SBFullScreenToHomeIconZoomSwitcherModifier *)self initWithTransitionID:a3 appLayout:a5 direction:a6];
  if (result)
  {
    result->_homeScreenIconFrame.origin.CGFloat x = x;
    result->_homeScreenIconFrame.origin.CGFloat y = y;
    result->_homeScreenIconFrame.size.CGFloat width = width;
    result->_homeScreenIconFrame.size.CGFloat height = height;
  }
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v12 descriptionBuilderWithMultilinePrefix:a3];
  int64_t v5 = v4;
  if (self->_direction == 1) {
    int v6 = @"to-home";
  }
  else {
    int v6 = @"to-fullscreen";
  }
  id v7 = (id)[v4 appendObject:v6 withName:@"direction"];
  id v8 = (id)[v5 appendBool:self->_homeScreenIconLocationIsFloatingDock withName:@"homeScreenIconLocationIsFloatingDock"];
  id v9 = (id)[v5 appendBool:self->_itemContainerOverlapsDock withName:@"itemContainerOverlapsDock"];
  id v10 = (id)[v5 appendBool:self->_wantsDockWindowLevelAssertion withName:@"wantsDockWindowLevelAssertion"];
  return v5;
}

BOOL __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __65__SBFullScreenToHomeIconZoomSwitcherModifier_transitionWillBegin__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  int64_t v5 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v12 appLayoutsForContinuousExposeIdentifier:v4];
  if ([(SBFullScreenToHomeIconZoomSwitcherModifier *)self isChamoisWindowingUIEnabled]&& ([(SBAppLayout *)self->_appLayout continuousExposeIdentifier], int v6 = objc_claimAutoreleasedReturnValue(), v7 = BSEqualStrings(), v6, v7))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__SBFullScreenToHomeIconZoomSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke;
    v11[3] = &unk_1E6AF4B60;
    v11[4] = self;
    objc_msgSend(v5, "bs_filter:", v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

uint64_t __86__SBFullScreenToHomeIconZoomSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 216) isOrContainsAppLayout:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v3 isOrContainsAppLayout:*(void *)(*(void *)(a1 + 32) + 216)] ^ 1;
  }

  return v4;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  return 0;
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  retstr->var3 = 0;
  *(_OWORD *)&retstr->var1.origin.CGFloat y = 0u;
  *(_OWORD *)&retstr->var1.size.CGFloat height = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  CGRect result = (SBSwitcherShelfPresentationAttributes *)[(SBSwitcherShelfPresentationAttributes *)&v6 presentationAttributesForShelf:a4];
  retstr->var0 = 0;
  return result;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  if (self->_shouldAcceleratedHomeButtonPressBegin) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBFullScreenToHomeIconZoomSwitcherModifier;
  return [(SBFullScreenToHomeIconZoomSwitcherModifier *)&v3 shouldAcceleratedHomeButtonPressBegin];
}

- (BOOL)wantsDockBehaviorAssertion
{
  unint64_t direction = self->_direction;
  return direction == 1 && self->_homeScreenIconLocationIsFloatingDock || direction == 0;
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 3;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  [(SBFullScreenToHomeIconZoomSwitcherModifier *)self switcherWindowLevel];
  return v2 + -1.0;
}

- (BOOL)shouldUpdateIconViewVisibility
{
  return self->_shouldUpdateIconViewVisibility;
}

- (void)setShouldUpdateIconViewVisibility:(BOOL)a3
{
  self->_shouldUpdateIconViewVisibilitCGFloat y = a3;
}

- (BOOL)shouldMatchMoveToIconView
{
  return self->_shouldMatchMoveToIconView;
}

- (void)setShouldMatchMoveToIconView:(BOOL)a3
{
  self->_shouldMatchMoveToIconView = a3;
}

- (BOOL)shouldForceDefaultAnchorPointForTransition
{
  return self->_shouldForceDefaultAnchorPointForTransition;
}

- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3
{
  self->_shouldForceDefaultAnchorPointForTransition = a3;
}

- (BOOL)shouldDockOrderFrontDuringTransition
{
  return self->_shouldDockOrderFrontDuringTransition;
}

- (void)setShouldDockOrderFrontDuringTransition:(BOOL)a3
{
  self->_shouldDockOrderFrontDuringTransition = a3;
}

- (BOOL)shouldDisableAsyncRendering
{
  return self->_shouldDisableAsyncRendering;
}

- (void)setShouldDisableAsyncRendering:(BOOL)a3
{
  self->_shouldDisableAsyncRendering = a3;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

@end