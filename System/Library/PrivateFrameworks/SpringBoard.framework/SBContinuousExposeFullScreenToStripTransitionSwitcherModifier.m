@interface SBContinuousExposeFullScreenToStripTransitionSwitcherModifier
- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)frameForIconOverlayInAppLayout:(id)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBContinuousExposeFullScreenToStripTransitionSwitcherModifier)initWithTransitionID:(id)a3 outgoingAppLayout:(id)a4;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)transitionWillBegin;
@end

@implementation SBContinuousExposeFullScreenToStripTransitionSwitcherModifier

- (SBContinuousExposeFullScreenToStripTransitionSwitcherModifier)initWithTransitionID:(id)a3 outgoingAppLayout:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
  v8 = [(SBTransitionSwitcherModifier *)&v16 initWithTransitionID:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outgoingAppLayout, a4);
    v9->_animationPhase = 0;
    v10 = NSString;
    v11 = [MEMORY[0x1E4F29128] UUID];
    v12 = [v11 UUIDString];
    uint64_t v13 = [v10 stringWithFormat:@"%@:%@", @"SBContinuousExposeFullScreenToStripTransitionSwitcherModifierTimerEventReason", v12];
    timerReason = v9->_timerReason;
    v9->_timerReason = (NSString *)v13;
  }
  return v9;
}

- (id)transitionWillBegin
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v8 transitionWillBegin];
  if (!self->_animationPhase)
  {
    v4 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:self->_timerReason reason:0.14];
    v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    v6 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:self->_timerReason reason:0.14];
    v3 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v5];
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v13 handleTimerEvent:v4];
  v6 = objc_msgSend(v4, "reason", v13.receiver, v13.super_class);

  LODWORD(v4) = [v6 isEqualToString:self->_timerReason];
  if (v4)
  {
    int64_t animationPhase = self->_animationPhase;
    if (animationPhase)
    {
      if (animationPhase != 1) {
        goto LABEL_7;
      }
      uint64_t v8 = 3;
      int64_t v9 = 2;
    }
    else
    {
      uint64_t v8 = 2;
      int64_t v9 = 1;
    }
    self->_int64_t animationPhase = v9;
    v10 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:v8];
    uint64_t v11 = +[SBChainableModifierEventResponse responseByAppendingResponse:v10 toResponse:v5];

    v5 = (void *)v11;
  }
LABEL_7:
  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v5 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_outgoingAppLayout isEqual:v6]) {
    goto LABEL_5;
  }
  int64_t animationPhase = self->_animationPhase;
  if (animationPhase == 1)
  {
    v30.receiver = self;
    v30.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v30 frameForIndex:a3];
    double v14 = v21;
    double v16 = v22;
    double v10 = v23 * 0.1;
    double v12 = v24 * 1.065;
    goto LABEL_7;
  }
  if (animationPhase)
  {
LABEL_5:
    v29.receiver = self;
    v29.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v29 frameForIndex:a3];
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
    double v16 = v20;
  }
  else
  {
    uint64_t v8 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v6];
    [v8 boundingBox];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
LABEL_7:

  double v25 = v10;
  double v26 = v12;
  double v27 = v14;
  double v28 = v16;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)frameForIconOverlayInAppLayout:(id)a3
{
  outgoingAppLayout = self->_outgoingAppLayout;
  id v5 = a3;
  if ([(SBAppLayout *)outgoingAppLayout isEqual:v5])
  {
    v6 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v5];

    [v6 boundingBox];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v23 frameForIconOverlayInAppLayout:v5];
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
    double v14 = v18;
  }
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_outgoingAppLayout isEqual:v6] && !self->_animationPhase)
  {
    double v15 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self chamoisLayoutAttributes];
    [v15 stageCornerRadii];
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v24 cornerRadiiForIndex:a3];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }

  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.topRight = v23;
  result.bottomRight = v22;
  result.bottomLeft = v21;
  result.topLeft = v20;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_outgoingAppLayout isEqual:v6]
    || (double v7 = 0.5, v8 = 0.5, self->_animationPhase >= 2))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v13 anchorPointForIndex:a3];
    double v7 = v9;
    double v8 = v10;
  }

  double v11 = v7;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(SBAppLayout *)self->_outgoingAppLayout isEqual:v4] && !self->_animationPhase)
  {
    double v6 = 0.0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v6 = v5;
  }

  return v6;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_outgoingAppLayout isEqual:v6]) {
    goto LABEL_5;
  }
  int64_t animationPhase = self->_animationPhase;
  if (animationPhase == 1)
  {
    double v11 = 0.32;
    goto LABEL_7;
  }
  if (animationPhase)
  {
LABEL_5:
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v14 scaleForIndex:a3];
    double v11 = v12;
  }
  else
  {
    objc_super v8 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self switcherSettings];
    double v9 = [v8 animationSettings];
    [v9 crossblurDosidoSmallScale];
    double v11 = v10;
  }
LABEL_7:

  return v11;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if (![(SBAppLayout *)self->_outgoingAppLayout isEqual:v8] || (double v9 = 0.0, self->_animationPhase >= 2))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_outgoingAppLayout isEqual:v6] || (double v7 = 0.0, self->_animationPhase >= 2))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v10 titleAndIconOpacityForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  id v4 = a3;
  if (SBFIsChamoisFullScreenToStripGroupOpacityAvailable())
  {
    unsigned __int8 v5 = [(SBAppLayout *)self->_outgoingAppLayout isEqual:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    unsigned __int8 v5 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)&v8 shouldAllowGroupOpacityForAppLayout:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v15 animationAttributesForLayoutElement:a3];
  unsigned __int8 v5 = (void *)[v4 mutableCopy];

  BOOL v6 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];
  objc_super v8 = [v7 crossblurDosidoSettings];
  double v9 = (void *)[v8 copy];

  [v9 setResponse:0.4];
  [v9 setDampingRatio:1.0];
  [v5 setLayoutUpdateMode:3];
  [v5 setLayoutSettings:v9];
  objc_super v10 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)self switcherSettings];
  double v11 = [v10 animationSettings];
  objc_super v12 = [v11 crossblurDosidoSettings];
  objc_super v13 = (void *)[v12 copy];

  [v13 setResponse:0.15];
  [v5 setOpacitySettings:v13];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerReason, 0);
  objc_storeStrong((id *)&self->_outgoingAppLayout, 0);
}

@end