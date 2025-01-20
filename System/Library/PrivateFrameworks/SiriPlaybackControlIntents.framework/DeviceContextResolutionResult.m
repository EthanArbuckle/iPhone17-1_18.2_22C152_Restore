@interface DeviceContextResolutionResult
+ (id)confirmationRequiredWithDeviceContextToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithDeviceContextsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedDeviceContext:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (DeviceContextResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation DeviceContextResolutionResult

+ (id)successWithResolvedDeviceContext:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A5FB48((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithDeviceContextsToDisambiguate:(id)a3
{
  type metadata accessor for DeviceContext();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A5FBFC(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithDeviceContextToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A5FD60((uint64_t)a3);

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

- (DeviceContextResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (DeviceContextResolutionResult *)DeviceContextResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end