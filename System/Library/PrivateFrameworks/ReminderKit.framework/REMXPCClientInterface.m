@interface REMXPCClientInterface
+ (NSXPCInterface)interface;
@end

@implementation REMXPCClientInterface

uint64_t __34__REMXPCClientInterface_interface__block_invoke()
{
  interface_sInterface_26 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F137E908];

  return MEMORY[0x1F41817F8]();
}

+ (NSXPCInterface)interface
{
  if (interface_onceToken_27 != -1) {
    dispatch_once(&interface_onceToken_27, &__block_literal_global_29);
  }
  v2 = (void *)interface_sInterface_26;

  return (NSXPCInterface *)v2;
}

@end