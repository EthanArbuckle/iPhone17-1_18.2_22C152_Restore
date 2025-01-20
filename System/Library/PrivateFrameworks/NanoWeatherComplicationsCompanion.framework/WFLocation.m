@interface WFLocation
@end

@implementation WFLocation

uint64_t __50__WFLocation_NWMAirQualityScale__nwm_isAQICountry__block_invoke()
{
  nwm_isAQICountry_AQICountries = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"CN", @"US", @"MX", @"IN", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __51__WFLocation_NWMAirQualityScale__nwm_isDAQICountry__block_invoke()
{
  nwm_isDAQICountry_DAQICountries = [MEMORY[0x263EFFA08] setWithObject:@"GB"];

  return MEMORY[0x270F9A758]();
}

uint64_t __50__WFLocation_NWMAirQualityScale__nwm_isUBACountry__block_invoke()
{
  nwm_isUBACountry_UBACountries = [MEMORY[0x263EFFA08] setWithObject:@"DE"];

  return MEMORY[0x270F9A758]();
}

@end