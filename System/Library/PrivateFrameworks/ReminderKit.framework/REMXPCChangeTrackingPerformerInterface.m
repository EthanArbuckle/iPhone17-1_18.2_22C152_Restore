@interface REMXPCChangeTrackingPerformerInterface
+ (id)interface;
@end

@implementation REMXPCChangeTrackingPerformerInterface

void __51__REMXPCChangeTrackingPerformerInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F139A470];
  v1 = (void *)interface_result_1;
  interface_result_1 = v0;

  id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [(id)interface_result_1 setClasses:v14 forSelector:sel_getTrackingStateWithClientID_completion_ argumentIndex:0 ofReply:0];
  [(id)interface_result_1 setClasses:v14 forSelector:sel_saveTrackingState_withClientID_completionHandler_ argumentIndex:1 ofReply:0];
  v2 = (void *)interface_result_1;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_fetchAuxiliaryChangeInfos_completionHandler_ argumentIndex:0 ofReply:0];

  v7 = (void *)interface_result_1;
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
  [v7 setClasses:v13 forSelector:sel_fetchAuxiliaryChangeInfos_completionHandler_ argumentIndex:0 ofReply:1];
}

+ (id)interface
{
  if (interface_onceToken_1 != -1) {
    dispatch_once(&interface_onceToken_1, &__block_literal_global_13);
  }
  v2 = (void *)interface_result_1;

  return v2;
}

@end