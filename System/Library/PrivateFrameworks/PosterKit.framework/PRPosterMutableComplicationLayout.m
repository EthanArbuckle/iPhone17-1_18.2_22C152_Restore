@interface PRPosterMutableComplicationLayout
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
@end

@implementation PRPosterMutableComplicationLayout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end