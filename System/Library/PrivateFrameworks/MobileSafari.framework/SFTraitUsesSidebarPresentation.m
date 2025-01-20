@interface SFTraitUsesSidebarPresentation
+ (NSString)name;
+ (int64_t)defaultValue;
@end

@implementation SFTraitUsesSidebarPresentation

+ (NSString)name
{
  return (NSString *)@"usesSidebarPresentation";
}

+ (int64_t)defaultValue
{
  return 0;
}

@end