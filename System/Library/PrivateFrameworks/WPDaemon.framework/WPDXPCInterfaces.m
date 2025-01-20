@interface WPDXPCInterfaces
+ (id)clientInterface;
+ (id)serverInterface;
@end

@implementation WPDXPCInterfaces

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1) {
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)serverInterface_serverInterface;
  return v2;
}

void __35__WPDXPCInterfaces_serverInterface__block_invoke()
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D64B068];
  v1 = (void *)serverInterface_serverInterface;
  serverInterface_serverInterface = v0;

  v2 = (void *)MEMORY[0x263EFFA08];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:4];
  v4 = [v2 setWithArray:v3];

  [(id)serverInterface_serverInterface setClasses:v4 forSelector:sel_discoverCharacteristicsAndServices_forPeripheral_ argumentIndex:0 ofReply:0];
}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_231);
  }
  v2 = (void *)clientInterface_clientInterface;
  return v2;
}

uint64_t __35__WPDXPCInterfaces_clientInterface__block_invoke()
{
  clientInterface_clientInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D651C80];
  return MEMORY[0x270F9A758]();
}

@end