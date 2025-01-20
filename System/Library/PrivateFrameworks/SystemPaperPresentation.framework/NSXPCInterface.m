@interface NSXPCInterface
@end

@implementation NSXPCInterface

uint64_t __63__NSXPCInterface_ICSystemPaperExtension__ic_extensionInterface__block_invoke()
{
  ic_extensionInterface_extensionInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0B71D0];

  return MEMORY[0x270F9A758]();
}

uint64_t __58__NSXPCInterface_ICSystemPaperExtension__ic_hostInterface__block_invoke()
{
  ic_hostInterface_hostInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0B45F8];

  return MEMORY[0x270F9A758]();
}

@end