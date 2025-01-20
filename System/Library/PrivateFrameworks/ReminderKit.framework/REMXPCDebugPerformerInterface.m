@interface REMXPCDebugPerformerInterface
+ (id)interface;
@end

@implementation REMXPCDebugPerformerInterface

void __42__REMXPCDebugPerformerInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F139A670];
  v1 = (void *)interface_result_3;
  interface_result_3 = v0;

  v2 = (void *)interface_result_3;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_validateHashtagLabelsWithoutHashtagWithRepair_completion_ argumentIndex:0 ofReply:1];

  v6 = (void *)interface_result_3;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_validateHashtagLabelsWithConcealedHashtagsWithRepair_completion_ argumentIndex:0 ofReply:1];

  v10 = (void *)interface_result_3;
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v10 setClasses:v13 forSelector:sel_fetchAllSharedEntitySyncActivities_ argumentIndex:0 ofReply:1];

  v14 = (void *)interface_result_3;
  v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v14 setClasses:v15 forSelector:sel_addSharedEntitySyncActivityWithActivity_completion_ argumentIndex:0 ofReply:0];

  v16 = (void *)interface_result_3;
  v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v16 setClasses:v17 forSelector:sel_purgeCKRecordWithRecordType_identifier_completion_ argumentIndex:1 ofReply:0];

  v18 = (void *)interface_result_3;
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [v18 setClasses:v22 forSelector:sel_fetchAllDueDateDeltaAlertsIncludingUnsupported_completion_ argumentIndex:0 ofReply:1];
}

+ (id)interface
{
  if (interface_onceToken_4 != -1) {
    dispatch_once(&interface_onceToken_4, &__block_literal_global_31);
  }
  v2 = (void *)interface_result_3;

  return v2;
}

@end