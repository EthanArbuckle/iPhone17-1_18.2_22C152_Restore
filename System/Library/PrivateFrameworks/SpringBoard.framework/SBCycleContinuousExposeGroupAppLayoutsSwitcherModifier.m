@interface SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier
- (SBAppLayout)appLayout;
- (SBAppLayout)behindAppLayout;
- (SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier)initWithAppLayout:(id)a3 behindAppLayout:(id)a4 generationCount:(unint64_t)a5;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)_completeIfNeeded;
- (id)_completeIfNeededIgnoringHover:(BOOL)a3;
- (id)_timeoutReason;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3;
- (id)handleHighlightEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)visibleAppLayouts;
- (unint64_t)generationCount;
@end

@implementation SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier

- (SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier)initWithAppLayout:(id)a3 behindAppLayout:(id)a4 generationCount:(unint64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  v12 = [(SBSwitcherModifier *)&v16 init];
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_appLayout, a3);
        objc_storeStrong((id *)&v12->_behindAppLayout, a4);
        v12->_generationCount = a5;
        v12->_initialGenerationCount = a5;
        goto LABEL_5;
      }
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v12, @"SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier.m", 32, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];

      if (v11) {
        goto LABEL_4;
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, v12, @"SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier.m", 33, @"Invalid parameter not satisfying: %@", @"behindAppLayout" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (id)visibleAppLayouts
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  v3 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)&v8 visibleAppLayouts];
  behindAppLayout = self->_behindAppLayout;
  v9[0] = self->_appLayout;
  v9[1] = behindAppLayout;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v3 setByAddingObjectsFromArray:v5];

  return v6;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 0.0;
  if (([v8 isEqual:self->_appLayout] & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
    [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  v5 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)&v10 appLayoutsForContinuousExposeIdentifier:v4];
  if ((unint64_t)[v5 count] >= 2
    && ([(SBAppLayout *)self->_appLayout continuousExposeIdentifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:v4],
        v6,
        v7)
    && ![(SBAppLayout *)self->_appLayout isEqual:self->_behindAppLayout])
  {
    id v8 = (void *)[v5 mutableCopy];
    if ([v8 containsObject:self->_appLayout]
      && [v8 containsObject:self->_behindAppLayout])
    {
      [v8 removeObject:self->_appLayout];
    }
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 appLayoutsWithRemovalContexts];
  int v6 = [v5 containsObject:self->_appLayoutToOrderFront];

  if (v6)
  {
    appLayoutToOrderFront = self->_appLayoutToOrderFront;
    self->_appLayoutToOrderFront = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  id v8 = [(SBSwitcherModifier *)&v10 handleTransitionEvent:v4];

  return v8;
}

- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v23 handleContinuousExposeIdentifiersChangedEvent:v4];
  if ([v4 isAnimated])
  {
    unint64_t v6 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self continuousExposeIdentifiersGenerationCount];
    self->_generationCount = v6;
    if (v6 == self->_initialGenerationCount)
    {
      int v7 = [SBTimerEventSwitcherEventResponse alloc];
      id v8 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self _timeoutReason];
      double v9 = [(SBTimerEventSwitcherEventResponse *)v7 initWithDelay:0 validator:v8 reason:1.5];

      uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v5);

      v5 = (void *)v10;
    }
    id v11 = [v4 transitioningToAppLayout];
    objc_super v12 = [v11 continuousExposeIdentifier];
    v13 = [(SBAppLayout *)self->_appLayout continuousExposeIdentifier];
    int v14 = [v12 isEqual:v13];

    if (v14)
    {
      v15 = [v4 transitioningToAppLayout];
      appLayoutToOrderFront = self->_appLayoutToOrderFront;
      self->_appLayoutToOrderFront = v15;

      if (![(SBAppLayout *)self->_appLayout isEqual:self->_behindAppLayout])
      {
        v17 = [v4 transitioningToAppLayout];
        char v18 = [v17 isEqual:self->_behindAppLayout];

        if ((v18 & 1) == 0) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      v19 = self->_appLayoutToOrderFront;
      self->_appLayoutToOrderFront = 0;
    }
    v20 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self _completeIfNeededIgnoringHover:1];
    uint64_t v21 = SBAppendSwitcherModifierResponse(v20, v5);

    v5 = (void *)v21;
  }
LABEL_10:

  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v13 handleTimerEvent:v4];
  unint64_t v6 = objc_msgSend(v4, "reason", v13.receiver, v13.super_class);

  int v7 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self _timeoutReason];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    double v9 = [(SBAppLayout *)self->_appLayout continuousExposeIdentifier];
    self->_isDelayingCompletionForHover = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self anyHighlightedAppLayoutsForContinuousExposeIdentifier:v9];

    uint64_t v10 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self _completeIfNeeded];
    uint64_t v11 = SBAppendSwitcherModifierResponse(v10, v5);

    v5 = (void *)v11;
  }
  return v5;
}

- (id)handleHighlightEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleHighlightEvent:v4];
  int v6 = objc_msgSend(v4, "isHoverEvent", v10.receiver, v10.super_class);

  if (v6 && self->_isDelayingCompletionForHover)
  {
    int v7 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self _completeIfNeeded];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (id)_completeIfNeeded
{
  return [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self _completeIfNeededIgnoringHover:0];
}

- (id)_completeIfNeededIgnoringHover:(BOOL)a3
{
  if ([(SBChainableModifier *)self state] == 1
    || self->_isDelayingCompletionForHover
    && !a3
    && ([(SBAppLayout *)self->_appLayout continuousExposeIdentifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [(SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *)self anyHighlightedAppLayoutsForContinuousExposeIdentifier:v5], v5, (v6 & 1) != 0))
  {
    int v7 = 0;
  }
  else
  {
    self->_isDelayingCompletionForHover = 0;
    if (self->_generationCount == self->_initialGenerationCount && self->_appLayoutToOrderFront)
    {
      uint64_t v8 = [SBPerformTransitionSwitcherEventResponse alloc];
      double v9 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:self->_appLayoutToOrderFront];
      objc_super v10 = [(SBPerformTransitionSwitcherEventResponse *)v8 initWithTransitionRequest:v9 gestureInitiated:0];

      int v7 = SBAppendSwitcherModifierResponse(v10, 0);
    }
    else
    {
      int v7 = 0;
    }
    [(SBChainableModifier *)self setState:1];
  }
  return v7;
}

- (id)_timeoutReason
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"%@-%ld", v5, self->_initialGenerationCount];

  return v6;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBAppLayout)behindAppLayout
{
  return self->_behindAppLayout;
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behindAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_appLayoutToOrderFront, 0);
}

@end