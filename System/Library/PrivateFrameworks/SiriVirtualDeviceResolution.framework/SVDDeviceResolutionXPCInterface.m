@interface SVDDeviceResolutionXPCInterface
+ (id)entitlement;
+ (id)serviceName;
+ (id)xpcInterface;
@end

@implementation SVDDeviceResolutionXPCInterface

+ (id)serviceName
{
  return @"com.apple.siri.device_resolution";
}

+ (id)xpcInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2426908];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getAllReachableDevicesWithCompletion_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_getSourceDeviceForContextWithIdentifiers_completion_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_getSourceDeviceForContextWithIdentifiers_completion_ argumentIndex:0 ofReply:1];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v2 setClasses:v15 forSelector:sel_getDevicesMatchingCapabilityDescriptions_completion_ argumentIndex:0 ofReply:0];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
  [v2 setClasses:v20 forSelector:sel_getDevicesMatchingCapabilityDescriptions_completion_ argumentIndex:0 ofReply:1];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v2 setClasses:v23 forSelector:sel_getContextAndProximitySnapshotForCurrentRequestForDeviceUnits_serviceContexts_completion_ argumentIndex:0 ofReply:0];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  [v2 setClasses:v26 forSelector:sel_getContextAndProximitySnapshotForCurrentRequestForDeviceUnits_serviceContexts_completion_ argumentIndex:1 ofReply:0];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  [v2 setClasses:v30 forSelector:sel_getContextAndProximitySnapshotForCurrentRequestForDeviceUnits_serviceContexts_completion_ argumentIndex:0 ofReply:1];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  [v2 setClasses:v34 forSelector:sel_logCrossDeviceCommandEnded_action_contextProximityPairs_ argumentIndex:2 ofReply:0];

  v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
  [v2 setClasses:v38 forSelector:sel_logCrossDeviceCommandEnded_action_homeKitTarget_contextProximityPairs_ argumentIndex:3 ofReply:0];

  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  v42 = objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
  [v2 setClasses:v42 forSelector:sel_logCrossDeviceCommandEnded_action_actionResult_homeKitTarget_contextProximityPairs_ argumentIndex:4 ofReply:0];

  v43 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v43 forSelector:sel_pairedCompanionDeviceWithCompletion_ argumentIndex:0 ofReply:1];

  v44 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v44 forSelector:sel_meDeviceWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)entitlement
{
  return @"com.apple.siri.device_resolution";
}

@end