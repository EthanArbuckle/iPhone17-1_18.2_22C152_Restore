@interface PRPersonaServiceInterface
+ (id)XPCInterface;
@end

@implementation PRPersonaServiceInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1) {
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)XPCInterface_interface;
  return v2;
}

void __41__PRPersonaServiceInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4A7A50];
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

  v2 = (void *)XPCInterface_interface;
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_allLikenessesForPrimaryiCloudAccountWithCompletion_ argumentIndex:0 ofReply:1];

  v6 = (void *)XPCInterface_interface;
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setClasses:v9 forSelector:sel_likenessesWithExternalIdentifier_completion_ argumentIndex:0 ofReply:1];
}

@end