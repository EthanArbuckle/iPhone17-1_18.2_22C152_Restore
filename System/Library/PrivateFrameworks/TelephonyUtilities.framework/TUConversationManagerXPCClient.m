@interface TUConversationManagerXPCClient
+ (NSSet)conversationManagerAllowedClasses;
+ (NSXPCInterface)conversationManagerClientXPCInterface;
+ (NSXPCInterface)conversationManagerServerXPCInterface;
+ (TUConversationManagerXPCServer)asynchronousServer;
+ (TUConversationManagerXPCServer)synchronousServer;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (BOOL)autoSharePlayEnabled;
- (BOOL)hasInitialState;
- (BOOL)hasRequestedInitialState;
- (BOOL)isScreenSharingAvailable;
- (BOOL)isSharePlayAvailable;
- (BOOL)shouldConnectToHost;
- (NSDictionary)activityAuthorizedBundleIdentifiers;
- (NSDictionary)conversationsByGroupUUID;
- (NSDictionary)incomingPendingConversationsByGroupUUID;
- (NSDictionary)pseudonymsByCallUUID;
- (NSNumber)screenSharingAvailable;
- (NSNumber)sharePlayAvailable;
- (NSSet)activatedConversationLinks;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUConversationManagerDataSourceDelegate)delegate;
- (TUConversationManagerXPCClient)init;
- (TUConversationMediaControllerDataSourceDelegate)mediaDelegate;
- (TUConversationReactionsControllerDataSourceDelegate)reactionsDelegate;
- (id)asynchronousServerWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (int)shouldConnectToken;
- (os_unfair_lock_s)accessorLock;
- (void)_invokeCompletionHandler:(id)a3;
- (void)_requestInitialStateIfNecessary;
- (void)_requestInitialStateWithCompletionHandler:(id)a3;
- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4;
- (void)activateLink:(id)a3 completionHandler:(id)a4;
- (void)activeParticipant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7;
- (void)activeParticipant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5;
- (void)addCollaborationDictionary:(id)a3 forConversationWithUUID:(id)a4 fromMe:(BOOL)a5;
- (void)addCollaborationIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6;
- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4;
- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5;
- (void)addScreenSharingType:(unint64_t)a3 forConversation:(id)a4;
- (void)addedCollaborationDictionary:(id)a3 forConversation:(id)a4;
- (void)approvePendingMember:(id)a3 forConversation:(id)a4;
- (void)buzzMember:(id)a3 conversation:(id)a4;
- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversation:(id)a4;
- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4;
- (void)conversation:(id)a3 addedMembersLocally:(id)a4;
- (void)conversation:(id)a3 appLaunchState:(unint64_t)a4 forActivitySession:(id)a5;
- (void)conversation:(id)a3 buzzedMember:(id)a4;
- (void)conversation:(id)a3 collaborationStateChanged:(int64_t)a4 highlightIdentifier:(id)a5;
- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4;
- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4;
- (void)conversation:(id)a3 participant:(id)a4 addedNotice:(id)a5;
- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5;
- (void)conversation:(id)a3 participantDidStopReacting:(id)a4;
- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4;
- (void)conversation:(id)a3 screenSharingChangedForParticipant:(id)a4;
- (void)conversationUpdateMessagesGroupPhoto:(id)a3;
- (void)conversationUpdatedMessagesGroupPhoto:(id)a3;
- (void)createActivitySession:(id)a3 onConversation:(id)a4;
- (void)dealloc;
- (void)endActivitySession:(id)a3 onConversation:(id)a4;
- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3;
- (void)generateLinkForConversation:(id)a3 completionHandler:(id)a4;
- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5;
- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4;
- (void)getInactiveLinkWithCompletionHandler:(id)a3;
- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3;
- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4;
- (void)getMessagesGroupDetailsForMessagesGroupUUID:(id)a3 completionHandler:(id)a4;
- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5;
- (void)handleServerDisconnect;
- (void)invalidate;
- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5;
- (void)joinConversationWithRequest:(id)a3;
- (void)kickMember:(id)a3 conversation:(id)a4;
- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6;
- (void)leaveActivitySession:(id)a3 onConversation:(id)a4;
- (void)leaveConversationWithUUID:(id)a3;
- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4;
- (void)markCollaborationWithIdentifierOpened:(id)a3 forConversationUUID:(id)a4;
- (void)mediaPrioritiesChangedForConversation:(id)a3;
- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4;
- (void)presentDismissalAlertForActivitySession:(id)a3 onConversation:(id)a4;
- (void)receivedTrackedPendingMember:(id)a3 forConversationLink:(id)a4;
- (void)refreshActiveConversations;
- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3;
- (void)registerWithCompletionHandler:(id)a3;
- (void)rejectPendingMember:(id)a3 forConversation:(id)a4;
- (void)remoteScreenShareAttributesChanged:(id)a3 isLocallySharing:(BOOL)a4;
- (void)remoteScreenShareEndedWithReason:(id)a3;
- (void)removeCollaborationIdentifier:(id)a3 forConversationUUID:(id)a4;
- (void)removeConversationNoticeWithUUID:(id)a3;
- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6;
- (void)requestParticipantToShareScreen:(id)a3 forConversation:(id)a4;
- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3;
- (void)screenSharingAvailableChanged:(BOOL)a3;
- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4;
- (void)setActivityAuthorizedBundleIdentifiers:(id)a3;
- (void)setAutoSharePlayEnabled:(BOOL)a3;
- (void)setConversationsByGroupUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversation:(id)a4;
- (void)setGridDisplayMode:(unint64_t)a3 conversation:(id)a4;
- (void)setHasInitialState:(BOOL)a3;
- (void)setHasRequestedInitialState:(BOOL)a3;
- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversation:(id)a4;
- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)setMediaDelegate:(id)a3;
- (void)setReactionsDelegate:(id)a3;
- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5;
- (void)setScreenSharingAvailable:(id)a3;
- (void)setSharePlayAvailable:(id)a3;
- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4;
- (void)setShouldConnectToHost:(BOOL)a3;
- (void)setShouldConnectToken:(int)a3;
- (void)setSupportsMessagesGroupProviding:(BOOL)a3;
- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5;
- (void)setXpcConnection:(id)a3;
- (void)sharePlayAvailableChanged:(BOOL)a3;
- (void)startTrackingCollaborationWithIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6 completionHandler:(id)a7;
- (void)updateActivatedConversationLinks:(id)a3;
- (void)updateActivityAuthorizedBundleIdentifierState:(id)a3;
- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4;
- (void)updateConversationsByGroupUUID:(id)a3;
- (void)updateIncomingPendingConversationsByGroupUUID:(id)a3;
- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)updateMessagesGroupName:(id)a3 onConversation:(id)a4;
@end

@implementation TUConversationManagerXPCClient

void __58__TUConversationManagerXPCClient_conversationsByGroupUUID__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _requestInitialStateIfNecessary];
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (void)_requestInitialStateIfNecessary
{
  v3 = [(TUConversationManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(TUConversationManagerXPCClient *)self hasRequestedInitialState])
  {
    [(TUConversationManagerXPCClient *)self _requestInitialStateWithCompletionHandler:0];
  }
}

- (BOOL)hasRequestedInitialState
{
  return self->_hasRequestedInitialState;
}

