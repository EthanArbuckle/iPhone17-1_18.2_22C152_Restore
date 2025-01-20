@interface GeoFenceActionResolutionResult
+ (id)confirmationRequiredWithGeoFenceActionToConfirm:(int64_t)a3;
+ (id)successWithResolvedGeoFenceAction:(int64_t)a3;
- (GeoFenceActionResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation GeoFenceActionResolutionResult

+ (id)successWithResolvedGeoFenceAction:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static GeoFenceActionResolutionResult.success(with:)(a3);

  return v4;
}

+ (id)confirmationRequiredWithGeoFenceActionToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static GeoFenceActionResolutionResult.confirmationRequired(with:)(a3);

  return v4;
}

- (GeoFenceActionResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (GeoFenceActionResolutionResult *)GeoFenceActionResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end