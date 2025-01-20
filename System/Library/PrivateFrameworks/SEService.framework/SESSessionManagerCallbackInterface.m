@interface SESSessionManagerCallbackInterface
+ (id)interface;
@end

@implementation SESSessionManagerCallbackInterface

+ (id)interface
{
  if (interface_onceToken_104 != -1) {
    dispatch_once(&interface_onceToken_104, &__block_literal_global_106);
  }
  v2 = (void *)interface_interface_103;
  return v2;
}

uint64_t __47__SESSessionManagerCallbackInterface_interface__block_invoke()
{
  interface_interface_103 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C572428];
  return MEMORY[0x270F9A758]();
}

@end