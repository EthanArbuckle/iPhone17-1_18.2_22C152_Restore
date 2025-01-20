@interface PersonResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithPersonToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithPersonsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedPerson:(id)a3;
- (PersonResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PersonResolutionResult

+ (id)successWithResolvedPerson:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static PersonResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithPersonsToDisambiguate:(id)a3
{
  type metadata accessor for Person();
  unint64_t v3 = sub_22BD4AFB0();
  swift_getObjCClassMetadata();
  id v4 = static PersonResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithPersonToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static PersonResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (PersonResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (PersonResolutionResult *)PersonResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end