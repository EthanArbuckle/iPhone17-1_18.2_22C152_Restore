@interface PUIDPointerDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation PUIDPointerDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PUIDPointerDomain;
  v2 = objc_msgSendSuper2(&v4, "rootSettings");
  return v2;
}

+ (id)domainGroupName
{
  return @"Pointer";
}

+ (id)domainName
{
  return @"PointerUI Daemon";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end