@interface SBSceneResizeGestureSwitcherModifier
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBSceneResizeGestureSwitcherModifier)initWithGestureID:(id)a3 appLayout:(id)a4 spaceConfiguration:(int64_t)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_maxCardWidthForDismissalAction;
- (double)_minimumCardWidthForDismissalAction;
- (double)_normalizedDismissLeftProgress;
- (double)_normalizedDismissRightProgress;
- (double)_normalizedHalfHalfProgress;
- (double)_normalizedHorizontalLocationWithProjection:(BOOL)a3;
- (double)_normalizedNarrowWideProgress;
- (double)_normalizedPeekDismissLeftProgress;
- (double)_normalizedPeekDismissRightProgress;
- (double)_normalizedProgressBetweenHalfHalfAndWideNarrow;
- (double)_normalizedProgressBetweenNarrowWideAndHalfHalf;
- (double)_normalizedWideNarrowProgress;
- (double)_rubberbandingRange;
- (double)_switcherWidth;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_appLayoutForAction:(int64_t)a3;
- (id)_handleGestureEventBeganWithEvent:(id)a3;
- (id)_handleGestureEventChangedWithEvent:(id)a3;
- (id)_handleGestureEventEndedWithEvent:(id)a3;
- (id)_responseForGestureUpdateWithPause:(BOOL)a3 gestureIsEnding:(BOOL)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3;
- (int64_t)_actionForNormalizedProgress:(double)a3 inOrientation:(int64_t)a4;
- (int64_t)_configurationForFinalResizeAction:(int64_t)a3;
- (int64_t)_currentActionWithProjection:(BOOL)a3;
- (int64_t)_currentPresentationAction;
- (int64_t)_presentationActionForNormalizedProgress:(double)a3;
- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (void)_beginAnimatingRampingProperty;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBSceneResizeGestureSwitcherModifier

- (SBSceneResizeGestureSwitcherModifier)initWithGestureID:(id)a3 appLayout:(id)a4 spaceConfiguration:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  v10 = [(SBGestureSwitcherModifier *)&v13 initWithGestureID:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a4);
    v11->_startingSpaceConfiguration = a5;
  }

  return v11;
}

- (void)didMoveToParentModifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v12, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [(SBSceneResizeGestureSwitcherModifier *)self appLayouts];
    uint64_t v6 = [v5 indexOfObject:self->_appLayout];
    v11.receiver = self;
    v11.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    [(SBSceneResizeGestureSwitcherModifier *)&v11 frameForIndex:v6];
    self->_initialSpaceFrame.origin.x = v7;
    self->_initialSpaceFrame.origin.y = v8;
    self->_initialSpaceFrame.size.width = v9;
    self->_initialSpaceFrame.size.height = v10;
  }
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  v4 = [(SBGestureSwitcherModifier *)&v17 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(SBSceneResizeGestureSwitcherModifier *)self medusaSettings];
  CGFloat v7 = [v6 medusaAnimationSettings];

  [v5 setScaleSettings:v7];
  [v5 setOpacitySettings:v7];
  [v5 setCornerRadiusSettings:v7];
  uint64_t v8 = 1;
  [v5 setUpdateMode:1];
  [v5 setOpacityUpdateMode:3];
  [v5 setScaleUpdateMode:3];
  [v5 setCornerRadiusUpdateMode:2];
  CGFloat v9 = self->_rampedLayoutSettings;
  rampingProperty = self->_rampingProperty;
  if (rampingProperty)
  {
    [(UIViewFloatAnimatableProperty *)rampingProperty presentationValue];
    if (BSFloatIsOne())
    {
      uint64_t v8 = 1;
    }
    else
    {
      [(UIViewFloatAnimatableProperty *)self->_rampingProperty presentationValue];
      double v12 = v11;
      [v7 trackingResponse];
      double v14 = v12 * (0.0 - v13);
      [v7 trackingResponse];
      [(SBFFluidBehaviorSettings *)v9 setTrackingResponse:v15 + v14];
      uint64_t v8 = 5;
    }
  }
  [v5 setLayoutSettings:v9];
  [v5 setPositionSettings:v9];
  [v5 setLayoutUpdateMode:v8];
  [v5 setPositionUpdateMode:v8];

  return v5;
}

