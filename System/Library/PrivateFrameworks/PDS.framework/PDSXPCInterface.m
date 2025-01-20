@interface PDSXPCInterface
+ (id)_internalInterfaceFromVendor:(id)a3;
+ (id)_standardInterfaceFromVendor:(id)a3;
+ (id)handShakeInterfaceFromVendor:(id)a3;
@end

@implementation PDSXPCInterface

+ (id)handShakeInterfaceFromVendor:(id)a3
{
  id v4 = a3;
  v5 = [v4 interfaceWithProtocol:&unk_26CFDCC30];
  v6 = [a1 _standardInterfaceFromVendor:v4];
  [v5 setInterface:v6 forSelector:sel_connectWithClientID_completion_ argumentIndex:0 ofReply:1];

  v7 = [a1 _internalInterfaceFromVendor:v4];

  [v5 setInterface:v7 forSelector:sel_connectInternalWithCompletion_ argumentIndex:0 ofReply:1];
  return v5;
}

+ (id)_internalInterfaceFromVendor:(id)a3
{
  return (id)[a3 interfaceWithProtocol:&unk_26CFDCCF0];
}

+ (id)_standardInterfaceFromVendor:(id)a3
{
  v3 = [a3 interfaceWithProtocol:&unk_26CFDCC90];
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v3 setClasses:v6 forSelector:sel_activeUsersWithClientID_withCompletion_ argumentIndex:0 ofReply:1];

  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v3 setClasses:v9 forSelector:sel_usersWithClientID_withCompletion_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v3 setClasses:v12 forSelector:sel_entriesForUser_clientID_withCompletion_ argumentIndex:0 ofReply:1];

  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v3 setClasses:v15 forSelector:sel_entriesForClientID_withCompletion_ argumentIndex:0 ofReply:1];

  v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v3 setClasses:v18 forSelector:sel_storeEntries_deleteEntries_withCompletion_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v3 setClasses:v21 forSelector:sel_storeEntries_deleteEntries_withCompletion_ argumentIndex:1 ofReply:0];

  v22 = (void *)MEMORY[0x263EFFA08];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v3 setClasses:v24 forSelector:sel_batchUpdateEntries_forClientID_withCompletion_ argumentIndex:0 ofReply:0];

  return v3;
}

@end