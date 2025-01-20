@interface PFRestrictionsUtil
+ (BOOL)isExplicitContentAllowed;
@end

@implementation PFRestrictionsUtil

+ (BOOL)isExplicitContentAllowed
{
  return +[PFRestrictionsController isExplicitContentAllowed];
}

@end