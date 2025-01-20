@interface TUConversationManager
+ (BOOL)allowsPortraitBlurWhenCaptionsEnabled;
+ (BOOL)allowsScreenSharing;
+ (BOOL)allowsScreenSharingWithVideo;
+ (BOOL)allowsVideo;
+ (BOOL)isAddPersonEnabled;
+ (BOOL)supportsConversations;
+ (BOOL)supportsEffects;
+ (id)activeRemoteParticipantsForCall:(id)a3 remoteMembers:(id)a4;
+ (id)conversationWithPseudonym:(id)a3 fromConversations:(id)a4;
+ (id)conversationWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5;
+ (id)conversationWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5 matchingVideo:(BOOL)a6 backedByGroupSession:(BOOL)a7;
+ (id)conversationWithUUID:(id)a3 fromConversations:(id)a4;
+ (id)conversationsWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5;
+ (id)pendingConversationWithLink:(id)a3 fromConversations:(id)a4;
+ (id)remoteMembersForCall:(id)a3;
+ (int64_t)conversationStateForCall:(id)a3;
+ (int64_t)memorySize;
+ (unint64_t)maximumNumberOfInvitedMembers;
- (BOOL)autoSharePlayEnabled;
- (BOOL)currentProcessCanAccessCollaborations;
- (BOOL)isScreenSharingAvailable;
- (BOOL)isSharePlayAvailable;
- (BOOL)openCollaborationWithIdentifier:(id)a3 forConversation:(id)a4;
- (BOOL)shouldCreateConversationsForCallsNotBackedByGroupSessions;
- (NSDictionary)activityAuthorizedBundleIdentifiers;
- (NSMapTable)delegateToQueue;
- (NSMutableSet)callsNotBackedByGroupSessionsPendingUpgrade;
- (NSMutableSet)conversationsNotBackedByGroupSessions;
- (NSNotificationCenter)notificationCenter;
- (NSSet)activatedConversationLinks;
- (NSSet)activeConversations;
- (NSSet)incomingPendingConversations;
- (OS_dispatch_queue)nonSessionBackedConversationCreationQueue;
- (OS_dispatch_queue)queue;
- (TUCollaborationManager)collaborationManager;
- (TUConversation)avLessConversation;
- (TUConversation)handoffEligibleConversation;
- (TUConversationManager)init;
- (TUConversationManager)initWithDataSource:(id)a3;
- (TUConversationManager)initWithDataSource:(id)a3 notificationCenter:(id)a4;
- (TUConversationManagerDataSource)dataSource;
- (TUConversationMediaController)mediaController;
- (TUConversationMessagesGroupProviding)messagesGroupProvider;
- (TUConversationReactionsController)reactionsController;
- (TUScreenSharingRemoteController)screenSharingRemoteController;
- (id)activeConversationWithGroupUUID:(id)a3;
- (id)activeConversationWithLinkForCall:(id)a3;
- (id)activeConversationWithRemoteMembers:(id)a3 andLink:(id)a4;
- (id)activeConversationWithRemoteMembers:(id)a3 andLink:(id)a4 matchingVideo:(BOOL)a5 backedByGroupSession:(BOOL)a6;
- (id)activeConversationWithUUID:(id)a3;
- (id)callPendingUpgradeInConversationsWithGroupUUID:(id)a3;
- (id)ckBundleIDForCollaborationIdentifier:(id)a3;
- (id)collaborationForConversation:(id)a3;
- (id)createConversationForCallNotBackedByGroupSession:(id)a3;
- (id)handoffEligibleConversationForEligibility:(id)a3;
- (id)joinRequestForApplicableConversationWithHandoffEligibility:(id)a3;
- (id)overriddenCallForGroupUUID;
- (id)pendingConversationWithLink:(id)a3;
- (int64_t)collaborationStateForConversation:(id)a3;
- (unint64_t)nonSessionBackedConversationCreationMode;
- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4;
- (void)activateLink:(id)a3 completionHandler:(id)a4;
- (void)activeParticipant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7;
- (void)activeParticipant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5;
- (void)activityAuthorizationsChangedForDataSource:(id)a3 oldActivityAuthorizedBundleIdentifiers:(id)a4;
- (void)addCollaboration:(id)a3 forConversation:(id)a4;
- (void)addCollaborationDictionary:(id)a3 forConversation:(id)a4 fromMe:(BOOL)a5;
- (void)addCollaborationIdentifier:(id)a3 forConversation:(id)a4;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4;
- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5;
- (void)addRemoteMembers:(id)a3 toConversation:(id)a4;
- (void)addScreenSharingType:(unint64_t)a3 forConversation:(id)a4;
- (void)addedCollaborationDictionary:(id)a3 forConversation:(id)a4;
- (void)approvePendingMember:(id)a3 forConversation:(id)a4;
- (void)buzzMember:(id)a3 conversation:(id)a4;
- (void)callPropertiesChanged:(id)a3;
- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversation:(id)a4;
- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4;
- (void)collaborationChanged:(id)a3 forConversation:(id)a4 collaborationState:(int64_t)a5;
- (void)conversation:(id)a3 addedMembersLocally:(id)a4;
- (void)conversation:(id)a3 buzzedMember:(id)a4;
- (void)conversation:(id)a3 collaborationStateChanged:(int64_t)a4 highlightIdentifier:(id)a5;
- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4;
- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4;
- (void)conversation:(id)a3 participant:(id)a4 addedCollaborationNotice:(id)a5;
- (void)conversation:(id)a3 participant:(id)a4 addedNotice:(id)a5;
- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4;
- (void)conversation:(id)a3 screenSharingChangedForParticipant:(id)a4;
- (void)conversationManagerDataSource:(id)a3 conversation:(id)a4 appLaunchState:(unint64_t)a5 forActivitySession:(id)a6;
- (void)conversationManagerDataSource:(id)a3 didChangeActivatedConversationLinks:(id)a4;
- (void)conversationManagerDataSource:(id)a3 messagesGroupDetailsForMessagesGroupId:(id)a4 completionHandler:(id)a5;
- (void)conversationUpdateMessagesGroupPhoto:(id)a3;
- (void)conversationUpdatedMessagesGroupPhoto:(id)a3;
- (void)conversationsChangedForDataSource:(id)a3 conversationsByGroupUUID:(id)a4 oldConversationsByGroupUUID:(id)a5;
- (void)conversationsChangedForDataSource:(id)a3 oldConversationsByGroupUUID:(id)a4 newConversationsByGroupUUID:(id)a5 creationQueue:(id)a6;
- (void)conversationsChangedForDataSource:(id)a3 updatedIncomingPendingConversationsByGroupUUID:(id)a4;
- (void)conversationsChangedFromOldConversationsByGroupUUID:(id)a3 newConversationsByGroupUUID:(id)a4;
- (void)createActivitySession:(id)a3 onConversation:(id)a4;
- (void)dealloc;
- (void)endActivitySession:(id)a3 onConversation:(id)a4;
- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3;
- (void)generateLinkForConversation:(id)a3 completionHandler:(id)a4;
- (void)generateLinkWithInvitedMemberHandles:(id)a3 completionHandler:(id)a4;
- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5;
- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4;
- (void)getInactiveLinkWithCompletionHandler:(id)a3;
- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3;
- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4;
- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5;
- (void)invalidateLink:(id)a3 completionHandler:(id)a4;
- (void)joinConversationWithRequest:(id)a3;
- (void)kickMember:(id)a3 conversation:(id)a4;
- (void)launchApplicationForActivitySession:(id)a3 authorizedExternally:(BOOL)a4 completionHandler:(id)a5;
- (void)launchApplicationForActivitySession:(id)a3 completionHandler:(id)a4;
- (void)launchApplicationForActivitySessionUUID:(id)a3 completionHandler:(id)a4;
- (void)launchApplicationForActivitySessionUUID:(id)a3 forceBackground:(BOOL)a4 completionHandler:(id)a5;
- (void)leaveActivitySession:(id)a3 onConversation:(id)a4;
- (void)leaveConversationWithUUID:(id)a3;
- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4;
- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4;
- (void)presentDismissalAlertForActivitySession:(id)a3 onConversation:(id)a4;
- (void)pruneConversationsPendingUpgradeInConversationsWithGroupUUID:(id)a3;
- (void)receivedTrackedPendingMember:(id)a3 forConversationLink:(id)a4;
- (void)refreshActiveConversations;
- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3;
- (void)registerWithCompletionHandler:(id)a3;
- (void)rejectPendingMember:(id)a3 forConversation:(id)a4;
- (void)remoteScreenShareAttributesChanged:(id)a3 isLocallySharing:(BOOL)a4;
- (void)remoteScreenShareEndedWithReason:(id)a3;
- (void)removeCollaborationIdentifier:(id)a3 forConversation:(id)a4;
- (void)removeConversationNoticeWithUUID:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6;
- (void)requestParticipantToShareScreen:(id)a3 forConversation:(id)a4;
- (void)requestScreenShareFromMember:(id)a3 conversation:(id)a4;
- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3;
- (void)screenSharingAvailableChanged:(BOOL)a3;
- (void)serverDisconnectedForDataSource:(id)a3 oldConversationsByGroupUUID:(id)a4;
- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4;
- (void)setAutoSharePlayEnabled:(BOOL)a3;
- (void)setCallsNotBackedByGroupSessionsPendingUpgrade:(id)a3;
- (void)setCollaborationManager:(id)a3;
- (void)setConversationsNotBackedByGroupSessions:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversation:(id)a4;
- (void)setGridDisplayMode:(unint64_t)a3 conversation:(id)a4;
- (void)setIgnoreLMIRequests:(BOOL)a3 forConversation:(id)a4;
- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)setMessagesGroupProvider:(id)a3;
- (void)setNonSessionBackedConversationCreationMode:(unint64_t)a3;
- (void)setNonSessionBackedConversationCreationQueue:(id)a3;
- (void)setOverriddenCallForGroupUUID:(id)a3;
- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5;
- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4;
- (void)setShouldCreateConversationsForCallsNotBackedByGroupSessions:(BOOL)a3;
- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversation:(id)a5;
- (void)sharePlayAvailableChanged:(BOOL)a3;
- (void)startTrackingCollaboration:(id)a3 forConversation:(id)a4 completionHandler:(id)a5;
- (void)updateConversationsNotBackedByGroupSessionWithCall:(id)a3;
- (void)updateConversationsNotBackedByGroupSessionWithCall:(id)a3 conversationsByGroupUUID:(id)a4 creationQueue:(id)a5;
- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)updateMessagesGroupName:(id)a3 onConversation:(id)a4;
- (void)updateURLWithDugongTokenIfNeeded:(id)a3 collaboration:(id)a4 handle:(id)a5 completion:(id)a6;
@end

@implementation TUConversationManager

- (NSSet)activeConversations
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(TUConversationManager *)self dataSource];
  v5 = [v4 conversationsByGroupUUID];
  v6 = [v5 allValues];
  v7 = [v3 setWithArray:v6];
  v8 = [(TUConversationManager *)self conversationsNotBackedByGroupSessions];
  v9 = [v7 setByAddingObjectsFromSet:v8];

  return (NSSet *)v9;
}

- (TUConversationManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableSet)conversationsNotBackedByGroupSessions
{
  return self->_conversationsNotBackedByGroupSessions;
}

uint64_t __62__TUConversationManager_currentProcessCanAccessCollaborations__block_invoke()
{
  uint64_t result = TUCurrentProcessHasEntitlementCapability(@"access-collaboration");
  currentProcessCanAccessCollaborations_isCurrentProcessEntitled = result;
  return result;
}

- (TUConversationManager)init
{
  v3 = objc_alloc_init(TUConversationManagerXPCClient);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v5 = [(TUConversationManager *)self initWithDataSource:v3 notificationCenter:v4];

  return v5;
}

- (TUConversationManager)initWithDataSource:(id)a3 notificationCenter:(id)a4
{
  v43[8] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)TUConversationManager;
  v9 = [(TUConversationManager *)&v41 init];
  if (v9)
  {
    id v35 = v7;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.telephonyutilities.conversationmanager", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_dataSource, a3);
    [(TUConversationManagerDataSource *)v9->_dataSource setDelegate:v9];
    objc_storeStrong((id *)&v9->_notificationCenter, a4);
    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v9->_delegateToQueue;
    v9->_delegateToQueue = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    conversationsNotBackedByGroupSessions = v9->_conversationsNotBackedByGroupSessions;
    v9->_conversationsNotBackedByGroupSessions = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    callsNotBackedByGroupSessionsPendingUpgrade = v9->_callsNotBackedByGroupSessionsPendingUpgrade;
    v9->_callsNotBackedByGroupSessionsPendingUpgrade = (NSMutableSet *)v16;

    BOOL v18 = [(TUConversationManager *)v9 currentProcessCanAccessCollaborations];
    v19 = TUDefaultLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "Creating collaboration manager for current process", buf, 2u);
      }

      v21 = [TUCollaborationManager alloc];
      v22 = objc_alloc_init(TUCollaborationHighlightProvider);
      uint64_t v23 = [(TUCollaborationManager *)v21 initWithCollaborationProvider:v22];
      collaborationManager = v9->_collaborationManager;
      v9->_collaborationManager = (TUCollaborationManager *)v23;

      v25 = [(TUConversationManager *)v9 collaborationManager];
      [v25 setDelegate:v9];

      v19 = [(TUConversationManager *)v9 collaborationManager];
      v26 = [(TUConversationManager *)v9 queue];
      [(TUConversationManager *)v9 addDelegate:v19 queue:v26];
    }
    else if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "Current process is not entitled to access collaborations on the call- not initializing the collaboration manager", buf, 2u);
    }

    v43[0] = @"TUCallCenterCallStatusChangedNotification";
    v43[1] = @"TUCallCenterVideoCallStatusChangedNotification";
    v43[2] = @"TUCallVideoStreamTokenChangedNotification";
    v43[3] = @"TUCallProviderContextChangedNotification";
    v43[4] = @"TUCallConversationChangedNotification";
    v43[5] = @"TUCallCenterCallStartedConnectingNotification";
    v43[6] = @"TUCallCenterCallConnectedNotification";
    v43[7] = @"TUCallDowngradedToAudioNotification";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:8];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v33 = [(TUConversationManager *)v9 notificationCenter];
          [v33 addObserver:v9 selector:sel_callPropertiesChanged_ name:v32 object:0];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v29);
    }

    id v7 = v35;
  }

  return v9;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)currentProcessCanAccessCollaborations
{
  if (currentProcessCanAccessCollaborations_onceToken != -1) {
    dispatch_once(&currentProcessCanAccessCollaborations_onceToken, &__block_literal_global_319);
  }
  return currentProcessCanAccessCollaborations_isCurrentProcessEntitled;
}

void __43__TUConversationManager_addDelegate_queue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

+ (BOOL)supportsConversations
{
  id v2 = [(id)CUTWeakLinkClass() sharedInstance];
  if ([v2 multiwaySupported]) {
    int v3 = [v2 isGreenTea] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TUConversationManager_addDelegate_queue___block_invoke;
  block[3] = &unk_1E58E6258;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)refreshActiveConversations
{
  int v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Asked to refreshActiveConversations", v5, 2u);
  }

  v4 = [(TUConversationManager *)self dataSource];
  [v4 refreshActiveConversations];
}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to retrieve all active links", v9, 2u);
  }

  id v8 = [(TUConversationManager *)self dataSource];
  [v8 getActiveLinksWithCreatedOnly:v4 completionHandler:v6];
}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  id v6 = [(TUConversationManager *)self dataSource];
  [v6 registerWithCompletionHandler:v4];
}

- (TUConversationManager)initWithDataSource:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  id v7 = [(TUConversationManager *)self initWithDataSource:v5 notificationCenter:v6];

  return v7;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(TUConversationManagerDataSource *)self->_dataSource invalidate];
  v4.receiver = self;
  v4.super_class = (Class)TUConversationManager;
  [(TUConversationManager *)&v4 dealloc];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__TUConversationManager_removeDelegate___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__TUConversationManager_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (NSSet)incomingPendingConversations
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  int v3 = [(TUConversationManager *)self dataSource];
  id v4 = [v3 incomingPendingConversationsByGroupUUID];
  id v5 = [v4 allValues];
  id v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

- (NSSet)activatedConversationLinks
{
  id v2 = [(TUConversationManager *)self dataSource];
  int v3 = [v2 activatedConversationLinks];

  return (NSSet *)v3;
}

