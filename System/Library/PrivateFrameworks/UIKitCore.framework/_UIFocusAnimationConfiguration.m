@interface _UIFocusAnimationConfiguration
+ (_UIFocusAnimationConfiguration)configurationWithStyle:(int64_t)a3;
- (_UIFocusAnimationConfiguration)init;
- (double)_defaultVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3;
- (double)_focusingVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3;
- (double)_unfocusingRepositionVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3;
- (double)_unfocusingVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3;
- (double)focusingBaseDuration;
- (double)focusingDelay;
- (double)focusingDurationScaleFactorLowerBound;
- (double)focusingDurationScaleFactorUpperBound;
- (double)minimumFocusDuration;
- (double)unfocusingBackgroundFadeDurationPercentage;
- (double)unfocusingBaseDuration;
- (double)unfocusingDurationScaleFactorLowerBound;
- (double)unfocusingDurationScaleFactorUpperBound;
- (double)unfocusingRepositionBaseDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)animationOptions;
- (void)setAnimationOptions:(unint64_t)a3;
- (void)setFocusingBaseDuration:(double)a3;
- (void)setFocusingDelay:(double)a3;
- (void)setFocusingDurationScaleFactorLowerBound:(double)a3;
- (void)setFocusingDurationScaleFactorUpperBound:(double)a3;
- (void)setMinimumFocusDuration:(double)a3;
- (void)setUnfocusingBackgroundFadeDurationPercentage:(double)a3;
- (void)setUnfocusingBaseDuration:(double)a3;
- (void)setUnfocusingDurationScaleFactorLowerBound:(double)a3;
- (void)setUnfocusingDurationScaleFactorUpperBound:(double)a3;
- (void)setUnfocusingRepositionBaseDuration:(double)a3;
@end

@implementation _UIFocusAnimationConfiguration

+ (_UIFocusAnimationConfiguration)configurationWithStyle:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setAnimationOptions:327686];
  int v5 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257210, @"FocusAnimationDefaultFocusingBaseDuration");
  double v6 = *(double *)&qword_1EB257218;
  if (v5) {
    double v6 = 0.0;
  }
  [v4 setFocusingBaseDuration:v6];
  int v7 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257220, @"FocusAnimationDefaultUnfocusingBaseDuration");
  double v8 = *(double *)&qword_1EB257228;
  if (v7) {
    double v8 = 0.0;
  }
  [v4 setUnfocusingBaseDuration:v8];
  int v9 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257240, @"FocusAnimationDefaultFocusingDurationScaleFactorLowerBound");
  double v10 = *(double *)&qword_1EB257248;
  if (v9) {
    double v10 = 0.0;
  }
  [v4 setFocusingDurationScaleFactorLowerBound:v10];
  int v11 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257250, @"FocusAnimationDefaultFocusingDurationScaleFactorUpperBound");
  double v12 = *(double *)&qword_1EB257258;
  if (v11) {
    double v12 = 1.0;
  }
  [v4 setFocusingDurationScaleFactorUpperBound:v12];
  int v13 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257260, @"FocusAnimationDefaultUnfocusingDurationScaleFactorLowerBound");
  double v14 = *(double *)&qword_1EB257268;
  if (v13) {
    double v14 = 0.3;
  }
  [v4 setUnfocusingDurationScaleFactorLowerBound:v14];
  int v15 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257270, @"FocusAnimationDefaultUnfocusingDurationScaleFactorUpperBound");
  double v16 = *(double *)&qword_1EB257278;
  if (v15) {
    double v16 = 1.0;
  }
  [v4 setUnfocusingDurationScaleFactorUpperBound:v16];
  int v17 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257280, @"FocusAnimationDefaultMinimumFocusDuration");
  double v18 = *(double *)&qword_1EB257288;
  if (v17) {
    double v18 = 0.035;
  }
  [v4 setMinimumFocusDuration:v18];
  int v19 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257290, @"FocusAnimationDefaultUnfocusingRepositionBaseDuration");
  double v20 = *(double *)&qword_1EB257298;
  if (v19) {
    double v20 = 0.9;
  }
  [v4 setUnfocusingRepositionBaseDuration:v20];
  int v21 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2572A0, @"FocusAnimationDefaultUnfocusingBackgroundFadeDurationPercentage");
  double v22 = *(double *)&qword_1EB2572A8;
  if (v21) {
    double v22 = 1.0;
  }
  [v4 setUnfocusingBackgroundFadeDurationPercentage:v22];
  if (a3 == 2)
  {
    int v25 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257230, @"FocusAnimationListUnfocusingBaseDuration");
    double v26 = *(double *)&qword_1EB257238;
    if (v25) {
      double v26 = 0.0;
    }
    [v4 setUnfocusingBaseDuration:v26];
    int v27 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2572C0, @"FocusAnimationListUnfocusingBackgroundFadeDurationPercentage");
    double v24 = *(double *)&qword_1EB2572C8;
    if (v27) {
      double v24 = 0.3;
    }
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_29;
    }
    int v23 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2572B0, @"FocusAnimationButtonUnfocusingBackgroundFadeDurationPercentage");
    double v24 = *(double *)&qword_1EB2572B8;
    if (v23) {
      double v24 = 0.15;
    }
  }
  [v4 setUnfocusingBackgroundFadeDurationPercentage:v24];
