@interface SecurityIntentAccessoryResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSecurityIntentAccessoryToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSecurityIntentAccessorysToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSecurityIntentAccessory:(id)a3;
- (SecurityIntentAccessoryResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SecurityIntentAccessoryResolutionResult

+ (id)successWithResolvedSecurityIntentAccessory:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static SecurityIntentAccessoryResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSecurityIntentAccessorysToDisambiguate:(id)a3
{
  type metadata accessor for SecurityIntentAccessory();
  unint64_t v3 = sub_10002A038();
  swift_getObjCClassMetadata();
  id v4 = static SecurityIntentAccessoryResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithSecurityIntentAccessoryToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static SecurityIntentAccessoryResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_10002A2A8();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_10002A2A8();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_10002A2A8();
  __break(1u);
  return result;
}

- (SecurityIntentAccessoryResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_100029E88();
  id v6 = a4;
  Class isa = sub_100029E78().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SecurityIntentAccessoryResolutionResult();
  v8 = [(SecurityIntentAccessoryResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end