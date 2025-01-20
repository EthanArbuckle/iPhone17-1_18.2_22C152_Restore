@interface WAAirQualityIsAQI
@end

@implementation WAAirQualityIsAQI

uint64_t ___WAAirQualityIsAQI_block_invoke()
{
  _WAAirQualityIsAQI_AQICountries = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"CN", @"US", @"MX", 0);
  return MEMORY[0x270F9A758]();
}

@end