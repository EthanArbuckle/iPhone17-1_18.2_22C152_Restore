@interface DeviceSpecificityLevelResolutionResult
+ (id)confirmationRequiredWithDeviceSpecificityLevelToConfirm:(int64_t)a3;
+ (id)successWithResolvedDeviceSpecificityLevel:(int64_t)a3;
- (DeviceSpecificityLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeviceSpecificityLevelResolutionResult

+ (id)successWithResolvedDeviceSpecificityLevel:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static DeviceSpecificityLevelResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithDeviceSpecificityLevelToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static DeviceSpecificityLevelResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (DeviceSpecificityLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (DeviceSpecificityLevelResolutionResult *)DeviceSpecificityLevelResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end