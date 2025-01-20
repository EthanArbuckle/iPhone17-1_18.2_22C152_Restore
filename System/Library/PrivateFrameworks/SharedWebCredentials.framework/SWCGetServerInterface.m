@interface SWCGetServerInterface
@end

@implementation SWCGetServerInterface

void ___SWCGetServerInterface_block_invoke()
{
  v44[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0349D18];
  v1 = (void *)qword_1EB67B150;
  qword_1EB67B150 = v0;

  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  v44[2] = objc_opt_class();
  v44[3] = objc_opt_class();
  v44[4] = objc_opt_class();
  v44[5] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:6];
  v34 = (void *)[v2 initWithArray:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  v43[2] = objc_opt_class();
  v43[3] = objc_opt_class();
  v43[4] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:5];
  v35 = (void *)[v4 initWithArray:v5];

  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_waitForSiteApprovalWithServiceSpecifier_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_waitForSiteApprovalWithServiceSpecifier_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_waitForSiteApprovalWithServiceSpecifier_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_ argumentIndex:1 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_ argumentIndex:3 ofReply:0];
  v6 = (void *)qword_1EB67B150;
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v9 = (void *)[v7 initWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_ argumentIndex:0 ofReply:1];

  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getDetailsWithServiceSpecifier_URL_limit_callerAuditToken_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_addServiceWithServiceSpecifier_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_addServiceWithServiceSpecifier_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_removeServiceWithServiceSpecifier_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_removeServiceWithServiceSpecifier_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClasses:v35 forSelector:sel_setDetails_forServiceWithServiceSpecifier_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_setDetails_forServiceWithServiceSpecifier_completionHandler_ argumentIndex:1 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_setDetails_forServiceWithServiceSpecifier_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_setUserApprovalState_forServiceWithServiceSpecifier_completionHandler_ argumentIndex:1 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_setUserApprovalState_forServiceWithServiceSpecifier_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_addAllAppsWithCompletionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setXPCType:MEMORY[0x1E4F145B0] forSelector:sel_showWithVerbosity_isTTY_fileDescriptor_completionHandler_ argumentIndex:2 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_resetWithCompletionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getServiceSettingsWithServiceSpecifier_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getServiceSettingsWithServiceSpecifier_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getServiceSettingsWithServiceSpecifier_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_commitServiceSettings_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_commitServiceSettings_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_commitServiceSettings_completionHandler_ argumentIndex:1 ofReply:1];
  v10 = (void *)qword_1EB67B150;
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v13 = (void *)[v11 initWithArray:v12];
  [v10 setClasses:v13 forSelector:sel_removeSettingsForKeys_serviceType_completionHandler_ argumentIndex:0 ofReply:0];

  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_removeSettingsForKeys_serviceType_completionHandler_ argumentIndex:1 ofReply:1];
  v14 = (void *)qword_1EB67B150;
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v17 = (void *)[v15 initWithArray:v16];
  [v14 setClasses:v17 forSelector:sel_removeSettingsForKeys_serviceSpecifier_completionHandler_ argumentIndex:0 ofReply:0];

  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_removeSettingsForKeys_serviceSpecifier_completionHandler_ argumentIndex:1 ofReply:0];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_removeSettingsForKeys_serviceSpecifier_completionHandler_ argumentIndex:1 ofReply:1];
  v18 = (void *)qword_1EB67B150;
  id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v21 = (void *)[v19 initWithArray:v20];
  [v18 setClasses:v21 forSelector:sel_getTrackingDomains_sources_completionHandler_ argumentIndex:0 ofReply:0];

  v22 = (void *)qword_1EB67B150;
  id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  v25 = (void *)[v23 initWithArray:v24];
  [v22 setClasses:v25 forSelector:sel_getTrackingDomains_sources_completionHandler_ argumentIndex:0 ofReply:1];

  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getDeveloperModeEnabledWithCompletionHandler_ argumentIndex:0 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_getDeveloperModeEnabledWithCompletionHandler_ argumentIndex:1 ofReply:1];
  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_setDeveloperModeEnabled_completionHandler_ argumentIndex:1 ofReply:1];
  v26 = (void *)qword_1EB67B150;
  id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v29 = (void *)[v27 initWithArray:v28];
  [v26 setClasses:v29 forSelector:sel_setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler_ argumentIndex:0 ofReply:0];

  v30 = (void *)qword_1EB67B150;
  id v31 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v33 = (void *)[v31 initWithArray:v32];
  [v30 setClasses:v33 forSelector:sel_setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler_ argumentIndex:1 ofReply:0];

  [(id)qword_1EB67B150 setClass:objc_opt_class() forSelector:sel_setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler_ argumentIndex:1 ofReply:1];
}

@end