@interface SBFTodayGestureDomain
+ (Class)rootSettingsClass;
+ (SBFTodayGestureSettings)rootSettings;
+ (id)domainGroupName;
+ (id)domainName;
@end

@implementation SBFTodayGestureDomain

+ (SBFTodayGestureSettings)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SBFTodayGestureDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return (SBFTodayGestureSettings *)v2;
}

+ (id)domainGroupName
{
  return @"SpringBoard";
}

+ (id)domainName
{
  return @"Home Scroll";
}

+ (Class)rootSettingsClass
{
  return (Class)self;
}

@end