- (NSDictionary)conversationsByGroupUUID
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  v3 = [(TUConversationManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__TUConversationManagerXPCClient_conversationsByGroupUUID__block_invoke;
  v6[3] = &unk_1E58E6E90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_requestInitialStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TUConversationManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  [(TUConversationManagerXPCClient *)self setHasRequestedInitialState:1];
  if (![(TUConversationManagerXPCClient *)self shouldConnectToHost])
  {
    v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Host has no conversations", v12, 2u);
    }
    goto LABEL_8;
  }
  [(TUConversationManagerXPCClient *)self setHasInitialState:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E58E6A70;
  v20[4] = self;
  v6 = [(TUConversationManagerXPCClient *)self synchronousServerWithErrorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_67;
  v19[3] = &unk_1E58E8D40;
  v19[4] = self;
  [v6 conversationsByGroupUUID:v19];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E58E6A70;
  v18[4] = self;
  uint64_t v7 = [(TUConversationManagerXPCClient *)self synchronousServerWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_68;
  v17[3] = &unk_1E58E8D40;
  v17[4] = self;
  [v7 activityAuthorizedBundleIdentifierState:v17];

  v8 = [(TUConversationManagerXPCClient *)self sharePlayAvailable];

  if (v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_73;
    v16[3] = &unk_1E58E6A70;
    v16[4] = self;
    uint64_t v9 = [(TUConversationManagerXPCClient *)self synchronousServerWithErrorHandler:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_74;
    v15[3] = &unk_1E58E8A78;
    v15[4] = self;
    [v9 getSharePlayAvailableWithCompletionHandler:v15];
  }
  v10 = [(TUConversationManagerXPCClient *)self screenSharingAvailable];

  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_3;
    v14[3] = &unk_1E58E6A70;
    v14[4] = self;
    v11 = [(TUConversationManagerXPCClient *)self synchronousServerWithErrorHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_76;
    v13[3] = &unk_1E58E8A78;
    v13[4] = self;
    [v11 getScreenSharingAvailableWithCompletionHandler:v13];
LABEL_8:
  }
  [(TUConversationManagerXPCClient *)self _invokeCompletionHandler:v4];
}

- (BOOL)shouldConnectToHost
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(TUConversationManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  if (self->_shouldConnectToHost)
  {
    return 1;
  }
  else
  {
    uint64_t state64 = 0;
    uint32_t state = notify_get_state([(TUConversationManagerXPCClient *)self shouldConnectToken], &state64);
    if (state)
    {
      uint32_t v6 = state;
      uint64_t v7 = TUDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = v6;
        _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Bad state received when trying to get host conversation status: %lu", buf, 0xCu);
      }

      return self->_shouldConnectToHost;
    }
    else
    {
      BOOL v4 = state64 != 0;
      self->_shouldConnectToHost = v4;
    }
  }
  return v4;
}

- (int)shouldConnectToken
{
  return self->_shouldConnectToken;
}

- (void)setHasRequestedInitialState:(BOOL)a3
{
  self->_hasRequestedInitialState = a3;
}

- (void)_invokeCompletionHandler:(id)a3
{
  if (a3)
  {
    BOOL v4 = dispatch_get_global_queue(21, 0);
    dispatch_async(v4, a3);
  }
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_8);
  uint32_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    v8 = [(TUConversationManagerXPCClient *)self xpcConnection];
    id v7 = [v8 remoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (NSXPCConnection)xpcConnection
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.conversationmanager" options:0];
    uint32_t v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    id v7 = [(id)objc_opt_class() conversationManagerServerXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v7];

    v8 = [(id)objc_opt_class() conversationManagerClientXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v8];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__TUConversationManagerXPCClient_xpcConnection__block_invoke;
    v13[3] = &unk_1E58E5C50;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_2;
    v11[3] = &unk_1E58E5C50;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v11];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  uint64_t v9 = xpcConnection;
  os_unfair_lock_unlock(p_accessorLock);

  return v9;
}

+ (NSXPCInterface)conversationManagerServerXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUConversationManagerXPCClient_conversationManagerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (conversationManagerServerXPCInterface_onceToken != -1) {
    dispatch_once(&conversationManagerServerXPCInterface_onceToken, block);
  }
  v2 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)conversationManagerClientXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUConversationManagerXPCClient_conversationManagerClientXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (conversationManagerClientXPCInterface_onceToken != -1) {
    dispatch_once(&conversationManagerClientXPCInterface_onceToken, block);
  }
  v2 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;

  return (NSXPCInterface *)v2;
}

- (TUConversationManagerXPCClient)init
{
  v16.receiver = self;
  v16.super_class = (Class)TUConversationManagerXPCClient;
  v2 = [(TUConversationManagerXPCClient *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.telephonyutilities.conversationmanagerxpcclient", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    conversationsByGroupUUID = v3->_conversationsByGroupUUID;
    v3->_conversationsByGroupUUID = (NSDictionary *)MEMORY[0x1E4F1CC08];

    objc_initWeak(&location, v3);
    id v7 = v3->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __38__TUConversationManagerXPCClient_init__block_invoke;
    handler[3] = &unk_1E58E8CA0;
    objc_copyWeak(&v14, &location);
    v8 = v3;
    v13 = v8;
    notify_register_dispatch("CSDConversationManagerClientsShouldConnectNotification", &v3->_shouldConnectToken, v7, handler);
    id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_8);
    [WeakRetained registerClient:v8];

    id v10 = objc_loadWeakRetained(&sSynchronousServer_8);
    [v10 registerClient:v8];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

void __71__TUConversationManagerXPCClient_conversationManagerClientXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED50298];
  v3 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  conversationManagerClientXPCInterface_conversationManagerClientXPCInterface = v2;

  dispatch_queue_t v4 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  v5 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_updateConversationsByGroupUUID_ argumentIndex:0 ofReply:0];

  uint32_t v6 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  id v7 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v6 setClasses:v7 forSelector:sel_updateIncomingPendingConversationsByGroupUUID_ argumentIndex:0 ofReply:0];

  v8 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  uint64_t v9 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v8 setClasses:v9 forSelector:sel_updateActivatedConversationLinks_ argumentIndex:0 ofReply:0];

  id v10 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  uint64_t v11 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v10 setClasses:v11 forSelector:sel_conversation_addedMembersLocally_ argumentIndex:0 ofReply:0];

  id v12 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  v13 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v12 setClasses:v13 forSelector:sel_conversation_addedMembersLocally_ argumentIndex:1 ofReply:0];

  id v14 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  v15 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v14 setClasses:v15 forSelector:sel_conversation_buzzedMember_ argumentIndex:0 ofReply:0];

  objc_super v16 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  v17 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v16 setClasses:v17 forSelector:sel_conversation_buzzedMember_ argumentIndex:1 ofReply:0];

  v18 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  v19 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v18 setClasses:v19 forSelector:sel_updateActivityAuthorizedBundleIdentifierState_ argumentIndex:0 ofReply:0];

  v20 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  v21 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v20 setClasses:v21 forSelector:sel_receivedTrackedPendingMember_forConversationLink_ argumentIndex:0 ofReply:0];

  v22 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  v23 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v22 setClasses:v23 forSelector:sel_receivedTrackedPendingMember_forConversationLink_ argumentIndex:1 ofReply:0];

  v24 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  v25 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v24 setClasses:v25 forSelector:sel_remoteScreenShareAttributesChanged_isLocallySharing_ argumentIndex:0 ofReply:0];

  v26 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  id v27 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v26 setClasses:v27 forSelector:sel_remoteScreenShareEndedWithReason_ argumentIndex:0 ofReply:0];
}

void __71__TUConversationManagerXPCClient_conversationManagerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61D28];
  v3 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  conversationManagerServerXPCInterface_conversationManagerXPCInterface = v2;

  dispatch_queue_t v4 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v5 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_conversationsByGroupUUID_ argumentIndex:0 ofReply:1];

  uint32_t v6 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  id v7 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v6 setClasses:v7 forSelector:sel_incomingPendingConversationsByGroupUUID_ argumentIndex:0 ofReply:1];

  v8 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  uint64_t v9 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v8 setClasses:v9 forSelector:sel_pseudonymsByCallUUID_ argumentIndex:0 ofReply:1];

  id v10 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  uint64_t v11 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v10 setClasses:v11 forSelector:sel_activatedConversationLinks_ argumentIndex:0 ofReply:1];

  id v12 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v13 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v12 setClasses:v13 forSelector:sel_activityAuthorizedBundleIdentifierState_ argumentIndex:0 ofReply:1];

  id v14 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v15 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v14 setClasses:v15 forSelector:sel_addRemoteMembers_otherInvitedHandles_toConversationWithUUID_ argumentIndex:0 ofReply:0];

  objc_super v16 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v17 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v16 setClasses:v17 forSelector:sel_addRemoteMembers_otherInvitedHandles_toConversationWithUUID_ argumentIndex:1 ofReply:0];

  v18 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v19 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v18 setClasses:v19 forSelector:sel_prepareConversationWithUUID_withHandoffContext_ argumentIndex:1 ofReply:0];

  v20 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v21 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v20 setClasses:v21 forSelector:sel_setSharePlayHandedOff_onConversationWithUUID_ argumentIndex:1 ofReply:0];

  v22 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v23 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v22 setClasses:v23 forSelector:sel_updateConversationWithUUID_participantPresentationContexts_ argumentIndex:1 ofReply:0];

  v24 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v25 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v24 setClasses:v25 forSelector:sel_getLatestRemoteScreenShareAttributesWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v26 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  id v27 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v26 setClasses:v27 forSelector:sel_getActiveLinksWithCreatedOnly_completionHandler_ argumentIndex:0 ofReply:1];

  v28 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v29 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v28 setClasses:v29 forSelector:sel_generateLinkForConversationUUID_completionHandler_ argumentIndex:0 ofReply:1];

  v30 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v31 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v30 setClasses:v31 forSelector:sel_requestParticipantToShareScreen_forConversationUUID_ argumentIndex:0 ofReply:0];

  v32 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v33 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v32 setClasses:v33 forSelector:sel_cancelOrDenyScreenShareRequest_forConversationUUID_ argumentIndex:0 ofReply:0];

  v34 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v35 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v34 setClasses:v35 forSelector:sel_setScreenEnabled_withScreenShareAttributes_forConversationWithUUID_ argumentIndex:0 ofReply:0];

  v36 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v37 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v36 setClasses:v37 forSelector:sel_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler_ argumentIndex:0 ofReply:0];

  v38 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v39 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v38 setClasses:v39 forSelector:sel_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler_ argumentIndex:0 ofReply:1];

  v40 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v41 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v40 setClasses:v41 forSelector:sel_addInvitedMemberHandles_toConversationLink_completionHandler_ argumentIndex:0 ofReply:0];

  v42 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v43 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v42 setClasses:v43 forSelector:sel_addInvitedMemberHandles_toConversationLink_completionHandler_ argumentIndex:1 ofReply:0];

  v44 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  v45 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v44 setClasses:v45 forSelector:sel_addInvitedMemberHandles_toConversationLink_completionHandler_ argumentIndex:0 ofReply:1];

  v46 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  id v47 = [*(id *)(a1 + 32) conversationManagerAllowedClasses];
  [v46 setClasses:v47 forSelector:sel_fetchUpcomingNoticeWithCompletionHandler_ argumentIndex:0 ofReply:1];
}