- (NSDictionary)activityAuthorizedBundleIdentifiers
{
  id v2 = [(TUConversationManager *)self dataSource];
  int v3 = [v2 activityAuthorizedBundleIdentifiers];

  return (NSDictionary *)v3;
}

- (BOOL)autoSharePlayEnabled
{
  id v2 = [(TUConversationManager *)self dataSource];
  char v3 = [v2 autoSharePlayEnabled];

  return v3;
}

- (BOOL)isSharePlayAvailable
{
  id v2 = [(TUConversationManager *)self dataSource];
  char v3 = [v2 isSharePlayAvailable];

  return v3;
}

- (BOOL)isScreenSharingAvailable
{
  id v2 = [(TUConversationManager *)self dataSource];
  char v3 = [v2 isScreenSharingAvailable];

  return v3;
}

- (id)activeConversationWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(TUConversationManager *)self activeConversations];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 UUID];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)activeConversationWithGroupUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUConversationManager *)self dataSource];
  id v6 = [v5 conversationsByGroupUUID];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = [(TUConversationManager *)self conversationsNotBackedByGroupSessions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v7 = 0;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = [v13 groupUUID];
          int v15 = [v14 isEqual:v4];

          if (v15)
          {
            id v16 = v13;

            uint64_t v7 = v16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)activeConversationWithRemoteMembers:(id)a3 andLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  uint64_t v9 = [(TUConversationManager *)self activeConversations];
  uint64_t v10 = [v8 conversationWithRemoteMembers:v7 andLink:v6 fromConversations:v9];

  return v10;
}

- (id)activeConversationWithRemoteMembers:(id)a3 andLink:(id)a4 matchingVideo:(BOOL)a5 backedByGroupSession:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_opt_class();
  long long v13 = [(TUConversationManager *)self activeConversations];
  long long v14 = [v12 conversationWithRemoteMembers:v11 andLink:v10 fromConversations:v13 matchingVideo:v7 backedByGroupSession:v6];

  return v14;
}

- (id)activeConversationWithLinkForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManager *)self dataSource];
  BOOL v6 = [v5 pseudonymsByCallUUID];
  BOOL v7 = [v4 uniqueProxyIdentifierUUID];

  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [(TUConversationManager *)self activeConversations];
    id v11 = [v9 conversationWithPseudonym:v8 fromConversations:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)pendingConversationWithLink:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  BOOL v6 = [(TUConversationManager *)self activeConversations];
  BOOL v7 = [v5 pendingConversationWithLink:v4 fromConversations:v6];

  return v7;
}

+ (id)conversationWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5
{
  id v5 = [a1 conversationsWithRemoteMembers:a3 andLink:a4 fromConversations:a5];
  BOOL v6 = [v5 anyObject];

  return v6;
}

+ (id)conversationWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5 matchingVideo:(BOOL)a6 backedByGroupSession:(BOOL)a7
{
  int v7 = a7;
  int v8 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = objc_msgSend((id)objc_opt_class(), "conversationsWithRemoteMembers:andLink:fromConversations:", v11, v12, v13, 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v19 isVideo] == v8
          && [v19 isBackedByGroupSession] == v7)
        {
          id v20 = v19;
          goto LABEL_12;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  id v20 = 0;
LABEL_12:

  return v20;
}

+ (id)conversationsWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v16, "isRepresentedByRemoteMembers:andLink:", v7, v8, (void)v18)) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (id)conversationWithPseudonym:(id)a3 fromConversations:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "link", (void)v17);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [v10 link];
          uint64_t v14 = [v13 pseudonym];
          int v15 = [v14 isEqualToString:v5];

          if (v15)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

+ (id)pendingConversationWithLink:(id)a3 fromConversations:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      uint64_t v13 = [v12 link];
      if ([v13 isEquivalentToConversationLink:v5])
      {
        uint64_t v14 = [v12 letMeInRequestState];

        if (!v14) {
          continue;
        }
        uint64_t v13 = v9;
        id v9 = v12;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v8);
LABEL_14:

  return v9;
}

+ (id)remoteMembersForCall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = [v3 remoteParticipantHandles];
  id v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = objc_msgSend(v3, "remoteParticipantHandles", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [[TUConversationMember alloc] initWithHandle:*(void *)(*((void *)&v14 + 1) + 8 * i) nickname:0];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)setShouldCreateConversationsForCallsNotBackedByGroupSessions:(BOOL)a3
{
  self->_shouldCreateConversationsForCallsNotBackedByGroupSessions = a3;
  [(TUConversationManager *)self setNonSessionBackedConversationCreationMode:a3];
}

- (TUConversationMediaController)mediaController
{
  mediaController = self->_mediaController;
  if (!mediaController)
  {
    id v4 = [TUConversationMediaController alloc];
    id v5 = [(TUConversationManager *)self dataSource];
    id v6 = [(TUConversationMediaController *)v4 initWithConversationDataSource:v5];
    uint64_t v7 = self->_mediaController;
    self->_mediaController = v6;

    mediaController = self->_mediaController;
  }

  return mediaController;
}

- (TUConversationReactionsController)reactionsController
{
  reactionsController = self->_reactionsController;
  if (!reactionsController)
  {
    id v4 = [TUConversationReactionsController alloc];
    id v5 = [(TUConversationManager *)self dataSource];
    id v6 = [(TUConversationReactionsController *)v4 initWithConversationDataSource:v5];
    uint64_t v7 = self->_reactionsController;
    self->_reactionsController = v6;

    reactionsController = self->_reactionsController;
  }

  return reactionsController;
}

- (TUScreenSharingRemoteController)screenSharingRemoteController
{
  return 0;
}

- (void)addRemoteMembers:(id)a3 toConversation:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 set];
  [(TUConversationManager *)self addRemoteMembers:v8 otherInvitedHandles:v9 toConversation:v7];
}

- (void)updateMessagesGroupName:(id)a3 onConversation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to set new messages group name: %@ on conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 updateMessagesGroupName:v6 onConversation:v7];
}

- (void)setGridDisplayMode:(unint64_t)a3 conversation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    unint64_t v10 = a3;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set grid display mode to: %lu on conversation: %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [(TUConversationManager *)self dataSource];
  [v8 setGridDisplayMode:a3 conversation:v6];
}

- (void)conversationUpdateMessagesGroupPhoto:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to update messages group photo on conversation: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(TUConversationManager *)self dataSource];
  [v6 conversationUpdateMessagesGroupPhoto:v4];
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Asked to add remote members: %@ otherInvitedHandles: %@ to conversation: %@", (uint8_t *)&v13, 0x20u);
  }

  id v12 = [(TUConversationManager *)self dataSource];
  [v12 addRemoteMembers:v8 otherInvitedHandles:v9 toConversation:v10];
}

- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to prepare conversation with UUID: %@ with hand off context: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 prepareConversationWithUUID:v6 withHandoffContext:v7];
}

- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set handed off: %d on conversation with UUID: %@", (uint8_t *)v9, 0x12u);
  }

  id v8 = [(TUConversationManager *)self dataSource];
  [v8 setSharePlayHandedOff:v4 onConversationWithUUID:v6];
}

- (void)createActivitySession:(id)a3 onConversation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to add activity: %@ to conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 createActivitySession:v6 onConversation:v7];
}

- (void)leaveActivitySession:(id)a3 onConversation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to leave activitySession: %@ to conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 leaveActivitySession:v6 onConversation:v7];
}

- (void)endActivitySession:(id)a3 onConversation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to end activitySession: %@ to conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 endActivitySession:v6 onConversation:v7];
}

- (void)presentDismissalAlertForActivitySession:(id)a3 onConversation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to present dismissal alert for activitySession: %@ on conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 presentDismissalAlertForActivitySession:v6 onConversation:v7];
}

- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set activity authorization to: %d for bundle identifier %@", (uint8_t *)v9, 0x12u);
  }

  id v8 = [(TUConversationManager *)self dataSource];
  [v8 setActivityAuthorization:v4 forBundleIdentifier:v6];
}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Client request to set auto expanse enabled to %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(TUConversationManager *)self dataSource];
  [v7 setAutoSharePlayEnabled:v3];
}

- (void)joinConversationWithRequest:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "joinConversationWithRequest %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(TUConversationManager *)self dataSource];
  [v6 joinConversationWithRequest:v4];
}

- (void)leaveConversationWithUUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "leaveConversationWithUUID %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(TUConversationManager *)self dataSource];
  [v6 leaveConversationWithUUID:v4];
}

- (void)launchApplicationForActivitySession:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to launch application for activitySession %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = [(TUConversationManager *)self dataSource];
  uint64_t v10 = [v6 UUID];
  [v9 launchApplicationForActivitySessionUUID:v10 authorizedExternally:0 forceBackground:0 completionHandler:v7];
}

- (void)launchApplicationForActivitySession:(id)a3 authorizedExternally:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = @"NO";
    if (v6) {
      int v11 = @"YES";
    }
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Asked to launch application for activitySession %@ and authorized externally %@", (uint8_t *)&v14, 0x16u);
  }

  id v12 = [(TUConversationManager *)self dataSource];
  uint64_t v13 = [v8 UUID];
  [v12 launchApplicationForActivitySessionUUID:v13 authorizedExternally:v6 forceBackground:0 completionHandler:v9];
}

- (void)launchApplicationForActivitySessionUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to launch application for activitySession UUID %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 launchApplicationForActivitySessionUUID:v6 authorizedExternally:0 forceBackground:0 completionHandler:v7];
}

- (void)launchApplicationForActivitySessionUUID:(id)a3 forceBackground:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v6) {
      id v11 = @"YES";
    }
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    __int16 v16 = v11;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Asked to launch application for activitySession UUID %@ and override to background %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v12 = [(TUConversationManager *)self dataSource];
  [v12 launchApplicationForActivitySessionUUID:v8 authorizedExternally:0 forceBackground:v6 completionHandler:v9];
}

- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversation:(id)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v6) {
      id v11 = @"YES";
    }
    int v14 = 138412546;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Notified of airplay state: %@ for activity session %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v12 = [(TUConversationManager *)self dataSource];
  int v13 = [v9 UUID];

  [v12 setUsingAirplay:v6 onActivitySession:v8 onConversationWithUUID:v13];
}

- (void)buzzMember:(id)a3 conversation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to buzz member: %@ conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 buzzMember:v6 conversation:v7];
}

- (void)requestScreenShareFromMember:(id)a3 conversation:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"TUConversationManager.m" lineNumber:482 description:@"requestScreenShareFromMembers is deprecated and should not be used"];
}

- (void)kickMember:(id)a3 conversation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to kick member: %@ conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 kickMember:v6 conversation:v7];
}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversation:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set downlink muted to: (%d) for remote participants in conversation: %@", (uint8_t *)v9, 0x12u);
  }

  id v8 = [(TUConversationManager *)self dataSource];
  [v8 setDownlinkMuted:v4 forRemoteParticipantsInConversation:v6];
}

- (void)addScreenSharingType:(unint64_t)a3 forConversation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    unint64_t v10 = a3;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set screen sharing type to: (%ld) for conversation: %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [(TUConversationManager *)self dataSource];
  [v8 addScreenSharingType:a3 forConversation:v6];
}

- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to get the latest remote screen share attributes", v7, 2u);
  }

  id v6 = [(TUConversationManager *)self dataSource];
  [v6 getLatestRemoteScreenShareAttributesWithCompletionHandler:v4];
}

- (void)addCollaborationDictionary:(id)a3 forConversation:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (__CFString *)a4;
  if (v8)
  {
    unint64_t v10 = [v8 objectForKeyedSubscript:@"ci"];
    __int16 v11 = [v8 objectForKeyedSubscript:@"ru"];
    id v12 = TUDefaultLog();
    uint64_t v13 = v12;
    if (v10) {
      BOOL v14 = v11 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = [(__CFString *)v9 UUID];
        int v19 = 138413058;
        id v20 = v8;
        __int16 v21 = 2112;
        uint64_t v22 = v15;
        __int16 v23 = 2112;
        long long v24 = @"ci";
        __int16 v25 = 2112;
        v26 = @"ru";
        _os_log_error_impl(&dword_19C496000, v13, OS_LOG_TYPE_ERROR, "Cannot add collaboration dictionary %@ to conversation with UUID %@ because it is missing required keys %@ and/or %@", (uint8_t *)&v19, 0x2Au);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = @"NO";
        int v19 = 138412802;
        id v20 = v8;
        __int16 v21 = 2112;
        if (v5) {
          id v17 = @"YES";
        }
        uint64_t v22 = v17;
        __int16 v23 = 2112;
        long long v24 = v9;
        _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "Asked to add collaboration dictionary %@ (from me %@) to conversation: %@", (uint8_t *)&v19, 0x20u);
      }

      uint64_t v13 = [(TUConversationManager *)self dataSource];
      uint64_t v18 = [(__CFString *)v9 UUID];
      [v13 addCollaborationDictionary:v8 forConversationWithUUID:v18 fromMe:v5];
    }
  }
  else
  {
    unint64_t v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TUConversationManager addCollaborationDictionary:forConversation:fromMe:](v9);
    }
  }
}

- (id)ckBundleIDForCollaborationIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationManager *)self collaborationManager];
  id v6 = [v5 collaborationProvider];
  id v7 = [v6 ckBundleIDForCollaborationIdentifier:v4];

  return v7;
}

- (void)addCollaborationIdentifier:(id)a3 forConversation:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  int v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Asked to set collaboration identifier: %@ for conversation: %@", (uint8_t *)&v15, 0x16u);
    }

    unint64_t v10 = [(TUConversationManager *)self collaborationManager];
    __int16 v11 = [v10 collaborationProvider];
    int v9 = [v11 collaborationHighlightForIdentifier:v6];

    id v12 = TUDefaultLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Found collaboration -Adding collaboration identifier: %@ for conversation: %@", (uint8_t *)&v15, 0x16u);
      }

      [(TUConversationManager *)self addCollaboration:v9 forConversation:v7];
    }
    else
    {
      if (v13)
      {
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Not adding collaboration identifier: %@ to conversation: %@, could not find corresponding collaboration. Adding to pending collaborations", (uint8_t *)&v15, 0x16u);
      }

      BOOL v14 = [(TUConversationManager *)self collaborationManager];
      [v14 queueCollaborationIdentifierForCollaboration:v6 toConversation:v7];
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[TUConversationManager addCollaborationIdentifier:forConversation:](v7);
  }
}

- (void)addCollaboration:(id)a3 forConversation:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 collaborationIdentifier];

  int v9 = TUDefaultLog();
  unint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [v6 collaborationIdentifier];
      int v22 = 138412546;
      __int16 v23 = v11;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Asked to add collaboration: %@ for conversation: %@", (uint8_t *)&v22, 0x16u);
    }
    id v12 = [v6 attributions];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      BOOL v14 = [v6 attributions];
      int v15 = [v14 firstObject];
      id v16 = [v15 collaborationMetadata];
      unint64_t v10 = [v16 ckAppBundleIDs];
    }
    else
    {
      unint64_t v10 = 0;
    }
    __int16 v17 = [(TUConversationManager *)self dataSource];
    id v18 = [v6 collaborationIdentifier];
    uint64_t v19 = [v6 URL];
    id v20 = [v19 description];
    __int16 v21 = [v7 UUID];
    [v17 addCollaborationIdentifier:v18 collaborationURL:v20 cloudKitAppBundleIDs:v10 forConversationUUID:v21];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[TUConversationManager addCollaboration:forConversation:]((uint64_t)v6, v7);
  }
}

- (void)startTrackingCollaboration:(id)a3 forConversation:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 collaborationIdentifier];
    int v24 = 138412546;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Asked to set collaboration identifier: %@ for conversation: %@", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v13 = [v8 attributions];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    int v15 = [v8 attributions];
    id v16 = [v15 firstObject];
    __int16 v17 = [v16 collaborationMetadata];
    id v18 = [v17 ckAppBundleIDs];
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v19 = [(TUConversationManager *)self dataSource];
  id v20 = [v8 collaborationIdentifier];
  __int16 v21 = [v8 URL];
  int v22 = [v21 description];
  __int16 v23 = [v9 UUID];
  [v19 startTrackingCollaborationWithIdentifier:v20 collaborationURL:v22 cloudKitAppBundleIDs:v18 forConversationUUID:v23 completionHandler:v10];
}

