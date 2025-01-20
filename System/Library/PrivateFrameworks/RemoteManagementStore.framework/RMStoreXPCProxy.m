@interface RMStoreXPCProxy
+ (id)newAgentConnection;
+ (id)newConnectionWithListenerEndpoint:(id)a3;
+ (id)newConnectionWithScope:(int64_t)a3;
+ (id)newDaemonConnection;
+ (id)newInterface;
@end

@implementation RMStoreXPCProxy

+ (id)newConnectionWithScope:(int64_t)a3
{
  if (a3 == 1) {
    return +[RMStoreXPCProxy newDaemonConnection];
  }
  else {
    return +[RMStoreXPCProxy newAgentConnection];
  }
}

+ (id)newAgentConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.RemoteManagementAgent.store" options:0];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newDaemonConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.remotemanagementd.store" options:4096];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newConnectionWithListenerEndpoint:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08D68];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithListenerEndpoint:v5];

  v7 = (void *)[a1 newInterface];
  [v6 setRemoteObjectInterface:v7];

  return v6;
}

+ (id)newInterface
{
  v57[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2708D3690];
  v57[0] = objc_opt_class();
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:1];
  v10 = [v7 setByAddingObjectsFromArray:v9];
  [v8 setClasses:v10 forSelector:sel_observerStoresWithCompletionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v56 = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
  v12 = [v7 setByAddingObjectsFromArray:v11];
  [v8 setClasses:v12 forSelector:sel_declarationsForStoreIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v55 = objc_opt_class();
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
  v14 = [v7 setByAddingObjectsFromArray:v13];
  [v8 setClasses:v14 forSelector:sel_declarationsWithTypes_storeIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
  v16 = [v7 setByAddingObjectsFromArray:v15];
  [v8 setClasses:v16 forSelector:sel_declarationManifestForStoreIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v53 = objc_opt_class();
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
  v18 = [v7 setByAddingObjectsFromArray:v17];
  [v8 setClasses:v18 forSelector:sel_configurationUIsForStoreIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v52 = objc_opt_class();
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
  v20 = [v7 setByAddingObjectsFromArray:v19];
  [v8 setClasses:v20 forSelector:sel_displayableProfileConfigurationsForStoreIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v51 = objc_opt_class();
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
  v22 = [v7 setByAddingObjectsFromArray:v21];
  [v8 setClasses:v22 forSelector:sel_providerStoresWithCompletionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v50 = objc_opt_class();
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
  v24 = [v7 setByAddingObjectsFromArray:v23];
  [v8 setClasses:v24 forSelector:sel_subscriberStoresWithCompletionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v49 = objc_opt_class();
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  v26 = [v7 setByAddingObjectsFromArray:v25];
  [v8 setClasses:v26 forSelector:sel_subscribedStoreDeclarationsWithTypes_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v48 = objc_opt_class();
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  v28 = [v7 setByAddingObjectsFromArray:v27];
  [v8 setClasses:v28 forSelector:sel_subscribedStoreDeclarationsWithTypes_completionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v47 = objc_opt_class();
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
  v30 = [v7 setByAddingObjectsFromArray:v29];
  [v8 setClasses:v30 forSelector:sel_subscribedDeclarationsWithTypes_storeIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v46 = objc_opt_class();
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
  v32 = [v7 setByAddingObjectsFromArray:v31];
  [v8 setClasses:v32 forSelector:sel_subscribedStoreConfigurationsVisibleUIWithTypes_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v45 = objc_opt_class();
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  v34 = [v7 setByAddingObjectsFromArray:v33];
  [v8 setClasses:v34 forSelector:sel_subscribedStoreConfigurationsVisibleUIWithTypes_completionHandler_ argumentIndex:1 ofReply:1];

  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
  v36 = [v7 setByAddingObjectsFromArray:v35];
  [v8 setClasses:v36 forSelector:sel_writeStatusWithStoreIdentifier_declarationType_declarationIdentifier_declarationServerToken_sourceIdentifier_validity_reasons_completionHandler_ argumentIndex:6 ofReply:0];

  uint64_t v43 = objc_opt_class();
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  v38 = [v7 setByAddingObjectsFromArray:v37];
  [v8 setClasses:v38 forSelector:sel_publishStatusWithStoreIdentifier_status_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v42 = objc_opt_class();
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
  v40 = [v7 setByAddingObjectsFromArray:v39];
  [v8 setClasses:v40 forSelector:sel_certificateStatusWithStoreIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  return v8;
}

@end