@interface _SBTestRecipeDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
@end

@implementation _SBTestRecipeDomain

+ (id)domainGroupName
{
  return @"SpringBoard";
}

+ (id)domainName
{
  return @"Misc";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end