- (void)_beginAnimatingRampingProperty
{
  v3 = [(SBSceneResizeGestureSwitcherModifier *)self medusaSettings];
  v4 = [v3 medusaAnimationSettings];

  v5 = (SBFFluidBehaviorSettings *)[v4 copy];
  rampedLayoutSettings = self->_rampedLayoutSettings;
  self->_rampedLayoutSettings = v5;

  rampingProperty = self->_rampingProperty;
  if (rampingProperty)
  {
    [(UIViewFloatAnimatableProperty *)rampingProperty invalidate];
    uint64_t v8 = self->_rampingProperty;
    self->_rampingProperty = 0;
  }
  CGFloat v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  CGFloat v10 = self->_rampingProperty;
  self->_rampingProperty = v9;

  [(UIViewFloatAnimatableProperty *)self->_rampingProperty setValue:0.0];
  objc_initWeak(&location, self);
  double v11 = self->_rampingProperty;
  double v12 = (void *)MEMORY[0x1E4F42FF0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__SBSceneResizeGestureSwitcherModifier__beginAnimatingRampingProperty__block_invoke;
  v17[3] = &unk_1E6AF4AC0;
  v17[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__SBSceneResizeGestureSwitcherModifier__beginAnimatingRampingProperty__block_invoke_2;
  v14[3] = &unk_1E6AFBE70;
  objc_copyWeak(&v16, &location);
  double v13 = v11;
  double v15 = v13;
  objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", v4, 3, v17, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __70__SBSceneResizeGestureSwitcherModifier__beginAnimatingRampingProperty__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 184) setValue:1.0];
}

void __70__SBSceneResizeGestureSwitcherModifier__beginAnimatingRampingProperty__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v3 = WeakRetained[23];
    v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      id v5 = v6[23];
      v6[23] = 0;
    }
    WeakRetained = v6;
  }
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  unsigned int v7 = [(SBSceneResizeGestureSwitcherModifier *)&v9 isLayoutRoleBlurred:a3 inAppLayout:v6];
  if (([(SBSceneResizeGestureSwitcherModifier *)self isChamoisWindowingUIEnabled] & 1) == 0) {
    v7 |= [v6 isOrContainsAppLayout:self->_appLayout];
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  appLayout = self->_appLayout;
  id v9 = a4;
  if (![(SBAppLayout *)appLayout isOrContainsAppLayout:v9])
  {
    v18.receiver = self;
    v18.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    [(SBSceneResizeGestureSwitcherModifier *)&v18 opacityForLayoutRole:a3 inAppLayout:v9 atIndex:a5];
LABEL_10:
    double v14 = v15;

    return v14;
  }
  v17.receiver = self;
  v17.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  [(SBSceneResizeGestureSwitcherModifier *)&v17 opacityForLayoutRole:a3 inAppLayout:v9 atIndex:a5];

  uint64_t v10 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  double v11 = &SBLayoutRolePrimary;
  if (v10 == 1) {
    double v11 = &SBLayoutRoleSide;
  }
  uint64_t v12 = *v11;
  int64_t v13 = [(SBSceneResizeGestureSwitcherModifier *)self _currentPresentationAction];
  double v14 = 1.0;
  if (v12 == a3)
  {
    if (v13 != 1) {
      return v14;
    }
    goto LABEL_9;
  }
  if (v13 == 7)
  {
LABEL_9:
    id v9 = [(SBSceneResizeGestureSwitcherModifier *)self medusaSettings];
    [v9 resizeAnimationDismissItemOpacity];
    goto LABEL_10;
  }
  return v14;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  appLayout = self->_appLayout;
  id v13 = a4;
  if ([(SBAppLayout *)appLayout isOrContainsAppLayout:v13])
  {
    v59.receiver = self;
    v59.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v59, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v13, x, y, width, height);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v58 = v20;

    [(SBSceneResizeGestureSwitcherModifier *)self _switcherWidth];
    double v22 = v21;
    int v23 = [(SBSceneResizeGestureSwitcherModifier *)self isRTLEnabled];
    int64_t v24 = [(SBSceneResizeGestureSwitcherModifier *)self _currentPresentationAction];
    double v25 = self->_location.x;
    [(SBSceneResizeGestureSwitcherModifier *)self separatorViewWidth];
    double v57 = v26 * 0.5;
    [(SBSceneResizeGestureSwitcherModifier *)self _rubberbandingRange];
    [(SBSceneResizeGestureSwitcherModifier *)self _minimumCardWidthForDismissalAction];
    double v28 = v27;
    [(SBSceneResizeGestureSwitcherModifier *)self _maxCardWidthForDismissalAction];
    if ([(SBSceneResizeGestureSwitcherModifier *)self isChamoisWindowingUIEnabled])
    {
      switch(v24)
      {
        case 0:
          v44 = [MEMORY[0x1E4F28B00] currentHandler];
          [v44 handleFailureInMethod:a2 object:self file:@"SBSceneResizeGestureSwitcherModifier.m" lineNumber:239 description:@"Should get a valid presentation action"];

          goto LABEL_24;
        case 1:
        case 2:
          BSUIConstrainValueToIntervalWithRubberBand();
          double v15 = v25 - v28;
          double v19 = v28;
          double v25 = v22 - v42;
          double v28 = v42;
          break;
        case 3:
        case 4:
        case 5:
          v29 = &OBJC_IVAR___SBSceneResizeGestureSwitcherModifier__startingFrameForPrimaryItem;
          if (v23) {
            v30 = &OBJC_IVAR___SBSceneResizeGestureSwitcherModifier__startingFrameForSideItem;
          }
          else {
            v30 = &OBJC_IVAR___SBSceneResizeGestureSwitcherModifier__startingFrameForPrimaryItem;
          }
          double v31 = *(double *)((char *)&self->super.super.super._queryCache + *v30);
          if (!v23) {
            v29 = &OBJC_IVAR___SBSceneResizeGestureSwitcherModifier__startingFrameForSideItem;
          }
          double v32 = v25 - v31;
          if (v25 - v31 >= 0.0) {
            double v15 = v25 - v31;
          }
          else {
            double v15 = 0.0;
          }
          if (v25 - v31 >= 0.0) {
            double v32 = -0.0;
          }
          double v19 = v31 + v32;
          if (v25 + *(double *)((char *)&self->super.super.super._queryCache + *v29) <= v22) {
            double v28 = *(double *)((char *)&self->super.super.super._queryCache + *v29);
          }
          else {
            double v28 = v22 - v25;
          }
          break;
        case 6:
        case 7:
          BSUIConstrainValueToIntervalWithRubberBand();
          double v19 = v43;
          double v15 = 0.0;
          break;
        default:
LABEL_24:
          double v25 = v15;
          double v28 = v19;
          break;
      }
      double v45 = v57;
      double v46 = v57 + v25;
      BOOL v47 = v23 == (a3 == 1);
    }
    else
    {
      double v56 = v17;
      double v17 = 0.0;
      double v39 = v25;
      switch(v24)
      {
        case 0:
          v48 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v25);
          [v48 handleFailureInMethod:a2 object:self file:@"SBSceneResizeGestureSwitcherModifier.m" lineNumber:303 description:@"Should get a valid presentation action"];

          double v25 = v15;
          double v28 = v19;
          goto LABEL_31;
        case 1:
        case 2:
          [(SBSceneResizeGestureSwitcherModifier *)self _switcherWidth];
          BSUIConstrainValueToIntervalWithRubberBand();
          double v41 = v40;
          double v17 = v25 - v28;
          double v39 = v28;
          double v25 = v22 - v41;
          double v28 = v41;
          goto LABEL_30;
        case 3:
          [(SBSceneResizeGestureSwitcherModifier *)self _switcherWidth];
          double v50 = v49;
          double v17 = v25 - v28;
          double v39 = v28;
          double v28 = v50 - v25;
          double v25 = v22 - (v50 - v25);
          goto LABEL_30;
        case 4:
          double v28 = v22 - v25;
          double v39 = v25;
          goto LABEL_30;
        case 5:
          goto LABEL_30;
        case 6:
        case 7:
          BSUIConstrainValueToIntervalWithRubberBand();
LABEL_30:
          double v15 = v17;
          double v19 = v39;
LABEL_31:
          double v17 = v56;
          break;
        default:
          double v25 = v15;
          double v28 = v19;
          break;
      }
      if (a3 == 1) {
        int v51 = v23;
      }
      else {
        int v51 = 1;
      }
      double v45 = v57;
      if (v51 != 1) {
        goto LABEL_43;
      }
      double v46 = v57 + v25;
      BOOL v47 = ((a3 == 2) & v23) == 0;
    }
    if (v47) {
      double v19 = v28;
    }
    if (v47) {
      double v15 = v46;
    }
