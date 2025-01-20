@interface NFSecureElementManagerSessionInterface
+ (id)interface;
@end

@implementation NFSecureElementManagerSessionInterface

+ (id)interface
{
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v37 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  id v36 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v35 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v36, "initWithObjects:", v35, v7, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v17, "initWithObjects:", v18, v19, objc_opt_class(), 0);
  v21 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46840];
  [v21 setClasses:v37 forSelector:sel_deleteApplets_completion_ argumentIndex:0 ofReply:0];
  [v21 setClasses:v37 forSelector:sel_getAppletsWithCompletion_ argumentIndex:0 ofReply:1];
  [v21 setClasses:v37 forSelector:sel_deleteApplets_completion_ argumentIndex:0 ofReply:1];
  [v21 setClasses:v37 forSelector:sel_deleteAllAppletsWithCompletion_ argumentIndex:0 ofReply:1];
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v21 setClasses:v22 forSelector:sel_signChallenge_useOSVersion_completion_ argumentIndex:1 ofReply:1];

  [v21 setClasses:v37 forSelector:sel_getFelicaAppletState_completion_ argumentIndex:0 ofReply:0];
  [v21 setClasses:v16 forSelector:sel_getFelicaAppletState_completion_ argumentIndex:0 ofReply:1];
  [v21 setClasses:v37 forSelector:sel_getTransitAppletState_completion_ argumentIndex:0 ofReply:0];
  [v21 setClasses:v16 forSelector:sel_getTransitAppletState_completion_ argumentIndex:0 ofReply:1];
  [v21 setClasses:v37 forSelector:sel_getServiceProviderDataForApplet_publicKey_scheme_completion_ argumentIndex:0 ofReply:0];
  [v21 setClasses:v16 forSelector:sel_getServiceProviderDataForApplet_publicKey_scheme_completion_ argumentIndex:0 ofReply:1];
  [v21 setClasses:v37 forSelector:sel_disableAuthorizationForApplets_andKey_authorization_completion_ argumentIndex:0 ofReply:0];
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v21 setClasses:v23 forSelector:sel_disableAuthorizationForApplets_andKey_authorization_completion_ argumentIndex:1 ofReply:0];

  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v21 setClasses:v24 forSelector:sel_disableAuthorizationForApplets_andKey_authorization_completion_ argumentIndex:2 ofReply:0];

  [v21 setClasses:v20 forSelector:sel_restoreAuthorizationForAllAppletsExcept_completion_ argumentIndex:0 ofReply:0];
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v21 setClasses:v25 forSelector:sel_performPeerPaymentEnrollment_completion_ argumentIndex:0 ofReply:0];

  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v21 setClasses:v26 forSelector:sel_performPeerPaymentEnrollment_completion_ argumentIndex:0 ofReply:1];

  v27 = [v16 setByAddingObject:objc_opt_class()];
  [v21 setClasses:v27 forSelector:sel_dumpDomain_forSEID_completion_ argumentIndex:0 ofReply:1];

  id v28 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v28, "initWithObjects:", v29, v30, v31, v32, objc_opt_class(), 0);
  [v21 setClasses:v33 forSelector:sel_execRemoteAdminScript_params_completion_ argumentIndex:1 ofReply:0];

  return v21;
}

@end