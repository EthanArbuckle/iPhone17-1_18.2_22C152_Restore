@interface WAAirQualityIsUBA
@end

@implementation WAAirQualityIsUBA

uint64_t ___WAAirQualityIsUBA_block_invoke()
{
  _WAAirQualityIsUBA_UBACountries = [MEMORY[0x263EFFA08] setWithObject:@"DE"];
  return MEMORY[0x270F9A758]();
}

@end