LABEL_43:
    double v36 = v19 - v45;
    double v38 = v58;
    goto LABEL_44;
  }
  v60.receiver = self;
  v60.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBSceneResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v60, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v13, x, y, width, height);
  double v15 = v33;
  double v17 = v34;
  double v36 = v35;
  double v38 = v37;

LABEL_44:
  double v52 = v15;
  double v53 = v17;
  double v54 = v36;
  double v55 = v38;
  result.size.double height = v55;
  result.size.double width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = self;
  v8.receiver = self;
  v8.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  id v6 = a4;
  LOBYTE(a3) = [(SBSceneResizeGestureSwitcherModifier *)&v8 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  LOBYTE(v5) = objc_msgSend(v6, "isOrContainsAppLayout:", v5->_appLayout, v8.receiver, v8.super_class);

  return v5 | a3;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  -[SBSceneResizeGestureSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_);
  double v6 = v5;
  unsigned int v7 = [(SBSceneResizeGestureSwitcherModifier *)self appLayouts];
  objc_super v8 = [v7 objectAtIndex:a3];

  if ([v8 isOrContainsAppLayout:self->_appLayout])
  {
    if (SBReduceMotion()) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.98;
    }
  }

  return v6;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  appLayout = self->_appLayout;
  double v6 = [(SBSceneResizeGestureSwitcherModifier *)self appLayouts];
  unsigned int v7 = [v6 objectAtIndex:a3];
  LOBYTE(appLayout) = [(SBAppLayout *)appLayout isOrContainsAppLayout:v7];

  if (appLayout)
  {
    [(SBSceneResizeGestureSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    [(SBSceneResizeGestureSwitcherModifier *)&v12 cornerRadiiForIndex:a3];
  }
  result.topRight = v11;
  result.bottomRight = v10;
  result.bottomLeft = v9;
  result.topLeft = v8;
  return result;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 14;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBSceneResizeGestureSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_appLayout)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    BOOL v7 = [(SBSceneResizeGestureSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  v4 = [(SBSceneResizeGestureSwitcherModifier *)&v12 resizeGrabberLayoutAttributesForAppLayout:a3];
  int64_t v5 = [(SBSceneResizeGestureSwitcherModifier *)self _currentPresentationAction];
  if ((unint64_t)(v5 - 1) < 2)
  {
    double v6 = &SBLayoutRolePrimary;
    BOOL v7 = &SBLayoutRoleSide;
    uint64_t v8 = 8;
LABEL_5:
    if ([(SBSceneResizeGestureSwitcherModifier *)self isRTLEnabled]) {
      objc_super v9 = v7;
    }
    else {
      objc_super v9 = v6;
    }
    double v10 = [(SBAppLayout *)self->_appLayout leafAppLayoutForRole:*v9];
    [v4 setLeafAppLayout:v10];

    [v4 setEdge:v8];
    goto LABEL_9;
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    double v6 = &SBLayoutRoleSide;
    BOOL v7 = &SBLayoutRolePrimary;
    uint64_t v8 = 2;
    goto LABEL_5;
  }
LABEL_9:
  return v4;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4 = a3;
  if (-[SBSceneResizeGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))char v5 = [v4 isOrContainsAppLayout:self->_appLayout]; {
  else
  }
    char v5 = 0;

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  id v4 = a3;
  char v5 = [(SBGestureSwitcherModifier *)&v8 handleTransitionEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 == 2) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  uint64_t v6 = [(SBGestureSwitcherModifier *)&v19 handleGestureEvent:v5];
  [v5 locationInContainerView];
  CGFloat v9 = v8 - self->_initialSpaceFrame.origin.y;
  self->_location.double x = v7 - self->_initialSpaceFrame.origin.x;
  self->_location.double y = v9;
  [v5 translationInContainerView];
  self->_translation.double x = v10;
  self->_translation.double y = v11;
  [v5 velocityInContainerView];
  self->_velocity.double x = v12;
  self->_velocity.double y = v13;
  switch([v5 phase])
  {
    case 0:
      if (![v5 phase])
      {
        double v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:self file:@"SBSceneResizeGestureSwitcherModifier.m" lineNumber:473 description:@"Should not get PhasePossible."];
      }
      goto LABEL_4;
    case 1:
      uint64_t v15 = [(SBSceneResizeGestureSwitcherModifier *)self _handleGestureEventBeganWithEvent:v5];
      goto LABEL_8;
    case 2:
      uint64_t v15 = [(SBSceneResizeGestureSwitcherModifier *)self _handleGestureEventChangedWithEvent:v5];
      goto LABEL_8;
    case 3:
      uint64_t v15 = [(SBSceneResizeGestureSwitcherModifier *)self _handleGestureEventEndedWithEvent:v5];
LABEL_8:
      double v14 = (void *)v15;
      break;
    default:
LABEL_4:
      double v14 = 0;
      break;
  }
  double v16 = +[SBChainableModifierEventResponse responseByAppendingResponse:v14 toResponse:v6];

  return v16;
}

- (id)_handleGestureEventBeganWithEvent:(id)a3
{
  [(SBSceneResizeGestureSwitcherModifier *)self _beginAnimatingRampingProperty];
  if ([(SBSceneResizeGestureSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    appLayout = self->_appLayout;
    [(SBSceneResizeGestureSwitcherModifier *)self containerViewBounds];
    v16.receiver = self;
    v16.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v16, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, appLayout);
    self->_startingFrameForPrimaryItem.origin.double x = v5;
    self->_startingFrameForPrimaryItem.origin.double y = v6;
    self->_startingFrameForPrimaryItem.size.double width = v7;
    self->_startingFrameForPrimaryItem.size.double height = v8;
    CGFloat v9 = self->_appLayout;
    [(SBSceneResizeGestureSwitcherModifier *)self containerViewBounds];
    v15.receiver = self;
    v15.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
    -[SBSceneResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v15, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v9);
    self->_startingFrameForSideItem.origin.double x = v10;
    self->_startingFrameForSideItem.origin.double y = v11;
    self->_startingFrameForSideItem.size.double width = v12;
    self->_startingFrameForSideItem.size.double height = v13;
  }
  return 0;
}

- (id)_handleGestureEventChangedWithEvent:(id)a3
{
  id v4 = a3;
  if ([(SBSceneResizeGestureSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    [v4 translationInContainerView];
    self->_translation.double x = v5;
    self->_translation.double y = v6;
    if ([v4 phase] == 1) {
      self->_lastTranslationThatUpdatedScene = (CGPoint)SBInvalidPoint;
    }
    CGFloat v7 = -[SBSceneResizeGestureSwitcherModifier _responseForGestureUpdateWithPause:gestureIsEnding:](self, "_responseForGestureUpdateWithPause:gestureIsEnding:", 0, [v4 phase] == 3);
    CGFloat v8 = SBAppendSwitcherModifierResponse(v7, 0);

    CGFloat v9 = (void *)(self->_timerGenCount + 1);
    self->_timerGenCount = (unint64_t)v9;
    objc_initWeak(&location, self);
    CGFloat v10 = [(SBSceneResizeGestureSwitcherModifier *)self switcherSettings];
    [v10 liveResizeSceneUpdateTimeThresholdSeconds];
    double v12 = v11;

    CGFloat v13 = [SBTimerEventSwitcherEventResponse alloc];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__SBSceneResizeGestureSwitcherModifier__handleGestureEventChangedWithEvent___block_invoke;
    v17[3] = &unk_1E6B0E338;
    objc_copyWeak(v18, &location);
    v18[1] = v9;
    double v14 = [(SBTimerEventSwitcherEventResponse *)v13 initWithDelay:v17 validator:@"kSBLiveSceneResizeTimerReason" reason:v12];
    objc_super v15 = SBAppendSwitcherModifierResponse(v14, v8);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

BOOL __76__SBSceneResizeGestureSwitcherModifier__handleGestureEventChangedWithEvent___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained parentModifier];
    if (v4) {
      BOOL v5 = v3[37] == *(void *)(a1 + 40);
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSceneResizeGestureSwitcherModifier;
  id v4 = a3;
  BOOL v5 = [(SBSwitcherModifier *)&v11 handleTimerEvent:v4];
  CGFloat v6 = objc_msgSend(v4, "reason", v11.receiver, v11.super_class);

  LODWORD(v4) = [v6 isEqual:@"kSBLiveSceneResizeTimerReason"];
  if (v4)
  {
    CGFloat v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
    CGFloat v8 = SBAppendSwitcherModifierResponse(v7, v5);

    CGFloat v9 = [(SBSceneResizeGestureSwitcherModifier *)self _responseForGestureUpdateWithPause:1 gestureIsEnding:0];
    BOOL v5 = SBAppendSwitcherModifierResponse(v9, v8);
  }
  return v5;
}

- (id)_handleGestureEventEndedWithEvent:(id)a3
{
  id v4 = [(SBSceneResizeGestureSwitcherModifier *)self _appLayoutForAction:[(SBSceneResizeGestureSwitcherModifier *)self _currentActionWithProjection:1]];
  BOOL v5 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  [(SBSwitcherTransitionRequest *)v5 setAppLayout:v4];
  [(SBSwitcherTransitionRequest *)v5 setUnlockedEnvironmentMode:3];
  [(SBSwitcherTransitionRequest *)v5 setPreferredInterfaceOrientation:[(SBSceneResizeGestureSwitcherModifier *)self switcherInterfaceOrientation]];
  CGFloat v6 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v5 gestureInitiated:1];

  return v6;
}

- (id)_appLayoutForAction:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_opt_new();
  int v6 = [(SBSceneResizeGestureSwitcherModifier *)self isRTLEnabled];
  if (v6) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v6) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t v9 = [(SBAppLayout *)self->_appLayout itemForLayoutRole:v7];
  uint64_t v10 = [(SBAppLayout *)self->_appLayout itemForLayoutRole:v8];
  double v28 = (void *)v10;
  if ((unint64_t)(a3 - 2) >= 3)
  {
    if (a3 == 5)
    {
      double v12 = [NSNumber numberWithInteger:1];
      CGFloat v13 = v5;
      double v14 = (void *)v9;
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_14;
      }
      uint64_t v15 = v10;
      double v12 = [NSNumber numberWithInteger:1];
      CGFloat v13 = v5;
      double v14 = (void *)v15;
    }
  }
  else
  {
    objc_super v11 = [NSNumber numberWithInteger:v7];
    [v5 setObject:v9 forKey:v11];

    double v12 = [NSNumber numberWithInteger:v8];
    CGFloat v13 = v5;
    double v14 = v28;
  }
  [v13 setObject:v14 forKey:v12];

LABEL_14:
  double v27 = (void *)v9;
  int64_t v26 = [(SBSceneResizeGestureSwitcherModifier *)self _configurationForFinalResizeAction:a3];
  objc_super v16 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v17 = [v5 allValues];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        int v23 = [(SBAppLayout *)self->_appLayout layoutAttributesForItem:v22];
        [v16 setObject:v23 forKey:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v19);
  }

  int64_t v24 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v5 configuration:v26 itemsToLayoutAttributes:v16 centerConfiguration:0 environment:1 hidden:0 preferredDisplayOrdinal:[(SBSceneResizeGestureSwitcherModifier *)self displayOrdinal]];
  return v24;
}