- (void)removeCollaborationIdentifier:(id)a3 forConversation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Asked to remove collaboration identifier: %@ for conversation: %@", (uint8_t *)&v11, 0x16u);
    }

    id v9 = [(TUConversationManager *)self dataSource];
    id v10 = [v7 UUID];
    [v9 removeCollaborationIdentifier:v6 forConversationUUID:v10];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[TUConversationManager removeCollaborationIdentifier:forConversation:](v7);
  }
}

- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Checking disclosure of collaboration initiator %@ for conversation UUID %@", (uint8_t *)&v13, 0x16u);
  }

  id v12 = [(TUConversationManager *)self dataSource];
  [v12 getNeedsDisclosureOfCollaborationInitiator:v8 forConversationUUID:v9 completionHandler:v10];
}

- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Adding disclosed collaboration initiator %@ to conversation UUID %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 addDisclosedCollaborationInitiator:v6 toConversationUUID:v7];
}

- (void)updateURLWithDugongTokenIfNeeded:(id)a3 collaboration:(id)a4 handle:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 attributions];
  __int16 v15 = [v14 firstObject];
  id v16 = [v15 uniqueIdentifier];

  uint64_t v17 = TUDefaultLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "Asked to update collaboration URL %@ with Dugong token for handle %@, if needed", buf, 0x16u);
    }

    uint64_t v19 = [(TUConversationManager *)self queue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__TUConversationManager_updateURLWithDugongTokenIfNeeded_collaboration_handle_completion___block_invoke;
    v27[3] = &unk_1E58E7C70;
    id v28 = v16;
    id v31 = v13;
    id v29 = v10;
    id v30 = v12;
    id v20 = v28;
    id v21 = v19;
    int v22 = v27;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    __int16 v23 = (void (*)(id, uint64_t, id, void *))getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_ptr;
    id v35 = getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_ptr;
    if (!getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_block_invoke;
      long long v37 = &unk_1E58E5F90;
      long long v38 = &v32;
      __getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_block_invoke((uint64_t)buf);
      __int16 v23 = (void (*)(id, uint64_t, id, void *))v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v23) {
      -[TUConversationManager updateURLWithDugongTokenIfNeeded:collaboration:handle:completion:]();
    }
    v23(v20, 33, v21, v22);
  }
  else
  {
    if (v18)
    {
      int v24 = [v11 attributions];
      id v25 = [v24 firstObject];
      __int16 v26 = [v25 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v26;
      _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "Returning collaboration URL without Dugong token because no messageGUID was found in collaboration's attribution: %@", buf, 0xCu);
    }
    (*((void (**)(id, id))v13 + 2))(v13, v10);
  }
}

void __90__TUConversationManager_updateURLWithDugongTokenIfNeeded_collaboration_handle_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 138412546;
    id v39 = v3;
    __int16 v40 = 2112;
    uint64_t v41 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Retrieved messages for queried GUID %@ to populate Dugong tokens: %@", buf, 0x16u);
  }

  id v6 = [v3 firstObject];
  id v7 = [v6 richLinkMetadata];

  if (v7)
  {
    id v8 = [v7 specialization];
    id v9 = [v8 specialization];

    if (v9)
    {
      if (objc_opt_respondsToSelector())
      {
        id v10 = [v9 encodedTokens];
        if (v10)
        {
          id v11 = v10;
          id v12 = [v10 objectForKey:a1[6]];
          if (v12)
          {
            id v13 = [MEMORY[0x1E4F29088] componentsWithURL:a1[5] resolvingAgainstBaseURL:0];
            id v14 = objc_alloc_init(MEMORY[0x1E4F29088]);
            __int16 v15 = [v13 scheme];
            [v14 setScheme:v15];

            id v16 = [v13 host];
            [v14 setHost:v16];

            uint64_t v17 = [v13 path];
            [v14 setPath:v17];

            long long v36 = v13;
            BOOL v18 = [v13 fragment];
            [v14 setFragment:v18];

            uint64_t v19 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
            id v20 = (void *)[v19 mutableCopy];

            [v20 removeCharactersInString:@"+=/"];
            uint64_t v21 = [@"token" stringByAddingPercentEncodingWithAllowedCharacters:v20];
            long long v37 = v12;
            uint64_t v34 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
            v33 = [v34 base64EncodedStringWithOptions:0];
            uint64_t v32 = [v33 stringByAddingPercentEncodingWithAllowedCharacters:v20];
            id v35 = (void *)v21;
            int v22 = [NSString stringWithFormat:@"%@=%@", v21, v32];
            [v14 setQuery:v22];
            __int16 v23 = [v14 URL];
            int v24 = TUDefaultLog();
            id v25 = v24;
            if (v23)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v39 = v23;
                _os_log_impl(&dword_19C496000, v25, OS_LOG_TYPE_DEFAULT, "Sucessfully amended collaboration URL with Dugong token %@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              __90__TUConversationManager_updateURLWithDugongTokenIfNeeded_collaboration_handle_completion___block_invoke_cold_1();
            }

            (*(void (**)(void))(a1[7] + 16))();
            id v12 = v37;
          }
          else
          {
            id v30 = TUDefaultLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              id v31 = (void *)a1[6];
              *(_DWORD *)buf = 138412290;
              id v39 = v31;
              _os_log_impl(&dword_19C496000, v30, OS_LOG_TYPE_DEFAULT, "Returning collaboration URL without Dugong token because could not lookup token for handle %@", buf, 0xCu);
            }

            (*(void (**)(void))(a1[7] + 16))();
          }

          goto LABEL_21;
        }
      }
      id v28 = TUDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v9;
        id v29 = "[WARN] Returning collaboration URL without Dugong token because encodedTokens was nil for specialization %@";
LABEL_19:
        _os_log_impl(&dword_19C496000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
      }
    }
    else
    {
      id v28 = TUDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v7;
        id v29 = "[WARN] Returning collaboration URL without Dugong token because specialization was nil for the richLinkMetadata %@";
        goto LABEL_19;
      }
    }

    (*(void (**)(void))(a1[7] + 16))();
LABEL_21:

    goto LABEL_22;
  }
  __int16 v26 = TUDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v3 firstObject];
    *(_DWORD *)buf = 138412290;
    id v39 = v27;
    _os_log_impl(&dword_19C496000, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Returning collaboration URL without Dugong token because richLinkMetadata was nil from the message %@", buf, 0xCu);
  }
  (*(void (**)(void))(a1[7] + 16))();
LABEL_22:
}

- (BOOL)openCollaborationWithIdentifier:(id)a3 forConversation:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to open collaboration identifier: %@", buf, 0xCu);
  }

  id v9 = [(TUConversationManager *)self collaborationManager];
  id v10 = [v9 collaborationProvider];
  id v11 = [v10 collaborationHighlightForIdentifier:v6];

  if (v11)
  {
    objc_initWeak((id *)buf, self);
    id v12 = [v11 URL];
    id v13 = [v7 localMember];
    id v14 = [v13 handle];
    __int16 v15 = [v14 normalizedValue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke;
    v18[3] = &unk_1E58E7CC0;
    objc_copyWeak(&v22, (id *)buf);
    id v19 = v6;
    id v20 = v7;
    id v21 = v11;
    [(TUConversationManager *)self updateURLWithDugongTokenIfNeeded:v12 collaboration:v21 handle:v15 completion:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v16 = TUDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TUConversationManager openCollaborationWithIdentifier:forConversation:]();
    }
  }
  return v11 != 0;
}

void __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke_2;
  v4[3] = &unk_1E58E7C98;
  objc_copyWeak(&v8, a1 + 7);
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  TUOpenURLWithCompletion(v3, v4);

  objc_destroyWeak(&v8);
}

void __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      id v7 = TUDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke_2_cold_1(a1);
      }
    }
    else
    {
      id v7 = [WeakRetained dataSource];
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) UUID];
      [v7 markCollaborationWithIdentifierOpened:v8 forConversationUUID:v9];
    }
  }
}

- (void)generateLinkForConversation:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to generate link for conversation: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 generateLinkForConversation:v6 completionHandler:v7];
}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 completionHandler:(id)a4
{
}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2048;
    int64_t v18 = a4;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Asked to generate link in advance of conversation with invited member handles: %@, linkLifetimeScope: %ld", buf, 0x16u);
  }

  id v11 = [(TUConversationManager *)self dataSource];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke;
  v13[3] = &unk_1E58E7CE8;
  id v14 = v9;
  id v12 = v9;
  [v11 generateLinkWithInvitedMemberHandles:v8 linkLifetimeScope:a4 completionHandler:v13];
}

void __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke_cold_2();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
    v8();
    goto LABEL_10;
  }
  id v9 = TUDefaultLog();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Link generation succeeded with link %@", (uint8_t *)&v13, 0xCu);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke_cold_1(v10);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.telephonyutilities.callservicesd" code:1 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);

LABEL_10:
}

- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Asked to add invited member handles %@ to link %@", (uint8_t *)&v13, 0x16u);
  }

  id v12 = [(TUConversationManager *)self dataSource];
  [v12 addInvitedMemberHandles:v8 toConversationLink:v9 completionHandler:v10];
}

- (void)invalidateLink:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Invalidate link: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 invalidateLink:v6 deleteReason:2 completionHandler:v7];
}

- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = TUDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2048;
    unint64_t v20 = a5;
    _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "Asked to renew link %@ to new expiration date %@ with reason %lu", (uint8_t *)&v15, 0x20u);
  }

  id v14 = [(TUConversationManager *)self dataSource];
  [v14 renewLink:v10 expirationDate:v11 reason:a5 completionHandler:v12];
}

- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to check validity for link: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 checkLinkValidity:v6 completionHandler:v7];
}

- (void)getInactiveLinkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to get an inactive link for vending as suggestion", v7, 2u);
  }

  id v6 = [(TUConversationManager *)self dataSource];
  [v6 getInactiveLinkWithCompletionHandler:v4];
}

- (void)activateLink:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to activate previously-vended link: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 activateLink:v6 completionHandler:v7];
}

- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Asked to set a link name for link: %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v12 = [(TUConversationManager *)self dataSource];
  [v12 setLinkName:v10 forConversationLink:v8 completionHandler:v9];
}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to manually schedule a sync for activated conversation links", v7, 2u);
  }

  id v6 = [(TUConversationManager *)self dataSource];
  [v6 scheduleConversationLinkCheckInInitial:v3];
}

- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to get the link sync state", v9, 2u);
  }

  id v8 = [(TUConversationManager *)self dataSource];
  [v8 linkSyncStateIncludeLinks:v4 WithCompletion:v6];
}

- (void)approvePendingMember:(id)a3 forConversation:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to approve a pending member waiting to be let in: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 approvePendingMember:v6 forConversation:v7];
}

- (void)rejectPendingMember:(id)a3 forConversation:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to reject a pending member waiting to be let in: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 rejectPendingMember:v6 forConversation:v7];
}

- (void)setIgnoreLMIRequests:(BOOL)a3 forConversation:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"allow";
    if (v4) {
      id v8 = @"ignore";
    }
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to %@ all let me in requests for link: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 setIgnoreLetMeInRequests:v4 forConversation:v6];
}

- (void)requestParticipantToShareScreen:(id)a3 forConversation:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to generate screen share request with requested participant: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 requestParticipantToShareScreen:v6 forConversation:v7];
}

- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to cancel screen share request: %@ for conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 cancelOrDenyScreenShareRequest:v6 forConversation:v7];
}

- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5
{
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    int v13 = 138412802;
    if (v6) {
      id v11 = @"YES";
    }
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Asked to set screenEnabled %@ screenShareAttributes: %@ conversationWithUUID: %@", (uint8_t *)&v13, 0x20u);
  }

  __int16 v12 = [(TUConversationManager *)self dataSource];
  [v12 setScreenEnabled:v6 withScreenShareAttributes:v8 forConversationWithUUID:v9];
}

+ (BOOL)isAddPersonEnabled
{
  id v2 = [(id)CUTWeakLinkClass() sharedInstance];
  BOOL v3 = [v2 objectForKey:@"gft-legacy-upgrade-enabled"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (unint64_t)maximumNumberOfInvitedMembers
{
  id v2 = [(id)CUTWeakLinkClass() sharedInstance];
  BOOL v3 = [v2 objectForKey:@"qr-max-participants"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 32;
  }

  return v4;
}

+ (BOOL)allowsVideo
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__TUConversationManager_allowsVideo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowsVideo_onceToken != -1) {
    dispatch_once(&allowsVideo_onceToken, block);
  }
  return allowsVideo_allowsVideo;
}

uint64_t __36__TUConversationManager_allowsVideo__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) memorySize];
  allowsVideo_allowsVideo = result > 1610612736;
  return result;
}

+ (BOOL)allowsScreenSharing
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = screenCaptureCapabilities();
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = @"NO";
    if (v2) {
      unint64_t v4 = @"YES";
    }
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "allowsScreenSharing: %@", (uint8_t *)&v6, 0xCu);
  }

  return v2 != 0;
}

+ (BOOL)allowsScreenSharingWithVideo
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = screenCaptureCapabilities();
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = @"NO";
    if (v2 == 2) {
      unint64_t v4 = @"YES";
    }
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "allowsScreenSharingWithVideo: %@", (uint8_t *)&v6, 0xCu);
  }

  return v2 == 2;
}

+ (BOOL)allowsPortraitBlurWhenCaptionsEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = MGGetSInt32Answer();
  uint64_t v3 = MGGetSInt64Answer();
  BOOL v4 = (v2 - 1) > 1
    || ((unint64_t)(v3 - 0x8000) > 0x30 || ((1 << v3) & 0x100810023000BLL) == 0)
    && ((unint64_t)(v3 - 35152) > 0x10 || ((1 << (v3 - 80)) & 0x10021) == 0)
    && (unint64_t)(v3 - 28672) >= 2;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = @"NO";
    if (v4) {
      int v6 = @"YES";
    }
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "allowsPortraitBlurWhenCaptionsEnabled: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

+ (BOOL)supportsEffects
{
  int v2 = [(id)CUTWeakLinkClass() sharedInstance];
  char v3 = [v2 supportsFunCam];

  return v3;
}

+ (int64_t)memorySize
{
  if (memorySize_onceToken != -1) {
    dispatch_once(&memorySize_onceToken, &__block_literal_global_43);
  }
  return memorySize_mem;
}

uint64_t __35__TUConversationManager_memorySize__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  *(void *)int v2 = 0x1800000006;
  size_t v1 = 8;
  return sysctl(v2, 2u, &memorySize_mem, &v1, 0, 0);
}

- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Fetching Messages group info for conversation: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TUConversationManager *)self dataSource];
  [v9 getMessagesGroupDetailsForConversationUUID:v6 completionHandler:v7];
}

- (void)setMessagesGroupProvider:(id)a3
{
  p_messagesGroupProvider = &self->_messagesGroupProvider;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_messagesGroupProvider);
  BOOL v7 = WeakRetained == 0;

  objc_storeWeak((id *)p_messagesGroupProvider, v5);
  if ((((v5 != 0) ^ v7) & 1) == 0)
  {
    id v8 = [(TUConversationManager *)self dataSource];
    [v8 setSupportsMessagesGroupProviding:v5 != 0];
  }
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(TUConversationManager *)self dataSource];
  [v7 setLocalParticipantAudioVideoMode:a3 forConversationUUID:v6];
}

- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(TUConversationManager *)self dataSource];
  [v7 updateLocalParticipantToAVLessWithPresentationMode:a3 forConversationUUID:v6];
}

- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManager *)self dataSource];
  [v5 registerMessagesGroupUUIDForConversationUUID:v4];
}

- (void)conversationsChangedForDataSource:(id)a3 conversationsByGroupUUID:(id)a4 oldConversationsByGroupUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TUConversationManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__TUConversationManager_conversationsChangedForDataSource_conversationsByGroupUUID_oldConversationsByGroupUUID___block_invoke;
  v15[3] = &unk_1E58E63D8;
  id v16 = v9;
  __int16 v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __112__TUConversationManager_conversationsChangedForDataSource_conversationsByGroupUUID_oldConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) copy];
  int v2 = [*(id *)(a1 + 40) nonSessionBackedConversationCreationQueue];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2) {
    [v3 conversationsChangedForDataSource:*(void *)(a1 + 48) oldConversationsByGroupUUID:*(void *)(a1 + 56) newConversationsByGroupUUID:v4 creationQueue:v2];
  }
  else {
    [v3 conversationsChangedFromOldConversationsByGroupUUID:*(void *)(a1 + 56) newConversationsByGroupUUID:v4];
  }
}

