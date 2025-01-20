@interface DeviceGroupResolutionResult
+ (id)confirmationRequiredWithDeviceGroupToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithDeviceGroupsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedDeviceGroup:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (DeviceGroupResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeviceGroupResolutionResult

+ (id)successWithResolvedDeviceGroup:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A62570((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithDeviceGroupsToDisambiguate:(id)a3
{
  type metadata accessor for DeviceGroup();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A625D4(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithDeviceGroupToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A626CC((uint64_t)a3);

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

- (DeviceGroupResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (DeviceGroupResolutionResult *)DeviceGroupResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end