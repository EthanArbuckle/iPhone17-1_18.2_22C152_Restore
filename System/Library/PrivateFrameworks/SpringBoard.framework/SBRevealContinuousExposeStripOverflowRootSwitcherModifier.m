@interface SBRevealContinuousExposeStripOverflowRootSwitcherModifier
- (SBAppLayout)initialAppLayout;
- (SBRevealContinuousExposeStripOverflowRootSwitcherModifier)initWithInitialAppLayout:(id)a3;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBRevealContinuousExposeStripOverflowRootSwitcherModifier

- (SBRevealContinuousExposeStripOverflowRootSwitcherModifier)initWithInitialAppLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRevealContinuousExposeStripOverflowRootSwitcherModifier;
  v6 = [(SBGestureRootSwitcherModifier *)&v9 initWithStartingEnvironmentMode:3];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_initialAppLayout, a3);
  }

  return v7;
}

- (int64_t)gestureType
{
  return 11;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5 = a3;
  v6 = [SBRevealContinuousExposeStripOverflowGestureModifier alloc];
  v7 = [v5 gestureID];

  v8 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)v6 initWithGestureID:v7 initialAppLayout:self->_initialAppLayout];
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v4 = a3;
  id v5 = [SBContinuousExposeSwitcherToAppModifier alloc];
  v6 = [v4 transitionID];

  v7 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
  v8 = [(SBContinuousExposeSwitcherToAppModifier *)v5 initWithTransitionID:v6 direction:1 multitaskingModifier:v7];

  return v8;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (void).cxx_destruct
{
}

@end