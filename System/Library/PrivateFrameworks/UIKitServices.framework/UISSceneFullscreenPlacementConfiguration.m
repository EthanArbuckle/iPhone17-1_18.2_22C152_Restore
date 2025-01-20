@interface UISSceneFullscreenPlacementConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (unint64_t)placementType;
@end

@implementation UISSceneFullscreenPlacementConfiguration

+ (unint64_t)placementType
{
  return 4;
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