- (int64_t)_configurationForFinalResizeAction:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      int v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"SBSceneResizeGestureSwitcherModifier.m" lineNumber:617 description:@"Shouldn't receive a final resize action of None"];

      int64_t result = 0;
      break;
    case 1:
    case 5:
      int64_t result = 1;
      break;
    case 2:
      BOOL v7 = [(SBSceneResizeGestureSwitcherModifier *)self isRTLEnabled] == 0;
      int64_t v8 = 2;
      int64_t v9 = 4;
      goto LABEL_7;
    case 3:
      int64_t result = 3;
      break;
    case 4:
      BOOL v7 = [(SBSceneResizeGestureSwitcherModifier *)self isRTLEnabled] == 0;
      int64_t v8 = 4;
      int64_t v9 = 2;
LABEL_7:
      if (v7) {
        int64_t result = v8;
      }
      else {
        int64_t result = v9;
      }
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (int64_t)_currentActionWithProjection:(BOOL)a3
{
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedHorizontalLocationWithProjection:a3];
  double v5 = v4;
  uint64_t v6 = [(SBSceneResizeGestureSwitcherModifier *)self switcherInterfaceOrientation];
  return [(SBSceneResizeGestureSwitcherModifier *)self _actionForNormalizedProgress:v6 inOrientation:v5];
}

