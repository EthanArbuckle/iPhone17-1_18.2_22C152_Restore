@interface NSXPCConnection
@end

@implementation NSXPCConnection

void __74__NSXPCConnection_TUCallServicesAdditions__callServicesClientXPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED3C918];
  v1 = (void *)callServicesClientXPCInterface_xpcInterface;
  callServicesClientXPCInterface_xpcInterface = v0;

  v2 = (void *)callServicesClientXPCInterface_xpcInterface;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_handleCurrentCallsChanged_callDisconnected_ argumentIndex:0 ofReply:0];

  v6 = (void *)callServicesClientXPCInterface_xpcInterface;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  [v6 setClasses:v14 forSelector:sel_handleNotificationName_forCallWithUniqueProxyIdentifier_userInfo_ argumentIndex:2 ofReply:0];

  v15 = (void *)callServicesClientXPCInterface_xpcInterface;
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
  [v15 setClasses:v19 forSelector:sel_handleLocalRoutesByUniqueIdentifierUpdated_ argumentIndex:0 ofReply:0];

  v20 = (void *)callServicesClientXPCInterface_xpcInterface;
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [v20 setClasses:v24 forSelector:sel_handlePairedHostDeviceRoutesByUniqueIdentifierUpdated_ argumentIndex:0 ofReply:0];
}

void __74__NSXPCConnection_TUCallServicesAdditions__callServicesServerXPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61CC8];
  v1 = (void *)callServicesServerXPCInterface_xpcInterface;
  callServicesServerXPCInterface_xpcInterface = v0;

  v2 = (void *)callServicesServerXPCInterface_xpcInterface;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_fetchCurrentCallUpdates_ argumentIndex:0 ofReply:1];

  v6 = (void *)callServicesServerXPCInterface_xpcInterface;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_requestInitialState_ argumentIndex:0 ofReply:1];

  uint64_t v10 = (void *)callServicesServerXPCInterface_xpcInterface;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v10 setClasses:v13 forSelector:sel_dialWithRequest_reply_ argumentIndex:1 ofReply:1];

  v14 = (void *)callServicesServerXPCInterface_xpcInterface;
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v14 setClasses:v17 forSelector:sel_pullCallFromClientUsingHandoffActivityUserInfo_reply_ argumentIndex:1 ofReply:1];

  uint64_t v18 = (void *)callServicesServerXPCInterface_xpcInterface;
  v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v18 setClasses:v19 forSelector:sel_pullPersistedChannel_ argumentIndex:1 ofReply:1];

  v20 = (void *)callServicesServerXPCInterface_xpcInterface;
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  id v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
  [v20 setClasses:v24 forSelector:sel_localRoutesByUniqueIdentifier_ argumentIndex:0 ofReply:1];

  v25 = (void *)callServicesServerXPCInterface_xpcInterface;
  v26 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
  [v25 setClasses:v29 forSelector:sel_pairedHostDeviceRoutesByUniqueIdentifier_ argumentIndex:0 ofReply:1];

  v30 = (void *)callServicesServerXPCInterface_xpcInterface;
  v31 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v30 setClasses:v31 forSelector:sel_setSharingScreen_attributes_forCallWithUniqueProxyIdentifier_ argumentIndex:1 ofReply:0];

  v32 = (void *)callServicesServerXPCInterface_xpcInterface;
  v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v32 setClasses:v33 forSelector:sel_setScreenShareAttributesForCallWithUniqueProxyIdentifier_attributes_ argumentIndex:1 ofReply:0];

  v34 = (void *)callServicesServerXPCInterface_xpcInterface;
  v35 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v34 setClasses:v35 forSelector:sel_registerAnonymousXPCEndpoint_ argumentIndex:0 ofReply:0];

  v36 = (void *)callServicesServerXPCInterface_xpcInterface;
  v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v36 setClasses:v37 forSelector:sel_fetchAnonymousXPCEndpoint_ argumentIndex:0 ofReply:1];

  v38 = (void *)callServicesServerXPCInterface_xpcInterface;
  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  v41 = objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
  [v38 setClasses:v41 forSelector:sel_setEmergencyMediaItems_forCallWithUniqueProxyIdentifier_ argumentIndex:0 ofReply:0];

  v42 = (void *)callServicesServerXPCInterface_xpcInterface;
  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v44, v45, objc_opt_class(), 0);
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  [v42 setClasses:v46 forSelector:sel_performRecordingRequest_completion_ argumentIndex:0 ofReply:1];
}

@end