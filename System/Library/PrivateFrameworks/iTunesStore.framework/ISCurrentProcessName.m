@interface ISCurrentProcessName
@end

@implementation ISCurrentProcessName

void ____ISCurrentProcessName_block_invoke()
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v0 = [v2 processName];
  v1 = (void *)__ISCurrentProcessName_processName;
  __ISCurrentProcessName_processName = v0;
}

@end