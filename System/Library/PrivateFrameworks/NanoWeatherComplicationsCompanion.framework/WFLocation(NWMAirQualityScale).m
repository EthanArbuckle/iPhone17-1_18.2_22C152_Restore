@interface WFLocation(NWMAirQualityScale)
- (uint64_t)nwm_isAQICountry;
- (uint64_t)nwm_isDAQICountry;
- (uint64_t)nwm_isUBACountry;
@end

@implementation WFLocation(NWMAirQualityScale)

- (uint64_t)nwm_isAQICountry
{
  if (nwm_isAQICountry_onceToken != -1) {
    dispatch_once(&nwm_isAQICountry_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)nwm_isAQICountry_AQICountries;
  v3 = [a1 countryAbbreviation];
  v4 = [v3 uppercaseString];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

- (uint64_t)nwm_isDAQICountry
{
  if (nwm_isDAQICountry_onceToken != -1) {
    dispatch_once(&nwm_isDAQICountry_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)nwm_isDAQICountry_DAQICountries;
  v3 = [a1 countryAbbreviation];
  v4 = [v3 uppercaseString];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

- (uint64_t)nwm_isUBACountry
{
  if (nwm_isUBACountry_onceToken != -1) {
    dispatch_once(&nwm_isUBACountry_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)nwm_isUBACountry_UBACountries;
  v3 = [a1 countryAbbreviation];
  v4 = [v3 uppercaseString];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

@end