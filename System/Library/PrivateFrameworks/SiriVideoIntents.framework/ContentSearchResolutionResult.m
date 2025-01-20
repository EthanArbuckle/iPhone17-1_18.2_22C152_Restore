@interface ContentSearchResolutionResult
+ (id)confirmationRequiredWithContentSearchToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithContentSearchsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedContentSearch:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ContentSearchResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContentSearchResolutionResult

+ (id)successWithResolvedContentSearch:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContentSearchResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithContentSearchsToDisambiguate:(id)a3
{
  type metadata accessor for ContentSearch();
  unint64_t v3 = sub_22BD4AFB0();
  swift_getObjCClassMetadata();
  id v4 = static ContentSearchResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithContentSearchToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContentSearchResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (ContentSearchResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (ContentSearchResolutionResult *)ContentSearchResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end