- (int64_t)_currentPresentationAction
{
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedHorizontalLocationWithProjection:0];
  return -[SBSceneResizeGestureSwitcherModifier _presentationActionForNormalizedProgress:](self, "_presentationActionForNormalizedProgress:");
}

- (int64_t)_presentationActionForNormalizedProgress:(double)a3
{
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedDismissLeftProgress];
  double v6 = v5;
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedDismissRightProgress];
  double v8 = v7;
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedPeekDismissLeftProgress];
  double v10 = v9;
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedPeekDismissRightProgress];
  double v12 = v11;
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedNarrowWideProgress];
  double v14 = v13;
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedWideNarrowProgress];
  if (v6 >= a3) {
    return 1;
  }
  if (v10 >= a3) {
    return 2;
  }
  int64_t v16 = 4;
  uint64_t v17 = 5;
  uint64_t v18 = 6;
  if (v8 < a3) {
    uint64_t v18 = 7;
  }
  if (v12 < a3) {
    uint64_t v17 = v18;
  }
  if (v15 < a3) {
    int64_t v16 = v17;
  }
  if (v14 < a3) {
    return v16;
  }
  else {
    return 3;
  }
}

- (int64_t)_actionForNormalizedProgress:(double)a3 inOrientation:(int64_t)a4
{
  switch(-[SBSceneResizeGestureSwitcherModifier _presentationActionForNormalizedProgress:](self, "_presentationActionForNormalizedProgress:"))
  {
    case 0:
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBSceneResizeGestureSwitcherModifier.m" lineNumber:682 description:@"Should have a valid final presentation action"];

      goto LABEL_14;
    case 1:
      return 1;
    case 2:
    case 3:
      goto LABEL_12;
    case 4:
      [(SBSceneResizeGestureSwitcherModifier *)self _normalizedProgressBetweenNarrowWideAndHalfHalf];
      if (v9 >= a3)
      {
LABEL_12:
        int64_t result = 2;
      }
      else
      {
        [(SBSceneResizeGestureSwitcherModifier *)self _normalizedProgressBetweenHalfHalfAndWideNarrow];
        if (v10 <= a3) {
          int64_t result = 4;
        }
        else {
          int64_t result = 3;
        }
        if ((unint64_t)(a4 - 5) <= 0xFFFFFFFFFFFFFFFDLL && v10 > a3)
        {
          [(SBSceneResizeGestureSwitcherModifier *)self _normalizedHalfHalfProgress];
          if (v11 <= a3) {
            int64_t result = 4;
          }
          else {
            int64_t result = 2;
          }
        }
      }
      break;
    case 5:
    case 6:
      int64_t result = 4;
      break;
    case 7:
      int64_t result = 5;
      break;
    default:
LABEL_14:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes];
}

