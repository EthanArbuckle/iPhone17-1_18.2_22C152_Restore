@interface ISSoftwareMapXPC
@end

@implementation ISSoftwareMapXPC

uint64_t ____ISSoftwareMapXPC_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F7B438]);
  uint64_t result = [v0 initWithServiceName:*MEMORY[0x263F7BD68]];
  __ISSoftwareMapXPC_sConnection = result;
  return result;
}

@end