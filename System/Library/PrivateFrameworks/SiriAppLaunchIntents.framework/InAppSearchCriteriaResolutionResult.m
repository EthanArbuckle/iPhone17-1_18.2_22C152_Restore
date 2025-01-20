@interface InAppSearchCriteriaResolutionResult
+ (id)confirmationRequiredWithInAppSearchCriteriaToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithInAppSearchCriteriasToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedInAppSearchCriteria:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (InAppSearchCriteriaResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation InAppSearchCriteriaResolutionResult

+ (id)successWithResolvedInAppSearchCriteria:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static InAppSearchCriteriaResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithInAppSearchCriteriasToDisambiguate:(id)a3
{
  type metadata accessor for InAppSearchCriteria();
  unint64_t v3 = sub_23785B7A0();
  swift_getObjCClassMetadata();
  id v4 = static InAppSearchCriteriaResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithInAppSearchCriteriaToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static InAppSearchCriteriaResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (InAppSearchCriteriaResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (InAppSearchCriteriaResolutionResult *)InAppSearchCriteriaResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end