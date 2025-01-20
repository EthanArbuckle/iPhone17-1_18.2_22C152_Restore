@interface AddSpeakerDestinationsResolutionResult
- (AddSpeakerDestinationsResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation AddSpeakerDestinationsResolutionResult

- (AddSpeakerDestinationsResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (AddSpeakerDestinationsResolutionResult *)AddSpeakerDestinationsResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end