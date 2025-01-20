@interface SBFullScreenToPeekSwitcherModifier
- (BOOL)_isPeekingAppLayout:(id)a3;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (CGRect)_firstStageFrameForPeekingAppLayoutWithInitialFrame:(CGRect)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBFullScreenToPeekSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 fromFloatingAppLayout:(id)a6 toFloatingAppLayout:(id)a7 peekConfiguration:(int64_t)a8;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_firstPhaseScale;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)wallpaperScale;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleResizeProgressEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (int64_t)homeScreenBackdropBlurType;
- (unint64_t)dockWindowLevelPriority;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBFullScreenToPeekSwitcherModifier

- (SBFullScreenToPeekSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 fromFloatingAppLayout:(id)a6 toFloatingAppLayout:(id)a7 peekConfiguration:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  unint64_t v15 = (unint64_t)a5;
  id v16 = a6;
  unint64_t v17 = (unint64_t)a7;
  if (v15 | v17)
  {
    if (!v14) {
      goto LABEL_5;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBFullScreenToPeekSwitcherModifier.m", 46, @"Invalid parameter not satisfying: %@", @"toAppLayout || toFloatingAppLayout" object file lineNumber description];

    if (!v14) {
      goto LABEL_5;
    }
  }
  if ([v14 configuration] != 1)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBFullScreenToPeekSwitcherModifier.m", 48, @"Invalid parameter not satisfying: %@", @"[fromAppLayout configuration] == SBAppLayoutConfigurationFull" object file lineNumber description];
  }
LABEL_5:
  v25.receiver = self;
  v25.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v18 = [(SBTransitionSwitcherModifier *)&v25 initWithTransitionID:v13];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fromAppLayout, a4);
    objc_storeStrong((id *)&v19->_toAppLayout, a5);
    objc_storeStrong((id *)&v19->_fromFloatingAppLayout, a6);
    objc_storeStrong((id *)&v19->_toFloatingAppLayout, a7);
    v19->_peekConfiguration = a8;
    v19->_animationPhase = 0;
  }

  return v19;
}

- (void)didMoveToParentModifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v8, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
    v6 = [v5 animationSettings];
    char v7 = [v6 performTwoPhaseFullScreenToPeekTransition];

    if ((v7 & 1) == 0) {
      self->_animationPhase = 1;
    }
  }
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:4];
  v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (id)transitionWillUpdate
{
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v13 transitionWillUpdate];
  if (!self->_animationPhase)
  {
    v4 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
    v5 = [v4 animationSettings];
    [v5 fullScreenToPeekSecondPhaseAnimationDelay];
    double v7 = v6;
    UIAnimationDragCoefficient();
    double v9 = v7 * v8;

    v10 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"SBFullScreenToPeekSwitcherModifierTimerEventReason" reason:v9];
    uint64_t v11 = SBAppendSwitcherModifierResponse(v10, v3);

    v3 = (void *)v11;
  }
  return v3;
}

