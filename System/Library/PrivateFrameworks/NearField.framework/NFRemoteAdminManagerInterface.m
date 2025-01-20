@interface NFRemoteAdminManagerInterface
+ (id)interface;
@end

@implementation NFRemoteAdminManagerInterface

+ (id)interface
{
  if (qword_1EB4D1FC0 != -1) {
    dispatch_once(&qword_1EB4D1FC0, &__block_literal_global_2);
  }
  v2 = (void *)_MergedGlobals_16;
  return v2;
}

void __42__NFRemoteAdminManagerInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF467E0];
  v1 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = v0;

  id v9 = +[NFRemoteAdminManagerCallbacks interface];
  [(id)_MergedGlobals_16 setInterface:v9 forSelector:sel_registerForCallbacks_ argumentIndex:0 ofReply:0];
  [(id)_MergedGlobals_16 setInterface:v9 forSelector:sel_unregisterForCallbacks_ argumentIndex:0 ofReply:0];
  v2 = (void *)_MergedGlobals_16;
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_getSELDInfoForBrokerWithCompletion_ argumentIndex:0 ofReply:1];
}

@end