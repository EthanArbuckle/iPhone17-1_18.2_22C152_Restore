@interface WFWeatherDataServiceParserV1(ParseAirQuality)
@end

@implementation WFWeatherDataServiceParserV1(ParseAirQuality)

- (void)parseAirQualityFromData:()ParseAirQuality locale:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "Successfully parsed aqi conditions: %@", (uint8_t *)&v2, 0xCu);
}

@end