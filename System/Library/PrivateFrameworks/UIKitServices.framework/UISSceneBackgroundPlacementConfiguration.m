@interface UISSceneBackgroundPlacementConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (unint64_t)placementType;
@end

@implementation UISSceneBackgroundPlacementConfiguration

+ (unint64_t)placementType
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end