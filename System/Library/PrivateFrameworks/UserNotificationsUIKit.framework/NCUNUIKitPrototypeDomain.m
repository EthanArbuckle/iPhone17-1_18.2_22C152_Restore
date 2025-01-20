@interface NCUNUIKitPrototypeDomain
+ (Class)rootSettingsClass;
+ (NCUNUIKitPrototypeSettings)rootSettings;
+ (id)domainGroupName;
+ (id)domainName;
@end

@implementation NCUNUIKitPrototypeDomain

+ (NCUNUIKitPrototypeSettings)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NCUNUIKitPrototypeDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);

  return (NCUNUIKitPrototypeSettings *)v2;
}

+ (id)domainGroupName
{
  return @"UserNotificationsUI";
}

+ (id)domainName
{
  return @"userNotificationsUIKit";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end