@interface NSXPCInterface
@end

@implementation NSXPCInterface

uint64_t __55__NSXPCInterface_TUUIXPCClientSupport__clientInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED30E58];
  v1 = (void *)clientInterface_interface;
  clientInterface_interface = v0;

  v2 = (void *)clientInterface_interface;

  return [v2 setAllowedClassesForClientProtocol];
}

uint64_t __53__NSXPCInterface_TUUIXPCClientSupport__hostInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED29208];
  v1 = (void *)hostInterface_interface;
  hostInterface_interface = v0;

  v2 = (void *)hostInterface_interface;

  return [v2 setAllowedClassesForHostProtocol];
}

@end