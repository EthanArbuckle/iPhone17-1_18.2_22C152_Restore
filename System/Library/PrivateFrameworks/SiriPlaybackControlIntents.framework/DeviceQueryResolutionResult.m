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
  id v5 = sub_232A612D8((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithDeviceQuerysToDisambiguate:(id)a3
{
  type metadata accessor for DeviceQuery();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A6138C(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithDeviceQueryToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A614F0((uint64_t)a3);

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
  uint64_t v5 = sub_232A684F8();
  return (DeviceQueryResolutionResult *)DeviceQueryResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end