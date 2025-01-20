@interface VolumeSettingQualifierResolutionResult
+ (id)confirmationRequiredWithVolumeSettingQualifierToConfirm:(int64_t)a3;
+ (id)successWithResolvedVolumeSettingQualifier:(int64_t)a3;
- (VolumeSettingQualifierResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation VolumeSettingQualifierResolutionResult

+ (id)successWithResolvedVolumeSettingQualifier:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithVolumeSettingQualifierToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (VolumeSettingQualifierResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (VolumeSettingQualifierResolutionResult *)VolumeSettingQualifierResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end