- (void)conversationsChangedForDataSource:(id)a3 oldConversationsByGroupUUID:(id)a4 newConversationsByGroupUUID:(id)a5 creationQueue:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke;
  block[3] = &unk_1E58E6258;
  id v14 = v9;
  id v15 = v10;
  id v16 = self;
  id v11 = v10;
  id v12 = v9;
  dispatch_async((dispatch_queue_t)a6, block);
}

void __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke(id *a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v36 = (void *)[a1[4] mutableCopy];
  int v2 = (void *)[a1[5] mutableCopy];
  uint64_t v3 = [a1[6] callPendingUpgradeInConversationsWithGroupUUID:a1[5]];
  uint64_t v32 = (void *)v3;
  if (v3)
  {
    id v4 = objc_opt_class();
    id v5 = [(id)v3 uniqueProxyIdentifierUUID];
    id v6 = [a1[6] conversationsNotBackedByGroupSessions];
    id v7 = [v4 conversationWithUUID:v5 fromConversations:v6];

    id v8 = objc_opt_class();
    id v9 = [(id)objc_opt_class() remoteMembersForCall:v3];
    id v10 = [v7 link];
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = [v2 allValues];
    id v13 = [v11 setWithArray:v12];
    id v14 = objc_msgSend(v8, "conversationWithRemoteMembers:andLink:fromConversations:matchingVideo:backedByGroupSession:", v9, v10, v13, objc_msgSend((id)v3, "isVideo"), 1);

    id v15 = TUDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v14;
      __int16 v47 = 2112;
      id v48 = v7;
      _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "Notified of new session-backed conversation %@ to replace non-session-backed conversation %@", buf, 0x16u);
    }

    LODWORD(v3) = v14 != 0;
    if (v7 && v14)
    {
      id v16 = [a1[6] queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke_159;
      block[3] = &unk_1E58E6258;
      void block[4] = a1[6];
      id v7 = v7;
      id v42 = v7;
      id v34 = v14;
      id v43 = v34;
      dispatch_async(v16, block);

      LODWORD(v3) = 1;
    }
    else
    {
      id v34 = v14;
    }
  }
  else
  {
    id v7 = 0;
    id v34 = 0;
  }
  id v35 = v2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v33 = a1;
  __int16 v17 = [a1[6] conversationsNotBackedByGroupSessions];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        __int16 v23 = [v22 UUID];
        id v24 = v7;
        uint64_t v25 = [v7 UUID];
        int v26 = [v23 isEqual:v25] & v3;

        if (v26 == 1)
        {
          id v27 = (void *)[v22 copy];
          id v28 = [v34 UUID];
          [v27 setUUID:v28];

          id v29 = [v34 groupUUID];
          [v27 setGroupUUID:v29];

          id v30 = [v27 groupUUID];
          [v36 setObject:v27 forKeyedSubscript:v30];
        }
        else
        {
          id v31 = [v22 groupUUID];
          [v36 setObject:v22 forKeyedSubscript:v31];

          id v27 = [v22 groupUUID];
          [v35 setObject:v22 forKeyedSubscript:v27];
        }

        id v7 = v24;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v19);
  }

  [v33[6] pruneConversationsPendingUpgradeInConversationsWithGroupUUID:v33[5]];
  [v33[6] conversationsChangedFromOldConversationsByGroupUUID:v36 newConversationsByGroupUUID:v35];
}

void __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke_159(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke_2;
        block[3] = &unk_1E58E63D8;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 conversationManager:v4 migratingFromConversation:v5 toConversation:v6];
  }
  return result;
}

- (void)conversationsChangedFromOldConversationsByGroupUUID:(id)a3 newConversationsByGroupUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__TUConversationManager_conversationsChangedFromOldConversationsByGroupUUID_newConversationsByGroupUUID___block_invoke;
  block[3] = &unk_1E58E6258;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __105__TUConversationManager_conversationsChangedFromOldConversationsByGroupUUID_newConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  v135 = [MEMORY[0x1E4F1CA80] set];
  v116 = [MEMORY[0x1E4F1CA80] set];
  v111 = [MEMORY[0x1E4F1CA80] set];
  v132 = [MEMORY[0x1E4F1CA80] set];
  v108 = [MEMORY[0x1E4F1CA80] set];
  v131 = [MEMORY[0x1E4F1CA80] set];
  v130 = [MEMORY[0x1E4F1CA80] set];
  v129 = [MEMORY[0x1E4F1CA80] set];
  v133 = [MEMORY[0x1E4F1CA80] set];
  v128 = [MEMORY[0x1E4F1CA80] set];
  v134 = [MEMORY[0x1E4F1CA80] set];
  v127 = [MEMORY[0x1E4F1CA80] set];
  v126 = [MEMORY[0x1E4F1CA80] set];
  v125 = [MEMORY[0x1E4F1CA80] set];
  v124 = [MEMORY[0x1E4F1CA80] set];
  v123 = [MEMORY[0x1E4F1CA80] set];
  v122 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = [*(id *)(a1 + 32) allValues];
  v113 = [v2 setWithArray:v3];

  v105 = [MEMORY[0x1E4F1CA80] set];
  v121 = [MEMORY[0x1E4F1CA80] set];
  v120 = [MEMORY[0x1E4F1CA80] set];
  v119 = [MEMORY[0x1E4F1CA80] set];
  v118 = [MEMORY[0x1E4F1CA80] set];
  v117 = [MEMORY[0x1E4F1CA80] set];
  v115 = [MEMORY[0x1E4F1CA80] set];
  v114 = [MEMORY[0x1E4F1CA80] set];
  v107 = [MEMORY[0x1E4F1CA80] set];
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  uint64_t v137 = a1;
  id obj = [*(id *)(a1 + 40) allValues];
  uint64_t v110 = [obj countByEnumeratingWithState:&v175 objects:v181 count:16];
  if (!v110)
  {
    v112 = 0;
    id v136 = 0;
    goto LABEL_91;
  }
  v112 = 0;
  id v136 = 0;
  uint64_t v109 = *(void *)v176;
  do
  {
    for (uint64_t i = 0; i != v110; ++i)
    {
      if (*(void *)v176 != v109) {
        objc_enumerationMutation(obj);
      }
      uint64_t v5 = *(void **)(*((void *)&v175 + 1) + 8 * i);
      id v6 = *(void **)(v137 + 32);
      id v7 = [v5 groupUUID];
      id v8 = [v6 objectForKeyedSubscript:v7];

      if (!v8)
      {
        [v127 addObject:v5];
        [v126 addObject:v5];
        [v132 addObject:v5];
        [v108 addObject:v5];
        [v131 addObject:v5];
        [v130 addObject:v5];
        [v129 addObject:v5];
        [v128 addObject:v5];
        [v134 addObject:v5];
        [v125 addObject:v5];
        [v124 addObject:v5];
        [v123 addObject:v5];
        [v122 addObject:v5];
        [v135 addObject:v5];
        if ([v5 state] != 4) {
          [v105 addObject:v5];
        }
        [v121 addObject:v5];
        [v119 addObject:v5];
        [v120 addObject:v5];
        [v133 addObject:v5];
        goto LABEL_67;
      }
      uint64_t v9 = [v8 state];
      if (v9 != [v5 state]) {
        [v127 addObject:v5];
      }
      uint64_t v10 = [v8 letMeInRequestState];
      if (v10 != [v5 letMeInRequestState]) {
        [v126 addObject:v5];
      }
      int v11 = [v8 isVideoEnabled];
      if (v11 != [v5 isVideoEnabled]) {
        [v132 addObject:v5];
      }
      int v12 = [v8 isScreenEnabled];
      if (v12 != [v5 isScreenEnabled]) {
        [v108 addObject:v5];
      }
      id v13 = [v8 remoteMembers];
      id v14 = [v5 remoteMembers];
      char v15 = [v13 isEqualToSet:v14];

      if ((v15 & 1) == 0) {
        [v131 addObject:v5];
      }
      long long v16 = [v8 pendingMembers];
      long long v17 = [v5 pendingMembers];
      char v18 = [v16 isEqualToSet:v17];

      if ((v18 & 1) == 0) {
        [v130 addObject:v5];
      }
      uint64_t v19 = [v8 kickedMembers];
      uint64_t v20 = [v5 kickedMembers];
      char v21 = [v19 isEqualToSet:v20];

      if ((v21 & 1) == 0) {
        [v129 addObject:v5];
      }
      id v22 = [v8 otherInvitedHandles];
      __int16 v23 = [v5 otherInvitedHandles];
      char v24 = [v22 isEqualToSet:v23];

      if ((v24 & 1) == 0) {
        [v128 addObject:v5];
      }
      uint64_t v25 = [v8 activeRemoteParticipants];
      int v26 = [v5 activeRemoteParticipants];
      if (([v25 isEqualToSet:v26] & 1) == 0)
      {

LABEL_30:
        [v134 addObject:v5];
        goto LABEL_31;
      }
      id v27 = [v8 activeLightweightParticipants];
      id v28 = [v5 activeLightweightParticipants];
      char v29 = [v27 isEqualToSet:v28];

      if ((v29 & 1) == 0) {
        goto LABEL_30;
      }
LABEL_31:
      int v30 = [v8 isOneToOneModeEnabled];
      if (v30 != [v5 isOneToOneModeEnabled]) {
        [v125 addObject:v5];
      }
      uint64_t v31 = [v8 avMode];
      if (v31 != [v5 avMode]) {
        [v124 addObject:v5];
      }
      uint64_t v32 = [v8 presentationContext];
      v33 = [v5 presentationContext];
      char v34 = [v32 isEqual:v33];

      if ((v34 & 1) == 0) {
        [v123 addObject:v5];
      }
      uint64_t v35 = [v8 resolvedAudioVideoMode];
      if (v35 != [v5 resolvedAudioVideoMode]) {
        [v122 addObject:v5];
      }
      long long v36 = [v8 activitySessions];
      long long v37 = [v5 activitySessions];
      if (([v36 isEqualToSet:v37] & 1) == 0)
      {

LABEL_43:
        [v135 addObject:v5];
        goto LABEL_44;
      }
      long long v38 = [v8 stagedActivitySession];
      long long v39 = [v5 stagedActivitySession];
      char v40 = TUObjectsAreEqualOrNil((unint64_t)v38, (uint64_t)v39);

      if ((v40 & 1) == 0) {
        goto LABEL_43;
      }
LABEL_44:
      uint64_t v41 = [v8 link];
      id v42 = [v5 link];
      if (([v41 isEquivalentToConversationLink:v42] & 1) == 0)
      {

LABEL_48:
        [v116 addObject:v5];
        goto LABEL_49;
      }
      id v43 = [v8 link];
      v44 = [v43 linkName];
      v45 = [v5 link];
      v46 = [v45 linkName];
      char v47 = TUStringsAreEqualOrNil((unint64_t)v44, (uint64_t)v46);

      if ((v47 & 1) == 0) {
        goto LABEL_48;
      }
LABEL_49:
      uint64_t v48 = [v8 link];
      if (v48)
      {
        uint64_t v49 = (void *)v48;
        uint64_t v50 = [v5 link];
        if (v50)
        {
          v51 = (void *)v50;
          v52 = [v8 link];
          v53 = [v52 invitedMemberHandles];
          v54 = [v5 link];
          v55 = [v54 invitedMemberHandles];
          char v56 = [v53 isEqualToSet:v55];

          if ((v56 & 1) == 0) {
            [v111 addObject:v5];
          }
        }
        else
        {
        }
      }
      v57 = [v8 UUID];
      v58 = [v5 UUID];
      int v59 = [v57 isEqual:v58];

      if (v59) {
        [v113 removeObject:v8];
      }
      v60 = [v8 messagesGroupName];
      v61 = [v5 messagesGroupName];
      char v62 = [v60 isEqualToString:v61];

      if ((v62 & 1) == 0) {
        [v121 addObject:v5];
      }
      v63 = [v8 messagesGroupUUID];
      v64 = [v5 messagesGroupUUID];
      char v65 = TUObjectsAreEqualOrNil((unint64_t)v63, (uint64_t)v64);

      if ((v65 & 1) == 0) {
        [v119 addObject:v5];
      }
      int v66 = [v8 ignoreLMIRequests];
      if (v66 != [v5 ignoreLMIRequests]) {
        [v120 addObject:v5];
      }
      v67 = [v8 rejectedMembers];
      v68 = [v5 rejectedMembers];

      if (v67 != v68) {
        [v133 addObject:v5];
      }
      v69 = [v5 handoffEligibility];
      if (v69)
      {
      }
      else
      {
        v70 = [v8 handoffEligibility];

        if (!v70) {
          goto LABEL_75;
        }
      }
LABEL_67:
      v71 = [v5 handoffEligibility];

      if (!v71 || v136)
      {
        if (!v8)
        {
LABEL_85:
          [v118 addObject:v5];
          v86 = v117;
LABEL_86:
          [v86 addObject:v5];
          goto LABEL_87;
        }
        uint64_t v72 = [v8 handoffEligibility];
        if (v72)
        {
          v73 = (void *)v72;
          v74 = [v5 handoffEligibility];

          if (!v74)
          {
            id v75 = v5;

            v112 = v75;
          }
        }
      }
      else
      {
        id v136 = v5;
        if (!v8) {
          goto LABEL_85;
        }
      }
LABEL_75:
      v76 = [v8 systemActivitySessions];
      v77 = [v5 systemActivitySessions];
      char v78 = [v76 isEqualToSet:v77];

      if ((v78 & 1) == 0) {
        [v118 addObject:v5];
      }
      int v79 = [v8 isCameraMixedWithScreen];
      if (v79 != [v5 isCameraMixedWithScreen]) {
        [v117 addObject:v5];
      }
      int v80 = [v8 isScreening];
      if (v80 != [v5 isScreening]) {
        [v115 addObject:v5];
      }
      v81 = [v8 screenSharingRequests];
      v82 = [v5 screenSharingRequests];
      char v83 = [v81 isEqualToSet:v82];

      if ((v83 & 1) == 0) {
        [v114 addObject:v5];
      }
      uint64_t v84 = [v8 screenSharingType];
      uint64_t v85 = [v5 screenSharingType];
      v86 = v107;
      if (v84 != v85) {
        goto LABEL_86;
      }
LABEL_87:
    }
    uint64_t v110 = [obj countByEnumeratingWithState:&v175 objects:v181 count:16];
  }
  while (v110);
LABEL_91:

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v87 = v105;
  uint64_t v88 = [v87 countByEnumeratingWithState:&v171 objects:v180 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v172;
    do
    {
      for (uint64_t j = 0; j != v89; ++j)
      {
        if (*(void *)v172 != v90) {
          objc_enumerationMutation(v87);
        }
        v92 = *(void **)(*((void *)&v171 + 1) + 8 * j);
        v93 = [v92 highlightIdentifiers];
        uint64_t v94 = [v93 count];

        if (v94)
        {
          v95 = [*(id *)(v137 + 48) collaborationManager];
          [v95 associateCollaborationWithNewConversation:v92];
        }
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v171 objects:v180 count:16];
    }
    while (v89);
  }

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  v96 = [*(id *)(v137 + 48) delegateToQueue];
  uint64_t v97 = [v96 countByEnumeratingWithState:&v167 objects:v179 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v168;
    do
    {
      for (uint64_t k = 0; k != v98; ++k)
      {
        if (*(void *)v168 != v99) {
          objc_enumerationMutation(v96);
        }
        uint64_t v101 = *(void *)(*((void *)&v167 + 1) + 8 * k);
        v102 = [*(id *)(v137 + 48) delegateToQueue];
        v103 = [v102 objectForKey:v101];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __105__TUConversationManager_conversationsChangedFromOldConversationsByGroupUUID_newConversationsByGroupUUID___block_invoke_2;
        block[3] = &unk_1E58E7D10;
        uint64_t v104 = *(void *)(v137 + 48);
        void block[4] = v101;
        void block[5] = v104;
        id v139 = v121;
        id v140 = *(id *)(v137 + 32);
        id v141 = v119;
        id v142 = v127;
        id v143 = v126;
        id v144 = v132;
        id v145 = v131;
        id v146 = v130;
        id v147 = v129;
        id v148 = v128;
        id v149 = v134;
        id v150 = v125;
        id v151 = v124;
        id v152 = v123;
        id v153 = v122;
        id v154 = v135;
        id v155 = v116;
        id v156 = v111;
        id v157 = v113;
        id v158 = v87;
        id v159 = v120;
        id v160 = v133;
        id v161 = v136;
        id v162 = v112;
        id v163 = v118;
        id v164 = v117;
        id v165 = v115;
        id v166 = v114;
        dispatch_async(v103, block);
      }
      uint64_t v98 = [v96 countByEnumeratingWithState:&v167 objects:v179 count:16];
    }
    while (v98);
  }
}