- (id)_responseForGestureUpdateWithPause:(BOOL)a3 gestureIsEnding:(BOOL)a4
{
  BOOL v4 = a4;
  p_lastTranslationThatUpdatedScene = &self->_lastTranslationThatUpdatedScene;
  double x = self->_lastTranslationThatUpdatedScene.x;
  double y = self->_lastTranslationThatUpdatedScene.y;
  p_translation = &self->_translation;
  CGFloat v11 = self->_translation.x;
  if (x == 1.79769313e308 && y == 1.79769313e308)
  {
    CGFloat v13 = self->_translation.y;
  }
  else
  {
    CGFloat v11 = x - v11;
    CGFloat v13 = y - self->_translation.y;
  }
  double v14 = hypot(v11, v13);
  double v15 = [(SBSceneResizeGestureSwitcherModifier *)self switcherSettings];
  [v15 liveResizeSceneUpdateDistanceThreshold];
  if (v14 > v16)
  {

    goto LABEL_13;
  }

  if (a3 || v4)
  {
LABEL_13:
    CGPoint *p_lastTranslationThatUpdatedScene = *p_translation;
    uint64_t v18 = [(SBSceneResizeGestureSwitcherModifier *)self _appLayoutForAction:[(SBSceneResizeGestureSwitcherModifier *)self _currentActionWithProjection:0]];
    uint64_t v19 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v18];
    [v19 setSceneUpdatesOnly:!v4];
    uint64_t v20 = [(SBSceneResizeGestureSwitcherModifier *)self switcherSettings];
    int v21 = [v20 liveResizeSendsAnimatedSceneSizeUpdates];

    if (v21)
    {
      uint64_t v22 = [(SBSceneResizeGestureSwitcherModifier *)self medusaSettings];
      int v23 = [v22 resizeAnimationSettings];
      [v19 setAnimationSettings:v23];
    }
    int64_t v24 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v19 gestureInitiated:1];
    uint64_t v17 = SBAppendSwitcherModifierResponse(v24, 0);

    if (v4) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v17 = 0;
  if (v4)
  {
LABEL_16:
    double v25 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v26 = SBAppendSwitcherModifierResponse(v25, v17);

    uint64_t v17 = (void *)v26;
  }
