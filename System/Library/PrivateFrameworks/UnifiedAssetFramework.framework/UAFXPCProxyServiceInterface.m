@interface UAFXPCProxyServiceInterface
+ (id)defaultInterface;
@end

@implementation UAFXPCProxyServiceInterface

+ (id)defaultInterface
{
  v19[5] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EAA3430];
  v3 = (void *)MEMORY[0x263EFFA08];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  v19[3] = objc_opt_class();
  v19[4] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:5];
  v5 = [v3 setWithArray:v4];

  [v2 setClasses:v5 forSelector:sel_operationWithConfig_completion_ argumentIndex:0 ofReply:0];
  v6 = (void *)MEMORY[0x263EFFA08];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  v18[4] = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:5];
  v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_checkAssetStatus_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x263EFFA08];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v11 = [v9 setWithArray:v10];
  [v2 setClasses:v11 forSelector:sel_lockLatestAtomicInstance_completion_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x263EFFA08];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  v16[3] = objc_opt_class();
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];
  v14 = [v12 setWithArray:v13];
  [v2 setClasses:v14 forSelector:sel_subscriptionsForSubscriber_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

@end