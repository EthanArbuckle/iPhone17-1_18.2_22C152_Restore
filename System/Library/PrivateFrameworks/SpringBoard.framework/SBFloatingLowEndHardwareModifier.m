@interface SBFloatingLowEndHardwareModifier
- (BOOL)_shouldDimAndBlockTouchesToAppsUnderFloating;
- (BOOL)switcherDimmingViewBlocksTouches;
- (BOOL)wantsSwitcherDimmingView;
- (SBFloatingLowEndHardwareModifier)initWithOptions:(unint64_t)a3;
- (double)switcherDimmingAlpha;
- (id)handleTapOutsideToDismissEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (int64_t)_stashedFloatingConfigurationForFloatingConfiguration:(int64_t)a3;
@end

@implementation SBFloatingLowEndHardwareModifier

- (SBFloatingLowEndHardwareModifier)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFloatingLowEndHardwareModifier;
  result = [(SBSwitcherModifier *)&v5 init];
  if (result) {
    result->_options = a3;
  }
  return result;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 toFloatingAppLayout];
  char v6 = [v4 toFloatingSwitcherVisible];
  uint64_t v7 = [v4 toEnvironmentMode];
  v8 = [v4 toAppLayout];
  self->_floatingSwitcherVisible = v6;
  self->_floatingConfiguration = [v4 toFloatingConfiguration];
  if (v5) {
    char v9 = 1;
  }
  else {
    char v9 = v6;
  }
  if (v7 == 3 && (v9 & 1) != 0)
  {
    v10 = [v8 allItems];
    self->_floatingAppVisibleOverSplitView = (unint64_t)[v10 count] > 1;

    char v11 = [v4 toAppLayoutWantsExclusiveForeground];
  }
  else
  {
    char v11 = 0;
    self->_floatingAppVisibleOverSplitView = 0;
  }
  self->_floatingAppVisibleOverExclusiveForegroundApp = v11;
  if ((unint64_t)[v4 phase] >= 2) {
    self->_shouldDimAndBlockTouches = [(SBFloatingLowEndHardwareModifier *)self _shouldDimAndBlockTouchesToAppsUnderFloating];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBFloatingLowEndHardwareModifier;
  v12 = [(SBSwitcherModifier *)&v14 handleTransitionEvent:v4];

  return v12;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBFloatingLowEndHardwareModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v16 handleTapOutsideToDismissEvent:v4];
  if (([v4 isHandled] & 1) == 0
    && [(SBFloatingLowEndHardwareModifier *)self _shouldDimAndBlockTouchesToAppsUnderFloating]&& !self->_floatingSwitcherVisible)
  {
    int64_t v6 = [(SBFloatingLowEndHardwareModifier *)self _stashedFloatingConfigurationForFloatingConfiguration:self->_floatingConfiguration];
    uint64_t v7 = [SBPerformTransitionSwitcherEventResponse alloc];
    v8 = +[SBSwitcherTransitionRequest requestForStashingFloatingApplicationWithFloatingConfiguration:v6];
    char v9 = [(SBPerformTransitionSwitcherEventResponse *)v7 initWithTransitionRequest:v8 gestureInitiated:0];

    uint64_t v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v5];

    char v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    objc_super v14 = [v11 stringWithFormat:@"%@ handling tap outside by dismissing floating app.", v13];
    [v4 handleWithReason:v14];

    objc_super v5 = (void *)v10;
  }

  return v5;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 1;
}

- (double)switcherDimmingAlpha
{
  double result = 0.5;
  if (!self->_shouldDimAndBlockTouches)
  {
    v3.receiver = self;
    v3.super_class = (Class)SBFloatingLowEndHardwareModifier;
    [(SBFloatingLowEndHardwareModifier *)&v3 homeScreenDimmingAlpha];
  }
  return result;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  if (self->_shouldDimAndBlockTouches) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingLowEndHardwareModifier;
  return [(SBFloatingLowEndHardwareModifier *)&v3 switcherDimmingViewBlocksTouches];
}

- (BOOL)_shouldDimAndBlockTouchesToAppsUnderFloating
{
  if (self->_floatingAppVisibleOverExclusiveForegroundApp) {
    return 1;
  }
  else {
    return self->_floatingAppVisibleOverSplitView & self->_options;
  }
}

- (int64_t)_stashedFloatingConfigurationForFloatingConfiguration:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 3;
  }
  else {
    return qword_1D8FD23C8[a3];
  }
}

@end