@interface SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier
- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4 fromAppLayout:(id)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (id)_updateLayoutWithAnimationUpdateMode:(int64_t)a3 appendResponse:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)transitionWillUpdate;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier

- (SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4 fromAppLayout:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v19 initWithTransitionID:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_toAppLayout, a4);
    objc_storeStrong((id *)&v12->_fromAppLayout, a5);
    v12->_animationPhase = 0;
    v13 = NSString;
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    uint64_t v16 = [v13 stringWithFormat:@"%@:%@", @"SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifierTimerEventReason", v15];
    timerReason = v12->_timerReason;
    v12->_timerReason = (NSString *)v16;
  }
  return v12;
}

- (void)didMoveToParentModifier:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v21, sel_didMoveToParentModifier_);
  if (a3)
  {
    v6 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self appLayouts];
    uint64_t v7 = [v6 indexOfObject:self->_toAppLayout];

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier.m" lineNumber:89 description:@"We must know about _toAppLayout"];
    }
    v20.receiver = self;
    v20.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v20 frameForIndex:v7];
    self->_toAppLayoutInitialFrame.origin.x = v8;
    self->_toAppLayoutInitialFrame.origin.y = v9;
    self->_toAppLayoutInitialFrame.size.width = v10;
    self->_toAppLayoutInitialFrame.size.height = v11;
    v19.receiver = self;
    v19.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v19 scaleForIndex:v7];
    self->_toAppLayoutInitialScale = v12;
    v18.receiver = self;
    v18.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v18 cornerRadiiForIndex:v7];
    self->_toAppLayoutInitialCornerRadius.topLeft = v13;
    self->_toAppLayoutInitialCornerRadius.bottomLeft = v14;
    self->_toAppLayoutInitialCornerRadius.bottomRight = v15;
    self->_toAppLayoutInitialCornerRadius.topRight = v16;
  }
}

- (id)transitionWillUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionWillUpdate];
  if (!self->_animationPhase)
  {
    v4 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:self->_timerReason reason:0.045];
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    v3 = (void *)v5;
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBTransitionSwitcherModifier *)&v14 handleTimerEvent:v4];
  v6 = objc_msgSend(v4, "reason", v14.receiver, v14.super_class);

  LODWORD(v4) = [v6 isEqualToString:self->_timerReason];
  if (v4)
  {
    switch(self->_animationPhase)
    {
      case 0:
        int64_t v7 = 1;
        goto LABEL_6;
      case 1:
        self->_animationPhase = 2;
        CGFloat v8 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:self->_timerReason reason:0.25];
        CGFloat v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v5];

        CGFloat v10 = self;
        uint64_t v11 = 3;
        goto LABEL_7;
      case 2:
        int64_t v7 = 3;
LABEL_6:
        self->_animationPhase = v7;
        CGFloat v8 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:self->_timerReason reason:0.01];
        CGFloat v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v5];

        CGFloat v10 = self;
        uint64_t v11 = 2;
LABEL_7:
        uint64_t v12 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)v10 _updateLayoutWithAnimationUpdateMode:v11 appendResponse:v9];

        uint64_t v5 = v8;
        goto LABEL_9;
      case 3:
        self->_animationPhase = 4;
        uint64_t v12 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self _updateLayoutWithAnimationUpdateMode:3 appendResponse:v5];
LABEL_9:

        uint64_t v5 = (void *)v12;
        break;
      default:
        break;
    }
  }
  return v5;
}

- (id)_updateLayoutWithAnimationUpdateMode:(int64_t)a3 appendResponse:(id)a4
{
  id v5 = a4;
  v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:a3];
  int64_t v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v5];

  return v7;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_fromAppLayout isEqual:v6] && self->_animationPhase <= 2)
  {
    int64_t v7 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v6];
    [v7 boundingBox];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
  }
  else if ([(SBAppLayout *)self->_toAppLayout isEqual:v6] && !self->_animationPhase)
  {
    CGFloat x = self->_toAppLayoutInitialFrame.origin.x;
    CGFloat y = self->_toAppLayoutInitialFrame.origin.y;
    CGFloat width = self->_toAppLayoutInitialFrame.size.width;
    CGFloat height = self->_toAppLayoutInitialFrame.size.height;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v24 frameForIndex:a3];
    CGFloat x = v16;
    CGFloat y = v17;
    CGFloat width = v18;
    CGFloat height = v19;
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_fromAppLayout isEqual:v6]) {
    goto LABEL_8;
  }
  int64_t animationPhase = self->_animationPhase;
  if (animationPhase <= 2)
  {
    double v8 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self switcherSettings];
    CGFloat v9 = [v8 animationSettings];
    [v9 crossblurDosidoLargeScale];
