@interface SetVolumeLevelDevicesResolutionResult
- (SetVolumeLevelDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SetVolumeLevelDevicesResolutionResult

- (SetVolumeLevelDevicesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (SetVolumeLevelDevicesResolutionResult *)SetVolumeLevelDevicesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end