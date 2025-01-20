@interface DeviceLocalityResolutionResult
+ (id)confirmationRequiredWithDeviceLocalityToConfirm:(int64_t)a3;
+ (id)successWithResolvedDeviceLocality:(int64_t)a3;
- (DeviceLocalityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeviceLocalityResolutionResult

+ (id)successWithResolvedDeviceLocality:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static DeviceLocalityResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithDeviceLocalityToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static DeviceLocalityResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (DeviceLocalityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (DeviceLocalityResolutionResult *)DeviceLocalityResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end