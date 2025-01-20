@interface MFPHueSaturationLightnessEffect
+ (id)GUID;
- (MFPHueSaturationLightnessEffect)initWithHueChange:(int)a3 saturationChange:(int)a4 lightnessChange:(int)a5;
@end

@implementation MFPHueSaturationLightnessEffect

+ (id)GUID
{
  return @"8B2DD6C3-EB07-4D87-A5F0-7108E26A9C5F";
}

- (MFPHueSaturationLightnessEffect)initWithHueChange:(int)a3 saturationChange:(int)a4 lightnessChange:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MFPHueSaturationLightnessEffect;
  result = [(MFPHueSaturationLightnessEffect *)&v9 init];
  if (result)
  {
    result->mHueChange = a3;
    result->mSaturationChange = a4;
    result->mLightnessChange = a5;
  }
  return result;
}

@end