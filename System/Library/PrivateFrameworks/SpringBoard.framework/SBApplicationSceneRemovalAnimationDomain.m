@interface SBApplicationSceneRemovalAnimationDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation SBApplicationSceneRemovalAnimationDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SBApplicationSceneRemovalAnimationDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"SpringBoard";
}

+ (id)domainName
{
  return @"Entity Removal Animation";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end