+ (NSSet)conversationManagerAllowedClasses
{
  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (NSSet *)objc_msgSend(v24, "setWithObjects:", v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6, v7,
                    v8,
                    v9,
                    v10,
                    v11,
                    objc_opt_class(),
                    0);
}

- (void)refreshActiveConversations
{
  id v2 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_46];
  [v2 refreshActiveConversations];
}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__TUConversationManagerXPCClient_getActiveLinksWithCreatedOnly_completionHandler___block_invoke;
  v9[3] = &unk_1E58E5CC8;
  id v10 = v6;
  id v7 = v6;
  uint64_t v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v9];
  [v8 getActiveLinksWithCreatedOnly:v4 completionHandler:v7];
}

uint64_t __64__TUConversationManagerXPCClient_registerWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) hasRequestedInitialState];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2)
  {
    return [v3 _invokeCompletionHandler:v4];
  }
  else
  {
    return [v3 _requestInitialStateWithCompletionHandler:v4];
  }
}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__TUConversationManagerXPCClient_registerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58E60D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (TUConversationManagerXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_8);

  return (TUConversationManagerXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUConversationManagerXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_8);

  return (TUConversationManagerXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

void __38__TUConversationManagerXPCClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained
    && [WeakRetained hasRequestedInitialState]
    && ([v3 hasInitialState] & 1) == 0)
  {
    id v4 = [v3 queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__TUConversationManagerXPCClient_init__block_invoke_2;
    v5[3] = &unk_1E58E5C08;
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);
  }
}

void __38__TUConversationManagerXPCClient_init__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "CSDConversationManagerClientsShouldConnectNotification";
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 11) = 1;
  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__TUConversationManagerXPCClient_init__block_invoke_2;
  v4[3] = &unk_1E58E5C08;
  id v5 = v3;
  id v6 = *(id *)(a1 + 40);
  [v5 _requestInitialStateWithCompletionHandler:v4];
}

{
  NSObject *v2;
  void v3[4];
  id v4;
  id v5;

  char v2 = [*(id *)(a1 + 32) queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__TUConversationManagerXPCClient_init__block_invoke_2_3;
  v3[3] = &unk_1E58E5C08;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __38__TUConversationManagerXPCClient_init__block_invoke_2_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 conversationsChangedForDataSource:*(void *)(a1 + 32) conversationsByGroupUUID:*(void *)(*(void *)(a1 + 40) + 64) oldConversationsByGroupUUID:MEMORY[0x1E4F1CC08]];
}

- (void)dealloc
{
  notify_cancel(self->_shouldConnectToken);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUConversationManagerXPCClient;
  [(TUConversationManagerXPCClient *)&v3 dealloc];
}

- (NSDictionary)incomingPendingConversationsByGroupUUID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke;
  v6[3] = &unk_1E58E5C78;
  v6[4] = &v7;
  id v2 = [(TUConversationManagerXPCClient *)self synchronousServerWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke_9;
  v5[3] = &unk_1E58E76E8;
  void v5[4] = &v7;
  [v2 incomingPendingConversationsByGroupUUID:v5];

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v3;
}

void __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x1E4F1CC08];
}

void __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke_9(uint64_t a1, void *a2)
{
}

- (NSDictionary)pseudonymsByCallUUID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke;
  v6[3] = &unk_1E58E5C78;
  v6[4] = &v7;
  id v2 = [(TUConversationManagerXPCClient *)self synchronousServerWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke_11;
  v5[3] = &unk_1E58E76E8;
  void v5[4] = &v7;
  [v2 pseudonymsByCallUUID:v5];

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v3;
}

void __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x1E4F1CC08];
}

void __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke_11(uint64_t a1, void *a2)
{
}

- (NSSet)activatedConversationLinks
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke;
  v6[3] = &unk_1E58E5C78;
  v6[4] = &v7;
  id v2 = [(TUConversationManagerXPCClient *)self synchronousServerWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke_12;
  v5[3] = &unk_1E58E6E00;
  void v5[4] = &v7;
  [v2 activatedConversationLinks:v5];

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v3;
}

void __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke_cold_1();
  }

  uint64_t v5 = [MEMORY[0x1E4F1C978] array];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke_12(uint64_t a1, void *a2)
{
}

- (NSDictionary)activityAuthorizedBundleIdentifiers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  id v3 = [(TUConversationManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__TUConversationManagerXPCClient_activityAuthorizedBundleIdentifiers__block_invoke;
  v6[3] = &unk_1E58E6E90;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __69__TUConversationManagerXPCClient_activityAuthorizedBundleIdentifiers__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _requestInitialStateIfNecessary];
  id v2 = *(void **)(*(void *)(a1 + 32) + 72);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (BOOL)autoSharePlayEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(TUConversationManagerXPCClient *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__TUConversationManagerXPCClient_autoSharePlayEnabled__block_invoke;
  v5[3] = &unk_1E58E6E90;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __54__TUConversationManagerXPCClient_autoSharePlayEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _requestInitialStateIfNecessary];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  return result;
}

- (BOOL)isSharePlayAvailable
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(TUConversationManagerXPCClient *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke;
  v5[3] = &unk_1E58E6E90;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldConnectToHost];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 sharePlayAvailable];

    if (!v4)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_2;
      v10[3] = &unk_1E58E6A70;
      v10[4] = v5;
      uint64_t v6 = [v5 synchronousServerWithErrorHandler:v10];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_14;
      v9[3] = &unk_1E58E8A78;
      void v9[4] = *(void *)(a1 + 32);
      [v6 getSharePlayAvailableWithCompletionHandler:v9];
    }
  }
  else
  {
    [v3 setSharePlayAvailable:MEMORY[0x1E4F1CC38]];
  }
  uint64_t v7 = [*(id *)(a1 + 32) sharePlayAvailable];
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) sharePlayAvailable];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 BOOLValue];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 32) setSharePlayAvailable:0];
}

void __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_14(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setSharePlayAvailable:v3];
}

- (BOOL)isScreenSharingAvailable
{
  int v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(TUConversationManagerXPCClient *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke;
  v5[3] = &unk_1E58E6E90;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldConnectToHost];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 screenSharingAvailable];

    if (!v4)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_2;
      v10[3] = &unk_1E58E6A70;
      v10[4] = v5;
      uint64_t v6 = [v5 synchronousServerWithErrorHandler:v10];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_17;
      v9[3] = &unk_1E58E8A78;
      void v9[4] = *(void *)(a1 + 32);
      [v6 getScreenSharingAvailableWithCompletionHandler:v9];
    }
  }
  else
  {
    [v3 setScreenSharingAvailable:MEMORY[0x1E4F1CC38]];
  }
  uint64_t v7 = [*(id *)(a1 + 32) screenSharingAvailable];
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) screenSharingAvailable];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 BOOLValue];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 32) setScreenSharingAvailable:0];
}

void __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_17(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setScreenSharingAvailable:v3];
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_59];
  uint64_t v11 = [v8 UUID];

  [v12 addRemoteMembers:v10 otherInvitedHandles:v9 toConversationWithUUID:v11];
}

void __86__TUConversationManagerXPCClient_addRemoteMembers_otherInvitedHandles_toConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __86__TUConversationManagerXPCClient_addRemoteMembers_otherInvitedHandles_toConversation___block_invoke_cold_1();
  }
}

- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_19_1];
  [v8 prepareConversationWithUUID:v7 withHandoffContext:v6];
}

void __81__TUConversationManagerXPCClient_prepareConversationWithUUID_withHandoffContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __81__TUConversationManagerXPCClient_prepareConversationWithUUID_withHandoffContext___block_invoke_cold_1();
  }
}

- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __79__TUConversationManagerXPCClient_setSharePlayHandedOff_onConversationWithUUID___block_invoke;
  id v12 = &unk_1E58E8CC8;
  BOOL v14 = v4;
  id v13 = v6;
  id v7 = v6;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&v9];
  objc_msgSend(v8, "setSharePlayHandedOff:onConversationWithUUID:", v4, v7, v9, v10, v11, v12);
}

void __79__TUConversationManagerXPCClient_setSharePlayHandedOff_onConversationWithUUID___block_invoke()
{
  v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __79__TUConversationManagerXPCClient_setSharePlayHandedOff_onConversationWithUUID___block_invoke_cold_1();
  }
}

- (void)updateMessagesGroupName:(id)a3 onConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_21_0];
  id v8 = [v6 UUID];

  [v9 updateMessagesGroupName:v7 onConversationWithUUID:v8];
}

void __73__TUConversationManagerXPCClient_updateMessagesGroupName_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__TUConversationManagerXPCClient_updateMessagesGroupName_onConversation___block_invoke_cold_1();
  }
}

- (void)setGridDisplayMode:(unint64_t)a3 conversation:(id)a4
{
  id v6 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_23_0];
  id v7 = [v6 UUID];

  [v8 setGridDisplayMode:a3 forConversationWithUUID:v7];
}

void __66__TUConversationManagerXPCClient_setGridDisplayMode_conversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __66__TUConversationManagerXPCClient_setGridDisplayMode_conversation___block_invoke_cold_1();
  }
}

- (void)conversationUpdateMessagesGroupPhoto:(id)a3
{
  id v4 = a3;
  id v6 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_25_0];
  uint64_t v5 = [v4 UUID];

  [v6 updateMessagesGroupPhotoOnConversationWithUUID:v5];
}

void __71__TUConversationManagerXPCClient_conversationUpdateMessagesGroupPhoto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__TUConversationManagerXPCClient_conversationUpdateMessagesGroupPhoto___block_invoke_cold_1();
  }
}

- (void)createActivitySession:(id)a3 onConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_27_1];
  id v8 = [v6 UUID];

  [v9 createActivitySession:v7 onConversationWithUUID:v8];
}

void __71__TUConversationManagerXPCClient_createActivitySession_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__TUConversationManagerXPCClient_createActivitySession_onConversation___block_invoke_cold_1();
  }
}

- (void)leaveActivitySession:(id)a3 onConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_29];
  id v8 = [v6 UUID];

  [v9 leaveActivitySession:v7 onConversationWithUUID:v8];
}

void __70__TUConversationManagerXPCClient_leaveActivitySession_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__TUConversationManagerXPCClient_leaveActivitySession_onConversation___block_invoke_cold_1();
  }
}

- (void)endActivitySession:(id)a3 onConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_31];
  id v8 = [v6 UUID];

  [v9 endActivitySession:v7 onConversationWithUUID:v8];
}

void __68__TUConversationManagerXPCClient_endActivitySession_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__TUConversationManagerXPCClient_endActivitySession_onConversation___block_invoke_cold_1();
  }
}

- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_33_1];
  [v10 setUsingAirplay:v6 onActivitySession:v9 onConversationWithUUID:v8];
}

void __91__TUConversationManagerXPCClient_setUsingAirplay_onActivitySession_onConversationWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91__TUConversationManagerXPCClient_setUsingAirplay_onActivitySession_onConversationWithUUID___block_invoke_cold_1();
  }
}

- (void)presentDismissalAlertForActivitySession:(id)a3 onConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __89__TUConversationManagerXPCClient_presentDismissalAlertForActivitySession_onConversation___block_invoke;
  uint64_t v16 = &unk_1E58E8CF0;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&v13];
  uint64_t v11 = objc_msgSend(v9, "UUID", v13, v14, v15, v16);
  id v12 = [v8 UUID];
  [v10 presentDismissalAlertForActivitySessionWithUUID:v11 onConversationWithUUID:v12];
}

void __89__TUConversationManagerXPCClient_presentDismissalAlertForActivitySession_onConversation___block_invoke()
{
  v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __89__TUConversationManagerXPCClient_presentDismissalAlertForActivitySession_onConversation___block_invoke_cold_1();
  }
}

- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __79__TUConversationManagerXPCClient_setActivityAuthorization_forBundleIdentifier___block_invoke;
  id v12 = &unk_1E58E8CC8;
  BOOL v14 = v4;
  id v13 = v6;
  id v7 = v6;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&v9];
  objc_msgSend(v8, "setActivityAuthorization:forBundleIdentifier:", v4, v7, v9, v10, v11, v12);
}

void __79__TUConversationManagerXPCClient_setActivityAuthorization_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __79__TUConversationManagerXPCClient_setActivityAuthorization_forBundleIdentifier___block_invoke_cold_1();
  }
}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_35_0];
  [v4 setAutoSharePlayEnabled:v3];
}

void __58__TUConversationManagerXPCClient_setAutoSharePlayEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__TUConversationManagerXPCClient_setAutoSharePlayEnabled___block_invoke_cold_1();
  }
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_37_2];
  [v5 joinConversationWithRequest:v4];
}

void __62__TUConversationManagerXPCClient_joinConversationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__TUConversationManagerXPCClient_joinConversationWithRequest___block_invoke_cold_1();
  }
}

- (void)leaveConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_39_0];
  [v5 leaveConversationWithUUID:v4];
}

void __60__TUConversationManagerXPCClient_leaveConversationWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__TUConversationManagerXPCClient_leaveConversationWithUUID___block_invoke_cold_1();
  }
}

- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke;
  v18[3] = &unk_1E58E7648;
  id v19 = v10;
  id v12 = v11;
  id v20 = v12;
  id v13 = v10;
  BOOL v14 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke_40;
  v16[3] = &unk_1E58E5CC8;
  id v17 = v12;
  id v15 = v12;
  [v14 launchApplicationForActivitySessionUUID:v13 authorizedExternally:v8 forceBackground:v7 completionHandler:v16];
}

void __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "LaunchApplication error: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)buzzMember:(id)a3 conversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_42];
  uint64_t v8 = [v6 UUID];

  [v9 buzzMember:v7 conversationUUID:v8];
}

void __58__TUConversationManagerXPCClient_buzzMember_conversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error buzzing member: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)kickMember:(id)a3 conversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_44];
  uint64_t v8 = [v6 UUID];

  [v9 kickMember:v7 conversationUUID:v8];
}

void __58__TUConversationManagerXPCClient_kickMember_conversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error kicking member: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversation:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __87__TUConversationManagerXPCClient_setDownlinkMuted_forRemoteParticipantsInConversation___block_invoke;
  id v13 = &unk_1E58E8CC8;
  BOOL v15 = v4;
  id v14 = v6;
  id v7 = v6;
  uint64_t v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&v10];
  id v9 = objc_msgSend(v7, "UUID", v10, v11, v12, v13);
  [v8 setDownlinkMuted:v4 forRemoteParticipantsInConversationWithUUID:v9];
}

void __87__TUConversationManagerXPCClient_setDownlinkMuted_forRemoteParticipantsInConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = 67109634;
    v7[1] = v5;
    __int16 v8 = 2112;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error setting downlink muted: (%d) for remote participants in conversation: %@ with error: %@", (uint8_t *)v7, 0x1Cu);
  }
}

- (void)addScreenSharingType:(unint64_t)a3 forConversation:(id)a4
{
  id v6 = a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __71__TUConversationManagerXPCClient_addScreenSharingType_forConversation___block_invoke;
  id v13 = &unk_1E58E8D18;
  id v14 = v6;
  unint64_t v15 = a3;
  id v7 = v6;
  __int16 v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&v10];
  uint64_t v9 = objc_msgSend(v7, "UUID", v10, v11, v12, v13);
  [v8 addScreenSharingType:a3 forConversationUUID:v9];
}

void __71__TUConversationManagerXPCClient_addScreenSharingType_forConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__TUConversationManagerXPCClient_addScreenSharingType_forConversation___block_invoke_cold_1();
  }
}

- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __92__TUConversationManagerXPCClient_getLatestRemoteScreenShareAttributesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58E5CC8;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v7];
  [v6 getLatestRemoteScreenShareAttributesWithCompletionHandler:v5];
}

