@interface NSXPCInterface
@end

@implementation NSXPCInterface

uint64_t __80__NSXPCInterface_LTUIViewServiceExtension____LTUI_viewServiceExtensionInterface__block_invoke()
{
  __LTUI_viewServiceExtensionInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C92E088];

  return MEMORY[0x270F9A758]();
}

uint64_t __84__NSXPCInterface_LTUIViewServiceExtension____LTUI_viewServiceExtensionHostInterface__block_invoke()
{
  __LTUI_viewServiceExtensionHostInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C927E58];

  return MEMORY[0x270F9A758]();
}

@end