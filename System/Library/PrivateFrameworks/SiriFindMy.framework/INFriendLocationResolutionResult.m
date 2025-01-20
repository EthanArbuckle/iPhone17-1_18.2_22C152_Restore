@interface INFriendLocationResolutionResult
+ (id)confirmationRequiredWithINFriendLocationToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithINFriendLocationsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedINFriendLocation:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (INFriendLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation INFriendLocationResolutionResult

+ (id)successWithResolvedINFriendLocation:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static INFriendLocationResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithINFriendLocationsToDisambiguate:(id)a3
{
  type metadata accessor for INFriendLocation();
  unint64_t v3 = sub_1D463FAE8();
  swift_getObjCClassMetadata();
  id v4 = static INFriendLocationResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithINFriendLocationToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static INFriendLocationResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
}

- (INFriendLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (INFriendLocationResolutionResult *)INFriendLocationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end