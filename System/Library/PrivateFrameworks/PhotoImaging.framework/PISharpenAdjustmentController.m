@interface PISharpenAdjustmentController
+ (NSString)edgesKey;
+ (NSString)falloffKey;
+ (NSString)intensityKey;
@end

@implementation PISharpenAdjustmentController

+ (NSString)falloffKey
{
  return (NSString *)@"falloff";
}

+ (NSString)edgesKey
{
  return (NSString *)@"edges";
}

+ (NSString)intensityKey
{
  return (NSString *)@"intensity";
}

@end