@interface SUICAudioPowerLevelLinearConverter
+ (float)_adjustedLinearPowerLevel:(float)a3 isInput:(BOOL)a4;
+ (float)_expectedLinearInputPowerLevelMaximum;
+ (float)_linearValueForPowerLevel:(float)a3 shouldAdjustForDeviceType:(BOOL)a4 isInput:(BOOL)a5;
+ (float)linearValueForInputPowerLevel:(float)a3;
+ (float)linearValueForOutputPowerLevel:(float)a3;
@end

@implementation SUICAudioPowerLevelLinearConverter

+ (float)_linearValueForPowerLevel:(float)a3 shouldAdjustForDeviceType:(BOOL)a4 isInput:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  *(float *)&double v8 = __exp10f(a3 / 20.0);
  if (v6) {
    [a1 _adjustedLinearPowerLevel:v5 isInput:v8];
  }
  if (*(float *)&v8 > 1.0) {
    *(float *)&double v8 = 1.0;
  }
  return fmaxf(*(float *)&v8, 0.0);
}

+ (float)linearValueForInputPowerLevel:(float)a3
{
  objc_msgSend(a1, "_linearValueForPowerLevel:shouldAdjustForDeviceType:isInput:", 1, 1);
  return result;
}

+ (float)linearValueForOutputPowerLevel:(float)a3
{
  objc_msgSend(a1, "_linearValueForPowerLevel:shouldAdjustForDeviceType:isInput:", 1, 0);
  return result;
}

+ (float)_adjustedLinearPowerLevel:(float)a3 isInput:(BOOL)a4
{
  if (a4) {
    [a1 _expectedLinearInputPowerLevelMaximum];
  }
  else {
    float v5 = 0.0316;
  }
  return a3 / v5;
}

+ (float)_expectedLinearInputPowerLevelMaximum
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return flt_1A64FBBC0[v3];
}

@end