LABEL_17:
  return v17;
}

- (double)_normalizedHorizontalLocationWithProjection:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBSceneResizeGestureSwitcherModifier *)self _switcherWidth];
  double v6 = 0.05;
  if (!v3) {
    double v6 = 0.0;
  }
  return (self->_location.x + self->_velocity.x * v6) / v5 + 0.0;
}

- (double)_normalizedDismissLeftProgress
{
  [(SBSceneResizeGestureSwitcherModifier *)self switcherInterfaceOrientation];
  SBLayoutDefaultSideLayoutElementWidth();
  double v4 = v3 * 0.5;
  [(SBSceneResizeGestureSwitcherModifier *)self switcherViewBounds];
  return v4 / CGRectGetWidth(v6) * 0.5;
}

- (double)_normalizedDismissRightProgress
{
  [(SBSceneResizeGestureSwitcherModifier *)self switcherInterfaceOrientation];
  SBLayoutDefaultSideLayoutElementWidth();
  return v3 * 0.5 / CGRectGetWidth(self->_initialSpaceFrame) * 0.5;
}

- (double)_normalizedPeekDismissLeftProgress
{
  [(SBSceneResizeGestureSwitcherModifier *)self switcherInterfaceOrientation];
  SBLayoutDefaultSideLayoutElementWidth();
  double v4 = v3;
  [(SBSceneResizeGestureSwitcherModifier *)self separatorViewWidth];
  double v6 = v4 + v5 * 0.5;
  [(SBSceneResizeGestureSwitcherModifier *)self _switcherWidth];
  return v6 / v7 * 0.5;
}

