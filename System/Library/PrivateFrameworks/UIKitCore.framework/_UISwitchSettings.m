@interface _UISwitchSettings
+ (id)sharedSettings;
- (BOOL)feedbackEnabled;
- (double)hapticDelay;
- (double)impactIntensity;
- (double)knobSpringAnimationDamping;
- (double)knobSpringAnimationDuration;
- (double)knobSpringAnimationMass;
- (double)knobSpringAnimationStiffness;
- (double)knobSpringDampingAnimationTouchDown;
- (double)knobSpringDampingAnimationTouchUp;
- (double)knobSpringDurationAnimationTouchDown;
- (double)knobSpringDurationAnimationTouchUp;
- (double)knobSpringMassAnimationTouchDown;
- (double)knobSpringMassAnimationTouchUp;
- (double)knobSpringStiffnessAnimationTouchDown;
- (double)knobSpringStiffnessAnimationTouchUp;
- (double)knobTouchDownSpringAnimationDamping;
- (double)knobTouchDownSpringAnimationDuration;
- (double)knobTouchDownSpringAnimationMass;
- (double)knobTouchDownSpringAnimationStiffness;
- (double)trackBorderGoingOffAnimationBeginTimeOffset;
- (double)trackBorderGoingOffAnimationDuration;
- (double)trackBorderGoingOnAnimationDuration;
- (double)trackColorAnimationDuration;
- (double)trackGoingOffSpringAnimationDamping;
- (double)trackGoingOffSpringAnimationDuration;
- (double)trackGoingOffSpringAnimationMass;
- (double)trackGoingOffSpringAnimationStiffness;
- (double)trackGoingOnSpringAnimationDamping;
- (double)trackGoingOnSpringAnimationDuration;
- (double)trackGoingOnSpringAnimationMass;
- (double)trackGoingOnSpringAnimationStiffness;
@end

@implementation _UISwitchSettings

+ (id)sharedSettings
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___UISwitchSettings_sharedSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_17_1 != -1) {
    dispatch_once(&_MergedGlobals_17_1, block);
  }
  v2 = (void *)qword_1EB25D068;
  return v2;
}

- (double)trackBorderGoingOnAnimationDuration
{
  return 0.39;
}

- (double)trackBorderGoingOffAnimationDuration
{
  return 0.365;
}

- (double)trackBorderGoingOffAnimationBeginTimeOffset
{
  return 0.025;
}

- (double)trackColorAnimationDuration
{
  return 0.18;
}

- (double)knobSpringMassAnimationTouchDown
{
  return 1.2;
}

- (double)knobSpringMassAnimationTouchUp
{
  return 1.0;
}

- (double)knobSpringStiffnessAnimationTouchDown
{
  return 300.0;
}

- (double)knobSpringStiffnessAnimationTouchUp
{
  return 350.0;
}

- (double)knobSpringDampingAnimationTouchDown
{
  return 30.0;
}

- (double)knobSpringDampingAnimationTouchUp
{
  return 26.0;
}

- (double)knobSpringDurationAnimationTouchDown
{
  return 0.3;
}

- (double)knobSpringDurationAnimationTouchUp
{
  return 0.5;
}

- (double)knobSpringAnimationMass
{
  return 1.0;
}

- (double)knobSpringAnimationStiffness
{
  return 438.649084;
}

- (double)knobSpringAnimationDamping
{
  return 31.4159265;
}

- (double)knobSpringAnimationDuration
{
  return 0.488013841;
}

- (double)knobTouchDownSpringAnimationMass
{
  return 1.0;
}

- (double)knobTouchDownSpringAnimationStiffness
{
  return 322.272797;
}

- (double)knobTouchDownSpringAnimationDamping
{
  return 31.236407;
}

- (double)knobTouchDownSpringAnimationDuration
{
  return 0.507396551;
}

- (double)trackGoingOnSpringAnimationMass
{
  return 1.0;
}

- (double)trackGoingOnSpringAnimationStiffness
{
  return 246.74011;
}

- (double)trackGoingOnSpringAnimationDamping
{
  return 31.4159265;
}

- (double)trackGoingOnSpringAnimationDuration
{
  return 0.58792069;
}

- (double)trackGoingOffSpringAnimationMass
{
  return 1.0;
}

- (double)trackGoingOffSpringAnimationStiffness
{
  return 85.3772007;
}

- (double)trackGoingOffSpringAnimationDamping
{
  return 18.4799568;
}

- (double)trackGoingOffSpringAnimationDuration
{
  return 0.999465174;
}

- (BOOL)feedbackEnabled
{
  return 1;
}

- (double)hapticDelay
{
  return 0.0;
}

- (double)impactIntensity
{
  return 1.0;
}

@end