@interface MFPBrightnessContrastEffect
+ (id)GUID;
- (MFPBrightnessContrastEffect)initWithBrightness:(int)a3 contrast:(int)a4;
@end

@implementation MFPBrightnessContrastEffect

+ (id)GUID
{
  return @"D3A1DBE1-8EC4-4C17-9F4C-EA97AD1C343D";
}

- (MFPBrightnessContrastEffect)initWithBrightness:(int)a3 contrast:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MFPBrightnessContrastEffect;
  result = [(MFPBrightnessContrastEffect *)&v7 init];
  if (result)
  {
    result->mBrightness = a3;
    result->mContrast = a4;
  }
  return result;
}

@end