- (id)transitionDidEnd
{
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v9 transitionDidEnd];
  if (!self->_toFloatingAppLayout)
  {
    v4 = [SBAddModifierSwitcherEventResponse alloc];
    v5 = objc_alloc_init(SBSlideOverAppsInFullScreenSwitcherSwitcherModifier);
    double v6 = [(SBAddModifierSwitcherEventResponse *)v4 initWithModifier:v5 level:3];

    uint64_t v7 = SBAppendSwitcherModifierResponse(v6, v3);

    v3 = (void *)v7;
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  double v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"SBFullScreenToPeekSwitcherModifierTimerEventReason"];
  if (v4)
  {
    self->_animationPhase = 1;
    uint64_t v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v3 = self;
  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleSceneReadyEvent:v4];
  double v6 = objc_msgSend(v4, "appLayout", v10.receiver, v10.super_class);

  LODWORD(v3) = [(SBFullScreenToPeekSwitcherModifier *)v3 _isPeekingAppLayout:v6];
  if (v3)
  {
    uint64_t v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleResizeProgressEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v11 handleResizeProgressEvent:v4];
  objc_msgSend(v4, "progress", v11.receiver, v11.super_class);

  double v6 = [(SBFullScreenToPeekSwitcherModifier *)self medusaSettings];
  [v6 dropAnimationUnblurThresholdPercentage];
  int v7 = BSFloatGreaterThanOrEqualToFloat();

  if (v7)
  {
    self->_resizedEnoughToUnblur = 1;
    uint64_t v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
    uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

    v5 = (void *)v9;
  }
  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v5 = [(SBFullScreenToPeekSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]
    && [(SBFullScreenToPeekSwitcherModifier *)self _isPeekingAppLayout:v6]
    && [v6 environment] == 2
    && !self->_animationPhase)
  {
    v20.receiver = self;
    v20.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v20 frameForIndex:a3];
    [(SBFullScreenToPeekSwitcherModifier *)self _firstStageFrameForPeekingAppLayoutWithInitialFrame:"_firstStageFrameForPeekingAppLayoutWithInitialFrame:"];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v19 frameForIndex:a3];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]
    && [(SBFullScreenToPeekSwitcherModifier *)self _isPeekingAppLayout:v11]
    && [v11 environment] != 2
    && !self->_animationPhase)
  {
    v25.receiver = self;
    v25.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v25, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    [(SBFullScreenToPeekSwitcherModifier *)self _firstStageFrameForPeekingAppLayoutWithInitialFrame:"_firstStageFrameForPeekingAppLayoutWithInitialFrame:"];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    -[SBFullScreenToPeekSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v24, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  }
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;

  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)_firstStageFrameForPeekingAppLayoutWithInitialFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  int64_t peekConfiguration = self->_peekConfiguration;
  int v8 = [(SBFullScreenToPeekSwitcherModifier *)self isRTLEnabled];
  uint64_t v9 = 2;
  if (v8) {
    uint64_t v9 = 3;
  }
  if (peekConfiguration == v9)
  {
    double v10 = 0.0;
    double v11 = -1.0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v18 switcherViewBounds];
    double v10 = v12 - width;
    double v11 = 1.0;
  }
  [(SBFullScreenToPeekSwitcherModifier *)self _firstPhaseScale];
  double v14 = v10 + (width * (1.0 - v13) * 0.5 + -12.0) * v11;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]
    && [(SBFullScreenToPeekSwitcherModifier *)self _isPeekingAppLayout:v6]
    && !self->_animationPhase)
  {
    [(SBFullScreenToPeekSwitcherModifier *)self _firstPhaseScale];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v10 scaleForLayoutRole:a3 inAppLayout:v6];
  }
  double v8 = v7;

  return v8;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v7 cornerRadiiForIndex:a3];
  }
  else
  {
    [(SBFullScreenToPeekSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (double)homeScreenAlpha
{
  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v7 homeScreenAlpha];
  }
  else
  {
    double v3 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
    double v4 = [v3 animationSettings];
    [v4 homeScreenOpacityInApplication];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)homeScreenScale
{
  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v7 homeScreenScale];
  }
  else
  {
    double v3 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
    double v4 = [v3 animationSettings];
    [v4 homeScreenScaleInApplication];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)homeScreenDimmingAlpha
{
  if (self->_animationPhase)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v8 homeScreenDimmingAlpha];
    return v2;
  }
  else
  {
    double v4 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
    double v5 = [v4 animationSettings];
    [v5 dimmingAlphaInApplication];
    double v3 = v6 * 0.5;
  }
  return v3;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (double)homeScreenBackdropBlurProgress
{
  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v7 homeScreenBackdropBlurProgress];
  }
  else
  {
    double v3 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
    double v4 = [v3 animationSettings];
    [v4 homeScreenBlurInApplication];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)wallpaperScale
{
  if (self->_animationPhase)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
    [(SBFullScreenToPeekSwitcherModifier *)&v7 wallpaperScale];
  }
  else
  {
    double v3 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
    double v4 = [v3 animationSettings];
    [v4 wallpaperScaleInApplication];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (BOOL)isContainerStatusBarVisible
{
  if (!self->_animationPhase) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  return [(SBFullScreenToPeekSwitcherModifier *)&v3 isContainerStatusBarVisible];
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 1;
}

- (id)keyboardSuppressionMode
{
  double v2 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v3 = [(SBFullScreenToPeekSwitcherModifier *)self appLayouts];
  double v4 = [v2 setWithArray:v3];
  id v5 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:v4];

  [v5 setApplyAssertionEvenIfAppIsHostingTheKeyboard:1];
  return v5;
}

