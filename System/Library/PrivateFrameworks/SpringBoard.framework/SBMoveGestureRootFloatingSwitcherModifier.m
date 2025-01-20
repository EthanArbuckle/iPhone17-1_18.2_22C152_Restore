@interface SBMoveGestureRootFloatingSwitcherModifier
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (SBMoveGestureRootFloatingSwitcherModifier)initWithInitialFloatingConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)handleTransitionEvent:(id)a3;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)currentFloatingConfiguration;
- (int64_t)gestureType;
- (int64_t)interfaceOrientation;
- (void)setCurrentFloatingConfiguration:(int64_t)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
@end

@implementation SBMoveGestureRootFloatingSwitcherModifier

- (SBMoveGestureRootFloatingSwitcherModifier)initWithInitialFloatingConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBMoveGestureRootFloatingSwitcherModifier;
  v6 = [(SBGestureRootSwitcherModifier *)&v10 initWithStartingEnvironmentMode:3];
  if (v6)
  {
    BOOL IsValid = SBFloatingConfigurationIsValid(a3);
    int64_t v8 = 4;
    if (IsValid) {
      int64_t v8 = a3;
    }
    v6->_currentFloatingConfiguration = v8;
    v6->_interfaceOrientation = a4;
  }
  return v6;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 phase] == 1) {
    self->_currentFloatingConfiguration = [v4 toFloatingConfiguration];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBMoveGestureRootFloatingSwitcherModifier;
  v5 = [(SBGestureRootSwitcherModifier *)&v7 handleTransitionEvent:v4];

  return v5;
}

- (int64_t)gestureType
{
  return 4;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5 = a3;
  v6 = [SBMoveGestureFloatingSwitcherModifier alloc];
  objc_super v7 = [v5 gestureID];

  int64_t v8 = [(SBMoveGestureFloatingSwitcherModifier *)v6 initWithGestureID:v7 initialFloatingConfiguration:self->_currentFloatingConfiguration interfaceOrientation:self->_interfaceOrientation];
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v4 = a3;
  id v5 = [v4 transitionID];
  v6 = [SBMoveFloatingConfigurationFloatingSwitcherModifier alloc];
  uint64_t v7 = [v4 fromFloatingConfiguration];
  uint64_t v8 = [v4 toFloatingConfiguration];

  v9 = [(SBMoveFloatingConfigurationFloatingSwitcherModifier *)v6 initWithTransitionID:v5 fromFloatingConfiguration:v7 toFloatingConfiguration:v8];
  return v9;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (int64_t)currentFloatingConfiguration
{
  return self->_currentFloatingConfiguration;
}

- (void)setCurrentFloatingConfiguration:(int64_t)a3
{
  self->_currentFloatingConfiguration = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

@end