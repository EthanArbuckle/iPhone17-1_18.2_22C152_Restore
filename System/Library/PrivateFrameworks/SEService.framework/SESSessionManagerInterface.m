@interface SESSessionManagerInterface
+ (id)interface;
@end

@implementation SESSessionManagerInterface

+ (id)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)interface_interface;
  return v2;
}

void __39__SESSessionManagerInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C576FE8];
  v1 = (void *)interface_interface;
  interface_interface = v0;

  v2 = (void *)interface_interface;
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C571908];
  [v2 setInterface:v3 forSelector:sel_startSESACWGSession_completion_ argumentIndex:0 ofReply:0];

  v4 = (void *)interface_interface;
  v5 = +[SESACWGSessionInterface interface];
  [v4 setInterface:v5 forSelector:sel_startSESACWGSession_completion_ argumentIndex:0 ofReply:1];

  v6 = (void *)interface_interface;
  v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C571E10];
  [v6 setInterface:v7 forSelector:sel_startSESDCKSession_completion_ argumentIndex:0 ofReply:0];

  v8 = (void *)interface_interface;
  v9 = +[SESDCKSessionInterface interface];
  [v8 setInterface:v9 forSelector:sel_startSESDCKSession_completion_ argumentIndex:0 ofReply:1];

  v10 = (void *)interface_interface;
  v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C572B00];
  [v10 setInterface:v11 forSelector:sel_startSESRKESession_options_completion_ argumentIndex:0 ofReply:0];

  v12 = (void *)interface_interface;
  v13 = +[SESRKESessionInterface interface];
  [v12 setInterface:v13 forSelector:sel_startSESRKESession_options_completion_ argumentIndex:0 ofReply:1];

  v14 = (void *)interface_interface;
  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  [v14 setClasses:v22 forSelector:sel_getVehicleReports_ argumentIndex:0 ofReply:1];

  v23 = (void *)interface_interface;
  v24 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C56E980];
  [v23 setInterface:v24 forSelector:sel_startSESAssertion_withKeyIdentifier_withAppletIdentifier_withOptions_completion_ argumentIndex:0 ofReply:0];

  v25 = (void *)interface_interface;
  id v26 = +[SESAssertionInterface interface];
  [v25 setInterface:v26 forSelector:sel_startSESAssertion_withKeyIdentifier_withAppletIdentifier_withOptions_completion_ argumentIndex:0 ofReply:1];
}

@end