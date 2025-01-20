@interface SBFHomeGrabberDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation SBFHomeGrabberDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SBFHomeGrabberDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"SpringBoard";
}

+ (id)domainName
{
  return @"Home Grabber";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end