@interface DeviceDetailResolutionResult
+ (id)confirmationRequiredWithDeviceDetailToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithDeviceDetailsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedDeviceDetail:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (DeviceDetailResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeviceDetailResolutionResult

+ (id)successWithResolvedDeviceDetail:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static DeviceDetailResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithDeviceDetailsToDisambiguate:(id)a3
{
  type metadata accessor for DeviceDetail();
  unint64_t v3 = sub_1D463FAE8();
  swift_getObjCClassMetadata();
  id v4 = static DeviceDetailResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithDeviceDetailToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static DeviceDetailResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (DeviceDetailResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (DeviceDetailResolutionResult *)DeviceDetailResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end