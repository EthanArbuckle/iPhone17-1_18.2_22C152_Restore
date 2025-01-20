@interface DeviceQueryResolutionResult
+ (id)confirmationRequiredWithDeviceQueryToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithDeviceQuerysToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedDeviceQuery:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (DeviceQueryResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeviceQueryResolutionResult

+ (id)successWithResolvedDeviceQuery:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static DeviceQueryResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithDeviceQuerysToDisambiguate:(id)a3
{
  type metadata accessor for DeviceQuery();
  unint64_t v3 = sub_1D463FAE8();
  swift_getObjCClassMetadata();
  id v4 = static DeviceQueryResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithDeviceQueryToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static DeviceQueryResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (DeviceQueryResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (DeviceQueryResolutionResult *)DeviceQueryResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end