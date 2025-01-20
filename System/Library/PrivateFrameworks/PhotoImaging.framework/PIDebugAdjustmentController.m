@interface PIDebugAdjustmentController
+ (NSString)falseColorHDRKey;
+ (NSString)headroomAdjustmentKey;
+ (NSString)inputExposureKey;
+ (NSString)inputRAWGamutMapMaxKey;
+ (NSString)outputExposureKey;
@end

@implementation PIDebugAdjustmentController

+ (NSString)inputRAWGamutMapMaxKey
{
  return (NSString *)@"inputRAWGamutMapMax";
}

+ (NSString)falseColorHDRKey
{
  return (NSString *)@"falseColorHDR";
}

+ (NSString)headroomAdjustmentKey
{
  return (NSString *)@"headroomAdjust";
}

+ (NSString)outputExposureKey
{
  return (NSString *)@"outputExposure";
}

+ (NSString)inputExposureKey
{
  return (NSString *)@"inputExposure";
}

@end