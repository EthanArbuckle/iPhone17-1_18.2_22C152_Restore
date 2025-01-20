@interface SetAudioLanguageDeviceResolutionResult
- (SetAudioLanguageDeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SetAudioLanguageDeviceResolutionResult

- (SetAudioLanguageDeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (SetAudioLanguageDeviceResolutionResult *)SetAudioLanguageDeviceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end