LABEL_12:
    double toAppLayoutInitialScale = v10;

    goto LABEL_13;
  }
  if (animationPhase == 3)
  {
    v17.receiver = self;
    v17.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v17 scaleForIndex:a3];
    double toAppLayoutInitialScale = v11 + -0.02;
  }
  else
  {
LABEL_8:
    if (![(SBAppLayout *)self->_toAppLayout isEqual:v6]) {
      goto LABEL_10;
    }
    int64_t v13 = self->_animationPhase;
    if (v13 == 1)
    {
      double v8 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self switcherSettings];
      CGFloat v9 = [v8 animationSettings];
      [v9 crossblurDosidoSmallScale];
      goto LABEL_12;
    }
    if (v13)
    {
LABEL_10:
      v16.receiver = self;
      v16.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v16 scaleForIndex:a3];
      double toAppLayoutInitialScale = v14;
    }
    else
    {
      double toAppLayoutInitialScale = self->_toAppLayoutInitialScale;
    }
  }
LABEL_13:

  return toAppLayoutInitialScale;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if (![(SBAppLayout *)self->_fromAppLayout isEqual:v8] || (double v9 = 0.0, self->_animationPhase >= 4))
  {
    if (![(SBAppLayout *)self->_toAppLayout isEqual:v8]) {
      goto LABEL_7;
    }
    int64_t animationPhase = self->_animationPhase;
    if (!animationPhase)
    {
      double v9 = 0.0;
      goto LABEL_9;
    }
    if (animationPhase == 1)
    {
      double v9 = 0.1;
    }
    else
    {
LABEL_7:
      v13.receiver = self;
      v13.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v13 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
      double v9 = v11;
    }
  }
LABEL_9:

  return v9;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if (![(SBAppLayout *)self->_fromAppLayout isEqual:v4] || (double v5 = 0.0, self->_animationPhase >= 3))
  {
    if ([(SBAppLayout *)self->_toAppLayout isEqual:v4] && !self->_animationPhase)
    {
      uint64_t v8 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      double v9 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self chamoisLayoutAttributes];
      [v9 stripTiltAngle];
      double v5 = v10;
      if (v8 == 1) {
        double v5 = -v10;
      }
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v11 perspectiveAngleForAppLayout:v4];
      double v5 = v6;
    }
  }

  return v5;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v5 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_fromAppLayout isEqual:v6]
    || (double v7 = 0.5, v8 = 0.5, self->_animationPhase >= 3))
  {
    if ([(SBAppLayout *)self->_toAppLayout isEqual:v6] && !self->_animationPhase)
    {
      uint64_t v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      if (v11 == 1) {
        double v8 = 0.0;
      }
      else {
        double v8 = 0.5;
      }
      if (v11 == 1) {
        double v7 = 0.5;
      }
      else {
        double v7 = 0.0;
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v14 anchorPointForIndex:a3];
      double v7 = v9;
      double v8 = v10;
    }
  }

  double v12 = v7;
  double v13 = v8;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_fromAppLayout isEqual:v6] && self->_animationPhase <= 2)
  {
    double v7 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self chamoisLayoutAttributes];
    [v7 stageCornerRadii];
    [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
    double topLeft = v8;
    double bottomLeft = v10;
    double bottomRight = v12;
    double topRight = v14;
  }
  else if ([(SBAppLayout *)self->_toAppLayout isEqual:v6] && !self->_animationPhase)
  {
    double topLeft = self->_toAppLayoutInitialCornerRadius.topLeft;
    double bottomLeft = self->_toAppLayoutInitialCornerRadius.bottomLeft;
    double bottomRight = self->_toAppLayoutInitialCornerRadius.bottomRight;
    double topRight = self->_toAppLayoutInitialCornerRadius.topRight;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v24 cornerRadiiForIndex:a3];
    double topLeft = v16;
    double bottomLeft = v17;
    double bottomRight = v18;
    double topRight = v19;
  }

  double v20 = topLeft;
  double v21 = bottomLeft;
  double v22 = bottomRight;
  double v23 = topRight;
  result.double topRight = v23;
  result.double bottomRight = v22;
  result.double bottomLeft = v21;
  result.double topLeft = v20;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_fromAppLayout isEqual:v6] || (double v7 = 0.0, self->_animationPhase >= 3))
  {
    if (![(SBAppLayout *)self->_toAppLayout isEqual:v6] || (double v7 = 0.0, self->_animationPhase >= 2))
    {
      v10.receiver = self;
      v10.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v10 titleAndIconOpacityForIndex:a3];
      double v7 = v8;
    }
  }

  return v7;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  id v4 = a3;
  if (SBFIsChamoisFullScreenToStripGroupOpacityAvailable())
  {
    unsigned __int8 v5 = [v4 isEqual:self->_fromAppLayout];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    unsigned __int8 v5 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)&v8 shouldAllowGroupOpacityForAppLayout:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v11 animationAttributesForLayoutElement:a3];
  unsigned __int8 v5 = (void *)[v4 mutableCopy];

  BOOL v6 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];
  objc_super v8 = [v7 crossblurDosidoSettings];
  double v9 = (void *)[v8 copy];

  [v9 setResponse:0.45];
  [v9 setDampingRatio:0.92];
  [v5 setLayoutUpdateMode:3];
  [v5 setLayoutSettings:v9];
  [v5 setOpacitySettings:v9];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerReason, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end