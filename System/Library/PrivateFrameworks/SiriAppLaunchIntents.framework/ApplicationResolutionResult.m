@interface ApplicationResolutionResult
+ (id)confirmationRequiredWithApplicationToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithApplicationsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedApplication:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ApplicationResolutionResult

+ (id)successWithResolvedApplication:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ApplicationResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithApplicationsToDisambiguate:(id)a3
{
  type metadata accessor for Application();
  unint64_t v3 = sub_23785B7A0();
  swift_getObjCClassMetadata();
  id v4 = static ApplicationResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithApplicationToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ApplicationResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (ApplicationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_23785B640();
  return (ApplicationResolutionResult *)ApplicationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end