LABEL_29:
  return (_UIFocusAnimationConfiguration *)v4;
}

- (_UIFocusAnimationConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusAnimationConfiguration;
  result = [(_UIFocusAnimationConfiguration *)&v3 init];
  if (result)
  {
    result->_focusingDurationScaleFactorUpperBound = 1.0;
    result->_unfocusingDurationScaleFactorUpperBound = 1.0;
    result->_unfocusingBackgroundFadeDurationPercentage = 1.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_UIFocusAnimationConfiguration);
  [(_UIFocusAnimationConfiguration *)v4 setAnimationOptions:[(_UIFocusAnimationConfiguration *)self animationOptions]];
  [(_UIFocusAnimationConfiguration *)self focusingDelay];
  -[_UIFocusAnimationConfiguration setFocusingDelay:](v4, "setFocusingDelay:");
  [(_UIFocusAnimationConfiguration *)self focusingBaseDuration];
  -[_UIFocusAnimationConfiguration setFocusingBaseDuration:](v4, "setFocusingBaseDuration:");
  [(_UIFocusAnimationConfiguration *)self unfocusingBaseDuration];
  -[_UIFocusAnimationConfiguration setUnfocusingBaseDuration:](v4, "setUnfocusingBaseDuration:");
  [(_UIFocusAnimationConfiguration *)self focusingDurationScaleFactorLowerBound];
  -[_UIFocusAnimationConfiguration setFocusingDurationScaleFactorLowerBound:](v4, "setFocusingDurationScaleFactorLowerBound:");
  [(_UIFocusAnimationConfiguration *)self focusingDurationScaleFactorUpperBound];
  -[_UIFocusAnimationConfiguration setFocusingDurationScaleFactorUpperBound:](v4, "setFocusingDurationScaleFactorUpperBound:");
  [(_UIFocusAnimationConfiguration *)self unfocusingDurationScaleFactorLowerBound];
  -[_UIFocusAnimationConfiguration setUnfocusingDurationScaleFactorLowerBound:](v4, "setUnfocusingDurationScaleFactorLowerBound:");
  [(_UIFocusAnimationConfiguration *)self unfocusingDurationScaleFactorUpperBound];
  -[_UIFocusAnimationConfiguration setUnfocusingDurationScaleFactorUpperBound:](v4, "setUnfocusingDurationScaleFactorUpperBound:");
  [(_UIFocusAnimationConfiguration *)self minimumFocusDuration];
  -[_UIFocusAnimationConfiguration setMinimumFocusDuration:](v4, "setMinimumFocusDuration:");
  [(_UIFocusAnimationConfiguration *)self unfocusingRepositionBaseDuration];
  -[_UIFocusAnimationConfiguration setUnfocusingRepositionBaseDuration:](v4, "setUnfocusingRepositionBaseDuration:");
  [(_UIFocusAnimationConfiguration *)self unfocusingBackgroundFadeDurationPercentage];
  -[_UIFocusAnimationConfiguration setUnfocusingBackgroundFadeDurationPercentage:](v4, "setUnfocusingBackgroundFadeDurationPercentage:");
  return v4;
}

