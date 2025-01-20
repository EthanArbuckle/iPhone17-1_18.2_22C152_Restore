@interface LSGetResumableActivitiesAdministrativeProtocolInterface
@end

@implementation LSGetResumableActivitiesAdministrativeProtocolInterface

void ___LSGetResumableActivitiesAdministrativeProtocolInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0CC7BD8];
  v1 = (void *)_LSGetResumableActivitiesAdministrativeProtocolInterface_result;
  _LSGetResumableActivitiesAdministrativeProtocolInterface_result = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  getSFPeerDeviceClass_0();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  getSFPeerDeviceClass_0();
  v22 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  [(id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result setClasses:v22 forSelector:sel_doCopyAllUUIDsOfType_withCompletionHandler_ argumentIndex:0 ofReply:1];
  [(id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result setClasses:v22 forSelector:sel_doCopyEnabledUUIDsWithCompletionHandler_ argumentIndex:0 ofReply:1];
  [(id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result setClasses:v23 forSelector:sel_doGetPairedDevices_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result setClasses:v23 forSelector:sel_doGetPairedDevices_completionHandler_ argumentIndex:1 ofReply:1];
}

@end