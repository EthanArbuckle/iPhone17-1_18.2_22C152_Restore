@interface LiveServiceResolutionResult
+ (id)confirmationRequiredWithLiveServiceToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithLiveServicesToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedLiveService:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (LiveServiceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation LiveServiceResolutionResult

+ (id)successWithResolvedLiveService:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static LiveServiceResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithLiveServicesToDisambiguate:(id)a3
{
  type metadata accessor for LiveService();
  unint64_t v3 = sub_22BD4AFB0();
  swift_getObjCClassMetadata();
  id v4 = static LiveServiceResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithLiveServiceToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static LiveServiceResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (LiveServiceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (LiveServiceResolutionResult *)LiveServiceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end