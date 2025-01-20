@interface VolumeSettingTypeResolutionResult
+ (id)confirmationRequiredWithVolumeSettingTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedVolumeSettingType:(int64_t)a3;
- (VolumeSettingTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation VolumeSettingTypeResolutionResult

+ (id)successWithResolvedVolumeSettingType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithVolumeSettingTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (VolumeSettingTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (VolumeSettingTypeResolutionResult *)VolumeSettingTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end