void __92__TUConversationManagerXPCClient_getLatestRemoteScreenShareAttributesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get latest remote screen share attributes with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__TUConversationManagerXPCClient_refreshActiveConversations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__TUConversationManagerXPCClient_refreshActiveConversations__block_invoke_cold_1();
  }
}

void __82__TUConversationManagerXPCClient_getActiveLinksWithCreatedOnly_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in retrieving active links: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)generateLinkForConversation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__TUConversationManagerXPCClient_generateLinkForConversation_completionHandler___block_invoke;
  v11[3] = &unk_1E58E5CC8;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v11];
  uint64_t v10 = [v8 UUID];

  [v9 generateLinkForConversationUUID:v10 completionHandler:v7];
}

void __80__TUConversationManagerXPCClient_generateLinkForConversation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in generating link (for conversation): %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__TUConversationManagerXPCClient_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke;
  v12[3] = &unk_1E58E5CC8;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  uint64_t v11 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v12];
  [v11 generateLinkWithInvitedMemberHandles:v10 linkLifetimeScope:a4 completionHandler:v9];
}

void __107__TUConversationManagerXPCClient_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in generating link (with invited member handles): %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__TUConversationManagerXPCClient_addInvitedMemberHandles_toConversationLink_completionHandler___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v13];
  [v12 addInvitedMemberHandles:v11 toConversationLink:v10 completionHandler:v9];
}

void __95__TUConversationManagerXPCClient_addInvitedMemberHandles_toConversationLink_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in adding invited members to link: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__TUConversationManagerXPCClient_invalidateLink_deleteReason_completionHandler___block_invoke;
  v12[3] = &unk_1E58E5CC8;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v12];
  [v11 invalidateLink:v10 deleteReason:a4 completionHandler:v9];
}

void __80__TUConversationManagerXPCClient_invalidateLink_deleteReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in invalidating link: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__TUConversationManagerXPCClient_renewLink_expirationDate_reason_completionHandler___block_invoke;
  v15[3] = &unk_1E58E5CC8;
  id v16 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v15];
  [v14 renewLink:v13 expirationDate:v12 reason:a5 completionHandler:v11];
}

void __84__TUConversationManagerXPCClient_renewLink_expirationDate_reason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in renewing link to new expiration date: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__TUConversationManagerXPCClient_checkLinkValidity_completionHandler___block_invoke;
  v10[3] = &unk_1E58E5CC8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v10];
  [v9 checkLinkValidity:v8 completionHandler:v7];
}

void __70__TUConversationManagerXPCClient_checkLinkValidity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in checking the validity of the link: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

- (void)getInactiveLinkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __71__TUConversationManagerXPCClient_getInactiveLinkWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58E5CC8;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v7];
  [v6 getInactiveLinkWithCompletionHandler:v5];
}

void __71__TUConversationManagerXPCClient_getInactiveLinkWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in obtaining an inactive pre-prepared link: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)activateLink:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__TUConversationManagerXPCClient_activateLink_completionHandler___block_invoke;
  v10[3] = &unk_1E58E5CC8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v10];
  [v9 activateLink:v8 completionHandler:v7];
}

void __65__TUConversationManagerXPCClient_activateLink_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in activating a pre-prepared link: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__TUConversationManagerXPCClient_setLinkName_forConversationLink_completionHandler___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v13];
  [v12 setLinkName:v11 forConversationLink:v10 completionHandler:v9];
}

void __84__TUConversationManagerXPCClient_setLinkName_forConversationLink_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error in setting link name: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_48_0];
  [v4 scheduleConversationLinkCheckInInitial:v3];
}

void __73__TUConversationManagerXPCClient_scheduleConversationLinkCheckInInitial___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error in scheduling a sync for activated conversation links: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(TUConversationManagerXPCClient *)self synchronousServerWithErrorHandler:&__block_literal_global_50_2];
  [v7 linkSyncStateIncludeLinks:v4 WithCompletion:v6];
}

void __75__TUConversationManagerXPCClient_linkSyncStateIncludeLinks_WithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error in getting link sync state: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)approvePendingMember:(id)a3 forConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_52_1];
  uint64_t v8 = [v6 UUID];

  [v9 approvePendingMember:v7 forConversationUUID:v8];
}

void __71__TUConversationManagerXPCClient_approvePendingMember_forConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error in approving pending member waiting to be let-in: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)requestParticipantToShareScreen:(id)a3 forConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_54_1];
  uint64_t v8 = [v6 UUID];

  [v9 requestParticipantToShareScreen:v7 forConversationUUID:v8];
}

void __82__TUConversationManagerXPCClient_requestParticipantToShareScreen_forConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error in generating screen share request with requested Participant: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_56_1];
  uint64_t v8 = [v6 UUID];

  [v9 cancelOrDenyScreenShareRequest:v7 forConversationUUID:v8];
}

void __81__TUConversationManagerXPCClient_cancelOrDenyScreenShareRequest_forConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "cancelling screen share request failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__TUConversationManagerXPCClient_setScreenEnabled_withScreenShareAttributes_forConversationWithUUID___block_invoke;
  v12[3] = &unk_1E58E6A70;
  id v13 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v12];
  [v11 setScreenEnabled:v6 withScreenShareAttributes:v10 forConversationWithUUID:v9];
}

void __101__TUConversationManagerXPCClient_setScreenEnabled_withScreenShareAttributes_forConversationWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error: %@ in setting screen enabled for conversationWithUUID: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)rejectPendingMember:(id)a3 forConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_58_1];
  __int16 v8 = [v6 UUID];

  [v9 rejectPendingMember:v7 forConversationUUID:v8];
}

void __70__TUConversationManagerXPCClient_rejectPendingMember_forConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error in rejecting pending member waiting to be let-in: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversation:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_60_0];
  id v7 = [v6 UUID];

  [v8 setIgnoreLetMeInRequests:v4 forConversationUUID:v7];
}

void __75__TUConversationManagerXPCClient_setIgnoreLetMeInRequests_forConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error in setting ignore let me in requests: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __75__TUConversationManagerXPCClient_fetchUpcomingNoticeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58E5CC8;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v7];
  [v6 fetchUpcomingNoticeWithCompletionHandler:v5];
}

void __75__TUConversationManagerXPCClient_fetchUpcomingNoticeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__TUConversationManagerXPCClient_fetchUpcomingNoticeWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __91__TUConversationManagerXPCClient_activateConversationNoticeWithActionURL_bundleIdentifier___block_invoke;
  id v14 = &unk_1E58E8CF0;
  id v15 = v6;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&v11];
  objc_msgSend(v10, "activateConversationNoticeWithActionURL:bundleIdentifier:", v9, v8, v11, v12, v13, v14);
}

void __91__TUConversationManagerXPCClient_activateConversationNoticeWithActionURL_bundleIdentifier___block_invoke()
{
  v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __91__TUConversationManagerXPCClient_activateConversationNoticeWithActionURL_bundleIdentifier___block_invoke_cold_1();
  }
}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __67__TUConversationManagerXPCClient_removeConversationNoticeWithUUID___block_invoke;
  v7[3] = &unk_1E58E6A70;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v7];
  [v6 removeConversationNoticeWithUUID:v5];
}

void __67__TUConversationManagerXPCClient_removeConversationNoticeWithUUID___block_invoke(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __67__TUConversationManagerXPCClient_removeConversationNoticeWithUUID___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (void)invalidate
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_8);
  [WeakRetained unregisterClient:self];

  id v5 = objc_loadWeakRetained(&sSynchronousServer_8);
  [v5 unregisterClient:self];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_62_0];
  [v8 updateConversationWithUUID:v7 participantPresentationContexts:v6];
}

void __93__TUConversationManagerXPCClient_updateConversationWithUUID_participantPresentationContexts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __93__TUConversationManagerXPCClient_updateConversationWithUUID_participantPresentationContexts___block_invoke_cold_1();
  }
}

- (void)setSupportsMessagesGroupProviding:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_64];
  [v4 setSupportsMessagesGroupProviding:v3];
}

void __68__TUConversationManagerXPCClient_setSupportsMessagesGroupProviding___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__TUConversationManagerXPCClient_setSupportsMessagesGroupProviding___block_invoke_cold_1();
  }
}

- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_66];
  [v8 getMessagesGroupDetailsForConversationUUID:v7 completionHandler:v6];
}

