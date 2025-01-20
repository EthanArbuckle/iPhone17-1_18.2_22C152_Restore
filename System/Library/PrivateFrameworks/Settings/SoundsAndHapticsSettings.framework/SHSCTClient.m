@interface SHSCTClient
@end

@implementation SHSCTClient

uint64_t ___SHSCTClient_block_invoke()
{
  _SHSCTClient_coreTelephonyClient = (uint64_t)objc_alloc_init(MEMORY[0x263F02D30]);
  return MEMORY[0x270F9A758]();
}

@end