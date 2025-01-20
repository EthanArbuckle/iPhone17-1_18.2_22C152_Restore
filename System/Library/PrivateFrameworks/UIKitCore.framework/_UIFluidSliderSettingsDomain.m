@interface _UIFluidSliderSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation _UIFluidSliderSettingsDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIFluidSliderSettingsDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"UIKit";
}

+ (id)domainName
{
  return @"Fluid Slider Interaction";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end