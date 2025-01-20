@interface ResultEntityResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithResultEntityToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithResultEntitysToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedResultEntity:(id)a3;
- (ResultEntityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ResultEntityResolutionResult

+ (id)successWithResolvedResultEntity:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ResultEntityResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithResultEntitysToDisambiguate:(id)a3
{
  type metadata accessor for ResultEntity();
  unint64_t v3 = sub_22BD4AFB0();
  swift_getObjCClassMetadata();
  id v4 = static ResultEntityResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithResultEntityToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ResultEntityResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (ResultEntityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (ResultEntityResolutionResult *)ResultEntityResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end