- (double)_normalizedPeekDismissRightProgress
{
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedPeekDismissLeftProgress];
  return 1.0 - v2;
}

- (double)_normalizedNarrowWideProgress
{
  [(SBSceneResizeGestureSwitcherModifier *)self switcherInterfaceOrientation];
  SBLayoutDefaultSideLayoutElementWidth();
  double v4 = v3;
  [(SBSceneResizeGestureSwitcherModifier *)self _switcherWidth];
  return v4 / v5;
}

- (double)_normalizedProgressBetweenNarrowWideAndHalfHalf
{
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedHalfHalfProgress];
  double v4 = v3;
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedPeekDismissLeftProgress];
  return v4 + (v4 - v5) * -0.5;
}

- (double)_normalizedProgressBetweenHalfHalfAndWideNarrow
{
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedProgressBetweenNarrowWideAndHalfHalf];
  return 1.0 - v2;
}

- (double)_normalizedWideNarrowProgress
{
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedNarrowWideProgress];
  return 1.0 - v2;
}

- (double)_normalizedHalfHalfProgress
{
  return 0.5;
}

- (double)_minimumCardWidthForDismissalAction
{
  [(SBSceneResizeGestureSwitcherModifier *)self switcherInterfaceOrientation];
  SBLayoutDefaultSideLayoutElementWidth();
  return result;
}

- (double)_maxCardWidthForDismissalAction
{
  [(SBSceneResizeGestureSwitcherModifier *)self _normalizedPeekDismissLeftProgress];
  double v4 = 1.0 - v3;
  [(SBSceneResizeGestureSwitcherModifier *)self _switcherWidth];
  return v4 * v5;
}

- (double)_switcherWidth
{
  return self->_initialSpaceFrame.size.width;
}

- (double)_rubberbandingRange
{
  [(SBSceneResizeGestureSwitcherModifier *)self _switcherWidth];
  return v2 * 0.1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rampedLayoutSettings, 0);
  objc_storeStrong((id *)&self->_rampingProperty, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end