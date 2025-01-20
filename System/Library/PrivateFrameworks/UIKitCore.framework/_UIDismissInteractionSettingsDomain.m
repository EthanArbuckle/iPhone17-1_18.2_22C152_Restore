@interface _UIDismissInteractionSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation _UIDismissInteractionSettingsDomain

+ (Class)rootSettingsClass
{
  type metadata accessor for _UIDismissInteractionSettings();
  return (Class)swift_getObjCClassFromMetadata();
}

+ (id)rootSettings
{
  swift_getObjCClassMetadata();
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS____TtC5UIKit35_UIDismissInteractionSettingsDomain;
  id result = objc_msgSendSuper2(&v4, sel_rootSettings);
  if (result)
  {
    type metadata accessor for _UIDismissInteractionSettings();
    v3 = (void *)swift_dynamicCastClassUnconditional();
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)domainName
{
  v2 = (void *)sub_186A1E92C();
  return v2;
}

+ (id)domainGroupName
{
  v2 = (void *)sub_186A1E92C();
  return v2;
}

@end