void __95__TUConversationManagerXPCClient_getMessagesGroupDetailsForConversationUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __95__TUConversationManagerXPCClient_getMessagesGroupDetailsForConversationUUID_completionHandler___block_invoke_cold_1();
  }
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = MEMORY[0x1E4F1CC08];

  [*(id *)(a1 + 32) setHasInitialState:0];
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_67(uint64_t a1, void *a2)
{
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = MEMORY[0x1E4F1CC08];

  [*(id *)(a1 + 32) setHasInitialState:0];
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"bk"];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v4;

  id v7 = [v3 objectForKeyedSubscript:@"gk"];

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v7 BOOLValue];
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_73_cold_1();
  }

  [*(id *)(a1 + 32) setSharePlayAvailable:0];
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_74(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  uint64_t v4 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setSharePlayAvailable:v4];

  uint64_t v5 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_75;
  v6[3] = &unk_1E58E6280;
  v6[4] = *(void *)(a1 + 32);
  char v7 = v2;
  dispatch_async(v5, v6);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_75(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sharePlayAvailableChanged:*(unsigned __int8 *)(a1 + 40)];
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_3_cold_1();
  }

  [*(id *)(a1 + 32) setScreenSharingAvailable:0];
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_76(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  uint64_t v4 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setScreenSharingAvailable:v4];

  uint64_t v5 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_77;
  v6[3] = &unk_1E58E6280;
  v6[4] = *(void *)(a1 + 32);
  char v7 = v2;
  dispatch_async(v5, v6);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_77(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 screenSharingAvailableChanged:*(unsigned __int8 *)(a1 + 40)];
}

- (void)handleServerDisconnect
{
  id v3 = [(TUConversationManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Server did disconnect", v10, 2u);
  }

  conversationsByGroupUUID = self->_conversationsByGroupUUID;
  self->_conversationsByGroupUUID = (NSDictionary *)MEMORY[0x1E4F1CC08];
  id v6 = conversationsByGroupUUID;

  self->_hasInitialState = 0;
  sharePlayAvailable = self->_sharePlayAvailable;
  self->_sharePlayAvailable = 0;

  screenSharingAvailable = self->_screenSharingAvailable;
  self->_screenSharingAvailable = 0;

  id v9 = [(TUConversationManagerXPCClient *)self delegate];
  [v9 serverDisconnectedForDataSource:self oldConversationsByGroupUUID:v6];
}

void __47__TUConversationManagerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = TUDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", buf, 2u);
    }

    [WeakRetained setXpcConnection:0];
    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_82;
    block[3] = &unk_1E58E5BE0;
    block[4] = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_82(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleServerDisconnect];
}

void __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = TUDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", buf, 2u);
    }

    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_83;
    block[3] = &unk_1E58E5BE0;
    block[4] = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_83(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleServerDisconnect];
}

- (void)setXpcConnection:(id)a3
{
  id v8 = (NSXPCConnection *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  p_xpcConnection = &self->_xpcConnection;
  if (xpcConnection != v8) {
    objc_storeStrong((id *)p_xpcConnection, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_8);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    id v8 = [(TUConversationManagerXPCClient *)self xpcConnection];
    id v7 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (void)updateConversationsByGroupUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __65__TUConversationManagerXPCClient_updateConversationsByGroupUUID___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__TUConversationManagerXPCClient_updateConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) allKeys];
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "conversationsByGroupUUID keys: %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v4 + 64);
  id v6 = *(id *)(a1 + 32);
  id v7 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v6;
  id v8 = v5;

  id v9 = [*(id *)(a1 + 40) delegate];
  [v9 conversationsChangedForDataSource:*(void *)(a1 + 40) conversationsByGroupUUID:*(void *)(a1 + 32) oldConversationsByGroupUUID:v8];
}

- (void)updateIncomingPendingConversationsByGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManagerXPCClient *)self delegate];
  [v5 conversationsChangedForDataSource:self updatedIncomingPendingConversationsByGroupUUID:v4];
}

- (void)activeParticipant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(TUConversationManagerXPCClient *)self delegate];
  [v16 activeParticipant:v15 addedHighlightToConversation:v14 highlightIdentifier:v13 oldHighlightIdentifier:v12 isFirstAdd:v7];
}

- (void)activeParticipant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUConversationManagerXPCClient *)self delegate];
  [v11 activeParticipant:v10 removedHighlightFromConversation:v9 highlightIdentifier:v8];
}

- (void)conversation:(id)a3 collaborationStateChanged:(int64_t)a4 highlightIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(TUConversationManagerXPCClient *)self delegate];
  [v10 conversation:v9 collaborationStateChanged:a4 highlightIdentifier:v8];
}

- (void)addedCollaborationDictionary:(id)a3 forConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConversationManagerXPCClient *)self delegate];
  [v8 addedCollaborationDictionary:v7 forConversation:v6];
}

- (void)conversationUpdatedMessagesGroupPhoto:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __72__TUConversationManagerXPCClient_conversationUpdatedMessagesGroupPhoto___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__TUConversationManagerXPCClient_conversationUpdatedMessagesGroupPhoto___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) UUID];
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "conversationUpdatedMessagesGroupPhoto: %@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) delegate];
  [v4 conversationUpdatedMessagesGroupPhoto:*(void *)(a1 + 32)];
}

- (void)updateActivatedConversationLinks:(id)a3
{
  id v4 = a3;
  int v5 = [(TUConversationManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __67__TUConversationManagerXPCClient_updateActivatedConversationLinks___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__TUConversationManagerXPCClient_updateActivatedConversationLinks___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "updateActivatedConversationLinks: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) delegate];
  [v4 conversationManagerDataSource:*(void *)(a1 + 40) didChangeActivatedConversationLinks:*(void *)(a1 + 32)];
}

- (void)receivedTrackedPendingMember:(id)a3 forConversationLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__TUConversationManagerXPCClient_receivedTrackedPendingMember_forConversationLink___block_invoke;
  block[3] = &unk_1E58E6258;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __83__TUConversationManagerXPCClient_receivedTrackedPendingMember_forConversationLink___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "receivedTrackedPendingMember: %@ forConversationLink: %@", (uint8_t *)&v6, 0x16u);
  }

  int v5 = [*(id *)(a1 + 48) delegate];
  [v5 receivedTrackedPendingMember:*(void *)(a1 + 32) forConversationLink:*(void *)(a1 + 40)];
}

- (void)conversation:(id)a3 screenSharingChangedForParticipant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__TUConversationManagerXPCClient_conversation_screenSharingChangedForParticipant___block_invoke;
  block[3] = &unk_1E58E6258;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __82__TUConversationManagerXPCClient_conversation_screenSharingChangedForParticipant___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "screenSharingChangedForParticipant: %llu", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) delegate];
  [v4 conversation:*(void *)(a1 + 48) screenSharingChangedForParticipant:*(void *)(a1 + 32)];
}

- (void)remoteScreenShareAttributesChanged:(id)a3 isLocallySharing:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__TUConversationManagerXPCClient_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke;
  block[3] = &unk_1E58E6DB0;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __86__TUConversationManagerXPCClient_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = @"YES";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v4 = @"NO";
    }
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "remoteScreenShareAttributesChanged: %@ isLocallySharing: %@", (uint8_t *)&v6, 0x16u);
  }

  int v5 = [*(id *)(a1 + 40) delegate];
  [v5 remoteScreenShareAttributesChanged:*(void *)(a1 + 32) isLocallySharing:*(unsigned __int8 *)(a1 + 48)];
}

- (void)remoteScreenShareEndedWithReason:(id)a3
{
  id v4 = a3;
  int v5 = [(TUConversationManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __67__TUConversationManagerXPCClient_remoteScreenShareEndedWithReason___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__TUConversationManagerXPCClient_remoteScreenShareEndedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "remoteScreenShareEndedWithReason: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) delegate];
  [v4 remoteScreenShareEndedWithReason:*(void *)(a1 + 32)];
}

- (void)sharePlayAvailableChanged:(BOOL)a3
{
  int v5 = [(TUConversationManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__TUConversationManagerXPCClient_sharePlayAvailableChanged___block_invoke;
  v6[3] = &unk_1E58E6280;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __60__TUConversationManagerXPCClient_sharePlayAvailableChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sharePlayAvailable];
  if (!v2
    || (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) sharePlayAvailable],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 BOOLValue],
        int v6 = *(unsigned __int8 *)(a1 + 40),
        v4,
        v3,
        v6 != v5))
  {
    BOOL v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int8 *)(a1 + 40);
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "sharePlayAvailable changed to: %d", (uint8_t *)v12, 8u);
    }

    id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [*(id *)(a1 + 32) setSharePlayAvailable:v9];

    uint64_t v10 = [*(id *)(a1 + 32) delegate];
    id v11 = [*(id *)(a1 + 32) sharePlayAvailable];
    objc_msgSend(v10, "sharePlayAvailableChanged:", objc_msgSend(v11, "BOOLValue"));
  }
}

