@interface WeatherLocationResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithWeatherLocationToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithWeatherLocationsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedWeatherLocation:(id)a3;
- (WeatherLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation WeatherLocationResolutionResult

+ (id)successWithResolvedWeatherLocation:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static WeatherLocationResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithWeatherLocationsToDisambiguate:(id)a3
{
  type metadata accessor for WeatherLocation();
  unint64_t v3 = sub_100053FC8();
  swift_getObjCClassMetadata();
  id v4 = static WeatherLocationResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithWeatherLocationToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static WeatherLocationResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (WeatherLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_100053E88();
  return (WeatherLocationResolutionResult *)WeatherLocationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end