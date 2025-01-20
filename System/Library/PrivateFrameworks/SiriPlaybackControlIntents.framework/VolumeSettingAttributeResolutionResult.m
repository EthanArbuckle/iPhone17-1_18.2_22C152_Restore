@interface VolumeSettingAttributeResolutionResult
+ (id)confirmationRequiredWithVolumeSettingAttributeToConfirm:(int64_t)a3;
+ (id)successWithResolvedVolumeSettingAttribute:(int64_t)a3;
- (VolumeSettingAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation VolumeSettingAttributeResolutionResult

+ (id)successWithResolvedVolumeSettingAttribute:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithVolumeSettingAttributeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (VolumeSettingAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (VolumeSettingAttributeResolutionResult *)VolumeSettingAttributeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end