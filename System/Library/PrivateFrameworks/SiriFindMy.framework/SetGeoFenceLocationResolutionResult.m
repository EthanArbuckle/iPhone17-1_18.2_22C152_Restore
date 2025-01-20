@interface SetGeoFenceLocationResolutionResult
- (SetGeoFenceLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SetGeoFenceLocationResolutionResult

- (SetGeoFenceLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (SetGeoFenceLocationResolutionResult *)SetGeoFenceLocationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end