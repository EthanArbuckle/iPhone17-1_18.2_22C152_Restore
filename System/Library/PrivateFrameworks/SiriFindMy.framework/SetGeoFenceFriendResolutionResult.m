@interface SetGeoFenceFriendResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (SetGeoFenceFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SetGeoFenceFriendResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  v4 = (void *)static SetGeoFenceFriendResolutionResult.unsupported(forReason:)(a3);

  return v4;
}

- (SetGeoFenceFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (SetGeoFenceFriendResolutionResult *)SetGeoFenceFriendResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end