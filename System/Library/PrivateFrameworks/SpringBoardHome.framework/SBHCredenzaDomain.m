@interface SBHCredenzaDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
@end

@implementation SBHCredenzaDomain

+ (id)domainGroupName
{
  return @"SpringBoard";
}

+ (id)domainName
{
  return @"Credenza";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end