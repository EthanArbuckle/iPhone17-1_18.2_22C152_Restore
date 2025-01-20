@interface SBRevealContinuousExposeStripsGestureModifier
- (SBAppLayout)initialAppLayout;
- (SBRevealContinuousExposeStripsGestureModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)continuousExposeStripProgress;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
@end

@implementation SBRevealContinuousExposeStripsGestureModifier

- (SBRevealContinuousExposeStripsGestureModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  v9 = [(SBGestureSwitcherModifier *)&v12 initWithGestureID:a3];
  if (v9)
  {
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBRevealContinuousExposeStripsGestureModifier.m", 29, @"Invalid parameter not satisfying: %@", @"initialAppLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_initialAppLayout, a4);
  }

  return v9;
}

- (double)continuousExposeStripProgress
{
  return self->_progress;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  v5 = [(SBRevealContinuousExposeStripsGestureModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_initialAppLayout])
  {
    [(SBRevealContinuousExposeStripsGestureModifier *)self displayCornerRadius];
    if (v7 == 0.0)
    {
      id v8 = [(SBRevealContinuousExposeStripsGestureModifier *)self chamoisLayoutAttributes];
      [v8 stageCornerRadii];
    }
    [(SBRevealContinuousExposeStripsGestureModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
    [(SBRevealContinuousExposeStripsGestureModifier *)&v21 cornerRadiiForIndex:a3];
  }
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.topRight = v20;
  result.bottomRight = v19;
  result.bottomLeft = v18;
  result.topLeft = v17;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  v19.receiver = self;
  v19.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  -[SBRevealContinuousExposeStripsGestureModifier shadowOpacityForLayoutRole:atIndex:](&v19, sel_shadowOpacityForLayoutRole_atIndex_, a3);
  double v7 = v6;
  id v8 = [(SBRevealContinuousExposeStripsGestureModifier *)self appLayouts];
  double v9 = [v8 objectAtIndex:a4];

  if ([v9 isEqual:self->_initialAppLayout])
  {
    v18.receiver = self;
    v18.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
    [(SBRevealContinuousExposeStripsGestureModifier *)&v18 frameForIndex:a4];
    double v11 = v10;
    double v13 = v12;
    [(SBRevealContinuousExposeStripsGestureModifier *)self containerViewBounds];
    if (v11 == v15 && v13 == v14) {
      double v7 = fmin(fmax(v7 * self->_progress + 0.0, 0.0), 1.0);
    }
  }

  return v7;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  id v3 = a3;
  v4 = [(SBGestureSwitcherModifier *)&v9 animationAttributesForLayoutElement:v3];
  v5 = objc_msgSend(v4, "mutableCopy", v9.receiver, v9.super_class);

  uint64_t v6 = [v3 switcherLayoutElementType];
  if (!v6)
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    [v7 setTrackingResponse:0.15];
    [v7 setTrackingDampingRatio:0.85];
    CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v7, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);
    [v5 setLayoutSettings:v7];
    [v5 setPositionSettings:v7];
    [v5 setOpacitySettings:v7];
    [v5 setUpdateMode:5];
  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  v5 = [(SBGestureSwitcherModifier *)&v21 handleGestureEvent:v4];
  int v6 = [v4 isIndirectPanGestureEvent];
  [(SBRevealContinuousExposeStripsGestureModifier *)self isRTLEnabled];
  [v4 translationInContainerView];
  double v7 = [(SBRevealContinuousExposeStripsGestureModifier *)self chamoisLayoutAttributes];
  [v7 stripWidth];

  long long v20 = 0u;
  BYTE8(v20) = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  self->_progress = v8;
  if (objc_msgSend(v4, "phase", 0, *((void *)&v20 + 1), 0x3FF0000000000000, 1) == 3)
  {
    if (v6)
    {
      uint64_t v9 = [v4 indirectPanEndReason];
      if ([v4 isCanceled])
      {
        if (v9 != 5)
        {
LABEL_12:
          double v10 = [SBUpdateContinuousExposeStripsPresentationResponse alloc];
          uint64_t v11 = 0;
          uint64_t v12 = 1;
          goto LABEL_13;
        }
      }
      else if (v9 != 3 && (BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
      {
        goto LABEL_12;
      }
    }
    else if (([v4 isCanceled] & 1) != 0 || !BSFloatGreaterThanOrEqualToFloat())
    {
      goto LABEL_12;
    }
    double v10 = [SBUpdateContinuousExposeStripsPresentationResponse alloc];
    uint64_t v11 = 1;
    uint64_t v12 = 0;
LABEL_13:
    double v13 = [(SBUpdateContinuousExposeStripsPresentationResponse *)v10 initWithPresentationOptions:v11 dismissalOptions:v12];
    double v14 = SBAppendSwitcherModifierResponse(v13, v5);

    double v15 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:3];
    double v16 = SBAppendSwitcherModifierResponse(v15, v14);

    double v17 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:self->_initialAppLayout];
    objc_super v18 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v17 gestureInitiated:1];
    v5 = SBAppendSwitcherModifierResponse(v18, v16);
  }
  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  id v4 = a3;
  v5 = [(SBGestureSwitcherModifier *)&v8 handleTransitionEvent:v4];
  unint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (void).cxx_destruct
{
}

@end