- (void)screenSharingAvailableChanged:(BOOL)a3
{
  int v5 = [(TUConversationManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__TUConversationManagerXPCClient_screenSharingAvailableChanged___block_invoke;
  v6[3] = &unk_1E58E6280;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __64__TUConversationManagerXPCClient_screenSharingAvailableChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) screenSharingAvailable];
  if (!v2
    || (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) screenSharingAvailable],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 BOOLValue],
        int v6 = *(unsigned __int8 *)(a1 + 40),
        v4,
        v3,
        v6 != v5))
  {
    BOOL v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int8 *)(a1 + 40);
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "screenSharingAvailable changed to: %d", (uint8_t *)v12, 8u);
    }

    id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [*(id *)(a1 + 32) setScreenSharingAvailable:v9];

    uint64_t v10 = [*(id *)(a1 + 32) delegate];
    id v11 = [*(id *)(a1 + 32) screenSharingAvailable];
    objc_msgSend(v10, "screenSharingAvailableChanged:", objc_msgSend(v11, "BOOLValue"));
  }
}

- (void)mediaPrioritiesChangedForConversation:(id)a3
{
  id v4 = a3;
  int v5 = [(TUConversationManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __72__TUConversationManagerXPCClient_mediaPrioritiesChangedForConversation___block_invoke;
  v7[3] = &unk_1E58E5C08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__TUConversationManagerXPCClient_mediaPrioritiesChangedForConversation___block_invoke(uint64_t a1)
{
  id v14 = (id)[*(id *)(*(void *)(a1 + 32) + 64) mutableCopy];
  uint64_t v2 = [*(id *)(a1 + 40) groupUUID];
  uint64_t v3 = [v14 objectForKeyedSubscript:v2];
  id v4 = (void *)[v3 copy];

  [v4 updateParticipantMediaPrioritiesWithConversation:*(void *)(a1 + 40)];
  int v5 = [*(id *)(a1 + 40) groupUUID];
  [v14 setObject:v4 forKeyedSubscript:v5];

  uint64_t v6 = [v14 copy];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = v6;

  id v9 = [*(id *)(a1 + 32) mediaDelegate];
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = *(void **)(*(void *)(a1 + 32) + 64);
  BOOL v12 = [v10 groupUUID];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];
  [v9 mediaPrioritiesChangeForConversation:v13];
}

- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TUConversationManagerXPCClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__TUConversationManagerXPCClient_conversation_participant_didReact___block_invoke;
  v15[3] = &unk_1E58E63D8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __68__TUConversationManagerXPCClient_conversation_participant_didReact___block_invoke(uint64_t a1)
{
  id v8 = (id)[*(id *)(*(void *)(a1 + 32) + 64) mutableCopy];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 groupUUID];
  [v8 setObject:v2 forKeyedSubscript:v3];

  uint64_t v4 = [v8 copy];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;

  uint64_t v7 = [*(id *)(a1 + 32) reactionsDelegate];
  [v7 conversation:*(void *)(a1 + 40) participant:*(void *)(a1 + 48) didReact:*(void *)(a1 + 56)];
}

- (void)conversation:(id)a3 participantDidStopReacting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__TUConversationManagerXPCClient_conversation_participantDidStopReacting___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __74__TUConversationManagerXPCClient_conversation_participantDidStopReacting___block_invoke(uint64_t a1)
{
  id v8 = (id)[*(id *)(*(void *)(a1 + 32) + 64) mutableCopy];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 groupUUID];
  [v8 setObject:v2 forKeyedSubscript:v3];

  uint64_t v4 = [v8 copy];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;

  id v7 = [*(id *)(a1 + 32) reactionsDelegate];
  [v7 conversation:*(void *)(a1 + 40) participantDidStopReacting:*(void *)(a1 + 48)];
}

- (void)conversation:(id)a3 participant:(id)a4 addedNotice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TUConversationManagerXPCClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__TUConversationManagerXPCClient_conversation_participant_addedNotice___block_invoke;
  v15[3] = &unk_1E58E63D8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __71__TUConversationManagerXPCClient_conversation_participant_addedNotice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 conversation:*(void *)(a1 + 40) participant:*(void *)(a1 + 48) addedNotice:*(void *)(a1 + 56)];
}

- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TUConversationManagerXPCClient_conversation_didChangeStateForActivitySession___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __80__TUConversationManagerXPCClient_conversation_didChangeStateForActivitySession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 conversation:*(void *)(a1 + 40) didChangeStateForActivitySession:*(void *)(a1 + 48)];
}

- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__TUConversationManagerXPCClient_conversation_didChangeSceneAssociationForActivitySession___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __91__TUConversationManagerXPCClient_conversation_didChangeSceneAssociationForActivitySession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 conversation:*(void *)(a1 + 40) didChangeSceneAssociationForActivitySession:*(void *)(a1 + 48)];
}

- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__TUConversationManagerXPCClient_conversation_receivedActivitySessionEvent___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __76__TUConversationManagerXPCClient_conversation_receivedActivitySessionEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 conversation:*(void *)(a1 + 40) receivedActivitySessionEvent:*(void *)(a1 + 48)];
}

- (void)getMessagesGroupDetailsForMessagesGroupUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__TUConversationManagerXPCClient_getMessagesGroupDetailsForMessagesGroupUUID_completionHandler___block_invoke;
  block[3] = &unk_1E58E75D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __96__TUConversationManagerXPCClient_getMessagesGroupDetailsForMessagesGroupUUID_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 conversationManagerDataSource:*(void *)(a1 + 32) messagesGroupDetailsForMessagesGroupId:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)conversation:(id)a3 addedMembersLocally:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__TUConversationManagerXPCClient_conversation_addedMembersLocally___block_invoke;
  block[3] = &unk_1E58E6258;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __67__TUConversationManagerXPCClient_conversation_addedMembersLocally___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "addedMembersLocally: %@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) delegate];
  [v4 conversation:*(void *)(a1 + 48) addedMembersLocally:*(void *)(a1 + 32)];
}

- (void)conversation:(id)a3 buzzedMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TUConversationManagerXPCClient_conversation_buzzedMember___block_invoke;
  block[3] = &unk_1E58E6258;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __60__TUConversationManagerXPCClient_conversation_buzzedMember___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "buzzedMember: %@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) delegate];
  [v4 conversation:*(void *)(a1 + 48) buzzedMember:*(void *)(a1 + 32)];
}

- (void)conversation:(id)a3 appLaunchState:(unint64_t)a4 forActivitySession:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412546;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "App launch state %@ for %@", buf, 0x16u);
  }
  id v12 = [(TUConversationManagerXPCClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__TUConversationManagerXPCClient_conversation_appLaunchState_forActivitySession___block_invoke;
  v15[3] = &unk_1E58E6008;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a4;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

void __81__TUConversationManagerXPCClient_conversation_appLaunchState_forActivitySession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 conversationManagerDataSource:*(void *)(a1 + 32) conversation:*(void *)(a1 + 40) appLaunchState:*(void *)(a1 + 56) forActivitySession:*(void *)(a1 + 48)];
}

- (void)updateActivityAuthorizedBundleIdentifierState:(id)a3
{
  id v4 = a3;
  int v5 = [(TUConversationManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __80__TUConversationManagerXPCClient_updateActivityAuthorizedBundleIdentifierState___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__TUConversationManagerXPCClient_updateActivityAuthorizedBundleIdentifierState___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "updateActivityAuthorizedBundleIdentifiers: %@", (uint8_t *)&v11, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(*(void *)(a1 + 40) + 72);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"bk"];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = v6;

  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"gk"];
  *(unsigned char *)(*(void *)(a1 + 40) + 8) = [v9 BOOLValue];

  id v10 = [*(id *)(a1 + 40) delegate];
  [v10 activityAuthorizationsChangedForDataSource:*(void *)(a1 + 40) oldActivityAuthorizedBundleIdentifiers:v5];
}

- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__TUConversationManagerXPCClient_updateLocalParticipantToAVLessWithPresentationMode_forConversationUUID___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a3;
  id v6 = a4;
  uint64_t v7 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v8];
  [v7 updateLocalParticipantToAVLessWithPresentationMode:a3 forConversationUUID:v6];
}

void __105__TUConversationManagerXPCClient_updateLocalParticipantToAVLessWithPresentationMode_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Downgrading local participant for presentationMode: %zu failed with error %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_91_0];
  [v7 setLocalParticipantAudioVideoMode:a3 forConversationUUID:v6];
}

void __88__TUConversationManagerXPCClient_setLocalParticipantAudioVideoMode_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Setting audio/video mode failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_93];
  [v5 registerMessagesGroupUUIDForConversationUUID:v4];
}

