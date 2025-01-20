@interface SBRevealContinuousExposeStripsRootSwitcherModifier
- (SBAppLayout)initialAppLayout;
- (SBRevealContinuousExposeStripsRootSwitcherModifier)initWithInitialAppLayout:(id)a3;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBRevealContinuousExposeStripsRootSwitcherModifier

- (SBRevealContinuousExposeStripsRootSwitcherModifier)initWithInitialAppLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRevealContinuousExposeStripsRootSwitcherModifier;
  v6 = [(SBGestureRootSwitcherModifier *)&v9 initWithStartingEnvironmentMode:3];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_initialAppLayout, a3);
  }

  return v7;
}

- (int64_t)gestureType
{
  return 10;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5 = a3;
  v6 = [SBRevealContinuousExposeStripsGestureModifier alloc];
  v7 = [v5 gestureID];

  v8 = [(SBRevealContinuousExposeStripsGestureModifier *)v6 initWithGestureID:v7 initialAppLayout:self->_initialAppLayout];
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5 = a3;
  v6 = [SBContinuousExposeAppToAppModifier alloc];
  v7 = [v5 transitionID];
  initialAppLayout = self->_initialAppLayout;
  uint64_t v9 = [v5 fromInterfaceOrientation];
  v10 = self->_initialAppLayout;
  uint64_t v11 = [v5 toInterfaceOrientation];
  v12 = [v5 fromDisplayItemLayoutAttributesMap];
  v13 = [v5 toDisplayItemLayoutAttributesMap];

  v14 = [(SBContinuousExposeAppToAppModifier *)v6 initWithTransitionID:v7 fromAppLayout:initialAppLayout fromInterfaceOrientation:v9 toAppLayout:v10 toInterfaceOrientation:v11 fromDisplayItemLayoutAttributesMap:v12 toDisplayItemLayoutAttributesMap:v13];
  return v14;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (void).cxx_destruct
{
}

@end