@interface ContentResolutionResult
+ (id)confirmationRequiredWithContentToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithContentsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedContent:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContentResolutionResult

+ (id)successWithResolvedContent:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContentResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithContentsToDisambiguate:(id)a3
{
  type metadata accessor for Content();
  unint64_t v3 = sub_22BD4AFB0();
  swift_getObjCClassMetadata();
  id v4 = static ContentResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithContentToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContentResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (ContentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (ContentResolutionResult *)ContentResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end