void __105__TUConversationManager_conversationsChangedFromOldConversationsByGroupUUID_newConversationsByGroupUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v335 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) conversationsChangedForConversationManager:*(void *)(a1 + 40)];
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v309 = 0u;
    long long v308 = 0u;
    long long v307 = 0u;
    long long v306 = 0u;
    id v2 = *(id *)(a1 + 48);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v306 objects:v334 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v307;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v307 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v306 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) conversationUpdatedMessagesGroupName:v7];
          }
          if (objc_opt_respondsToSelector())
          {
            id v8 = *(void **)(a1 + 56);
            uint64_t v9 = [v7 groupUUID];
            uint64_t v10 = [v8 objectForKeyedSubscript:v9];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) conversationUpdatedMessagesGroupName:v7 fromOldConversation:v10];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v306 objects:v334 count:16];
      }
      while (v4);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v305 = 0u;
    long long v304 = 0u;
    long long v303 = 0u;
    long long v302 = 0u;
    id v11 = *(id *)(a1 + 64);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v302 objects:v333 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v303;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v303 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) conversationUpdatedMessagesGroupUUID:*(void *)(*((void *)&v302 + 1) + 8 * j)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v302 objects:v333 count:16];
      }
      while (v13);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v301 = 0u;
    long long v300 = 0u;
    long long v299 = 0u;
    long long v298 = 0u;
    id v16 = *(id *)(a1 + 72);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v298 objects:v332 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v299;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v299 != v19) {
            objc_enumerationMutation(v16);
          }
          char v21 = *(void **)(*((void *)&v298 + 1) + 8 * k);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) stateChangedForConversation:v21];
          }
          if (objc_opt_respondsToSelector())
          {
            id v22 = *(void **)(a1 + 56);
            __int16 v23 = [v21 groupUUID];
            char v24 = [v22 objectForKeyedSubscript:v23];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) stateChangedForConversation:v21 fromOldConversation:v24];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v298 objects:v332 count:16];
      }
      while (v18);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v297 = 0u;
    long long v296 = 0u;
    long long v295 = 0u;
    long long v294 = 0u;
    id v25 = *(id *)(a1 + 80);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v294 objects:v331 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v295;
      do
      {
        for (uint64_t m = 0; m != v27; ++m)
        {
          if (*(void *)v295 != v28) {
            objc_enumerationMutation(v25);
          }
          int v30 = *(void **)(*((void *)&v294 + 1) + 8 * m);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) letMeInRequestStateChangedForConversation:v30];
          }
          if (objc_opt_respondsToSelector())
          {
            uint64_t v31 = *(void **)(a1 + 56);
            uint64_t v32 = [v30 groupUUID];
            v33 = [v31 objectForKeyedSubscript:v32];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) letMeInRequestStateChangedForConversation:v30 fromOldConversation:v33];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v294 objects:v331 count:16];
      }
      while (v27);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v293 = 0u;
    long long v292 = 0u;
    long long v291 = 0u;
    long long v290 = 0u;
    id v34 = *(id *)(a1 + 88);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v290 objects:v330 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v291;
      do
      {
        for (uint64_t n = 0; n != v36; ++n)
        {
          if (*(void *)v291 != v37) {
            objc_enumerationMutation(v34);
          }
          long long v39 = *(void **)(*((void *)&v290 + 1) + 8 * n);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) localVideoToggledForConversation:v39];
          }
          if (objc_opt_respondsToSelector())
          {
            char v40 = *(void **)(a1 + 56);
            uint64_t v41 = [v39 groupUUID];
            id v42 = [v40 objectForKeyedSubscript:v41];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) localVideoToggledForConversation:v39 fromOldConversation:v42];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v290 objects:v330 count:16];
      }
      while (v36);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v289 = 0u;
    long long v288 = 0u;
    long long v287 = 0u;
    long long v286 = 0u;
    id v43 = *(id *)(a1 + 96);
    uint64_t v44 = [v43 countByEnumeratingWithState:&v286 objects:v329 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v287;
      do
      {
        for (iuint64_t i = 0; ii != v45; ++ii)
        {
          if (*(void *)v287 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = *(void **)(*((void *)&v286 + 1) + 8 * ii);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) remoteMembersChangedForConversation:v48];
          }
          if (objc_opt_respondsToSelector())
          {
            uint64_t v49 = *(void **)(a1 + 56);
            uint64_t v50 = [v48 groupUUID];
            v51 = [v49 objectForKeyedSubscript:v50];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) remoteMembersChangedForConversation:v48 fromOldConversation:v51];
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v286 objects:v329 count:16];
      }
      while (v45);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v285 = 0u;
    long long v284 = 0u;
    long long v283 = 0u;
    long long v282 = 0u;
    id v52 = *(id *)(a1 + 104);
    uint64_t v53 = [v52 countByEnumeratingWithState:&v282 objects:v328 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v283;
      do
      {
        for (juint64_t j = 0; jj != v54; ++jj)
        {
          if (*(void *)v283 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v282 + 1) + 8 * jj);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) pendingMembersChangedForConversation:v57];
          }
          if (objc_opt_respondsToSelector())
          {
            v58 = *(void **)(a1 + 56);
            int v59 = [v57 groupUUID];
            v60 = [v58 objectForKeyedSubscript:v59];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) pendingMembersChangedForConversation:v57 fromOldConversation:v60];
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v282 objects:v328 count:16];
      }
      while (v54);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v281 = 0u;
    long long v280 = 0u;
    long long v279 = 0u;
    long long v278 = 0u;
    id v61 = *(id *)(a1 + 112);
    uint64_t v62 = [v61 countByEnumeratingWithState:&v278 objects:v327 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v279;
      do
      {
        for (kuint64_t k = 0; kk != v63; ++kk)
        {
          if (*(void *)v279 != v64) {
            objc_enumerationMutation(v61);
          }
          int v66 = *(void **)(*((void *)&v278 + 1) + 8 * kk);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) kickedMembersChangedForConversation:v66];
          }
          if (objc_opt_respondsToSelector())
          {
            v67 = *(void **)(a1 + 56);
            v68 = [v66 groupUUID];
            v69 = [v67 objectForKeyedSubscript:v68];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) kickedMembersChangedForConversation:v66 fromOldConversation:v69];
          }
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v278 objects:v327 count:16];
      }
      while (v63);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v277 = 0u;
    long long v276 = 0u;
    long long v275 = 0u;
    long long v274 = 0u;
    id v70 = *(id *)(a1 + 120);
    uint64_t v71 = [v70 countByEnumeratingWithState:&v274 objects:v326 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v275;
      do
      {
        for (muint64_t m = 0; mm != v72; ++mm)
        {
          if (*(void *)v275 != v73) {
            objc_enumerationMutation(v70);
          }
          id v75 = *(void **)(*((void *)&v274 + 1) + 8 * mm);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) otherInvitedHandlesChangedForConversation:v75];
          }
          if (objc_opt_respondsToSelector())
          {
            v76 = *(void **)(a1 + 56);
            v77 = [v75 groupUUID];
            char v78 = [v76 objectForKeyedSubscript:v77];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) otherInvitedHandlesChangedForConversation:v75 fromOldConversation:v78];
          }
        }
        uint64_t v72 = [v70 countByEnumeratingWithState:&v274 objects:v326 count:16];
      }
      while (v72);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v272 = 0u;
    long long v273 = 0u;
    long long v270 = 0u;
    long long v271 = 0u;
    id v79 = *(id *)(a1 + 128);
    uint64_t v80 = [v79 countByEnumeratingWithState:&v270 objects:v325 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v271;
      do
      {
        for (nuint64_t n = 0; nn != v81; ++nn)
        {
          if (*(void *)v271 != v82) {
            objc_enumerationMutation(v79);
          }
          uint64_t v84 = *(void **)(*((void *)&v270 + 1) + 8 * nn);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) activeRemoteParticipantsChangedForConversation:v84];
          }
          if (objc_opt_respondsToSelector())
          {
            uint64_t v85 = *(void **)(a1 + 56);
            v86 = [v84 groupUUID];
            id v87 = [v85 objectForKeyedSubscript:v86];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) activeRemoteParticipantsChangedForConversation:v84 fromOldConversation:v87];
          }
        }
        uint64_t v81 = [v79 countByEnumeratingWithState:&v270 objects:v325 count:16];
      }
      while (v81);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v268 = 0u;
    long long v269 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    id v88 = *(id *)(a1 + 136);
    uint64_t v89 = [v88 countByEnumeratingWithState:&v266 objects:v324 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v267;
      do
      {
        for (uint64_t i1 = 0; i1 != v90; ++i1)
        {
          if (*(void *)v267 != v91) {
            objc_enumerationMutation(v88);
          }
          v93 = *(void **)(*((void *)&v266 + 1) + 8 * i1);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) oneToOneModeChangedForConversation:v93];
          }
          if (objc_opt_respondsToSelector())
          {
            uint64_t v94 = *(void **)(a1 + 56);
            v95 = [v93 groupUUID];
            v96 = [v94 objectForKeyedSubscript:v95];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) oneToOneModeChangedForConversation:v93 fromOldConversation:v96];
          }
        }
        uint64_t v90 = [v88 countByEnumeratingWithState:&v266 objects:v324 count:16];
      }
      while (v90);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v264 = 0u;
    long long v265 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    id v97 = *(id *)(a1 + 144);
    uint64_t v98 = [v97 countByEnumeratingWithState:&v262 objects:v323 count:16];
    if (v98)
    {
      uint64_t v99 = v98;
      uint64_t v100 = *(void *)v263;
      do
      {
        for (uint64_t i2 = 0; i2 != v99; ++i2)
        {
          if (*(void *)v263 != v100) {
            objc_enumerationMutation(v97);
          }
          v102 = *(void **)(*((void *)&v262 + 1) + 8 * i2);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) avModeChangedForConversation:v102];
          }
          if (objc_opt_respondsToSelector())
          {
            v103 = *(void **)(a1 + 56);
            uint64_t v104 = [v102 groupUUID];
            v105 = [v103 objectForKeyedSubscript:v104];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) avModeChangedForConversation:v102 fromOldConversation:v105];
          }
        }
        uint64_t v99 = [v97 countByEnumeratingWithState:&v262 objects:v323 count:16];
      }
      while (v99);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v260 = 0u;
    long long v261 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    id v106 = *(id *)(a1 + 152);
    uint64_t v107 = [v106 countByEnumeratingWithState:&v258 objects:v322 count:16];
    if (v107)
    {
      uint64_t v108 = v107;
      uint64_t v109 = *(void *)v259;
      do
      {
        for (uint64_t i3 = 0; i3 != v108; ++i3)
        {
          if (*(void *)v259 != v109) {
            objc_enumerationMutation(v106);
          }
          v111 = *(void **)(*((void *)&v258 + 1) + 8 * i3);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) presentationContextChangedForConversation:v111];
          }
          if (objc_opt_respondsToSelector())
          {
            v112 = *(void **)(a1 + 56);
            v113 = [v111 groupUUID];
            v114 = [v112 objectForKeyedSubscript:v113];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) presentationContextChangedForConversation:v111 fromOldConversation:v114];
          }
        }
        uint64_t v108 = [v106 countByEnumeratingWithState:&v258 objects:v322 count:16];
      }
      while (v108);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v256 = 0u;
    long long v257 = 0u;
    long long v254 = 0u;
    long long v255 = 0u;
    id v115 = *(id *)(a1 + 160);
    uint64_t v116 = [v115 countByEnumeratingWithState:&v254 objects:v321 count:16];
    if (v116)
    {
      uint64_t v117 = v116;
      uint64_t v118 = *(void *)v255;
      do
      {
        for (uint64_t i4 = 0; i4 != v117; ++i4)
        {
          if (*(void *)v255 != v118) {
            objc_enumerationMutation(v115);
          }
          v120 = *(void **)(*((void *)&v254 + 1) + 8 * i4);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) resolvedAudioVideoModeChangedForConversation:v120];
          }
          if (objc_opt_respondsToSelector())
          {
            v121 = *(void **)(a1 + 56);
            v122 = [v120 groupUUID];
            v123 = [v121 objectForKeyedSubscript:v122];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) resolvedAudioVideoModeChangedForConversation:v120 fromOldConversation:v123];
          }
        }
        uint64_t v117 = [v115 countByEnumeratingWithState:&v254 objects:v321 count:16];
      }
      while (v117);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v252 = 0u;
    long long v253 = 0u;
    long long v250 = 0u;
    long long v251 = 0u;
    id v124 = *(id *)(a1 + 168);
    uint64_t v125 = [v124 countByEnumeratingWithState:&v250 objects:v320 count:16];
    if (v125)
    {
      uint64_t v126 = v125;
      uint64_t v127 = *(void *)v251;
      do
      {
        for (uint64_t i5 = 0; i5 != v126; ++i5)
        {
          if (*(void *)v251 != v127) {
            objc_enumerationMutation(v124);
          }
          v129 = *(void **)(*((void *)&v250 + 1) + 8 * i5);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) activitySessionsChangedForConversation:v129];
          }
          if (objc_opt_respondsToSelector())
          {
            v130 = *(void **)(a1 + 56);
            v131 = [v129 groupUUID];
            v132 = [v130 objectForKeyedSubscript:v131];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) activitySessionsChangedForConversation:v129 fromOldConversation:v132];
          }
        }
        uint64_t v126 = [v124 countByEnumeratingWithState:&v250 objects:v320 count:16];
      }
      while (v126);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v248 = 0u;
    long long v249 = 0u;
    long long v246 = 0u;
    long long v247 = 0u;
    id v133 = *(id *)(a1 + 176);
    uint64_t v134 = [v133 countByEnumeratingWithState:&v246 objects:v319 count:16];
    if (v134)
    {
      uint64_t v135 = v134;
      uint64_t v136 = *(void *)v247;
      do
      {
        for (uint64_t i6 = 0; i6 != v135; ++i6)
        {
          if (*(void *)v247 != v136) {
            objc_enumerationMutation(v133);
          }
          v138 = *(void **)(*((void *)&v246 + 1) + 8 * i6);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) linkChangedForConversation:v138];
          }
          if (objc_opt_respondsToSelector())
          {
            id v139 = *(void **)(a1 + 56);
            id v140 = [v138 groupUUID];
            id v141 = [v139 objectForKeyedSubscript:v140];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) linkChangedForConversation:v138 fromOldConversation:v141];
          }
        }
        uint64_t v135 = [v133 countByEnumeratingWithState:&v246 objects:v319 count:16];
      }
      while (v135);
    }
  }
  char v142 = objc_opt_respondsToSelector();
  char v143 = objc_opt_respondsToSelector();
  char v144 = v143;
  if (v142 & 1) != 0 || (v143)
  {
    long long v244 = 0u;
    long long v245 = 0u;
    long long v242 = 0u;
    long long v243 = 0u;
    id v145 = *(id *)(a1 + 184);
    uint64_t v146 = [v145 countByEnumeratingWithState:&v242 objects:v318 count:16];
    if (v146)
    {
      uint64_t v147 = v146;
      uint64_t v148 = *(void *)v243;
      do
      {
        for (uint64_t i7 = 0; i7 != v147; ++i7)
        {
          if (*(void *)v243 != v148) {
            objc_enumerationMutation(v145);
          }
          id v150 = *(void **)(*((void *)&v242 + 1) + 8 * i7);
          if (v142) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) linkInvitedMemberHandlesChangedForConversation:*(void *)(*((void *)&v242 + 1) + 8 * i7)];
          }
          if (v144)
          {
            id v151 = *(void **)(a1 + 56);
            id v152 = [v150 groupUUID];
            id v153 = [v151 objectForKeyedSubscript:v152];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) linkInvitedMemberHandlesChangedForConversation:v150 fromOldConversation:v153];
          }
        }
        uint64_t v147 = [v145 countByEnumeratingWithState:&v242 objects:v318 count:16];
      }
      while (v147);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v240 = 0u;
    long long v241 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    id v154 = *(id *)(a1 + 192);
    uint64_t v155 = [v154 countByEnumeratingWithState:&v238 objects:v317 count:16];
    if (v155)
    {
      uint64_t v156 = v155;
      uint64_t v157 = *(void *)v239;
      do
      {
        for (uint64_t i8 = 0; i8 != v156; ++i8)
        {
          if (*(void *)v239 != v157) {
            objc_enumerationMutation(v154);
          }
          [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) removedActiveConversation:*(void *)(*((void *)&v238 + 1) + 8 * i8)];
        }
        uint64_t v156 = [v154 countByEnumeratingWithState:&v238 objects:v317 count:16];
      }
      while (v156);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v236 = 0u;
    long long v237 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    id v159 = *(id *)(a1 + 200);
    uint64_t v160 = [v159 countByEnumeratingWithState:&v234 objects:v316 count:16];
    if (v160)
    {
      uint64_t v161 = v160;
      uint64_t v162 = *(void *)v235;
      do
      {
        for (uint64_t i9 = 0; i9 != v161; ++i9)
        {
          if (*(void *)v235 != v162) {
            objc_enumerationMutation(v159);
          }
          [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) addedActiveConversation:*(void *)(*((void *)&v234 + 1) + 8 * i9)];
        }
        uint64_t v161 = [v159 countByEnumeratingWithState:&v234 objects:v316 count:16];
      }
      while (v161);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v232 = 0u;
    long long v233 = 0u;
    long long v230 = 0u;
    long long v231 = 0u;
    id v164 = *(id *)(a1 + 208);
    uint64_t v165 = [v164 countByEnumeratingWithState:&v230 objects:v315 count:16];
    if (v165)
    {
      uint64_t v166 = v165;
      uint64_t v167 = *(void *)v231;
      do
      {
        for (uint64_t i10 = 0; i10 != v166; ++i10)
        {
          if (*(void *)v231 != v167) {
            objc_enumerationMutation(v164);
          }
          [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) ignoreLMIRequestsChangedForConversation:*(void *)(*((void *)&v230 + 1) + 8 * i10)];
        }
        uint64_t v166 = [v164 countByEnumeratingWithState:&v230 objects:v315 count:16];
      }
      while (v166);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v228 = 0u;
    long long v229 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    id v169 = *(id *)(a1 + 216);
    uint64_t v170 = [v169 countByEnumeratingWithState:&v226 objects:v314 count:16];
    if (v170)
    {
      uint64_t v171 = v170;
      uint64_t v172 = *(void *)v227;
      do
      {
        for (uint64_t i11 = 0; i11 != v171; ++i11)
        {
          if (*(void *)v227 != v172) {
            objc_enumerationMutation(v169);
          }
          long long v174 = *(void **)(*((void *)&v226 + 1) + 8 * i11);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) rejectedMembersChangedForConversation:v174];
          }
          if (objc_opt_respondsToSelector())
          {
            long long v175 = *(void **)(a1 + 56);
            long long v176 = [v174 groupUUID];
            long long v177 = [v175 objectForKeyedSubscript:v176];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) rejectedMembersChangedForConversation:v174 fromOldConversation:v177];
          }
        }
        uint64_t v171 = [v169 countByEnumeratingWithState:&v226 objects:v314 count:16];
      }
      while (v171);
    }
  }
  if (*(void *)(a1 + 224) && *(void *)(a1 + 232) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) handoffEligibilityChangedToConversation:*(void *)(a1 + 224) fromPreviousConversation:*(void *)(a1 + 232)];
  }
  else if (objc_opt_respondsToSelector())
  {
    if (*(void *)(a1 + 224)) {
      objc_msgSend(*(id *)(a1 + 32), "conversationManager:handoffEligibilityChangedForConversation:", *(void *)(a1 + 40));
    }
    if (*(void *)(a1 + 232)) {
      objc_msgSend(*(id *)(a1 + 32), "conversationManager:handoffEligibilityChangedForConversation:", *(void *)(a1 + 40));
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v224 = 0u;
    long long v225 = 0u;
    long long v222 = 0u;
    long long v223 = 0u;
    id v178 = *(id *)(a1 + 240);
    uint64_t v179 = [v178 countByEnumeratingWithState:&v222 objects:v313 count:16];
    if (v179)
    {
      uint64_t v180 = v179;
      uint64_t v181 = *(void *)v223;
      do
      {
        for (uint64_t i12 = 0; i12 != v180; ++i12)
        {
          if (*(void *)v223 != v181) {
            objc_enumerationMutation(v178);
          }
          v183 = *(void **)(*((void *)&v222 + 1) + 8 * i12);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) systemActivitySessionsChangedForConversation:v183];
          }
          if (objc_opt_respondsToSelector())
          {
            v184 = *(void **)(a1 + 56);
            v185 = [v183 groupUUID];
            v186 = [v184 objectForKeyedSubscript:v185];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) systemActivitySessionsChangedForConversation:v183 fromOldConversation:v186];
          }
        }
        uint64_t v180 = [v178 countByEnumeratingWithState:&v222 objects:v313 count:16];
      }
      while (v180);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    long long v220 = 0u;
    long long v221 = 0u;
    long long v218 = 0u;
    long long v219 = 0u;
    id v187 = *(id *)(a1 + 248);
    uint64_t v188 = [v187 countByEnumeratingWithState:&v218 objects:v312 count:16];
    if (v188)
    {
      uint64_t v189 = v188;
      uint64_t v190 = *(void *)v219;
      do
      {
        for (uint64_t i13 = 0; i13 != v189; ++i13)
        {
          if (*(void *)v219 != v190) {
            objc_enumerationMutation(v187);
          }
          v192 = *(void **)(*((void *)&v218 + 1) + 8 * i13);
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) cameraMixedWithScreenDidChangeForConversation:v192];
          }
          if (objc_opt_respondsToSelector())
          {
            v193 = *(void **)(a1 + 56);
            v194 = [v192 groupUUID];
            v195 = [v193 objectForKeyedSubscript:v194];

            [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) cameraMixedWithScreenDidChangeForConversation:v192 fromOldConversation:v195];
          }
        }
        uint64_t v189 = [v187 countByEnumeratingWithState:&v218 objects:v312 count:16];
      }
      while (v189);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    id v196 = *(id *)(a1 + 256);
    uint64_t v197 = [v196 countByEnumeratingWithState:&v214 objects:v311 count:16];
    if (v197)
    {
      uint64_t v198 = v197;
      uint64_t v199 = *(void *)v215;
      do
      {
        for (uint64_t i14 = 0; i14 != v198; ++i14)
        {
          if (*(void *)v215 != v199) {
            objc_enumerationMutation(v196);
          }
          [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) screeningChangedForConversation:*(void *)(*((void *)&v214 + 1) + 8 * i14)];
        }
        uint64_t v198 = [v196 countByEnumeratingWithState:&v214 objects:v311 count:16];
      }
      while (v198);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    id v201 = *(id *)(a1 + 264);
    uint64_t v202 = [v201 countByEnumeratingWithState:&v210 objects:v310 count:16];
    if (v202)
    {
      uint64_t v203 = v202;
      uint64_t v204 = *(void *)v211;
      do
      {
        for (uint64_t i15 = 0; i15 != v203; ++i15)
        {
          if (*(void *)v211 != v204) {
            objc_enumerationMutation(v201);
          }
          v206 = *(void **)(*((void *)&v210 + 1) + 8 * i15);
          v207 = *(void **)(a1 + 56);
          v208 = objc_msgSend(v206, "groupUUID", (void)v210);
          v209 = [v207 objectForKeyedSubscript:v208];

          [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) screenSharingRequestsChangedForConversation:v206 fromOldConversation:v209];
        }
        uint64_t v203 = [v201 countByEnumeratingWithState:&v210 objects:v310 count:16];
      }
      while (v203);
    }
  }
}

