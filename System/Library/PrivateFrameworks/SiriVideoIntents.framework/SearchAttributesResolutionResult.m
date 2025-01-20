@interface SearchAttributesResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSearchAttributesToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSearchAttributessToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSearchAttributes:(id)a3;
- (SearchAttributesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SearchAttributesResolutionResult

+ (id)successWithResolvedSearchAttributes:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static SearchAttributesResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSearchAttributessToDisambiguate:(id)a3
{
  type metadata accessor for SearchAttributes();
  unint64_t v3 = sub_22BD4AFB0();
  swift_getObjCClassMetadata();
  id v4 = static SearchAttributesResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithSearchAttributesToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static SearchAttributesResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (SearchAttributesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (SearchAttributesResolutionResult *)SearchAttributesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end