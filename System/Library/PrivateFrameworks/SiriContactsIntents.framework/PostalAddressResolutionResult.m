@interface PostalAddressResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithPostalAddressToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithPostalAddresssToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedPostalAddress:(id)a3;
- (PostalAddressResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PostalAddressResolutionResult

+ (id)successWithResolvedPostalAddress:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static PostalAddressResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithPostalAddresssToDisambiguate:(id)a3
{
  type metadata accessor for PostalAddress();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v4 = static PostalAddressResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithPostalAddressToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static PostalAddressResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3 = a3;
  static PostalAddressResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3 = a3;
  static PostalAddressResolutionResult.confirmationRequired(with:)();
}

- (PostalAddressResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (PostalAddressResolutionResult *)PostalAddressResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end