- (void)serverDisconnectedForDataSource:(id)a3 oldConversationsByGroupUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(TUConversationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__TUConversationManager_serverDisconnectedForDataSource_oldConversationsByGroupUUID___block_invoke;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __85__TUConversationManager_serverDisconnectedForDataSource_oldConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Removing conversationsNotBackedByGroupSessions since dataSource got disconnected", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) conversationsNotBackedByGroupSessions];
  [v3 removeAllObjects];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = [*(id *)(a1 + 32) delegateToQueue];
        uint64_t v10 = [v9 objectForKey:v8];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __85__TUConversationManager_serverDisconnectedForDataSource_oldConversationsByGroupUUID___block_invoke_258;
        block[3] = &unk_1E58E6258;
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void **)(a1 + 40);
        void block[4] = v8;
        void block[5] = v11;
        id v15 = v12;
        dispatch_async(v10, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v5);
  }
}

void __85__TUConversationManager_serverDisconnectedForDataSource_oldConversationsByGroupUUID___block_invoke_258(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) serverDisconnectedForConversationManager:*(void *)(a1 + 40)];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = objc_msgSend(*(id *)(a1 + 48), "allValues", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(a1 + 32) conversationManager:*(void *)(a1 + 40) removedActiveConversation:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (void)conversation:(id)a3 participant:(id)a4 addedNotice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TUConversationManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__TUConversationManager_conversation_participant_addedNotice___block_invoke;
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

void __62__TUConversationManager_conversation_participant_addedNotice___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        long long v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__TUConversationManager_conversation_participant_addedNotice___block_invoke_2;
        block[3] = &unk_1E58E7D38;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        id v15 = *(id *)(a1 + 56);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

uint64_t __62__TUConversationManager_conversation_participant_addedNotice___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    return [v3 conversationManager:v4 conversation:v5 participant:v6 addedNotice:v7];
  }
  return result;
}

- (void)activeParticipant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(TUConversationManager *)self collaborationManager];
  [v16 participant:v15 addedHighlightToConversation:v14 highlightIdentifier:v13 oldHighlightIdentifier:v12 isFirstAdd:v7];
}

- (void)activeParticipant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUConversationManager *)self collaborationManager];
  [v11 participant:v10 removedHighlightFromConversation:v9 highlightIdentifier:v8];
}

- (void)conversation:(id)a3 participant:(id)a4 addedCollaborationNotice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TUConversationManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__TUConversationManager_conversation_participant_addedCollaborationNotice___block_invoke;
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

void __75__TUConversationManager_conversation_participant_addedCollaborationNotice___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        BOOL v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __75__TUConversationManager_conversation_participant_addedCollaborationNotice___block_invoke_2;
        block[3] = &unk_1E58E7D38;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        id v15 = *(id *)(a1 + 56);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

uint64_t __75__TUConversationManager_conversation_participant_addedCollaborationNotice___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    return [v3 conversationManager:v4 conversation:v5 participant:v6 addedCollaborationNotice:v7];
  }
  return result;
}

- (void)conversation:(id)a3 collaborationStateChanged:(int64_t)a4 highlightIdentifier:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int64_t v11 = a4;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "TUConversationManager received collaborationStateChanged : %lu", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(TUConversationManager *)self collaborationManager];
  [v9 setCollaborationState:a4 forCollaborationIdentifier:v7];
}

- (void)addedCollaborationDictionary:(id)a3 forConversation:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Received collaboration dictionary: %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [(TUConversationManager *)self collaborationManager];
  id v8 = [v7 collaborationProvider];
  id v9 = (id)[v8 addTemporaryCollaboration:v5];
}

- (void)conversation:(id)a3 addedMembersLocally:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__TUConversationManager_conversation_addedMembersLocally___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__TUConversationManager_conversation_addedMembersLocally___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__TUConversationManager_conversation_addedMembersLocally___block_invoke_2;
        block[3] = &unk_1E58E63D8;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __58__TUConversationManager_conversation_addedMembersLocally___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 conversationManager:v4 conversation:v5 addedMembersLocally:v6];
  }
  return result;
}

- (void)conversation:(id)a3 buzzedMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__TUConversationManager_conversation_buzzedMember___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __51__TUConversationManager_conversation_buzzedMember___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__TUConversationManager_conversation_buzzedMember___block_invoke_2;
        block[3] = &unk_1E58E63D8;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __51__TUConversationManager_conversation_buzzedMember___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 conversationManager:v4 conversation:v5 buzzedMember:v6];
  }
  return result;
}

- (void)conversationsChangedForDataSource:(id)a3 updatedIncomingPendingConversationsByGroupUUID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUConversationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__TUConversationManager_conversationsChangedForDataSource_updatedIncomingPendingConversationsByGroupUUID___block_invoke;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __106__TUConversationManager_conversationsChangedForDataSource_updatedIncomingPendingConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __106__TUConversationManager_conversationsChangedForDataSource_updatedIncomingPendingConversationsByGroupUUID___block_invoke_2;
        block[3] = &unk_1E58E6258;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

void __106__TUConversationManager_conversationsChangedForDataSource_updatedIncomingPendingConversationsByGroupUUID___block_invoke_2(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) allValues];
    [v2 conversationManager:v3 updatedIncomingPendingConversations:v4];
  }
}

- (void)conversationUpdatedMessagesGroupPhoto:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__TUConversationManager_conversationUpdatedMessagesGroupPhoto___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__TUConversationManager_conversationUpdatedMessagesGroupPhoto___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__TUConversationManager_conversationUpdatedMessagesGroupPhoto___block_invoke_2;
        block[3] = &unk_1E58E6258;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

void __63__TUConversationManager_conversationUpdatedMessagesGroupPhoto___block_invoke_2(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = (void *)a1[6];
    id v5 = [v4 messagesGroupPhotoData];
    [v2 conversationManager:v3 conversation:v4 updatedMessagesGroupPhoto:v5];
  }
}

- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUConversationManager_conversation_didChangeStateForActivitySession___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __71__TUConversationManager_conversation_didChangeStateForActivitySession___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__TUConversationManager_conversation_didChangeStateForActivitySession___block_invoke_2;
        block[3] = &unk_1E58E63D8;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __71__TUConversationManager_conversation_didChangeStateForActivitySession___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 conversationManager:v4 conversation:v5 didChangeStateForActivitySession:v6];
  }
  return result;
}

- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__TUConversationManager_conversation_didChangeSceneAssociationForActivitySession___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __82__TUConversationManager_conversation_didChangeSceneAssociationForActivitySession___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__TUConversationManager_conversation_didChangeSceneAssociationForActivitySession___block_invoke_2;
        block[3] = &unk_1E58E63D8;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __82__TUConversationManager_conversation_didChangeSceneAssociationForActivitySession___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 conversationManager:v4 conversation:v5 didChangeSceneAssociationForActivitySession:v6];
  }
  return result;
}

- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__TUConversationManager_conversation_receivedActivitySessionEvent___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__TUConversationManager_conversation_receivedActivitySessionEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__TUConversationManager_conversation_receivedActivitySessionEvent___block_invoke_2;
        block[3] = &unk_1E58E63D8;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __67__TUConversationManager_conversation_receivedActivitySessionEvent___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 conversationManager:v4 conversation:v5 receivedActivitySessionEvent:v6];
  }
  return result;
}

- (void)conversationManagerDataSource:(id)a3 didChangeActivatedConversationLinks:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUConversationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__TUConversationManager_conversationManagerDataSource_didChangeActivatedConversationLinks___block_invoke;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __91__TUConversationManager_conversationManagerDataSource_didChangeActivatedConversationLinks___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegateToQueue];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v2 objectForKey:v7];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __91__TUConversationManager_conversationManagerDataSource_didChangeActivatedConversationLinks___block_invoke_2;
        block[3] = &unk_1E58E6258;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v7;
        void block[5] = v9;
        id v12 = v10;
        dispatch_async(v8, block);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __91__TUConversationManager_conversationManagerDataSource_didChangeActivatedConversationLinks___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 conversationManager:v4 didChangeActivatedLinks:v5];
  }
  return result;
}

- (void)conversationManagerDataSource:(id)a3 messagesGroupDetailsForMessagesGroupId:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__TUConversationManager_conversationManagerDataSource_messagesGroupDetailsForMessagesGroupId_completionHandler___block_invoke;
  block[3] = &unk_1E58E75D0;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __112__TUConversationManager_conversationManagerDataSource_messagesGroupDetailsForMessagesGroupId_completionHandler___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) messagesGroupProvider];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 getMessagesGroupDetailsForGroupId:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __112__TUConversationManager_conversationManagerDataSource_messagesGroupDetailsForMessagesGroupId_completionHandler___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
    }

    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"No messages group details provider available";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v13 = [v11 errorWithDomain:@"TUConversationManagerMessagesErrorDomain" code:1 userInfo:v12];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  uint64_t v6 = [(TUConversationManager *)self dataSource];
  [v6 fetchUpcomingNoticeWithCompletionHandler:v4];
}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "activateConversationNoticeWithActionURL: %@ bundleID %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = [(TUConversationManager *)self dataSource];
  [v9 activateConversationNoticeWithActionURL:v6 bundleIdentifier:v7];
}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "UUID: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(TUConversationManager *)self dataSource];
  [v6 removeConversationNoticeWithUUID:v4];
}

