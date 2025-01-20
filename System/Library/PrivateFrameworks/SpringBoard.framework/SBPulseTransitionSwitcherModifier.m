@interface SBPulseTransitionSwitcherModifier
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (SBPulseTransitionSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillUpdate;
@end

@implementation SBPulseTransitionSwitcherModifier

- (SBPulseTransitionSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBPulseTransitionSwitcherModifier;
  v9 = [(SBTransitionSwitcherModifier *)&v12 initWithTransitionID:a3];
  if (v9)
  {
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBPulseTransitionSwitcherModifier.m", 31, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_appLayout, a4);
  }

  return v9;
}

- (id)transitionWillUpdate
{
  v11.receiver = self;
  v11.super_class = (Class)SBPulseTransitionSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v11 transitionWillUpdate];
  self->_shouldScaleIn = 1;
  v4 = [(SBPulseTransitionSwitcherModifier *)self switcherSettings];
  v5 = [v4 animationSettings];
  [v5 pulseSecondStageDelay];
  double v7 = v6;

  id v8 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"Pulse" reason:v7];
  v9 = SBAppendSwitcherModifierResponse(v8, v3);

  return v9;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBPulseTransitionSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  double v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"Pulse"];
  if (v4)
  {
    self->_shouldScaleIn = 0;
    double v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:3];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBPulseTransitionSwitcherModifier;
  -[SBPulseTransitionSwitcherModifier scaleForIndex:](&v15, sel_scaleForIndex_);
  double v6 = v5;
  if (self->_shouldScaleIn)
  {
    double v7 = [(SBPulseTransitionSwitcherModifier *)self appLayouts];
    uint64_t v8 = [v7 objectAtIndex:a3];
    int v9 = [v8 isEqual:self->_appLayout];

    if (v9)
    {
      objc_super v10 = [(SBPulseTransitionSwitcherModifier *)self switcherSettings];
      objc_super v11 = [v10 animationSettings];
      [v11 pulseScale];
      double v13 = v12;

      return v6 * v13;
    }
  }
  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBPulseTransitionSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBPulseTransitionSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];
  uint64_t v8 = [v7 pulseScaleSettings];
  [v5 setLayoutSettings:v8];

  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  if (self->_appLayout == a3)
  {
    return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBPulseTransitionSwitcherModifier;
    return (SBSwitcherAsyncRenderingAttributes)[(SBTransitionSwitcherModifier *)&v4 asyncRenderingAttributesForAppLayout:sel_asyncRenderingAttributesForAppLayout_];
  }
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBPulseTransitionSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_appLayout])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPulseTransitionSwitcherModifier;
    BOOL v7 = [(SBPulseTransitionSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBPulseTransitionSwitcherModifier;
  v3 = [(SBPulseTransitionSwitcherModifier *)&v6 topMostLayoutElements];
  objc_super v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_appLayout, 0);

  return v4;
}

- (void).cxx_destruct
{
}

@end