- (double)dockProgress
{
  return 1.0;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 1;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  [(SBFullScreenToPeekSwitcherModifier *)self homeScreenWindowLevel];
  return v2 + -0.5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  id v6 = a4;
  objc_super v7 = [(SBFullScreenToPeekSwitcherModifier *)&v16 resizeProgressNotificationsForLayoutRole:a3 inAppLayout:v6];
  BOOL v8 = -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](self, "_isPeekingAppLayout:", v6, v16.receiver, v16.super_class);

  if (v8)
  {
    uint64_t v9 = [(SBFullScreenToPeekSwitcherModifier *)self medusaSettings];
    [v9 dropAnimationUnblurThresholdPercentage];
    double v11 = v10;

    v17[0] = &unk_1F3348CF8;
    double v12 = [NSNumber numberWithDouble:v11];
    v17[1] = v12;
    v17[2] = &unk_1F3348D08;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    uint64_t v14 = [v7 setByAddingObjectsFromArray:v13];

    objc_super v7 = (void *)v14;
  }
  return v7;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = self;
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  id v6 = a4;
  LOBYTE(a3) = [(SBFullScreenToPeekSwitcherModifier *)&v8 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  LOBYTE(v5) = -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](v5, "_isPeekingAppLayout:", v6, v8.receiver, v8.super_class);

  return v5 | a3;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  unsigned __int8 v7 = [(SBFullScreenToPeekSwitcherModifier *)&v9 isLayoutRoleBlurred:a3 inAppLayout:v6];
  if ([(SBFullScreenToPeekSwitcherModifier *)self _isPeekingAppLayout:v6])
  {
    if ([(SBFullScreenToPeekSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6])unsigned __int8 v7 = !self->_resizedEnoughToUnblur; {
    else
    }
      unsigned __int8 v7 = 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  id v6 = a4;
  [(SBFullScreenToPeekSwitcherModifier *)&v13 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  LODWORD(a3) = -[SBFullScreenToPeekSwitcherModifier _isPeekingAppLayout:](self, "_isPeekingAppLayout:", v6, v13.receiver, v13.super_class);

  if (a3)
  {
    objc_super v9 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
    double v10 = [v9 animationSettings];
    [v10 resizeBlurDelay];
    double v8 = v11;
  }
  return v8;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenToPeekSwitcherModifier;
  double v4 = [(SBTransitionSwitcherModifier *)&v11 animationAttributesForLayoutElement:a3];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [(SBFullScreenToPeekSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];

  if ([v7 performTwoPhaseFullScreenToPeekTransition])
  {
    if (self->_animationPhase) {
      [v7 fullScreenToPeekSecondPhaseAnimationSettings];
    }
    else {
    uint64_t v8 = [v7 fullScreenToPeekFirstPhaseAnimationSettings];
    }
  }
  else
  {
    uint64_t v8 = [v7 zoomUpSettings];
  }
  objc_super v9 = (void *)v8;
  [v5 setLayoutSettings:v8];

  return v5;
}

- (double)_firstPhaseScale
{
  [(SBFullScreenToPeekSwitcherModifier *)self containerViewBounds];
  return (v2 + -24.0) / v2;
}

- (BOOL)_isPeekingAppLayout:(id)a3
{
  double v4 = (SBAppLayout *)a3;
  toAppLayout = self->_toAppLayout;
  if (toAppLayout && self->_toFloatingAppLayout)
  {
    BOOL v6 = toAppLayout == v4;
  }
  else
  {
    if (toAppLayout == v4)
    {
      BOOL v7 = 1;
      goto LABEL_10;
    }
    BOOL v6 = self->_toFloatingAppLayout == v4;
  }
  BOOL v7 = v6;
LABEL_10:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fromFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end