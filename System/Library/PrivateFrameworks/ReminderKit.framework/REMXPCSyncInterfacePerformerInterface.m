@interface REMXPCSyncInterfacePerformerInterface
+ (id)interface;
@end

@implementation REMXPCSyncInterfacePerformerInterface

uint64_t __50__REMXPCSyncInterfacePerformerInterface_interface__block_invoke()
{
  interface_result_0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F139A410];

  return MEMORY[0x1F41817F8]();
}

+ (id)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)interface_result_0;

  return v2;
}

@end