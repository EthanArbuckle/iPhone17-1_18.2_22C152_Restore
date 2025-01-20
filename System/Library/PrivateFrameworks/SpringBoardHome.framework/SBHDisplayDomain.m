@interface SBHDisplayDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation SBHDisplayDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SBHDisplayDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"SpringBoard";
}

+ (id)domainName
{
  return @"Display";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end