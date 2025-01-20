@interface SBGridSwipeUpGestureRootSwitcherModifier
- (SBGridSwipeUpGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4;
- (id)_newMultitaskingModifier;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBGridSwipeUpGestureRootSwitcherModifier

- (SBGridSwipeUpGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBGridSwipeUpGestureRootSwitcherModifier;
  v9 = [(SBGestureRootSwitcherModifier *)&v12 initWithStartingEnvironmentMode:a3];
  if (v9)
  {
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBGridSwipeUpGestureRootSwitcherModifier.m", 26, @"Invalid parameter not satisfying: %@", @"multitaskingModifier" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_multitaskingModifier, a4);
  }

  return v9;
}

- (int64_t)gestureType
{
  return 2;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v4 = a3;
  v5 = [SBGridSwipeUpGestureSwitcherModifier alloc];
  v6 = [v4 gestureID];

  v7 = [(SBGridSwipeUpGestureSwitcherModifier *)v5 initWithGestureID:v6 delayCompletionUntilTransitionBegins:1];
  return v7;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5 = a3;
  if ([v5 fromEnvironmentMode] == 2 && objc_msgSend(v5, "toEnvironmentMode") == 1)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(SBGridSwipeUpGestureRootSwitcherModifier *)self _newMultitaskingModifier];
    id v8 = SBSafeCast(v6, v7);

    if (v8)
    {
      v9 = [SBContinuousExposeToHomeSwitcherModifier alloc];
      v10 = [v5 transitionID];
      v11 = [(SBContinuousExposeToHomeSwitcherModifier *)v9 initWithTransitionID:v10 direction:0 continuousExposeModifier:v8];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_newMultitaskingModifier
{
  return (id)[(SBSwitcherModifier *)self->_multitaskingModifier copy];
}

- (void).cxx_destruct
{
}

@end