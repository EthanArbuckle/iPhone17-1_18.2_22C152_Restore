@interface PRMutablePosterDescriptorHomeScreenConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
@end

@implementation PRMutablePosterDescriptorHomeScreenConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end