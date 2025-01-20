@interface PRPosterHomeScreenAppearance
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
@end

@implementation PRPosterHomeScreenAppearance

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end