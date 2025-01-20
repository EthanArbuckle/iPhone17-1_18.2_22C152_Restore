@interface WAAirQualityIsDAQI
@end

@implementation WAAirQualityIsDAQI

uint64_t ___WAAirQualityIsDAQI_block_invoke()
{
  _WAAirQualityIsDAQI_DAQICountries = [MEMORY[0x263EFFA08] setWithObject:@"GB"];
  return MEMORY[0x270F9A758]();
}

@end