@interface AccountResolutionResult
+ (id)confirmationRequiredWithAccountToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithAccountsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedAccount:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (AccountResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation AccountResolutionResult

+ (id)successWithResolvedAccount:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static AccountResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithAccountsToDisambiguate:(id)a3
{
  type metadata accessor for Account();
  unint64_t v3 = sub_25C8EC200();
  swift_getObjCClassMetadata();
  id v4 = static AccountResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithAccountToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static AccountResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (AccountResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_25C8EC110();
  return (AccountResolutionResult *)AccountResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end