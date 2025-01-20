@interface SBHomeToSwitcherSwitcherModifier
- (BOOL)isEffectivelyHome;
- (SBHomeToSwitcherSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 multitaskingModifier:(id)a5;
- (SBSwitcherModifier)multitaskingModifier;
- (double)containerStatusBarAnimationDuration;
- (id)_dismissForEmptySwitcherResponseName;
- (id)appLayoutToScrollToDuringTransition;
- (id)handleTimerEvent:(id)a3;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (int64_t)direction;
@end

@implementation SBHomeToSwitcherSwitcherModifier

- (SBHomeToSwitcherSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 multitaskingModifier:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBHomeToSwitcherSwitcherModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v13 initWithTransitionID:a3];
  v11 = v10;
  if (v10)
  {
    v10->_direction = a4;
    objc_storeStrong((id *)&v10->_multitaskingModifier, a5);
  }

  return v11;
}

- (double)containerStatusBarAnimationDuration
{
  v3 = [(SBHomeToSwitcherSwitcherModifier *)self appLayouts];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 0.35;
  }
  v6 = [(SBHomeToSwitcherSwitcherModifier *)self switcherSettings];
  v7 = [v6 animationSettings];

  if (self->_direction == 1) {
    [v7 statusBarToApexBounceAnimationDuration];
  }
  else {
    [v7 statusBarFromApexBounceAnimationDuration];
  }
  double v5 = v8;

  return v5;
}

- (id)transitionWillBegin
{
  v13.receiver = self;
  v13.super_class = (Class)SBHomeToSwitcherSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v13 transitionWillBegin];
  uint64_t v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  double v5 = [(SBHomeToSwitcherSwitcherModifier *)self appLayoutToScrollToDuringTransition];
  if (v5)
  {
    v6 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v5 alignment:0 animated:0];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v6];
  }
  int64_t direction = self->_direction;
  double v8 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if (direction == 1) {
    uint64_t v9 = 30;
  }
  else {
    uint64_t v9 = 2;
  }
  v10 = [(SBUpdateLayoutSwitcherEventResponse *)v8 initWithOptions:v9 updateMode:2];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v10];

  v11 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  return v11;
}

- (id)transitionWillUpdate
{
  v15.receiver = self;
  v15.super_class = (Class)SBHomeToSwitcherSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v15 transitionWillUpdate];
  if (self->_direction == 1)
  {
    uint64_t v4 = [(SBHomeToSwitcherSwitcherModifier *)self appLayouts];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      v6 = [(SBHomeToSwitcherSwitcherModifier *)self switcherSettings];
      v7 = [v6 animationSettings];
      [v7 emptySwitcherDismissDelay];
      double v9 = v8;

      v10 = [SBTimerEventSwitcherEventResponse alloc];
      v11 = [(SBHomeToSwitcherSwitcherModifier *)self _dismissForEmptySwitcherResponseName];
      v12 = [(SBTimerEventSwitcherEventResponse *)v10 initWithDelay:0 validator:v11 reason:v9];

      uint64_t v13 = +[SBChainableModifierEventResponse responseByAppendingResponse:v12 toResponse:v3];

      v3 = (void *)v13;
    }
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBHomeToSwitcherSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBTransitionSwitcherModifier *)&v11 handleTimerEvent:v4];
  objc_msgSend(v4, "reason", v11.receiver, v11.super_class);
  v6 = (SBDismissForEmptySwitcherSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();

  v7 = [(SBHomeToSwitcherSwitcherModifier *)self _dismissForEmptySwitcherResponseName];
  if ([(SBDismissForEmptySwitcherSwitcherEventResponse *)v6 isEqualToString:v7])
  {
    double v8 = [(SBHomeToSwitcherSwitcherModifier *)self appLayouts];
    uint64_t v9 = [v8 count];

    if (v9) {
      goto LABEL_5;
    }
    v6 = objc_alloc_init(SBDismissForEmptySwitcherSwitcherEventResponse);
    +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v5];
    uint64_t v5 = v7 = v5;
  }

LABEL_5:
  return v5;
}

- (BOOL)isEffectivelyHome
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = [(SBHomeToSwitcherSwitcherModifier *)self direction] == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v4 = [(SBHomeToSwitcherSwitcherModifier *)self direction] == 0;
  }
  else {
    BOOL v4 = 0;
  }
  return v3 || v4;
}

- (id)appLayoutToScrollToDuringTransition
{
  return 0;
}

- (id)_dismissForEmptySwitcherResponseName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"DismissForEmptySwitcher-%p", self);
}

- (int64_t)direction
{
  return self->_direction;
}

- (SBSwitcherModifier)multitaskingModifier
{
  return self->_multitaskingModifier;
}

- (void).cxx_destruct
{
}

@end