- (void)conversationManagerDataSource:(id)a3 conversation:(id)a4 appLaunchState:(unint64_t)a5 forActivitySession:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = [(TUConversationManager *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__TUConversationManager_conversationManagerDataSource_conversation_appLaunchState_forActivitySession___block_invoke;
  v14[3] = &unk_1E58E6008;
  id v15 = v10;
  id v16 = v9;
  long long v17 = self;
  unint64_t v18 = a5;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, v14);
}

void __102__TUConversationManager_conversationManagerDataSource_conversation_appLaunchState_forActivitySession___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v3;
    __int16 v27 = 2112;
    uint64_t v28 = v4;
    __int16 v29 = 2112;
    uint64_t v30 = v5;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager app launch state %@ session %@ conversation %@", buf, 0x20u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [*(id *)(a1 + 48) delegateToQueue];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        id v11 = [*(id *)(a1 + 48) delegateToQueue];
        id v12 = [v11 objectForKey:v10];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __102__TUConversationManager_conversationManagerDataSource_conversation_appLaunchState_forActivitySession___block_invoke_285;
        block[3] = &unk_1E58E7D60;
        void block[4] = v10;
        int8x16_t v15 = *(int8x16_t *)(a1 + 40);
        id v13 = (id)v15.i64[0];
        int8x16_t v17 = vextq_s8(v15, v15, 8uLL);
        uint64_t v19 = *(void *)(a1 + 56);
        id v18 = *(id *)(a1 + 32);
        dispatch_async(v12, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

uint64_t __102__TUConversationManager_conversationManagerDataSource_conversation_appLaunchState_forActivitySession___block_invoke_285(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v6 = a1[7];
    uint64_t v5 = a1[8];
    uint64_t v7 = a1[6];
    return [v3 conversationManager:v4 conversation:v7 launchStateChanged:v5 forActivitySession:v6];
  }
  return result;
}

- (void)receivedTrackedPendingMember:(id)a3 forConversationLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__TUConversationManager_receivedTrackedPendingMember_forConversationLink___block_invoke;
  block[3] = &unk_1E58E6258;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __74__TUConversationManager_receivedTrackedPendingMember_forConversationLink___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    id v23 = v3;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager receivedTrackedPendingMember %@ forConversationLink %@", buf, 0x16u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [a1[6] delegateToQueue];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
        id v10 = [a1[6] delegateToQueue];
        id v11 = [v10 objectForKey:v9];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__TUConversationManager_receivedTrackedPendingMember_forConversationLink___block_invoke_288;
        block[3] = &unk_1E58E63D8;
        id v12 = a1[6];
        void block[4] = v9;
        void block[5] = v12;
        id v15 = a1[4];
        id v16 = a1[5];
        dispatch_async(v11, block);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

uint64_t __74__TUConversationManager_receivedTrackedPendingMember_forConversationLink___block_invoke_288(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 conversationManager:v4 trackedPendingMember:v5 forConversationLink:v6];
  }
  return result;
}

- (void)conversation:(id)a3 screenSharingChangedForParticipant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__TUConversationManager_conversation_screenSharingChangedForParticipant___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __73__TUConversationManager_conversation_screenSharingChangedForParticipant___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        uint64_t v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __73__TUConversationManager_conversation_screenSharingChangedForParticipant___block_invoke_2;
        block[3] = &unk_1E58E63D8;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v13 = v10;
        id v14 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __73__TUConversationManager_conversation_screenSharingChangedForParticipant___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 conversationManager:v4 conversation:v5 screenSharingChangedForParticipant:v6];
  }
  return result;
}

- (void)remoteScreenShareAttributesChanged:(id)a3 isLocallySharing:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__TUConversationManager_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke;
  block[3] = &unk_1E58E6DB0;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __77__TUConversationManager_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = @"YES";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v4 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v3;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager remoteScreenShareAttributesChanged %@, isLocallySharing: %@", buf, 0x16u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(a1 + 40) delegateToQueue];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
        id v10 = [*(id *)(a1 + 40) delegateToQueue];
        id v11 = [v10 objectForKey:v9];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __77__TUConversationManager_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke_293;
        block[3] = &unk_1E58E6EB8;
        void block[4] = v9;
        int8x16_t v14 = *(int8x16_t *)(a1 + 32);
        id v12 = (id)v14.i64[0];
        int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
        char v17 = *(unsigned char *)(a1 + 48);
        dispatch_async(v11, block);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

uint64_t __77__TUConversationManager_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke_293(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    return [v3 conversationManager:v4 remoteScreenShareAttributesChanged:v5 isLocallySharing:v6];
  }
  return result;
}

- (void)remoteScreenShareEndedWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__TUConversationManager_remoteScreenShareEndedWithReason___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__TUConversationManager_remoteScreenShareEndedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager remoteScreenShareEndedWithReason: %@", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [*(id *)(a1 + 40) delegateToQueue];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 40) delegateToQueue];
        id v10 = [v9 objectForKey:v8];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__TUConversationManager_remoteScreenShareEndedWithReason___block_invoke_296;
        block[3] = &unk_1E58E6258;
        void block[4] = v8;
        int8x16_t v13 = *(int8x16_t *)(a1 + 32);
        id v11 = (id)v13.i64[0];
        int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
        dispatch_async(v10, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

uint64_t __58__TUConversationManager_remoteScreenShareEndedWithReason___block_invoke_296(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 conversationManager:v4 remoteScreenShareEndedWithReason:v5];
  }
  return result;
}

- (void)sharePlayAvailableChanged:(BOOL)a3
{
  uint64_t v5 = [(TUConversationManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__TUConversationManager_sharePlayAvailableChanged___block_invoke;
  v6[3] = &unk_1E58E6280;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __51__TUConversationManager_sharePlayAvailableChanged___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    int v21 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager sharePlayAvailable: %d", buf, 8u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 32) delegateToQueue];
        id v10 = [v9 objectForKey:v8];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__TUConversationManager_sharePlayAvailableChanged___block_invoke_299;
        block[3] = &unk_1E58E6DB0;
        uint64_t v11 = *(void *)(a1 + 32);
        void block[4] = v8;
        void block[5] = v11;
        char v14 = *(unsigned char *)(a1 + 40);
        dispatch_async(v10, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

uint64_t __51__TUConversationManager_sharePlayAvailableChanged___block_invoke_299(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    return [v3 conversationManager:v4 sharePlayAvailableChanged:v5];
  }
  return result;
}

- (void)screenSharingAvailableChanged:(BOOL)a3
{
  uint64_t v5 = [(TUConversationManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__TUConversationManager_screenSharingAvailableChanged___block_invoke;
  v6[3] = &unk_1E58E6280;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __55__TUConversationManager_screenSharingAvailableChanged___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    int v21 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager screenSharingAvailable: %d", buf, 8u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 32) delegateToQueue];
        id v10 = [v9 objectForKey:v8];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__TUConversationManager_screenSharingAvailableChanged___block_invoke_302;
        block[3] = &unk_1E58E6DB0;
        uint64_t v11 = *(void *)(a1 + 32);
        void block[4] = v8;
        void block[5] = v11;
        char v14 = *(unsigned char *)(a1 + 40);
        dispatch_async(v10, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

uint64_t __55__TUConversationManager_screenSharingAvailableChanged___block_invoke_302(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    return [v3 conversationManager:v4 screenSharingAvailableChanged:v5];
  }
  return result;
}

- (void)activityAuthorizationsChangedForDataSource:(id)a3 oldActivityAuthorizedBundleIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUConversationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__TUConversationManager_activityAuthorizationsChangedForDataSource_oldActivityAuthorizedBundleIdentifiers___block_invoke;
  block[3] = &unk_1E58E6258;
  id v12 = v6;
  id v13 = v7;
  char v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __107__TUConversationManager_activityAuthorizationsChangedForDataSource_oldActivityAuthorizedBundleIdentifiers___block_invoke(id *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] activityAuthorizedBundleIdentifiers];
  int v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1[5]];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9];
        uint64_t v11 = [a1[5] objectForKeyedSubscript:v9];
        if ([v11 isEqual:v10]) {
          [v3 removeObjectForKey:v9];
        }
        else {
          [v3 setObject:v10 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [a1[6] delegateToQueue];
  uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        long long v17 = [a1[6] delegateToQueue];
        long long v18 = [v17 objectForKey:v16];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __107__TUConversationManager_activityAuthorizationsChangedForDataSource_oldActivityAuthorizedBundleIdentifiers___block_invoke_2;
        block[3] = &unk_1E58E6258;
        void block[4] = v16;
        id v19 = v3;
        id v20 = a1[6];
        id v23 = v19;
        id v24 = v20;
        dispatch_async(v18, block);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v13);
  }
}

void __107__TUConversationManager_activityAuthorizationsChangedForDataSource_oldActivityAuthorizedBundleIdentifiers___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(a1 + 32), "conversationManager:changedActivityAuthorizationForBundleIdentifier:", *(void *)(a1 + 48), *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (void)collaborationChanged:(id)a3 forConversation:(id)a4 collaborationState:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 collaborationIdentifier];
    uint64_t v12 = [NSNumber numberWithInteger:a5];
    *(_DWORD *)buf = 138412546;
    int v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Notifying delegate of collaboration changed %@ with document state %@", buf, 0x16u);
  }
  uint64_t v13 = [(TUConversationManager *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__TUConversationManager_collaborationChanged_forConversation_collaborationState___block_invoke;
  v16[3] = &unk_1E58E6008;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a5;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v13, v16);
}

void __81__TUConversationManager_collaborationChanged_forConversation_collaborationState___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v18 + 1) + 8 * v5);
        long long v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __81__TUConversationManager_collaborationChanged_forConversation_collaborationState___block_invoke_2;
        block[3] = &unk_1E58E7D60;
        uint64_t v9 = *(void *)(a1 + 32);
        long long v10 = *(void **)(a1 + 40);
        void block[4] = v6;
        void block[5] = v9;
        id v15 = v10;
        id v11 = *(id *)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        id v16 = v11;
        uint64_t v17 = v12;
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }
}

uint64_t __81__TUConversationManager_collaborationChanged_forConversation_collaborationState___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v3 = (void *)a1[4];
      uint64_t v4 = a1[5];
      uint64_t v5 = a1[6];
      uint64_t v6 = a1[7];
      uint64_t v7 = a1[8];
      return [v3 conversationManager:v4 collaborationChanged:v5 forConversation:v6 collaborationState:v7];
    }
  }
  return result;
}

- (id)collaborationForConversation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationManager *)self collaborationManager];
  uint64_t v6 = [v5 collaborationForConversation:v4];

  return v6;
}

- (int64_t)collaborationStateForConversation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationManager *)self collaborationManager];
  int64_t v6 = [v5 collaborationStateForConversation:v4];

  return v6;
}

- (void)setNonSessionBackedConversationCreationQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__TUConversationManager_setNonSessionBackedConversationCreationQueue___block_invoke;
  v7[3] = &unk_1E58E5C08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__TUConversationManager_setNonSessionBackedConversationCreationQueue___block_invoke(uint64_t a1)
{
}

- (void)callPropertiesChanged:(id)a3
{
  id v8 = a3;
  id v4 = [v8 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v8 object];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      [(TUConversationManager *)self updateConversationsNotBackedByGroupSessionWithCall:v6];
    }
  }
}

- (void)updateConversationsNotBackedByGroupSessionWithCall:(id)a3
{
  id v4 = a3;
  if ([(TUConversationManager *)self nonSessionBackedConversationCreationMode])
  {
    uint64_t v5 = [(TUConversationManager *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall___block_invoke;
    v6[3] = &unk_1E58E5C08;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __76__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nonSessionBackedConversationCreationQueue];
  if (v5)
  {
    uint64_t v2 = [*(id *)(a1 + 32) dataSource];
    uint64_t v3 = [v2 conversationsByGroupUUID];
    id v4 = (void *)[v3 copy];

    [*(id *)(a1 + 32) updateConversationsNotBackedByGroupSessionWithCall:*(void *)(a1 + 40) conversationsByGroupUUID:v4 creationQueue:v5];
  }
}

- (void)updateConversationsNotBackedByGroupSessionWithCall:(id)a3 conversationsByGroupUUID:(id)a4 creationQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall_conversationsByGroupUUID_creationQueue___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)a5, block);
}

void __115__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall_conversationsByGroupUUID_creationQueue___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) conversationsNotBackedByGroupSessions];
  uint64_t v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) createConversationForCallNotBackedByGroupSession:*(void *)(a1 + 40)];
  uint64_t v55 = a1;
  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count") + 1);
    if ([v4 state]) {
      [v5 addObject:v4];
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v52 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v65 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "groupUUID", v52);
          id v13 = [v4 groupUUID];
          char v14 = [v12 isEqual:v13];

          if ((v14 & 1) == 0) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v8);
    }

    [*(id *)(v55 + 32) setConversationsNotBackedByGroupSessions:v5];
    id v15 = (void *)[*(id *)(v55 + 48) mutableCopy];
    id v16 = (void *)[*(id *)(v55 + 48) mutableCopy];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v61 != v20) {
            objc_enumerationMutation(v17);
          }
          __int16 v22 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          uint64_t v23 = objc_msgSend(v22, "groupUUID", v52);
          [v15 setObject:v22 forKeyedSubscript:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }
      while (v19);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v24 = [*(id *)(v55 + 32) conversationsNotBackedByGroupSessions];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v56 objects:v75 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v57 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = *(void **)(*((void *)&v56 + 1) + 8 * k);
          long long v30 = objc_msgSend(v29, "groupUUID", v52);
          [v16 setObject:v29 forKeyedSubscript:v30];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v56 objects:v75 count:16];
      }
      while (v26);
    }

    [*(id *)(v55 + 32) conversationsChangedFromOldConversationsByGroupUUID:v15 newConversationsByGroupUUID:v16];
    goto LABEL_28;
  }
  long long v31 = objc_opt_class();
  long long v32 = [*(id *)(a1 + 40) uniqueProxyIdentifierUUID];
  id v5 = [v31 conversationWithUUID:v32 fromConversations:v3];

  if ([*(id *)(a1 + 40) isConversation] && v5)
  {
    v33 = TUDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v80 = v34;
      _os_log_impl(&dword_19C496000, v33, OS_LOG_TYPE_DEFAULT, "Adding call %@ to calls pending upgrade to session-backed architecture", buf, 0xCu);
    }

    uint64_t v35 = [*(id *)(a1 + 32) callsNotBackedByGroupSessionsPendingUpgrade];
    [v35 addObject:*(void *)(a1 + 40)];

    uint64_t v36 = *(void **)(a1 + 32);
    id v15 = [v36 dataSource];
    id v16 = [*(id *)(a1 + 32) dataSource];
    uint64_t v37 = [v16 conversationsByGroupUUID];
    [v36 conversationsChangedForDataSource:v15 conversationsByGroupUUID:v37 oldConversationsByGroupUUID:*(void *)(a1 + 48)];

    goto LABEL_34;
  }
  if (([*(id *)(a1 + 40) isVideo] & 1) == 0
    && [*(id *)(a1 + 32) nonSessionBackedConversationCreationMode] == 1)
  {
    long long v38 = objc_opt_class();
    long long v39 = [*(id *)(a1 + 40) uniqueProxyIdentifierUUID];
    char v40 = [*(id *)(a1 + 32) conversationsNotBackedByGroupSessions];
    id v15 = [v38 conversationWithUUID:v39 fromConversations:v40];

    if (!v15) {
      goto LABEL_35;
    }
    uint64_t v41 = TUDefaultLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [v15 UUID];
      *(_DWORD *)buf = 138412290;
      uint64_t v80 = v42;
      _os_log_impl(&dword_19C496000, v41, OS_LOG_TYPE_DEFAULT, "Call downgraded to isVideo=NO, but sessionCreationMode=.faceTimeVideo, and we already made a fake TUConversation, removing it now: %@", buf, 0xCu);
    }
    id v43 = [*(id *)(a1 + 32) conversationsNotBackedByGroupSessions];
    [v43 removeObject:v15];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v16 = [*(id *)(a1 + 32) delegateToQueue];
    uint64_t v44 = [v16 countByEnumeratingWithState:&v71 objects:v78 count:16];
    if (!v44)
    {
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    uint64_t v45 = v44;
    uint64_t v54 = *(void *)v72;
    id v52 = v3;
    uint64_t v53 = v69;
    do
    {
      for (uint64_t m = 0; m != v45; ++m)
      {
        if (*(void *)v72 != v54) {
          objc_enumerationMutation(v16);
        }
        uint64_t v47 = *(void *)(*((void *)&v71 + 1) + 8 * m);
        uint64_t v48 = objc_msgSend(*(id *)(a1 + 32), "delegateToQueue", v52, v53);
        uint64_t v49 = [v48 objectForKey:v47];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        v69[0] = __115__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall_conversationsByGroupUUID_creationQueue___block_invoke_311;
        v69[1] = &unk_1E58E6258;
        uint64_t v50 = *(void *)(a1 + 32);
        v69[2] = v47;
        v69[3] = v50;
        id v51 = v15;
        id v70 = v51;
        dispatch_async(v49, block);
      }
      uint64_t v45 = [v16 countByEnumeratingWithState:&v71 objects:v78 count:16];
    }
    while (v45);
    id v15 = v51;
LABEL_28:
    uint64_t v3 = v52;
    goto LABEL_34;
  }
