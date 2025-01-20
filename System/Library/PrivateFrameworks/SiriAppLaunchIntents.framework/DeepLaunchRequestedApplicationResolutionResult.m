@interface DeepLaunchRequestedApplicationResolutionResult
- (DeepLaunchRequestedApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeepLaunchRequestedApplicationResolutionResult

- (DeepLaunchRequestedApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (DeepLaunchRequestedApplicationResolutionResult *)DeepLaunchRequestedApplicationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end