@interface SBContinuousExposeToAppExposeSwitcherModifier
- (CGRect)frameForIndex:(unint64_t)a3;
- (NSString)appExposeBundleID;
- (SBContinuousExposeToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 appExposeBundleID:(id)a4 direction:(unint64_t)a5 appExposeModifier:(id)a6;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (unint64_t)direction;
@end

@implementation SBContinuousExposeToAppExposeSwitcherModifier

- (SBContinuousExposeToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 appExposeBundleID:(id)a4 direction:(unint64_t)a5 appExposeModifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v28 initWithTransitionID:v11];
  if (v14)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_4:
        uint64_t v15 = [v12 copy];
        appExposeBundleID = v14->_appExposeBundleID;
        v14->_appExposeBundleID = (NSString *)v15;

        v14->_direction = a5;
        objc_storeStrong((id *)&v14->_appExposeModifier, a6);
        v17 = NSString;
        v18 = [MEMORY[0x1E4F29128] UUID];
        v19 = [v18 UUIDString];
        uint64_t v20 = [v17 stringWithFormat:@"SBContinuousExposeToAppExposeSwitcherModifier:%@", v19];
        timerReason = v14->_timerReason;
        v14->_timerReason = (NSString *)v20;

        v22 = [SBRouteToAppExposeSwitcherModifier alloc];
        v23 = (void *)[(SBAppExposeContinuousExposeSwitcherModifier *)v14->_appExposeModifier copy];
        v24 = [(SBRouteToAppExposeSwitcherModifier *)v22 initWithTransitionID:v11 appExposeModifier:v23];

        [(SBChainableModifier *)v14 addChildModifier:v24 atLevel:0 key:0];
        goto LABEL_5;
      }
    }
    else
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, v14, @"SBContinuousExposeToAppExposeSwitcherModifier.m", 37, @"Invalid parameter not satisfying: %@", @"appExposeBundleID" object file lineNumber description];

      if (v13) {
        goto LABEL_4;
      }
    }
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, v14, @"SBContinuousExposeToAppExposeSwitcherModifier.m", 38, @"Invalid parameter not satisfying: %@", @"appExposeModifier" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBChainableModifier *)self succinctDescriptionBuilder];
  v5 = [(SBChainableModifier *)self->_appExposeModifier succinctDescription];
  id v6 = (id)[v4 appendObject:v5 withName:@"appExposeModifier"];

  id v7 = (id)[v4 appendObject:self->_appExposeBundleID withName:@"appExposeBundleID"];
  if (self->_direction) {
    v8 = @"ToSwitcher";
  }
  else {
    v8 = @"ToAppExpose";
  }
  id v9 = (id)[v4 appendObject:v8 withName:@"direction"];
  return v4;
}

- (id)transitionWillBegin
{
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v12 transitionWillBegin];
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  v4 = [(SBContinuousExposeToAppExposeSwitcherModifier *)&v11 visibleAppLayouts];
  appLayoutsVisibleBeforeTransition = self->_appLayoutsVisibleBeforeTransition;
  self->_appLayoutsVisibleBeforeTransition = v4;

  [(SBChainableModifier *)self addChildModifier:self->_appExposeModifier atLevel:1 key:0];
  id v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  id v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v6];

  v8 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:self->_timerReason reason:0.0];
  id v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v7];

  return v9;
}

- (id)handleTimerEvent:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v15 handleTimerEvent:v4];
  id v6 = objc_msgSend(v4, "reason", v15.receiver, v15.super_class);

  LODWORD(v4) = [v6 isEqualToString:self->_timerReason];
  if (v4)
  {
    id v7 = [(SBContinuousExposeToAppExposeSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
    v8 = [v7 firstObject];

    if (v8)
    {
      id v9 = [(SBContinuousExposeToAppExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v8];
      v10 = [v9 firstObject];

      if (v10)
      {
        objc_super v11 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v10 alignment:0 animated:0];
        objc_super v12 = +[SBChainableModifierEventResponse responseByAppendingResponse:v11 toResponse:v5];

        id v13 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
        v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v13 toResponse:v12];
      }
    }
  }
  return v5;
}

- (id)transitionWillUpdate
{
  [(SBChainableModifier *)self removeChildModifier:self->_appExposeModifier];
  appExposeModifier = self->_appExposeModifier;
  self->_appExposeModifier = 0;

  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v6 transitionWillUpdate];
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  [(SBContinuousExposeToAppExposeSwitcherModifier *)&v19 frameForIndex:a3];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (self->_appExposeModifier)
  {
    int v12 = [(SBContinuousExposeToAppExposeSwitcherModifier *)self isRTLEnabled];
    [(SBContinuousExposeToAppExposeSwitcherModifier *)self switcherViewBounds];
    if (v12) {
      double v14 = v13;
    }
    else {
      double v14 = -v13;
    }
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectOffset(v20, v14, 0.0);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  v3 = [(SBContinuousExposeToAppExposeSwitcherModifier *)&v6 visibleAppLayouts];
  double v4 = [v3 setByAddingObjectsFromSet:self->_appLayoutsVisibleBeforeTransition];

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeToAppExposeSwitcherModifier;
  double v4 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBContinuousExposeToAppExposeSwitcherModifier *)self switcherSettings];
  id v7 = [v6 animationSettings];
  double v8 = [v7 toggleAppSwitcherSettings];
  [v5 setLayoutSettings:v8];

  return v5;
}

- (NSString)appExposeBundleID
{
  return self->_appExposeBundleID;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExposeBundleID, 0);
  objc_storeStrong((id *)&self->_appLayoutsVisibleBeforeTransition, 0);
  objc_storeStrong((id *)&self->_timerReason, 0);
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
}

@end