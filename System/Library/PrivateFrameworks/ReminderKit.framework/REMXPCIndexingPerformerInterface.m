@interface REMXPCIndexingPerformerInterface
+ (id)interface;
@end

@implementation REMXPCIndexingPerformerInterface

+ (id)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)interface_result;

  return v2;
}

uint64_t __45__REMXPCIndexingPerformerInterface_interface__block_invoke()
{
  interface_result = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F139A3B0];

  return MEMORY[0x1F41817F8]();
}

@end