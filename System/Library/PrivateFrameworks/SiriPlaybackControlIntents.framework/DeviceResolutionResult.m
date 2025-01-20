@interface DeviceResolutionResult
+ (id)confirmationRequiredWithDeviceToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithDevicesToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedDevice:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (DeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeviceResolutionResult

+ (id)successWithResolvedDevice:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_23281AD70((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithDevicesToDisambiguate:(id)a3
{
  type metadata accessor for Device();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A5DEC4(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithDeviceToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A5DFFC((uint64_t)a3);

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

- (DeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (DeviceResolutionResult *)DeviceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end