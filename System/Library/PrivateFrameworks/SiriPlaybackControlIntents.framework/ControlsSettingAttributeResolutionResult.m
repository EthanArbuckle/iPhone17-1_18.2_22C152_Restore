@interface ControlsSettingAttributeResolutionResult
+ (id)confirmationRequiredWithControlsSettingAttributeToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithControlsSettingAttributesToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedControlsSettingAttribute:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ControlsSettingAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ControlsSettingAttributeResolutionResult

+ (id)successWithResolvedControlsSettingAttribute:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A6495C((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithControlsSettingAttributesToDisambiguate:(id)a3
{
  type metadata accessor for ControlsSettingAttribute();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A64A10(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithControlsSettingAttributeToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A64B74((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
}

- (ControlsSettingAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (ControlsSettingAttributeResolutionResult *)ControlsSettingAttributeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end