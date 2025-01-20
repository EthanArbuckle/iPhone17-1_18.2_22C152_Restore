@interface UISSceneStandardPlacementConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (unint64_t)placementType;
@end

@implementation UISSceneStandardPlacementConfiguration

+ (unint64_t)placementType
{
  return 1;
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