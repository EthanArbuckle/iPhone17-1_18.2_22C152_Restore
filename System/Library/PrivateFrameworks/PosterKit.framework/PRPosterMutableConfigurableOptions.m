@interface PRPosterMutableConfigurableOptions
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
@end

@implementation PRPosterMutableConfigurableOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end