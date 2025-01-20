@interface KmlManagerInterface
+ (id)interface;
@end

@implementation KmlManagerInterface

+ (id)interface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KmlManagerProtocol];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v57 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v56 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KmlOwnerPairingCallbacks];
  [v56 setClasses:v57 forSelector:"handleKeyPairingCompletionResult:keyInformation:trackingRequest:" argumentIndex:1 ofReply:0];
  [v2 setInterface:v56 forSelector:"queueOwnerPairingSession:callback:" argumentIndex:0 ofReply:0];
  v55 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KmlOwnerPairingProtocol];
  v58 = v2;
  [v2 setInterface:v55 forSelector:"queueOwnerPairingSession:callback:" argumentIndex:0 ofReply:1];
  v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KmlSessionCallbacks];
  [v2 setInterface:v10 forSelector:v10 argumentIndex:v10 ofReply:v10];

  v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KmlKeySharingProtocol];
  uint64_t v52 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v52, v51, v50, v49, v47, v45, v43, v41, v12, v13, v14, v15, v16, v17, v18, v19, v20,
    objc_opt_class(),
  v21 = 0);
  [v11 setClasses:v21 forSelector:"sendSharingInviteForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:" argumentIndex:3 ofReply:0];
  [v11 setClasses:v21 forSelector:"sendSharingInviteForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:"sendSilentSharingInviteForKeyIdentifier:config:groupIdentifier:completionHandler:" argumentIndex:1 ofReply:0];
  [v11 setClasses:v21 forSelector:"sendSilentSharingInviteForKeyIdentifier:config:groupIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:"acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:" argumentIndex:2 ofReply:0];
  [v11 setClasses:v21 forSelector:"acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:"requestInviteWithConfig:completionHandler:" argumentIndex:0 ofReply:0];
  [v11 setClasses:v21 forSelector:x0 argumentIndex:x1 ofReply:x2];
  [v11 setClasses:v21 forSelector:"getPreTrackRequestForInvitationWithIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:x0 argumentIndex:x1 ofReply:x2];
  [v11 setClasses:v21 forSelector:x0 argumentIndex:x1 ofReply:x2];
  [v11 setClasses:v21 forSelector:x0 argumentIndex:x1 ofReply:x2];
  [v11 setClasses:v21 forSelector:"createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:" argumentIndex:4 ofReply:0];
  [v11 setClasses:v21 forSelector:"createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:"createSilentSharingInvitationWithGroupIdentifier:completionHandler:" argumentIndex:0 ofReply:0];
  [v11 setClasses:v21 forSelector:"createSilentSharingInvitationWithGroupIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:"acceptSharingInvitation:withIdentifier:fromMailboxIdentifier:passcode:productPlanIdentifier:completionHandler:" argumentIndex:0 ofReply:0];
  [v11 setClasses:v21 forSelector:"acceptSharingInvitation:withIdentifier:fromMailboxIdentifier:passcode:productPlanIdentifier:completionHandler:" argumentIndex:4 ofReply:0];
  [v11 setClasses:v21 forSelector:"acceptSharingInvitation:withIdentifier:fromMailboxIdentifier:passcode:productPlanIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:"startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:" argumentIndex:0 ofReply:0];
  [v11 setClasses:v21 forSelector:"handleRecipientMessage:forInvitationIdentifier:completionHandler:" argumentIndex:0 ofReply:0];
  [v11 setClasses:v21 forSelector:"handleRecipientMessage:forInvitationIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:"handleInitiatorMessage:forInvitationIdentifier:completionHandler:" argumentIndex:0 ofReply:0];
  [v11 setClasses:v21 forSelector:"handleInitiatorMessage:forInvitationIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v11 setClasses:v21 forSelector:"retryPasscode:forInvitationIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v58 setInterface:v11 forSelector:"queueSharingSession:callback:" argumentIndex:0 ofReply:1];
  v22 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KmlSessionCallbacks];
  [v58 setInterface:v22 forSelector:x0 argumentIndex:x1 ofReply:x2];

  v23 = +[KmlKeyManagementInterface interface];
  uint64_t v48 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v48, v46, v44, v42, v40, v39, v24, v25, v26, v27, v28, v29, v30, objc_opt_class(), 0);
  [v23 setClasses:v31 forSelector:"listSharingInvitationsForKeyIdentifier:callback:" argumentIndex:0 ofReply:1];
  [v23 setClasses:v31 forSelector:"listReceivedSharingInvitationsWithCallback:" argumentIndex:0 ofReply:1];
  [v23 setClasses:v31 forSelector:"cancelInvitationWithIdentifier:reason:callback:" argumentIndex:0 ofReply:1];
  [v23 setClasses:v31 forSelector:"requestBindingAttestationDataForKeyWithIdentifier:callback:" argumentIndex:0 ofReply:1];
  [v23 setClasses:v31 forSelector:"getPreTrackRequestForKeyWithIdentifier:callback:" argumentIndex:0 ofReply:1];
  [v23 setClasses:v31 forSelector:"ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:" argumentIndex:0 ofReply:1];
  [v23 setClasses:v31 forSelector:"setProductPlanIdentifier:forInvitationIdentifier:completion:" argumentIndex:0 ofReply:0];
  [v23 setClasses:v31 forSelector:"remoteTerminateKeys:nodeGroupIdentifiers:treeGroupIdentifiers:adminKey:callback:" argumentIndex:0 ofReply:1];
  [v23 setClasses:v31 forSelector:"hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:" argumentIndex:2 ofReply:0];
  [v23 setClasses:v31 forSelector:"hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:" argumentIndex:0 ofReply:1];
  [v58 setInterface:v23 forSelector:"queueManagementSession:callback:" argumentIndex:0 ofReply:1];
  uint64_t v54 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  v37 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v54, v53, v32, v33, v34, v35, v36, objc_opt_class(), 0);
  [v58 setClasses:v37 forSelector:"registerFriendSideSharingTestCompletion:" argumentIndex:0 ofReply:1];

  return v58;
}

@end