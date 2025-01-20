@interface PDSharingChannelServiceInterface
@end

@implementation PDSharingChannelServiceInterface

void __PDSharingChannelServiceInterface_Server_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2EA868];
  v1 = (void *)_MergedGlobals_200;
  _MergedGlobals_200 = v0;

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v20 = objc_msgSend(v19, "setWithObjects:", v18, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [(id)_MergedGlobals_200 setClasses:v20 forSelector:sel_sendMessage_completion_ argumentIndex:0 ofReply:0];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
  [(id)_MergedGlobals_200 setClasses:v17 forSelector:sel_descriptorsForAccountDevices_ argumentIndex:0 ofReply:1];
}

@end