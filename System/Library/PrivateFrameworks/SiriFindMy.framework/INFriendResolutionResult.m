@interface INFriendResolutionResult
+ (id)confirmationRequiredWithINFriendToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithINFriendsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedINFriend:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (INFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation INFriendResolutionResult

+ (id)successWithResolvedINFriend:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static INFriendResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithINFriendsToDisambiguate:(id)a3
{
  type metadata accessor for INFriend();
  unint64_t v3 = sub_1D463FAE8();
  swift_getObjCClassMetadata();
  id v4 = static INFriendResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithINFriendToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static INFriendResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (INFriendResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (INFriendResolutionResult *)INFriendResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end