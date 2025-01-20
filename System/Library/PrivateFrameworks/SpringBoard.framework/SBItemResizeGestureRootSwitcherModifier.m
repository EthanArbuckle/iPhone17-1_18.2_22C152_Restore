@interface SBItemResizeGestureRootSwitcherModifier
- (SBItemResizeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 selectedLayoutRole:(int64_t)a4;
- (id)appLayoutsToResignActive;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
- (int64_t)selectedLayoutRole;
@end

@implementation SBItemResizeGestureRootSwitcherModifier

- (SBItemResizeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 selectedLayoutRole:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBItemResizeGestureRootSwitcherModifier;
  result = [(SBGestureRootSwitcherModifier *)&v6 initWithStartingEnvironmentMode:a3];
  if (result) {
    result->_selectedLayoutRole = a4;
  }
  return result;
}

- (int64_t)gestureType
{
  return 9;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v4 = a3;
  v5 = [SBItemResizeGestureSwitcherModifier alloc];
  objc_super v6 = [v4 gestureID];

  v7 = [(SBItemResizeGestureSwitcherModifier *)v5 initWithGestureID:v6];
  return v7;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v8 = SBSafeCast(v7, v5);

  v9 = [SBItemResizeTransitionSwitcherModifier alloc];
  v10 = [v6 transitionID];

  v11 = [v8 selectedAppLayout];
  v12 = [(SBItemResizeTransitionSwitcherModifier *)v9 initWithTransitionID:v10 selectedAppLayout:v11];

  return v12;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (int64_t)selectedLayoutRole
{
  return self->_selectedLayoutRole;
}

@end