void __79__TUConversationManagerXPCClient_registerMessagesGroupUUIDForConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Registering messagesGroupUUID failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)addCollaborationIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_95_0];
  [v14 addCollaborationIdentifier:v13 collaborationURL:v12 cloudKitAppBundleIDs:v11 forConversationUUID:v10];
}

void __119__TUConversationManagerXPCClient_addCollaborationIdentifier_collaborationURL_cloudKitAppBundleIDs_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Setting collaboration identifier failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)startTrackingCollaborationWithIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_97_0];
  [v17 startTrackingCollaborationWithIdentifier:v16 collaborationURL:v15 cloudKitAppBundleIDs:v14 forConversationUUID:v13 completionHandler:v12];
}

void __151__TUConversationManagerXPCClient_startTrackingCollaborationWithIdentifier_collaborationURL_cloudKitAppBundleIDs_forConversationUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Tracking collaboration identifier failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)removeCollaborationIdentifier:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_99_0];
  [v8 removeCollaborationIdentifier:v7 forConversationUUID:v6];
}

void __84__TUConversationManagerXPCClient_removeCollaborationIdentifier_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "removing collaboration identifier failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)markCollaborationWithIdentifierOpened:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_101_1];
  [v8 markCollaborationWithIdentifierOpened:v7 forConversationUUID:v6];
}

void __92__TUConversationManagerXPCClient_markCollaborationWithIdentifierOpened_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Sending opened collaboration identifier failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)addCollaborationDictionary:(id)a3 forConversationWithUUID:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_103];
  [v10 addCollaborationDictionary:v9 forConversationWithUUID:v8 fromMe:v5];
}

void __92__TUConversationManagerXPCClient_addCollaborationDictionary_forConversationWithUUID_fromMe___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Adding collaboration dictionary failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __115__TUConversationManagerXPCClient_getNeedsDisclosureOfCollaborationInitiator_forConversationUUID_completionHandler___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:v13];
  [v12 getNeedsDisclosureOfCollaborationInitiator:v11 forConversationUUID:v10 completionHandler:v9];
}

void __115__TUConversationManagerXPCClient_getNeedsDisclosureOfCollaborationInitiator_forConversationUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Checking disclosure of collaboration initiator failed with error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConversationManagerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_105];
  [v8 addDisclosedCollaborationInitiator:v7 toConversationUUID:v6];
}

void __88__TUConversationManagerXPCClient_addDisclosedCollaborationInitiator_toConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Adding disclosed collaboration initiator failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (TUConversationManagerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUConversationManagerDataSourceDelegate *)WeakRetained;
}

- (TUConversationMediaControllerDataSourceDelegate)mediaDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaDelegate);

  return (TUConversationMediaControllerDataSourceDelegate *)WeakRetained;
}

- (void)setMediaDelegate:(id)a3
{
}

- (TUConversationReactionsControllerDataSourceDelegate)reactionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reactionsDelegate);

  return (TUConversationReactionsControllerDataSourceDelegate *)WeakRetained;
}

- (void)setReactionsDelegate:(id)a3
{
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (BOOL)hasInitialState
{
  return self->_hasInitialState;
}

- (void)setHasInitialState:(BOOL)a3
{
  self->_hasInitialState = a3;
}

- (void)setShouldConnectToken:(int)a3
{
  self->_shouldConnectToken = a3;
}

- (void)setShouldConnectToHost:(BOOL)a3
{
  self->_shouldConnectToHost = a3;
}

- (void)setConversationsByGroupUUID:(id)a3
{
}

- (void)setActivityAuthorizedBundleIdentifiers:(id)a3
{
}

- (NSNumber)sharePlayAvailable
{
  return self->_sharePlayAvailable;
}

- (void)setSharePlayAvailable:(id)a3
{
}

- (NSNumber)screenSharingAvailable
{
  return self->_screenSharingAvailable;
}

- (void)setScreenSharingAvailable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingAvailable, 0);
  objc_storeStrong((id *)&self->_sharePlayAvailable, 0);
  objc_storeStrong((id *)&self->_activityAuthorizedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_conversationsByGroupUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_reactionsDelegate);
  objc_destroyWeak((id *)&self->_mediaDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

void __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Retrieving incoming pending conversations failed with error %@", v2, v3, v4, v5, v6);
}

void __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Retrieving pseudonyms failed with error %@", v2, v3, v4, v5, v6);
}

void __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Retrieving activated conversation links failed with error %@", v2, v3, v4, v5, v6);
}

void __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Failed to fetch sharePlayAvailable error: %@", v2, v3, v4, v5, v6);
}

void __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Failed to fetch screenSharingAvailable error: %@", v2, v3, v4, v5, v6);
}

void __86__TUConversationManagerXPCClient_addRemoteMembers_otherInvitedHandles_toConversation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error updating remote members: %@", v2, v3, v4, v5, v6);
}

void __81__TUConversationManagerXPCClient_prepareConversationWithUUID_withHandoffContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error while preparing conversation with handoff: %@", v2, v3, v4, v5, v6);
}

void __79__TUConversationManagerXPCClient_setSharePlayHandedOff_onConversationWithUUID___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(&dword_19C496000, v0, OS_LOG_TYPE_ERROR, "Error while setting handedoff: %d on conversation with UUID: %@", v1, 0x12u);
}

void __73__TUConversationManagerXPCClient_updateMessagesGroupName_onConversation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error updating messages group name: %@", v2, v3, v4, v5, v6);
}

void __66__TUConversationManagerXPCClient_setGridDisplayMode_conversation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error setting grid display mode: %@", v2, v3, v4, v5, v6);
}

void __71__TUConversationManagerXPCClient_conversationUpdateMessagesGroupPhoto___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error updating messages group photo: %@", v2, v3, v4, v5, v6);
}

void __71__TUConversationManagerXPCClient_createActivitySession_onConversation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error updating activity: %@", v2, v3, v4, v5, v6);
}

void __70__TUConversationManagerXPCClient_leaveActivitySession_onConversation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error leaving activity: %@", v2, v3, v4, v5, v6);
}

void __68__TUConversationManagerXPCClient_endActivitySession_onConversation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error ending activity: %@", v2, v3, v4, v5, v6);
}

void __91__TUConversationManagerXPCClient_setUsingAirplay_onActivitySession_onConversationWithUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error letting CSD know airplay state for activity session: %@", v2, v3, v4, v5, v6);
}

void __89__TUConversationManagerXPCClient_presentDismissalAlertForActivitySession_onConversation___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_19C496000, v0, OS_LOG_TYPE_ERROR, "Error presenting dismissal alert for activitySession: %@ on conversation: %@", v1, 0x16u);
}

void __79__TUConversationManagerXPCClient_setActivityAuthorization_forBundleIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

void __58__TUConversationManagerXPCClient_setAutoSharePlayEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error setting auto expanse enabled with error: %@", v2, v3, v4, v5, v6);
}

void __62__TUConversationManagerXPCClient_joinConversationWithRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "joinConversationWithRequest error: %@", v2, v3, v4, v5, v6);
}

void __60__TUConversationManagerXPCClient_leaveConversationWithUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "leaveConversationWithUUID error: %@", v2, v3, v4, v5, v6);
}

void __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void __71__TUConversationManagerXPCClient_addScreenSharingType_forConversation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

void __60__TUConversationManagerXPCClient_refreshActiveConversations__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error requesting refreshActiveConversations: %@", v2, v3, v4, v5, v6);
}

void __75__TUConversationManagerXPCClient_fetchUpcomingNoticeWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error fetching upcoming notice: %@", v2, v3, v4, v5, v6);
}

void __91__TUConversationManagerXPCClient_activateConversationNoticeWithActionURL_bundleIdentifier___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_19C496000, v0, OS_LOG_TYPE_ERROR, "Error in activating notice with actionURL %@ bundleIdentifier %@", v1, 0x16u);
}

void __67__TUConversationManagerXPCClient_removeConversationNoticeWithUUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __93__TUConversationManagerXPCClient_updateConversationWithUUID_participantPresentationContexts___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error setting presentation context: %@", v2, v3, v4, v5, v6);
}

void __68__TUConversationManagerXPCClient_setSupportsMessagesGroupProviding___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error setting messages group providing support: %@", v2, v3, v4, v5, v6);
}

void __95__TUConversationManagerXPCClient_getMessagesGroupDetailsForConversationUUID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error getting messages group details: %@", v2, v3, v4, v5, v6);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error requesting initial state: %@", v2, v3, v4, v5, v6);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error requesting initial activityAuthorizedBundleIdentifiers: %@", v2, v3, v4, v5, v6);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_73_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Failed to fetch sharePlayAvailable error: %@", v2, v3, v4, v5, v6);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Failed to fetch screenSharingAvailable error: %@", v2, v3, v4, v5, v6);
}

@end