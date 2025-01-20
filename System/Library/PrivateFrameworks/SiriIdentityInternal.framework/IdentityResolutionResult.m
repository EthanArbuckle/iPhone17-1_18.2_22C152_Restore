@interface IdentityResolutionResult
+ (id)confirmationRequiredWithIdentityToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithIdentitysToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedIdentity:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (IdentityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation IdentityResolutionResult

+ (id)successWithResolvedIdentity:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static IdentityResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithIdentitysToDisambiguate:(id)a3
{
  type metadata accessor for Identity();
  unint64_t v3 = sub_25C8EC200();
  swift_getObjCClassMetadata();
  id v4 = static IdentityResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithIdentityToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static IdentityResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (IdentityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_25C8EC110();
  return (IdentityResolutionResult *)IdentityResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end