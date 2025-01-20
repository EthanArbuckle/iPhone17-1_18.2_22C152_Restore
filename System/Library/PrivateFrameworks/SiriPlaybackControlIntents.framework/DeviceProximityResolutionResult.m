@interface DeviceProximityResolutionResult
+ (id)confirmationRequiredWithDeviceProximityToConfirm:(int64_t)a3;
+ (id)successWithResolvedDeviceProximity:(int64_t)a3;
- (DeviceProximityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeviceProximityResolutionResult

+ (id)successWithResolvedDeviceProximity:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithDeviceProximityToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (DeviceProximityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (DeviceProximityResolutionResult *)DeviceProximityResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end