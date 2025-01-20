@interface UVPrototypeDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation UVPrototypeDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___UVPrototypeDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);

  return v2;
}

+ (id)domainGroupName
{
  return @"Ultraviolet";
}

+ (id)domainName
{
  return @"UI";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end