@interface VolumeSettingUnitResolutionResult
+ (id)confirmationRequiredWithVolumeSettingUnitToConfirm:(int64_t)a3;
+ (id)successWithResolvedVolumeSettingUnit:(int64_t)a3;
- (VolumeSettingUnitResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation VolumeSettingUnitResolutionResult

+ (id)successWithResolvedVolumeSettingUnit:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithVolumeSettingUnitToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (VolumeSettingUnitResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (VolumeSettingUnitResolutionResult *)VolumeSettingUnitResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end