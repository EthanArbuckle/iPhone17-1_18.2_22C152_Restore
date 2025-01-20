@interface VolumeSettingStateResolutionResult
+ (id)confirmationRequiredWithVolumeSettingStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedVolumeSettingState:(int64_t)a3;
- (VolumeSettingStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation VolumeSettingStateResolutionResult

+ (id)successWithResolvedVolumeSettingState:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithVolumeSettingStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (VolumeSettingStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (VolumeSettingStateResolutionResult *)VolumeSettingStateResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end