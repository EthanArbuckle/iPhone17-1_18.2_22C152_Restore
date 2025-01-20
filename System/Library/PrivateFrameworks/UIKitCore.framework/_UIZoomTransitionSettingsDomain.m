@interface _UIZoomTransitionSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation _UIZoomTransitionSettingsDomain

+ (id)rootSettings
{
  swift_getObjCClassMetadata();
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS____TtC5UIKit31_UIZoomTransitionSettingsDomain;
  id result = objc_msgSendSuper2(&v4, sel_rootSettings);
  if (result)
  {
    type metadata accessor for _UIZoomTransitionSpec();
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

+ (Class)rootSettingsClass
{
  type metadata accessor for _UIZoomTransitionSpec();
  return (Class)swift_getObjCClassFromMetadata();
}

@end