LABEL_36:
}

uint64_t __115__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall_conversationsByGroupUUID_creationQueue___block_invoke_311(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 conversationManager:v4 removedActiveConversation:v5];
  }
  return result;
}

- (void)pruneConversationsPendingUpgradeInConversationsWithGroupUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TUConversationManager *)self nonSessionBackedConversationCreationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUConversationManager *)self callPendingUpgradeInConversationsWithGroupUUID:v4];

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 uniqueProxyIdentifierUUID];
  uint64_t v9 = [(TUConversationManager *)self conversationsNotBackedByGroupSessions];
  id v10 = [v7 conversationWithUUID:v8 fromConversations:v9];

  if (v10)
  {
    id v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Stopping tracking conversation not backed by session %@ since it is now backed by session", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v12 = [(TUConversationManager *)self conversationsNotBackedByGroupSessions];
    [v12 removeObject:v10];

    id v13 = [(TUConversationManager *)self callsNotBackedByGroupSessionsPendingUpgrade];
    [v13 removeObject:v6];
  }
}

- (id)callPendingUpgradeInConversationsWithGroupUUID:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v4 = [(TUConversationManager *)self nonSessionBackedConversationCreationQueue];
  dispatch_assert_queue_V2(v4);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(TUConversationManager *)self callsNotBackedByGroupSessionsPendingUpgrade];
  uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    id v22 = 0;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v7 = [v20 allValues];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              id v13 = [(id)objc_opt_class() remoteMembersForCall:v6];
              if ([v12 isRepresentedByRemoteMembers:v13 andLink:0])
              {
                int v14 = [v12 isVideo];
                int v15 = [v6 isVideo];

                if (v14 == v15)
                {
                  id v16 = v6;

                  id v22 = v16;
                  goto LABEL_17;
                }
              }
              else
              {
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }
LABEL_17:
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)createConversationForCallNotBackedByGroupSession:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TUConversationManager *)self nonSessionBackedConversationCreationQueue];
  dispatch_assert_queue_V2(v5);

  if (!v4
    || ([v4 isConversation] & 1) != 0
    || ([v4 isVideo] & 1) == 0
    && [(TUConversationManager *)self nonSessionBackedConversationCreationMode] == 1)
  {
    goto LABEL_3;
  }
  uint64_t v7 = [v4 provider];
  if (([v7 isFaceTimeProvider] & 1) == 0)
  {
    uint64_t v8 = [v4 provider];
    if ([v8 isSuperboxProvider])
    {

      goto LABEL_9;
    }
    unint64_t v34 = [(TUConversationManager *)self nonSessionBackedConversationCreationMode];

    if (v34 == 3) {
      goto LABEL_10;
    }
LABEL_3:
    id v6 = 0;
    goto LABEL_24;
  }
LABEL_9:

LABEL_10:
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v4 uniqueProxyIdentifierUUID];
  id v11 = [(TUConversationManager *)self conversationsNotBackedByGroupSessions];
  uint64_t v12 = [v9 conversationWithUUID:v10 fromConversations:v11];
  id v13 = [v12 groupUUID];

  int v14 = [v4 provider];
  if ([v14 isFaceTimeProvider]) {
    +[TUConversationProvider faceTimeProvider];
  }
  else {
  int v15 = +[TUConversationProvider unknownProvider];
  }

  id v16 = [TUMutableConversation alloc];
  id v17 = [v4 uniqueProxyIdentifierUUID];
  if (v13)
  {
    uint64_t v18 = [(TUConversation *)v16 initWithUUID:v17 groupUUID:v13 provider:v15];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v18 = [(TUConversation *)v16 initWithUUID:v17 groupUUID:v19 provider:v15];
  }
  -[TUConversation setVideo:](v18, "setVideo:", [v4 isVideo]);
  -[TUConversation setState:](v18, "setState:", [(id)objc_opt_class() conversationStateForCall:v4]);
  id v20 = [(id)objc_opt_class() remoteMembersForCall:v4];
  [(TUConversation *)v18 setRemoteMembers:v20];

  uint64_t v21 = objc_opt_class();
  id v22 = [(TUConversation *)v18 remoteMembers];
  long long v23 = [v21 activeRemoteParticipantsForCall:v4 remoteMembers:v22];
  [(TUConversation *)v18 setActiveRemoteParticipants:v23];

  -[TUConversation setAudioEnabled:](v18, "setAudioEnabled:", [v4 isUplinkMuted]);
  -[TUConversation setVideoEnabled:](v18, "setVideoEnabled:", [v4 isSendingVideo]);
  long long v24 = [MEMORY[0x1E4F1CAD0] set];
  [(TUConversation *)v18 setActivitySessions:v24];

  [(TUConversation *)v18 setOneToOneModeEnabled:1];
  [(TUConversation *)v18 setBackedByGroupSession:0];
  -[TUConversation setAvcSessionToken:](v18, "setAvcSessionToken:", [v4 videoStreamToken]);
  if ([v4 isVideo]) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 1;
  }
  [(TUConversation *)v18 setAvMode:v25];
  long long v26 = [v4 localSenderIdentity];
  long long v27 = [v26 handle];

  if (v27)
  {
    long long v28 = [TUConversationMember alloc];
    long long v29 = [v4 localSenderIdentity];
    long long v30 = [v29 handle];
    long long v31 = [(TUConversationMember *)v28 initWithHandle:v30];
    [(TUConversation *)v18 setLocalMember:v31];
  }
  long long v32 = TUDefaultLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 138412546;
    uint64_t v36 = v18;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl(&dword_19C496000, v32, OS_LOG_TYPE_DEFAULT, "Created conversation: %@ for call: %@", (uint8_t *)&v35, 0x16u);
  }

  id v6 = (void *)[(TUMutableConversation *)v18 copy];
LABEL_24:

  return v6;
}

+ (int64_t)conversationStateForCall:(id)a3
{
  id v3 = a3;
  switch([v3 status])
  {
    case 1u:
      BOOL v4 = [v3 isConnected] == 0;
      uint64_t v5 = 2;
      goto LABEL_5;
    case 2u:
      int64_t v6 = 3;
      break;
    case 3u:
    case 4u:
      BOOL v4 = [v3 isConnecting] == 0;
      uint64_t v5 = 1;
LABEL_5:
      if (v4) {
        int64_t v6 = v5;
      }
      else {
        int64_t v6 = v5 + 1;
      }
      break;
    case 5u:
      int64_t v6 = 4;
      break;
    default:
      int64_t v6 = 0;
      break;
  }

  return v6;
}

+ (id)activeRemoteParticipantsForCall:(id)a3 remoteMembers:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = [v5 status];
  if (v7 <= 4 && ((1 << v7) & 0x16) != 0)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v13 = [TUConversationParticipant alloc];
          int v14 = [v12 handle];
          int v15 = [(TUConversationParticipant *)v13 initWithIdentifier:0 handle:v14];

          -[TUConversationParticipant setStreamToken:](v15, "setStreamToken:", [v5 videoStreamToken]);
          [(TUConversationParticipant *)v15 setAudioEnabled:1];
          -[TUConversationParticipant setVideoEnabled:](v15, "setVideoEnabled:", [v5 isVideo]);
          if ([v5 isVideo]) {
            uint64_t v16 = 2;
          }
          else {
            uint64_t v16 = 1;
          }
          [(TUConversationParticipant *)v15 setAudioVideoMode:v16];
          id v17 = [v5 providerContext];
          uint64_t v18 = [v17 objectForKeyedSubscript:@"TUCallFaceTimeRemoteIDSDestinationKey"];
          [(TUConversationParticipant *)v15 setActiveIDSDestination:v18];

          uint64_t v19 = objc_alloc_init(TUConversationParticipantCapabilities);
          id v20 = [v5 providerContext];
          uint64_t v21 = [v20 objectForKeyedSubscript:@"TUCallFaceTimeRemoteMomentsAvailableKey"];
          -[TUConversationParticipantCapabilities setMomentsAvailable:](v19, "setMomentsAvailable:", [v21 BOOLValue]);

          [(TUConversationParticipant *)v15 setCapabilities:v19];
          [v25 addObject:v15];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }

    id v6 = v23;
  }

  return v25;
}

+ (id)conversationWithUUID:(id)a3 fromConversations:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "UUID", (void)v14);
        int v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (TUConversation)handoffEligibleConversation
{
  return (TUConversation *)[(TUConversationManager *)self handoffEligibleConversationForEligibility:0];
}

- (id)handoffEligibleConversationForEligibility:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(TUConversationManager *)self dataSource];
  id v7 = [v6 conversationsByGroupUUID];
  uint64_t v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v21;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v8);
      }
      long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
      if ([v14 state]) {
        goto LABEL_18;
      }
      if (v5
        && ([v5 conversationGroupUUID],
            id v7 = objc_claimAutoreleasedReturnValue(),
            [v14 groupUUID],
            id v3 = objc_claimAutoreleasedReturnValue(),
            [v7 isEqual:v3]))
      {
      }
      else
      {
        long long v15 = [v14 handoffEligibility];

        if (v5)
        {
        }
        if (!v15) {
          goto LABEL_14;
        }
      }
      id v16 = v14;

      id v11 = v16;
LABEL_14:
      if (v10 == ++v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        long long v17 = v11;
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
  }
  id v11 = 0;
LABEL_18:
  long long v17 = 0;
LABEL_19:

  id v18 = v17;
  return v18;
}

- (TUConversation)avLessConversation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(TUConversationManager *)self dataSource];
  id v3 = [v2 conversationsByGroupUUID];
  BOOL v4 = [v3 allValues];

  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![v8 avMode] && (objc_msgSend(v8, "state") == 3 || objc_msgSend(v8, "state") == 2))
        {
          id v5 = v8;
          goto LABEL_13;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (TUConversation *)v5;
}

- (id)joinRequestForApplicableConversationWithHandoffEligibility:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationManager *)self handoffEligibleConversationForEligibility:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4)
    {
      id v7 = v4;
    }
    else
    {
      id v7 = [v5 handoffEligibility];
    }
    uint64_t v9 = v7;
    uint64_t v8 = [[TUJoinConversationRequest alloc] initWithConversation:v6 originatingUIType:43];
    -[TUJoinConversationRequest setAvMode:](v8, "setAvMode:", [v6 avMode]);
    long long v10 = [v6 presentationContext];
    -[TUJoinConversationRequest setPresentationMode:](v8, "setPresentationMode:", [v10 mode]);

    if ([v6 avMode] == 2) {
      uint64_t v11 = [v9 isSendingVideo];
    }
    else {
      uint64_t v11 = 0;
    }
    [(TUJoinConversationRequest *)v8 setVideoEnabled:v11];
    -[TUJoinConversationRequest setUplinkMuted:](v8, "setUplinkMuted:", [v9 isUplinkMuted]);
    BOOL v12 = [v6 avMode] != 1 && objc_msgSend(v6, "resolvedAudioVideoMode") == 2;
    [(TUJoinConversationRequest *)v8 setWantsStagingArea:v12];
    long long v13 = [v9 association];
    long long v14 = (void *)[v13 copy];
    [(TUJoinConversationRequest *)v8 setParticipantAssociation:v14];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (OS_dispatch_queue)nonSessionBackedConversationCreationQueue
{
  return self->_nonSessionBackedConversationCreationQueue;
}

- (NSMutableSet)callsNotBackedByGroupSessionsPendingUpgrade
{
  return self->_callsNotBackedByGroupSessionsPendingUpgrade;
}

- (void)setCallsNotBackedByGroupSessionsPendingUpgrade:(id)a3
{
}

- (void)setConversationsNotBackedByGroupSessions:(id)a3
{
}

- (BOOL)shouldCreateConversationsForCallsNotBackedByGroupSessions
{
  return self->_shouldCreateConversationsForCallsNotBackedByGroupSessions;
}

- (unint64_t)nonSessionBackedConversationCreationMode
{
  return self->_nonSessionBackedConversationCreationMode;
}

- (void)setNonSessionBackedConversationCreationMode:(unint64_t)a3
{
  self->_nonSessionBackedConversationCreationMode = a3;
}

- (TUCollaborationManager)collaborationManager
{
  return self->_collaborationManager;
}

- (void)setCollaborationManager:(id)a3
{
}

- (TUConversationMessagesGroupProviding)messagesGroupProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagesGroupProvider);

  return (TUConversationMessagesGroupProviding *)WeakRetained;
}

- (id)overriddenCallForGroupUUID
{
  return self->_overriddenCallForGroupUUID;
}

- (void)setOverriddenCallForGroupUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overriddenCallForGroupUUID, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_messagesGroupProvider);
  objc_storeStrong((id *)&self->_collaborationManager, 0);
  objc_storeStrong((id *)&self->_conversationsNotBackedByGroupSessions, 0);
  objc_storeStrong((id *)&self->_callsNotBackedByGroupSessionsPendingUpgrade, 0);
  objc_storeStrong((id *)&self->_nonSessionBackedConversationCreationQueue, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reactionsController, 0);

  objc_storeStrong((id *)&self->_mediaController, 0);
}

- (void)addCollaborationDictionary:(void *)a1 forConversation:fromMe:.cold.1(void *a1)
{
  size_t v1 = [a1 UUID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_19C496000, v2, v3, "Cannot add nil collaboration dictionary to conversation UUID %@", v4, v5, v6, v7, v8);
}

- (void)addCollaborationIdentifier:(void *)a1 forConversation:.cold.1(void *a1)
{
  size_t v1 = [a1 UUID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_19C496000, v2, v3, "Cannot add nil collaboration identifier to conversation UUID %@", v4, v5, v6, v7, v8);
}

- (void)addCollaboration:(uint64_t)a1 forConversation:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint8_t v8 = [a2 UUID];
  OUTLINED_FUNCTION_1_3(&dword_19C496000, v2, v3, "Cannot add collaboration %@ to conversation UUID %@ because the collaboration identifier is nil", v4, v5, v6, v7, 2u);
}

- (void)removeCollaborationIdentifier:(void *)a1 forConversation:.cold.1(void *a1)
{
  size_t v1 = [a1 UUID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_19C496000, v2, v3, "Cannot remove nil collaboration identifier from conversation UUID %@", v4, v5, v6, v7, v8);
}

- (void)updateURLWithDugongTokenIfNeeded:collaboration:handle:completion:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  size_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL LocalIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOS(NSString *__strong, dispatch_qos_class_t, __strong dispatch_queue_t, __strong IMSPIMessageQueryCallback)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUConversationManager.m", 52, @"%s", dlerror());

  __break(1u);
}

void __90__TUConversationManager_updateURLWithDugongTokenIfNeeded_collaboration_handle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Returning collaboration URL without Dugong token because could not construct updated url from components %@", v2, v3, v4, v5, v6);
}

- (void)openCollaborationWithIdentifier:forConversation:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not find a collaboration highlight for identifier %@", v2, v3, v4, v5, v6);
}

void __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) URL];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_19C496000, v2, v3, "Failed to open collaboration url: %@ error: %@", v4, v5, v6, v7, v8);
}

void __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_19C496000, log, OS_LOG_TYPE_FAULT, "Something has gone very wrong and we have no link and no error", v1, 2u);
}

void __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Link generation failed with error %@", v2, v3, v4, v5, v6);
}

void __112__TUConversationManager_conversationManagerDataSource_messagesGroupDetailsForMessagesGroupId_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end