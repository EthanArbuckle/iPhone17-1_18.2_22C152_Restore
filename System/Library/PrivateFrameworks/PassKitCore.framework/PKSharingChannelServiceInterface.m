@interface PKSharingChannelServiceInterface
@end

@implementation PKSharingChannelServiceInterface

void __PKSharingChannelServiceInterface_Client_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2B1B20];
  v1 = (void *)qword_1EB402BA0;
  qword_1EB402BA0 = v0;

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
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
  v14 = objc_msgSend(v13, "setWithObjects:", v12, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [(id)qword_1EB402BA0 setClasses:v14 forSelector:sel_didReceiveMessages_reply_ argumentIndex:0 ofReply:0];
}

@end