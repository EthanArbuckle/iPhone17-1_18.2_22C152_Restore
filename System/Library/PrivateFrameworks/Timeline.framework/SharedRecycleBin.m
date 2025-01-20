@interface SharedRecycleBin
@end

@implementation SharedRecycleBin

uint64_t ___SharedRecycleBin_block_invoke()
{
  _SharedRecycleBin_recycleBin = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:512 capacity:1000];
  return MEMORY[0x270F9A758]();
}

@end