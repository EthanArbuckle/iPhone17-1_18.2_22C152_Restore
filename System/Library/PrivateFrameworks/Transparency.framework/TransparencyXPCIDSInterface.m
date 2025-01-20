@interface TransparencyXPCIDSInterface
+ (id)interface;
@end

@implementation TransparencyXPCIDSInterface

+ (id)interface
{
  v15[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA1F568];
  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_setupKTSession_complete_ argumentIndex:0 ofReply:0];

  v4 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_setupKTSession_complete_ argumentIndex:0 ofReply:1];

  v5 = [MEMORY[0x263F16D80] safeErrorClasses];
  [v2 setClasses:v5 forSelector:sel_setupKTSession_complete_ argumentIndex:1 ofReply:1];

  v6 = (void *)MEMORY[0x263EFFA08];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_listKTSession_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x263EFFA08];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v11 = [v9 setWithArray:v10];
  [v2 setClasses:v11 forSelector:sel_getKTSessionByHandle_complete_ argumentIndex:0 ofReply:1];

  v12 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v12 forSelector:sel_getKTSessionByID_complete_ argumentIndex:0 ofReply:1];

  return v2;
}

@end