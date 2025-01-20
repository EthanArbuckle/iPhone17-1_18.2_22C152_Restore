@interface GeoFenceTriggerResolutionResult
+ (id)confirmationRequiredWithGeoFenceTriggerToConfirm:(int64_t)a3;
+ (id)successWithResolvedGeoFenceTrigger:(int64_t)a3;
- (GeoFenceTriggerResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation GeoFenceTriggerResolutionResult

+ (id)successWithResolvedGeoFenceTrigger:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static GeoFenceTriggerResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithGeoFenceTriggerToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static GeoFenceTriggerResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (GeoFenceTriggerResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (GeoFenceTriggerResolutionResult *)GeoFenceTriggerResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end