- (double)_defaultVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3
{
  return _UIFocusAnimationNormalizedDurationScaleFactorInContext(a3) + 0.0;
}

- (double)_focusingVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3
{
  double v4 = _UIFocusAnimationNormalizedDurationScaleFactorInContext(a3);
  [(_UIFocusAnimationConfiguration *)self focusingDurationScaleFactorLowerBound];
  double v6 = v5;
  [(_UIFocusAnimationConfiguration *)self focusingDurationScaleFactorUpperBound];
  return v6 + v4 * (v7 - v6);
}

- (double)_unfocusingVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3
{
  double v4 = _UIFocusAnimationNormalizedDurationScaleFactorInContext(a3);
  [(_UIFocusAnimationConfiguration *)self unfocusingDurationScaleFactorLowerBound];
  double v6 = v5;
  [(_UIFocusAnimationConfiguration *)self unfocusingDurationScaleFactorUpperBound];
  return v6 + v4 * (v7 - v6);
}

- (double)_unfocusingRepositionVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3
{
  id v4 = a3;
  [(_UIFocusAnimationConfiguration *)self unfocusingDurationScaleFactorLowerBound];
  double v6 = v5;
  [(_UIFocusAnimationConfiguration *)self unfocusingBaseDuration];
  double v8 = v7;
  [(_UIFocusAnimationConfiguration *)self unfocusingRepositionBaseDuration];
  double v10 = v6 * (v8 / v9);
  double v11 = _UIFocusAnimationNormalizedDurationScaleFactorInContext(v4);

  double v12 = pow(v11, 1.5);
  [(_UIFocusAnimationConfiguration *)self unfocusingDurationScaleFactorUpperBound];
  return v10 + v12 * (v13 - v10);
}

- (double)focusingBaseDuration
{
  return self->_focusingBaseDuration;
}

- (void)setFocusingBaseDuration:(double)a3
{
  self->_focusingBaseDuration = a3;
}

- (double)unfocusingBaseDuration
{
  return self->_unfocusingBaseDuration;
}

- (void)setUnfocusingBaseDuration:(double)a3
{
  self->_unfocusingBaseDuration = a3;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (double)focusingDurationScaleFactorLowerBound
{
  return self->_focusingDurationScaleFactorLowerBound;
}

- (void)setFocusingDurationScaleFactorLowerBound:(double)a3
{
  self->_focusingDurationScaleFactorLowerBound = a3;
}

- (double)focusingDurationScaleFactorUpperBound
{
  return self->_focusingDurationScaleFactorUpperBound;
}

- (void)setFocusingDurationScaleFactorUpperBound:(double)a3
{
  self->_focusingDurationScaleFactorUpperBound = a3;
}

- (double)unfocusingDurationScaleFactorLowerBound
{
  return self->_unfocusingDurationScaleFactorLowerBound;
}

- (void)setUnfocusingDurationScaleFactorLowerBound:(double)a3
{
  self->_unfocusingDurationScaleFactorLowerBound = a3;
}

- (double)unfocusingDurationScaleFactorUpperBound
{
  return self->_unfocusingDurationScaleFactorUpperBound;
}

- (void)setUnfocusingDurationScaleFactorUpperBound:(double)a3
{
  self->_unfocusingDurationScaleFactorUpperBound = a3;
}

- (double)minimumFocusDuration
{
  return self->_minimumFocusDuration;
}

- (void)setMinimumFocusDuration:(double)a3
{
  self->_minimumFocusDuration = a3;
}

- (double)unfocusingRepositionBaseDuration
{
  return self->_unfocusingRepositionBaseDuration;
}

- (void)setUnfocusingRepositionBaseDuration:(double)a3
{
  self->_unfocusingRepositionBaseDuration = a3;
}

- (double)unfocusingBackgroundFadeDurationPercentage
{
  return self->_unfocusingBackgroundFadeDurationPercentage;
}

- (void)setUnfocusingBackgroundFadeDurationPercentage:(double)a3
{
  self->_unfocusingBackgroundFadeDurationPercentage = a3;
}

- (double)focusingDelay
{
  return self->_focusingDelay;
}

- (void)setFocusingDelay:(double)a3
{
  self->_focusingDelay = a3;
}

@end