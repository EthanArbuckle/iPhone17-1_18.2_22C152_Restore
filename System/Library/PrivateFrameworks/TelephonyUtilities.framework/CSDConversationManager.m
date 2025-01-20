@interface CSDConversationManager
- (BOOL)_isActiveRemoteMemberForHandle:(id)a3 conversation:(id)a4;
- (BOOL)_linksEnabled;
- (BOOL)_shouldNotifyDelegatesOfMessage:(id)a3 localHandleAdded:(BOOL)a4 isFromStorage:(BOOL)a5;
- (BOOL)_shouldRingForIncomingCallWithHandle:(id)a3 conversation:(id)a4 isFromPendingMessage:(BOOL)a5 isOldMessage:(BOOL)a6 isLetMeInApproved:(BOOL)a7;
- (BOOL)_shouldSkipManualApprovalForHandle:(id)a3 conversation:(id)a4 responseKeyData:(id)a5;
- (BOOL)allActiveConversationParticipantsSupportSharePlay;
- (BOOL)broadcastData:(id)a3 onConversation:(id)a4;
- (BOOL)broadcastData:(id)a3 onConversation:(id)a4 additionalOptions:(id)a5;
- (BOOL)broadcastFile:(id)a3 onConversation:(id)a4 additionalOptions:(id)a5;
- (BOOL)conversationContainsScreenShareRequest:(id)a3 localRequest:(BOOL)a4 requestHandle:(id)a5;
- (BOOL)isConversationWithUUIDRedirectingAudio:(id)a3;
- (BOOL)isConversationWithUUIDRelaying:(id)a3;
- (BOOL)isConversationWithUUIDScreening:(id)a3;
- (BOOL)isHandleLocalPseudonym:(id)a3 provider:(id)a4;
- (BOOL)isHandleStringLocalPseudonym:(id)a3;
- (BOOL)isHandleStringLocalPseudonym:(id)a3 provider:(id)a4;
- (BOOL)isScreenSharingAvailable;
- (BOOL)isScreenSharingInitiationAvailable;
- (BOOL)isSharePlayAvailable;
- (BOOL)isValidLocalHandle:(id)a3;
- (BOOL)isValidLocalHandle:(id)a3 activeLocalHandles:(id)a4 provider:(id)a5;
- (BOOL)isValidLocalHandle:(id)a3 forProvider:(id)a4;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5 fromMember:(id)a6;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5 fromMember:(id)a6 additionalOptions:(id)a7 isBlobResponse:(BOOL)a8 callback:(id)a9;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toHandle:(id)a5;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toHandle:(id)a5 isBlobResponse:(BOOL)a6;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toMember:(id)a5;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toMember:(id)a5 additionalOptions:(id)a6;
- (BOOL)sendMessagesForCreatedOrChangedLink:(id)a3 conversation:(id)a4 messageType:(int)a5;
- (BOOL)sendMessagesForInvalidatedLink:(id)a3;
- (BOOL)shouldAcceptMembershipUpdateFromHandle:(id)a3 joinContext:(id)a4 participantUpdate:(id)a5 existingConversation:(id)a6;
- (BOOL)shouldAcceptMessageFromHandle:(id)a3 messageContext:(id)a4 message:(id)a5 existingConversation:(id)a6;
- (BOOL)shouldCreatePendingChatForMessageType:(int64_t)a3 fromHandle:(id)a4;
- (BOOL)shouldIgnoreMessageForConversation:(id)a3;
- (BOOL)verifyActivitySessionOriginatorFromHandle:(id)a3 message:(id)a4;
- (BOOL)verifyAllLightweightmembersAssociated:(id)a3 remoteMembers:(id)a4;
- (BOOL)verifyBlobResponseFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5;
- (BOOL)verifyEndorseRepresentsMemberFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5;
- (BOOL)verifyGroupSessionParticipantUpdateAllowedFromHandle:(id)a3 participantUpdate:(id)a4 message:(id)a5 existingConversation:(id)a6 lightweightMembers:(id)a7;
- (BOOL)verifyKickMemberPermittedFromHandle:(id)a3 message:(id)a4;
- (BOOL)verifyLightweightMessageTypeFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5;
- (BOOL)verifyMessageIntentKeyFromContext:(id)a3 message:(id)a4;
- (CPActivityAuthorizationManager)activityAuthorizationManager;
- (CPApplicationController)cpApplicationController;
- (CPSystemStateObserver)sharePlaySystemStateObserver;
- (CSDConduitIDSProxy)messageProxy;
- (CSDConversationInvitationResolving)invitationResolver;
- (CSDConversationLinkManager)linkManager;
- (CSDConversationManager)init;
- (CSDConversationManager)initWithQueue:(id)a3 reportingController:(id)a4 persistenceController:(id)a5 linkManager:(id)a6 cpApplicationController:(id)a7 invitationResolver:(id)a8 pendingMembershipTracker:(id)a9 featureFlags:(id)a10 applicationPolicyManager:(id)a11;
- (CSDConversationManager)initWithQueue:(id)a3 reportingController:(id)a4 persistenceController:(id)a5 linkManager:(id)a6 invitationResolver:(id)a7 pendingMembershipTracker:(id)a8 featureFlags:(id)a9;
- (CSDConversationManager)initWithReportingController:(id)a3 cpApplicationController:(id)a4 invitationResolver:(id)a5;
- (CSDConversationNoticeManager)conversationNoticeManger;
- (CSDConversationPersistenceController)persistenceController;
- (CSDConversationProviderManager)conversationProviderManager;
- (CSDDeviceLockStateObserver)lockStateObserver;
- (CSDFileTransferController)fileTransferController;
- (CSDIDSService)service;
- (CSDParticipantUpdateSanitizer)participantUpdateSanitizer;
- (CSDPendingMembershipTracker)pendingMembershipTracker;
- (CSDReportingController)reportingController;
- (CSDScreenSharingActivityManager)screenSharingActivityManager;
- (CSDSecureImageTranscoder)imageTranscoder;
- (CSDSharedConversationServerBag)serverBag;
- (CSDVoucherManager)voucherManager;
- (FTDeviceSupport)deviceSupport;
- (NSDictionary)activityAuthorizedBundleIdentifierState;
- (NSDictionary)conversationsByGroupUUID;
- (NSDictionary)conversationsByUUID;
- (NSDictionary)incomingPendingConversationsByGroupUUID;
- (NSDictionary)pseudonymsByCallUUID;
- (NSMapTable)delegateToQueue;
- (NSMapTable)observerToQueue;
- (NSMutableDictionary)mutableConversationsByUUID;
- (NSMutableDictionary)mutableConversationsRequestingUpgradeWithPreferences;
- (NSMutableDictionary)mutablePendingConversationsByPseudonym;
- (NSMutableDictionary)mutablePseudonymsByCallUUID;
- (NSMutableDictionary)mutablePseudonymsByRequestIdentifiers;
- (NSMutableDictionary)mutableSendDataCallbacksByRequestIdentifiers;
- (NSMutableDictionary)outIdentifierToConversationInfo;
- (NSMutableDictionary)resourceTransferCallbacks;
- (NSMutableDictionary)screenCaptureQueue;
- (NSMutableSet)incomingPendingMessageGUIDs;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)pendingConversationCleanupTimer;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (_TtC13callservicesd28CSDCollaborationStateManager)collaborationStateManager;
- (id)_getActivatedLinkWithHandle:(id)a3 updateGroupUUID:(id)a4 updateInvitedHandles:(id)a5;
- (id)_inactiveRemoteMemberForHandle:(id)a3 conversation:(id)a4;
- (id)_incomingPendingConversationsByGroupUUID;
- (id)_kickedOrRejectedMemberForHandle:(id)a3 conversation:(id)a4;
- (id)_removePendingConversationWithPseudonym:(id)a3;
- (id)_removePendingConversationsWithTemporaryGroupUUIDIfNecessary:(id)a3;
- (id)activatedConversationLinksWithError:(id *)a3;
- (id)activeApprovedConversationWithLink:(id)a3;
- (id)activeConversation;
- (id)activeLocalHandles;
- (id)activeLocalHandlesForProvider;
- (id)callerIDForLocalMember:(id)a3;
- (id)callerIDForLocalMember:(id)a3 forProvider:(id)a4;
- (id)callerIDHandleForSenderIdentityUUID:(id)a3 callerID:(id)a4;
- (id)conversationCreationBlock;
- (id)conversationLinkForGroupUUID:(id)a3;
- (id)conversationLinkForPseudonym:(id)a3;
- (id)conversationRepresentedByRemoteMembers:(id)a3 andLink:(id)a4;
- (id)conversationWithGroupUUID:(id)a3;
- (id)conversationWithGroupUUID:(id)a3 andProvider:(id)a4;
- (id)conversationWithGroupUUID:(id)a3 orMemberIdentifiers:(id)a4 orRemoteMembers:(id)a5 andLink:(id)a6 andVideo:(BOOL)a7;
- (id)conversationWithGroupUUID:(id)a3 orRepresentedByRemoteMembers:(id)a4 andLink:(id)a5;
- (id)conversationsByUUIDIncludingStorageConversations:(BOOL)a3;
- (id)createActivitySession:(id)a3 onConversation:(id)a4 fromHandle:(id)a5;
- (id)createCPActivitySessionForActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (id)createConversationIfNecessaryWithUUID:(id)a3 groupUUID:(id)a4 messagesGroupUUID:(id)a5 locallyCreated:(BOOL)a6 localMember:(id)a7 remoteMembers:(id)a8 pendingMembers:(id)a9 otherInvitedHandles:(id)a10 remotePushTokens:(id)a11 lightweightMembers:(id)a12 link:(id)a13 activity:(id)a14 avMode:(unint64_t)a15 presentationMode:(unint64_t)a16 provider:(id)a17 screenSharingRequest:(id)a18;
- (id)createConversationWithUUID:(id)a3 groupUUID:(id)a4 messagesGroupUUID:(id)a5 locallyCreated:(BOOL)a6 localMember:(id)a7 initiator:(id)a8 remoteMembers:(id)a9 pendingMembers:(id)a10 otherInvitedHandles:(id)a11 remotePushTokens:(id)a12 lightweightMembers:(id)a13 activity:(id)a14 link:(id)a15 report:(id)a16 fromStorage:(BOOL)a17 avMode:(unint64_t)a18 presentationMode:(unint64_t)a19 provider:(id)a20 screenSharingRequest:(id)a21 isInitiator:(BOOL)a22 isOldMessage:(BOOL)a23;
- (id)deletedConversationLinksWithError:(id *)a3;
- (id)findConversationLinkMatchingPseudonym:(id)a3;
- (id)findOrCreateConversationWithGroupUUID:(id)a3 messagesGroupUUID:(id)a4 remoteMembers:(id)a5 otherInvitedHandles:(id)a6 localMember:(id)a7 remotePushTokens:(id)a8 link:(id)a9 activity:(id)a10 avMode:(unint64_t)a11 presentationMode:(unint64_t)a12 conversationProvider:(id)a13 screenSharingRequest:(id)a14;
- (id)getPersonalNicknameBlock;
- (id)groupSessionProviderCreationBlock;
- (id)initiatePendingConversationForLink:(id)a3 localMember:(id)a4 isVideoEnabled:(BOOL)a5;
- (id)isConversationRelayPreferred;
- (id)isHandleEligibleForScreenSharingRequestsBlock;
- (id)localCallerID;
- (id)localCallerIDForProvider;
- (id)localMemberForProvider:(id)a3 fromHandle:(id)a4 members:(id)a5 lightweightMembers:(id)a6 activeLocalHandles:(id)a7;
- (id)lockdownModeEnabled;
- (id)memberExistsForParticipantDestination:(id)a3 groupSessionParticipantUpdate:(id)a4;
- (id)memberExistsForParticipantDestination:(id)a3 members:(id)a4;
- (id)notifyPendingMembershipTrackerOfDelegatedMember;
- (id)pendingConversationUUIDWithPseudonym:(id)a3;
- (id)pendingConversationWithPseudonym:(id)a3;
- (id)pickInitiatorFromActiveParticipants:(id)a3 forUpdate:(id)a4;
- (id)pushTokenForSelf;
- (id)removePendingConversationWithPseudonym:(id)a3;
- (id)sendDataBlock;
- (id)senderIdentitiesBlock;
- (id)senderIdentityUUIDForCallerIDHandle:(id)a3;
- (id)temporaryFilePath;
- (int)presentationStateForConversationWithUUID:(id)a3;
- (void)_displaySharePlayUnableToStartWithMessage:(id)a3;
- (void)_leaveConversation:(id)a3;
- (void)_leaveConversation:(id)a3 withContext:(id)a4;
- (void)_runCallbackIfNecessaryForMessage:(id)a3;
- (void)_sendDelegationMessageTo:(id)a3 conversation:(id)a4 link:(id)a5 transactionUUID:(id)a6 forMember:(id)a7 withMessage:(id)a8;
- (void)_service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7 attemptCount:(unint64_t)a8;
- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4;
- (void)activateLink:(id)a3 completionHandler:(id)a4;
- (void)addAliasesToConversationContainer:(id)a3 forBundleIdentifier:(id)a4;
- (void)addCollaborationDictionary:(id)a3 forConversationWithUUID:(id)a4 fromMe:(BOOL)a5;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4;
- (void)addHighlightIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6;
- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5;
- (void)addInvitedMemberHandlesFromAddedRemoteMembers:(id)a3 toConversationLink:(id)a4;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)addPseudonym:(id)a3 forCallUUID:(id)a4;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversationWithUUID:(id)a5;
- (void)addRemoteMembers:(id)a3 toConversationWithUUID:(id)a4;
- (void)addScreenSharingType:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)applicationPolicyManager:(id)a3 authorizationChangedForBundleIdentifier:(id)a4;
- (void)approvePendingMember:(id)a3 forConversationUUID:(id)a4;
- (void)beginListeningOnService:(id)a3;
- (void)broadcastImageForSession:(id)a3 onConversation:(id)a4;
- (void)broadcastLightweightEndorsementForAddedMembers:(id)a3 onConversation:(id)a4;
- (void)buzzMember:(id)a3 conversationUUID:(id)a4;
- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversationUUID:(id)a4;
- (void)cancelPreviouslySentScreenShareRequests:(id)a3;
- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4;
- (void)cleanupExpiredPendingConversations;
- (void)collaborationStateChanged:(int64_t)a3 forCollaborationIdentifier:(id)a4 onConversationUUID:(id)a5;
- (void)conversation:(id)a3 activityChangedOnSession:(id)a4;
- (void)conversation:(id)a3 activitySessionChanged:(id)a4;
- (void)conversation:(id)a3 activitySessionRemoved:(id)a4 userOriginated:(BOOL)a5;
- (void)conversation:(id)a3 addedActiveParticipant:(id)a4;
- (void)conversation:(id)a3 addedMembers:(id)a4 triggeredLocally:(BOOL)a5;
- (void)conversation:(id)a3 appLaunchState:(unint64_t)a4 forActivitySession:(id)a5;
- (void)conversation:(id)a3 changedBytesOfDataUsed:(int64_t)a4;
- (void)conversation:(id)a3 didChangeLocalParticipant:(id)a4 broadcastActivitySession:(BOOL)a5;
- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4;
- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4;
- (void)conversation:(id)a3 failedWithContext:(id)a4;
- (void)conversation:(id)a3 mediaPrioritiesChangedForParticipant:(id)a4;
- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5;
- (void)conversation:(id)a3 participantDidStopReacting:(id)a4;
- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4;
- (void)conversation:(id)a3 remoteMembersChanged:(id)a4;
- (void)conversation:(id)a3 removedActiveParticipant:(id)a4 withLeaveReason:(unint64_t)a5;
- (void)conversation:(id)a3 requestBlobRecoveryForParticipantDestination:(id)a4 completion:(id)a5;
- (void)conversation:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6;
- (void)conversation:(id)a3 screenShareAttributesDidChange:(id)a4;
- (void)conversation:(id)a3 screenShareAttributesSelected:(id)a4;
- (void)conversation:(id)a3 screenShareAttributesUpdated:(id)a4;
- (void)conversation:(id)a3 sendDeclineMessageToParticipantDestination:(id)a4;
- (void)conversation:(id)a3 sendResourceAtURL:(id)a4 toParticipants:(id)a5 metadata:(id)a6 activitySessionUUID:(id)a7 completion:(id)a8;
- (void)conversation:(id)a3 updatedActiveParticipant:(id)a4;
- (void)conversation:(id)a3 updatedActiveParticipantWithScreenSharing:(id)a4;
- (void)conversationChanged:(id)a3;
- (void)conversationConnectionDidStart:(id)a3;
- (void)conversationDidStopScreenCapture:(id)a3;
- (void)conversationDidTriggerJoin:(id)a3;
- (void)conversationInvalidated:(id)a3;
- (void)createActivitySession:(id)a3 onConversationWithUUID:(id)a4 withCompletion:(id)a5;
- (void)denyScreenShareRequestFrom:(id)a3 screenShareRequest:(id)a4 conversation:(id)a5;
- (void)displaySharePlayUnableToStartAlert;
- (void)endActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)enqueueMessageRetryAttemptForMessageID:(id)a3 message:(id)a4 attemptCount:(unint64_t)a5 messageProcessingBlock:(id)a6;
- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3;
- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7;
- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 successfully:(BOOL)a5;
- (void)generateAllInactiveLinks;
- (void)generateLinkForConversationUUID:(id)a3 completionHandler:(id)a4;
- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5;
- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4;
- (void)getInactiveLinkWithCompletionHandler:(id)a3;
- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3;
- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5;
- (void)handleConversation:(id)a3 addHighlight:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 participantUpdateMessage:(id)a4 fromNormalizedHandle:(id)a5;
- (void)handleConversation:(id)a3 receivedActivitySession:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 receivedBlobRecoveryRequest:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 receivedBlobRecoveryResponse:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 receivedEndorsementForMember:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 registerMessagesGroupUUIDMessage:(id)a4 fromNormalizedHandle:(id)a5;
- (void)handleConversation:(id)a3 removeActivitySession:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 removeHighlight:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 screenShareRequest:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 screenShareResponse:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 updateActivity:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 updateActivityImage:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 updateGuestMode:(id)a4 fromHandle:(id)a5;
- (void)handleConversationHandoffRecommendationChangedNotification:(id)a3;
- (void)handleConversationHandoffRouteIdentifierChangedNotification:(id)a3;
- (void)handleDelegatedPendingMemberIfNecessary:(id)a3 conversation:(id)a4 groupUUID:(id)a5 fromHandle:(id)a6 transactionUUID:(id)a7;
- (void)handleEncryptedLetMeInRequest:(id)a3 fromHandle:(id)a4 context:(id)a5;
- (void)handleEncryptedLetMeInResponse:(id)a3 fromHandle:(id)a4 context:(id)a5;
- (void)handleEncryptedMessageWithin:(id)a3 fromHandle:(id)a4 context:(id)a5;
- (void)handleParticipantWithIdentifier:(unint64_t)a3 leftConversationWithGroupUUID:(id)a4 fromHandle:(id)a5 withGroupSessionUpdate:(id)a6;
- (void)handleParticipants:(id)a3 joinedConversationWithUpdate:(id)a4 joinContext:(id)a5 fromHandle:(id)a6 isFromPendingMessage:(BOOL)a7;
- (void)handleReceivedLMIDelegateMessage:(id)a3 fromHandle:(id)a4;
- (void)handleReceivedLetMeInRequest:(id)a3 toPseudonym:(id)a4 fromHandle:(id)a5 responseKeyData:(id)a6 dateInitiated:(id)a7;
- (void)handleReceivedLetMeInResponse:(id)a3 pendingConversation:(id)a4 fromHandle:(id)a5;
- (void)handleReceivedLinkCreatedOrChangedMessage:(id)a3 fromHandle:(id)a4;
- (void)handleReceivedLinkInvalidatedMessage:(id)a3 fromHandle:(id)a4;
- (void)handleReceivedUpdateJoinedMetadataMessage:(id)a3 fromHandle:(id)a4;
- (void)handleRemovedLinkDescriptors:(id)a3;
- (void)includeMetricsReport:(id)a3 onConversationWithUUID:(id)a4;
- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5;
- (void)joinConversationWithRequest:(id)a3;
- (void)joinExistingConversationWithUUID:(id)a3 context:(id)a4;
- (void)kickMember:(id)a3 conversationUUID:(id)a4;
- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6;
- (void)leaveActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)leaveAllConversations;
- (void)leaveConversationWithUUID:(id)a3;
- (void)leaveConversationWithUUID:(id)a3 withContext:(id)a4;
- (void)linkManager:(id)a3 removedLinkDescriptorsFromIDSSignal:(id)a4;
- (void)linkManager:(id)a3 removedLinkDescriptorsFromValidityCheck:(id)a4;
- (void)linkManager:(id)a3 updatedLinkDescriptorsFromIDSSignal:(id)a4;
- (void)linkManager:(id)a3 updatedLinkDescriptorsFromSync:(id)a4;
- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4;
- (void)markCollaborationWithIdentifierOpened:(id)a3 forConversationUUID:(id)a4;
- (void)maybeAddComplementaryAssociationVoucherFor:(id)a3 toLocalMemberOf:(id)a4 completion:(id)a5;
- (void)noticeManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6;
- (void)notifyDelegateOfHighlightAddedForConversation:(id)a3 highlightIdentifier:(id)a4 oldHighlightIdentifier:(id)a5 byParticipant:(id)a6 isFirstAdd:(BOOL)a7;
- (void)notifyDelegateOfHighlightRemovedFromConversation:(id)a3 highlightIdentifier:(id)a4 byParticipant:(id)a5;
- (void)notifyDelegatesOfAVModeChanged:(unint64_t)a3 toAVMode:(unint64_t)a4 forConversation:(id)a5;
- (void)notifyDelegatesOfChangedLink:(id)a3 conversation:(id)a4;
- (void)notifyDelegatesOfChangedLinkDescriptors:(id)a3;
- (void)notifyDelegatesOfInvalidLinkForPendingConversation:(id)a3;
- (void)notifyDelegatesOfLetMeInRejectedForPendingConversation:(id)a3;
- (void)notifyDelegatesOfMessage:(id)a3 fromHandle:(id)a4 forConversation:(id)a5 withUpdate:(id)a6;
- (void)notifyDelegatesOfNewConversation:(id)a3 fromHandle:(id)a4;
- (void)notifyDelegatesOfRemoteScreenShareAttributes:(id)a3 isLocallySharing:(BOOL)a4;
- (void)notifyDelegatesOfRemoteScreenShareEndedWithReason:(id)a3;
- (void)notifyDelegatesOfRemovedConversationWithUUID:(id)a3;
- (void)notifyDelegatesOfTrackedPendingMember:(id)a3 forConversationLink:(id)a4;
- (void)notifyDelegatesOfUpdatePendingConversations;
- (void)pendingMembershipTracker:(id)a3 didTrack:(id)a4 forGroupUUID:(id)a5;
- (void)pendingMembershipTracker:(id)a3 willAdd:(id)a4 to:(id)a5 using:(id)a6;
- (void)pendingMembershipTracker:(id)a3 willNotAdd:(id)a4 to:(id)a5 using:(id)a6;
- (void)postEndEventForSession:(id)a3 originator:(id)a4 conversation:(id)a5;
- (void)postSessionStartedForSession:(id)a3 originator:(id)a4 conversation:(id)a5;
- (void)prepareAdditionOfActiveParticipant:(id)a3 toInvitedMembersForLinkOnConversation:(id)a4;
- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4;
- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3 onConversationWithUUID:(id)a4;
- (void)processGroupSessionParticipantUpdate:(id)a3 context:(id)a4;
- (void)processJoinUpdate:(id)a3 fromHandle:(id)a4 senderCorrelationIdentifier:(id)a5 isFromPendingMessage:(BOOL)a6;
- (void)processParticipantDataUpdate:(id)a3 fromHandle:(id)a4;
- (void)processProxiedGroupUpdate:(id)a3;
- (void)processProxiedMessage:(id)a3 fromID:(id)a4 context:(id)a5;
- (void)processProxiedResource:(id)a3 metadata:(id)a4 fromID:(id)a5 context:(id)a6;
- (void)processUpdateMembersUpdate:(id)a3 fromHandle:(id)a4;
- (void)processUpdatedNickname:(id)a3 forHandle:(id)a4 conversationUUID:(id)a5;
- (void)recoverLinksForPseudonyms:(id)a3;
- (void)refreshActiveParticipantsList;
- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3;
- (void)rejectPendingMember:(id)a3 forConversationUUID:(id)a4;
- (void)removeAllConversations;
- (void)removeAllPendingConversations;
- (void)removeConversationNoticeWithUUID:(id)a3;
- (void)removeConversationWithUUID:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeHighlightIdentifier:(id)a3 forConversationUUID:(id)a4;
- (void)removeLink:(id)a3 reason:(int64_t)a4;
- (void)removeLink:(id)a3 reason:(int64_t)a4 withConversation:(id)a5;
- (void)removeNonIndefiniteLinks;
- (void)removePendingMemberMatchingActiveParticipant:(id)a3 conversation:(id)a4;
- (void)removePseudonym:(id)a3 forCallUUID:(id)a4;
- (void)removeRemoteMembers:(id)a3 fromConversationWithUUID:(id)a4;
- (void)removeScreenShareRequestFromParticipant:(id)a3 conversation:(id)a4 screenShareContext:(id)a5;
- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6;
- (void)renewLinkIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)requestActivityAuthorizationForApplicationWithBundleIdentifier:(id)a3 overrides:(id)a4 completionHandler:(id)a5;
- (void)requestLetMeInApprovalForPseudonym:(id)a3;
- (void)requestParticipant:(id)a3 toCancelScreenShareRequest:(id)a4 conversation:(id)a5;
- (void)requestParticipant:(id)a3 toScreenShareWithRequest:(id)a4 conversation:(id)a5;
- (void)requestParticipantToShareScreen:(id)a3 forConversationUUID:(id)a4;
- (void)resetActivitySessionSceneAssociationsForBundleID:(id)a3;
- (void)retreiveActiveConversations;
- (void)revokeBackgroundPipAuthorizationsForBundleID:(id)a3;
- (void)sanitizeAndProcessParticipantUpdate:(id)a3 context:(id)a4;
- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3;
- (void)screenSharingActivityManager:(id)a3 invalidatedSessionWithReason:(id)a4 wasLocallySharing:(BOOL)a5;
- (void)screenSharingActivityManager:(id)a3 receivedUpdatedRemoteAttributes:(id)a4 isLocallySharing:(BOOL)a5;
- (void)sendDataForScreenShareMessage:(id)a3 toParticipant:(id)a4 conversation:(id)a5;
- (void)sendDelegationMessageTo:(id)a3 conversation:(id)a4 link:(id)a5 transactionUUID:(id)a6 forMember:(id)a7;
- (void)sendDelegationResponseMessageTo:(id)a3 conversation:(id)a4 transactionUUID:(id)a5 forMember:(id)a6 withResponse:(BOOL)a7;
- (void)sendHighlightMessageForConversation:(id)a3 highlightIdentifier:(id)a4 type:(int)a5;
- (void)sendInvitationMessageToMember:(id)a3 forConversation:(id)a4 includeAllAttributes:(BOOL)a5 invitationPreferences:(id)a6 additionalOptions:(id)a7;
- (void)sendLetMeInResponseToPendingMember:(id)a3 forConversation:(id)a4 usingResponseKeyData:(id)a5 approved:(BOOL)a6 callback:(id)a7;
- (void)sendMessage:(id)a3 forConversation:(id)a4 withActivitySession:(id)a5;
- (void)sendMessage:(id)a3 forConversation:(id)a4 withActivitySession:(id)a5 additionalOptions:(id)a6;
- (void)sendVideoUpgradeMessageforConversationWithUUID:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantDataUpdate:(id)a5;
- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5 context:(id)a6;
- (void)setActiveLocalHandles:(id)a3;
- (void)setActiveLocalHandlesForProvider:(id)a3;
- (void)setActivityAuthorization:(BOOL)a3 forBundleID:(id)a4;
- (void)setActivityAuthorizationManager:(id)a3;
- (void)setAudioInjectionAllowed:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setAudioPaused:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setAutoSharePlayEnabled:(BOOL)a3;
- (void)setCallProviderManager:(id)a3;
- (void)setCollaborationStateManager:(id)a3;
- (void)setConversationCreationBlock:(id)a3;
- (void)setConversationLink:(id)a3 forConversation:(id)a4 replyToCompletionHandler:(id)a5;
- (void)setConversationProviderManager:(id)a3;
- (void)setDelegateToQueue:(id)a3;
- (void)setDeviceSupport:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsOnConversationWithUUID:(id)a4;
- (void)setFeatureFlags:(id)a3;
- (void)setFileTransferController:(id)a3;
- (void)setGetPersonalNicknameBlock:(id)a3;
- (void)setGridDisplayMode:(unint64_t)a3 forConversationWithUUID:(id)a4;
- (void)setGroupSessionProviderCreationBlock:(id)a3;
- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversationUUID:(id)a4;
- (void)setImageTranscoder:(id)a3;
- (void)setIncomingPendingMessageGUIDs:(id)a3;
- (void)setInvitationResolver:(id)a3;
- (void)setIsConversationRelayPreferred:(id)a3;
- (void)setIsHandleEligibleForScreenSharingRequestsBlock:(id)a3;
- (void)setLinkManager:(id)a3;
- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5;
- (void)setLocalCallerID:(id)a3;
- (void)setLocalCallerIDForProvider:(id)a3;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4 presentationMode:(unint64_t)a5;
- (void)setLockdownModeEnabled:(id)a3;
- (void)setMessageProxy:(id)a3;
- (void)setMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4;
- (void)setNotifyPendingMembershipTrackerOfDelegatedMember:(id)a3;
- (void)setObserverToQueue:(id)a3;
- (void)setOutIdentifierToConversationInfo:(id)a3;
- (void)setParticipantUpdateSanitizer:(id)a3;
- (void)setPendingConversationCleanupTimer:(id)a3;
- (void)setPendingMembershipTracker:(id)a3;
- (void)setPresentationRect:(CGRect)a3 forConversationWithUUID:(id)a4;
- (void)setPresentationState:(int)a3 forConversationWithUUID:(id)a4;
- (void)setRelaying:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setResourceTransferCallbacks:(id)a3;
- (void)setScreenEnabled:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setScreenEnabled:(BOOL)a3 screenShareAttributes:(id)a4 forConversationWithUUID:(id)a5;
- (void)setScreenShareAttributes:(id)a3 forConversationWithUUID:(id)a4;
- (void)setScreening:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setSendDataBlock:(id)a3;
- (void)setSenderIdentitiesBlock:(id)a3;
- (void)setServerBag:(id)a3;
- (void)setService:(id)a3;
- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4;
- (void)setSharePlaySystemStateObserver:(id)a3;
- (void)setUplinkMuted:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setUplinkMuted:(BOOL)a3 forPendingConversationWithUUID:(id)a4;
- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5;
- (void)setVideo:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setVideoEnabled:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setVideoEnabled:(BOOL)a3 forPendingConversationWithUUID:(id)a4;
- (void)setVideoPaused:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setVoucherManager:(id)a3;
- (void)setupPendingConversationCleanupTimer;
- (void)startAudioForConversationWithUUID:(id)a3;
- (void)startTrackingCollaborationWithIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6 completionHandler:(id)a7;
- (void)systemStateObserver:(id)a3 screenSharingAllowedStateChanged:(BOOL)a4;
- (void)systemStateObserver:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4;
- (void)updateConversationHandoffEligibility:(id)a3;
- (void)updateLetMeInRequestState:(int64_t)a3 addLink:(id)a4 forConversationWithUUID:(id)a5;
- (void)updateLocalMemberNickname:(id)a3 conversationUUID:(id)a4;
- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)updateMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4;
- (void)updateMessagesGroupPhotoOnConversationWithUUID:(id)a3;
- (void)updateParticipantPresentationContexts:(id)a3 onConversationWithUUID:(id)a4;
@end

@implementation CSDConversationManager

- (CSDConversationManager)initWithReportingController:(id)a3 cpApplicationController:(id)a4 invitationResolver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.conversationmanager", 0);
  v12 = [[CSDConversationPersistenceController alloc] initWithQueue:v11];
  v13 = objc_alloc_init(CSDConversationLinkManager);
  v14 = objc_alloc_init(CSDPendingMembershipTracker);
  id v15 = objc_alloc_init((Class)TUFeatureFlags);
  v16 = [(CSDConversationManager *)self initWithQueue:v11 reportingController:v10 persistenceController:v12 linkManager:v13 cpApplicationController:v9 invitationResolver:v8 pendingMembershipTracker:v14 featureFlags:v15 applicationPolicyManager:0];

  return v16;
}

- (CSDConversationManager)init
{
  return 0;
}

- (CSDConversationManager)initWithQueue:(id)a3 reportingController:(id)a4 persistenceController:(id)a5 linkManager:(id)a6 invitationResolver:(id)a7 pendingMembershipTracker:(id)a8 featureFlags:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  if ([v16 expanseEnabled]) {
    id v23 = objc_alloc_init((Class)CPApplicationController);
  }
  else {
    id v23 = 0;
  }
  v24 = +[CPApplicationPolicyManager sharedInstance];
  v25 = [(CSDConversationManager *)self initWithQueue:v22 reportingController:v21 persistenceController:v20 linkManager:v19 cpApplicationController:v23 invitationResolver:v18 pendingMembershipTracker:v17 featureFlags:v16 applicationPolicyManager:v24];

  return v25;
}

- (CSDConversationManager)initWithQueue:(id)a3 reportingController:(id)a4 persistenceController:(id)a5 linkManager:(id)a6 cpApplicationController:(id)a7 invitationResolver:(id)a8 pendingMembershipTracker:(id)a9 featureFlags:(id)a10 applicationPolicyManager:(id)a11
{
  id v115 = a3;
  id v107 = a4;
  id v108 = a5;
  id v109 = a6;
  id v110 = a7;
  id v111 = a8;
  id v112 = a9;
  id v113 = a10;
  id v116 = a11;
  v140.receiver = self;
  v140.super_class = (Class)CSDConversationManager;
  id v18 = [(CSDConversationManager *)&v140 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_reportingController, a4);
    objc_storeStrong((id *)&v19->_linkManager, a6);
    [(CSDConversationLinkManager *)v19->_linkManager setDelegate:v19];
    objc_storeStrong((id *)&v19->_featureFlags, a10);
    objc_storeStrong((id *)&v19->_invitationResolver, a8);
    objc_storeStrong((id *)&v19->_pendingMembershipTracker, a9);
    [(CSDPendingMembershipTracker *)v19->_pendingMembershipTracker setMessenger:v19];
    [(CSDPendingMembershipTracker *)v19->_pendingMembershipTracker setDelegate:v19];
    id v20 = objc_alloc_init(CSDSharedConversationServerBag);
    serverBag = v19->_serverBag;
    v19->_serverBag = v20;

    id v22 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    callProviderManager = v19->_callProviderManager;
    v19->_callProviderManager = v22;

    uint64_t v24 = +[NSMutableDictionary dictionary];
    mutableConversationsByUUID = v19->_mutableConversationsByUUID;
    v19->_mutableConversationsByUUID = (NSMutableDictionary *)v24;

    uint64_t v26 = +[NSMutableDictionary dictionary];
    mutablePendingConversationsByPseudonym = v19->_mutablePendingConversationsByPseudonym;
    v19->_mutablePendingConversationsByPseudonym = (NSMutableDictionary *)v26;

    uint64_t v28 = +[NSMutableDictionary dictionary];
    mutablePseudonymsByCallUUID = v19->_mutablePseudonymsByCallUUID;
    v19->_mutablePseudonymsByCallUUID = (NSMutableDictionary *)v28;

    uint64_t v30 = +[NSMutableDictionary dictionary];
    mutablePseudonymsByRequestIdentifiers = v19->_mutablePseudonymsByRequestIdentifiers;
    v19->_mutablePseudonymsByRequestIdentifiers = (NSMutableDictionary *)v30;

    uint64_t v32 = +[NSMutableDictionary dictionary];
    mutableSendDataCallbacksByRequestIdentifiers = v19->_mutableSendDataCallbacksByRequestIdentifiers;
    v19->_mutableSendDataCallbacksByRequestIdentifiers = (NSMutableDictionary *)v32;

    uint64_t v34 = +[NSMapTable weakToStrongObjectsMapTable];
    delegateToQueue = v19->_delegateToQueue;
    v19->_delegateToQueue = (NSMapTable *)v34;

    uint64_t v36 = +[NSMutableDictionary dictionary];
    mutableConversationsRequestingUpgradeWithPreferences = v19->_mutableConversationsRequestingUpgradeWithPreferences;
    v19->_mutableConversationsRequestingUpgradeWithPreferences = (NSMutableDictionary *)v36;

    uint64_t v38 = +[NSMutableDictionary dictionary];
    screenCaptureQueue = v19->_screenCaptureQueue;
    v19->_screenCaptureQueue = (NSMutableDictionary *)v38;

    uint64_t v40 = +[NSMutableDictionary dictionary];
    outIdentifierToConversationInfo = v19->_outIdentifierToConversationInfo;
    v19->_outIdentifierToConversationInfo = (NSMutableDictionary *)v40;

    v42 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    incomingPendingMessageGUIDs = v19->_incomingPendingMessageGUIDs;
    v19->_incomingPendingMessageGUIDs = v42;

    v44 = [[CSDConversationNoticeManager alloc] initWithDelegate:v19 queue:v19->_queue];
    conversationNoticeManger = v19->_conversationNoticeManger;
    v19->_conversationNoticeManger = v44;

    uint64_t v46 = +[CSDConversationProviderManager sharedInstance];
    conversationProviderManager = v19->_conversationProviderManager;
    v19->_conversationProviderManager = (CSDConversationProviderManager *)v46;

    id lockdownModeEnabled = v19->_lockdownModeEnabled;
    v19->_id lockdownModeEnabled = &stru_100507630;

    id isConversationRelayPreferred = v19->_isConversationRelayPreferred;
    v19->_id isConversationRelayPreferred = &stru_100507650;

    int v50 = TUSimulatedModeEnabled();
    v51 = &off_100502C58;
    if (!v50) {
      v51 = off_100502BD0;
    }
    uint64_t v52 = [(__objc2_class *)*v51 sharedInstance];
    service = v19->_service;
    v19->_service = (CSDIDSService *)v52;

    v54 = sub_100008DCC();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = v19->_service;
      *(_DWORD *)buf = 138412290;
      v142 = v55;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Initializing CSDConversationManager for service: %@", buf, 0xCu);
    }

    v56 = [CSDVoucherManagerImpl alloc];
    v57 = [(CSDIDSService *)v19->_service service];
    v58 = [(CSDVoucherManagerImpl *)v56 initWithIdsService:v57];
    voucherManager = v19->_voucherManager;
    v19->_voucherManager = (CSDVoucherManager *)v58;

    v60 = [[CSDParticipantUpdateSanitizerImpl alloc] initWithVoucherManager:v19->_voucherManager];
    participantUpdateSanitizer = v19->_participantUpdateSanitizer;
    v19->_participantUpdateSanitizer = (CSDParticipantUpdateSanitizer *)v60;

    if (v116)
    {
      id v114 = v116;
    }
    else
    {
      id v114 = +[CPApplicationPolicyManager sharedInstance];
    }
    uint64_t v62 = +[NSMapTable weakToStrongObjectsMapTable];
    observerToQueue = v19->_observerToQueue;
    v19->_observerToQueue = (NSMapTable *)v62;

    objc_storeStrong((id *)&v19->_cpApplicationController, a7);
    v64 = (CPSystemStateObserver *)[objc_alloc((Class)CPSystemStateObserver) initWithQueue:v19->_queue];
    sharePlaySystemStateObserver = v19->_sharePlaySystemStateObserver;
    v19->_sharePlaySystemStateObserver = v64;

    [(CPSystemStateObserver *)v19->_sharePlaySystemStateObserver addObserver:v19 withQueue:v19->_queue];
    v66 = (CPActivityAuthorizationManager *)[objc_alloc((Class)CPActivityAuthorizationManager) initWithDataSource:v19 queue:v19->_queue appPolicyManager:v114];
    activityAuthorizationManager = v19->_activityAuthorizationManager;
    v19->_activityAuthorizationManager = v66;

    v68 = [[CSDScreenSharingActivityManager alloc] initWithFeatureFlags:v19->_featureFlags];
    screenSharingActivityManager = v19->_screenSharingActivityManager;
    v19->_screenSharingActivityManager = v68;

    [(CSDScreenSharingActivityManager *)v19->_screenSharingActivityManager setDelegate:v19];
    [v114 addDelegate:v19 withQueue:v19->_queue];
    v70 = [(CSDConversationManager *)v19 featureFlags];
    unsigned int v71 = [v70 sharePlayInFaceTimeCanvasEnabled];

    if (v71)
    {
      v72 = [[CSDFileTransferController alloc] initWithService:v19->_service];
      fileTransferController = v19->_fileTransferController;
      v19->_fileTransferController = v72;

      [(CSDFileTransferController *)v19->_fileTransferController setDelegate:v19];
    }
    uint64_t v74 = +[NSMutableDictionary dictionary];
    resourceTransferCallbacks = v19->_resourceTransferCallbacks;
    v19->_resourceTransferCallbacks = (NSMutableDictionary *)v74;

    v76 = [[_TtC13callservicesd28CSDCollaborationStateManager alloc] initWithQueue:v115];
    collaborationStateManager = v19->_collaborationStateManager;
    v19->_collaborationStateManager = v76;

    [(CSDCollaborationStateManager *)v19->_collaborationStateManager setDelegate:v19];
    v78 = objc_alloc_init(CSDSecureImageTranscoder);
    imageTranscoder = v19->_imageTranscoder;
    v19->_imageTranscoder = v78;

    objc_initWeak((id *)buf, v19);
    queue = v19->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F6E10;
    block[3] = &unk_100507678;
    v81 = v19;
    v138 = v81;
    objc_copyWeak(&v139, (id *)buf);
    dispatch_sync(queue, block);
    objc_storeStrong((id *)&v81->_persistenceController, a5);
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472;
    v135[2] = sub_1000F7034;
    v135[3] = &unk_1005076A0;
    objc_copyWeak(&v136, (id *)buf);
    v82 = objc_retainBlock(v135);
    id groupSessionProviderCreationBlock = v81->_groupSessionProviderCreationBlock;
    v81->_id groupSessionProviderCreationBlock = v82;

    id getPersonalNicknameBlock = v81->_getPersonalNicknameBlock;
    v81->_id getPersonalNicknameBlock = &stru_1005076E0;

    v133[0] = _NSConcreteStackBlock;
    v133[1] = 3221225472;
    v133[2] = sub_1000F71C8;
    v133[3] = &unk_100507708;
    objc_copyWeak(&v134, (id *)buf);
    v85 = objc_retainBlock(v133);
    id conversationCreationBlock = v81->_conversationCreationBlock;
    v81->_id conversationCreationBlock = v85;

    v131[0] = _NSConcreteStackBlock;
    v131[1] = 3221225472;
    v131[2] = sub_1000F748C;
    v131[3] = &unk_100507730;
    objc_copyWeak(&v132, (id *)buf);
    v87 = objc_retainBlock(v131);
    id sendDataBlock = v81->_sendDataBlock;
    v81->_id sendDataBlock = v87;

    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = sub_1000F7A9C;
    v129[3] = &unk_100507758;
    objc_copyWeak(&v130, (id *)buf);
    v89 = objc_retainBlock(v129);
    id notifyPendingMembershipTrackerOfDelegatedMember = v81->_notifyPendingMembershipTrackerOfDelegatedMember;
    v81->_id notifyPendingMembershipTrackerOfDelegatedMember = v89;

    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = sub_1000F7B70;
    v127[3] = &unk_100507780;
    objc_copyWeak(&v128, (id *)buf);
    v91 = objc_retainBlock(v127);
    id activeLocalHandlesForProvider = v81->_activeLocalHandlesForProvider;
    v81->_id activeLocalHandlesForProvider = v91;

    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_1000F7DAC;
    v125[3] = &unk_1005077A8;
    objc_copyWeak(&v126, (id *)buf);
    v93 = objc_retainBlock(v125);
    id activeLocalHandles = v81->_activeLocalHandles;
    v81->_id activeLocalHandles = v93;

    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472;
    v123[2] = sub_1000F7E3C;
    v123[3] = &unk_1005077D0;
    objc_copyWeak(&v124, (id *)buf);
    v95 = objc_retainBlock(v123);
    id localCallerID = v81->_localCallerID;
    v81->_id localCallerID = v95;

    v121[0] = _NSConcreteStackBlock;
    v121[1] = 3221225472;
    v121[2] = sub_1000F7F08;
    v121[3] = &unk_1005077F8;
    objc_copyWeak(&v122, (id *)buf);
    v97 = objc_retainBlock(v121);
    id senderIdentitiesBlock = v81->_senderIdentitiesBlock;
    v81->_id senderIdentitiesBlock = v97;

    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_1000F7F7C;
    v119[3] = &unk_100507820;
    objc_copyWeak(&v120, (id *)buf);
    v99 = objc_retainBlock(v119);
    id localCallerIDForProvider = v81->_localCallerIDForProvider;
    v81->_id localCallerIDForProvider = v99;

    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_1000F81C8;
    v117[3] = &unk_100507848;
    objc_copyWeak(&v118, (id *)buf);
    v101 = objc_retainBlock(v117);
    id isHandleEligibleForScreenSharingRequestsBlock = v81->_isHandleEligibleForScreenSharingRequestsBlock;
    v81->_id isHandleEligibleForScreenSharingRequestsBlock = v101;

    v103 = +[NSNotificationCenter defaultCenter];
    [v103 addObserver:v81 selector:"handleConversationHandoffRecommendationChangedNotification:" name:@"CSDUserActivityConversationHandoffRecommendationChangedNotification" object:0];

    v104 = +[NSNotificationCenter defaultCenter];
    v105 = +[CSDHandoffAudioController routeIdentifierChangedNotification];
    [v104 addObserver:v81 selector:"handleConversationHandoffRouteIdentifierChangedNotification:" name:v105 object:0];

    objc_destroyWeak(&v118);
    objc_destroyWeak(&v120);
    objc_destroyWeak(&v122);
    objc_destroyWeak(&v124);
    objc_destroyWeak(&v126);
    objc_destroyWeak(&v128);
    objc_destroyWeak(&v130);
    objc_destroyWeak(&v132);
    objc_destroyWeak(&v134);
    objc_destroyWeak(&v136);
    objc_destroyWeak(&v139);

    objc_destroyWeak((id *)buf);
  }

  return v19;
}

- (BOOL)_shouldNotifyDelegatesOfMessage:(id)a3 localHandleAdded:(BOOL)a4 isFromStorage:(BOOL)a5
{
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    if ([v7 type]) {
      BOOL v9 = !a5;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  if ([v8 type] == 3) {
    BOOL v10 = a4 && v9;
  }
  else {
    BOOL v10 = v9;
  }

  return v10;
}

- (BOOL)_shouldRingForIncomingCallWithHandle:(id)a3 conversation:(id)a4 isFromPendingMessage:(BOOL)a5 isOldMessage:(BOOL)a6 isLetMeInApproved:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v11 provider];
  unsigned int v14 = [(CSDConversationManager *)self isValidLocalHandle:v12 forProvider:v13];

  id v15 = [(CSDConversationManager *)self invitationResolver];
  id v16 = [v11 tuConversation];
  id v17 = [v11 localMember];
  id v18 = [v17 handle];
  unsigned int v19 = [v15 shouldShowInvitationRingingUIForConversation:v16 handle:v18];

  if ((v14 & 1) != 0 || !v19)
  {
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v22 = @"NO";
      if (v14) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      if (v19) {
        CFStringRef v22 = @"YES";
      }
      int v31 = 138412546;
      CFStringRef v32 = v23;
      __int16 v33 = 2112;
      CFStringRef v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "isValidLocalHandle: %@, shouldShowInvitationRingingUIForConversation: %@", (uint8_t *)&v31, 0x16u);
    }
    LOBYTE(v20) = 0;
  }
  else
  {
    int v20 = !v8;
    if (v7 && !v8)
    {
      if ([v11 isOneToOneModeEnabled])
      {
        int v20 = 0;
      }
      else
      {
        uint64_t v24 = [v11 activeParticipantDestinationsByIdentifier];
        int v20 = [v24 count] != 0;
      }
    }
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v25 = @"NO";
      if (v20) {
        CFStringRef v26 = @"YES";
      }
      else {
        CFStringRef v26 = @"NO";
      }
      if (v8) {
        CFStringRef v27 = @"YES";
      }
      else {
        CFStringRef v27 = @"NO";
      }
      if (v7) {
        CFStringRef v28 = @"YES";
      }
      else {
        CFStringRef v28 = @"NO";
      }
      if ([v11 isOneToOneModeEnabled]) {
        CFStringRef v25 = @"YES";
      }
      v29 = [v11 activeParticipantDestinationsByIdentifier];
      int v31 = 138413314;
      CFStringRef v32 = v26;
      __int16 v33 = 2112;
      CFStringRef v34 = v27;
      __int16 v35 = 2112;
      CFStringRef v36 = v28;
      __int16 v37 = 2112;
      CFStringRef v38 = v25;
      __int16 v39 = 2048;
      id v40 = [v29 count];
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "shouldRingForIncomingCall: %@, isFromPendingMessage: %@, isOldMessage: %@, isOneToOneModeEnabled: %@, activeParticipantDestinationsByIdentifier.count: %ld", (uint8_t *)&v31, 0x34u);
    }
  }

  return v20;
}

- (id)_kickedOrRejectedMemberForHandle:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v9 = [v7 kickedMembers];
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v33 != v12) {
        objc_enumerationMutation(v9);
      }
      unsigned int v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
      id v15 = [v14 handle];
      unsigned int v16 = [v15 isEquivalentToHandle:v6];

      if (v16) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v24 = sub_100008DCC();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    CFStringRef v25 = [v7 kickedMembers];
    *(_DWORD *)buf = 138412546;
    id v38 = v6;
    __int16 v39 = 2112;
    id v40 = v25;
    CFStringRef v26 = "handle %@ has already been kicked, conversation.kickedMembers: %@";
  }
  else
  {
LABEL_9:

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    BOOL v9 = objc_msgSend(v7, "rejectedMembers", 0);
    id v17 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (!v17)
    {
LABEL_17:
      id v23 = 0;
      goto LABEL_24;
    }
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
LABEL_11:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v29 != v19) {
        objc_enumerationMutation(v9);
      }
      unsigned int v14 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
      id v21 = [v14 handle];
      unsigned int v22 = [v21 isEquivalentToHandle:v6];

      if (v22) {
        break;
      }
      if (v18 == (id)++v20)
      {
        id v18 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v18) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
    uint64_t v24 = sub_100008DCC();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    CFStringRef v25 = [v7 rejectedMembers];
    *(_DWORD *)buf = 138412546;
    id v38 = v6;
    __int16 v39 = 2112;
    id v40 = v25;
    CFStringRef v26 = "handle %@ has already been rejected, conversation.rejectedMembers: %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);

LABEL_23:
  id v23 = v14;
LABEL_24:

  return v23;
}

- (BOOL)_isActiveRemoteMemberForHandle:(id)a3 conversation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = [v6 remoteMembers];
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    uint64_t v23 = *(void *)v30;
    id v24 = v6;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "handle", v23);
        unsigned int v13 = [v12 isEquivalentToHandle:v5];

        if (v13)
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          unsigned int v14 = [v6 activeRemoteParticipants];
          id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v26;
            while (2)
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v26 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) handle];
                unsigned __int8 v20 = [v19 isEquivalentToHandle:v5];

                if (v20)
                {

                  BOOL v21 = 1;
                  id v6 = v24;
                  goto LABEL_21;
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          uint64_t v10 = v23;
          id v6 = v24;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      BOOL v21 = 0;
    }
    while (v9);
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_21:

  return v21;
}

- (id)_inactiveRemoteMemberForHandle:(id)a3 conversation:(id)a4
{
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a4, "remoteMembers", 0);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 handle];
        unsigned __int8 v12 = [v11 isEquivalentToHandle:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_shouldSkipManualApprovalForHandle:(id)a3 conversation:(id)a4 responseKeyData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = [(CSDConversationManager *)self _kickedOrRejectedMemberForHandle:v8 conversation:v9];
  if (v12)
  {
    unsigned int v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Let me in requestor %@ is a handle that has already been kicked/rejected", buf, 0xCu);
    }

    [(CSDConversationManager *)self sendLetMeInResponseToPendingMember:v12 forConversation:v9 usingResponseKeyData:v10 approved:0 callback:0];
LABEL_9:
    BOOL v16 = 1;
    goto LABEL_10;
  }
  if ([(CSDConversationManager *)self _isActiveRemoteMemberForHandle:v8 conversation:v9])
  {
    long long v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v9 remoteMembers];
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      long long v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Let me in requestor %@ is active in the session. Ignore Let Me In Request,  conversation.remoteMembers: %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  id v18 = [(CSDConversationManager *)self _inactiveRemoteMemberForHandle:v8 conversation:v9];
  BOOL v16 = v18 != 0;
  if (v18)
  {
    uint64_t v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v20 = [v9 remoteMembers];
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      long long v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Let me in requestor %@ is a handle that is already a member of the call; Let Me In not required, conversation.remoteMembers: %@",
        buf,
        0x16u);
    }
    objc_initWeak((id *)buf, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000F908C;
    v21[3] = &unk_100505AC8;
    objc_copyWeak(&v24, (id *)buf);
    id v22 = v18;
    id v23 = v9;
    [(CSDConversationManager *)self sendLetMeInResponseToPendingMember:v22 forConversation:v23 usingResponseKeyData:v10 approved:1 callback:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

LABEL_10:
  return v16;
}

- (BOOL)shouldIgnoreMessageForConversation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (![v4 state])
    {
      int v6 = (*((uint64_t (**)(void))self->_isConversationRelayPreferred + 2))();
      id v7 = sub_100008DCC();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          LOWORD(v19) = 0;
          id v9 = "shouldIgnoreMessageForConversation: Ignore the message, will process messages through relay path";
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v19, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
      if (v8)
      {
        long long v15 = +[CSDCallCapabilities sharedInstance];
        BOOL v16 = [v15 callCapabilitiesState];
        int v19 = 67109120;
        LODWORD(v20) = [v16 relayCallingAvailability];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "shouldIgnoreMessageForConversation: Still process the message: %d", (uint8_t *)&v19, 8u);
      }
    }
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v5 state];
      int v19 = 134217984;
      id v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "shouldIgnoreMessageForConversation, state: %ld", (uint8_t *)&v19, 0xCu);
    }
LABEL_18:
    BOOL v12 = 0;
    goto LABEL_19;
  }
  int v10 = (*((uint64_t (**)(void))self->_isConversationRelayPreferred + 2))();
  id v7 = sub_100008DCC();
  BOOL v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v11)
    {
      unsigned int v13 = +[CSDCallCapabilities sharedInstance];
      long long v14 = [v13 callCapabilitiesState];
      int v19 = 67109120;
      LODWORD(v20) = [v14 relayCallingAvailability];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "shouldIgnoreMessageForConversation: still process message: %d", (uint8_t *)&v19, 8u);
    }
    goto LABEL_18;
  }
  if (v11)
  {
    LOWORD(v19) = 0;
    id v9 = "shouldIgnoreMessageForConversation: Will process message in relay session";
    goto LABEL_9;
  }
LABEL_10:
  BOOL v12 = 1;
LABEL_19:

  return v12;
}

- (BOOL)isValidLocalHandle:(id)a3 forProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CSDConversationManager *)self activeLocalHandles];
  id v9 = v8[2]();
  BOOL v10 = [(CSDConversationManager *)self isValidLocalHandle:v6 activeLocalHandles:v9 provider:0];

  BOOL v11 = [(CSDConversationManager *)self featureFlags];
  if ([v11 groupFacetimeAsAServiceEnabled])
  {
    BOOL v12 = [(CSDConversationManager *)self activeLocalHandlesForProvider];
    unsigned int v13 = ((void (**)(void, id))v12)[2](v12, v7);
    BOOL v10 = [(CSDConversationManager *)self isValidLocalHandle:v6 activeLocalHandles:v13 provider:v7];
  }
  return v10;
}

- (BOOL)isValidLocalHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self activeLocalHandles];
  id v6 = v5[2]();
  LOBYTE(self) = [(CSDConversationManager *)self isValidLocalHandle:v4 activeLocalHandles:v6 provider:0];

  return (char)self;
}

- (BOOL)isValidLocalHandle:(id)a3 activeLocalHandles:(id)a4 provider:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 containsObject:v8]) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = [(CSDConversationManager *)self isHandleLocalPseudonym:v8 provider:v9];
  }

  return v10;
}

- (BOOL)isHandleLocalPseudonym:(id)a3 provider:(id)a4
{
  id v6 = a4;
  id v7 = [a3 value];
  LOBYTE(self) = [(CSDConversationManager *)self isHandleStringLocalPseudonym:v7 provider:v6];

  return (char)self;
}

- (BOOL)isHandleStringLocalPseudonym:(id)a3
{
  return [(CSDConversationManager *)self isHandleStringLocalPseudonym:a3 provider:0];
}

- (BOOL)isHandleStringLocalPseudonym:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v8 destinationIdIsPseudonym])
  {
    id v9 = (__CFString *)[objc_alloc((Class)IDSURI) initWithPrefixedURI:v8];
    BOOL v10 = [(CSDConversationManager *)self featureFlags];
    unsigned int v11 = [v10 groupFacetimeAsAServiceEnabled];

    if (v7 && v11)
    {
      BOOL v12 = +[CSDConversationProviderManager sharedInstance];
      unsigned int v13 = [v12 serviceForProvider:v7];
    }
    else
    {
      unsigned int v13 = [(CSDConversationManager *)self service];
    }
    long long v15 = [v13 service];
    BOOL v16 = [v15 pseudonymForPseudonymURI:v9];
    BOOL v14 = v16 != 0;

    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v13 service];
      int v19 = [(CSDConversationManager *)self service];
      id v20 = [v13 service];
      BOOL v21 = [v20 pseudonymForPseudonymURI:v9];
      int v25 = 138413314;
      id v26 = v8;
      __int16 v27 = 2112;
      CFStringRef v28 = v9;
      __int16 v29 = 2112;
      id v30 = v18;
      __int16 v31 = 2112;
      long long v32 = v19;
      __int16 v33 = 2112;
      long long v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "destinationID: %@, uri: %@, service: %@, self.service: %@, pseudonym: %@", (uint8_t *)&v25, 0x34u);
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  id v22 = sub_100008DCC();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v23 = @"NO";
    int v25 = 138412802;
    id v26 = v8;
    __int16 v27 = 2112;
    if (v14) {
      CFStringRef v23 = @"YES";
    }
    CFStringRef v28 = v23;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "destinationID: %@, isLocalPseudonym: %@, provider: %@", (uint8_t *)&v25, 0x20u);
  }

  return v14;
}

- (id)senderIdentityUUIDForCallerIDHandle:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(CSDConversationManager *)self senderIdentitiesBlock];
  id v6 = v5[2]();

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        BOOL v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v11 = [v10 handle];
        unsigned int v12 = [v11 isEqualToHandle:v4];

        if (v12)
        {
          id v7 = [v10 UUID];
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)callerIDHandleForSenderIdentityUUID:(id)a3 callerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [(CSDConversationManager *)self senderIdentitiesBlock];
  id v9 = v8[2]();

  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        unsigned int v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v14 = [v13 UUID];
        unsigned int v15 = [v14 isEqual:v6];

        if (v15)
        {
          if ([v7 length])
          {
            long long v16 = [v13 handle];
            long long v17 = [v16 value];
            unsigned int v18 = [v17 isEqualToString:v7];

            if (v18)
            {
              id v10 = [v13 handle];
              goto LABEL_13;
            }
          }
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  int v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "callerIDHandleForSenderIdentityUUID: callerID: %@ handle: %@ for %@", buf, 0x20u);
  }

  return v10;
}

- (id)callerIDForLocalMember:(id)a3 forProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 handle];
  LODWORD(self) = [(CSDConversationManager *)self isValidLocalHandle:v8 forProvider:v7];

  if (self)
  {
    id v9 = [v6 handle];
    id v10 = [v9 normalizedValue];
  }
  else
  {
    uint64_t v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AAEC4();
    }

    id v10 = &stru_100517F40;
  }

  return v10;
}

- (id)callerIDForLocalMember:(id)a3
{
  return [(CSDConversationManager *)self callerIDForLocalMember:a3 forProvider:0];
}

- (id)localMemberForProvider:(id)a3 fromHandle:(id)a4 members:(id)a5 lightweightMembers:(id)a6 activeLocalHandles:(id)a7
{
  id v46 = a3;
  id v44 = a4;
  id v12 = a5;
  id v13 = a6;
  id v45 = a7;
  id v43 = v12;
  long long v14 = +[NSMutableSet setWithSet:v12];
  id v42 = v13;
  [v14 unionSet:v13];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v52;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v52 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = *(void **)(*((void *)&v51 + 1) + 8 * v19);
      long long v21 = [v20 handle];
      long long v22 = [(CSDConversationManager *)self localCallerIDForProvider];
      long long v23 = ((void (**)(void, id))v22)[2](v22, v46);
      unsigned __int8 v24 = [v21 isEqual:v23];

      if (v24) {
        break;
      }
      if (v17 == (id)++v19)
      {
        id v17 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v17) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v25 = v20;

    if (!v25) {
      goto LABEL_12;
    }
    id v26 = 0;
    goto LABEL_29;
  }
LABEL_9:

LABEL_12:
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v27 = v15;
  id v28 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v28)
  {

    id v26 = 0;
    id v25 = 0;
LABEL_29:
    __int16 v39 = v42;
    id v38 = v43;
    goto LABEL_30;
  }
  id v29 = v28;
  id v26 = 0;
  uint64_t v30 = *(void *)v48;
  do
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v48 != v30) {
        objc_enumerationMutation(v27);
      }
      long long v32 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      __int16 v33 = [v32 handle];
      unsigned int v34 = [(CSDConversationManager *)self isValidLocalHandle:v33 activeLocalHandles:v45 provider:v46];

      if (v34)
      {
        long long v35 = [v32 handle];
        unsigned int v36 = [v35 isEqualToHandle:v44];

        id v25 = v32;
        if (!v36) {
          goto LABEL_23;
        }

        id v26 = v25;
      }
    }
    id v29 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
  }
  while (v29);
  id v25 = 0;
LABEL_23:

  if (v25) {
    BOOL v37 = 1;
  }
  else {
    BOOL v37 = v26 == 0;
  }
  __int16 v39 = v42;
  id v38 = v43;
  if (!v37)
  {
    id v26 = v26;
    id v25 = v26;
  }
LABEL_30:
  id v40 = v25;

  return v40;
}

- (id)createConversationWithUUID:(id)a3 groupUUID:(id)a4 messagesGroupUUID:(id)a5 locallyCreated:(BOOL)a6 localMember:(id)a7 initiator:(id)a8 remoteMembers:(id)a9 pendingMembers:(id)a10 otherInvitedHandles:(id)a11 remotePushTokens:(id)a12 lightweightMembers:(id)a13 activity:(id)a14 link:(id)a15 report:(id)a16 fromStorage:(BOOL)a17 avMode:(unint64_t)a18 presentationMode:(unint64_t)a19 provider:(id)a20 screenSharingRequest:(id)a21 isInitiator:(BOOL)a22 isOldMessage:(BOOL)a23
{
  BOOL v123 = a6;
  id v27 = a3;
  id v28 = a4;
  id v137 = a5;
  id v141 = a7;
  id v133 = a8;
  id v138 = a9;
  id v29 = self;
  id v132 = a10;
  id v131 = a11;
  id v140 = a12;
  id v30 = a13;
  id v129 = a14;
  id v139 = a15;
  id v135 = a16;
  id v31 = a20;
  id v136 = a21;
  long long v32 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v32);

  __int16 v33 = sub_100008DCC();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    uint64_t v162 = (uint64_t)v27;
    __int16 v163 = 2112;
    id v164 = v28;
    __int16 v165 = 2112;
    id v166 = v141;
    __int16 v167 = 1024;
    *(_DWORD *)v168 = a17;
    *(_WORD *)&v168[4] = 2112;
    *(void *)&v168[6] = v135;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "UUID: %@ groupUUID: %@ localMember: %@ fromStorage: %d report: %@", buf, 0x30u);
  }
  id v134 = v28;

  unsigned int v34 = sub_100008DCC();
  long long v35 = v138;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v162 = (uint64_t)v27;
    __int16 v163 = 2112;
    id v164 = v138;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "UUID: %@ remoteMembers: %@", buf, 0x16u);
  }

  unsigned int v36 = +[NSMutableSet set];
  id v37 = objc_alloc_init((Class)NSSet);
  id v126 = v31;
  id v130 = v30;
  if ([v140 count])
  {
    id v38 = sub_100008DCC();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v39 = [v140 allObjects];
      TULoggableStringForHandles();
      v41 = id v40 = v37;
      *(_DWORD *)buf = 138412546;
      uint64_t v162 = (uint64_t)v27;
      __int16 v163 = 2112;
      id v164 = v41;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Asked to invite specific conversationUUID: %@ participantDestinationIDs: %@", buf, 0x16u);

      id v37 = v40;
    }

    id v42 = [v140 allObjects];
    [v36 addObjectsFromArray:v42];

    id v43 = v37;
    id v122 = [v36 copy];
  }
  else
  {
    id v122 = v37;
    if (v30)
    {
      id v44 = [v138 setByAddingObjectsFromSet:v30];
    }
    else
    {
      id v44 = v138;
    }
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v43 = v44;
    id v45 = [v43 countByEnumeratingWithState:&v154 objects:v160 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v155;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v155 != v47) {
            objc_enumerationMutation(v43);
          }
          long long v49 = +[IDSDestination destinationWithTUConversationMember:*(void *)(*((void *)&v154 + 1) + 8 * i)];
          [v36 addObject:v49];
        }
        id v46 = [v43 countByEnumeratingWithState:&v154 objects:v160 count:16];
      }
      while (v46);
    }

    id v29 = self;
  }

  v125 = v27;
  if ([v138 count] != (id)1) {
    goto LABEL_23;
  }
  long long v50 = [(CSDConversationManager *)v29 featureFlags];
  if ([v50 uPlusOneSessionWithCapabilitiesEnabled])
  {
    long long v51 = [(CSDConversationManager *)v29 serverBag];
    unsigned __int8 v52 = [v51 isUPlusOneSessionCapabilitiesEnabled];

    if (v52)
    {
LABEL_23:
      long long v53 = +[IDSDestination destinationWithTUConversationMember:v141];
      [v36 addObject:v53];
      goto LABEL_47;
    }
  }
  else
  {
  }
  long long v54 = [(CSDConversationManager *)v29 pushTokenForSelf];
  v55 = [v141 idsDestination];
  uint64_t v127 = IDSCopyIDForTokenWithID();

  v56 = [(CSDConversationManager *)v29 service];
  uint64_t v57 = IDSRegistrationPropertySupportsSelfOneToOneInvites;
  v58 = [v141 handle];
  v59 = [v56 deviceDestinationsWithCapability:v57 localHandle:v58];

  v60 = sub_100008DCC();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61 = TULoggableStringForHandles();
    *(_DWORD *)buf = 138412546;
    uint64_t v162 = v127;
    __int16 v163 = 2112;
    id v164 = v61;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "localDeviceDestination: %@ oneToOneModeCapableLocalDestinations: %@", buf, 0x16u);
  }
  if ([v59 count])
  {
    long long v152 = 0u;
    long long v153 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v120 = v59;
    id obj = v59;
    id v62 = [obj countByEnumeratingWithState:&v150 objects:v159 count:16];
    if (v62)
    {
      id v63 = v62;
      uint64_t v144 = *(void *)v151;
      do
      {
        for (j = 0; j != v63; j = (char *)j + 1)
        {
          if (*(void *)v151 != v144) {
            objc_enumerationMutation(obj);
          }
          v65 = *(void **)(*((void *)&v150 + 1) + 8 * (void)j);
          long long v146 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          v66 = [v65 destinationURIs];
          id v67 = [v66 countByEnumeratingWithState:&v146 objects:v158 count:16];
          if (v67)
          {
            id v68 = v67;
            uint64_t v69 = *(void *)v147;
            do
            {
              for (k = 0; k != v68; k = (char *)k + 1)
              {
                if (*(void *)v147 != v69) {
                  objc_enumerationMutation(v66);
                }
                unsigned int v71 = [*(id *)(*((void *)&v146 + 1) + 8 * (void)k) stringByReplacingOccurrencesOfString:@"self-token:" withString:@"token:"];
                [v36 addObject:v71];
              }
              id v68 = [v66 countByEnumeratingWithState:&v146 objects:v158 count:16];
            }
            while (v68);
          }
        }
        id v63 = [obj countByEnumeratingWithState:&v150 objects:v159 count:16];
      }
      while (v63);
    }

    id v29 = self;
    long long v35 = v138;
    id v31 = v126;
    v59 = v120;
  }
  long long v53 = (void *)v127;
  if (v127)
  {
    [v36 addObject:v127];
  }
  else
  {
    +[IDSDestination destinationWithTUConversationMember:v141];
    v73 = v72 = v59;
    [v36 addObject:v73];

    v59 = v72;
  }

LABEL_47:
  uint64_t v74 = sub_100008DCC();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    v75 = [(CSDConversationManager *)v29 service];
    v76 = [v36 allObjects];
    v77 = TULoggableStringForHandles();
    *(_DWORD *)buf = 138413058;
    uint64_t v162 = (uint64_t)v27;
    __int16 v163 = 2112;
    id v164 = v75;
    __int16 v165 = 2112;
    id v166 = v31;
    __int16 v167 = 2112;
    *(void *)v168 = v77;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "conversationUUID: %@ service: %@, provider: %@, participantDestinationIDs: %@", buf, 0x2Au);
  }
  v145 = [(CSDConversationManager *)v29 callerIDForLocalMember:v141 forProvider:v31];
  v78 = [v137 UUIDString];
  v79 = v78;
  if (v78)
  {
    id v80 = v78;
  }
  else
  {
    id v80 = [v134 UUIDString];
  }
  id obja = v80;

  if ([v35 count] == (id)1)
  {
    v81 = [v35 allObjects];
    v82 = [v81 firstObject];
    v83 = [v82 handle];
    v84 = [v83 value];
    unsigned int v85 = [v84 destinationIdIsTemporary] ^ 1;
    if (v139) {
      BOOL v86 = 0;
    }
    else {
      BOOL v86 = v85;
    }
  }
  else
  {
    BOOL v86 = 0;
  }
  v87 = [(CSDConversationManager *)v29 featureFlags];
  if ([v87 conversationOneToOneModeEnabled])
  {
    v88 = [(CSDConversationManager *)v29 serverBag];
    unsigned int v89 = [v88 isFaceTimeMyselfEnabled];

    if (((v86 | v89 ^ 1) & 1) == 0)
    {
      if ([v35 count]) {
        BOOL v86 = 0;
      }
      else {
        BOOL v86 = [v140 count] != 0;
      }
    }
  }
  else
  {
  }
  v90 = sub_100008DCC();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v91 = @"NO";
    if (v86) {
      CFStringRef v91 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v162 = (uint64_t)v91;
    __int16 v163 = 2112;
    id v164 = v35;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "isOneToOneModeEnabled: %@, remoteMembers: %@", buf, 0x16u);
  }

  v92 = [(CSDConversationManager *)v29 featureFlags];
  unsigned int v93 = [v92 groupFacetimeAsAServiceEnabled];

  if (v31 && v93)
  {
    v94 = +[CSDConversationProviderManager sharedInstance];
    v95 = [v94 serviceForProvider:v31];
  }
  else
  {
    v95 = [(CSDConversationManager *)v29 service];
  }
  id v128 = [[CSDConversationABTestConfiguration alloc] initWithGroupUUID:v134];
  if (v136)
  {
    v96 = [(CSDConversationManager *)v29 featureFlags];
    unsigned __int8 v119 = [v96 requestToScreenShareEnabled];
  }
  else
  {
    unsigned __int8 v119 = 0;
  }
  v97 = [(CSDConversationManager *)v29 groupSessionProviderCreationBlock];
  v98 = [v36 allObjects];
  [v95 accountWithCallerID:v145];
  v100 = v99 = v29;
  v101 = [(CSDConversationManager *)v99 queue];
  id v102 = [(CSDConversationABTestConfiguration *)v128 copy];
  HIBYTE(v118) = v119;
  LOBYTE(v118) = a18 == 0;
  uint64_t v103 = ((void (**)(void, id, void *, void *, void *, void *, BOOL, id, __int16, id, BOOL))v97)[2](v97, obja, v98, v145, v100, v101, v86, v141, v118, v102, a22);

  v121 = (void *)v103;
  v104 = [[CSDIDSGroupSession alloc] initWithGroupSessionProvider:v103];
  v105 = [(CSDConversationManager *)v99 conversationCreationBlock];
  v106 = [(CSDConversationManager *)v99 queue];
  id v107 = [(CSDConversationABTestConfiguration *)v128 copy];
  ((void (**)(void, void *, void *, void *, CSDIDSGroupSession *, id, BOOL, id, id, id, id, id, void *, id, id, id, id, id, BOOL, unint64_t, unint64_t, id, BOOL))v105)[2](v105, v106, v125, v134, v104, v137, v123, v141, v133, v138, v132, v131, v130, v140, v129, v139, v136, v135, a17,
    a18,
    a19,
    v107,
  id v108 = a23);

  [v108 setDelegate:v99];
  [v108 setProvider:v126];
  if (TUSimulatedModeEnabled()) {
    [v108 setAvcSessionCreationBlock:&stru_100507888];
  }
  id v109 = [(CSDConversationManager *)v99 reportingController];
  id v110 = [v108 tuConversation];
  [v109 createConversationReportingSession:v110];

  id v111 = [(CSDConversationManager *)v99 mutableConversationsByUUID];
  id v112 = [v108 UUID];
  [v111 setObject:v108 forKeyedSubscript:v112];

  id v113 = [(CSDConversationManager *)v99 persistenceController];
  [v113 updateConversation:v108];

  id v114 = [(CSDConversationManager *)v99 featureFlags];
  if ([v114 groupFacetimeAsAServiceEnabled]) {
    char v115 = [v126 supportsLinks] ^ 1;
  }
  else {
    char v115 = 0;
  }

  if (v139 && (v115 & 1) == 0)
  {
    id v116 = +[NSSet setWithObject:IDSRegistrationPropertySupportsGondola];
    [v108 addRequiredCapabilities:v116 requiredLackOfCapabilities:0];
  }

  return v108;
}

- (id)pendingConversationUUIDWithPseudonym:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000FB094;
  id v16 = sub_1000FB0A4;
  id v17 = 0;
  id v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB0AC;
  block[3] = &unk_100505DC0;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)removePendingConversationWithPseudonym:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000FB094;
  id v16 = sub_1000FB0A4;
  id v17 = 0;
  id v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB35C;
  block[3] = &unk_100507368;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_removePendingConversationWithPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    uint64_t v8 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
    id v9 = [v8 objectForKeyedSubscript:v4];

    id v10 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
    [v10 setObject:0 forKeyedSubscript:v4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_removePendingConversationsWithTemporaryGroupUUIDIfNecessary:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        uint64_t v12 = [v11 temporaryGroupUUID];
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v6 = [(CSDConversationManager *)self _removePendingConversationWithPseudonym:v9];
          [(CSDConversationManager *)self notifyDelegatesOfRemovedConversationWithUUID:v4];

          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeAllPendingConversations
{
  v3 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB6A0;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)activeConversation
{
  v3 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(CSDConversationManager *)self mutableConversationsByUUID];
  id v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 state] == (id)3)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)conversationWithGroupUUID:(id)a3 andProvider:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  uint64_t v7 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [(CSDConversationManager *)self mutableConversationsByUUID];
  uint64_t v9 = [v8 allValues];

  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v15 = [(CSDConversationManager *)self featureFlags];
        unsigned int v16 = [v15 groupFacetimeAsAServiceEnabled];

        long long v17 = [v14 groupUUID];
        unsigned int v18 = [v17 isEqual:v6];
        if (v18) {
          BOOL v19 = v16 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          unsigned int v20 = v18;

          if (v20) {
            goto LABEL_17;
          }
        }
        else
        {
          long long v21 = [v14 provider];
          unsigned __int8 v22 = [v21 isEqualToConversationProvider:v25];

          if (v22)
          {
LABEL_17:
            id v23 = v14;
            goto LABEL_18;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v23 = 0;
LABEL_18:

  return v23;
}

- (id)conversationWithGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(CSDConversationManager *)self mutableConversationsByUUID];
  uint64_t v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 groupUUID];
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)conversationWithGroupUUID:(id)a3 orRepresentedByRemoteMembers:(id)a4 andLink:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(CSDConversationManager *)self conversationWithGroupUUID:v8];
  if (!v12)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    unsigned int v13 = [(CSDConversationManager *)self mutableConversationsByUUID];
    long long v14 = [v13 allValues];

    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      id v16 = v15;
      long long v17 = 0;
      uint64_t v18 = *(void *)v25;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v14);
        }
        unsigned int v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
        if ([v20 isRepresentedByRemoteMembers:v9 andLink:v10])
        {
          id v12 = v20;

          long long v17 = v12;
          if (![v12 isFromStorage]) {
            break;
          }
        }
        if (v16 == (id)++v19)
        {
          id v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          id v12 = v17;
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  long long v21 = sub_100008DCC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v12)
    {
      unsigned __int8 v22 = [v12 groupUUID];
    }
    else
    {
      unsigned __int8 v22 = 0;
    }
    *(_DWORD *)buf = 138412546;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "found conversation from groupUUID: %@, conversation: %@", buf, 0x16u);
    if (v12) {
  }
    }

  return v12;
}

- (id)conversationRepresentedByRemoteMembers:(id)a3 andLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  unsigned int v20 = sub_1000FB094;
  long long v21 = sub_1000FB0A4;
  id v22 = 0;
  id v8 = [(CSDConversationManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000FBF40;
  v13[3] = &unk_1005078B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)activeApprovedConversationWithLink:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000FB094;
  id v16 = sub_1000FB0A4;
  id v17 = 0;
  id v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FC1B8;
  block[3] = &unk_100505DC0;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)pendingConversationWithPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
  id v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 link];
        unsigned int v13 = [v12 pseudonym];
        unsigned int v14 = [v13 isEqual:v4];

        if (v14)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)findConversationLinkMatchingPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = -[CSDConversationManager activatedConversationLinksWithError:](self, "activatedConversationLinksWithError:", 0, 0);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 pseudonym];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)conversationLinkForPseudonym:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = sub_1000FB094;
  long long v16 = sub_1000FB0A4;
  id v17 = 0;
  id v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FC780;
  block[3] = &unk_100507368;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)conversationLinkForGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = -[CSDConversationManager activatedConversationLinksWithError:](self, "activatedConversationLinksWithError:", 0, 0);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 groupUUID];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)createConversationIfNecessaryWithUUID:(id)a3 groupUUID:(id)a4 messagesGroupUUID:(id)a5 locallyCreated:(BOOL)a6 localMember:(id)a7 remoteMembers:(id)a8 pendingMembers:(id)a9 otherInvitedHandles:(id)a10 remotePushTokens:(id)a11 lightweightMembers:(id)a12 link:(id)a13 activity:(id)a14 avMode:(unint64_t)a15 presentationMode:(unint64_t)a16 provider:(id)a17 screenSharingRequest:(id)a18
{
  BOOL v41 = a6;
  id v22 = a3;
  id v23 = a4;
  id v48 = a5;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  id v27 = a17;
  id v28 = a18;
  id v29 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v29);

  __int16 v30 = sub_100008DCC();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v50 = v22;
    __int16 v51 = 2112;
    id v52 = v23;
    __int16 v53 = 2112;
    id v54 = v24;
    __int16 v55 = 2112;
    id v56 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "UUID: %@ groupUUD: %@ localMember: %@, provider: %@", buf, 0x2Au);
  }

  id v31 = sub_100008DCC();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v50 = v22;
    __int16 v51 = 2112;
    id v52 = v25;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "UUID: %@ remoteMembers: %@", buf, 0x16u);
  }

  long long v32 = [(CSDConversationManager *)self mutableConversationsByUUID];
  __int16 v33 = [v32 objectForKeyedSubscript:v22];

  if (!v33)
  {
    id v34 = objc_alloc_init((Class)TUConversationReport);
    [v24 handle];
    id v35 = v25;
    v37 = id v36 = v26;
    LOWORD(v40) = 1;
    LOBYTE(v39) = 0;
    -[CSDConversationManager createConversationWithUUID:groupUUID:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:remotePushTokens:lightweightMembers:activity:link:report:fromStorage:avMode:presentationMode:provider:screenSharingRequest:isInitiator:isOldMessage:](self, "createConversationWithUUID:groupUUID:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:remotePushTokens:lightweightMembers:activity:link:report:fromStorage:avMode:presentationMode:provider:screenSharingRequest:isInitiator:isOldMessage:", v22, v23, v48, v41, v24, v37, v35, v36, v47, v46, v45, v43, v44, v34, v39,
      a15,
      a16,
      v27,
      v28,
    __int16 v33 = v40);

    id v26 = v36;
    id v25 = v35;
  }

  return v33;
}

- (id)conversationWithGroupUUID:(id)a3 orMemberIdentifiers:(id)a4 orRemoteMembers:(id)a5 andLink:(id)a6 andVideo:(BOOL)a7
{
  int v35 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v15 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v15);

  id v16 = [(CSDConversationManager *)self conversationWithGroupUUID:v11];
  long long v17 = [(CSDConversationManager *)self serverBag];
  if ([v17 isParticipantIDToURIIncludedInPush])
  {
    unsigned __int8 v18 = 0;
  }
  else
  {
    long long v19 = [(CSDConversationManager *)self featureFlags];
    unsigned __int8 v18 = [v19 participantIDToURIRemovedEnabled];
  }
  if ((v18 & 1) == 0 && !v16)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    unsigned int v20 = [(CSDConversationManager *)self mutableConversationsByUUID];
    long long v21 = [v20 allValues];

    id v16 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v16)
    {
      __int16 v33 = self;
      id v34 = v11;
      uint64_t v22 = *(void *)v41;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v21);
          }
          id v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v25 = [v24 memberIdentifiers];
          unsigned int v26 = [v25 isEqualToSet:v12];

          if (v26)
          {
            id v16 = v24;
            goto LABEL_16;
          }
        }
        id v16 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_16:
      self = v33;
      id v11 = v34;
    }
  }
  if (!v16)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = [(CSDConversationManager *)self mutableConversationsByUUID];
    id v28 = [v27 allValues];

    id v16 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v16)
    {
      uint64_t v29 = *(void *)v37;
      while (2)
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v28);
          }
          id v31 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          if ([v31 isRepresentedByRemoteMembers:v13 andLink:v14]
            && [v31 isVideo] == v35)
          {
            id v16 = v31;
            goto LABEL_30;
          }
        }
        id v16 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_30:
  }

  return v16;
}

- (void)notifyDelegatesOfMessage:(id)a3 fromHandle:(id)a4 forConversation:(id)a5 withUpdate:(id)a6
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  id v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v14);
        if (objc_opt_respondsToSelector())
        {
          id v16 = [v21 tuConversation];
          long long v17 = [(CSDConversationManager *)self delegateToQueue];
          unsigned __int8 v18 = [v17 objectForKey:v15];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FD1E0;
          block[3] = &unk_1005078D8;
          void block[4] = v15;
          id v26 = v16;
          id v27 = self;
          id v28 = v23;
          id v29 = v22;
          id v30 = v20;
          id v19 = v16;
          dispatch_async(v18, block);
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }
}

- (void)notifyDelegatesOfNewConversation:(id)a3 fromHandle:(id)a4
{
  id v17 = a3;
  id v16 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          id v12 = [v17 tuConversation];
          uint64_t v13 = [(CSDConversationManager *)self delegateToQueue];
          id v14 = [v13 objectForKey:v11];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FD548;
          block[3] = &unk_1005053D0;
          void block[4] = v11;
          id v20 = v12;
          id v21 = self;
          id v22 = v16;
          id v15 = v12;
          dispatch_async(v14, block);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
}

- (void)notifyDelegatesOfAVModeChanged:(unint64_t)a3 toAVMode:(unint64_t)a4 forConversation:(id)a5
{
  id v18 = a5;
  id v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          id v12 = [v18 tuConversation];
          uint64_t v13 = [(CSDConversationManager *)self delegateToQueue];
          id v14 = [v13 objectForKey:v11];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FD894;
          block[3] = &unk_100506C40;
          void block[4] = v11;
          id v21 = v12;
          id v22 = self;
          unint64_t v23 = a3;
          unint64_t v24 = a4;
          id v15 = v12;
          dispatch_async(v14, block);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
}

- (void)notifyDelegatesOfRemovedConversationWithUUID:(id)a3
{
  id v12 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(CSDConversationManager *)self delegateToQueue];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector())
        {
          id v10 = [(CSDConversationManager *)self delegateToQueue];
          uint64_t v11 = [v10 objectForKey:v9];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FDBA4;
          block[3] = &unk_100504FE0;
          void block[4] = v9;
          void block[5] = self;
          id v14 = v12;
          dispatch_async(v11, block);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)notifyDelegatesOfTrackedPendingMember:(id)a3 forConversationLink:(id)a4
{
  id v16 = a3;
  id v15 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [(CSDConversationManager *)self delegateToQueue];
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = [(CSDConversationManager *)self delegateToQueue];
          id v14 = [v13 objectForKey:v12];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FDDB8;
          block[3] = &unk_1005053D0;
          void block[4] = v12;
          void block[5] = self;
          id v18 = v16;
          id v19 = v15;
          dispatch_async(v14, block);
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)notifyDelegatesOfUpdatePendingConversations
{
  v3 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v12 = [(CSDConversationManager *)self _incomingPendingConversationsByGroupUUID];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(CSDConversationManager *)self delegateToQueue];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [(CSDConversationManager *)self delegateToQueue];
          uint64_t v11 = [v10 objectForKey:v9];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FDFA8;
          block[3] = &unk_100504FE0;
          void block[4] = v9;
          void block[5] = self;
          id v14 = v12;
          dispatch_async(v11, block);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)notifyDelegatesOfChangedLinkDescriptors:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc((Class)TUConversationLink);
    id v6 = [v4 firstObject];
    uint64_t v7 = [v5 initWithDescriptor:v6];

    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "notifyDelegatesOfChangedLinkDescriptors: %@", (uint8_t *)&v9, 0xCu);
    }

    [(CSDConversationManager *)self notifyDelegatesOfChangedLink:v7 conversation:0];
  }
  else
  {
    uint64_t v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notifyDelegatesOfChangedLinkDescriptors: -- no link descriptors, not updating delegates", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)notifyDelegatesOfChangedLink:(id)a3 conversation:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  if ([(CSDConversationManager *)self _linksEnabled])
  {
    uint64_t v7 = [(CSDConversationManager *)self linkManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000FE1DC;
    v8[3] = &unk_100507900;
    v8[4] = self;
    id v9 = v5;
    [v7 activatedLinksWithCompletionHandler:v8];
  }
}

- (void)notifyDelegatesOfRemoteScreenShareAttributes:(id)a3 isLocallySharing:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManager *)self featureFlags];
  unsigned int v9 = [v8 supportsScreenSharing];

  if (v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [(CSDConversationManager *)self delegateToQueue];
    id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v13);
          long long v15 = [(CSDConversationManager *)self delegateToQueue];
          long long v16 = [v15 objectForKey:v14];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FE88C;
          block[3] = &unk_100506C18;
          void block[4] = v14;
          void block[5] = self;
          id v19 = v6;
          BOOL v20 = a4;
          dispatch_async(v16, block);

          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
  }
}

- (void)notifyDelegatesOfRemoteScreenShareEndedWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManager *)self featureFlags];
  unsigned int v7 = [v6 supportsScreenSharing];

  if (v7)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [(CSDConversationManager *)self delegateToQueue];
    id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v11);
          uint64_t v13 = [(CSDConversationManager *)self delegateToQueue];
          uint64_t v14 = [v13 objectForKey:v12];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FEAC8;
          block[3] = &unk_100504FE0;
          void block[4] = v12;
          void block[5] = self;
          id v17 = v4;
          dispatch_async(v14, block);

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (void)notifyDelegatesOfLetMeInRejectedForPendingConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 tuConversation];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [(CSDConversationManager *)self delegateToQueue];
        uint64_t v13 = [v12 objectForKey:v11];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000FECFC;
        block[3] = &unk_100504FE0;
        void block[4] = v11;
        id v16 = v6;
        id v17 = self;
        dispatch_async(v13, block);
      }
      id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)notifyDelegatesOfInvalidLinkForPendingConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 tuConversation];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [(CSDConversationManager *)self delegateToQueue];
        uint64_t v13 = [v12 objectForKey:v11];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000FF034;
        block[3] = &unk_100504FE0;
        void block[4] = v11;
        id v16 = v6;
        id v17 = self;
        dispatch_async(v13, block);
      }
      id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)handleConversation:(id)a3 receivedBlobRecoveryRequest:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = [v9 requestBlobRecoveryOptions];
  uint64_t v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 67109378;
    *(_DWORD *)long long v25 = v12;
    *(_WORD *)&v25[4] = 2112;
    *(void *)&v25[6] = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "handleConversation:receivedBlobRecoveryRequest:fromHandle: options: %u from: %@", (uint8_t *)&v24, 0x12u);
  }

  uint64_t v14 = TUCopyIDSCanonicalAddressForHandle();
  long long v15 = +[NSArray arrayWithObject:v14];
  id v16 = [v8 localConversationParticipantWithDataToSendToDestinationIDs:v15];

  if (v16)
  {
    id v17 = [CSDMessagingConversationMessage alloc];
    long long v18 = [v8 groupUUID];
    long long v19 = [(CSDMessagingConversationMessage *)v17 initWithType:5 groupUUID:v18 link:0];

    long long v20 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:v16];
    if ([v9 hasRequestBlobRecoveryOptions] && (v12 & 1) == 0) {
      [v20 setAvcData:0];
    }
    [v19 addActiveParticipants:v20];
    long long v21 = [v19 data];
    long long v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      *(void *)long long v25 = v19;
      *(_WORD *)&v25[8] = 2112;
      *(void *)&v25[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "handleConversation:receivedBlobRecoveryRequest:fromHandle: Sending message: %@ to: %@", (uint8_t *)&v24, 0x16u);
    }

    [(CSDConversationManager *)self sendData:v21 onConversation:v8 toHandle:v10 isBlobResponse:1];
  }
  else
  {
    long long v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = [v8 UUID];
      int v24 = 138412290;
      *(void *)long long v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] handleConversation:receivedBlobRecoveryRequest:fromHandle: No local participant for conversation UUID: %@", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)handleConversation:(id)a3 receivedBlobRecoveryResponse:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "handleConversation:receivedBlobRecoveryResponse:fromHandle: from: %@", (uint8_t *)&v25, 0xCu);
  }

  uint64_t v13 = [v9 activeParticipants];
  uint64_t v14 = [v13 firstObject];
  long long v15 = [v14 csdConversationParticipant];

  if (!v15)
  {
    long long v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v9;
      long long v23 = "[WARN] handleConversation:receivedBlobRecoveryResponse:fromHandle: Could not find participant in message: %@";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v25, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  id v16 = [v15 handle];
  unsigned int v17 = [v16 isEqualToHandle:v10];

  if (!v17)
  {
    long long v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [v15 handle];
      int v25 = 138412546;
      id v26 = v24;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[WARN] handleConversation:receivedBlobRecoveryResponse:fromHandle: %@ <!===> %@", (uint8_t *)&v25, 0x16u);
    }
    goto LABEL_15;
  }
  uint64_t v18 = [v15 avcData];
  if (!v18
    || (long long v19 = (void *)v18,
        [v15 avcData],
        long long v20 = objc_claimAutoreleasedReturnValue(),
        id v21 = [v20 length],
        v20,
        v19,
        !v21))
  {
    long long v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v9;
      long long v23 = "[WARN] handleConversation:receivedBlobRecoveryResponse: could not add or update participant: %@";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  [v8 addActiveParticipant:v15];
LABEL_16:
}

- (void)handleConversationHandoffRecommendationChangedNotification:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FF7CC;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateConversationHandoffEligibility:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v46 = self;
  id v6 = [(CSDConversationManager *)self lockdownModeEnabled];
  int v7 = v6[2]();

  if (v7)
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not updating handoff eligibility %@ because lockdown mode is enabled", buf, 0xCu);
    }
    goto LABEL_50;
  }
  id v9 = sub_100008DCC();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v10)
    {
      uint64_t v11 = [v4 conversationGroupUUID];
      unsigned int v12 = [v4 association];
      id v13 = [v12 identifier];
      if ([v4 isUplinkMuted]) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      if ([v4 isSendingVideo]) {
        CFStringRef v15 = @"YES";
      }
      else {
        CFStringRef v15 = @"NO";
      }
      v61 = v11;
      __int16 v62 = 2048;
      id v63 = v13;
      __int16 v64 = 2112;
      CFStringRef v65 = v14;
      __int16 v66 = 2112;
      CFStringRef v67 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handoff changed to advertise %@ for identifier %llu, uplink muted %@, sending video %@", buf, 0x2Au);
    }
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handoff changed without eligibility, so stopping advertising", buf, 2u);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  id v16 = [(CSDConversationManager *)self mutableConversationsByUUID];
  unsigned int v17 = [v16 allValues];

  uint64_t v18 = v17;
  id v19 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (!v19)
  {
    id v21 = 0;
    goto LABEL_42;
  }
  id v20 = v19;
  id v21 = 0;
  uint64_t v22 = *(void *)v55;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v55 != v22) {
        objc_enumerationMutation(v18);
      }
      int v24 = *(NSObject **)(*((void *)&v54 + 1) + 8 * i);
      if ((+[TUConversationManager supportsConversations] & 1) == 0)
      {
        long long v32 = [v24 remoteMembers];
        if ((unint64_t)[v32 count] >= 2)
        {

LABEL_29:
          long long v34 = sub_100008DCC();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v24;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Handoff eligibility set to nil for GreenTea device: %@", buf, 0xCu);
          }

LABEL_32:
          [v24 setHandoffEligibility:0];
          continue;
        }
        unsigned __int8 v33 = [v24 isVideoEnabled];

        if ((v33 & 1) == 0) {
          goto LABEL_29;
        }
      }
      if (v4)
      {
        int v25 = [v24 groupUUID];
        id v26 = [v4 conversationGroupUUID];
        unsigned int v27 = [v25 isEqual:v26];

        if (!v27) {
          goto LABEL_32;
        }
        [v24 setHandoffEligibility:v4];
        id v28 = v24;

        id v29 = sub_100008DCC();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v28;
          id v30 = v29;
          long long v31 = "Handoff eligibility added to conversation: %@";
LABEL_36:
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
        }
      }
      else
      {
        int v35 = [v24 handoffEligibility];

        if (!v35) {
          goto LABEL_32;
        }
        [v24 setHandoffEligibility:0];
        id v28 = v24;

        id v29 = sub_100008DCC();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v28;
          id v30 = v29;
          long long v31 = "Handoff eligibility removed from conversation: %@";
          goto LABEL_36;
        }
      }

      id v21 = v28;
    }
    id v20 = [v18 countByEnumeratingWithState:&v54 objects:v59 count:16];
  }
  while (v20);
LABEL_42:
  id v8 = v21;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [(CSDConversationManager *)v46 delegateToQueue];
  id v36 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v51;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v51 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void *)(*((void *)&v50 + 1) + 8 * (void)j);
        long long v41 = [v8 tuConversation];
        long long v42 = [(CSDConversationManager *)v46 delegateToQueue];
        long long v43 = [v42 objectForKey:v40];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000FFDDC;
        block[3] = &unk_100504FE0;
        void block[4] = v40;
        id v48 = v41;
        long long v49 = v46;
        id v44 = v41;
        dispatch_async(v43, block);
      }
      id v37 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v37);
  }

LABEL_50:
}

- (void)handleConversationHandoffRouteIdentifierChangedNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100100018;
  block[3] = &unk_100505558;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)postSessionStartedForSession:(id)a3 originator:(id)a4 conversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v8 UUID];
    int v18 = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Posting session started event from participant %@ for session %@", (uint8_t *)&v18, 0x16u);
  }
  id v14 = objc_alloc((Class)TUConversationActivityEvent);
  CFStringRef v15 = [v8 UUID];
  id v16 = [v14 initWithSessionUUID:v15 originator:v9 type:12];

  [v16 setSession:v8];
  unsigned int v17 = [(CSDConversationManager *)self conversationNoticeManger];
  [v17 conversation:v10 receivedActivitySessionEvent:v16];
}

- (void)postEndEventForSession:(id)a3 originator:(id)a4 conversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v8 UUID];
    int v18 = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Posting session ended event from participant %@ for session %@", (uint8_t *)&v18, 0x16u);
  }
  id v14 = objc_alloc((Class)TUConversationActivityEvent);
  CFStringRef v15 = [v8 UUID];
  id v16 = [v14 initWithSessionUUID:v15 originator:v9 type:13];

  [v16 setSession:v8];
  unsigned int v17 = [(CSDConversationManager *)self conversationNoticeManger];
  [v17 conversation:v10 receivedActivitySessionEvent:v16];
}

- (BOOL)_linksEnabled
{
  return TUDisableLinks() ^ 1;
}

- (id)temporaryFilePath
{
  v2 = NSTemporaryDirectory();
  v3 = +[NSString stringGUID];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

- (id)createActivitySession:(id)a3 onConversation:(id)a4 fromHandle:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 memberWithHandle:v9];
  uint64_t v11 = [v10 association];
  if (v11
    && (unsigned int v12 = (void *)v11,
        [v10 association],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 isPrimary],
        v13,
        v12,
        (v14 & 1) == 0))
  {
    int v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v8 UUID];
      __int16 v20 = [v10 association];
      int v28 = 138413058;
      id v29 = v7;
      __int16 v30 = 2112;
      long long v31 = v19;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      int v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Asked to create ActivitySession %@ on conversation UUID: %@ for fromHandle: %@ using association: %@", (uint8_t *)&v28, 0x2Au);
    }
    id v21 = [v10 association];
    id v17 = [v21 handle];

    uint64_t v22 = +[CSDMessagingHandle handleWithTUHandle:v17];
    long long v23 = [v7 activity];
    [v23 setOriginatorHandle:v22];
  }
  else
  {
    CFStringRef v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v8 UUID];
      int v28 = 138412802;
      id v29 = v7;
      __int16 v30 = 2112;
      long long v31 = v16;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Asked to create ActivitySession %@ on conversation UUID: %@ with trusted fromHandle: %@", (uint8_t *)&v28, 0x20u);
    }
    id v17 = v9;
  }
  int v24 = +[CSDMessagingHandle handleWithTUHandle:v17];
  int v25 = [v7 activity];
  [v25 setFromHandle:v24];

  id v26 = [v7 createActivitySessionOnConversation:v8];

  return v26;
}

- (void)handleEncryptedMessageWithin:(id)a3 fromHandle:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 hasEncryptedMessage]
    || ([v8 hasEnclosedEncryptedType] & 1) == 0)
  {
    unsigned int v12 = sub_100008DCC();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_10;
    }
    LOWORD(v16[0]) = 0;
    id v13 = "[WARN] Conversation message of type Encrypted received with either no encryptedMessage or enclosedEncryptedTyp"
          "e. Dropping message.";
    unsigned __int8 v14 = v12;
    uint32_t v15 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)v16, v15);
    goto LABEL_9;
  }
  unsigned int v11 = [v8 enclosedEncryptedType];
  if (v11 == 16)
  {
    [(CSDConversationManager *)self handleEncryptedLetMeInResponse:v8 fromHandle:v9 context:v10];
    goto LABEL_10;
  }
  if (v11 != 10)
  {
    unsigned int v12 = sub_100008DCC();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    v16[0] = 67109120;
    v16[1] = [v8 enclosedEncryptedType];
    id v13 = "[WARN] ConversationMessage of type Encrypted with enclosed type of %d which we do not have support for, dropping.";
    unsigned __int8 v14 = v12;
    uint32_t v15 = 8;
    goto LABEL_8;
  }
  [(CSDConversationManager *)self handleEncryptedLetMeInRequest:v8 fromHandle:v9 context:v10];
LABEL_10:
}

- (void)handleEncryptedLetMeInRequest:(id)a3 fromHandle:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  if ([(CSDConversationManager *)self _linksEnabled])
  {
    unsigned int v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received Encrypted message with enclosed type of LetMeInRequest from handle %@", buf, 0xCu);
    }

    id v13 = objc_msgSend(v10, "csd_pseudonym");
    if ([v13 length])
    {
      unsigned __int8 v14 = +[TUHandle normalizedGenericHandleForValue:v13];
      if (v14)
      {
        uint32_t v15 = [(CSDConversationManager *)self linkManager];
        id v16 = [v8 encryptedMessage];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1001010C8;
        v18[3] = &unk_100507950;
        v18[4] = self;
        unsigned __int8 v14 = v14;
        id v19 = v14;
        id v20 = v9;
        id v21 = v10;
        [v15 decryptLetMeInRequest:v16 pseudonym:v14 fromHandle:v20 completionHandler:v18];
      }
      else
      {
        id v17 = sub_100008DCC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Let Me In request was not sent to a pseudonym. Dropping message.", buf, 2u);
        }
      }
    }
    else
    {
      unsigned __int8 v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Could not retrieve a pseudonym string from the message context.", buf, 2u);
      }
    }
  }
}

- (void)handleEncryptedLetMeInResponse:(id)a3 fromHandle:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v9);

  if ([(CSDConversationManager *)self _linksEnabled])
  {
    id v10 = [v7 tuConversationLink];
    unsigned int v11 = sub_100008DCC();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v10)
    {
      if (!v12)
      {
LABEL_26:

        goto LABEL_27;
      }
      int v18 = [v7 link];
      *(_DWORD *)buf = 138412290;
      id v38 = v18;
      id v23 = "[WARN] Provided link is %@, which was not a valid TUConversationLink.";
      int v24 = v11;
      goto LABEL_24;
    }
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received Encrypted message with enclosed type of LetMeInResponse from handle %@", buf, 0xCu);
    }

    id v13 = [v10 pseudonym];
    unsigned int v11 = [(CSDConversationManager *)self pendingConversationWithPseudonym:v13];

    if (v11)
    {
      if ([v11 letMeInRequestState] == (id)2)
      {
        uint64_t v14 = [v11 letMeInKeyAgreement];
        if (!v14
          || (uint32_t v15 = (void *)v14,
              [v11 letMeInKeyAgreement],
              id v16 = objc_claimAutoreleasedReturnValue(),
              unsigned int v17 = [v16 isExhausted],
              v16,
              v15,
              v17))
        {
          int v18 = sub_100008DCC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [v11 letMeInKeyAgreement];
            if (v19) {
              CFStringRef v20 = @"NO";
            }
            else {
              CFStringRef v20 = @"YES";
            }
            id v21 = [v11 letMeInKeyAgreement];
            if (v21)
            {
              id v36 = [v11 letMeInKeyAgreement];
              if ([v36 isExhausted]) {
                CFStringRef v22 = @"YES";
              }
              else {
                CFStringRef v22 = @"NO";
              }
            }
            else
            {
              CFStringRef v22 = 0;
            }
            *(_DWORD *)buf = 138412546;
            id v38 = (id)v20;
            __int16 v39 = 2112;
            CFStringRef v40 = v22;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Pending conversation's let me in key agreement is either nil (%@) or exhausted (%@)", buf, 0x16u);
            if (v21) {
          }
            }
          goto LABEL_25;
        }
        id v26 = [v10 pseudonym];
        int v18 = +[TUHandle normalizedGenericHandleForValue:v26];

        if (!v18)
        {
          __int16 v30 = sub_100008DCC();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[WARN] Let Me In response was not sent to a pseudonym. Dropping message.", buf, 2u);
          }
          goto LABEL_44;
        }
        unsigned int v27 = [(CSDConversationManager *)self linkManager];
        int v28 = [v7 encryptedMessage];
        id v29 = [v11 letMeInKeyAgreement];
        __int16 v30 = [v27 decryptLetMeInResponse:v28 pseudonym:v18 requestorKeyAgreement:v29];

        if (v30)
        {
          if ([v30 type] == 16)
          {
            [(CSDConversationManager *)self handleReceivedLetMeInResponse:v30 pendingConversation:v11 fromHandle:v8];
LABEL_44:

            goto LABEL_25;
          }
          long long v31 = sub_100008DCC();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v35 = [v30 type];
            *(_DWORD *)buf = 67109120;
            LODWORD(v38) = v35;
            __int16 v32 = "[WARN] Decrypted conversation message but was not a let me in response messageType: %d";
            id v33 = v31;
            uint32_t v34 = 8;
            goto LABEL_42;
          }
        }
        else
        {
          long long v31 = sub_100008DCC();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            __int16 v32 = "[WARN] Could not decrypt let me in response";
            id v33 = v31;
            uint32_t v34 = 2;
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
          }
        }

        goto LABEL_44;
      }
      int v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = [v11 letMeInRequestState];
        *(_DWORD *)buf = 134217984;
        id v38 = v25;
        id v23 = "[WARN] Pending conversation's let me in request state is %ld instead of Requested";
        goto LABEL_23;
      }
    }
    else
    {
      int v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v10;
        id v23 = "[WARN] No pending conversation found for link %@";
LABEL_23:
        int v24 = v18;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
      }
    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_27:
}

- (void)handleReceivedLetMeInRequest:(id)a3 toPseudonym:(id)a4 fromHandle:(id)a5 responseKeyData:(id)a6 dateInitiated:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unsigned int v17 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v17);

  if ([(CSDConversationManager *)self _linksEnabled])
  {
    int v18 = [(CSDConversationManager *)self linkManager];
    id v19 = [v13 value];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001019E8;
    v20[3] = &unk_1005079A0;
    v20[4] = self;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    id v24 = v12;
    id v25 = v16;
    [v18 getLinkDescriptorWithPseudonym:v19 includeInactive:0 completionHandler:v20];
  }
}

- (void)handleReceivedLetMeInResponse:(id)a3 pendingConversation:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  if ([(CSDConversationManager *)self _linksEnabled])
  {
    id v12 = [v8 tuConversationLink];
    if (v12 && [v8 hasIsLetMeInApproved])
    {
      if ([v8 isLetMeInApproved])
      {
        id v13 = [v8 conversationGroupUUID];

        if (!v13) {
          goto LABEL_8;
        }
      }
      else
      {
      }
      id v23 = [v9 link];
      id v24 = [v8 tuConversationLink];
      unsigned __int8 v25 = [v23 isEquivalentToConversationLink:v24];

      if ((v25 & 1) == 0)
      {
        id v14 = sub_100008DCC();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Let me in response is not for the provided pending conversation. Ignoring.", (uint8_t *)&v41, 2u);
        }
        goto LABEL_21;
      }
      id v26 = [v10 value];
      if ([v26 destinationIdIsPseudonym])
      {
        unsigned int v27 = [v9 link];
        int v28 = [v27 pseudonym];
        id v29 = [v10 value];
        unsigned __int8 v30 = [v28 isEqualToString:v29];

        if ((v30 & 1) == 0)
        {
          id v14 = sub_100008DCC();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          id v15 = [v9 link];
          unsigned int v17 = [(__CFString *)v15 pseudonym];
          long long v31 = [v10 value];
          int v41 = 138412546;
          CFStringRef v42 = v17;
          __int16 v43 = 2112;
          CFStringRef v44 = v31;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Let me in response is not from the pseudonym defined in the link %@, instead is from %@", (uint8_t *)&v41, 0x16u);

          goto LABEL_20;
        }
      }
      else
      {
      }
      if ([v8 isLetMeInApproved])
      {
        __int16 v32 = [v9 link];
        id v33 = [v8 tuConversationLink];
        unsigned __int8 v34 = [v32 isEqualToConversationLink:v33];

        if ((v34 & 1) == 0)
        {
          unsigned int v35 = [v8 tuConversationLink];
          id v36 = [v35 copy];
          [v9 setLink:v36];
        }
        id v37 = [v8 conversationGroupUUID];
        [v9 setConversationGroupUUID:v37];

        id v38 = [v8 tuConversationLink];
        __int16 v39 = [v38 originatorHandle];
        [v9 setApproverHandle:v39];
      }
      else
      {
        [(CSDConversationManager *)self notifyDelegatesOfLetMeInRejectedForPendingConversation:v9];
      }
      id v14 = sub_100008DCC();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      if ([v8 isLetMeInApproved]) {
        CFStringRef v40 = @"YES";
      }
      else {
        CFStringRef v40 = @"NO";
      }
      id v15 = [v9 conversationGroupUUID];
      unsigned int v17 = [v9 approverHandle];
      int v41 = 138543874;
      CFStringRef v42 = v40;
      __int16 v43 = 2112;
      CFStringRef v44 = v15;
      __int16 v45 = 2112;
      CFStringRef v46 = v17;
      CFStringRef v20 = "Finished processing let me in response (approved: %{public}@) for groupUUID: %@. Approver handle is %@.";
      id v21 = v14;
      uint32_t v22 = 32;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v41, v22);
LABEL_20:

      goto LABEL_21;
    }

LABEL_8:
    id v14 = sub_100008DCC();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      goto LABEL_22;
    }
    id v15 = [v8 conversationGroupUUID];
    if (v15) {
      CFStringRef v16 = @"NO";
    }
    else {
      CFStringRef v16 = @"YES";
    }
    unsigned int v17 = [v8 tuConversationLink];
    if (v17) {
      CFStringRef v18 = @"NO";
    }
    else {
      CFStringRef v18 = @"YES";
    }
    int v41 = 138544130;
    if ([v8 hasIsLetMeInApproved]) {
      CFStringRef v19 = @"NO";
    }
    else {
      CFStringRef v19 = @"YES";
    }
    CFStringRef v42 = v16;
    __int16 v43 = 2114;
    CFStringRef v44 = v18;
    __int16 v45 = 2114;
    CFStringRef v46 = v19;
    __int16 v47 = 2112;
    id v48 = v8;
    CFStringRef v20 = "[WARN] Ignoring let me in response message, as it is missing a groupUUID (%{public}@), missing a link (%{publi"
          "c}@), or does not specify approval/rejection (%{public}@): %@";
    id v21 = v14;
    uint32_t v22 = 42;
    goto LABEL_19;
  }
LABEL_22:
}

- (void)handleReceivedLinkCreatedOrChangedMessage:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001025B8;
  block[3] = &unk_100504FE0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleReceivedLinkInvalidatedMessage:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100103188;
  block[3] = &unk_100504FE0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeLink:(id)a3 reason:(int64_t)a4
{
}

- (void)removeLink:(id)a3 reason:(int64_t)a4 withConversation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self linkManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100103690;
  v13[3] = &unk_100505C08;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 removeLink:v12 deleteReason:a4 completionHandler:v13];
}

- (void)handleReceivedLMIDelegateMessage:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([(CSDConversationManager *)self _linksEnabled])
  {
    id v9 = [v6 conversationGroupUUID];
    if (!v9)
    {
      id v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Dismissing let me in delegation because no groupUUID was set", (uint8_t *)&v38, 2u);
      }
      goto LABEL_38;
    }
    id v10 = [(CSDConversationManager *)self conversationWithGroupUUID:v9];
    id v11 = [v6 letMeInDelegationHandle];
    id v12 = (void *)IDSCopyRawAddressForDestination();
    id v13 = +[TUHandle normalizedHandleWithDestinationID:v12];

    id v14 = +[TUPrivacyManager sharedPrivacyManager];
    LODWORD(v12) = [v14 isIncomingCommunicationBlockedForHandle:v13];

    if (v12)
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 138412546;
        __int16 v39 = v13;
        __int16 v40 = 2112;
        int v41 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Dismissing let me in delegation because the forHandle is blocked {forHandle: %@, fromHandle: %@}", (uint8_t *)&v38, 0x16u);
      }
      goto LABEL_37;
    }
    if (v13)
    {
      id v16 = objc_alloc((Class)TUConversationMember);
      unsigned int v17 = [v6 nickname];
      id v15 = [v16 initWithHandle:v13 nickname:v17 joinedFromLetMeIn:1];

      if ([v6 type] == 14)
      {
        id v18 = objc_alloc((Class)NSUUID);
        CFStringRef v19 = [v6 letMeInDelegationUUID];
        id v20 = [v18 initWithUUIDString:v19];

        id v21 = sub_100008DCC();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v20)
        {
          if (v22)
          {
            int v38 = 138412802;
            __int16 v39 = v7;
            __int16 v40 = 2112;
            int v41 = v13;
            __int16 v42 = 2112;
            id v43 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received LMI delegation message! {fromHandle: %@, forHandle: %@, transactionUUID: %@}", (uint8_t *)&v38, 0x20u);
          }

          [(CSDConversationManager *)self handleDelegatedPendingMemberIfNecessary:v15 conversation:v10 groupUUID:v9 fromHandle:v7 transactionUUID:v20];
          goto LABEL_36;
        }
        if (v22)
        {
          id v36 = [v6 letMeInDelegationUUID];
          int v38 = 138412546;
          __int16 v39 = v7;
          __int16 v40 = 2112;
          int v41 = v36;
          id v37 = "Received LMI delegation, unable to parse transactionUUID -- ignoring! {fromHandle: %@, message.letMeInDe"
                "legationUUID: %@}";
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v38, 0x16u);

          goto LABEL_35;
        }
        goto LABEL_35;
      }
      if ([v6 type] == 15)
      {
        if (v10)
        {
          id v27 = objc_alloc((Class)NSUUID);
          int v28 = [v6 letMeInDelegationUUID];
          id v20 = [v27 initWithUUIDString:v28];

          if (v20)
          {
            unsigned __int8 v29 = [v6 hasIsLetMeInApproved];
            id v21 = sub_100008DCC();
            BOOL v30 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            if (v29)
            {
              if (v30)
              {
                unsigned int v31 = [v6 isLetMeInApproved];
                CFStringRef v32 = @"NO";
                int v38 = 138413058;
                __int16 v39 = v7;
                __int16 v40 = 2112;
                if (v31) {
                  CFStringRef v32 = @"YES";
                }
                int v41 = v13;
                __int16 v42 = 2112;
                id v43 = v20;
                __int16 v44 = 2112;
                CFStringRef v45 = v32;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received LMI delegation response message! {fromHandle: %@, forHandle: %@, transactionUUID: %@, message.letMeInApproval: %@}", (uint8_t *)&v38, 0x2Au);
              }

              unsigned int v33 = [v6 isLetMeInApproved];
              unsigned __int8 v34 = [(CSDConversationManager *)self pendingMembershipTracker];
              unsigned int v35 = v34;
              if (v33) {
                [v34 handleRemoteApprovalOfMember:v15 forConversation:v10 from:v7 transactionUUID:v20];
              }
              else {
                [v34 handleRemoteRejectionOfMember:v15 forConversation:v10 from:v7 transactionUUID:v20];
              }

              goto LABEL_36;
            }
            if (v30)
            {
              int v38 = 138412802;
              __int16 v39 = v7;
              __int16 v40 = 2112;
              int v41 = v13;
              __int16 v42 = 2112;
              id v43 = v20;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received LMI delegation response message, without letMeInApproval -- dropping! {fromHandle: %@, forHandle: %@, transactionUUID: %@}", (uint8_t *)&v38, 0x20u);
            }
            goto LABEL_35;
          }
          id v21 = sub_100008DCC();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v36 = [v6 letMeInDelegationUUID];
            int v38 = 138412546;
            __int16 v39 = v7;
            __int16 v40 = 2112;
            int v41 = v36;
            id v37 = "Received LMI delegation response, unable to parse transactionUUID -- ignoring! {fromHandle: %@, messag"
                  "e.letMeInDelegationUUID: %@}";
            goto LABEL_34;
          }
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
        id v23 = sub_100008DCC();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        int v38 = 138412290;
        __int16 v39 = v9;
        id v24 = "[WARN] Dismissing let me in delegation response because no conversation was found for link's groupUUID: %@";
        unsigned __int8 v25 = v23;
        uint32_t v26 = 12;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v38, v26);
LABEL_17:
      }
    }
    else
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v6 letMeInDelegationHandle];
        int v38 = 138412546;
        __int16 v39 = v7;
        __int16 v40 = 2112;
        int v41 = v23;
        id v24 = "Received LMI delegation, unable to parse forHandle -- ignoring! {fromHandle: %@, message.letMeInDelegationHandle: %@}";
        unsigned __int8 v25 = v15;
        uint32_t v26 = 22;
        goto LABEL_16;
      }
    }
LABEL_37:

LABEL_38:
  }
}

- (void)handleDelegatedPendingMemberIfNecessary:(id)a3 conversation:(id)a4 groupUUID:(id)a5 fromHandle:(id)a6 transactionUUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v14 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v14);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = [v13 remoteMembers];
  id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v31;
    while (2)
    {
      CFStringRef v19 = 0;
      do
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)v19) handle];
        id v21 = [v12 handle];
        unsigned __int8 v22 = [v20 isEquivalentToHandle:v21];

        if (v22)
        {

          uint64_t v23 = sub_100008DCC();
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
            sub_1003AB10C(v12, v23);
          }
          unsigned __int8 v25 = v28;
          id v24 = v29;
          uint32_t v26 = v27;
          goto LABEL_13;
        }
        CFStringRef v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  [v13 setHasReceivedLetMeInRequest:1];
  uint64_t v23 = [(CSDConversationManager *)self notifyPendingMembershipTrackerOfDelegatedMember];
  unsigned __int8 v25 = v28;
  id v24 = v29;
  uint32_t v26 = v27;
  (*(void (**)(uint64_t, id, id, id, id, id))(v23 + 16))(v23, v12, v13, v29, v28, v27);
LABEL_13:
}

- (BOOL)sendMessagesForCreatedOrChangedLink:(id)a3 conversation:(id)a4 messageType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  if (!v9
    || ([v9 remoteMembers],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 count]))
  {
    id v11 = [v8 invitedMemberHandles];
    id v12 = [v11 count];

    if (v9)
    {

      if (!v12) {
        goto LABEL_28;
      }
      id v13 = v9;
    }
    else
    {
      if (!v12) {
        goto LABEL_28;
      }
      id v13 = v8;
    }
    uint64_t v71 = [v13 groupUUID];
    id v14 = [[CSDMessagingConversationMessage alloc] initWithType:v5 groupUUID:v71 link:v8];
    id v15 = [(CSDMessagingConversationMessage *)v14 link];
    [v15 setIsActivated:1];

    id v16 = [v8 originatorHandle];

    if (v16)
    {
      id v17 = [v8 originatorHandle];
      uint64_t v18 = +[CSDMessagingHandle handleWithTUHandle:v17];
      CFStringRef v19 = [(CSDMessagingConversationMessage *)v14 link];
      [v19 setOriginatorHandle:v18];
    }
    id v20 = [v8 creationDate];

    if (v20)
    {
      id v21 = [v8 creationDate];
      [v21 timeIntervalSince1970];
      double v23 = v22;
      id v24 = [(CSDMessagingConversationMessage *)v14 link];
      [v24 setCreationDateEpochTime:v23];
    }
    unsigned __int8 v25 = [v8 expirationDate];

    if (v25)
    {
      uint32_t v26 = [v8 expirationDate];
      [v26 timeIntervalSince1970];
      double v28 = v27;
      id v29 = [(CSDMessagingConversationMessage *)v14 link];
      [v29 setPseudonymExpirationDateEpochTime:v28];
    }
    long long v30 = [v8 invitedMemberHandles];

    v72 = self;
    if (v30)
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v31 = [v8 invitedMemberHandles];
      id v32 = [v31 countByEnumeratingWithState:&v81 objects:v87 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v82;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v82 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v81 + 1) + 8 * i);
            id v37 = [(CSDMessagingConversationMessage *)v14 link];
            int v38 = +[CSDMessagingHandle handleWithTUHandle:v36];
            [v37 addInvitedHandles:v38];
          }
          id v33 = [v31 countByEnumeratingWithState:&v81 objects:v87 count:16];
        }
        while (v33);
      }

      self = v72;
    }
    __int16 v39 = [v8 linkName];

    if (v39)
    {
      __int16 v40 = [v8 linkName];
      int v41 = [(CSDMessagingConversationMessage *)v14 link];
      [v41 setLinkName:v40];
    }
    __int16 v42 = [(CSDMessagingConversationMessage *)v14 data];
    if (v9)
    {
      id v43 = [v9 localMember];
      __int16 v44 = [v43 handle];
      uint64_t v45 = [v44 value];
    }
    else
    {
      id v43 = [v8 originatorHandle];
      uint64_t v45 = [v43 value];
    }

    long long v49 = [(CSDConversationManager *)self service];
    long long v50 = [v49 accountWithCallerID:v45];

    long long v51 = +[NSMutableSet set];
    v70 = (void *)v45;
    if (v9)
    {
      long long v79 = 0uLL;
      long long v80 = 0uLL;
      long long v77 = 0uLL;
      long long v78 = 0uLL;
      long long v52 = [v9 remoteMembers];
      id v53 = [v52 countByEnumeratingWithState:&v77 objects:v86 count:16];
      if (v53)
      {
        id v54 = v53;
        uint64_t v69 = v42;
        uint64_t v55 = *(void *)v78;
        do
        {
          for (j = 0; j != v54; j = (char *)j + 1)
          {
            if (*(void *)v78 != v55) {
              objc_enumerationMutation(v52);
            }
            long long v57 = [*(id *)(*((void *)&v77 + 1) + 8 * (void)j) idsDestination];
            [v51 addObject:v57];
          }
          id v54 = [v52 countByEnumeratingWithState:&v77 objects:v86 count:16];
        }
        while (v54);
LABEL_48:
        __int16 v42 = v69;
      }
    }
    else
    {
      long long v75 = 0uLL;
      long long v76 = 0uLL;
      long long v73 = 0uLL;
      long long v74 = 0uLL;
      long long v52 = [v8 invitedMemberHandles];
      v58 = (char *)[v52 countByEnumeratingWithState:&v73 objects:v85 count:16];
      if (v58)
      {
        v59 = v58;
        uint64_t v69 = v42;
        uint64_t v60 = *(void *)v74;
        do
        {
          for (k = 0; k != v59; ++k)
          {
            if (*(void *)v74 != v60) {
              objc_enumerationMutation(v52);
            }
            __int16 v62 = TUCopyIDSCanonicalAddressForHandle();
            [v51 addObject:v62];
          }
          v59 = (char *)[v52 countByEnumeratingWithState:&v73 objects:v85 count:16];
        }
        while (v59);
        goto LABEL_48;
      }
    }

    if (v9)
    {
      id v63 = [v9 localMember];
    }
    else
    {
      id v64 = objc_alloc((Class)TUConversationMember);
      CFStringRef v65 = [v8 originatorHandle];
      id v63 = [v64 initWithHandle:v65];
    }
    __int16 v66 = [(CSDConversationManager *)v72 sendDataBlock];
    CFStringRef v67 = [v9 capabilitySendMessageOptions];
    char v48 = ((uint64_t (**)(void, void *, void *, void *, id, void *, void, void, void))v66)[2](v66, v42, v50, v51, v63, v67, 0, 0, 0);

    CFStringRef v46 = v71;
    goto LABEL_53;
  }

LABEL_28:
  CFStringRef v46 = sub_100008DCC();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v47 = [v9 UUID];
    *(_DWORD *)buf = 138412546;
    id v89 = v8;
    __int16 v90 = 2112;
    CFStringRef v91 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "No invited members or conversation members were specified; no need to send messages (link: %@, conversation UUID: %@)",
      buf,
      0x16u);
  }
  char v48 = 0;
LABEL_53:

  return v48;
}

- (BOOL)sendMessagesForInvalidatedLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [CSDMessagingConversationMessage alloc];
  id v7 = [v4 groupUUID];
  id v8 = [(CSDMessagingConversationMessage *)v6 initWithType:24 groupUUID:v7 link:v4];

  id v9 = [v4 originatorHandle];

  if (v9)
  {
    id v10 = [v4 originatorHandle];
    id v11 = +[CSDMessagingHandle handleWithTUHandle:v10];
    id v12 = [(CSDMessagingConversationMessage *)v8 link];
    [v12 setOriginatorHandle:v11];
  }
  long long v31 = v8;
  id v13 = [(CSDMessagingConversationMessage *)v8 data];
  id v14 = [(CSDConversationManager *)self service];
  id v15 = [v4 originatorHandle];
  id v16 = [v15 value];
  id v17 = [v14 accountWithCallerID:v16];

  uint64_t v18 = +[NSMutableSet set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  CFStringRef v19 = [v4 invitedMemberHandles];
  id v20 = (char *)[v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      double v23 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = TUCopyIDSCanonicalAddressForHandle();
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      id v21 = (char *)[v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }

  id v25 = objc_alloc((Class)TUConversationMember);
  uint32_t v26 = [v4 originatorHandle];
  id v27 = [v25 initWithHandle:v26];

  double v28 = [(CSDConversationManager *)self sendDataBlock];
  char v29 = ((uint64_t (**)(void, void *, void *, void *, id, void, void, void, void))v28)[2](v28, v13, v17, v18, v27, 0, 0, 0, 0);

  return v29;
}

- (void)requestParticipant:(id)a3 toScreenShareWithRequest:(id)a4 conversation:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self featureFlags];
  unsigned int v11 = [v10 requestToScreenShareEnabled];

  if (v11)
  {
    id v12 = [(CSDConversationManager *)self queue];
    dispatch_assert_queue_V2(v12);

    id v13 = [v9 groupUUID];
    id v14 = [[CSDMessagingConversationMessage alloc] initWithType:35 groupUUID:v13 link:0];
    id v15 = [[CSDMessagingScreenShareContext alloc] initOutgoingRequestWithScreenSharingRequest:v8];
    [(CSDMessagingConversationMessage *)v14 setScreenShareContext:v15];
    [(CSDConversationManager *)self sendDataForScreenShareMessage:v14 toParticipant:v16 conversation:v9];
  }
}

- (void)requestParticipant:(id)a3 toCancelScreenShareRequest:(id)a4 conversation:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self featureFlags];
  unsigned int v11 = [v10 requestToScreenShareEnabled];

  if (v11)
  {
    id v12 = [(CSDConversationManager *)self queue];
    dispatch_assert_queue_V2(v12);

    id v13 = [v9 groupUUID];
    id v14 = [[CSDMessagingConversationMessage alloc] initWithType:35 groupUUID:v13 link:0];
    id v15 = [[CSDMessagingScreenShareContext alloc] initOutgoingRequestWithScreenSharingRequest:v8];
    [v15 setType:2];
    [(CSDMessagingConversationMessage *)v14 setScreenShareContext:v15];
    [(CSDConversationManager *)self sendDataForScreenShareMessage:v14 toParticipant:v16 conversation:v9];
  }
}

- (void)denyScreenShareRequestFrom:(id)a3 screenShareRequest:(id)a4 conversation:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self featureFlags];
  unsigned int v11 = [v10 requestToScreenShareEnabled];

  if (v11)
  {
    id v12 = [(CSDConversationManager *)self queue];
    dispatch_assert_queue_V2(v12);

    id v13 = [v9 groupUUID];
    id v14 = [[CSDMessagingConversationMessage alloc] initWithType:36 groupUUID:v13 link:0];
    id v15 = [[CSDMessagingScreenShareContext alloc] initOutgoingRequestWithScreenSharingRequest:v8];
    [v15 setType:3];
    [(CSDMessagingConversationMessage *)v14 setScreenShareContext:v15];
    [(CSDConversationManager *)self sendDataForScreenShareMessage:v14 toParticipant:v16 conversation:v9];
  }
}

- (void)sendDataForScreenShareMessage:(id)a3 toParticipant:(id)a4 conversation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned int v11 = [v9 localMember];
  id v12 = [v11 handle];
  id v13 = [v12 value];

  id v14 = [(CSDConversationManager *)self service];
  id v15 = [v14 accountWithCallerID:v13];

  id v16 = [v9 localMember];
  id v17 = [v10 activeIDSDestination];

  uint64_t v18 = +[NSMutableSet setWithObject:v17];

  CFStringRef v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = v8;
    __int16 v25 = 2112;
    uint32_t v26 = v13;
    __int16 v27 = 2112;
    double v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending screen share request message %@ from handle %@ to handle %@", buf, 0x20u);
  }

  id v20 = [(CSDConversationManager *)self sendDataBlock];
  id v21 = [v8 data];
  uint64_t v22 = [v9 capabilitySendMessageOptions];
  ((void (**)(void, void *, void *, void *, void *, void *, void, void, void))v20)[2](v20, v21, v15, v18, v16, v22, 0, 0, 0);
}

- (void)handleReceivedUpdateJoinedMetadataMessage:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManager *)self featureFlags];
  unsigned int v10 = [v9 conversationHandoffEnabled];

  if (v10)
  {
    if (![(CSDConversationManager *)self isValidLocalHandle:v7])
    {
      unsigned int v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v51 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] UpdateJoinedMetadata conversation message was sent by a non-local handle %@, dropping message.", buf, 0xCu);
      }
      goto LABEL_37;
    }
    unsigned int v11 = [v6 conversationGroupUUID];
    if (!v11)
    {
      id v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] UpdateJoinedMetadata conversation message was missing a group UUID, dropping message.", buf, 2u);
      }
      goto LABEL_36;
    }
    id v12 = [v6 joinedMetadata];
    id v13 = v12;
    if (!v12)
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] UpdateJoinedMetadata conversation message was missing a joined metadata object, dropping message.", buf, 2u);
      }
      goto LABEL_35;
    }
    uint64_t v45 = v12;
    id v14 = [v12 sender];
    id v15 = [v14 csdConversationParticipant];

    if (v15)
    {
      id v16 = [v45 sender];
      if ([v16 hasIdentifier])
      {
        id v17 = [v15 identifier];

        if (v17)
        {
          uint64_t v18 = [(CSDConversationManager *)self conversationWithGroupUUID:v11];
          __int16 v44 = v18;
          if (!v18)
          {
            long long v35 = sub_100008DCC();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v51 = v11;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[WARN] No conversation was found for group UUID %@, dropping UpdateJoinedMetadata message.", buf, 0xCu);
            }
            id v13 = v45;
            goto LABEL_50;
          }
          id v43 = v11;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          CFStringRef v19 = [v18 activeRemoteParticipants];
          id v20 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
          if (v20)
          {
            id v21 = v20;
            int v41 = v7;
            id v42 = v6;
            char v22 = 0;
            uint64_t v23 = *(void *)v47;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v47 != v23) {
                  objc_enumerationMutation(v19);
                }
                __int16 v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                uint32_t v26 = [v15 handle];
                __int16 v27 = [v25 handle];
                if ([v26 isEquivalentToHandle:v27])
                {
                  id v28 = [v15 identifier];
                  LOBYTE(v28) = v28 == [v25 identifier];

                  v22 |= v28;
                }
                else
                {
                }
              }
              id v21 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
            }
            while (v21);

            id v7 = v41;
            id v6 = v42;
            if (v22)
            {
              id v13 = v45;
              char v29 = [v45 audioRouteUniqueIdentifier];

              long long v30 = sub_100008DCC();
              BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
              if (v29)
              {
                unsigned int v11 = v43;
                if (v31)
                {
                  long long v32 = [v45 audioRouteUniqueIdentifier];
                  id v33 = [v15 identifier];
                  long long v34 = [v44 UUID];
                  *(_DWORD *)buf = 138412802;
                  long long v51 = v32;
                  __int16 v52 = 2048;
                  id v53 = v33;
                  __int16 v54 = 2112;
                  uint64_t v55 = v34;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Per UpdateJoinedMetadata message, the local user was using %@ audio route from another device with participant identifier %llu in conversation UUID %@", buf, 0x20u);

                  id v13 = v45;
                }

                long long v35 = [v13 audioRouteUniqueIdentifier];
                uint64_t v36 = [v44 audioRoutesByParticipantIdentifier];
                id v37 = +[NSNumber numberWithUnsignedLongLong:[v15 identifier]];
                [v36 setObject:v35 forKeyedSubscript:v37];
              }
              else
              {
                unsigned int v11 = v43;
                if (v31)
                {
                  __int16 v39 = [v15 identifier];
                  __int16 v40 = [v44 UUID];
                  *(_DWORD *)buf = 134218242;
                  long long v51 = v39;
                  __int16 v52 = 2112;
                  id v53 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Per UpdateJoinedMetadata message, the local user was using a default audio route from another device with participant identifier %llu in conversation UUID %@; no need to track a route.",
                    buf,
                    0x16u);
                }
                long long v35 = [v44 audioRoutesByParticipantIdentifier];
                uint64_t v36 = +[NSNumber numberWithUnsignedLongLong:[v15 identifier]];
                [v35 setObject:0 forKeyedSubscript:v36];
              }

LABEL_50:
              int v38 = v44;
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
              goto LABEL_38;
            }
          }
          else
          {
          }
          long long v35 = sub_100008DCC();
          id v13 = v45;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v51 = v15;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find a matching participant for sender %@, dropping UpdateJoinedMetadata message.", buf, 0xCu);
          }
          unsigned int v11 = v43;
          goto LABEL_50;
        }
      }
      else
      {
      }
    }
    int v38 = sub_100008DCC();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[WARN] UpdateJoinedMetadata conversation message was missing a valid participant, dropping message.", buf, 2u);
    }
    id v13 = v45;
    goto LABEL_34;
  }
LABEL_38:
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5 fromMember:(id)a6 additionalOptions:(id)a7 isBlobResponse:(BOOL)a8 callback:(id)a9
{
  BOOL v63 = a8;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v18 = a7;
  id v66 = a3;
  CFStringRef v19 = [(CSDConversationManager *)self featureFlags];
  if ([v19 groupFacetimeAsAServiceEnabled])
  {
    id v20 = [v14 provider];

    if (v20)
    {
      id v21 = +[CSDConversationProviderManager sharedInstance];
      char v22 = [v14 provider];
      uint64_t v23 = [v21 serviceForProvider:v22];

      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v23 = [(CSDConversationManager *)self service];
LABEL_6:
  CFStringRef v67 = v16;
  id v24 = [v16 handle];
  __int16 v25 = [v24 value];
  uint64_t v26 = [v23 accountWithCallerID:v25];

  __int16 v27 = sub_100008DCC();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = TULoggableStringForHandle();
    *(_DWORD *)buf = 138412546;
    uint64_t v70 = v26;
    __int16 v71 = 2112;
    id v72 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending data from: %@ to: %@", buf, 0x16u);
  }
  id v29 = [v18 mutableCopy];

  long long v30 = [v14 capabilitySendMessageOptions];

  id v68 = v15;
  id v64 = (void *)v26;
  CFStringRef v65 = v23;
  if (v30)
  {
    if (!v29) {
      id v29 = objc_alloc_init((Class)NSMutableDictionary);
    }
    BOOL v31 = [v14 capabilitySendMessageOptions];
    uint64_t v32 = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
    id v33 = [v31 objectForKeyedSubscript:IDSSendMessageOptionRequireAllRegistrationPropertiesKey];
    long long v34 = v33;
    if (v33)
    {
      id v35 = v33;
    }
    else
    {
      id v35 = +[NSSet set];
    }
    __int16 v40 = v35;
    int v41 = self;

    id v42 = [v29 objectForKeyedSubscript:v32];

    id v43 = v17;
    if (v42)
    {
      __int16 v44 = [v29 objectForKeyedSubscript:v32];
      uint64_t v45 = [v40 setByAddingObjectsFromSet:v44];

      __int16 v40 = (void *)v45;
    }
    long long v46 = [v14 capabilitySendMessageOptions];
    uint64_t v47 = IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey;
    long long v48 = [v46 objectForKeyedSubscript:IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey];
    long long v49 = v48;
    if (v48)
    {
      id v50 = v48;
    }
    else
    {
      id v50 = +[NSSet set];
    }
    long long v51 = v50;

    __int16 v52 = [v29 objectForKeyedSubscript:v47];

    if (v52)
    {
      id v53 = [v29 objectForKeyedSubscript:v47];
      uint64_t v54 = [v51 setByAddingObjectsFromSet:v53];

      long long v51 = (void *)v54;
    }
    uint64_t v55 = v43;
    long long v56 = [v14 capabilitySendMessageOptions];
    [v29 addEntriesFromDictionary:v56];

    self = v41;
    if ([v40 count]) {
      [v29 setObject:v40 forKeyedSubscript:v32];
    }
    if ([v51 count]) {
      [v29 setObject:v51 forKeyedSubscript:v47];
    }
    if (v63)
    {
      long long v57 = sub_100008DCC();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v70 = v32;
        __int16 v71 = 2112;
        id v72 = v29;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "blob response, removing %@ from options: %@", buf, 0x16u);
      }

      [v29 setObject:0 forKeyedSubscript:v32];
    }
    id v37 = v14;
    int v38 = v55;

    __int16 v39 = v68;
  }
  else
  {
    id v36 = v15;
    id v37 = v14;
    int v38 = v17;
    __int16 v39 = v36;
  }
  v58 = [v37 groupUUID];
  [v29 setObject:v58 forKeyedSubscript:@"kCSDConversationGroupUUID"];

  v59 = [(CSDConversationManager *)self sendDataBlock];
  uint64_t v60 = +[NSSet setWithObject:v39];
  v61 = [v37 provider];
  LOBYTE(v58) = ((uint64_t (**)(void, id, void *, void *, void *, id, void, void *, void *))v59)[2](v59, v66, v64, v60, v67, v29, 0, v38, v61);

  return (char)v58;
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5 fromMember:(id)a6
{
  return [(CSDConversationManager *)self sendData:a3 onConversation:a4 toDestinationID:a5 fromMember:a6 additionalOptions:0 isBlobResponse:0 callback:0];
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned int v11 = [v9 localMember];
  LOBYTE(self) = [(CSDConversationManager *)self sendData:v10 onConversation:v9 toDestinationID:v8 fromMember:v11 additionalOptions:0 isBlobResponse:0 callback:0];

  return (char)self;
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toHandle:(id)a5
{
  return [(CSDConversationManager *)self sendData:a3 onConversation:a4 toHandle:a5 isBlobResponse:0];
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toHandle:(id)a5 isBlobResponse:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = TUCopyIDSCanonicalAddressForHandle();
  if (v13)
  {
    id v14 = [v11 localMember];
    BOOL v15 = [(CSDConversationManager *)self sendData:v10 onConversation:v11 toDestinationID:v13 fromMember:v14 additionalOptions:0 isBlobResponse:v6 callback:0];
  }
  else
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Could not convert %@ to IDS destination", buf, 0xCu);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toMember:(id)a5 additionalOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 idsDestination];
  if (v14)
  {
    BOOL v15 = [v12 idsDestination];
    id v16 = [v11 localMember];
    BOOL v17 = [(CSDConversationManager *)self sendData:v10 onConversation:v11 toDestinationID:v15 fromMember:v16 additionalOptions:v13 isBlobResponse:0 callback:0];
  }
  else
  {
    id v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Could not convert %@ to IDS destination", buf, 0xCu);
    }

    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toMember:(id)a5
{
  return [(CSDConversationManager *)self sendData:a3 onConversation:a4 toMember:a5 additionalOptions:0];
}

- (BOOL)broadcastFile:(id)a3 onConversation:(id)a4 additionalOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 localMember];
  id v12 = v11;
  if (v11)
  {
    long long v56 = v11;
    id v13 = [v11 idsDestination];
    id v14 = +[NSMutableSet setWithObject:v13];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    BOOL v15 = [v9 remoteMembers];
    id v16 = [v15 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v64;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v64 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(*((void *)&v63 + 1) + 8 * i) idsDestination];
          [v14 addObject:v20];
        }
        id v17 = [v15 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v17);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v21 = [v9 lightweightMembers];
    id v22 = [v21 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v60;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v60 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)j) idsDestination];
          [v14 addObject:v26];
        }
        id v23 = [v21 countByEnumeratingWithState:&v59 objects:v71 count:16];
      }
      while (v23);
    }

    __int16 v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [v56 idsFromID];
      id v29 = TULoggableStringForHandle();
      long long v30 = [v14 allObjects];
      TULoggableStringForHandles();
      uint64_t v32 = v31 = v8;
      *(_DWORD *)buf = 138412546;
      id v68 = v29;
      __int16 v69 = 2112;
      uint64_t v70 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Broadcasting file from: %@ to: %@", buf, 0x16u);

      id v8 = v31;
    }

    id v33 = [v10 mutableCopy];
    long long v34 = v33;
    if (v33) {
      id v35 = v33;
    }
    else {
      id v35 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v37 = v35;

    int v38 = [v9 capabilitySendMessageOptions];

    if (v38)
    {
      __int16 v39 = [v9 capabilitySendMessageOptions];
      [v37 addEntriesFromDictionary:v39];
    }
    [v37 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionAlwaysSkipSelfKey];
    __int16 v40 = [v56 idsFromID];
    [v37 setObject:v40 forKeyedSubscript:IDSSendMessageOptionFromIDKey];

    int v41 = [(CSDConversationManager *)self featureFlags];
    id v55 = v10;
    if ([v41 groupFacetimeAsAServiceEnabled])
    {
      id v42 = [v9 provider];

      if (v42)
      {
        id v43 = +[CSDConversationProviderManager sharedInstance];
        __int16 v44 = [v9 provider];
        uint64_t v45 = [v43 serviceForProvider:v44];

LABEL_31:
        long long v46 = [v45 service];
        id v47 = v8;
        long long v48 = +[NSURL fileURLWithPath:v8];
        id v57 = 0;
        id v58 = 0;
        unsigned __int8 v49 = [v46 sendResourceAtURL:v48 metadata:0 toDestinations:v14 priority:300 options:v37 identifier:&v58 error:&v57];
        id v50 = v58;
        id v51 = v57;

        if (v51) {
          BOOL v36 = 0;
        }
        else {
          BOOL v36 = v49;
        }
        __int16 v52 = sub_100008DCC();
        id v53 = v52;
        if (v36)
        {
          id v12 = v56;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v68 = v50;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Sent broadcast image message with id %@", buf, 0xCu);
          }
        }
        else
        {
          id v12 = v56;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_1003AB200();
          }
        }

        id v8 = v47;
        id v10 = v55;
        goto LABEL_40;
      }
    }
    else
    {
    }
    uint64_t v45 = [(CSDConversationManager *)self service];
    goto LABEL_31;
  }
  id v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1003AB198();
  }
  BOOL v36 = 0;
LABEL_40:

  return v36;
}

- (BOOL)broadcastData:(id)a3 onConversation:(id)a4 additionalOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v47 = a5;
  id v10 = [(CSDConversationManager *)self featureFlags];
  if ([v10 groupFacetimeAsAServiceEnabled])
  {
    id v11 = [v9 provider];

    if (v11)
    {
      id v12 = +[CSDConversationProviderManager sharedInstance];
      id v13 = [v9 provider];
      id v14 = [v12 serviceForProvider:v13];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v14 = [(CSDConversationManager *)self service];
LABEL_6:
  BOOL v15 = [v9 localMember];
  id v16 = [v15 handle];
  id v17 = [v16 value];
  uint64_t v18 = [v14 accountWithCallerID:v17];

  if (v15)
  {
    uint64_t v45 = v14;
    id v46 = v8;
    id v19 = [v15 idsDestination];
    id v20 = +[NSMutableSet setWithObject:v19];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v21 = [v9 remoteMembers];
    id v22 = [v21 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v53;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v53 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v52 + 1) + 8 * i) idsDestination];
          [v20 addObject:v26];
        }
        id v23 = [v21 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v23);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    __int16 v27 = [v9 lightweightMembers];
    id v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v49;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v49 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) idsDestination];
          [v20 addObject:v32];
        }
        id v29 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }
      while (v29);
    }

    id v33 = sub_100008DCC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v57 = v18;
      __int16 v58 = 2112;
      long long v59 = v20;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Broadcasting data from: %@ to: %@", buf, 0x16u);
    }

    long long v34 = v47;
    id v35 = [v47 mutableCopy];
    BOOL v36 = v35;
    if (v35) {
      id v37 = v35;
    }
    else {
      id v37 = objc_alloc_init((Class)NSMutableDictionary);
    }
    __int16 v39 = v37;

    __int16 v40 = [v9 capabilitySendMessageOptions];

    if (v40)
    {
      int v41 = [v9 capabilitySendMessageOptions];
      [v39 addEntriesFromDictionary:v41];
    }
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionAlwaysSkipSelfKey];
    id v42 = [(CSDConversationManager *)self sendDataBlock];
    id v43 = [v9 provider];
    char v38 = ((uint64_t (**)(void, id, void *, NSObject *, void *, void *, void, void, void *))v42)[2](v42, v46, v18, v20, v15, v39, 0, 0, v43);

    id v8 = v46;
    id v14 = v45;
  }
  else
  {
    id v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1003AB268();
    }
    char v38 = 0;
    long long v34 = v47;
  }

  return v38;
}

- (BOOL)broadcastData:(id)a3 onConversation:(id)a4
{
  return [(CSDConversationManager *)self broadcastData:a3 onConversation:a4 additionalOptions:0];
}

- (void)broadcastImageForSession:(id)a3 onConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v55 = v7;
    __int16 v56 = 2112;
    id v57 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "conversation: %@ broadcastImageForSession: %@", buf, 0x16u);
  }

  id v10 = [v6 activity];
  id v11 = [v10 metadata];
  id v12 = [v11 imageData];

  if (v12)
  {
    id v13 = [CSDMessagingConversationMessage alloc];
    id v14 = [v7 groupUUID];
    BOOL v15 = [(CSDMessagingConversationMessage *)v13 initWithType:27 groupUUID:v14 link:0];

    id v16 = objc_alloc_init(CSDMessagingConversationActivitySession);
    id v17 = [v6 UUID];
    [v17 UUIDString];
    uint64_t v18 = v51 = v7;
    [(CSDMessagingConversationActivitySession *)v16 setIdentifierUUIDString:v18];

    id v19 = [v6 activity];
    id v20 = objc_alloc_init(CSDMessagingConversationActivity);
    id v21 = [v19 UUID];
    id v22 = [v21 UUIDString];
    [(CSDMessagingConversationActivity *)v20 setIdentifierUUIDString:v22];

    id v23 = objc_alloc_init(CSDMessagingConversationActivityMetadata);
    long long v48 = v19;
    uint64_t v24 = [v19 metadata];
    __int16 v25 = [v24 imageData];
    id v26 = [v25 _FTCopyGzippedData];
    [(CSDMessagingConversationActivityMetadata *)v23 setImage:v26];

    long long v50 = v23;
    [(CSDMessagingConversationActivity *)v20 setActivityMetadata:v23];
    [(CSDMessagingConversationActivitySession *)v16 setActivity:v20];
    id v47 = v16;
    [(CSDMessagingConversationMessage *)v15 addActivitySessions:v16];
    v60[0] = IDSSendMessageOptionPublicMessageIntentKey;
    __int16 v27 = +[NSNumber numberWithInt:[(CSDMessagingConversationMessage *)v15 type]];
    v61[0] = v27;
    v60[1] = IDSSendMessageOptionQueueOneIdentifierKey;
    id v28 = [v6 UUID];
    id v29 = [v28 UUIDString];
    uint64_t v30 = +[NSNumber numberWithInt:[(CSDMessagingConversationMessage *)v15 type]];
    id v31 = +[NSString stringWithFormat:@"%@:%@", v29, v30];
    v61[1] = v31;
    uint64_t v32 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];

    id v33 = [(CSDConversationManager *)self temporaryFilePath];
    long long v34 = [(CSDMessagingConversationMessage *)v15 data];
    id v53 = 0;
    [v34 writeToFile:v33 options:1073741825 error:&v53];
    id v35 = v53;

    long long v49 = (void *)v32;
    if (v35)
    {
      BOOL v36 = sub_100008DCC();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = [v6 activity];
        id v46 = [v45 UUID];
        *(_DWORD *)buf = 138412802;
        id v55 = v46;
        __int16 v56 = 2112;
        id v57 = v33;
        __int16 v58 = 2112;
        id v59 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Error transmitting activity session %@ image. Failed to write to path %@ with error %@", buf, 0x20u);
      }
      id v7 = v51;
      id v37 = v47;
      char v38 = v48;
    }
    else
    {
      id v7 = v51;
      unsigned int v39 = [(CSDConversationManager *)self broadcastFile:v33 onConversation:v51 additionalOptions:v32];
      __int16 v40 = sub_100008DCC();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = [v6 activity];
        id v42 = [v41 UUID];
        *(_DWORD *)buf = 138412546;
        id v55 = v42;
        __int16 v56 = 1024;
        LODWORD(v57) = v39;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "(broadcastImageForSession activity UUID: %@ success: %d).", buf, 0x12u);

        id v7 = v51;
      }

      id v43 = +[NSFileManager defaultManager];
      id v52 = 0;
      [v43 removeItemAtPath:v33 error:&v52];
      BOOL v36 = v52;

      id v37 = v47;
      if (v36)
      {
        __int16 v44 = sub_100008DCC();
        char v38 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_1003AB2D0();
        }
      }
      else
      {
        char v38 = v48;
      }
    }
  }
}

- (void)broadcastLightweightEndorsementForAddedMembers:(id)a3 onConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "conversation: %@ broadcastLightweightEndorsementForAddedMembers: %@", buf, 0x16u);
  }

  id v10 = [v7 localLightweightSecondaryMember];
  if (v10)
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v7 UUID];
      *(_DWORD *)buf = 138412546;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "conversation: %@ has a splitSessionSecondary (%@), sending verification push", buf, 0x16u);
    }
    id v13 = [CSDMessagingConversationMessage alloc];
    id v14 = [v7 groupUUID];
    BOOL v15 = [(CSDMessagingConversationMessage *)v13 initWithType:29 groupUUID:v14 link:0];

    id v16 = +[CSDMessagingConversationMember memberWithTUConversationMember:v10];
    [(CSDMessagingConversationMessage *)v15 addAddedMembers:v16];

    id v17 = [(CSDMessagingConversationMessage *)v15 data];
    uint64_t v18 = +[NSNumber numberWithInt:[(CSDMessagingConversationMessage *)v15 type]];
    id v23 = v18;
    id v19 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

    unsigned int v20 = [(CSDConversationManager *)self broadcastData:v17 onConversation:v7 additionalOptions:v19];
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "(success: %d).", buf, 8u);
    }
  }
}

- (id)memberExistsForParticipantDestination:(id)a3 members:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = TUHandleForIDSCanonicalAddress();
  if (!v7)
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = TULoggableStringForHandle();
      *(_DWORD *)buf = 138412290;
      id v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't create handle from participant destination identifier %@", buf, 0xCu);
    }
LABEL_14:

LABEL_15:
    id v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = TULoggableStringForHandle();
      *(_DWORD *)buf = 138412546;
      id v29 = v20;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't find participant destination identifier %@ in members %@", buf, 0x16u);
    }
    id v21 = 0;
    goto LABEL_19;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v9) {
    goto LABEL_14;
  }
  id v10 = v9;
  id v23 = v6;
  uint64_t v11 = *(void *)v25;
LABEL_4:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v25 != v11) {
      objc_enumerationMutation(v8);
    }
    id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
    id v14 = [v13 handle];
    BOOL v15 = [v14 normalizedValue];

    if (v15)
    {
      id v16 = [v7 normalizedValue];
      unsigned __int8 v17 = [v16 isEqualToString:v15];

      if (v17) {
        break;
      }
    }

    if (v10 == (id)++v12)
    {
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v10) {
        goto LABEL_4;
      }
      id v6 = v23;
      goto LABEL_14;
    }
  }
  id v21 = v13;

  id v6 = v23;
  if (!v21) {
    goto LABEL_15;
  }
LABEL_19:

  return v21;
}

- (id)memberExistsForParticipantDestination:(id)a3 groupSessionParticipantUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch((unint64_t)[v7 participantUpdateType])
  {
    case 0uLL:
      unsigned int v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Received unknown participant update message", (uint8_t *)&v23, 2u);
      }

      goto LABEL_11;
    case 1uLL:
    case 3uLL:
      id v8 = [CSDMessagingConversationParticipantDidJoinContext alloc];
      id v9 = [v7 clientContextData];
      id v10 = [(CSDMessagingConversationParticipantDidJoinContext *)v8 initWithData:v9];

      uint64_t v11 = [v10 data];
      id v12 = [v11 length];

      if (v12)
      {
        if ([v10 isLightweight]) {
          [v10 tuLightweightMembers];
        }
        else {
        id v14 = [v10 tuConversationMembers];
        }
        id v19 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v6 members:v14];
LABEL_26:
      }
      else
      {
        id v21 = sub_100008DCC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't decode message due to invalid data length.", (uint8_t *)&v23, 2u);
        }

LABEL_16:
        id v19 = 0;
      }

      return v19;
    case 2uLL:
    case 4uLL:
      id v10 = [v7 groupUUID];
      if (v10)
      {
        id v13 = [(CSDConversationManager *)self conversationWithGroupUUID:v10];
        id v14 = v13;
        if (v13)
        {
          BOOL v15 = [v13 remoteMembers];
          id v16 = [v15 mutableCopy];

          unsigned __int8 v17 = [v14 localMember];
          [v16 addObject:v17];

          uint64_t v18 = [v14 lightweightMembers];
          [v16 unionSet:v18];

          id v19 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v6 members:v16];
        }
        else
        {
          id v16 = sub_100008DCC();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = 138412290;
            long long v24 = v10;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't find conversation with groupUUID %@", (uint8_t *)&v23, 0xCu);
          }
          id v19 = 0;
        }
      }
      else
      {
        id v14 = sub_100008DCC();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't decode message due to invalid groupUUID", (uint8_t *)&v23, 2u);
        }
        id v19 = 0;
      }
      goto LABEL_26;
    default:
LABEL_11:
      id v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to find members from message", (uint8_t *)&v23, 2u);
      }
      goto LABEL_16;
  }
}

- (BOOL)shouldAcceptMessageFromHandle:(id)a3 messageContext:(id)a4 message:(id)a5 existingConversation:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![(CSDConversationManager *)self verifyMessageIntentKeyFromContext:a4 message:v11])
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AB470();
    }
    goto LABEL_20;
  }
  if (![(CSDConversationManager *)self verifyKickMemberPermittedFromHandle:v10 message:v11])
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AB43C();
    }
    goto LABEL_20;
  }
  if (![(CSDConversationManager *)self verifyActivitySessionOriginatorFromHandle:v10 message:v11])
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AB408();
    }
    goto LABEL_20;
  }
  if (![(CSDConversationManager *)self verifyBlobResponseFromHandle:v10 message:v11 existingConversation:v12])
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AB3D4();
    }
    goto LABEL_20;
  }
  if (![(CSDConversationManager *)self verifyLightweightMessageTypeFromHandle:v10 message:v11 existingConversation:v12])
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AB3A0();
    }
    goto LABEL_20;
  }
  if (![(CSDConversationManager *)self verifyEndorseRepresentsMemberFromHandle:v10 message:v11 existingConversation:v12])
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AB36C();
    }
LABEL_20:

    BOOL v13 = 0;
    goto LABEL_21;
  }
  BOOL v13 = 1;
LABEL_21:

  return v13;
}

- (BOOL)shouldAcceptMembershipUpdateFromHandle:(id)a3 joinContext:(id)a4 participantUpdate:(id)a5 existingConversation:(id)a6
{
  id v40 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = +[NSMutableSet set];
  id v14 = +[NSMutableSet set];
  BOOL v15 = [v10 message];
  char v38 = self;
  unsigned int v39 = v11;
  if (v12)
  {
    id v16 = [v12 remoteMembers];
    [v13 unionSet:v16];

    unsigned __int8 v17 = [v12 lightweightMembers];
    [v14 unionSet:v17];

    uint64_t v18 = [v12 localMember];
    unsigned int v19 = [v18 isLightweightMember];

    unsigned int v20 = [v12 localMember];
    if (v19) {
      id v21 = v14;
    }
    else {
      id v21 = v13;
    }
    [v21 addObject:v20];
  }
  else
  {
    uint64_t v22 = [v10 tuConversationMembers];
    [v13 unionSet:v22];

    unsigned int v20 = [v10 tuLightweightMembers];
    [v14 unionSet:v20];
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  int v23 = [v15 addedMembers];
  id v24 = [v23 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v46;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v45 + 1) + 8 * i) tuConversationMember];
        [v13 addObject:v28];
      }
      id v25 = [v23 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v25);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v29 = [v15 lightweightMembers];
  id v30 = [v29 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v29);
        }
        long long v34 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) tuConversationMember];
        [v14 addObject:v34];
      }
      id v31 = [v29 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v31);
  }

  if (![(CSDConversationManager *)v38 verifyGroupSessionParticipantUpdateAllowedFromHandle:v40 participantUpdate:v39 message:v15 existingConversation:v12 lightweightMembers:v14])
  {
    BOOL v36 = sub_100008DCC();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1003AB4A4();
    }
    goto LABEL_28;
  }
  if (![(CSDConversationManager *)v38 verifyAllLightweightmembersAssociated:v14 remoteMembers:v13])
  {
    BOOL v36 = sub_100008DCC();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v40;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not all lightweightMembers have an associated lightweightPrimary in the conversation, dropping message fromHandle: %@", buf, 0xCu);
    }
LABEL_28:

    BOOL v35 = 0;
    goto LABEL_29;
  }
  BOOL v35 = 1;
LABEL_29:

  return v35;
}

- (BOOL)verifyKickMemberPermittedFromHandle:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 type] == 19)
  {
    id v7 = [v6 removedMembers];
    id v8 = [v7 count];

    if (v8)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = objc_msgSend(v6, "removedMembers", 0);
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) handle];
            BOOL v15 = [v14 tuHandle];

            if ([v15 isEquivalentToHandle:v5])
            {
              unsigned __int8 v17 = sub_100008DCC();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                sub_1003AB5A0();
              }

              goto LABEL_18;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          BOOL v16 = 1;
          if (v11) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v16 = 1;
      }
    }
    else
    {
      id v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1003AB50C();
      }
LABEL_18:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)verifyActivitySessionOriginatorFromHandle:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 type] == 8 || objc_msgSend(v6, "type") == 23)
  {
    id v7 = [v6 activitySessions];
    id v8 = [v7 count];

    if (v8)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = objc_msgSend(v6, "activitySessions", 0);
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v10)
      {
        BOOL v17 = 1;
        goto LABEL_24;
      }
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v13) activity];
        BOOL v15 = [v14 originatorHandle];
        BOOL v16 = [v15 tuHandle];

        if (!v16) {
          break;
        }
        if (([v16 isEquivalentToHandle:v5] & 1) == 0)
        {
          uint64_t v18 = sub_100008DCC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_1003AB69C();
          }
LABEL_22:

          goto LABEL_23;
        }

        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          BOOL v17 = 1;
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_24;
        }
      }
      uint64_t v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1003AB608();
      }
      goto LABEL_22;
    }
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003AB50C();
    }
LABEL_23:
    BOOL v17 = 0;
LABEL_24:
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)verifyMessageIntentKeyFromContext:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v6 type];
  if (v7 <= 0x24)
  {
    if (((1 << v7) & 0x18D569FE7FLL) != 0)
    {
      BOOL v8 = 1;
      goto LABEL_6;
    }
    if (((1 << v7) & 0x62A800100) != 0)
    {
      id v9 = [v5 publicIntentAction];
      id v10 = [v9 integerValue];
      BOOL v8 = v10 == (id)(int)[v6 type];

      goto LABEL_6;
    }
  }
  uint64_t v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1003AB704();
  }

  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)verifyBlobResponseFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 type] != 5) {
    goto LABEL_27;
  }
  if (!v10)
  {
    uint64_t v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1003AB738();
    }
    goto LABEL_24;
  }
  id v11 = [v9 activeParticipants];
  if ([v11 count] == (id)1)
  {
  }
  else
  {
    uint64_t v13 = [v9 activeLightweightParticipants];
    id v14 = [v13 count];

    if (v14 != (id)1)
    {
      uint64_t v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1003AB8D8();
      }
      goto LABEL_24;
    }
  }
  BOOL v15 = [v9 activeParticipants];
  BOOL v16 = [v15 firstObject];
  BOOL v17 = [v16 csdConversationParticipant];
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t v12 = v17;
  }
  else
  {
    long long v19 = [v9 activeLightweightParticipants];
    long long v20 = [v19 firstObject];
    uint64_t v12 = [v20 csdConversationParticipant];
  }
  if (v12)
  {
    long long v21 = [v12 handle];
    unsigned __int8 v22 = [v21 isEquivalentToHandle:v8];

    if (v22)
    {
      long long v23 = [v10 remoteMembers];
      id v24 = [v23 mutableCopy];

      id v25 = [v10 localMember];
      [v24 addObject:v25];

      unsigned int v26 = [v12 isLightweight];
      long long v27 = [v8 value];
      if (v26)
      {
        id v28 = [v10 lightweightMembers];
        id v29 = [v28 copy];
        id v30 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v27 members:v29];

        if (!v30)
        {
          id v31 = sub_100008DCC();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_1003AB7A0();
          }
LABEL_31:

          goto LABEL_24;
        }
      }
      else
      {
        long long v34 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v27 members:v24];

        if (!v34)
        {
          id v31 = sub_100008DCC();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_1003AB808();
          }
          goto LABEL_31;
        }
      }

LABEL_27:
      BOOL v33 = 1;
      goto LABEL_28;
    }
    uint64_t v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1003AB870();
    }
  }
  else
  {
    uint64_t v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1003AB76C();
    }
  }

LABEL_24:
  BOOL v33 = 0;
LABEL_28:

  return v33;
}

- (BOOL)verifyAllLightweightmembersAssociated:(id)a3 remoteMembers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (!v9)
  {
    BOOL v18 = 1;
    goto LABEL_18;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v23;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      id v14 = objc_msgSend(v13, "lightweightPrimary", (void)v22);

      if (!v14)
      {
        long long v19 = sub_100008DCC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v27 = v13;
          long long v20 = "Member: %@ doesn't have a primary";
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
        }
LABEL_17:

        BOOL v18 = 0;
        goto LABEL_18;
      }
      BOOL v15 = [v13 lightweightPrimary];
      BOOL v16 = [v15 value];
      BOOL v17 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v16 members:v7];

      if (!v17)
      {
        long long v19 = sub_100008DCC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v27 = v13;
          long long v20 = "Lightweight member %@ doesn't have their primary in the conversation";
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    BOOL v18 = 1;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_18:

  return v18;
}

- (BOOL)verifyGroupSessionParticipantUpdateAllowedFromHandle:(id)a3 participantUpdate:(id)a4 message:(id)a5 existingConversation:(id)a6 lightweightMembers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  BOOL v16 = [v12 value];
  BOOL v17 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v16 members:v15];

  id v18 = [v13 participantUpdateType];
  if (!v17)
  {
    if (v18 == (id)3)
    {
      id v34 = v14;
      id v35 = v13;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v21 = [v14 lightweightMembers];
      id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v37;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            unsigned int v26 = [*(id *)(*((void *)&v36 + 1) + 8 * i) lightweightPrimary];
            long long v27 = [v26 tuHandle];
            unsigned __int8 v28 = [v27 isEquivalentToHandle:v12];

            if ((v28 & 1) == 0)
            {
              id v29 = sub_100008DCC();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                sub_1003AB96C();
              }

              BOOL v19 = 0;
              id v14 = v34;
              id v13 = v35;
              goto LABEL_28;
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      id v14 = v34;
      id v13 = v35;
    }
LABEL_18:
    BOOL v19 = 1;
    goto LABEL_28;
  }
  BOOL v19 = 0;
  if (v18 && v18 != (id)3)
  {
    if (v18 == (id)1)
    {
      if (!a6)
      {
        id v30 = sub_100008DCC();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1003AB9D4();
        }
        goto LABEL_27;
      }
      long long v20 = [v14 addedMembers];
      if ([v20 count])
      {

        goto LABEL_25;
      }
      id v31 = [v14 lightweightMembers];
      id v32 = [v31 count];

      if (v32)
      {
LABEL_25:
        id v30 = sub_100008DCC();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1003ABA3C();
        }
LABEL_27:

        BOOL v19 = 0;
        goto LABEL_28;
      }
    }
    goto LABEL_18;
  }
LABEL_28:

  return v19;
}

- (BOOL)verifyLightweightMessageTypeFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003ABAA4();
    }
    goto LABEL_9;
  }
  id v10 = [a3 value];
  uint64_t v11 = [v9 lightweightMembers];
  id v12 = [v11 copy];
  id v13 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v10 members:v12];

  if (v13)
  {
    unsigned int v14 = [v8 type];
    if (v14 <= 0x23)
    {
      if (((1 << v14) & 0xE2749FC6FLL) != 0)
      {
LABEL_9:
        BOOL v15 = 0;
        goto LABEL_10;
      }
      if (((1 << v14) & 0x8A00310) != 0) {
        goto LABEL_6;
      }
    }
    BOOL v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1003AB704();
    }

    goto LABEL_9;
  }
LABEL_6:
  BOOL v15 = 1;
LABEL_10:

  return v15;
}

- (BOOL)verifyEndorseRepresentsMemberFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 type] != 29) {
    goto LABEL_9;
  }
  if (!v10)
  {
    BOOL v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1003ABAA4();
    }
    goto LABEL_23;
  }
  uint64_t v11 = [v9 addedMembers];
  id v12 = [v11 count];

  if (v12 != (id)1)
  {
    BOOL v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1003ABAD8(v9, v15);
    }
    goto LABEL_23;
  }
  id v13 = [v9 addedMembers];
  unsigned int v14 = [v13 firstObject];
  BOOL v15 = [v14 tuConversationMember];

  if (![v15 isLightweightMember]
    || ([v15 lightweightPrimary],
        BOOL v16 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v17 = [v16 isEquivalentToHandle:v8],
        v16,
        (v17 & 1) == 0))
  {
    id v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412546;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "FromID: %@ attempting to vouch for an invalid member %@", (uint8_t *)&v31, 0x16u);
    }
    goto LABEL_22;
  }
  id v18 = [v15 handle];
  BOOL v19 = [v18 value];
  long long v20 = [v10 lightweightMembers];
  id v21 = [v20 copy];
  id v22 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v19 members:v21];

  if (!v22)
  {
    unsigned int v26 = sub_100008DCC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      long long v27 = "No local lightweightMember found for handle trying to be vouched";
      unsigned __int8 v28 = v26;
      uint32_t v29 = 2;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v31, v29);
    }
LABEL_21:

LABEL_22:
LABEL_23:

    BOOL v25 = 0;
    goto LABEL_24;
  }
  id v23 = [v22 lightweightPrimary];
  unsigned __int8 v24 = [v23 isEquivalentToHandle:v8];

  if ((v24 & 1) == 0)
  {
    unsigned int v26 = sub_100008DCC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412290;
      id v32 = v8;
      long long v27 = "FromHandle: %@ trying to vouch for another member's lightweightMember";
      unsigned __int8 v28 = v26;
      uint32_t v29 = 12;
      goto LABEL_20;
    }
    goto LABEL_21;
  }

LABEL_9:
  BOOL v25 = 1;
LABEL_24:

  return v25;
}

- (void)refreshActiveParticipantsList
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Refreshing active pariticpants for active conversations", buf, 2u);
  }

  id v4 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108F5C;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_sync(v4, block);
}

- (NSDictionary)conversationsByGroupUUID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000FB094;
  uint64_t v11 = sub_1000FB0A4;
  id v12 = 0;
  v3 = [(CSDConversationManager *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010918C;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)incomingPendingConversationsByGroupUUID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000FB094;
  uint64_t v11 = sub_1000FB0A4;
  id v12 = 0;
  v3 = [(CSDConversationManager *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100109534;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)_incomingPendingConversationsByGroupUUID
{
  v2 = [(CSDConversationManager *)self pendingMembershipTracker];
  v3 = [v2 pendingMembersByGroup];

  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v11 = [objc_alloc((Class)TUConversation) initWithUUID:v10 groupUUID:v10];
        id v12 = [v5 objectForKeyedSubscript:v10];
        id v13 = +[NSSet setWithArray:v12];
        [v11 setPendingMembers:v13];

        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  unsigned int v14 = [(CSDConversationManager *)self linkManager];
  BOOL v15 = [v5 allKeys];
  id v36 = 0;
  BOOL v16 = [v14 conversationLinkDescriptorsWithGroupUUIDs:v15 error:&v36];
  id v17 = v36;

  if (v17)
  {
    id v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] _incomingPendingConversationsByGroupUUID: issue fetching links for pending incoming {error: %@}", buf, 0xCu);
    }
  }
  int v31 = v17;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v16;
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        unsigned __int8 v24 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        BOOL v25 = [v24 groupUUID];
        unsigned int v26 = [v4 objectForKeyedSubscript:v25];

        id v27 = [objc_alloc((Class)TUConversationLink) initWithDescriptor:v24];
        [v26 setLink:v27];
      }
      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v21);
  }

  id v28 = [v4 copy];

  return v28;
}

- (NSDictionary)conversationsByUUID
{
  return (NSDictionary *)[(CSDConversationManager *)self conversationsByUUIDIncludingStorageConversations:0];
}

- (NSDictionary)pseudonymsByCallUUID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000FB094;
  id v11 = sub_1000FB0A4;
  id v12 = 0;
  v3 = [(CSDConversationManager *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100109A04;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)conversationsByUUIDIncludingStorageConversations:(BOOL)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1000FB094;
  unsigned int v14 = sub_1000FB0A4;
  id v15 = 0;
  id v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109BA0;
  block[3] = &unk_1005079F0;
  void block[4] = self;
  void block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = [(id)v11[5] copy];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)activatedConversationLinksWithError:(id *)a3
{
  if ([(CSDConversationManager *)self _linksEnabled])
  {
    id v5 = [(CSDConversationManager *)self linkManager];
    id v6 = [v5 fetchActivatedLinksWithError:a3];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)deletedConversationLinksWithError:(id *)a3
{
  if ([(CSDConversationManager *)self _linksEnabled])
  {
    id v5 = [(CSDConversationManager *)self linkManager];
    id v6 = [v5 fetchDeletedLinksWithError:a3];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (NSDictionary)activityAuthorizedBundleIdentifierState
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = +[CPApplicationPolicyManager sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 autoSharePlayEnabled]);
  [v2 setObject:v4 forKeyedSubscript:@"gk"];

  id v5 = +[CPApplicationPolicyManager sharedInstance];
  id v6 = [v5 authorizedBundleIdentifiers];
  [v2 setObject:v6 forKeyedSubscript:@"bk"];

  return (NSDictionary *)v2;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A0BC;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010A1C4;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A2F0;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)beginListeningOnService:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010A3F8;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retreiveActiveConversations
{
  v3 = [(CSDConversationManager *)self service];
  id v4 = [v3 callerID];

  if (v4)
  {
    id v5 = [(CSDConversationManager *)self persistenceController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10010A6B4;
    v8[3] = &unk_100507A18;
    v8[4] = self;
    [v5 enumerateActiveConversations:v8];
  }
  else
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = 1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "shouldClearDefaults: %d - Removing all conversations", buf, 8u);
    }

    id v7 = [(CSDConversationManager *)self persistenceController];
    [v7 removeAllConversations];
  }
}

- (void)removeAllConversations
{
  id v2 = [(CSDConversationManager *)self persistenceController];
  [v2 removeAllConversations];
}

- (id)findOrCreateConversationWithGroupUUID:(id)a3 messagesGroupUUID:(id)a4 remoteMembers:(id)a5 otherInvitedHandles:(id)a6 localMember:(id)a7 remotePushTokens:(id)a8 link:(id)a9 activity:(id)a10 avMode:(unint64_t)a11 presentationMode:(unint64_t)a12 conversationProvider:(id)a13 screenSharingRequest:(id)a14
{
  id v42 = a3;
  id v39 = a4;
  id v41 = a5;
  id v34 = a6;
  id v37 = a7;
  id v31 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a13;
  id v23 = a14;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000;
  long long v61 = sub_1000FB094;
  long long v62 = sub_1000FB0A4;
  id v63 = 0;
  queue = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010B050;
  block[3] = &unk_100507A40;
  id v44 = v42;
  id v45 = v41;
  id v46 = v22;
  long long v47 = self;
  id v48 = v20;
  id v49 = v37;
  id v50 = v39;
  id v51 = v34;
  id v52 = v31;
  id v53 = v21;
  id v54 = v23;
  unint64_t v56 = a11;
  unint64_t v57 = a12;
  id v55 = &v58;
  id v38 = v23;
  id v36 = v21;
  id v32 = v31;
  id v35 = v34;
  id v40 = v39;
  id v24 = v37;
  id v25 = v20;
  id v26 = v22;
  id v27 = v41;
  id v28 = v42;
  dispatch_sync(queue, block);

  id v29 = (id)v59[5];
  _Block_object_dispose(&v58, 8);

  return v29;
}

- (void)joinExistingConversationWithUUID:(id)a3 context:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010BA3C;
  block[3] = &unk_100504FE0;
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  id v6 = v12;
  id v7 = v11;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  id v9 = [(CSDConversationManager *)self queue];
  dispatch_async(v9, v8);
}

- (id)initiatePendingConversationForLink:(id)a3 localMember:(id)a4 isVideoEnabled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1000FB094;
  id v25 = sub_1000FB0A4;
  id v26 = 0;
  int v10 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010C434;
  block[3] = &unk_100507A90;
  id v16 = v8;
  id v17 = v9;
  BOOL v20 = a5;
  id v18 = self;
  id v19 = &v21;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, block);

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (void)requestLetMeInApprovalForPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010C9BC;
  v7[3] = &unk_100504F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sendLetMeInResponseToPendingMember:(id)a3 forConversation:(id)a4 usingResponseKeyData:(id)a5 approved:(BOOL)a6 callback:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v54 = a7;
  id v15 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v15);

  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    [v13 UUID];
    v19 = id v18 = v14;
    *(_DWORD *)buf = 138412802;
    uint64_t v58 = v12;
    __int16 v59 = 2112;
    CFStringRef v60 = v17;
    __int16 v61 = 2112;
    long long v62 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "LMI: Notifying pending member %@ of our response (approved: %@) to their let me in for conversation UUID %@", buf, 0x20u);

    id v14 = v18;
  }

  BOOL v20 = [v13 link];
  uint64_t v21 = [v20 pseudonym];
  id v22 = +[TUHandle normalizedGenericHandleForValue:v21];

  if (v14)
  {
    id v52 = v12;
    id v53 = v22;
    p_cache = &OBJC_METACLASS___CSDMomentsReportingSession.cache;
    id v24 = [CSDMessagingConversationMessage alloc];
    id v25 = v24;
    if (v8)
    {
      id v26 = [v13 groupUUID];
      [v13 link];
      id v28 = v27 = self;
      id v29 = [(CSDMessagingConversationMessage *)v25 initWithType:16 groupUUID:v26 link:v28];

      id v30 = [v13 localMember];
      id v31 = [v30 handle];
      id v32 = +[CSDMessagingHandle handleWithTUHandle:v31];
      long long v33 = [v29 link];
      [v33 setOriginatorHandle:v32];

      self = v27;
      p_cache = (void **)(&OBJC_METACLASS___CSDMomentsReportingSession + 16);
    }
    else
    {
      id v29 = [(CSDMessagingConversationMessage *)v24 initWithType:16 groupUUID:0 link:0];
      id v30 = [v13 link];
      id v31 = +[CSDMessagingConversationLink linkWithTUConversationLink:v30 includeGroupUUID:0];
      [v29 setLink:v31];
    }

    [v29 setIsLetMeInApproved:v8];
    id v35 = sub_100008DCC();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v58 = v29;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "LetMeInResponse message assembled as %@", buf, 0xCu);
    }

    id v36 = [(CSDConversationManager *)self linkManager];
    id v22 = v53;
    id v37 = [v36 encryptLetMeInResponse:v29 pseudonym:v53 responseKeyData:v14];

    if (v37)
    {
      id v38 = objc_alloc((Class)(p_cache + 93));
      id v39 = [v13 link];
      id v50 = self;
      id v40 = [v38 initWithEncryptedMessage:v37 enclosedType:16 link:v39];

      id v41 = objc_alloc((Class)TUConversationMember);
      [v13 link];
      id v42 = v51 = v14;
      id v43 = [v42 pseudonym];
      id v44 = +[TUHandle normalizedGenericHandleForValue:v43];
      id v45 = [v41 initWithHandle:v44 nickname:0];

      CFStringRef v55 = @"kCSDConversationIsLetMeInApproved";
      id v46 = +[NSNumber numberWithBool:v8];
      unint64_t v56 = v46;
      long long v47 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];

      id v48 = [v40 data];
      id v49 = [v52 idsDestination];
      id v34 = v54;
      [(CSDConversationManager *)v50 sendData:v48 onConversation:v13 toDestinationID:v49 fromMember:v45 additionalOptions:v47 isBlobResponse:0 callback:v54];

      id v12 = v52;
      id v14 = v51;

      id v22 = v53;
    }
    else
    {
      id v40 = sub_100008DCC();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1003ABCD8();
      }
      id v12 = v52;
      id v34 = v54;
    }
  }
  else
  {
    id v29 = sub_100008DCC();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Response key missing from LMI response; cannot encrypt to send without. Aborting.",
        buf,
        2u);
    }
    id v34 = v54;
  }
}

- (void)updateLetMeInRequestState:(int64_t)a3 addLink:(id)a4 forConversationWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = [(CSDConversationManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10010D9E0;
  v13[3] = &unk_100506BD0;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  int64_t v17 = a3;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)sendInvitationMessageToMember:(id)a3 forConversation:(id)a4 includeAllAttributes:(BOOL)a5 invitationPreferences:(id)a6 additionalOptions:(id)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [CSDMessagingConversationMessage alloc];
  id v16 = [v12 groupUUID];
  int64_t v17 = [v12 link];
  id v18 = [(CSDMessagingConversationMessage *)v15 initWithType:1 groupUUID:v16 link:v17];

  if (v9)
  {
    id v56 = v13;
    id v57 = v11;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v19 = [v12 activeRemoteParticipants];
    id v20 = [v19 countByEnumeratingWithState:&v71 objects:v80 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v72;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v72 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:*(void *)(*((void *)&v71 + 1) + 8 * i)];
          [(CSDMessagingConversationMessage *)v18 addActiveParticipants:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v71 objects:v80 count:16];
      }
      while (v21);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v25 = [v12 activeLightweightParticipants];
    id v26 = [v25 countByEnumeratingWithState:&v67 objects:v79 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v68;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v68 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:*(void *)(*((void *)&v67 + 1) + 8 * (void)j)];
          [(CSDMessagingConversationMessage *)v18 addActiveLightweightParticipants:v30];
        }
        id v27 = [v25 countByEnumeratingWithState:&v67 objects:v79 count:16];
      }
      while (v27);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v31 = [v12 remoteMembers];
    id v32 = [v31 countByEnumeratingWithState:&v63 objects:v78 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v64;
      do
      {
        for (k = 0; k != v33; k = (char *)k + 1)
        {
          if (*(void *)v64 != v34) {
            objc_enumerationMutation(v31);
          }
          id v36 = +[CSDMessagingConversationMember memberWithTUConversationMember:*(void *)(*((void *)&v63 + 1) + 8 * (void)k)];
          [(CSDMessagingConversationMessage *)v18 addAddedMembers:v36];
        }
        id v33 = [v31 countByEnumeratingWithState:&v63 objects:v78 count:16];
      }
      while (v33);
    }
    id v54 = v14;

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v37 = [v12 activitySessions];
    id v38 = [v37 countByEnumeratingWithState:&v59 objects:v77 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v60;
      do
      {
        for (m = 0; m != v39; m = (char *)m + 1)
        {
          if (*(void *)v60 != v40) {
            objc_enumerationMutation(v37);
          }
          id v42 = *(void **)(*((void *)&v59 + 1) + 8 * (void)m);
          id v43 = objc_msgSend(v42, "activity", v54);
          unsigned __int8 v44 = [v43 isStaticActivity];

          if ((v44 & 1) == 0)
          {
            id v45 = +[CSDMessagingConversationActivitySession activitySessionWithCSDConversationActivitySession:v42 fromConversation:v12 forStorage:0];
            [(CSDMessagingConversationMessage *)v18 addActivitySessions:v45];
          }
        }
        id v39 = [v37 countByEnumeratingWithState:&v59 objects:v77 count:16];
      }
      while (v39);
    }

    id v46 = [v12 highlightIdentifiers];
    long long v47 = [v46 anyObject];

    if (v47) {
      [(CSDMessagingConversationMessage *)v18 setHighlightIdentifier:v47];
    }
    id v48 = objc_msgSend(v12, "stagedActivitySession", v54);

    id v14 = v55;
    id v13 = v56;
    if (v48)
    {
      id v49 = [v12 stagedActivitySession];
      id v50 = +[CSDMessagingConversationActivitySession activitySessionWithTUConversationActivitySession:v49 fromConversation:v12 forStorage:0];
      [(CSDMessagingConversationMessage *)v18 setStagedActivitySession:v50];
    }
    id v11 = v57;
  }
  if (v13)
  {
    [(CSDMessagingConversationMessage *)v18 setTUInvitationPreferences:v13];
  }
  else
  {
    id v51 = [v12 invitationPreferences];
    [(CSDMessagingConversationMessage *)v18 setTUInvitationPreferences:v51];
  }
  id v52 = sub_100008DCC();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v76 = v18;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Sending invitation message %@", buf, 0xCu);
  }

  id v53 = [(CSDMessagingConversationMessage *)v18 data];
  [(CSDConversationManager *)self sendData:v53 onConversation:v12 toMember:v11 additionalOptions:v14];
}

- (void)startAudioForConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010E400;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_leaveConversation:(id)a3 withContext:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  [v14 leaveUsingContext:v6];
  id v8 = [v14 link];
  BOOL v9 = [v8 pseudonym];
  id v10 = [v9 length];

  if (v10)
  {
    id v11 = [v14 link];
    id v12 = [v11 pseudonym];
    id v13 = [(CSDConversationManager *)self _removePendingConversationWithPseudonym:v12];
  }
}

- (void)_leaveConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [[CSDConversationLeaveContext alloc] initWithLeaveReason:0];
  [(CSDConversationManager *)self _leaveConversation:v4 withContext:v6];
}

- (void)leaveConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [[CSDConversationLeaveContext alloc] initWithLeaveReason:0];
  [(CSDConversationManager *)self leaveConversationWithUUID:v4 withContext:v5];
}

- (void)leaveConversationWithUUID:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010E83C;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)leaveAllConversations
{
  v3 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010E950;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)addPseudonym:(id)a3 forCallUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010EB34;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removePseudonym:(id)a3 forCallUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010EC44;
  v8[3] = &unk_100504F10;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)setUplinkMuted:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010ED54;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setVideo:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010EE7C;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)sendVideoUpgradeMessageforConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010EF9C;
  v7[3] = &unk_100504F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setVideoEnabled:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010F1EC;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setUplinkMuted:(BOOL)a3 forPendingConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010F314;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setVideoEnabled:(BOOL)a3 forPendingConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010F638;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)requestParticipantToShareScreen:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self featureFlags];
  unsigned int v9 = [v8 requestToScreenShareEnabled];

  if (v9)
  {
    id v10 = [(CSDConversationManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010F9C0;
    block[3] = &unk_100504FE0;
    id v13 = v6;
    id v14 = self;
    id v15 = v7;
    dispatch_async(v10, block);

    BOOL v11 = v13;
  }
  else
  {
    BOOL v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003ABD40();
    }
  }
}

- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010FD20;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setScreenEnabled:(BOOL)a3 forConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[TUCallScreenShareAttributes defaultAttributes];
  [(CSDConversationManager *)self setScreenEnabled:v4 screenShareAttributes:v7 forConversationWithUUID:v6];
}

- (void)setScreenEnabled:(BOOL)a3 screenShareAttributes:(id)a4 forConversationWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011008C;
  v13[3] = &unk_100506C18;
  void v13[4] = self;
  id v14 = v9;
  BOOL v16 = a3;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)setVideoPaused:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001107FC;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setAudioPaused:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110924;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setRelaying:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110A4C;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setScreening:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110B74;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setAudioInjectionAllowed:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110CDC;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)isConversationWithUUIDRedirectingAudio:(id)a3
{
  id v4 = a3;
  if ([(CSDConversationManager *)self isConversationWithUUIDRelaying:v4]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(CSDConversationManager *)self isConversationWithUUIDScreening:v4];
  }

  return v5;
}

- (BOOL)isConversationWithUUIDRelaying:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110EA0;
  block[3] = &unk_100505DC0;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)isConversationWithUUIDScreening:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100111014;
  block[3] = &unk_100505DC0;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (int)presentationStateForConversationWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 2;
  BOOL v5 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011118C;
  block[3] = &unk_100505DC0;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

- (void)setPresentationState:(int)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001112BC;
  block[3] = &unk_100507B08;
  void block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setPresentationRect:(CGRect)a3 forConversationWithUUID:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  id v10 = [(CSDConversationManager *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100111404;
  v12[3] = &unk_100507B30;
  v12[4] = self;
  id v13 = v9;
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v11 = v9;
  dispatch_async(v10, v12);
}

- (void)setGridDisplayMode:(unint64_t)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100111530;
  block[3] = &unk_1005050A8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setScreenShareAttributes:(id)a3 forConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100111674;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeRemoteMembers:(id)a3 fromConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001117D4;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = v6;
  CGFloat v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)addRemoteMembers:(id)a3 toConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSSet set];
  [(CSDConversationManager *)self addRemoteMembers:v7 otherInvitedHandles:v8 toConversationWithUUID:v6];
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversationWithUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(CSDConversationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100111AE8;
  v15[3] = &unk_1005053D0;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v19 = self;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112230;
  block[3] = &unk_100504FE0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112780;
  block[3] = &unk_1005050D0;
  BOOL v12 = a3;
  id v10 = v6;
  unint64_t v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)maybeAddComplementaryAssociationVoucherFor:(id)a3 toLocalMemberOf:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  unsigned __int8 v44 = self;
  unint64_t v11 = [(CSDConversationManager *)self voucherManager];

  if (v11)
  {
    block = v10;
    group = dispatch_group_create();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v41 = v8;
    id obj = v8;
    id v12 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v51;
      uint64_t v42 = *(void *)v51;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v51 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v17 = [v16 association];
          if (v17)
          {
            id v18 = (void *)v17;
            id v19 = [v16 associationVoucher];

            if (v19)
            {
              id v20 = objc_alloc_init(CSDMessagingMemberAssociationClaim);
              id v21 = [v9 localMember];
              [v21 handle];
              v23 = id v22 = v13;
              id v24 = +[CSDMessagingHandle handleWithTUHandle:v23];
              [(CSDMessagingMemberAssociationClaim *)v20 setPrimaryHandle:v24];

              id v25 = [v9 localParticipant];
              -[CSDMessagingMemberAssociationClaim setPrimaryIdentifier:](v20, "setPrimaryIdentifier:", [v25 identifier]);

              id v26 = [v9 localParticipant];
              id v27 = [v26 avcIdentifier];
              [(CSDMessagingMemberAssociationClaim *)v20 setPrimaryAvcIdentifier:v27];

              uint64_t v28 = [v16 handle];
              id v29 = +[CSDMessagingHandle handleWithTUHandle:v28];
              [(CSDMessagingMemberAssociationClaim *)v20 setAssociatedPseudonym:v29];

              id v30 = [v9 groupUUID];
              id v31 = [v30 UUIDString];
              [(CSDMessagingMemberAssociationClaim *)v20 setConversationGroupUUIDString:v31];

              id v32 = [v16 association];
              -[CSDMessagingMemberAssociationClaim setType:](v20, "setType:", [v32 type]);

              dispatch_group_enter(group);
              id v33 = [(CSDConversationManager *)v44 voucherManager];
              uint64_t v34 = [(CSDMessagingMemberAssociationClaim *)v20 data];
              id v35 = [v9 localMember];
              id v36 = [v35 handle];
              v46[0] = _NSConcreteStackBlock;
              v46[1] = 3221225472;
              v46[2] = sub_100112D48;
              v46[3] = &unk_100507B58;
              v46[4] = v16;
              id v47 = v9;
              id v48 = v20;
              id v49 = group;
              id v37 = v20;
              [v33 sign:v34 as:v36 completion:v46];

              id v13 = v22;
              uint64_t v14 = v42;
            }
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v13);
    }

    id v38 = [(CSDConversationManager *)v44 queue];
    id v10 = block;
    dispatch_group_notify(group, v38, block);

    id v8 = v41;
  }
  else
  {
    id v39 = sub_100008DCC();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
      sub_1003ABF38();
    }

    v10[2](v10);
  }
}

- (void)addInvitedMemberHandlesFromAddedRemoteMembers:(id)a3 toConversationLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v40 = self;
  unsigned int v8 = [(CSDConversationManager *)self _linksEnabled];
  id v43 = v7;
  if (!v7 || !v8 || ![v7 isLocallyCreated]) {
    goto LABEL_46;
  }
  id v41 = +[NSMutableSet set];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v39 = v6;
  id v9 = v6;
  id v48 = [v9 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (!v48) {
    goto LABEL_40;
  }
  uint64_t v47 = *(void *)v54;
  id obj = v9;
  do
  {
    id v10 = 0;
    do
    {
      if (*(void *)v54 != v47) {
        objc_enumerationMutation(obj);
      }
      unint64_t v11 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v10);
      id v12 = objc_msgSend(v11, "handle", v39);
      id v13 = [v12 value];
      if ([v13 destinationIdIsTemporary]) {
        goto LABEL_12;
      }
      uint64_t v14 = [v11 handle];
      CGFloat v15 = [v14 value];
      if ([v15 destinationIdIsPseudonym])
      {

LABEL_12:
LABEL_13:
        id v16 = sub_100008DCC();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        uint64_t v44 = [v11 handle];
        id v46 = [v11 handle];
        id v45 = [v46 value];
        if ([v45 destinationIdIsTemporary]) {
          CFStringRef v17 = @"YES";
        }
        else {
          CFStringRef v17 = @"NO";
        }
        id v18 = [v11 handle];
        id v19 = [v18 value];
        if ([v19 destinationIdIsPseudonym]) {
          CFStringRef v20 = @"YES";
        }
        else {
          CFStringRef v20 = @"NO";
        }
        id v21 = [v11 handle];
        id v22 = [v43 originatorHandle];
        unsigned int v23 = [v21 isEquivalentToHandle:v22];
        *(_DWORD *)buf = 138413058;
        if (v23) {
          CFStringRef v24 = @"YES";
        }
        else {
          CFStringRef v24 = @"NO";
        }
        id v25 = (void *)v44;
        uint64_t v59 = v44;
        __int16 v60 = 2112;
        CFStringRef v61 = v17;
        __int16 v62 = 2112;
        CFStringRef v63 = v20;
        __int16 v64 = 2112;
        CFStringRef v65 = v24;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not adding %@ to invited member handles of link because destinationIdIsTemporary(%@), destinationIdIsPseudonym(%@), or handle is the originator of link (%@)", buf, 0x2Au);

LABEL_24:
        goto LABEL_25;
      }
      id v26 = [v11 handle];
      id v27 = [v43 originatorHandle];
      unsigned __int8 v28 = [v26 isEquivalentToHandle:v27];

      if (v28) {
        goto LABEL_13;
      }
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v29 = [v43 invitedMemberHandles];
      id v30 = [v29 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v50;
LABEL_30:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v49 + 1) + 8 * v33);
          id v35 = [v11 handle];
          LOBYTE(v34) = [v35 isEquivalentToHandle:v34];

          if (v34) {
            break;
          }
          if (v31 == (id)++v33)
          {
            id v31 = [v29 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v31) {
              goto LABEL_30;
            }
            goto LABEL_36;
          }
        }

        id v16 = sub_100008DCC();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        id v25 = [v11 handle];
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = (uint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not adding %@ to invited member handles of link because it is already an invited member handle of the link", buf, 0xCu);
        goto LABEL_24;
      }
LABEL_36:

      id v16 = [v11 handle];
      [v41 addObject:v16];
LABEL_25:

      id v10 = (char *)v10 + 1;
    }
    while (v10 != v48);
    id v9 = obj;
    id v36 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    id v48 = v36;
  }
  while (v36);
LABEL_40:

  id v37 = v41;
  if ([v41 count])
  {
    [(CSDConversationManager *)v40 addInvitedMemberHandles:v41 toConversationLink:v43 completionHandler:0];
    id v6 = v39;
  }
  else
  {
    id v38 = sub_100008DCC();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = (uint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Not adding any of the following members to the invited handles of the link: %@", buf, 0xCu);
    }

    id v6 = v39;
    id v37 = v41;
  }

LABEL_46:
}

- (BOOL)allActiveConversationParticipantsSupportSharePlay
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v3 = [(CSDConversationManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011350C;
  v5[3] = &unk_100506E98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isSharePlayAvailable
{
  id v2 = [(CSDConversationManager *)self sharePlaySystemStateObserver];
  unsigned __int8 v3 = [v2 allowSharePlay];

  return v3;
}

- (BOOL)isScreenSharingAvailable
{
  id v2 = [(CSDConversationManager *)self sharePlaySystemStateObserver];
  unsigned __int8 v3 = [v2 allowScreenSharing];

  return v3;
}

- (BOOL)isScreenSharingInitiationAvailable
{
  id v2 = [(CSDConversationManager *)self sharePlaySystemStateObserver];
  unsigned __int8 v3 = [v2 allowScreenSharingInitiation];

  return v3;
}

- (void)displaySharePlayUnableToStartAlert
{
  unsigned __int8 v3 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011369C;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_displaySharePlayUnableToStartWithMessage:(id)a3
{
  id v4 = a3;
  if (TUSharePlayForceDisabled())
  {
    BOOL v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Not displaying SharePlay not supported alert because SharePlay features are disabled.", buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = [(CSDConversationManager *)self queue];
    dispatch_assert_queue_V2(v6);

    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Displaying SharePlay not supported alert with message: %@", buf, 0xCu);
    }

    uint64_t v8 = TUBundle();
    BOOL v5 = [v8 localizedStringForKey:@"OK" value:&stru_100517F40 table:@"TelephonyUtilities"];

    char v9 = +[NSString stringGUID];
    id v10 = TUBundle();
    unint64_t v11 = [v10 localizedStringForKey:@"SHAREPLAY_INCOMPATIBLE_TITLE" value:&stru_100517F40 table:@"TelephonyUtilities"];
    id v12 = +[IMUserNotification userNotificationWithIdentifier:v9 title:v11 message:v4 defaultButton:v5 alternateButton:0 otherButton:0];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100113968;
    block[3] = &unk_100504EC0;
    id v15 = v12;
    id v13 = v12;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113AC0;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)updateMessagesGroupPhotoOnConversationWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100113FA0;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (FTDeviceSupport)deviceSupport
{
  deviceSupport = self->_deviceSupport;
  if (deviceSupport)
  {
    unsigned __int8 v3 = deviceSupport;
  }
  else
  {
    unsigned __int8 v3 = +[FTDeviceSupport sharedInstance];
  }

  return v3;
}

- (id)createCPActivitySessionForActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ConversationManager asked to create activitySession for activitySession: %@ on conversation UUID: %@", (uint8_t *)&v25, 0x16u);
  }

  id v10 = [(CSDConversationManager *)self mutableConversationsByUUID];
  unint64_t v11 = [v10 objectForKeyedSubscript:v7];

  if (!v11)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(CSDConversationManager *)self mutableConversationsByUUID];
      id v19 = [v18 allKeys];
      int v25 = 138412546;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation with conversationUUID %@. All conversations UUIDs: %@", (uint8_t *)&v25, 0x16u);
    }
    goto LABEL_14;
  }
  if ([v11 state] != (id)3 && objc_msgSend(v6, "isLocallyInitiated"))
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v7;
    }
LABEL_14:
    CFStringRef v20 = 0;
    goto LABEL_20;
  }
  id v13 = [v6 activity];
  [v13 setTrustedFromHandle:0];

  id v12 = [v11 createActivitySession:v6];
  if (v12)
  {
    [(CSDConversationManager *)self cancelPreviouslySentScreenShareRequests:v11];
    uint64_t v14 = [v12 tuConversationActivitySession];
    uint64_t v15 = [v11 localParticipant];
    [(CSDConversationManager *)self postSessionStartedForSession:v14 originator:v15 conversation:v11];

    id v16 = [v6 activity];
    LOBYTE(v15) = [v16 isStaticActivity];

    if (v15)
    {
      id v17 = sub_100008DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not broadcasting activity session creation for static activity", (uint8_t *)&v25, 2u);
      }
    }
    else
    {
      id v22 = [CSDMessagingConversationMessage alloc];
      unsigned int v23 = [v11 groupUUID];
      id v17 = [(CSDMessagingConversationMessage *)v22 initWithType:8 groupUUID:v23 link:0];

      [(CSDConversationManager *)self sendMessage:v17 forConversation:v11 withActivitySession:v12];
      [(CSDConversationManager *)self broadcastImageForSession:v6 onConversation:v11];
    }

    id v12 = v12;
    CFStringRef v20 = v12;
  }
  else
  {
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1003AC00C();
    }

    CFStringRef v20 = 0;
  }
LABEL_20:

  return v20;
}

- (void)createActivitySession:(id)a3 onConversationWithUUID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v40 = v9;
    __int16 v41 = 2112;
    id v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "conversationUUID: %@ activity: %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100114B20;
  block[3] = &unk_100505F18;
  id v12 = v8;
  id v35 = v12;
  id v36 = self;
  id v13 = v9;
  id v37 = v13;
  id v14 = v10;
  id v38 = v14;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100114CA8;
  v29[3] = &unk_100507B80;
  id v16 = v12;
  id v30 = v16;
  id v17 = v14;
  id v31 = self;
  id v32 = v17;
  id v18 = v15;
  id v33 = v18;
  id v19 = objc_retainBlock(v29);
  if ([v16 isSystemActivity])
  {
    ((void (*)(void *, uint64_t, void))v19[2])(v19, 1, 0);
  }
  else if ([v16 isPlaceholderActivity])
  {
    CFStringRef v20 = [(CSDConversationManager *)self queue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100114DA8;
    v25[3] = &unk_100507BA8;
    v25[4] = self;
    id v26 = v13;
    id v28 = v17;
    id v27 = v16;
    dispatch_sync(v20, v25);
  }
  else
  {
    id v21 = [(CSDConversationManager *)self activityAuthorizationManager];
    id v22 = [v16 bundleIdentifier];
    unsigned int v23 = [(CSDConversationManager *)self screenSharingActivityManager];
    CFStringRef v24 = [v23 localScreenShareAttributes];
    [v21 requestAuthorizationForApplicationWithBundleIdentifier:v22 preparing:0 overrides:0 currentScreenShareAttributes:v24 completionHandler:v19];
  }
}

- (void)leaveActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100114FD0;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)endActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011523C;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001154AC;
  block[3] = &unk_100504FE0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)cancelPreviouslySentScreenShareRequests:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = [v4 screenSharingRequests];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 138412290;
    long long v14 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isLocallyOriginated", v14))
        {
          id v12 = sub_100008DCC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            CFStringRef v20 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cancelling existing locally originated screen share request: %@", buf, 0xCu);
          }

          id v13 = [v4 UUID];
          [(CSDConversationManager *)self cancelOrDenyScreenShareRequest:v11 forConversationUUID:v13];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001158AC;
  v13[3] = &unk_100506C18;
  BOOL v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)sendMessage:(id)a3 forConversation:(id)a4 withActivitySession:(id)a5
{
}

- (void)sendMessage:(id)a3 forConversation:(id)a4 withActivitySession:(id)a5 additionalOptions:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = +[CSDMessagingConversationActivitySession activitySessionWithCSDConversationActivitySession:v11 fromConversation:v9 forStorage:0];
  [v12 addActivitySessions:v13];

  id v14 = [v12 data];
  v28[0] = IDSSendMessageOptionPublicMessageIntentKey;
  id v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 type]);
  v29[0] = v15;
  v28[1] = IDSSendMessageOptionQueueOneIdentifierKey;
  BOOL v16 = [v11 identifier];

  long long v17 = [v16 UUIDString];
  id v18 = [v12 type];

  id v19 = +[NSNumber numberWithInt:v18];
  CFStringRef v20 = +[NSString stringWithFormat:@"%@:%@", v17, v19];
  v29[1] = v20;
  id v21 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  id v22 = [v21 mutableCopy];

  if (v10) {
    [v22 addEntriesFromDictionary:v10];
  }
  unsigned int v23 = [(CSDConversationManager *)self broadcastData:v14 onConversation:v9 additionalOptions:v22];
  CFStringRef v24 = sub_100008DCC();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "(success: %d).", buf, 8u);
  }
}

- (void)setActivityAuthorization:(BOOL)a3 forBundleID:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting activity authorization %d for %@", (uint8_t *)v8, 0x12u);
  }

  long long v7 = +[CPApplicationPolicyManager sharedInstance];
  [v7 setAuthorization:v4 forBundleID:v5];
}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[NSNumber numberWithBool:v3];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting auto expanse enabled %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = +[CPApplicationPolicyManager sharedInstance];
  [v6 setAutoSharePlayEnabled:v3];
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100115FA8;
  v7[3] = &unk_100504F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(CSDConversationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011625C;
  v15[3] = &unk_100507BF8;
  BOOL v19 = a5;
  id v16 = v10;
  long long v17 = self;
  id v18 = v11;
  BOOL v20 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(v12, v15);
}

- (void)requestActivityAuthorizationForApplicationWithBundleIdentifier:(id)a3 overrides:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requesting activity authorization for %@", (uint8_t *)&v15, 0xCu);
  }

  id v12 = [(CSDConversationManager *)self activityAuthorizationManager];
  id v13 = [(CSDConversationManager *)self screenSharingActivityManager];
  id v14 = [v13 localScreenShareAttributes];
  [v12 requestAuthorizationForApplicationWithBundleIdentifier:v8 preparing:1 overrides:v10 currentScreenShareAttributes:v14 completionHandler:v9];
}

- (void)revokeBackgroundPipAuthorizationsForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100117034;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)resetActivitySessionSceneAssociationsForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100117270;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleConversation:(id)a3 participantUpdateMessage:(id)a4 fromNormalizedHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (__CFString *)a5;
  id v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v129 = (unint64_t)v9;
    __int16 v130 = 2112;
    CFStringRef v131 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handling participant update message: %@ from: %@", buf, 0x16u);
  }

  id v13 = [v9 activeParticipants];
  id v14 = [v13 count];

  int v15 = [v9 activeParticipants];
  id v16 = [v15 firstObject];

  if (v14 && v16 && [v16 identifier])
  {
    if ((unint64_t)v14 >= 2)
    {
      long long v17 = sub_100008DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v129 = (unint64_t)v9;
        id v18 = "[WARN] Ignoring message %@ because multiple participants were specified.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
        goto LABEL_103;
      }
      goto LABEL_103;
    }
    long long v17 = objc_alloc_init((Class)NSMutableArray);
    BOOL v19 = [v8 localParticipant];
    BOOL v20 = +[IDSDestination destinationWithTUConversationParticipant:v19];
    [v17 addObject:v20];

    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    v97 = v8;
    id v21 = [v8 activeRemoteParticipants];
    id v22 = [v21 countByEnumeratingWithState:&v122 objects:v136 count:16];
    if (v22)
    {
      id v23 = v22;
      v96 = v9;
      v104 = self;
      v101 = 0;
      uint64_t v24 = *(void *)v123;
      while (2)
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v123 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          id v27 = [v26 identifier];
          if (v27 == [v16 identifier])
          {
            id v28 = v16;
            id v29 = [v26 handle];
            id v30 = v10;
            unsigned __int8 v31 = [v29 isEquivalentToHandle:v10];

            if ((v31 & 1) == 0)
            {
              id v37 = sub_100008DCC();
              id v10 = v30;
              id v16 = v28;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                id v38 = [v26 handle];
                *(_DWORD *)buf = 138412802;
                unint64_t v129 = (unint64_t)v28;
                __int16 v130 = 2112;
                CFStringRef v131 = v38;
                __int16 v132 = 2112;
                unint64_t v133 = (unint64_t)v10;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring participant update message %@ because participant handle %@ does not match message sender %@.", buf, 0x20u);
              }
              goto LABEL_32;
            }
            if (v101)
            {
              id v32 = sub_100008DCC();
              id v10 = v30;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v129 = (unint64_t)v97;
                _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Trying to update participant, but one is already found... duplicate participants on conversation? conversation: %@", buf, 0xCu);
              }

              id v33 = [v26 tuConversationParticipant];
              uint64_t v34 = +[IDSDestination destinationWithTUConversationParticipant:v33];
              [v17 addObject:v34];
            }
            else
            {
              v101 = v26;
              id v10 = v30;
            }
            id v16 = v28;
          }
          else
          {
            id v35 = [v26 tuConversationParticipant];
            id v36 = +[IDSDestination destinationWithTUConversationParticipant:v35];
            [v17 addObject:v36];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v122 objects:v136 count:16];
        if (v23) {
          continue;
        }
        break;
      }
LABEL_32:

      id v9 = v96;
      if (v101)
      {
        id v39 = sub_100008DCC();
        id v8 = v97;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v129 = (unint64_t)v101;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Found participant for update message: %@", buf, 0xCu);
        }

        CFStringRef v102 = (const __CFString *)[v101 audioVideoMode];
        unint64_t v40 = (int)[v16 avMode];
        CFStringRef v41 = (const __CFString *)[v101 presentationMode];
        CFStringRef v42 = v41;
        id v43 = v104;
        if ([v16 hasPresentationMode]) {
          CFStringRef v42 = (const __CFString *)[v16 resolvedPresentationMode];
        }
        if (v102 == (const __CFString *)v40)
        {
          uint64_t v44 = sub_100008DCC();
          BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          if (v41 == v42)
          {
            if (v45)
            {
              *(_DWORD *)buf = 138412546;
              unint64_t v129 = (unint64_t)v101;
              __int16 v130 = 2048;
              CFStringRef v131 = v102;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Participant %@ is already in audioVideoMode: %ld... Not handling update!", buf, 0x16u);
            }

            id v9 = v96;
LABEL_102:

            goto LABEL_103;
          }
          v95 = v16;
          v100 = v10;
          if (v45)
          {
            *(_DWORD *)buf = 138412802;
            unint64_t v129 = (unint64_t)v101;
            __int16 v130 = 2048;
            CFStringRef v131 = v42;
            __int16 v132 = 2048;
            unint64_t v133 = (unint64_t)v41;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Update presentationMode for participant %@ desiredPresentationMode:%lu oldPresentationMode:%lu", buf, 0x20u);
          }
          unsigned int v93 = v17;

          CFStringRef v61 = [v101 tuConversationParticipant];
          [v97 setParticipantAudioVideoMode:v102 presentationMode:v42 forParticipant:v61];
        }
        else
        {
          id v46 = [v101 tuConversationParticipant];
          [v97 setParticipantAudioVideoMode:v40 presentationMode:v42 forParticipant:v46];

          uint64_t v47 = [v101 tuConversationParticipant];
          id v48 = +[IDSDestination destinationWithTUConversationParticipant:v47];
          [v17 addObject:v48];

          long long v49 = sub_100008DCC();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            long long v50 = [v97 UUID];
            CFStringRef v51 = (const __CFString *)[v97 avMode];
            *(_DWORD *)buf = 138413058;
            unint64_t v129 = (unint64_t)v50;
            __int16 v130 = 2048;
            CFStringRef v131 = v51;
            __int16 v132 = 2048;
            unint64_t v133 = v40;
            __int16 v134 = 2048;
            CFStringRef v135 = v42;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Conversation UUID: %@ has avMode: %lu and the desiredAudioVideoMode is %lu desiredPresentationMode is %lu", buf, 0x2Au);
          }
          v100 = v10;
          v92 = v17;
          v95 = v16;
          if (![v97 avMode] && v40)
          {
            unint64_t v99 = v40;
            long long v52 = [(CSDConversationManager *)v104 activeLocalHandles];
            long long v53 = v52[2]();
            long long v54 = v10;
            unsigned int v55 = [v53 containsObject:v10];

            if ([v97 state] == (id)3) {
              unsigned int v56 = 0;
            }
            else {
              unsigned int v56 = v55;
            }
            if (objc_msgSend(v96, "invitationPreferencesCount", v17))
            {
              id v57 = [(CSDConversationManager *)v104 invitationResolver];
              uint64_t v58 = [v97 tuConversation];
              uint64_t v59 = [v96 tuInvitationPreferences];
              unsigned int v60 = [v57 shouldShowInvitationRingingUIForConversation:v58 handle:v54 invitationMessagePreferences:v59] ^ 1;
            }
            else
            {
              unsigned int v60 = 1;
            }
            __int16 v62 = sub_100008DCC();
            unint64_t v40 = v99;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v63 = @"YES";
              if (v60) {
                CFStringRef v64 = @"NO";
              }
              else {
                CFStringRef v64 = @"YES";
              }
              if (v56) {
                CFStringRef v63 = @"NO";
              }
              *(_DWORD *)buf = 138412546;
              unint64_t v129 = (unint64_t)v64;
              __int16 v130 = 2112;
              CFStringRef v131 = v63;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Evaluating if we should notify delegates shouldShowInvitationRingingUI: %@ shouldInvokeDelegateBasedOnRemoteHandle: %@", buf, 0x16u);
            }

            id v43 = v104;
            id v8 = v97;
            if (((v60 | v56) & 1) == 0)
            {
              CFStringRef v65 = sub_100008DCC();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v129 = (unint64_t)v101;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Triggering a ringing call for participant update from: %@", buf, 0xCu);
              }

              v98 = [v97 tuConversation];
              long long v118 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              long long v66 = [(CSDConversationManager *)v104 delegateToQueue];
              id v67 = [v66 countByEnumeratingWithState:&v118 objects:v127 count:16];
              if (v67)
              {
                id v68 = v67;
                uint64_t v69 = *(void *)v119;
                do
                {
                  for (j = 0; j != v68; j = (char *)j + 1)
                  {
                    if (*(void *)v119 != v69) {
                      objc_enumerationMutation(v66);
                    }
                    uint64_t v71 = *(void *)(*((void *)&v118 + 1) + 8 * (void)j);
                    if (objc_opt_respondsToSelector())
                    {
                      long long v72 = [(CSDConversationManager *)v104 delegateToQueue];
                      long long v73 = [v72 objectForKey:v71];

                      block[0] = _NSConcreteStackBlock;
                      block[1] = 3221225472;
                      block[2] = sub_100118170;
                      block[3] = &unk_100507C20;
                      void block[4] = v71;
                      id v113 = v98;
                      id v114 = v104;
                      CFStringRef v116 = v102;
                      unint64_t v117 = v99;
                      char v115 = v100;
                      dispatch_async(v73, block);
                    }
                  }
                  id v68 = [v66 countByEnumeratingWithState:&v118 objects:v127 count:16];
                }
                while (v68);
              }

              id v8 = v97;
              id v43 = v104;
              unint64_t v40 = v99;
            }
          }
          if (objc_msgSend(v8, "avMode", v92))
          {
            if (!v40 && [v8 state] == (id)3)
            {
              long long v74 = [v8 remoteMembers];
              id v75 = [v74 count];

              if (v75 == (id)1)
              {
                long long v76 = sub_100008DCC();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Received participant update message to downgrade, but we're in a U+1 call so we should also downgrade!", buf, 2u);
                }

                long long v77 = [v8 UUID];
                [(CSDConversationManager *)v43 setLocalParticipantAudioVideoMode:0 forConversationUUID:v77];
              }
            }
          }
          if (![v8 state] && (unint64_t)objc_msgSend(v8, "avMode") < v40)
          {
            long long v78 = [(CSDConversationManager *)v43 activeLocalHandlesForProvider];
            long long v79 = [v8 provider];
            long long v80 = ((void (**)(void, void *))v78)[2](v78, v79);
            unsigned int v81 = [v80 containsObject:v100];

            if (v81)
            {
              long long v82 = sub_100008DCC();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134349056;
                unint64_t v129 = v40;
                _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Changing conversation AVMode to %{public}lu since conversation is waiting", buf, 0xCu);
              }

              [v8 setAvMode:v40];
            }
          }
          [v8 setRemoteParticipantType:v40 != 0 participant:v101];
          [v8 updateOneToOneModeForParticipantUpdateType:v40 != 0 participant:v101];
        }
        long long v83 = [(CSDConversationManager *)v43 persistenceController];
        [v83 updateConversation:v8];

        uint64_t v103 = [v8 tuConversation];
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v84 = [(CSDConversationManager *)v43 delegateToQueue];
        id v85 = [v84 countByEnumeratingWithState:&v108 objects:v126 count:16];
        if (v85)
        {
          id v86 = v85;
          uint64_t v87 = *(void *)v109;
          do
          {
            for (k = 0; k != v86; k = (char *)k + 1)
            {
              if (*(void *)v109 != v87) {
                objc_enumerationMutation(v84);
              }
              uint64_t v89 = *(void *)(*((void *)&v108 + 1) + 8 * (void)k);
              if (objc_opt_respondsToSelector())
              {
                __int16 v90 = [(CSDConversationManager *)v104 delegateToQueue];
                CFStringRef v91 = [v90 objectForKey:v89];

                v105[0] = _NSConcreteStackBlock;
                v105[1] = 3221225472;
                v105[2] = sub_1001182BC;
                v105[3] = &unk_100504FE0;
                v105[4] = v89;
                id v106 = v103;
                id v107 = v104;
                dispatch_async(v91, v105);
              }
            }
            id v86 = [v84 countByEnumeratingWithState:&v108 objects:v126 count:16];
          }
          while (v86);
        }

        id v9 = v96;
        id v8 = v97;
        id v10 = v100;
        long long v17 = v94;
        id v16 = v95;
        goto LABEL_102;
      }
    }
    else
    {
    }
    v101 = sub_100008DCC();
    id v8 = v97;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      sub_1003AC148();
    }
    goto LABEL_102;
  }
  long long v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v129 = (unint64_t)v9;
    id v18 = "[WARN] Ignoring message %@ because a participant was not specified.";
    goto LABEL_11;
  }
LABEL_103:
}

- (void)handleConversation:(id)a3 registerMessagesGroupUUIDMessage:(id)a4 fromNormalizedHandle:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received message from %@ to associate conversation %@ with messages group", (uint8_t *)&v11, 0x16u);
  }

  [v7 registerMessagesGroupAssociation];
}

- (void)handleConversation:(id)a3 removeActivitySession:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v9 activitySessions];
  id v13 = [v12 count];

  id v14 = sub_100008DCC();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v9;
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received remove activity session message %@ from %@", buf, 0x16u);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = [v9 activitySessions];
    id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      id v25 = v9;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v14);
          }
          BOOL v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v21 = objc_alloc((Class)NSUUID);
          id v22 = [v20 identifierUUIDString];
          id v23 = [v21 initWithUUIDString:v22];

          if (v23)
          {
            [v8 removeActivitySessionWithUUID:v23 usingTerminatingHandle:v10];
          }
          else
          {
            uint64_t v24 = sub_100008DCC();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to decode UUID from activitySession %@", buf, 0xCu);
            }
          }
        }
        id v17 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
      id v9 = v25;
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Message did not contain a valid activitySession.", buf, 2u);
  }
}

- (void)handleConversation:(id)a3 updateActivity:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v9 activitySessions];
  id v13 = [v12 count];

  id v14 = sub_100008DCC();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating activities from message: %@", buf, 0xCu);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = [v9 activitySessions];
    id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      id v17 = v16;
      id v27 = v9;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v14);
          }
          BOOL v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v21 = objc_alloc((Class)NSUUID);
          id v22 = [v20 identifierUUIDString];
          id v23 = [v21 initWithUUIDString:v22];

          if (v23)
          {
            uint64_t v24 = [v20 activity];
            id v25 = [v24 tuConversationActivity];

            [v25 setTrustedFromHandle:v10];
            long long v26 = [v8 activitySessionManager];
            [v26 updateActivitySessionWithUUID:v23 activity:v25];
          }
          else
          {
            id v25 = sub_100008DCC();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v34 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unable to decode UUID from activitySession %@", buf, 0xCu);
            }
          }
        }
        id v17 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
      id v9 = v27;
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Message did not contain a valid activitySession.", buf, 2u);
  }
}

- (void)handleConversation:(id)a3 addHighlight:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v9 highlightIdentifier];

  id v13 = sub_100008DCC();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      BOOL v15 = [v9 highlightIdentifier];
      int v31 = 138412290;
      id v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received new highlight identifier %@", (uint8_t *)&v31, 0xCu);
    }
    id v16 = [v8 highlightIdentifiers];
    id v13 = [v16 anyObject];

    id v17 = [v8 remoteParticipantForHandle:v10];
    uint64_t v18 = [v9 highlightIdentifier];
    unsigned __int8 v19 = [v13 isEqualToString:v18];

    if (v19)
    {
      BOOL v20 = [(CSDConversationManager *)self collaborationStateManager];
      id v21 = [v9 highlightIdentifier];
      [v20 collaborationReAdded:v21];

      id v22 = [v8 tuConversation];
      id v23 = [v9 highlightIdentifier];
      uint64_t v24 = self;
      id v25 = v22;
      long long v26 = v23;
      id v27 = v13;
      long long v28 = v17;
      uint64_t v29 = 0;
    }
    else
    {
      long long v30 = [v9 highlightIdentifier];
      [v8 addHighlightIdentifier:v30];

      id v22 = [v8 tuConversation];
      id v23 = [v9 highlightIdentifier];
      uint64_t v24 = self;
      id v25 = v22;
      long long v26 = v23;
      id v27 = v13;
      long long v28 = v17;
      uint64_t v29 = 1;
    }
    [(CSDConversationManager *)v24 notifyDelegateOfHighlightAddedForConversation:v25 highlightIdentifier:v26 oldHighlightIdentifier:v27 byParticipant:v28 isFirstAdd:v29];
  }
  else if (v14)
  {
    LOWORD(v31) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Message did not contain a valid highlight identifier.", (uint8_t *)&v31, 2u);
  }
}

- (void)handleConversation:(id)a3 removeHighlight:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v9 highlightIdentifier];

  log = sub_100008DCC();
  BOOL v13 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "[WARN] Message did not contain a valid highlight identifier.", buf, 2u);
    }
    goto LABEL_15;
  }
  if (v13)
  {
    BOOL v14 = [v9 highlightIdentifier];
    *(_DWORD *)buf = 138412546;
    BOOL v45 = v14;
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Trying to remove highlight identifier %@ from conversation:%@ ", buf, 0x16u);
  }
  BOOL v15 = [v8 highlightIdentifiers];
  id v16 = [v9 highlightIdentifier];
  unsigned int v17 = [v15 containsObject:v16];

  if (v17)
  {
    uint64_t v18 = [v9 highlightIdentifier];
    [v8 removeHighlightIdentifier:v18];

    unsigned __int8 v19 = [(CSDConversationManager *)self collaborationStateManager];
    BOOL v20 = [v8 tuConversation];
    [v19 stopTrackingCollaborationForConversationIfNecessary:v20];

    id v30 = v10;
    log = [v8 remoteParticipantForHandle:v10];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [(CSDConversationManager *)self delegateToQueue];
    id v21 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v32 = *(void *)v40;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v25 = [v8 tuConversation];
          long long v26 = [(CSDConversationManager *)self delegateToQueue];
          [v26 objectForKey:v24];
          long long v28 = v27 = v8;

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1001190C4;
          block[3] = &unk_1005053A8;
          void block[4] = v24;
          id v35 = v25;
          id v36 = self;
          id v37 = log;
          id v38 = v9;
          id v29 = v25;
          dispatch_async(v28, block);

          id v8 = v27;
        }
        id v22 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v22);
    }

    id v10 = v30;
LABEL_15:
  }
}

- (void)handleConversation:(id)a3 screenShareRequest:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CSDConversationManager *)self featureFlags];
  unsigned int v12 = [v11 requestToScreenShareEnabled];

  if (v12)
  {
    BOOL v13 = [(CSDConversationManager *)self queue];
    dispatch_assert_queue_V2(v13);

    BOOL v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received screen share request for conversation %@ with message %@ from handle %@", buf, 0x20u);
    }

    BOOL v15 = [v9 screenShareContext];

    if (!v15)
    {
      id v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Message did not contain a valid screen share context.", buf, 2u);
      }
      goto LABEL_18;
    }
    id v16 = [v8 remoteParticipantForHandle:v10];
    unsigned int v17 = [v9 screenShareContext];
    unsigned int v18 = [v17 type];

    if (v18)
    {
      unsigned __int8 v19 = [v9 screenShareContext];
      unsigned int v20 = [v19 type];

      if (v20 != 2)
      {
LABEL_18:

        goto LABEL_19;
      }
      id v21 = [v9 screenShareContext];
      [(CSDConversationManager *)self removeScreenShareRequestFromParticipant:v16 conversation:v8 screenShareContext:v21];
    }
    else
    {
      if ([(CSDConversationManager *)self conversationContainsScreenShareRequest:v8 localRequest:0 requestHandle:v10])
      {
        id v22 = sub_100008DCC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1003AC1B0();
        }

        goto LABEL_18;
      }
      id v23 = [v9 screenShareContext];
      id isHandleEligibleForScreenSharingRequestsBlock = self->_isHandleEligibleForScreenSharingRequestsBlock;
      id v26 = 0;
      id v25 = [v23 incomingScreenShareRequestFromParticipant:v16 handleEligibilityBlock:isHandleEligibleForScreenSharingRequestsBlock error:&v26];
      id v21 = v26;

      if (v25) {
        [v8 addScreenSharingRequest:v25];
      }
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)handleConversation:(id)a3 screenShareResponse:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CSDConversationManager *)self featureFlags];
  unsigned int v12 = [v11 requestToScreenShareEnabled];

  if (v12)
  {
    BOOL v13 = [(CSDConversationManager *)self queue];
    dispatch_assert_queue_V2(v13);

    BOOL v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received screen share response for conversation %@ with message %@ from handle %@", (uint8_t *)&v20, 0x20u);
    }

    BOOL v15 = [v9 screenShareContext];

    if (v15)
    {
      id v16 = [v8 remoteParticipantForHandle:v10];
      unsigned int v17 = [v9 screenShareContext];
      unsigned int v18 = [v17 type];

      if ((v18 & 0xFFFFFFFE) == 2)
      {
        unsigned __int8 v19 = [v9 screenShareContext];
        [(CSDConversationManager *)self removeScreenShareRequestFromParticipant:v16 conversation:v8 screenShareContext:v19];
      }
      else
      {
        unsigned __int8 v19 = sub_100008DCC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412290;
          id v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] Received screen share response with invalid type %@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
    else
    {
      id v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Message did not contain a valid screen share context.", (uint8_t *)&v20, 2u);
      }
    }
  }
}

- (void)removeScreenShareRequestFromParticipant:(id)a3 conversation:(id)a4 screenShareContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc((Class)NSUUID);
  int v11 = [v9 screenShareUUID];
  id v12 = [v10 initWithUUIDString:v11];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v13 = [v8 screenSharingRequests];
  id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    id v23 = v9;
    id v15 = v7;
    uint64_t v16 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned int v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unsigned __int8 v19 = [v18 UUID];
        unsigned int v20 = [v19 isEqual:v12];

        if (v20)
        {
          id v14 = v18;
          goto LABEL_11;
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14) {
        continue;
      }
      break;
    }
LABEL_11:
    id v7 = v15;
    id v9 = v23;
  }

  id v21 = [v7 identifier];
  if (v21 == [v14 participantIdentifier] || objc_msgSend(v14, "originType") == (id)1)
  {
    if (v14) {
      [v8 removeScreenSharingRequest:v14];
    }
  }
  else
  {
    __int16 v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Originator of the screen share request does not match the participant who sent the request to cancel screen share", buf, 2u);
    }
  }
}

- (void)handleConversation:(id)a3 updateActivityImage:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v57 = a5;
  long long v54 = self;
  id v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  id v53 = v9;
  int v11 = [v9 activitySessions];
  id v12 = [v11 count];

  log = sub_100008DCC();
  BOOL v13 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    id v14 = v9;
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v83 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Updating activity images from message: %@", buf, 0xCu);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    log = [v9 activitySessions];
    id v61 = [log countByEnumeratingWithState:&v76 objects:v87 count:16];
    if (v61)
    {
      long long v52 = &v81;
      uint64_t v60 = *(void *)v77;
      uint64_t v58 = v8;
      while (1)
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(void *)v77 != v60) {
            objc_enumerationMutation(log);
          }
          uint64_t v16 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          id v17 = objc_alloc((Class)NSUUID);
          unsigned int v18 = [v16 identifierUUIDString];
          id v19 = [v17 initWithUUIDString:v18];

          if (v19)
          {
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            unsigned int v20 = [v8 activitySessions];
            id v21 = [v20 countByEnumeratingWithState:&v72 objects:v86 count:16];
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v73;
              while (2)
              {
                for (j = 0; j != v22; j = (char *)j + 1)
                {
                  if (*(void *)v73 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  long long v25 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
                  long long v26 = objc_msgSend(v25, "identifier", v52);
                  unsigned int v27 = [v26 isEqual:v19];

                  if (v27)
                  {
                    uint64_t v28 = v25;
                    goto LABEL_20;
                  }
                }
                id v22 = [v20 countByEnumeratingWithState:&v72 objects:v86 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
              uint64_t v28 = 0;
LABEL_20:
              id v8 = v58;
            }
            else
            {
              uint64_t v28 = 0;
            }

            __int16 v29 = [v8 stagedActivitySession];
            id v30 = [v29 UUID];
            unsigned int v31 = [v30 isEqual:v19];

            if (v31)
            {
              uint64_t v32 = [v8 stagedActivitySession];
            }
            else
            {
              uint64_t v32 = 0;
            }
            if (v28 | v32)
            {
              id v33 = objc_alloc((Class)NSUUID);
              id v34 = [v16 activity];
              id v35 = [v34 identifierUUIDString];
              id v36 = [v33 initWithUUIDString:v35];

              if (v36)
              {
                if (v28) {
                  id v37 = (void *)v28;
                }
                else {
                  id v37 = (void *)v32;
                }
                id v38 = objc_msgSend(v37, "activity", v52);
                long long v39 = [v38 originator];
                if (!v39)
                {
                  long long v40 = [v8 localMember];
                  long long v39 = [v40 handle];
                }
                if ([v39 isEquivalentToHandle:v57])
                {
                  unsigned int v55 = v38;
                  long long v41 = [v16 activity];
                  long long v42 = [v41 activityMetadata];

                  unsigned int v56 = v42;
                  if ([v42 hasImage])
                  {
                    id v43 = [v42 image];
                    uint64_t v44 = [v43 _FTOptionallyDecompressData];

                    v64[0] = _NSConcreteStackBlock;
                    v64[1] = 3221225472;
                    v64[2] = sub_10011A104;
                    v64[3] = &unk_100507C48;
                    CFStringRef v65 = (id)v28;
                    long long v66 = v36;
                    id v67 = v19;
                    id v68 = v44;
                    id v69 = (id)v32;
                    long long v70 = v54;
                    id v71 = v58;
                    BOOL v45 = v44;
                    __int16 v46 = objc_retainBlock(v64);
                    id v47 = [(CSDConversationManager *)v54 imageTranscoder];
                    v62[0] = _NSConcreteStackBlock;
                    v62[1] = 3221225472;
                    v62[2] = sub_10011A380;
                    v62[3] = &unk_100507C70;
                    v62[4] = v54;
                    id v63 = v46;
                    id v48 = v46;
                    [v47 generatePreviewImageFromData:v45 completionHandler:v62];

                    id v8 = v58;
                    long long v49 = v45;
                    long long v50 = v56;
                  }
                  else
                  {
                    CFStringRef v51 = sub_100008DCC();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                      sub_1003AC218((uint64_t)v80, (uint64_t)v16);
                    }
                    id v8 = v58;
                    long long v50 = v56;
                    long long v49 = v51;
                  }
                  id v38 = v55;
                }
                else
                {
                  long long v50 = sub_100008DCC();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v83 = v57;
                    __int16 v84 = 2112;
                    id v85 = v39;
                    _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Not updating activity because handle: %@ isn't the originator of the activity: %@", buf, 0x16u);
                  }
                }

LABEL_48:
              }
              else
              {
                id v38 = sub_100008DCC();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  long long v39 = [v16 activity];
                  *(_DWORD *)buf = 138412290;
                  id v83 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[WARN] Not updating activity, no activity UUID was provided in message: %@", buf, 0xCu);
                  goto LABEL_48;
                }
              }
            }
            else
            {
              id v36 = sub_100008DCC();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v83 = v19;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[WARN] Not updating activity, couldn't find activitySession || stagedActivitySession with UUID: %@", buf, 0xCu);
              }
            }

            goto LABEL_51;
          }
          uint64_t v28 = sub_100008DCC();
          if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v83 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_ERROR, "Unable to decode UUID from activitySession %@", buf, 0xCu);
          }
LABEL_51:
        }
        id v61 = [log countByEnumeratingWithState:&v76 objects:v87 count:16];
        if (!v61) {
          goto LABEL_56;
        }
      }
    }
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "[WARN] Message did not contain a valid activitySession.", buf, 2u);
    }
LABEL_56:
    id v14 = v53;
  }
}

- (void)handleConversation:(id)a3 receivedEndorsementForMember:(id)a4 fromHandle:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received endorsement message: %@", (uint8_t *)&v14, 0xCu);
  }

  int v11 = [v7 addedMembers];
  id v12 = [v11 firstObject];
  BOOL v13 = [v12 tuConversationMember];

  [v8 updateMemberValidationSource:v13 source:1];
}

- (void)handleConversation:(id)a3 receivedActivitySession:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v9 activitySessions];
  id v13 = [v12 count];

  log = sub_100008DCC();
  BOOL v14 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Received new activity for conversation %@", buf, 0xCu);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    log = [v9 activitySessions];
    id v15 = [log countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      id v32 = v10;
      id v30 = v9;
      uint64_t v17 = *(void *)v34;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(log);
          }
          id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          unsigned int v20 = [v19 activity];
          id v21 = [v20 tuConversationActivity];

          if (v21)
          {
            id v22 = [v21 metadata];
            if ([v22 supportsContinuationOnTV])
            {
            }
            else
            {
              uint64_t v23 = [v8 localMember];
              unsigned int v24 = [v23 isLightweightMember];

              if (v24)
              {
                __int16 v29 = sub_100008DCC();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v38 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Sending conversation back since new activitySession doesn't support aTV handoff. session: %@", buf, 0xCu);
                }

                [v8 leave];
                goto LABEL_29;
              }
            }
          }
          long long v25 = [(CSDConversationManager *)self createActivitySession:v19 onConversation:v8 fromHandle:v32];
          if (v25)
          {
            long long v26 = [v8 remoteParticipantForHandle:v32];
            if (v26)
            {
              unsigned int v27 = [v25 tuConversationActivitySession];
              [(CSDConversationManager *)self postSessionStartedForSession:v27 originator:v26 conversation:v8];
            }
            else
            {
              unsigned int v27 = sub_100008DCC();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v38 = v32;
                __int16 v39 = 2112;
                long long v40 = v25;
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Not posting start session event. Could not find participant for handle %@ for session %@", buf, 0x16u);
              }
            }
          }
          else
          {
            long long v26 = sub_100008DCC();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              uint64_t v28 = [v8 UUID];
              *(_DWORD *)buf = 138412546;
              id v38 = v19;
              __int16 v39 = 2112;
              long long v40 = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to add activitySession: %@ to conversation UUID: %@", buf, 0x16u);
            }
          }
        }
        id v16 = [log countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_29:
      id v9 = v30;
      id v10 = v32;
    }
  }
  else if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "[WARN] Message did not contain a valid activitySession.", buf, 2u);
  }
}

- (void)handleConversation:(id)a3 updateGuestMode:(id)a4 fromHandle:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  int v11 = [(CSDConversationManager *)self serverBag];
  unsigned __int8 v12 = [v11 isGuestModeSupported];

  if (v12)
  {
    unsigned __int8 v13 = [v8 hasGuestModeEnabled];
    BOOL v14 = sub_100008DCC();
    id v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received guest mode update for participant in conversation %@", buf, 0xCu);
      }

      id v36 = v8;
      id v16 = [v8 guestModeEnabled];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v17 = [v38 activeRemoteParticipants];
      id v18 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v47;
LABEL_7:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v46 + 1) + 8 * v21);
          uint64_t v23 = [v22 handle];
          unsigned int v24 = [v23 isEquivalentToHandle:v9];

          if (v24) {
            break;
          }
          if (v19 == (id)++v21)
          {
            id v19 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
            if (v19) {
              goto LABEL_7;
            }
            goto LABEL_13;
          }
        }
        [v22 setGuestModeEnabled:v16];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v15 = [(CSDConversationManager *)self delegateToQueue];
        id v26 = [v15 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (!v26) {
          goto LABEL_27;
        }
        id v27 = v26;
        id obj = v15;
        id v35 = v9;
        uint64_t v28 = *(void *)v43;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            unsigned int v31 = [v38 tuConversation];
            id v32 = [(CSDConversationManager *)self delegateToQueue];
            long long v33 = [v32 objectForKey:v30];

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10011ADFC;
            block[3] = &unk_100504FE0;
            void block[4] = v30;
            id v40 = v31;
            long long v41 = self;
            id v34 = v31;
            dispatch_async(v33, block);
          }
          id v27 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v27);
        id v9 = v35;
        id v8 = v36;
        id v15 = obj;
      }
      else
      {
LABEL_13:

        id v15 = sub_100008DCC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          long long v25 = [v38 activeRemoteParticipants];
          *(_DWORD *)buf = 138412546;
          id v52 = v9;
          __int16 v53 = 2112;
          long long v54 = v25;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Ignoring guest mode update message because the from-handle %@ did not match any active remote participants %@", buf, 0x16u);
        }
LABEL_27:
        id v8 = v36;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sub_1003AC2DC();
    }
  }
  else
  {
    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Ignoring guest mode message since guest mode is not currently supported", buf, 2u);
    }
  }
}

- (void)updateParticipantPresentationContexts:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B01C;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = v6;
  BOOL v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)buzzMember:(id)a3 conversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B278;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = v6;
  BOOL v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)kickMember:(id)a3 conversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B7E0;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = v6;
  BOOL v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (BOOL)conversationContainsScreenShareRequest:(id)a3 localRequest:(BOOL)a4 requestHandle:(id)a5
{
  int v5 = a4;
  id v7 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = objc_msgSend(a3, "screenSharingRequests", 0);
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 isLocallyOriginated] == v5)
        {
          BOOL v14 = [v13 handle];
          unsigned __int8 v15 = [v14 isEquivalentToHandle:v7];

          if (v15)
          {
            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)processUpdatedNickname:(id)a3 forHandle:(id)a4 conversationUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CSDConversationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011BC08;
  v15[3] = &unk_1005053D0;
  void v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)noticeManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(CSDConversationManager *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  _DWORD v16[2] = sub_10011C278;
  v16[3] = &unk_1005053D0;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsOnConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011C678;
  block[3] = &unk_1005050D0;
  BOOL v12 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)updateLocalMemberNickname:(id)a3 conversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011C8D4;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  int v5 = [(CSDConversationManager *)self screenSharingActivityManager];
  id v6 = [v5 latestRemoteAttributes];

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to get latest remote attributes, returning: %@", (uint8_t *)&v8, 0xCu);
  }

  v4[2](v4, v6);
}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011CCE4;
  block[3] = &unk_100505F88;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)generateLinkForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011D0DC;
  block[3] = &unk_100507D10;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (id)_getActivatedLinkWithHandle:(id)a3 updateGroupUUID:(id)a4 updateInvitedHandles:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(CSDConversationManager *)self linkManager];
  id v12 = [v11 getInactiveLinkForHandle:v8];

  if (!v12)
  {
    id v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to fetch inactive link, generating new links for %@", (uint8_t *)&v22, 0xCu);
    }

    long long v20 = [(CSDConversationManager *)self linkManager];
    [v20 generateAllInactiveLinksFor:v8];
    goto LABEL_10;
  }
  id v13 = [v12 pseudonym];
  unsigned int v14 = [(CSDConversationManager *)self isHandleStringLocalPseudonym:v13];

  if (!v14)
  {
    long long v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetched non-local inactive link %@", (uint8_t *)&v22, 0xCu);
    }
LABEL_10:

    id v17 = 0;
    goto LABEL_11;
  }
  id v15 = [(CSDConversationManager *)self linkManager];
  id v16 = [v12 pseudonym];
  id v17 = [v15 activateLinkForPseudonym:v16 updateGroupUUID:v9 updateInvitedHandles:v10];

  if (v17)
  {
    id v18 = [(CSDConversationManager *)self linkManager];
    [v18 generateInactiveLinkFor:v8 afterActivation:1];
  }
LABEL_11:

  return v17;
}

- (void)setConversationLink:(id)a3 forConversation:(id)a4 replyToCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  unsigned int v11 = [v9 setConversationLink:v8 allowUpdate:0];
  id v12 = sub_100008DCC();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setConversationLink %@ completed", (uint8_t *)&v16, 0xCu);
    }

    if (v10) {
      v10[2](v10, v8, 0);
    }
    [(CSDConversationManager *)self notifyDelegatesOfChangedLink:v8 conversation:v9];
    [(CSDConversationManager *)self sendMessagesForCreatedOrChangedLink:v8 conversation:v9 messageType:11];
    unsigned int v14 = +[NSSet setWithObject:IDSRegistrationPropertySupportsGondola];
    [v9 addRequiredCapabilities:v14 requiredLackOfCapabilities:0];
    goto LABEL_11;
  }
  if (v13)
  {
    id v15 = [v9 link];
    int v16 = 138412290;
    id v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Did not set conversation link as one already existed: %@", (uint8_t *)&v16, 0xCu);
  }
  if (v10)
  {
    unsigned int v14 = [v9 link];
    v10[2](v10, v14, 0);
LABEL_11:
  }
}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011DD88;
  v13[3] = &unk_100507D38;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDConversationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011E74C;
  v15[3] = &unk_100507DB0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011EC40;
  v13[3] = &unk_100507D38;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)renewLinkIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011F1A0;
  block[3] = &unk_100507D10;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011F76C;
  block[3] = &unk_100507EA0;
  id v20 = v12;
  unint64_t v21 = a5;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(v13, block);
}

- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FD20;
  block[3] = &unk_100507D10;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)generateAllInactiveLinks
{
  BOOL v3 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FE70;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)getInactiveLinkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100120018;
  v7[3] = &unk_100505C70;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)activateLink:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001203C0;
  block[3] = &unk_100507D10;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDConversationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100120664;
  v15[3] = &unk_100507DB0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  int v5 = [(CSDConversationManager *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100120B6C;
  v6[3] = &unk_100505030;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)recoverLinksForPseudonyms:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100120D08;
  v7[3] = &unk_100504F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100120E94;
  block[3] = &unk_100505F88;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)approvePendingMember:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121058;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)rejectPendingMember:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001212E4;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121548;
  block[3] = &unk_1005050D0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)addScreenSharingType:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121A28;
  block[3] = &unk_1005050A8;
  BOOL v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100121F08;
  v7[3] = &unk_100505C70;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122054;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012215C;
  v7[3] = &unk_100504F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122288;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeNonIndefiniteLinks
{
  BOOL v3 = [(CSDConversationManager *)self linkManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100122498;
  v4[3] = &unk_100507EF0;
  v4[4] = self;
  [v3 getActiveLinksWithCreatedOnly:1 completionHandler:v4];
}

- (void)removeConversationWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100122988;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addAliasesToConversationContainer:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122BD4;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)includeMetricsReport:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122DF8;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  [(CSDConversationManager *)self setLocalParticipantAudioVideoMode:a3 forConversationUUID:a4 presentationMode:a3 == 0];
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4 presentationMode:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [(CSDConversationManager *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100123088;
  v11[3] = &unk_100507F18;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a3;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);
}

- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4
{
}

- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001235CC;
  v7[3] = &unk_100504F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setupPendingConversationCleanupTimer
{
  BOOL v3 = [(CSDConversationManager *)self pendingConversationCleanupTimer];

  if (v3)
  {
    id v4 = [(CSDConversationManager *)self pendingConversationCleanupTimer];
    dispatch_source_cancel(v4);
  }
  int v5 = [(CSDConversationManager *)self queue];
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  [(CSDConversationManager *)self setPendingConversationCleanupTimer:v6];

  id v7 = [(CSDConversationManager *)self pendingConversationCleanupTimer];
  dispatch_time_t v8 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(v7, v8, 0x45D964B800uLL, 0x4A817C800uLL);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(CSDConversationManager *)self pendingConversationCleanupTimer];
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = 0x4072C00000000000;
    __int16 v17 = 2048;
    uint64_t v18 = 0x4034000000000000;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setupPendingConversationCleanupTimer: %f %f %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  BOOL v11 = [(CSDConversationManager *)self pendingConversationCleanupTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100123A6C;
  handler[3] = &unk_100505698;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_source_set_event_handler(v11, handler);

  id v12 = [(CSDConversationManager *)self pendingConversationCleanupTimer];
  dispatch_resume(v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)cleanupExpiredPendingConversations
{
  BOOL v3 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v5 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v9);
        BOOL v11 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
        id v12 = [v11 objectForKeyedSubscript:v10];

        unint64_t v13 = [v12 dateCreated];
        [v13 timeIntervalSinceNow];
        double v15 = v14;

        double v16 = -v15;
        if (v15 >= 0.0) {
          double v16 = v15;
        }
        if (v16 > 7200.0) {
          [v4 addObject:v10];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v7);
  }

  __int16 v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v35 = 0x40BC200000000000;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "cleanupExpiredPendingConversations: %f %@", buf, 0x16u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v4;
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      int v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v22);
        unsigned int v24 = [(CSDConversationManager *)self mutablePendingConversationsByPseudonym];
        [v24 setObject:0 forKeyedSubscript:v23];

        int v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }
}

- (void)conversationChanged:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "conversationChanged: %@", buf, 0xCu);
  }

  id v7 = [v4 activeRemoteParticipants];
  if ([v7 count])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [v4 activeLightweightParticipants];
    BOOL v8 = [v9 count] == 0;
  }
  if ([v4 state] || !v8)
  {
    uint64_t v10 = [(CSDConversationManager *)self persistenceController];
    [v10 updateConversation:v4];
  }
  else
  {
    [(CSDConversationManager *)self conversationInvalidated:v4];
    uint64_t v10 = [(CSDConversationManager *)self collaborationStateManager];
    BOOL v11 = [v4 tuConversation];
    [v10 stopTrackingCollaborationForConversationIfNecessary:v11];
  }
  long long v27 = v4;
  id v12 = [v4 tuConversation];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v13 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      double v16 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v16);
        id v18 = [(CSDConversationManager *)self delegateToQueue];
        id v19 = [v18 objectForKey:v17];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100124150;
        block[3] = &unk_100504FE0;
        void block[4] = v17;
        id v37 = v12;
        id v38 = self;
        dispatch_async(v19, block);

        double v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v14);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obja = [(CSDConversationManager *)self observerToQueue];
  id v20 = [obja countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obja);
        }
        uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v23);
        long long v25 = [(CSDConversationManager *)self observerToQueue];
        long long v26 = [v25 objectForKey:v24];

        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100124298;
        v30[3] = &unk_100504FE0;
        v30[4] = v24;
        v30[5] = self;
        id v31 = v12;
        dispatch_async(v26, v30);

        uint64_t v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [obja countByEnumeratingWithState:&v32 objects:v43 count:16];
    }
    while (v21);
  }
}

- (void)conversationConnectionDidStart:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 UUID];
    *(_DWORD *)buf = 138412290;
    long long v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "conversationConnectionDidStart UUID: %@", buf, 0xCu);
  }
  double v16 = [v4 tuConversation];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v8 = [(CSDConversationManager *)self delegateToQueue];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [(CSDConversationManager *)self delegateToQueue];
          uint64_t v15 = [v14 objectForKey:v13];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100124504;
          block[3] = &unk_100504FE0;
          void block[4] = v13;
          id v18 = v16;
          id v19 = self;
          dispatch_async(v15, block);
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)conversationInvalidated:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 UUID];
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "conversationInvalidated UUID: %@", (uint8_t *)&v17, 0xCu);
  }

  BOOL v8 = [(CSDConversationManager *)self mutableConversationsByUUID];
  [v8 setObject:0 forKeyedSubscript:v6];

  id v9 = [(CSDConversationManager *)self persistenceController];
  [v9 removeConversation:v4];

  id v10 = [(CSDConversationManager *)self pendingMembershipTracker];
  [v10 clearPendingMembershipFor:v4];

  uint64_t v11 = [v4 link];
  id v12 = v11;
  if (v11 && [v11 linkLifetimeScope] == (id)1)
  {
    uint64_t v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "conversationLink should be removed after call was invalidated %@", (uint8_t *)&v17, 0xCu);
    }

    id v14 = [(CSDConversationManager *)self linkManager];
    uint64_t v15 = [v12 pseudonym];
    [v14 invalidateLinkWithPseudonym:v15 deleteReason:7 completionHandler:&stru_100507F38];
  }
  double v16 = [(CSDConversationManager *)self collaborationStateManager];
  [v16 stopTrackingDisclosedCollaborationInitiatorsForConversationUUID:v6];

  [(CSDConversationManager *)self notifyDelegatesOfRemovedConversationWithUUID:v6];
}

- (void)conversation:(id)a3 addedActiveParticipant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v96 = v6;
    __int16 v97 = 2112;
    id v98 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "conversation: %@ addedActiveParticipant: %@", buf, 0x16u);
  }

  uint64_t v10 = [v7 association];
  id v72 = v6;
  long long v73 = self;
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = [(CSDConversationManager *)self featureFlags];
    if ([v12 conversationHandoffEnabled])
    {
      uint64_t v13 = [(CSDConversationManager *)self lockdownModeEnabled];
      char v14 = v13[2]();

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = [v7 handle];
        double v16 = [v6 localMember];
        int v17 = [v16 handle];
        if ([v15 isEquivalentToHandle:v17])
        {
          id v18 = [v7 association];
          id v19 = [v18 identifier];
          if (v19 == [v6 localParticipantIdentifier])
          {
            id v20 = [v6 state];

            if (v20 == (id)3)
            {
              long long v21 = sub_100008DCC();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                long long v22 = [v6 UUID];
                *(_DWORD *)buf = 138412546;
                id v96 = v22;
                __int16 v97 = 2112;
                id v98 = v7;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Conversation UUID %@ was continued on another device as participant %@, leaving...", buf, 0x16u);
              }
              long long v23 = [(CSDConversationManager *)self featureFlags];
              if ([v23 groupFacetimeAsAServiceEnabled])
              {
                uint64_t v24 = [v6 provider];

                if (v24)
                {
                  long long v25 = +[CSDConversationProviderManager sharedInstance];
                  long long v26 = [v6 provider];
                  long long v27 = [v25 serviceForProvider:v26];

LABEL_43:
                  long long v54 = [v7 activeIDSDestination];
                  unsigned int v55 = [v27 deviceForFromID:v54];

                  if (v55)
                  {
                    unsigned int v56 = objc_msgSend(v55, "csd_localizedDeviceCategory");
                  }
                  else
                  {
                    unsigned int v56 = 0;
                  }
                  v89[0] = _NSConcreteStackBlock;
                  v89[1] = 3221225472;
                  v89[2] = sub_100125298;
                  v89[3] = &unk_1005053D0;
                  v89[4] = self;
                  id v57 = v6;
                  id v90 = v57;
                  id v91 = v7;
                  id v92 = v56;
                  id v58 = v56;
                  uint64_t v59 = objc_retainBlock(v89);
                  if (([v57 supportsLeaveContext] & 1) != 0
                    || ([v57 activeRemoteParticipants],
                        uint64_t v60 = objc_claimAutoreleasedReturnValue(),
                        id v61 = [v60 count],
                        v60,
                        (unint64_t)v61 >= 4))
                  {
                    __int16 v62 = sub_100008DCC();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                    {
                      id v63 = [v57 UUID];
                      *(_DWORD *)buf = 138412290;
                      id v96 = v63;
                      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Leaving immediately due to handoff since the conversation with UUID: %@ supports leave context or was GFT before handoff", buf, 0xCu);
                    }
                    ((void (*)(void *))v59[2])(v59);
                  }
                  else
                  {
                    CFStringRef v64 = sub_100008DCC();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                    {
                      CFStringRef v65 = [v57 UUID];
                      *(_DWORD *)buf = 138412290;
                      id v96 = v65;
                      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Delaying leaving due to handoff since the conversation with UUID: %@ does not support leave context and was 1:1 before handoff", buf, 0xCu);
                    }
                    long long v66 = [(CSDConversationManager *)self serverBag];
                    dispatch_time_t v67 = dispatch_time(0, 1000000000 * (void)[v66 handoffUPlusOneLeaveDelay]);
                    id v68 = [(CSDConversationManager *)self queue];
                    dispatch_after(v67, v68, v59);
                  }
                  id v6 = v72;
                  goto LABEL_17;
                }
              }
              else
              {
              }
              long long v27 = [(CSDConversationManager *)self service];
              goto LABEL_43;
            }
            goto LABEL_29;
          }
        }
LABEL_29:
        long long v40 = sub_100008DCC();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          long long v41 = [v7 association];
          id v42 = [v41 identifier];
          id v43 = [v6 localParticipantIdentifier];
          id v44 = [v6 state];
          *(_DWORD *)buf = 138413058;
          id v96 = v7;
          __int16 v97 = 2048;
          id v98 = v42;
          __int16 v99 = 2048;
          id v100 = v43;
          __int16 v101 = 2048;
          id v102 = v44;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Added participant %@ is a handoff continuation for identifier %llu, but my local identifier is %llu. Not leaving, state: %ld", buf, 0x2Au);
        }
        [v6 updateReportInfoForHandoffParticipant:v7];
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v27 = [(CSDConversationManager *)self delegateToQueue];
        id v45 = [v27 countByEnumeratingWithState:&v85 objects:v94 count:16];
        if (v45)
        {
          id v46 = v45;
          uint64_t v47 = *(void *)v86;
          id v70 = v7;
          do
          {
            for (i = 0; i != v46; i = (char *)i + 1)
            {
              if (*(void *)v86 != v47) {
                objc_enumerationMutation(v27);
              }
              uint64_t v49 = *(void *)(*((void *)&v85 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                long long v50 = [v6 tuConversation];
                CFStringRef v51 = [(CSDConversationManager *)v73 delegateToQueue];
                id v52 = [v51 objectForKey:v49];

                v82[0] = _NSConcreteStackBlock;
                v82[1] = 3221225472;
                id v6 = v72;
                v82[2] = sub_100125608;
                v82[3] = &unk_100504FE0;
                v82[4] = v49;
                id v83 = v50;
                __int16 v84 = v73;
                id v53 = v50;
                dispatch_async(v52, v82);
              }
            }
            id v46 = [v27 countByEnumeratingWithState:&v85 objects:v94 count:16];
          }
          while (v46);
          self = v73;
          id v7 = v70;
        }
        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  long long v27 = sub_100008DCC();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v96 = v7;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "There was no participant association for added participant: %@", buf, 0xCu);
  }
LABEL_17:

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v28 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v79;
    do
    {
      id v31 = 0;
      id v69 = v29;
      do
      {
        if (*(void *)v79 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v78 + 1) + 8 * (void)v31);
        if (objc_opt_respondsToSelector())
        {
          long long v33 = [v6 tuConversation];
          long long v34 = [v7 tuConversationParticipant];
          long long v35 = [(CSDConversationManager *)v73 delegateToQueue];
          __int16 v36 = [v35 objectForKey:v32];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100125750;
          block[3] = &unk_1005053D0;
          void block[4] = v32;
          id v75 = v33;
          long long v76 = v73;
          id v77 = v34;
          id v37 = v34;
          id v6 = v72;
          id v38 = v37;
          id v39 = v33;
          dispatch_async(v36, block);

          id v29 = v69;
        }
        id v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      id v29 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
    }
    while (v29);
  }
}

- (void)conversation:(id)a3 didChangeLocalParticipant:(id)a4 broadcastActivitySession:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = (CSDMessagingConversationMessage *)a3;
  id v9 = a4;
  uint64_t v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  if ([(CSDMessagingConversationMessage *)v8 state] == (id)3
    || [(CSDMessagingConversationMessage *)v8 state] == (id)2)
  {
    uint64_t v11 = [(CSDConversationManager *)self screenCaptureQueue];
    id v12 = [(CSDMessagingConversationMessage *)v8 UUID];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];

    if ([v9 audioVideoMode] && v13)
    {
      char v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "executing queued up screenEnabled block since local participant mode changed", buf, 2u);
      }

      (*(void (**)(uint64_t))(v13 + 16))(v13);
      uint64_t v15 = [(CSDConversationManager *)self screenCaptureQueue];
      double v16 = [(CSDMessagingConversationMessage *)v8 UUID];
      [v15 setObject:0 forKeyedSubscript:v16];
    }
    int v17 = objc_alloc_init(CSDMessagingConversationParticipant);
    -[CSDMessagingConversationParticipant setAvMode:](v17, "setAvMode:", [v9 audioVideoMode]);
    -[CSDMessagingConversationParticipant setPresentationMode:](v17, "setPresentationMode:", [v9 presentationMode]);
    -[CSDMessagingConversationParticipant setIdentifier:](v17, "setIdentifier:", [v9 identifier]);
    if ([(CSDMessagingConversationParticipant *)v17 identifier])
    {
      BOOL v52 = v5;
      id v55 = v9;
      id v18 = [CSDMessagingConversationMessage alloc];
      id v19 = [(CSDMessagingConversationMessage *)v8 groupUUID];
      id v20 = [(CSDMessagingConversationMessage *)v18 initWithType:33 groupUUID:v19 link:0];

      long long v21 = [(CSDConversationManager *)self mutableConversationsRequestingUpgradeWithPreferences];
      long long v22 = [(CSDMessagingConversationMessage *)v8 UUID];
      uint64_t v23 = [v21 objectForKey:v22];

      if (v23)
      {
        [(CSDMessagingConversationMessage *)v20 setTUInvitationPreferences:v23];
        uint64_t v24 = [(CSDConversationManager *)self mutableConversationsRequestingUpgradeWithPreferences];
        long long v25 = [(CSDMessagingConversationMessage *)v8 UUID];
        [v24 removeObjectForKey:v25];
      }
      long long v54 = (void *)v23;
      [(CSDMessagingConversationMessage *)v20 addActiveParticipants:v17];
      v63[0] = IDSSendMessageOptionPublicMessageIntentKey;
      long long v26 = +[NSNumber numberWithInt:33];
      v63[1] = IDSSendMessageOptionQueueOneIdentifierKey;
      v64[0] = v26;
      long long v27 = +[NSNumber numberWithUnsignedLongLong:[(CSDMessagingConversationParticipant *)v17 identifier]];
      id v28 = +[NSNumber numberWithInt:33];
      id v29 = +[NSString stringWithFormat:@"%@:%@", v27, v28];
      v64[1] = v29;
      uint64_t v30 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];

      id v31 = [(CSDMessagingConversationMessage *)v20 data];
      [(CSDConversationManager *)self broadcastData:v31 onConversation:v8 additionalOptions:v30];

      if (v52)
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        uint64_t v32 = [(CSDMessagingConversationMessage *)v8 activitySessions];
        id v33 = [v32 countByEnumeratingWithState:&v56 objects:v62 count:16];
        if (v33)
        {
          id v34 = v33;
          CFStringRef v51 = v30;
          id v53 = v20;
          uint64_t v50 = v13;
          uint64_t v35 = *(void *)v57;
LABEL_14:
          uint64_t v36 = 0;
          while (1)
          {
            if (*(void *)v57 != v35) {
              objc_enumerationMutation(v32);
            }
            id v37 = *(void **)(*((void *)&v56 + 1) + 8 * v36);
            id v38 = [v37 activity];
            unsigned int v39 = [v38 isSystemActivity];

            if (!v39) {
              break;
            }
            if (v34 == (id)++v36)
            {
              id v34 = [v32 countByEnumeratingWithState:&v56 objects:v62 count:16];
              if (v34) {
                goto LABEL_14;
              }
              id v40 = v32;
              uint64_t v13 = v50;
              goto LABEL_28;
            }
          }
          id v40 = v37;

          uint64_t v13 = v50;
          uint64_t v30 = v51;
          id v20 = v53;
          if (!v40) {
            goto LABEL_31;
          }
          long long v41 = [CSDMessagingConversationMessage alloc];
          id v42 = [(CSDMessagingConversationMessage *)v8 groupUUID];
          id v43 = [(CSDMessagingConversationMessage *)v41 initWithType:8 groupUUID:v42 link:0];

          v60[0] = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
          id v44 = +[NSSet setWithObject:IDSRegistrationPropertySupportsCo];
          v61[0] = v44;
          v60[1] = IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey;
          id v45 = +[NSSet setWithObject:IDSRegistrationPropertySupportsAVLess];
          v61[1] = v45;
          id v46 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];

          uint64_t v47 = sub_100008DCC();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            long long v48 = [(CSDMessagingConversationMessage *)v8 UUID];
            *(_DWORD *)buf = 138412546;
            id v66 = v48;
            __int16 v67 = 2112;
            id v68 = v43;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "For AVLess to AV upgrade of conversation UUID %@, sending an AddActivitySession message to devices lacking AVLess support: %@", buf, 0x16u);
          }
          [(CSDConversationManager *)self sendMessage:v43 forConversation:v8 withActivitySession:v40 additionalOptions:v46];
          uint64_t v49 = [v40 tuConversationActivitySession];
          [(CSDConversationManager *)self broadcastImageForSession:v49 onConversation:v8];

LABEL_28:
          uint64_t v30 = v51;
          id v20 = v53;
        }
        else
        {
          id v40 = v32;
        }
      }
LABEL_31:

      id v9 = v55;
    }
    else
    {
      +[CSDCrashReporter simulateCrashReportWithFormat:@"Trying to send a participant update change with a participantIdentifier of 0. Please file a bug to [FaceTime | (New Bugs)]"];
    }
  }
  else
  {
    uint64_t v13 = sub_100008DCC();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v66 = v9;
      __int16 v67 = 2112;
      id v68 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Not broadcasting localParticipant change for participant %@ since the conversation isn't joined yet %@", buf, 0x16u);
    }
  }
}

- (void)conversation:(id)a3 removedActiveParticipant:(id)a4 withLeaveReason:(unint64_t)a5
{
  id v23 = a3;
  id v22 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v23;
    __int16 v42 = 2112;
    id v43 = v22;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "conversation: %@ removedActiveParticipant: %@", buf, 0x16u);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v21 = *(void *)v36;
    int v17 = v25;
    id v18 = v31;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v11);
        uint64_t v13 = objc_msgSend(v23, "tuConversation", v17, v18);
        char v14 = [v22 tuConversationParticipant];
        uint64_t v15 = [(CSDConversationManager *)self delegateToQueue];
        double v16 = [v15 objectForKey:v12];

        if (objc_opt_respondsToSelector())
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          v31[0] = sub_100126288;
          v31[1] = &unk_1005053D0;
          v31[2] = v12;
          id v32 = v13;
          id v33 = self;
          id v34 = v14;
          dispatch_async(v16, block);
        }
        if (objc_opt_respondsToSelector())
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v25[0] = sub_1001263D0;
          v25[1] = &unk_1005055D0;
          v25[2] = v12;
          id v26 = v13;
          long long v27 = self;
          id v28 = v14;
          unint64_t v29 = a5;
          dispatch_async(v16, v24);
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v10 != v11);
      id v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v10);
  }
}

- (void)conversation:(id)a3 updatedActiveParticipant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "conversation: %@ participant: %@", buf, 0x16u);
  }
  id v19 = v7;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v13);
        uint64_t v15 = [v6 tuConversation];
        double v16 = [(CSDConversationManager *)self delegateToQueue];
        int v17 = [v16 objectForKey:v14];

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        void block[2] = sub_10012676C;
        block[3] = &unk_100504FE0;
        void block[4] = v14;
        id v22 = v15;
        id v23 = self;
        id v18 = v15;
        dispatch_async(v17, block);

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
}

- (void)conversation:(id)a3 updatedActiveParticipantWithScreenSharing:(id)a4
{
  id v17 = a3;
  id v16 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = [v17 tuConversation];
          uint64_t v13 = [(CSDConversationManager *)self delegateToQueue];
          uint64_t v14 = [v13 objectForKey:v11];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_100126AD0;
          block[3] = &unk_1005053D0;
          void block[4] = v11;
          id v20 = v12;
          uint64_t v21 = self;
          id v22 = v16;
          id v15 = v12;
          dispatch_async(v14, block);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
}

- (void)conversationDidStopScreenCapture:(id)a3
{
  id v4 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = [(CSDConversationManager *)self featureFlags];
  unsigned int v6 = [v5 sckSystemPickerEnabled];

  if (v6)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting to stop the screensharing activity session since screen capture ended", v9, 2u);
    }

    id v8 = [(CSDConversationManager *)self screenSharingActivityManager];
    [v8 stopActivitySession];
  }
}

- (void)conversation:(id)a3 mediaPrioritiesChangedForParticipant:(id)a4
{
  id v20 = a3;
  id v19 = a4;
  unsigned int v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    id v18 = v23;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = objc_msgSend(v20, "tuConversation", v18);
          uint64_t v13 = [v19 tuConversationParticipant];
          uint64_t v14 = [(CSDConversationManager *)self delegateToQueue];
          id v15 = [v14 objectForKey:v11];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          v23[0] = sub_100126F2C;
          v23[1] = &unk_1005053D0;
          v23[2] = v11;
          id v24 = v12;
          long long v25 = self;
          id v26 = v13;
          id v16 = v13;
          id v17 = v12;
          dispatch_async(v15, block);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
}

- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    id v20 = v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v14 = objc_msgSend(v23, "tuConversation", v20);
          id v15 = [v22 tuConversationParticipant];
          id v16 = [(CSDConversationManager *)self delegateToQueue];
          id v17 = [v16 objectForKey:v13];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          v26[0] = sub_1001272D0;
          v26[1] = &unk_1005053A8;
          v26[2] = v13;
          id v27 = v14;
          long long v28 = self;
          id v29 = v15;
          id v30 = v21;
          id v18 = v15;
          id v19 = v14;
          dispatch_async(v17, block);
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }
}

- (void)conversation:(id)a3 participantDidStopReacting:(id)a4
{
  id v20 = a3;
  id v19 = a4;
  unsigned int v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    id v18 = v23;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = objc_msgSend(v20, "tuConversation", v18);
          uint64_t v13 = [v19 tuConversationParticipant];
          uint64_t v14 = [(CSDConversationManager *)self delegateToQueue];
          id v15 = [v14 objectForKey:v11];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          v23[0] = sub_100127650;
          v23[1] = &unk_1005053D0;
          v23[2] = v11;
          id v24 = v12;
          long long v25 = self;
          id v26 = v13;
          id v16 = v13;
          id v17 = v12;
          dispatch_async(v15, block);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
}

- (void)conversation:(id)a3 requestBlobRecoveryForParticipantDestination:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, BOOL))a5;
  id v10 = a3;
  uint64_t v11 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = TULoggableStringForHandle();
    int v19 = 138412290;
    id v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting blob recovery for %@", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v14 = [CSDMessagingConversationMessage alloc];
  id v15 = [v10 groupUUID];
  id v16 = [(CSDMessagingConversationMessage *)v14 initWithType:4 groupUUID:v15 link:0];

  [(CSDMessagingConversationMessage *)v16 setRequestBlobRecoveryOptions:1];
  id v17 = [(CSDMessagingConversationMessage *)v16 data];
  BOOL v18 = [(CSDConversationManager *)self sendData:v17 onConversation:v10 toDestinationID:v8];

  v9[2](v9, v18);
}

- (void)conversation:(id)a3 sendDeclineMessageToParticipantDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = TULoggableStringForHandle();
    int v15 = 138412290;
    id v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending decline message for %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v11 = [CSDMessagingConversationMessage alloc];
  uint64_t v12 = [v7 groupUUID];
  uint64_t v13 = [(CSDMessagingConversationMessage *)v11 initWithType:9 groupUUID:v12 link:0];

  uint64_t v14 = [(CSDMessagingConversationMessage *)v13 data];
  [(CSDConversationManager *)self sendData:v14 onConversation:v7 toDestinationID:v6];
}

- (void)conversation:(id)a3 failedWithContext:(id)a4
{
  id v17 = a3;
  id v16 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = [v17 tuConversation];
          uint64_t v13 = [(CSDConversationManager *)self delegateToQueue];
          uint64_t v14 = [v13 objectForKey:v11];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_100127CB0;
          block[3] = &unk_1005053D0;
          void block[4] = v11;
          id v20 = v12;
          id v21 = self;
          id v22 = v16;
          id v15 = v12;
          dispatch_async(v14, block);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
}

- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(CSDConversationManager *)self conversationNoticeManger];
  int v19 = v6;
  [v9 conversation:v6 receivedActivitySessionEvent:v7];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [v19 tuConversation];
          id v16 = [(CSDConversationManager *)self delegateToQueue];
          id v17 = [v16 objectForKey:v14];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_100128038;
          block[3] = &unk_1005053D0;
          void block[4] = v14;
          id v22 = v15;
          long long v23 = self;
          id v24 = v7;
          id v18 = v15;
          dispatch_async(v17, block);
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

- (void)conversation:(id)a3 activitySessionChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 UUID];
    int v11 = 138412546;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "conversation UUID: %@ activitySessionChanged: %@", (uint8_t *)&v11, 0x16u);
  }
  [(CSDConversationManager *)self conversationChanged:v6];
}

- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  id v18 = v6;
  if ([v6 state] == (id)4)
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"CSDSharePlayMediaDidHandoffNotification" object:v19];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v19 tuConversation];
          id v15 = [(CSDConversationManager *)self delegateToQueue];
          id v16 = [v15 objectForKey:v13];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_1001284F0;
          block[3] = &unk_1005053D0;
          void block[4] = v13;
          id v22 = v14;
          long long v23 = self;
          id v24 = v18;
          id v17 = v14;
          dispatch_async(v16, block);
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }
}

- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4
{
  id v17 = a3;
  id v18 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scene association changed for activity session: %@", buf, 0xCu);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = [v17 tuConversation];
          id v14 = [(CSDConversationManager *)self delegateToQueue];
          id v15 = [v14 objectForKey:v12];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_1001288A8;
          block[3] = &unk_1005053D0;
          void block[4] = v12;
          id v21 = v13;
          id v22 = self;
          id v23 = v18;
          id v16 = v13;
          dispatch_async(v15, block);
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
}

- (void)conversation:(id)a3 appLaunchState:(unint64_t)a4 forActivitySession:(id)a5
{
  id v21 = a3;
  id v20 = a5;
  id v7 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v21 UUID];
    *(_DWORD *)buf = 134218498;
    unint64_t v34 = a4;
    __int16 v35 = 2112;
    id v36 = v20;
    __int16 v37 = 2112;
    long long v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "App launch state changed to: %lu for activity session: %@ on conversation with UUID: %@", buf, 0x20u);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [v21 tuConversation];
          id v16 = [(CSDConversationManager *)self delegateToQueue];
          id v17 = [v16 objectForKey:v14];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_100128C98;
          block[3] = &unk_1005055D0;
          void block[4] = v14;
          id v24 = v15;
          long long v25 = self;
          unint64_t v27 = a4;
          id v26 = v20;
          id v18 = v15;
          dispatch_async(v17, block);
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }
}

- (void)conversation:(id)a3 activityChangedOnSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "conversation: %@ activityChangedOnSession: %@", buf, 0x16u);
  }

  id v10 = [v7 activity];
  id v11 = [v10 originator];

  if (!v11)
  {
    uint64_t v12 = [CSDMessagingConversationMessage alloc];
    uint64_t v13 = [v6 groupUUID];
    uint64_t v14 = [(CSDMessagingConversationMessage *)v12 initWithType:23 groupUUID:v13 link:0];

    id v15 = objc_alloc_init(CSDMessagingConversationActivitySession);
    id v16 = [v7 activity];
    id v17 = [v16 copy];

    id v18 = [v7 UUID];
    id v19 = [v18 UUIDString];
    [(CSDMessagingConversationActivitySession *)v15 setIdentifierUUIDString:v19];

    id v20 = +[CSDMessagingConversationActivity activityWithCSDConversationActivity:v17 fromConversation:v6 forStorage:0];
    [(CSDMessagingConversationActivitySession *)v15 setActivity:v20];

    [(CSDMessagingConversationMessage *)v14 addActivitySessions:v15];
    v28[0] = IDSSendMessageOptionPublicMessageIntentKey;
    v28[1] = IDSSendMessageOptionQueueOneIdentifierKey;
    v29[0] = &off_100523B30;
    id v21 = [v7 UUID];
    id v22 = [v21 UUIDString];
    id v23 = +[NSString stringWithFormat:@"%@:%@", v22, &off_100523B30];
    v29[1] = v23;
    id v24 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

    long long v25 = [(CSDMessagingConversationMessage *)v14 data];
    unsigned int v26 = [(CSDConversationManager *)self broadcastData:v25 onConversation:v6 additionalOptions:v24];

    unint64_t v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "(success: %d)", buf, 8u);
    }

    [(CSDConversationManager *)self broadcastImageForSession:v7 onConversation:v6];
    [(CSDConversationManager *)self conversationChanged:v6];
  }
}

- (void)notifyDelegateOfHighlightAddedForConversation:(id)a3 highlightIdentifier:(id)a4 oldHighlightIdentifier:(id)a5 byParticipant:(id)a6 isFirstAdd:(BOOL)a7
{
  id v22 = a3;
  id v23 = a4;
  id v11 = a5;
  id v21 = a6;
  if (v11 && ([v11 isEqualToString:v23] & 1) == 0)
  {
    uint64_t v12 = [(CSDConversationManager *)self collaborationStateManager];
    [v12 collaborationRemoved:v11];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v16);
        if (objc_opt_respondsToSelector())
        {
          id v18 = [(CSDConversationManager *)self delegateToQueue];
          id v19 = [v18 objectForKey:v17];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_100129398;
          block[3] = &unk_100506B18;
          void block[4] = v17;
          id v26 = v22;
          unint64_t v27 = self;
          id v28 = v21;
          id v29 = v23;
          id v30 = v11;
          BOOL v31 = a7;
          dispatch_async(v19, block);
        }
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }
}

- (void)notifyDelegateOfHighlightRemovedFromConversation:(id)a3 highlightIdentifier:(id)a4 byParticipant:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v18 = a5;
  id v9 = [(CSDConversationManager *)self collaborationStateManager];
  id v19 = v8;
  [v9 collaborationRemoved:v8];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = [(CSDConversationManager *)self delegateToQueue];
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v14);
        if (objc_opt_respondsToSelector())
        {
          id v16 = [(CSDConversationManager *)self delegateToQueue];
          uint64_t v17 = [v16 objectForKey:v15];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_10012971C;
          block[3] = &unk_1005053A8;
          void block[4] = v15;
          id v22 = v20;
          id v23 = self;
          id v24 = v18;
          id v25 = v19;
          dispatch_async(v17, block);
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }
}

- (void)startTrackingCollaborationWithIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(CSDConversationManager *)self queue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001299B4;
  void v23[3] = &unk_100507D60;
  v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async(v17, v23);
}

- (void)addHighlightIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100129C3C;
  block[3] = &unk_1005053A8;
  id v20 = v10;
  id v21 = v11;
  id v22 = self;
  id v23 = v13;
  id v24 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)removeHighlightIdentifier:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100129F70;
  block[3] = &unk_100504FE0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)markCollaborationWithIdentifierOpened:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10012A208;
  block[3] = &unk_100504FE0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)collaborationStateChanged:(int64_t)a3 forCollaborationIdentifier:(id)a4 onConversationUUID:(id)a5
{
  id v24 = a4;
  id v7 = a5;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManager *)self mutableConversationsByUUID];
  id v10 = [v9 objectForKeyedSubscript:v7];

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v37 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Collaboration state changed to %lu", buf, 0xCu);
  }

  if (v10)
  {
    id v20 = v7;
    id v22 = v10;
    id v21 = [v10 tuConversation];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v12 = [(CSDConversationManager *)self delegateToQueue];
    id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v16);
          if (objc_opt_respondsToSelector())
          {
            id v18 = [(CSDConversationManager *)self delegateToQueue];
            id v19 = [v18 objectForKey:v17];

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            void block[2] = sub_10012A5D0;
            block[3] = &unk_100507F60;
            void block[4] = v17;
            id v26 = v22;
            id v27 = self;
            id v28 = v21;
            int64_t v30 = a3;
            id v29 = v24;
            dispatch_async(v19, block);
          }
          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }

    id v7 = v20;
    id v10 = v22;
  }
}

- (void)sendHighlightMessageForConversation:(id)a3 highlightIdentifier:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)id v25 = v8;
    *(_WORD *)&v25[8] = 2112;
    *(void *)&v25[10] = v9;
    __int16 v26 = 1024;
    int v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "conversation: %@ highlight identifier: %@ type: %d", buf, 0x1Cu);
  }

  id v12 = [CSDMessagingConversationMessage alloc];
  id v13 = [v8 groupUUID];
  id v14 = [(CSDMessagingConversationMessage *)v12 initWithType:v5 groupUUID:v13 link:0];

  [(CSDMessagingConversationMessage *)v14 setHighlightIdentifier:v9];
  v22[0] = IDSSendMessageOptionPublicMessageIntentKey;
  uint64_t v15 = +[NSNumber numberWithInt:v5];
  v22[1] = IDSSendMessageOptionQueueOneIdentifierKey;
  v23[0] = v15;
  id v16 = +[NSNumber numberWithInt:v5];
  uint64_t v17 = +[NSString stringWithFormat:@"%@:%@", v9, v16];
  v23[1] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  id v19 = [(CSDMessagingConversationMessage *)v14 data];
  unsigned int v20 = [(CSDConversationManager *)self broadcastData:v19 onConversation:v8 additionalOptions:v18];

  id v21 = sub_100008DCC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v25 = v20;
    *(_WORD *)&v25[4] = 2112;
    *(void *)&v25[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "(success: %d for highlight identifier: %@)", buf, 0x12u);
  }
}

- (void)addCollaborationDictionary:(id)a3 forConversationWithUUID:(id)a4 fromMe:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CSDConversationManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012AA88;
  v13[3] = &unk_100506C18;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CSDConversationManager *)self collaborationStateManager];
  [v11 getNeedsDisclosureOfCollaborationInitiator:v10 forConversationUUID:v9 completionHandler:v8];
}

- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManager *)self collaborationStateManager];
  [v8 addDisclosedCollaborationInitiator:v7 toConversationUUID:v6];
}

- (void)conversation:(id)a3 changedBytesOfDataUsed:(int64_t)a4
{
  id v16 = a3;
  uint64_t v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v16 tuConversation];
          id v12 = [(CSDConversationManager *)self delegateToQueue];
          id v13 = [v12 objectForKey:v10];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_10012B400;
          block[3] = &unk_100506BD0;
          void block[4] = v10;
          id v19 = v11;
          unsigned int v20 = self;
          int64_t v21 = a4;
          id v14 = v11;
          dispatch_async(v13, block);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)conversation:(id)a3 activitySessionRemoved:(id)a4 userOriginated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  if (v5)
  {
    id v11 = [v9 activity];
    unsigned __int8 v12 = [v11 isStaticActivity];

    if ((v12 & 1) == 0)
    {
      id v13 = [v9 terminatingHandle];

      if (v13)
      {
        id v14 = [v9 terminatingHandle];
        id v15 = [v8 remoteParticipantForHandle:v14];
      }
      else
      {
        id v15 = [v8 localParticipant];
        id v16 = [CSDMessagingConversationMessage alloc];
        uint64_t v17 = [v8 groupUUID];
        id v14 = [(CSDMessagingConversationMessage *)v16 initWithType:21 groupUUID:v17 link:0];

        id v18 = objc_alloc_init(CSDMessagingConversationActivitySession);
        id v19 = [v9 UUID];
        unsigned int v20 = [v19 UUIDString];
        [(CSDMessagingConversationActivitySession *)v18 setIdentifierUUIDString:v20];

        [(CSDMessagingConversationMessage *)v14 addActivitySessions:v18];
        int64_t v21 = [(CSDMessagingConversationMessage *)v14 data];
        uint64_t v28 = IDSSendMessageOptionPublicMessageIntentKey;
        long long v22 = +[NSNumber numberWithInt:[(CSDMessagingConversationMessage *)v14 type]];
        id v29 = v22;
        long long v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        unsigned int v24 = [(CSDConversationManager *)self broadcastData:v21 onConversation:v8 additionalOptions:v23];

        long long v25 = sub_100008DCC();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v27[0] = 67109120;
          v27[1] = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Did send activity removal message successfully? %d", (uint8_t *)v27, 8u);
        }
      }
      if (v15)
      {
        [(CSDConversationManager *)self postEndEventForSession:v9 originator:v15 conversation:v8];
      }
      else
      {
        __int16 v26 = sub_100008DCC();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1003AC6B8();
        }
      }
    }
  }
}

- (void)conversation:(id)a3 sendResourceAtURL:(id)a4 toParticipants:(id)a5 metadata:(id)a6 activitySessionUUID:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *))a8;
  unsigned int v20 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v20);

  int64_t v21 = sub_100008DCC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    long long v22 = [v15 URL];
    *(_DWORD *)buf = 138412290;
    id v55 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sending resource at url %@", buf, 0xCu);
  }
  long long v23 = [(CSDConversationManager *)self resourceTransferCallbacks];
  unsigned int v24 = [v15 URL];
  long long v25 = [v23 objectForKeyedSubscript:v24];

  if (v25)
  {
    __int16 v26 = sub_100008DCC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1003AC754(v15, v26);
    }

    int v27 = +[NSError errorWithDomain:@"CSDResourceTransferErrorDomain" code:1 userInfo:0];
    v19[2](v19, v27);
  }
  else
  {
    id v46 = v18;
    id v47 = v17;
    long long v48 = v14;
    int v27 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v16 count]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v44 = v16;
    id v28 = v16;
    id v29 = [v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v50;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "activeIDSDestination", v44);
          [v27 addObject:v33];
        }
        id v30 = [v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v30);
    }

    if ([v27 count])
    {
      long long v34 = +[NSMutableDictionary dictionary];
      long long v35 = [v48 groupUUID];
      id v36 = [v35 UUIDString];
      [v34 setObject:v36 forKey:@"resourceTransferConversationIDKey"];

      int64_t v37 = [v46 UUIDString];
      [v34 setObject:v37 forKey:@"resourceTransferActivitySessionIDKey"];

      if (v47) {
        [v34 setObject:v47 forKey:@"resourceTransferClientMetadataKey"];
      }
      if (v19)
      {
        long long v38 = objc_retainBlock(v19);
        unsigned int v39 = [(CSDConversationManager *)self resourceTransferCallbacks];
        id v40 = [v15 URL];
        [v39 setObject:v38 forKeyedSubscript:v40];
      }
      id v41 = [(CSDConversationManager *)self fileTransferController];
      __int16 v42 = [v48 localMember];
      [v41 transferFileAtSandboxExtendedURL:v15 toDestinations:v27 withMetadata:v34 fromMember:v42];

      id v14 = v48;
      id v16 = v45;
      id v17 = v47;
    }
    else
    {
      id v43 = sub_100008DCC();
      id v17 = v47;
      id v14 = v48;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1003AC720();
      }

      long long v34 = +[NSError errorWithDomain:@"CSDResourceTransferErrorDomain" code:2 userInfo:0];
      v19[2](v19, v34);
      id v16 = v44;
    }

    id v18 = v46;
  }
}

- (void)conversation:(id)a3 addedMembers:(id)a4 triggeredLocally:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v31 = v8;
    __int16 v32 = 2112;
    if (v5) {
      CFStringRef v12 = @"YES";
    }
    id v33 = v9;
    __int16 v34 = 2112;
    CFStringRef v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "conversation: %@ addedMembers: %@ triggeredLocally: %@", buf, 0x20u);
  }

  [(CSDConversationManager *)self broadcastLightweightEndorsementForAddedMembers:v9 onConversation:v8];
  if (v5)
  {
    id v13 = [v8 stagedActivitySession];

    if (v13)
    {
      id v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v8 stagedActivitySession];
        *(_DWORD *)buf = 138412290;
        id v31 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found staged ActivitySession on conversation. Distributing image. %@", buf, 0xCu);
      }
      id v16 = [v8 stagedActivitySession];
      [(CSDConversationManager *)self broadcastImageForSession:v16 onConversation:v8];
    }
    id v24 = v9;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = [v8 tuActivitySessions];
    id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v23 = sub_100008DCC();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v31 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found ActivitySession on conversation. Distributing image. %@", buf, 0xCu);
          }

          [(CSDConversationManager *)self broadcastImageForSession:v22 onConversation:v8];
        }
        id v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    id v9 = v24;
  }
  [(CSDConversationManager *)self conversationChanged:v8];
}

- (void)conversationDidTriggerJoin:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "conversation: %@ triggered join.", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v7 = [v4 stagedActivitySession];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [v4 stagedActivitySession];
    unsigned int v10 = [v9 isLocallyInitiated];

    if (v10)
    {
      id v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v12 = [v4 stagedActivitySession];
        int v14 = 138412290;
        id v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found staged ActivitySession on conversation. Distributing image. %@", (uint8_t *)&v14, 0xCu);
      }
      id v13 = [v4 stagedActivitySession];
      [(CSDConversationManager *)self broadcastImageForSession:v13 onConversation:v4];
    }
  }
}

- (void)conversation:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6
{
  id v20 = a3;
  id v23 = a4;
  id v22 = a5;
  id v21 = a6;
  unsigned int v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10012C498;
  v35[4] = sub_10012C4C4;
  id v36 = objc_retainBlock(v21);
  id v11 = dispatch_group_create();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  CFStringRef v12 = [(CSDConversationManager *)self observerToQueue];
  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v32;
    id obj = v12;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v15);
        id v17 = [(CSDConversationManager *)self observerToQueue];
        id v18 = [v17 objectForKey:v16];

        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v11);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_10012C4CC;
          block[3] = &unk_100507FB0;
          void block[4] = v16;
          void block[5] = self;
          id v27 = v23;
          id v28 = v22;
          id v30 = v35;
          id v29 = v11;
          dispatch_async(v18, block);
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      CFStringRef v12 = obj;
      id v13 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v13);
  }

  id v19 = [(CSDConversationManager *)self queue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10012C6C0;
  void v25[3] = &unk_100507FD8;
  v25[4] = v35;
  dispatch_group_notify(v11, v19, v25);

  _Block_object_dispose(v35, 8);
}

- (void)conversation:(id)a3 screenShareAttributesSelected:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 UUID];

  [(CSDConversationManager *)self setScreenEnabled:1 screenShareAttributes:v6 forConversationWithUUID:v9];
}

- (void)conversation:(id)a3 screenShareAttributesUpdated:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 UUID];

  [(CSDConversationManager *)self setScreenShareAttributes:v6 forConversationWithUUID:v9];
}

- (void)conversation:(id)a3 screenShareAttributesDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDConversationManager *)self screenSharingActivityManager];
  [v7 broadcastAttributes:v5];
}

- (void)conversation:(id)a3 remoteMembersChanged:(id)a4
{
  id v16 = a3;
  id v15 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(CSDConversationManager *)self delegateToQueue];
  id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v16 tuConversation];
          CFStringRef v12 = [(CSDConversationManager *)self delegateToQueue];
          id v13 = [v12 objectForKey:v10];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_10012CA9C;
          block[3] = &unk_1005053D0;
          void block[4] = v10;
          id v19 = v11;
          id v20 = self;
          id v21 = v15;
          id v14 = v11;
          dispatch_async(v13, block);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v10 = (__CFString *)a5;
  id v11 = a7;
  CFStringRef v12 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v12);

  if (a6)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 138412546;
      CFStringRef v37 = v10;
      __int16 v38 = 2112;
      id v39 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sent %@ with error: %@", (uint8_t *)&v36, 0x16u);
    }

    [(CSDConversationManager *)self _runCallbackIfNecessaryForMessage:v10];
  }
  else
  {
    id v14 = [(CSDConversationManager *)self mutablePseudonymsByRequestIdentifiers];
    id v15 = [v14 objectForKeyedSubscript:v10];

    if (v15 && [v11 code] == (id)3)
    {
      id v16 = [(CSDConversationManager *)self pendingConversationWithPseudonym:v15];
      if (v16)
      {
        id v17 = sub_100008DCC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 138412290;
          CFStringRef v37 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Let me in request was sent to invalid pseudonym %@, ending pending conversation", (uint8_t *)&v36, 0xCu);
        }

        [(CSDConversationManager *)self notifyDelegatesOfInvalidLinkForPendingConversation:v16];
      }
    }
  }
  id v18 = [(CSDConversationManager *)self outIdentifierToConversationInfo];
  id v19 = [v18 objectForKey:v10];

  if (v19)
  {
    id v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(CSDConversationManager *)self outIdentifierToConversationInfo];
      long long v22 = [v21 objectForKeyedSubscript:v10];
      int v36 = 138412546;
      CFStringRef v37 = v10;
      __int16 v38 = 2112;
      id v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "outIdentifierToConversationInfo[%@] = %@", (uint8_t *)&v36, 0x16u);
    }
    if (a6)
    {
      long long v23 = [(CSDConversationManager *)self outIdentifierToConversationInfo];
      long long v24 = [v23 objectForKeyedSubscript:v10];

      long long v25 = [v24 objectForKeyedSubscript:@"kCSDConversationIsLetMeInApproved"];
      id v26 = [v25 BOOLValue];

      id v27 = [v24 objectForKeyedSubscript:@"kCSDConversationGroupUUID"];
      id v28 = [(CSDConversationManager *)self conversationWithGroupUUID:v27];

      id v29 = [v28 tuConversation];

      id v30 = sub_100008DCC();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v31)
        {
          CFStringRef v32 = @"NO";
          if (v26) {
            CFStringRef v32 = @"YES";
          }
          int v36 = 138412290;
          CFStringRef v37 = v32;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Report sent let me in response (approved: %@)", (uint8_t *)&v36, 0xCu);
        }

        id v30 = [(CSDConversationManager *)self reportingController];
        long long v33 = [v28 tuConversation];
        [v30 sentLetMeInRequestForConversation:v33 isApproved:v26];
      }
      else if (v31)
      {
        CFStringRef v34 = @"NO";
        if (v26) {
          CFStringRef v34 = @"YES";
        }
        int v36 = 138412546;
        CFStringRef v37 = v34;
        __int16 v38 = 2112;
        id v39 = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Not report sent let me in response (approved: %@) because TUConversation is null for %@", (uint8_t *)&v36, 0x16u);
      }
    }
    else
    {
      long long v24 = sub_100008DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1003AC7E0();
      }
    }

    CFStringRef v35 = [(CSDConversationManager *)self outIdentifierToConversationInfo];
    [v35 removeObjectForKey:v10];
  }
}

- (void)_runCallbackIfNecessaryForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self mutableSendDataCallbacksByRequestIdentifiers];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = [(CSDConversationManager *)self mutableSendDataCallbacksByRequestIdentifiers];
    [v7 removeObjectForKey:v4];

    uint64_t v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Running callback for message %@, which has been received by the IDS daemon", (uint8_t *)&v9, 0xCu);
    }

    v6[2](v6);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v14 length])
  {
    id v16 = (void *)IDSCopyAddressDestinationForDestination();
    id v17 = IDSCopyRawAddressForDestination();

    id v18 = +[TUHandle normalizedHandleWithDestinationID:v17];
    id v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [v12 serviceIdentifier];
      __int16 v38 = v17;
      id v20 = self;
      id v21 = v18;
      id v22 = v12;
      v24 = id v23 = v13;
      long long v25 = IDSLoggableDescriptionForHandleOnService();
      *(_DWORD *)buf = 134219010;
      int64_t v42 = a5;
      __int16 v43 = 2112;
      id v44 = v22;
      __int16 v45 = 2112;
      id v46 = v23;
      __int16 v47 = 2112;
      long long v48 = v25;
      __int16 v49 = 2112;
      id v50 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Group Session update %ld received for service %@ account %@ from (fromID=%@) with context: %@", buf, 0x34u);

      id v13 = v23;
      id v12 = v22;
      id v18 = v21;
      self = v20;
      id v17 = v38;
    }
    unsigned int v26 = [(CSDConversationManager *)self shouldCreatePendingChatForMessageType:a5 fromHandle:v18];
    id v27 = sub_100008DCC();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 134217984;
        int64_t v42 = a5;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Recieved pending message of type %ld", buf, 0xCu);
      }

      id v29 = [v15 originalGUID];

      id v30 = sub_100008DCC();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v29)
      {
        if (v31)
        {
          CFStringRef v32 = [v15 originalGUID];
          *(_DWORD *)buf = 138412290;
          int64_t v42 = (int64_t)v32;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Added %@ to the incomingPendingMessageGUIDs", buf, 0xCu);
        }
        id v30 = [(CSDConversationManager *)self incomingPendingMessageGUIDs];
        long long v33 = [v15 originalGUID];
        [v30 addObject:v33];
      }
      else if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[WARN] No originalGUID in the context", buf, 2u);
      }

      CFStringRef v34 = [CSDGroupIDSPendingChat alloc];
      CFStringRef v35 = +[NSUUID UUID];
      id v27 = [(CSDGroupIDSPendingChat *)v34 initWithUUID:v35 handle:v18];

      int v36 = +[NSNotificationCenter defaultCenter];
      CFStringRef v39 = @"CSDIDSPendingChatKey";
      id v40 = v27;
      CFStringRef v37 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      [v36 postNotificationName:@"CSDGroupIDSPendingMessageDidReceiveInviteNotification" object:0 userInfo:v37];
    }
    else if (v28)
    {
      *(_DWORD *)buf = 134217984;
      int64_t v42 = a5;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Not handling pending message of type: %ld", buf, 0xCu);
    }
  }
  else
  {
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingData:fromID:context: Empty from ID. Dropping message.", buf, 2u);
    }
  }
}

- (BOOL)shouldCreatePendingChatForMessageType:(int64_t)a3 fromHandle:(id)a4
{
  if (a3 == 8) {
    return !-[CSDConversationManager isValidLocalHandle:](self, "isValidLocalHandle:", a4, v4, v5);
  }
  else {
    return 0;
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a6;
  id v20 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v20);

  id v21 = [(CSDConversationManager *)self messageProxy];
  unsigned int v22 = [v21 shouldIgnoreIDSResource:v16 metadata:v19 fromID:v17 context:v18];

  id v23 = sub_100008DCC();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      LOWORD(v33) = 0;
      long long v25 = "Ignoring IDS resource; already received via conduit IDS proxy.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v33, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (v24)
  {
    unsigned int v26 = [v18 outgoingResponseIdentifier];
    id v27 = [v14 serviceIdentifier];
    BOOL v28 = IDSLoggableDescriptionForHandleOnService();
    int v33 = 138412546;
    CFStringRef v34 = v26;
    __int16 v35 = 2112;
    int v36 = v28;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received resource URL with identifier %@ from %@", (uint8_t *)&v33, 0x16u);
  }
  if ([v17 length])
  {
    id v23 = +[NSData dataWithContentsOfURL:v16];
    if (![v23 length])
    {
      id v30 = sub_100008DCC();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingResourceAtURL:fromID:context: Empty data. Dropping message.", (uint8_t *)&v33, 2u);
      }
      goto LABEL_21;
    }
    id v29 = [[CSDMessagingConversationMessage alloc] initWithData:v23];
    id v30 = v29;
    if (v29)
    {
      if ([(CSDMessagingConversationMessage *)v29 type] == 27)
      {
        [(CSDConversationManager *)self _service:v14 account:v15 incomingData:v23 fromID:v17 context:v18 attemptCount:0];
LABEL_21:

        goto LABEL_22;
      }
      BOOL v31 = sub_100008DCC();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v32 = +[NSNumber numberWithInt:[v30 type]];
        int v33 = 138412290;
        CFStringRef v34 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingResourceAtURL:fromID:context: Got unsupported messaged type %@. Dropping message.", (uint8_t *)&v33, 0xCu);
      }
    }
    else
    {
      BOOL v31 = sub_100008DCC();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingResourceAtURL:fromID:context: Empty CSDMessagingConversationMessage. Dropping message.", (uint8_t *)&v33, 2u);
      }
    }

    goto LABEL_21;
  }
  id v23 = sub_100008DCC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v33) = 0;
    long long v25 = "[WARN] service:account:incomingResourceAtURL:fromID:context: Empty from ID. Dropping message.";
    goto LABEL_13;
  }
LABEL_22:
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(CSDConversationManager *)self messageProxy];
  unsigned int v18 = [v17 shouldIgnoreIDSMessage:v14 fromID:v15 context:v16];

  id v19 = sub_1001B1A30();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      id v21 = [v16 storageGuid];
      int v25 = 141558274;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2112;
      BOOL v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "service:account:incomingData:fromID:context: already proxied IDS message with ID %{mask.hash}@, ignoring.", (uint8_t *)&v25, 0x16u);
    }
  }
  else
  {
    if (v20)
    {
      unsigned int v22 = [v12 serviceIdentifier];
      id v23 = IDSLoggableDescriptionForHandleOnService();
      BOOL v24 = [v16 storageGuid];
      int v25 = 141558786;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2112;
      BOOL v28 = v23;
      __int16 v29 = 2160;
      uint64_t v30 = 1752392040;
      __int16 v31 = 2112;
      CFStringRef v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "service:account:incomingData:fromID:context: receiving IDS message from %{mask.hash}@ with ID %{mask.hash}@", (uint8_t *)&v25, 0x2Au);
    }
    [(CSDConversationManager *)self _service:v12 account:v13 incomingData:v14 fromID:v15 context:v16 attemptCount:0];
  }
}

- (void)processProxiedMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = sub_1001B1A30();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1003AC814();
  }

  [(CSDConversationManager *)self _service:0 account:0 incomingData:v10 fromID:v8 context:v9 attemptCount:0];
}

- (void)processProxiedResource:(id)a3 metadata:(id)a4 fromID:(id)a5 context:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = sub_1001B1A30();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1003AC8B4();
  }

  [(CSDConversationManager *)self service:0 account:0 incomingResourceAtURL:v11 fromID:v9 context:v10];
}

- (void)processProxiedGroupUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1001B1A30();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1003AC954();
  }

  [(CSDConversationManager *)self processGroupSessionParticipantUpdate:v4 context:0];
}

- (void)enqueueMessageRetryAttemptForMessageID:(id)a3 message:(id)a4 attemptCount:(unint64_t)a5 messageProcessingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = [v11 conversationGroupUUID];
  if (!v14)
  {
    BOOL v24 = sub_100008DCC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_1003AC988();
    }
    goto LABEL_12;
  }
  id v15 = [(CSDConversationManager *)self serverBag];
  id v16 = [v15 messageRetryMaxAttempts];

  id v17 = sub_100008DCC();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v16 > a5)
  {
    if (v18)
    {
      id v19 = [(CSDConversationManager *)self serverBag];
      BOOL v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 messageRetryIntervalMillis]);
      *(_DWORD *)buf = 138412546;
      id v34 = v10;
      __int16 v35 = 2112;
      int v36 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Will retry message (%@) again after %@ ms", buf, 0x16u);
    }
    id v21 = [(CSDConversationManager *)self serverBag];
    dispatch_time_t v22 = dispatch_time(0, 1000000 * (void)[v21 messageRetryIntervalMillis]);
    id v23 = [(CSDConversationManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10012E070;
    block[3] = &unk_100505EC8;
    BOOL v28 = v10;
    unint64_t v32 = a5;
    id v29 = v14;
    id v30 = v11;
    id v31 = v12;
    dispatch_after(v22, v23, block);

    BOOL v24 = v28;
    goto LABEL_12;
  }
  if (v18)
  {
    int v25 = +[NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)buf = 138412546;
    id v34 = v10;
    __int16 v35 = 2112;
    int v36 = v25;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Exhausted retry attempts for message (%@). Dropping message after %@ attempts", buf, 0x16u);
  }
  uint64_t v26 = +[CSDReportingController sharedInstance];
  [v26 messageRetryFailedForConversationGroupUUID:v14];

  if ([v11 type] == 4)
  {
    BOOL v24 = +[CSDReportingController sharedInstance];
    [v24 avcBlobRequestMessageRetryFailedForConversationGroupUUID:v14];
LABEL_12:
  }
}

- (void)_service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7 attemptCount:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v96 = self;
  BOOL v18 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v18);

  id v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v20 = [v17 outgoingResponseIdentifier];
    [v13 serviceIdentifier];
    v22 = id v21 = v13;
    IDSLoggableDescriptionForHandleOnService();
    id v23 = v17;
    id v24 = v15;
    uint64_t v26 = v25 = v14;
    __int16 v27 = +[NSNumber numberWithUnsignedInteger:a8];
    *(_DWORD *)buf = 138412802;
    long long v110 = v20;
    __int16 v111 = 2112;
    *(void *)id v112 = v26;
    *(_WORD *)&v112[8] = 2112;
    id v113 = v27;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received message with identifier %@ from %@ Attempt count %@", buf, 0x20u);

    id v13 = v21;
    id v14 = v25;
    id v15 = v24;
    id v17 = v23;
  }

  if ([v16 length])
  {
    if ([v15 length])
    {
      BOOL v28 = [[CSDMessagingConversationMessage alloc] initWithData:v15];
      id v29 = sub_100008DCC();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      if (!v28)
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingData:fromID:context: Empty CSDMessagingConversationMessage. Dropping message.", buf, 2u);
        }
        goto LABEL_111;
      }
      if (v30)
      {
        id v31 = v13;
        id v32 = (id)[(CSDMessagingConversationMessage *)v28 type];
        if v32 < 0x25 && ((0x1FFFE9FF7FuLL >> (char)v32))
        {
          int v33 = *(&off_100508020 + (int)v32);
        }
        else
        {
          int v33 = +[NSString stringWithFormat:@"(unknown: %i)", v32];
        }
        *(_DWORD *)buf = 138412290;
        long long v110 = v33;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Received CSDMessagingConversationMessage with Type of %@", buf, 0xCu);

        id v13 = v31;
      }

      __int16 v35 = (void *)IDSCopyAddressDestinationForDestination();
      id v29 = IDSCopyRawAddressForDestination();

      if (![v29 length])
      {
        int v36 = sub_100008DCC();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingData:fromID:context: Empty destinationID after IDSCopyRawAddressForDestination. Dropping message.", buf, 2u);
        }
        goto LABEL_110;
      }
      int v36 = +[TUHandle normalizedHandleWithDestinationID:v29];
      if (!v36)
      {
        id v40 = v13;
        id v41 = sub_100008DCC();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingData:fromID:context: Could not create TUHandle from destinationID. Dropping message.", buf, 2u);
        }

        id v13 = v40;
        goto LABEL_110;
      }
      v94 = v14;
      v95 = v13;
      if ([v17 fromServerStorage])
      {
        CFStringRef v37 = +[NSDate dateWithTimeIntervalSinceNow:-1800.0];
        __int16 v38 = [v17 serverReceivedTime];
        BOOL v39 = [v37 compare:v38] == (id)1;
      }
      else
      {
        BOOL v39 = 0;
      }
      int64_t v42 = [v17 publicIntentAction];
      id v43 = [v42 integerValue];

      if ([(CSDConversationManager *)v96 _linksEnabled])
      {
        switch([(CSDMessagingConversationMessage *)v28 type])
        {
          case 0xA:
          case 0x10:
            id v44 = sub_100008DCC();
            if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_34;
            }
            *(_WORD *)buf = 0;
            __int16 v45 = "[WARN] Dropping let me in request or response because it was not encrypted";
            goto LABEL_33;
          case 0xB:
          case 0x1A:
            [(CSDConversationManager *)v96 handleReceivedLinkCreatedOrChangedMessage:v28 fromHandle:v36];
            goto LABEL_60;
          case 0xD:
            [(CSDConversationManager *)v96 handleEncryptedMessageWithin:v28 fromHandle:v36 context:v17];
            goto LABEL_60;
          case 0xE:
          case 0xF:
            id v98 = v17;
            if (!v39 || [(CSDMessagingConversationMessage *)v28 type] != 14) {
              goto LABEL_52;
            }
            id v53 = [(CSDMessagingConversationMessage *)v28 conversationGroupUUID];
            long long v54 = [(CSDConversationManager *)v96 conversationWithGroupUUID:v53];

            if (v54)
            {

LABEL_52:
              id v55 = sub_100008DCC();
              BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
              if (v43 == (id)20001)
              {
                id v14 = v94;
                id v13 = v95;
                if (v56)
                {
                  long long v57 = [v98 publicIntentAction];
                  *(_DWORD *)buf = 138412546;
                  long long v110 = v57;
                  __int16 v111 = 2048;
                  *(void *)id v112 = 20001;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[WARN] Received LetMeInDelegation with Intent of {publicIntentAction: %@, messageIntent: %llu}", buf, 0x16u);
                }
                [(CSDConversationManager *)v96 handleReceivedLMIDelegateMessage:v28 fromHandle:v36];
              }
              else
              {
                id v14 = v94;
                id v13 = v95;
                if (v56)
                {
                  long long v58 = [v98 publicIntentAction];
                  *(_DWORD *)buf = 138412290;
                  long long v110 = v58;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping let me in delegation request or response because it has the wrong intent {publicIntentAction: %@}", buf, 0xCu);
                }
              }
              id v17 = v98;
            }
            else
            {
              id v44 = sub_100008DCC();
              id v17 = v98;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                __int16 v45 = "[WARN] Dropping let me in delegation request because it is from server storage, older than 30m, an"
                      "d not for an ongoing conversation.";
LABEL_33:
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v45, buf, 2u);
              }
LABEL_34:

LABEL_60:
              id v14 = v94;
              id v13 = v95;
            }
            break;
          case 0x18:
            [(CSDConversationManager *)v96 handleReceivedLinkInvalidatedMessage:v28 fromHandle:v36];
            goto LABEL_60;
          default:
            goto LABEL_35;
        }
        goto LABEL_110;
      }
LABEL_35:
      if (![(CSDMessagingConversationMessage *)v28 hasConversationGroupUUIDString])
      {
        long long v52 = sub_100008DCC();
        id v14 = v94;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingData:fromID:context: Empty CSDMessagingConversationMessage. Dropping message.", buf, 2u);
        }

        id v13 = v95;
        goto LABEL_110;
      }
      uint64_t v46 = [(CSDMessagingConversationMessage *)v28 conversationGroupUUID];
      id v14 = v94;
      unsigned int v93 = (void *)v46;
      if (!v46)
      {
        __int16 v47 = sub_100008DCC();
        id v13 = v95;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[WARN] service:account:incomingData:fromID:context: Could not create group UUID from string. Dropping message.", buf, 2u);
        }
        goto LABEL_109;
      }
      __int16 v47 = [(CSDConversationManager *)v96 conversationWithGroupUUID:v46];
      id v13 = v95;
      if (![(CSDConversationManager *)v96 shouldIgnoreMessageForConversation:v47])
      {
        id v92 = v47;
        if (!v47)
        {
          long long v59 = sub_100008DCC();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v60 = +[NSNumber numberWithUnsignedInteger:a8];
            *(_DWORD *)buf = 138412546;
            long long v110 = v93;
            __int16 v111 = 2112;
            *(void *)id v112 = v60;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "[WARN] No conversation found for groupUUID %@, attempt: %@", buf, 0x16u);
          }
          id v61 = [v17 originalGUID];
          id v104 = v95;
          id v105 = v94;
          id v106 = v15;
          id v107 = v16;
          id v108 = v17;
          -[CSDConversationManager enqueueMessageRetryAttemptForMessageID:message:attemptCount:messageProcessingBlock:](v96, "enqueueMessageRetryAttemptForMessageID:message:attemptCount:messageProcessingBlock:", v61, v28);

          id v13 = v95;
          __int16 v47 = 0;
          goto LABEL_109;
        }
        if ([v47 isFromStorage]
          && ([v17 fromServerStorage] & 1) == 0)
        {
          __int16 v62 = sub_100008DCC();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            id v63 = [v47 UUID];
            *(_DWORD *)buf = 138412290;
            long long v110 = v63;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Updating \"fromStorage\" on conversation with UUID: %@ since there are still active remote participants.", buf, 0xCu);

            __int16 v47 = v92;
          }

          [v47 setFromStorage:0];
        }
        else
        {
          long long v48 = sub_100008DCC();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v49 = [v47 UUID];
            unsigned int v50 = [v92 isFromStorage];
            unsigned int v51 = [v17 fromServerStorage];
            *(_DWORD *)buf = 138412802;
            long long v110 = v49;
            __int16 v111 = 1024;
            *(_DWORD *)id v112 = v50;
            id v14 = v94;
            *(_WORD *)&v112[4] = 1024;
            *(_DWORD *)&v112[6] = v51;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Not updating \"fromStorage\" on conversation with UUID: %@ since conversation.isFromStorage: %d, and context.fromServerStorage: %d", buf, 0x18u);

            __int16 v47 = v92;
          }
        }
        CFStringRef v64 = [(CSDConversationManager *)v96 featureFlags];
        if (![v64 conversationHandoffEnabled])
        {

          goto LABEL_76;
        }
        unsigned int v65 = [(CSDMessagingConversationMessage *)v28 type];

        BOOL v66 = v65 == 32;
        __int16 v47 = v92;
        if (!v66)
        {
LABEL_76:
          __int16 v67 = sub_100008DCC();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            long long v110 = v36;
            __int16 v111 = 2112;
            *(void *)id v112 = v47;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Looking for handle: %@ in existingConversation: %@", buf, 0x16u);
          }

          [v47 remoteMembers];
          v69 = id v68 = v47;
          id v70 = [v69 mutableCopy];

          id v71 = [v68 localMember];
          [v70 addObject:v71];

          id v72 = [v68 lightweightMembers];
          id v73 = [v72 copy];

          id v87 = v70;
          uint64_t v74 = [(CSDConversationManager *)v96 memberExistsForParticipantDestination:v16 members:v70];
          id v90 = v73;
          uint64_t v75 = [(CSDConversationManager *)v96 memberExistsForParticipantDestination:v16 members:v73];
          id v91 = (void *)v74;
          uint64_t v89 = (void *)v75;
          if (v74 && v75)
          {
            sub_100008DCC();
            v88 = id v13 = v95;
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
              sub_1003AC9BC();
            }
LABEL_82:
            __int16 v47 = v92;
LABEL_107:
            long long v85 = v87;
LABEL_108:

            goto LABEL_109;
          }
          long long v76 = (void *)v74;
          if (v75) {
            long long v76 = (void *)v75;
          }
          id v77 = v76;
          __int16 v47 = v92;
          long long v88 = v77;
          if ([(CSDConversationManager *)v96 verifyLightweightMessageTypeFromHandle:v36 message:v28 existingConversation:v92])
          {
            if (!v77)
            {
              id v83 = sub_100008DCC();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v110 = v36;
                _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find matching handle: %@  in existingConversation.", buf, 0xCu);
              }

              __int16 v84 = [v17 originalGUID];
              id v99 = v95;
              id v100 = v14;
              id v101 = v15;
              id v102 = v16;
              id v103 = v17;
              -[CSDConversationManager enqueueMessageRetryAttemptForMessageID:message:attemptCount:messageProcessingBlock:](v96, "enqueueMessageRetryAttemptForMessageID:message:attemptCount:messageProcessingBlock:", v84, v28);

              id v13 = v95;
              goto LABEL_82;
            }
            id v13 = v95;
            if (a8)
            {
              long long v78 = +[CSDReportingController sharedInstance];
              [v78 messageRetrySucceededForConversationGroupUUID:v93];

              if ([(CSDMessagingConversationMessage *)v28 type] == 4)
              {
                long long v79 = +[CSDReportingController sharedInstance];
                [v79 avcBlobRequestMessageRetrySucceededForConversationGroupUUID:v93];
              }
            }
            __int16 v47 = v92;
            if ([(CSDConversationManager *)v96 shouldAcceptMessageFromHandle:v36 messageContext:v17 message:v28 existingConversation:v92])
            {
              id v14 = v94;
              if (![v92 isFromStorage]
                || ![v17 fromServerStorage]
                || [(CSDMessagingConversationMessage *)v28 type] != 1)
              {
                long long v86 = [v77 handle];
                [(CSDConversationManager *)v96 notifyDelegatesOfMessage:v28 fromHandle:v86 forConversation:v92 withUpdate:0];

                __int16 v47 = v92;
                long long v85 = v87;
                switch([(CSDMessagingConversationMessage *)v28 type])
                {
                  case 4:
                    [(CSDConversationManager *)v96 handleConversation:v92 receivedBlobRecoveryRequest:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 5:
                    [(CSDConversationManager *)v96 handleConversation:v92 receivedBlobRecoveryResponse:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 6:
                    [(CSDConversationManager *)v96 notifyDelegatesOfMessage:v28 fromHandle:v36 forConversation:v92 withUpdate:0];
                    goto LABEL_108;
                  case 7:
                  case 9:
                  case 0xA:
                  case 0xB:
                  case 0xC:
                  case 0xD:
                  case 0xE:
                  case 0xF:
                  case 0x10:
                  case 0x11:
                  case 0x12:
                  case 0x13:
                  case 0x14:
                  case 0x16:
                  case 0x18:
                  case 0x19:
                  case 0x1A:
                  case 0x20:
                    goto LABEL_108;
                  case 8:
                    [(CSDConversationManager *)v96 handleConversation:v92 receivedActivitySession:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 0x15:
                    [(CSDConversationManager *)v96 handleConversation:v92 removeActivitySession:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 0x17:
                    [(CSDConversationManager *)v96 handleConversation:v92 updateActivity:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 0x1B:
                    [(CSDConversationManager *)v96 handleConversation:v92 updateActivityImage:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 0x1C:
                    [(CSDConversationManager *)v96 handleConversation:v92 updateGuestMode:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 0x1D:
                    [(CSDConversationManager *)v96 handleConversation:v92 receivedEndorsementForMember:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 0x1E:
                    [(CSDConversationManager *)v96 handleConversation:v92 addHighlight:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 0x1F:
                    [(CSDConversationManager *)v96 handleConversation:v92 removeHighlight:v28 fromHandle:v36];
                    goto LABEL_108;
                  case 0x21:
                    [(CSDConversationManager *)v96 handleConversation:v92 participantUpdateMessage:v28 fromNormalizedHandle:v36];
                    goto LABEL_108;
                  case 0x22:
                    [(CSDConversationManager *)v96 handleConversation:v92 registerMessagesGroupUUIDMessage:v28 fromNormalizedHandle:v36];
                    goto LABEL_108;
                  case 0x23:
                    [(CSDConversationManager *)v96 handleConversation:v92 screenShareRequest:v28 fromHandle:v36];
                    goto LABEL_128;
                  case 0x24:
LABEL_128:
                    [(CSDConversationManager *)v96 handleConversation:v92 screenShareResponse:v28 fromHandle:v36];
                    break;
                  default:
                    goto LABEL_82;
                }
                goto LABEL_108;
              }
              long long v80 = sub_100008DCC();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                long long v81 = [v92 UUID];
                *(_DWORD *)buf = 138412802;
                long long v110 = v28;
                __int16 v111 = 2112;
                *(void *)id v112 = v17;
                *(_WORD *)&v112[8] = 2112;
                id v113 = v81;
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "[WARN] Received Invitation conversation message from server storage for conversation where that was also retrieved from server storage. Not notifying delegates of this Invitation message. {message: %@, context: %@, conversationUUID: %@}", buf, 0x20u);
              }
              id v14 = v94;
              id v13 = v95;
              goto LABEL_82;
            }
            long long v82 = sub_100008DCC();
            id v14 = v94;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
              sub_1003AC9F0();
            }
          }
          else
          {
            long long v82 = sub_100008DCC();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
              sub_1003ACA24();
            }
          }

          id v13 = v95;
          goto LABEL_107;
        }
        [(CSDConversationManager *)v96 handleReceivedUpdateJoinedMetadataMessage:v28 fromHandle:v36];
        id v13 = v95;
      }
LABEL_109:

LABEL_110:
LABEL_111:

      goto LABEL_112;
    }
    sub_100008DCC();
    BOOL v28 = (CSDMessagingConversationMessage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v34 = "[WARN] service:account:incomingData:fromID:context: Empty data. Dropping message.";
      goto LABEL_14;
    }
  }
  else
  {
    sub_100008DCC();
    BOOL v28 = (CSDMessagingConversationMessage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v34 = "[WARN] service:account:incomingData:fromID:context: Empty from ID. Dropping message.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
    }
  }
LABEL_112:
}

- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5 context:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001B1A30();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1003ACAB8();
  }

  id v12 = [(CSDConversationManager *)self messageProxy];
  [v12 proxyGroupUpdate:v9 forConversationManager:self];

  [(CSDConversationManager *)self sanitizeAndProcessParticipantUpdate:v9 context:v8];
}

- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantDataUpdate:(id)a5
{
  id v6 = a5;
  id v7 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001B1A30();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1003ACAB8();
  }

  id v9 = [(CSDConversationManager *)self messageProxy];
  [v9 proxyGroupUpdate:v6 forConversationManager:self];

  [(CSDConversationManager *)self sanitizeAndProcessParticipantUpdate:v6 context:0];
}

- (void)sanitizeAndProcessParticipantUpdate:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManager *)self participantUpdateSanitizer];

  if (v8)
  {
    id v9 = [(CSDConversationManager *)self participantUpdateSanitizer];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10012F5F0;
    v11[3] = &unk_100508000;
    v11[4] = self;
    id v12 = v6;
    [v9 sanitize:v7 completion:v11];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1003ACAEC();
    }

    [(CSDConversationManager *)self processGroupSessionParticipantUpdate:v7 context:v6];
  }
}

- (void)processGroupSessionParticipantUpdate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    id v11 = sub_100008DCC();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    __int16 v38 = "[WARN] processGroupSessionParticipantUpdate: Empty groupSessionParticipantUpdate";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
    goto LABEL_51;
  }
  id v9 = [v6 participantDestinationID];

  if (!v9)
  {
    id v11 = sub_100008DCC();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    __int16 v38 = "[WARN] processGroupSessionParticipantUpdate: Empty groupSessionParticipantUpdate.participantDestinationID";
    goto LABEL_20;
  }
  id v10 = [v6 groupUUID];
  id v11 = [(CSDConversationManager *)self conversationWithGroupUUID:v10];

  if (![(CSDConversationManager *)self shouldIgnoreMessageForConversation:v11])
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 participantIDs];
      id v14 = TULoggableStringForObject();
      id v15 = [v6 members];
      *(_DWORD *)buf = 138412802;
      long long v54 = v6;
      __int16 v55 = 2112;
      id v56 = v14;
      __int16 v57 = 2112;
      long long v58 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Group session participant update received: %@, participantIDs: %@, members: %@", buf, 0x20u);
    }
    id v16 = sub_1001B1A30();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v6 participantDestinationID];
      BOOL v18 = (void *)IDSCopyAddressDestinationForDestination();
      id v19 = TULoggableStringForHandle();
      id v20 = [v6 participantUpdateType];
      [v6 participantIDs];
      id v21 = v51 = v7;
      dispatch_time_t v22 = [v21 allKeys];
      *(_DWORD *)buf = 138412802;
      long long v54 = v19;
      __int16 v55 = 2048;
      id v56 = v20;
      __int16 v57 = 2112;
      long long v58 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Participant update from %@, type: %lu, participants: %@", buf, 0x20u);

      id v7 = v51;
    }

    id v23 = [v6 participantUpdateType];
    id v24 = [v6 participantDestinationID];
    id v25 = [(CSDConversationManager *)self memberExistsForParticipantDestination:v24 groupSessionParticipantUpdate:v6];
    uint64_t v26 = [v25 handle];

    if (!v26)
    {
      BOOL v39 = sub_100008DCC();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v40 = "[WARN] Unable to find fromHandle.";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 2u);
      }
LABEL_32:

      goto LABEL_50;
    }
    __int16 v27 = [(CSDConversationManager *)self deviceSupport];
    unsigned int v28 = [v27 isGreenTea];

    if (!v28)
    {
LABEL_28:
      switch((unint64_t)v23)
      {
        case 0uLL:
          BOOL v39 = sub_100008DCC();
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_32;
          }
          *(_WORD *)buf = 0;
          id v40 = "[WARN] Received unknown participant update message";
          goto LABEL_31;
        case 1uLL:
          if (v7)
          {
            id v41 = [v7 senderCorrelationIdentifier];
          }
          else
          {
            id v41 = 0;
          }
          id v44 = objc_msgSend(v7, "originalGUID", v50);
          if (v44
            && ([(CSDConversationManager *)self incomingPendingMessageGUIDs],
                __int16 v45 = objc_claimAutoreleasedReturnValue(),
                unsigned int v46 = [v45 containsObject:v44],
                v45,
                v46))
          {
            __int16 v47 = [(CSDConversationManager *)self incomingPendingMessageGUIDs];
            [v47 removeObject:v44];

            long long v48 = sub_100008DCC();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v54 = v44;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "fromPendingMessage, originalGUID: %@", buf, 0xCu);
            }

            uint64_t v49 = 1;
          }
          else
          {
            uint64_t v49 = 0;
          }
          [(CSDConversationManager *)self processJoinUpdate:v6 fromHandle:v26 senderCorrelationIdentifier:v41 isFromPendingMessage:v49];

          goto LABEL_49;
        case 2uLL:
          id v42 = [v6 participantIdentifier];
          id v41 = [v6 groupUUID];
          [(CSDConversationManager *)self handleParticipantWithIdentifier:v42 leftConversationWithGroupUUID:v41 fromHandle:v26 withGroupSessionUpdate:v6];
LABEL_49:

          break;
        case 3uLL:
          [(CSDConversationManager *)self processUpdateMembersUpdate:v6 fromHandle:v26];
          break;
        case 4uLL:
          [(CSDConversationManager *)self processParticipantDataUpdate:v6 fromHandle:v26];
          break;
        default:
          break;
      }
LABEL_50:

      goto LABEL_51;
    }
    id v52 = v7;
    id v29 = [CSDMessagingConversationParticipantDidJoinContext alloc];
    BOOL v30 = [v6 clientContextData];
    id v31 = [(CSDMessagingConversationParticipantDidJoinContext *)v29 initWithData:v30];

    id v32 = +[CSDConversationProviderManager sharedInstance];
    int v33 = [(CSDMessagingConversationParticipantDidJoinContext *)v31 providerIdentifier];
    unsigned int v50 = [v32 tuConversationProviderForIdentifier:v33];

    id v34 = [(CSDMessagingConversationParticipantDidJoinContext *)v31 tuConversationMembers];
    __int16 v35 = (char *)[v34 count];
    int v36 = [(CSDMessagingConversationParticipantDidJoinContext *)v31 message];
    if (&v35[(void)[v36 addedMembersCount]] > (char *)2) {
      goto LABEL_11;
    }
    if (![(CSDMessagingConversationParticipantDidJoinContext *)v31 hasVideo]
      || [(CSDMessagingConversationParticipantDidJoinContext *)v31 video])
    {

      goto LABEL_26;
    }
    if (v50)
    {
      unsigned int v43 = [v50 isDefaultProvider];

      if (!v43) {
        goto LABEL_27;
      }
    }
    else
    {
LABEL_11:
    }
    if (!v11)
    {
LABEL_27:

      id v7 = v52;
      goto LABEL_28;
    }
    CFStringRef v37 = sub_100008DCC();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v54 = v11;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Leaving conversation that is not supported on GreenTea devices: %@", buf, 0xCu);
    }

    id v34 = +[CSDConversationLeaveContext greenTeaLeaveContext];
    [v11 leaveUsingContext:v34];
LABEL_26:

    goto LABEL_27;
  }
LABEL_51:
}

- (void)processJoinUpdate:(id)a3 fromHandle:(id)a4 senderCorrelationIdentifier:(id)a5 isFromPendingMessage:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = [CSDMessagingConversationParticipantDidJoinContext alloc];
  id v15 = [v10 clientContextData];
  id v16 = [(CSDMessagingConversationParticipantDidJoinContext *)v14 initWithData:v15];

  id v17 = [(CSDMessagingConversationParticipantDidJoinContext *)v16 data];
  id v18 = [v17 length];

  id v19 = sub_100008DCC();
  id v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received participant join context", buf, 2u);
    }

    +[CSDSignposts trace:5];
    id v21 = [CSDConversationParticipant alloc];
    id v22 = [v10 participantIdentifier];
    id v23 = [v10 participantData];
    id v20 = [(CSDConversationParticipant *)v21 initWithIdentifier:v22 handle:v11 avcData:v23 senderCorrelationIdentifier:v12];

    id v24 = objc_alloc_init((Class)TUConversationParticipantCapabilities);
    objc_msgSend(v24, "setMomentsAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isMomentsAvailable](v16, "isMomentsAvailable"));
    objc_msgSend(v24, "setScreenSharingAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isScreenSharingAvailable](v16, "isScreenSharingAvailable"));
    objc_msgSend(v24, "setGondolaCallingAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isGondolaCallingAvailable](v16, "isGondolaCallingAvailable"));
    objc_msgSend(v24, "setSupportsLeaveContext:", -[CSDMessagingConversationParticipantDidJoinContext supportsLeaveContext](v16, "supportsLeaveContext"));
    objc_msgSend(v24, "setSupportsRequestToScreenShare:", -[CSDMessagingConversationParticipantDidJoinContext supportsRequestToScreenShare](v16, "supportsRequestToScreenShare"));
    objc_msgSend(v24, "setPersonaAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isPersonaAvailable](v16, "isPersonaAvailable"));
    objc_msgSend(v24, "setGftDowngradeToOneToOneAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isGFTDowngradeToOneToOneAvailable](v16, "isGFTDowngradeToOneToOneAvailable"));
    objc_msgSend(v24, "setUPlusOneScreenShareAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isUPlusOneScreenSharingAvailable](v16, "isUPlusOneScreenSharingAvailable"));
    objc_msgSend(v24, "setUPlusOneAVLessAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isUPlusOneAVLessAvailable](v16, "isUPlusOneAVLessAvailable"));
    objc_msgSend(v24, "setUPlusNDowngradeAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isUPlusNDowngradeAvailable](v16, "isUPlusNDowngradeAvailable"));
    objc_msgSend(v24, "setSharePlayProtocolVersion:", -[CSDMessagingConversationParticipantDidJoinContext sharePlayProtocolVersion](v16, "sharePlayProtocolVersion"));
    objc_msgSend(v24, "setVisionFeatureVersion:", -[CSDMessagingConversationParticipantDidJoinContext visionFeatureVersion](v16, "visionFeatureVersion"));
    objc_msgSend(v24, "setVisionCallEstablishmentVersion:", -[CSDMessagingConversationParticipantDidJoinContext visionCallEstablishmentVersion](v16, "visionCallEstablishmentVersion"));
    objc_msgSend(v24, "setUPlusOneVisionToVisionAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isUPlusOneVisionToVisionAvailable](v16, "isUPlusOneVisionToVisionAvailable"));
    objc_msgSend(v24, "setPhotosSharePlayAvailable:", -[CSDMessagingConversationParticipantDidJoinContext isPhotosSharePlayAvailable](v16, "isPhotosSharePlayAvailable"));
    [v20 setCapabilities:v24];
    [v20 setLightweight:[(CSDMessagingConversationParticipantDidJoinContext *)v16 isLightweight]];
    id v25 = [v10 participantDestinationID];
    [v20 setActiveIDSDestination:v25];

    if ([(CSDMessagingConversationParticipantDidJoinContext *)v16 hasVideoEnabled]) {
      uint64_t v26 = [(CSDMessagingConversationParticipantDidJoinContext *)v16 videoEnabled];
    }
    else {
      uint64_t v26 = 1;
    }
    [v20 setVideoEnabled:v26];
    id v45 = v12;
    BOOL v44 = v6;
    if ([(CSDMessagingConversationParticipantDidJoinContext *)v16 hasParticipantAssociation])
    {
      __int16 v27 = [(CSDMessagingConversationParticipantDidJoinContext *)v16 participantAssociation];
      unsigned int v28 = [v27 tuConversationParticipantAssociation];
      [v20 setAssociation:v28];
    }
    else
    {
      [v20 setAssociation:0];
    }
    id v29 = +[CSDConversationProviderManager sharedInstance];
    BOOL v30 = [(CSDMessagingConversationParticipantDidJoinContext *)v16 providerIdentifier];
    id v31 = [v29 tuConversationProviderForIdentifier:v30];

    if ([v20 isVideoEnabled]) {
      uint64_t v32 = 2;
    }
    else {
      uint64_t v32 = 1;
    }
    [v20 setAudioVideoMode:v32];
    int v33 = [(CSDMessagingConversationParticipantDidJoinContext *)v16 message];
    unsigned int v34 = [v33 hasAvMode];

    if (v34)
    {
      __int16 v35 = [(CSDMessagingConversationParticipantDidJoinContext *)v16 message];
      -[NSObject setAudioVideoMode:](v20, "setAudioVideoMode:", (int)[v35 avMode]);
    }
    int v36 = [(CSDMessagingConversationParticipantDidJoinContext *)v16 message];
    -[NSObject setPresentationMode:](v20, "setPresentationMode:", [v36 resolvedPresentationMode]);

    [v20 setSpatialPersonaEnabled:[(CSDMessagingConversationParticipantDidJoinContext *)v16 isSpatialPersonaEnabled]];
    CFStringRef v37 = [(CSDConversationManager *)self featureFlags];
    unsigned int v38 = [v37 groupFacetimeAsAServiceEnabled];

    if (v38 && v31)
    {
      BOOL v39 = +[CSDConversationProviderManager sharedInstance];
      id v40 = [v39 serviceForProvider:v31];
    }
    else
    {
      id v40 = [(CSDConversationManager *)self service];
    }
    id v41 = [v40 allAliases];
    id v42 = [v11 value];
    -[NSObject setLocalAccountHandle:](v20, "setLocalAccountHandle:", [v41 containsObject:v42]);

    unsigned int v43 = +[NSSet setWithObject:v20];
    [(CSDConversationManager *)self handleParticipants:v43 joinedConversationWithUpdate:v10 joinContext:v16 fromHandle:v11 isFromPendingMessage:v44];

    id v12 = v45;
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    sub_1003ACB20();
  }
}

- (id)pushTokenForSelf
{
  if (TUSimulatedModeEnabled())
  {
    id v2 = +[NSData data];
  }
  else
  {
    BOOL v3 = +[IDSPushHandler sharedInstance];
    id v2 = [v3 pushToken];
  }

  return v2;
}

- (void)processUpdateMembersUpdate:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 clientContextData];

  if (v9)
  {
    id v10 = [CSDMessagingConversationParticipantDidJoinContext alloc];
    id v11 = [v6 clientContextData];
    id v12 = [(CSDMessagingConversationParticipantDidJoinContext *)v10 initWithData:v11];

    id v13 = [v12 data];
    id v14 = [v13 length];

    id v15 = sub_100008DCC();
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received participant join context", buf, 2u);
      }

      id v17 = [v12 message];
      id v18 = [v17 activeParticipants];
      id v16 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v18 count]);

      id v19 = [v12 message];
      id v20 = [v19 activeParticipants];
      id v21 = [v12 message];
      id v22 = [v21 activeLightweightParticipants];
      id v23 = [v20 arrayByAddingObjectsFromArray:v22];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v24 = v23;
      id v25 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v31;
        do
        {
          unsigned int v28 = 0;
          do
          {
            if (*(void *)v31 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)v28), "csdConversationParticipant", (void)v30);
            [v16 addObject:v29];

            unsigned int v28 = (char *)v28 + 1;
          }
          while (v26 != v28);
          id v26 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v26);
      }

      [(CSDConversationManager *)self handleParticipants:v16 joinedConversationWithUpdate:v6 joinContext:v12 fromHandle:v7 isFromPendingMessage:0];
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sub_1003ACB54();
    }
  }
  else
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] processUpdateMembersUpdate: Empty updateMembersUpdate.clientContextData", buf, 2u);
    }
  }
}

- (void)processParticipantDataUpdate:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 groupUUID];

  if (!v9)
  {
    id v13 = sub_100008DCC();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    id v21 = "[WARN] processParticipantDataUpdate: Empty participantDataUpdate.groupUUID";
LABEL_13:
    id v22 = v13;
    uint32_t v23 = 2;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_41;
  }
  id v10 = [v6 participantDestinationID];
  id v11 = [v10 length];

  if (!v11)
  {
    id v13 = sub_100008DCC();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    id v21 = "[WARN] processParticipantDataUpdate: Empty participantDataUpdate.participantDestinationID";
    goto LABEL_13;
  }
  if ([v6 participantIdentifier])
  {
    id v12 = [v6 groupUUID];
    id v13 = [(CSDConversationManager *)self conversationWithGroupUUID:v12];

    if (!v13)
    {
      id v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v6 groupUUID];
        id v25 = [(CSDConversationManager *)self mutableConversationsByUUID];
        id v26 = [v25 allKeys];
        *(_DWORD *)buf = 138412546;
        id v53 = v24;
        __int16 v54 = 2112;
        __int16 v55 = v26;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation with groupUUID %@. All conversation UUIDs: %@", buf, 0x16u);
      }
      goto LABEL_40;
    }
    id v14 = [v6 clientContextData];
    id v15 = [v14 length];

    id v46 = v7;
    if (v15)
    {
      id v16 = [v6 clientContextData];
      id v17 = [v6 participantData];
      id v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v53 = v16;
        __int16 v54 = 2112;
        __int16 v55 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "processParticipantDataUpdate: contextData: %@, participantData: %@", buf, 0x16u);
      }

      id v19 = [[CSDMessagingConversationParticipant alloc] initWithData:v16];
      [(CSDMessagingConversationParticipant *)v19 setAvcData:v17];
      id v20 = [(CSDMessagingConversationParticipant *)v19 csdConversationParticipant];
    }
    else
    {
      uint64_t v27 = [CSDConversationParticipant alloc];
      id v28 = [v6 participantIdentifier];
      id v29 = [v6 participantData];
      id v20 = [(CSDConversationParticipant *)v27 initWithIdentifier:v28 handle:v7 avcData:v29];
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v30 = [v13 activeRemoteParticipants];
    id v31 = [v30 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v48;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v48 != v33) {
            objc_enumerationMutation(v30);
          }
          __int16 v35 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v36 = [v35 identifier];
          if (v36 == [v6 participantIdentifier])
          {
            CFStringRef v37 = [v35 capabilities];
            [v20 setCapabilities:v37];

            -[NSObject setPresentationMode:](v20, "setPresentationMode:", [v35 presentationMode]);
          }
        }
        id v32 = [v30 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v32);
    }

    unsigned int v38 = [(CSDConversationManager *)self featureFlags];
    if ([v38 groupFacetimeAsAServiceEnabled])
    {
      BOOL v39 = [v13 provider];

      id v7 = v46;
      if (v39)
      {
        id v40 = +[CSDConversationProviderManager sharedInstance];
        id v41 = [v13 provider];
        id v42 = [v40 serviceForProvider:v41];

LABEL_34:
        [v13 updateConversationParticipantToHaveMatchingSiriDisplayName:v20];
        unsigned int v43 = [v42 allAliases];
        BOOL v44 = [v7 value];
        -[NSObject setLocalAccountHandle:](v20, "setLocalAccountHandle:", [v43 containsObject:v44]);

        if (v20)
        {
          [v13 addActiveParticipant:v20];
        }
        else
        {
          id v45 = sub_100008DCC();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[WARN] processParticipantDataUpdate: Empty participant", buf, 2u);
          }
        }
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {

      id v7 = v46;
    }
    id v42 = [(CSDConversationManager *)self service];
    goto LABEL_34;
  }
  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v53 = [v6 participantIdentifier];
    id v21 = "[WARN] processParticipantDataUpdate: Invalid participantDataUpdate.participantIdentifier %llu";
    id v22 = v13;
    uint32_t v23 = 12;
    goto LABEL_14;
  }
LABEL_41:
}

- (void)handleParticipants:(id)a3 joinedConversationWithUpdate:(id)a4 joinContext:(id)a5 fromHandle:(id)a6 isFromPendingMessage:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v16);

  id v17 = [v14 providerIdentifier];
  id v18 = +[TUConversationProvider providerForIdentifier:v17];

  id v19 = [(CSDConversationManager *)self featureFlags];
  LODWORD(v17) = [v19 groupFacetimeAsAServiceEnabled];

  if (v17)
  {
    id v20 = +[CSDConversationProviderManager sharedInstance];
    id v21 = [v14 providerIdentifier];
    uint64_t v22 = [v20 tuConversationProviderForIdentifier:v21];

    id v18 = (void *)v22;
  }
  if (v14)
  {
    uint32_t v23 = [v14 message];
    uint64_t v24 = [v13 groupUUID];
    id v25 = (void *)v24;
    if (!v24)
    {
      __int16 v54 = sub_100008DCC();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "[WARN] handleParticipants:joinedConversationWithUpdate:joinContext: Empty participantUpdate.groupUUID", buf, 2u);
      }
      goto LABEL_388;
    }
    id v327 = v12;
    v343 = self;
    v329 = (void *)v24;
    id v26 = sub_1001B1A30();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_1003ACC58();
    }

    uint64_t v328 = [v23 tuConversationLink];
    uint64_t v27 = [v14 tuConversationMembers];
    id v337 = [v27 mutableCopy];

    v333 = v14;
    id v28 = [v14 tuLightweightMembers];
    id v336 = [v28 mutableCopy];

    [v23 addedMembers];
    long long v30 = v29 = v23;
    +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v30 count]);
    id v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    long long v401 = 0u;
    long long v400 = 0u;
    long long v399 = 0u;
    long long v398 = 0u;
    v331 = v29;
    id v32 = [v29 addedMembers];
    id v33 = [v32 countByEnumeratingWithState:&v398 objects:v421 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v399;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v399 != v35) {
            objc_enumerationMutation(v32);
          }
          CFStringRef v37 = [*(id *)(*((void *)&v398 + 1) + 8 * i) tuConversationMember];
          [(__CFString *)v31 addObject:v37];
        }
        id v34 = [v32 countByEnumeratingWithState:&v398 objects:v421 count:16];
      }
      while (v34);
    }

    if ([(__CFString *)v31 count]) {
      [v337 unionSet:v31];
    }
    v338 = v18;
    v332 = v13;
    unsigned int v38 = sub_100008DCC();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = [(__CFString *)v31 count];
      id v40 = [v337 count];
      CFStringRef v41 = @"NO";
      *(_DWORD *)buf = 134218754;
      *(void *)v410 = v39;
      *(_WORD *)&v410[8] = 2048;
      if (v7) {
        CFStringRef v41 = @"YES";
      }
      *(void *)v411 = v40;
      *(_WORD *)&v411[8] = 2112;
      CFStringRef v412 = v31;
      __int16 v413 = 2112;
      *(void *)v414 = v41;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "addedMembers count: %lu, members count: %lu, addedMembers: %@, isFromPendingMessage: %@", buf, 0x2Au);
    }

    id v42 = [v331 lightweightMembers];
    unsigned int v43 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v42 count]);

    long long v397 = 0u;
    long long v396 = 0u;
    long long v395 = 0u;
    long long v394 = 0u;
    BOOL v44 = [v331 lightweightMembers];
    id v45 = [v44 countByEnumeratingWithState:&v394 objects:v420 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v395;
      do
      {
        for (j = 0; j != v46; j = (char *)j + 1)
        {
          if (*(void *)v395 != v47) {
            objc_enumerationMutation(v44);
          }
          long long v49 = [*(id *)(*((void *)&v394 + 1) + 8 * (void)j) tuConversationMember];
          long long v50 = [v49 lightweightPrimary];
          id v51 = v50;
          if (v50 && [v50 isEquivalentToHandle:v15]) {
            [v49 setValidationSource:1];
          }
          [v43 addObject:v49];
        }
        id v46 = [v44 countByEnumeratingWithState:&v394 objects:v420 count:16];
      }
      while (v46);
    }

    [v336 unionSet:v43];
    id v14 = v333;
    id v351 = v15;
    if ([v333 hasMessagesGroupUUIDString])
    {
      id v52 = objc_alloc((Class)NSUUID);
      id v53 = [v333 messagesGroupUUIDString];
      id v326 = [v52 initWithUUIDString:v53];
    }
    else
    {
      id v326 = 0;
    }
    id v13 = v332;
    v325 = [v333 messagesGroupName];
    __int16 v55 = +[NSMutableSet set];
    id v56 = [(CSDConversationManager *)v343 serverBag];
    if ([v56 isParticipantIDToURIIncludedInPush])
    {
    }
    else
    {
      __int16 v57 = [(CSDConversationManager *)v343 featureFlags];
      unsigned __int8 v58 = [v57 participantIDToURIRemovedEnabled];

      if (v58) {
        goto LABEL_48;
      }
    }
    long long v393 = 0u;
    long long v391 = 0u;
    long long v392 = 0u;
    long long v390 = 0u;
    long long v59 = [v332 participantIDs];
    uint64_t v60 = [v59 allValues];

    id v61 = [v60 countByEnumeratingWithState:&v390 objects:v419 count:16];
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v391;
      do
      {
        for (k = 0; k != v62; k = (char *)k + 1)
        {
          if (*(void *)v391 != v63) {
            objc_enumerationMutation(v60);
          }
          [v55 addObjectsFromArray:*(void *)(*((void *)&v390 + 1) + 8 * (void)k)];
        }
        id v62 = [v60 countByEnumeratingWithState:&v390 objects:v419 count:16];
      }
      while (v62);
    }

    id v14 = v333;
LABEL_48:
    if (![v337 count])
    {
      v342 = sub_100008DCC();
      id v25 = v329;
      if (os_log_type_enabled(v342, OS_LOG_TYPE_ERROR)) {
        sub_1003ACB88();
      }
      uint32_t v23 = v331;
      goto LABEL_387;
    }
    BOOL v334 = v7;
    unsigned int v65 = [(CSDConversationManager *)v343 activeLocalHandlesForProvider];
    uint64_t v66 = ((void (**)(void, void *))v65)[2](v65, v338);

    v342 = v66;
    v330 = [(CSDConversationManager *)v343 localMemberForProvider:v338 fromHandle:v351 members:v337 lightweightMembers:v336 activeLocalHandles:v66];
    long long v386 = 0u;
    long long v387 = 0u;
    long long v388 = 0u;
    long long v389 = 0u;
    __int16 v67 = v31;
    id v68 = [(__CFString *)v67 countByEnumeratingWithState:&v386 objects:v418 count:16];
    v345 = v67;
    if (v68)
    {
      id v69 = v68;
      uint64_t v70 = *(void *)v387;
      while (2)
      {
        for (m = 0; m != v69; m = (char *)m + 1)
        {
          if (*(void *)v387 != v70) {
            objc_enumerationMutation(v67);
          }
          id v72 = [*(id *)(*((void *)&v386 + 1) + 8 * (void)m) handle];
          unsigned __int8 v73 = [v342 containsObject:v72];

          if (v73)
          {
            uint64_t v74 = v67;
            int v81 = 1;
            goto LABEL_72;
          }
        }
        id v69 = [(__CFString *)v67 countByEnumeratingWithState:&v386 objects:v418 count:16];
        id v14 = v333;
        if (v69) {
          continue;
        }
        break;
      }
    }

    long long v384 = 0u;
    long long v385 = 0u;
    long long v382 = 0u;
    long long v383 = 0u;
    uint64_t v74 = v43;
    id v75 = [(__CFString *)v74 countByEnumeratingWithState:&v382 objects:v417 count:16];
    if (v75)
    {
      id v76 = v75;
      uint64_t v77 = *(void *)v383;
      while (2)
      {
        for (n = 0; n != v76; n = (char *)n + 1)
        {
          if (*(void *)v383 != v77) {
            objc_enumerationMutation(v74);
          }
          long long v79 = [*(id *)(*((void *)&v382 + 1) + 8 * (void)n) handle];
          unsigned __int8 v80 = [(CSDConversationManager *)v343 isValidLocalHandle:v79 activeLocalHandles:v342 provider:v338];

          if (v80)
          {
            int v81 = 1;
            goto LABEL_71;
          }
        }
        id v76 = [(__CFString *)v74 countByEnumeratingWithState:&v382 objects:v417 count:16];
        if (v76) {
          continue;
        }
        break;
      }
      int v81 = 0;
LABEL_71:
      id v13 = v332;
LABEL_72:
      id v14 = v333;
    }
    else
    {
      int v81 = 0;
    }

    long long v82 = sub_1001B1A30();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      *(void *)v410 = v337;
      *(_WORD *)&v410[8] = 2112;
      *(void *)v411 = v336;
      *(_WORD *)&v411[8] = 2112;
      CFStringRef v412 = v345;
      __int16 v413 = 2112;
      *(void *)v414 = v43;
      *(_WORD *)&v414[8] = 2112;
      *(void *)&v414[10] = v342;
      __int16 v415 = 2112;
      v416 = v330;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "members: %@\nlightweightMembers: %@\naddedMembers: %@\naddedLightweightMembers: %@\nactiveLocalHandles: %@\nreceivedLocalMember: %@", buf, 0x3Eu);
    }

    LODWORD(v339) = [(CSDConversationManager *)v343 isValidLocalHandle:v351 activeLocalHandles:v342 provider:v338];
    id v83 = sub_100008DCC();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v410 = v330;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Received local member: %@", buf, 0xCu);
    }

    __int16 v84 = [v14 otherInvitedHandles];
    v352 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v84 count]);

    long long v380 = 0u;
    long long v381 = 0u;
    long long v378 = 0u;
    long long v379 = 0u;
    long long v85 = [v14 otherInvitedTUHandles];
    id v86 = [v85 countByEnumeratingWithState:&v378 objects:v408 count:16];
    if (v86)
    {
      id v87 = v86;
      uint64_t v88 = *(void *)v379;
      do
      {
        for (ii = 0; ii != v87; ii = (char *)ii + 1)
        {
          if (*(void *)v379 != v88) {
            objc_enumerationMutation(v85);
          }
          [v352 addObject:*(void *)(*((void *)&v378 + 1) + 8 * (void)ii)];
        }
        id v87 = [v85 countByEnumeratingWithState:&v378 objects:v408 count:16];
      }
      while (v87);
    }

    id v90 = [v337 mutableCopy];
    id v91 = v90;
    if (v330) {
      objc_msgSend(v90, "removeObject:");
    }
    v324 = v91;
    id v92 = [v91 count];
    id v25 = v329;
    unsigned int v93 = v343;
    if (v92 > +[TUConversationManager maximumNumberOfInvitedMembers])
    {
      v94 = sub_100008DCC();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        v95 = v324;
        id v96 = v94;
        id v97 = [v324 count];
        CFStringRef v98 = (const __CFString *)+[TUConversationManager maximumNumberOfInvitedMembers];
        *(_DWORD *)buf = 138412802;
        *(void *)v410 = v329;
        *(_WORD *)&v410[8] = 2048;
        *(void *)v411 = v97;
        v94 = v96;
        *(_WORD *)&v411[8] = 2048;
        CFStringRef v412 = v98;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping conversation with groupUUID %@ since it has %tu remote members which is greater than the maximum allowed of %tu.", buf, 0x20u);
        uint32_t v23 = v331;
      }
      else
      {
        uint32_t v23 = v331;
        v95 = v324;
      }
      goto LABEL_386;
    }
    unsigned int v320 = v81;
    if ([v14 hasVideo]) {
      uint64_t v99 = (uint64_t)[v14 video];
    }
    else {
      uint64_t v99 = 1;
    }
    uint32_t v23 = v331;
    id v100 = [(CSDConversationManager *)v343 conversationWithGroupUUID:v329 orMemberIdentifiers:v55 orRemoteMembers:v324 andLink:v328 andVideo:v99];
    id v101 = [v14 collaborationIdentifier];

    if (v101)
    {
      id v102 = [v14 collaborationIdentifier];
      [v100 addHighlightIdentifier:v102];
    }
    v94 = v100;
    if (v100 && ([v100 containsMemberWithHandle:v351] & 1) == 0)
    {
      char v115 = sub_100008DCC();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v410 = v351;
        *(_WORD *)&v410[8] = 2112;
        *(void *)v411 = v94;
        _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "[WARN] We received a message from %@, which was in the remote members list given in the message, but not in the existing conversation UUID: %@. Dropping message.", buf, 0x16u);
      }
      v95 = v324;
      goto LABEL_385;
    }
    v349 = v100;
    id v103 = sub_100008DCC();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v410 = v100;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "find existing conversation: %@", buf, 0xCu);
    }

    v94 = v100;
    if (!v100)
    {
      int obj = 1;
      id v13 = v332;
      goto LABEL_160;
    }
    id v104 = [v100 remoteMembers];
    if ([v104 count] == (id)1)
    {
      id v105 = [v100 activeRemoteParticipants];
      id v106 = [v105 count];

      v94 = v100;
      if (v106 && !v328)
      {
        long long v376 = 0u;
        long long v377 = 0u;
        long long v374 = 0u;
        long long v375 = 0u;
        id v107 = v336;
        id v108 = [v107 countByEnumeratingWithState:&v374 objects:v407 count:16];
        if (v108)
        {
          id v109 = v108;
          char v110 = 0;
          uint64_t v111 = *(void *)v375;
          do
          {
            for (jj = 0; jj != v109; jj = (char *)jj + 1)
            {
              if (*(void *)v375 != v111) {
                objc_enumerationMutation(v107);
              }
              id v113 = [*(id *)(*((void *)&v374 + 1) + 8 * (void)jj) handle];
              unsigned __int8 v114 = [v113 isEqualToHandle:v351];

              v110 |= v114;
            }
            id v109 = [v107 countByEnumeratingWithState:&v374 objects:v407 count:16];
          }
          while (v109);
        }
        else
        {
          char v110 = 0;
        }

        long long v372 = 0u;
        long long v373 = 0u;
        long long v370 = 0u;
        long long v371 = 0u;
        v94 = v349;
        id obja = [v349 activeRemoteParticipants];
        id v116 = [obja countByEnumeratingWithState:&v370 objects:v406 count:16];
        if (v116)
        {
          id v117 = v116;
          uint64_t v118 = *(void *)v371;
          while (2)
          {
            for (kk = 0; kk != v117; kk = (char *)kk + 1)
            {
              if (*(void *)v371 != v118) {
                objc_enumerationMutation(obja);
              }
              long long v120 = [*(id *)(*((void *)&v370 + 1) + 8 * (void)kk) activeIDSDestination];
              long long v121 = [v332 participantDestinationID];
              unsigned __int8 v122 = [v120 isEqualToString:v121];

              if (v122)
              {
                id v14 = v333;
                uint32_t v23 = v331;
                v94 = v349;
                id v104 = obja;
                goto LABEL_131;
              }
              v94 = v349;
            }
            id v117 = [obja countByEnumeratingWithState:&v370 objects:v406 count:16];
            if (v117) {
              continue;
            }
            break;
          }
        }

        id v14 = v333;
        uint32_t v23 = v331;
        if ((v110 & 1) == 0)
        {
          if ([v332 isInitiator])
          {
            long long v123 = sub_100008DCC();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v410 = v351;
              _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "[WARN] We received a message from %@, which was in the remote members list but from a different device; "
                "treating as new conversation",
                buf,
                0xCu);
            }

            v94 = 0;
            int obj = 1;
            id v13 = v332;
            goto LABEL_155;
          }
        }
      }
    }
    else
    {
LABEL_131:
    }
    long long v124 = [v94 groupUUID];
    long long v125 = [v124 UUIDString];
    id v25 = v329;
    id v126 = [v329 UUIDString];
    unsigned __int8 v127 = [v125 isEqualToString:v126];

    if ((v127 & 1) == 0)
    {
      long long v146 = +[CSDReportingController sharedInstance];
      long long v147 = [v349 tuConversation];
      [v146 transitionAttemptForConversation:v147];

      long long v148 = sub_100008DCC();
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v410 = v351;
        *(_WORD *)&v410[8] = 2112;
        *(void *)v411 = v349;
        _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "We received a message from %@, and we found same converastion: %@ with remote members with a different groupUUID; treating as new conversation",
          buf,
          0x16u);
      }

      v94 = 0;
      int obj = 1;
      id v13 = v332;
      goto LABEL_159;
    }
    long long v368 = 0u;
    long long v369 = 0u;
    long long v366 = 0u;
    long long v367 = 0u;
    id v128 = v324;
    id v129 = [v128 countByEnumeratingWithState:&v366 objects:v405 count:16];
    if (v129)
    {
      id v130 = v129;
      uint64_t v131 = *(void *)v367;
      do
      {
        for (mm = 0; mm != v130; mm = (char *)mm + 1)
        {
          if (*(void *)v367 != v131) {
            objc_enumerationMutation(v128);
          }
          unint64_t v133 = *(void **)(*((void *)&v366 + 1) + 8 * (void)mm);
          __int16 v134 = [v133 associationVoucher];

          if (v134) {
            [v349 updateRemoteMember:v133];
          }
        }
        id v130 = [v128 countByEnumeratingWithState:&v366 objects:v405 count:16];
      }
      while (v130);
    }

    long long v364 = 0u;
    long long v365 = 0u;
    long long v362 = 0u;
    long long v363 = 0u;
    id v135 = v336;
    id v136 = [v135 countByEnumeratingWithState:&v362 objects:v404 count:16];
    if (v136)
    {
      id v137 = v136;
      uint64_t v138 = *(void *)v363;
      do
      {
        for (nn = 0; nn != v137; nn = (char *)nn + 1)
        {
          if (*(void *)v363 != v138) {
            objc_enumerationMutation(v135);
          }
          id v140 = *(void **)(*((void *)&v362 + 1) + 8 * (void)nn);
          id v141 = [v140 associationVoucher];

          if (v141) {
            [v349 updateLightweightMember:v140];
          }
        }
        id v137 = [v135 countByEnumeratingWithState:&v362 objects:v404 count:16];
      }
      while (v137);
    }

    if (!v330)
    {
      int obj = 0;
      uint32_t v23 = v331;
      id v13 = v332;
      id v25 = v329;
      unsigned int v93 = v343;
      v94 = v349;
LABEL_160:
      if (![(CSDConversationManager *)v93 shouldAcceptMembershipUpdateFromHandle:v351 joinContext:v14 participantUpdate:v13 existingConversation:v94])
      {
        char v115 = sub_100008DCC();
        v95 = v324;
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
          sub_1003ACBF0();
        }
        goto LABEL_385;
      }
      if ([v14 hasVideo]) {
        unsigned int v149 = [v14 video];
      }
      else {
        unsigned int v149 = 1;
      }
      if (v149) {
        uint64_t v150 = 2;
      }
      else {
        uint64_t v150 = 1;
      }
      v350 = v94;
      if ([v23 hasAvMode]) {
        uint64_t v315 = (int)[v23 avMode];
      }
      else {
        uint64_t v315 = v150;
      }
      long long v151 = +[IDSCurrentServerTime sharedInstance];
      char v115 = [v151 currentServerTimeDate];

      long long v152 = +[NSDate dateWithTimeInterval:v115 sinceDate:-30.0];
      long long v153 = [v13 serverDate];
      id v317 = [v152 compare:v153];

      if (!obj)
      {
        __int16 v163 = [v350 groupUUID];
        unsigned int v164 = [v163 isEqual:v25];

        if (v164)
        {
          __int16 v165 = v350;
          id v13 = v332;
          if ([(__CFString *)v345 count]) {
            [v165 addRemoteMembers:v345 otherInvitedHandles:v352 triggeredLocally:0];
          }
          id v166 = v343;
          if ([v43 count]) {
            [v165 addRemoteMembers:v43 otherInvitedHandles:v352 triggeredLocally:0];
          }
        }
        else
        {
          __int16 v167 = sub_100008DCC();
          id v13 = v332;
          if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v410 = v25;
            _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_DEFAULT, "Ignoring message for group UUID %@", buf, 0xCu);
          }

          __int16 v165 = 0;
          id v166 = v343;
        }
LABEL_262:
        v211 = [v165 provider];
        v348 = v165;
        v319 = v115;
        if (v211)
        {
          v212 = [v165 provider];
          __int16 v165 = +[TUConversationProvider unknownProvider];
          if (([(__CFString *)v212 isEqual:v165] & 1) == 0)
          {

            goto LABEL_272;
          }
          v339 = v212;
        }
        v213 = [v14 providerIdentifier];
        id v214 = [v213 length];

        if (v211)
        {
        }
        id v13 = v332;
        if (!v214)
        {
LABEL_273:
          if (!v348)
          {
            id v25 = v329;
            v95 = v324;
LABEL_384:
            v94 = v350;
            char v115 = v319;
            goto LABEL_385;
          }
          v219 = sub_100008DCC();
          if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
          {
            if ([v348 isFromStorage]) {
              CFStringRef v220 = @"YES";
            }
            else {
              CFStringRef v220 = @"NO";
            }
            if ([v13 fromServer]) {
              CFStringRef v221 = @"YES";
            }
            else {
              CFStringRef v221 = @"NO";
            }
            *(_DWORD *)buf = 138412546;
            *(void *)v410 = v220;
            *(_WORD *)&v410[8] = 2112;
            *(void *)v411 = v221;
            _os_log_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_DEFAULT, "isFromStorage: %@, participantUpdate.fromServer: %@", buf, 0x16u);
          }

          if ([v348 isFromStorage]
            && ([v13 fromServer] & 1) == 0)
          {
            v222 = sub_100008DCC();
            if (os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
            {
              v223 = [v348 UUID];
              *(_DWORD *)buf = 138412290;
              *(void *)v410 = v223;
              _os_log_impl((void *)&_mh_execute_header, v222, OS_LOG_TYPE_DEFAULT, "Activating cached conversation with UUID: %@ since participants are joining.", buf, 0xCu);
            }
            [v348 setFromStorage:0];
            v224 = [v348 messagesGroupUUID];
            unsigned int v225 = [v224 isEqual:v326];

            if (v225)
            {
              v226 = sub_100008DCC();
              if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
              {
                v227 = [v348 UUID];
                *(_DWORD *)buf = 138412290;
                *(void *)v410 = v227;
                _os_log_impl((void *)&_mh_execute_header, v226, OS_LOG_TYPE_DEFAULT, "Updating remoteMembers for conversation with UUID: %@", buf, 0xCu);
              }
              v228 = [v348 remoteMembers];
              id v229 = [v228 mutableCopy];

              [v229 unionSet:v324];
              v230 = [v348 localMember];
              [v229 removeObject:v230];

              v231 = +[NSSet set];
              [v348 addRemoteMembers:v229 otherInvitedHandles:v231 triggeredLocally:0];
            }
          }
          v232 = [(CSDConversationManager *)v166 serverBag];
          if ([v232 isParticipantIDToURIIncludedInPush])
          {

            v233 = v348;
          }
          else
          {
            v234 = [(CSDConversationManager *)v166 featureFlags];
            unsigned __int8 v235 = [v234 participantIDToURIRemovedEnabled];

            v233 = v348;
            if (v235) {
              goto LABEL_295;
            }
          }
          [v233 setMemberIdentifiers:v55];
LABEL_295:
          v236 = [(CSDConversationManager *)v166 featureFlags];
          if ([v236 shouldRingForIncomingCallEnabled])
          {
            v237 = [(CSDConversationManager *)v166 serverBag];
            unsigned __int8 v238 = [v237 shouldRingForIncomingCallEnabled];

            if (v238)
            {
              v239 = v332;
              if (![v332 fromServer] || v317 != (id)1) {
                goto LABEL_304;
              }
              goto LABEL_303;
            }
          }
          else
          {
          }
          v239 = v332;
          if (![v332 fromServer]) {
            goto LABEL_304;
          }
          v240 = +[NSDate dateWithTimeIntervalSinceNow:-30.0];
          v241 = [v332 serverDate];
          id v242 = [v240 compare:v241];

          v239 = v332;
          if (v242 != (id)1) {
            goto LABEL_304;
          }
LABEL_303:
          if ([v348 state] != (id)3)
          {
            v243 = sub_100008DCC();
            if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v248 = v348;
              *(void *)v410 = v348;
              _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_DEFAULT, "Not ringing for cached conversation since message is from server storage and is older than 30 seconds. Conversation: %@", buf, 0xCu);
              uint64_t v249 = 1;
              goto LABEL_306;
            }
            uint64_t v249 = 1;
LABEL_308:
            v250 = v331;
            v248 = v348;
LABEL_309:

            [v248 setFromStorage:v249];
            v251 = [(CSDConversationManager *)v166 featureFlags];
            if ([v251 shouldRingForIncomingCallEnabled])
            {
              v252 = [(CSDConversationManager *)v166 serverBag];
              unsigned __int8 v253 = [v252 shouldRingForIncomingCallEnabled];

              v254 = v348;
              if (v253)
              {
                unsigned int v255 = [(CSDConversationManager *)v166 _shouldRingForIncomingCallWithHandle:v351 conversation:v348 isFromPendingMessage:v334 isOldMessage:v317 == (id)1 isLetMeInApproved:[v250 isLetMeInApproved]];
                goto LABEL_320;
              }
            }
            else
            {
              v254 = v248;
            }
            v256 = [v254 provider];
            if ([(CSDConversationManager *)v166 isValidLocalHandle:v351 forProvider:v256])
            {
              unsigned int v255 = 0;
            }
            else
            {
              v257 = [(CSDConversationManager *)v166 invitationResolver];
              v258 = [v254 tuConversation];
              v259 = [v254 localMember];
              v260 = [v259 handle];
              if ([v257 shouldShowInvitationRingingUIForConversation:v258 handle:v260]) {
                unsigned int v255 = [v254 isFromStorage] ^ 1;
              }
              else {
                unsigned int v255 = 0;
              }

              v250 = v331;
            }

LABEL_320:
            unsigned int v261 = [v250 isLetMeInApproved];
            if ([v332 participantUpdateType] != (id)1
              || ([v348 isLocallyCreated] & 1) != 0
              || [v348 state])
            {
              unsigned int v340 = 0;
            }
            else
            {
              unsigned int v340 = obj & ([v348 hasJoined] ^ 1);
            }
            int v262 = v255 & ~v261;
            unsigned int v263 = [(CSDConversationManager *)v166 _shouldNotifyDelegatesOfMessage:v250 localHandleAdded:v320 isFromStorage:[v348 isFromStorage]];
            v264 = sub_100008DCC();
            if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
            {
              if (v263) {
                CFStringRef v265 = @"YES";
              }
              else {
                CFStringRef v265 = @"NO";
              }
              if (v340) {
                CFStringRef v266 = @"YES";
              }
              else {
                CFStringRef v266 = @"NO";
              }
              CFStringRef objb = v266;
              if (v262) {
                CFStringRef v267 = @"YES";
              }
              else {
                CFStringRef v267 = @"NO";
              }
              CFStringRef v335 = v267;
              unsigned int v268 = [v331 type];
              unsigned int v269 = [v348 isFromStorage];
              *(_DWORD *)buf = 138413314;
              if (v269) {
                CFStringRef v270 = @"YES";
              }
              else {
                CFStringRef v270 = @"NO";
              }
              *(void *)v410 = v265;
              *(_WORD *)&v410[8] = 2112;
              *(void *)v411 = objb;
              id v166 = v343;
              *(_WORD *)&v411[8] = 2112;
              CFStringRef v412 = v335;
              __int16 v413 = 1024;
              *(_DWORD *)v414 = v268;
              *(_WORD *)&v414[4] = 2112;
              *(void *)&v414[6] = v270;
              _os_log_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_DEFAULT, "shouldNotifyDelegatesOfMessage: %@, isJoinUpdateForNewConverstion: %@, shouldNotifyDelegatesOfNewConversation: %@, message.type: %d, isFromStorage: %@", buf, 0x30u);
            }

            if (v263)
            {
              v271 = v348;
              [(CSDConversationManager *)v166 notifyDelegatesOfMessage:v331 fromHandle:v351 forConversation:v348 withUpdate:v332];
              v272 = v333;
              v273 = v327;
            }
            else
            {
              v272 = v333;
              v271 = v348;
              v273 = v327;
              if ((v340 & v262) == 1) {
                [(CSDConversationManager *)v166 notifyDelegatesOfNewConversation:v348 fromHandle:v351];
              }
            }
            v274 = [v271 remoteMembers];
            if ([v274 count] == (id)1
              && [v272 hasVideo]
              && ([v272 video] & 1) == 0
              && [v271 isVideo])
            {

              if (v315)
              {
                v275 = sub_100008DCC();
                if (os_log_type_enabled(v275, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v275, OS_LOG_TYPE_DEFAULT, "Downgrading U+1 call to audio because remote party joined as audio-only (remote members count is 1, join context had video=NO, conversation had video=YES, and not AVLess)", buf, 2u);
                }

                [v271 setVideo:0];
              }
            }
            else
            {
            }
            long long v359 = 0u;
            long long v360 = 0u;
            long long v357 = 0u;
            long long v358 = 0u;
            id v341 = v273;
            id v276 = [v341 countByEnumeratingWithState:&v357 objects:v403 count:16];
            if (v276)
            {
              id v277 = v276;
              uint64_t v278 = *(void *)v358;
              do
              {
                for (i1 = 0; i1 != v277; i1 = (char *)i1 + 1)
                {
                  if (*(void *)v358 != v278) {
                    objc_enumerationMutation(v341);
                  }
                  v280 = *(void **)(*((void *)&v357 + 1) + 8 * (void)i1);
                  id v281 = [v271 localParticipantIdentifier];
                  if (v281 != [v280 identifier])
                  {
                    [v271 updateConversationParticipantToHaveMatchingSiriDisplayName:v280];
                    [(CSDConversationManager *)v166 removePendingMemberMatchingActiveParticipant:v280 conversation:v271];
                    v282 = [v280 handle];
                    unsigned int v283 = [v271 containsMemberWithHandle:v282];

                    if (v283)
                    {
                      [v271 addActiveParticipant:v280];
                    }
                    else
                    {
                      v284 = sub_100008DCC();
                      if (os_log_type_enabled(v284, OS_LOG_TYPE_DEFAULT))
                      {
                        v285 = [v271 remoteMembers];
                        v286 = [v271 lightweightMembers];
                        *(_DWORD *)buf = 138412802;
                        *(void *)v410 = v280;
                        *(_WORD *)&v410[8] = 2112;
                        *(void *)v411 = v285;
                        *(_WORD *)&v411[8] = 2112;
                        CFStringRef v412 = v286;
                        _os_log_impl((void *)&_mh_execute_header, v284, OS_LOG_TYPE_DEFAULT, "[WARN] activeParticipant: %@ is not in the validConversation: %@, lightweight members: %@", buf, 0x20u);

                        v271 = v348;
                      }
                    }
                    id v166 = v343;
                    [(CSDConversationManager *)v343 prepareAdditionOfActiveParticipant:v280 toInvitedMembersForLinkOnConversation:v271];
                  }
                }
                id v277 = [v341 countByEnumeratingWithState:&v357 objects:v403 count:16];
              }
              while (v277);
            }

            long long v355 = 0u;
            long long v356 = 0u;
            long long v353 = 0u;
            long long v354 = 0u;
            v287 = [v331 activitySessions];
            id v288 = [v287 countByEnumeratingWithState:&v353 objects:v402 count:16];
            if (v288)
            {
              id v289 = v288;
              uint64_t v290 = *(void *)v354;
              do
              {
                for (i2 = 0; i2 != v289; i2 = (char *)i2 + 1)
                {
                  if (*(void *)v354 != v290) {
                    objc_enumerationMutation(v287);
                  }
                  id v292 = [(CSDConversationManager *)v166 createActivitySession:*(void *)(*((void *)&v353 + 1) + 8 * (void)i2) onConversation:v348 fromHandle:v351];
                }
                id v289 = [v287 countByEnumeratingWithState:&v353 objects:v402 count:16];
              }
              while (v289);
            }

            uint32_t v23 = v331;
            v293 = [v331 stagedActivitySession];

            if (v293)
            {
              v294 = [v331 stagedActivitySession];
              v295 = [v294 tuConversationActivitySession];
              unsigned __int8 v296 = [v348 setStagedActivitySessionForActivitySession:v295];

              if ((v296 & 1) == 0)
              {
                v297 = sub_100008DCC();
                if (os_log_type_enabled(v297, OS_LOG_TYPE_DEFAULT))
                {
                  v298 = [v331 stagedActivitySession];
                  v299 = [v348 UUID];
                  *(_DWORD *)buf = 138412546;
                  *(void *)v410 = v298;
                  *(_WORD *)&v410[8] = 2112;
                  *(void *)v411 = v299;
                  _os_log_impl((void *)&_mh_execute_header, v297, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't set staged activity session %@ on conversation UUID %@", buf, 0x16u);
                }
              }
            }
            v300 = [v331 highlightIdentifier];
            id v14 = v333;
            v95 = v324;
            if (!v300) {
              goto LABEL_383;
            }
            v301 = [v348 highlightIdentifiers];
            v302 = [v301 anyObject];
            if ([v300 isEqualToString:v302])
            {
              v303 = [v348 highlightIdentifiers];
              id v344 = [v303 count];

              v95 = v324;
              if (v344)
              {
LABEL_383:

                id v13 = v332;
                id v25 = v329;
                goto LABEL_384;
              }
            }
            else
            {
            }
            [v348 addHighlightIdentifier:v300];
            goto LABEL_383;
          }
LABEL_304:
          v243 = sub_100008DCC();
          if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v244 = [v239 fromServer];
            v245 = +[NSDate dateWithTimeIntervalSinceNow:-30.0];
            v246 = [v332 serverDate];
            id v247 = [v245 compare:v246];
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v410 = v244;
            *(_WORD *)&v410[4] = 1024;
            *(_DWORD *)&v410[6] = v247 == (id)1;
            *(_WORD *)v411 = 2112;
            v248 = v348;
            *(void *)&v411[2] = v348;

            uint64_t v249 = 0;
LABEL_306:
            v250 = v331;
            goto LABEL_309;
          }
          uint64_t v249 = 0;
          goto LABEL_308;
        }
        v215 = [(CSDConversationManager *)v166 conversationProviderManager];
        v216 = [v14 providerIdentifier];
        v211 = [v215 tuConversationProviderForIdentifier:v216];

        v217 = sub_100008DCC();
        if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
        {
          v218 = [v348 UUID];
          *(_DWORD *)buf = 138412546;
          *(void *)v410 = v218;
          *(_WORD *)&v410[8] = 2112;
          *(void *)v411 = v211;
          _os_log_impl((void *)&_mh_execute_header, v217, OS_LOG_TYPE_DEFAULT, "Updating provider on conversation with UUID %@ with provider %@", buf, 0x16u);
        }
        [v348 setProvider:v211];
        id v13 = v332;
LABEL_272:

        goto LABEL_273;
      }
      if (v330)
      {
        unsigned int v311 = v149;
        long long v154 = [v23 tuConversationLink];
        long long v155 = [v23 reportData];
        v314 = [v155 tuConversationReport];

        id v346 = 0;
        id v13 = v332;
        v316 = v154;
        if (![(CSDConversationManager *)v343 _linksEnabled] || !v154) {
          goto LABEL_208;
        }
        long long v156 = [v154 pseudonym];
        long long v157 = [(CSDConversationManager *)v343 pendingConversationWithPseudonym:v156];

        if (!v157)
        {
          id v346 = 0;
          id v25 = v329;
          goto LABEL_208;
        }
        if ([v157 letMeInRequestState] == (id)2)
        {
          v158 = [v157 conversationGroupUUID];
          unsigned int v159 = [v158 isEqual:v329];

          if (v159)
          {
            v160 = sub_100008DCC();
            if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
            {
              v161 = [v157 conversationGroupUUID];
              *(_DWORD *)buf = 138412290;
              *(void *)v410 = v161;
              _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "Identified let me in approval for pending conversation group UUID: %@", buf, 0xCu);
            }
            [v157 setLetMeInRequestState:3];
            id v346 = [v157 letMeInRequestState];
            uint64_t v162 = [v157 temporaryGroupUUID];

            id v13 = v332;
            id v25 = v329;
            v313 = (void *)v162;
            if (v162)
            {
LABEL_209:
              id v306 = [v23 resolvedPresentationMode];
              v176 = sub_100008DCC();
              if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v177 = @"YES";
                if (!v311) {
                  CFStringRef v177 = @"NO";
                }
                *(_DWORD *)buf = 138543362;
                *(void *)v410 = v177;
                _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEFAULT, "Determined video for new conversation should be %{public}@", buf, 0xCu);
              }

              v178 = v154;
              if ([v324 count] == (id)1)
              {
                v179 = [v13 members];
                v312 = +[NSSet setWithArray:v179];

                id v25 = v329;
              }
              else
              {
                v312 = 0;
              }
              id v166 = v343;
              if (v316)
              {
                id v180 = [(CSDConversationManager *)v343 pendingMembershipTracker];
                id v310 = [v180 retrievePendingMembersFor:v25];
              }
              else
              {
                id v180 = +[NSSet set];
                id v310 = v180;
              }

              v181 = [(CSDConversationManager *)v343 pickInitiatorFromActiveParticipants:v327 forUpdate:v13];
              v307 = v181;
              if (v181)
              {
                id v309 = [v181 handle];

                if ([v14 hasScreenSharingRequest])
                {
                  v182 = [(CSDConversationManager *)v343 featureFlags];
                  unsigned int v183 = [v182 usesModernScreenSharingFromMessages];

                  if (v183)
                  {
                    v184 = [v14 screenSharingRequest];
                    v185 = [v307 tuConversationParticipant];
                    id isHandleEligibleForScreenSharingRequestsBlock = v343->_isHandleEligibleForScreenSharingRequestsBlock;
                    id v361 = 0;
                    v308 = [v184 incomingScreenShareRequestFromParticipant:v185 handleEligibilityBlock:isHandleEligibleForScreenSharingRequestsBlock error:&v361];
                    id v187 = v361;

                    id v166 = v343;
                    goto LABEL_228;
                  }
                  v189 = sub_100008DCC();
                  if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_DEFAULT, "[WARN] Not acknowledging screen share request attached to join context because feature flag is not enabled", buf, 2u);
                  }
                }
              }
              else
              {
                v188 = [v13 participantDestinationID];
                TUHandleForIDSCanonicalAddress();
                id v309 = (id)objc_claimAutoreleasedReturnValue();

                [v14 hasScreenSharingRequest];
              }
              v308 = 0;
LABEL_228:
              if ([v324 count] == (id)1
                && !v178
                && [v13 participantUpdateType] == (id)1
                && ([v13 isInitiator] & 1) != 0)
              {
                char v190 = 0;
              }
              else
              {
                v191 = sub_100008DCC();
                if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                {
                  id v192 = [v13 participantUpdateType];
                  if ([v13 isInitiator]) {
                    CFStringRef v193 = @"YES";
                  }
                  else {
                    CFStringRef v193 = @"NO";
                  }
                  CFStringRef v194 = (const __CFString *)[v324 count];
                  *(_DWORD *)buf = 134218754;
                  *(void *)v410 = v192;
                  *(_WORD *)&v410[8] = 2112;
                  *(void *)v411 = v193;
                  *(_WORD *)&v411[8] = 2048;
                  CFStringRef v412 = v194;
                  __int16 v413 = 2112;
                  *(void *)v414 = v316;
                  _os_log_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_DEFAULT, "type: %lu, participantUpdate.isInitiator: %@, remoteMembers.count: %lu, link: %@", buf, 0x2Au);
                }

                char v190 = 1;
              }
              BYTE1(v305) = v317 == (id)1;
              LOBYTE(v305) = v190;
              LOBYTE(v304) = [v13 fromServer];
              -[CSDConversationManager createConversationWithUUID:groupUUID:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:remotePushTokens:lightweightMembers:activity:link:report:fromStorage:avMode:presentationMode:provider:screenSharingRequest:isInitiator:isOldMessage:](v166, "createConversationWithUUID:groupUUID:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:remotePushTokens:lightweightMembers:activity:link:report:fromStorage:avMode:presentationMode:provider:screenSharingRequest:isInitiator:isOldMessage:", v313, v329, v326, v339, v330, v309, v324, v310, v352, v312, v336, 0, v316, v314, v304,
                v315,
                v306,
                v338,
                v308,
              v195 = v305);
              [v195 setLetMeInRequestState:v346];
              [v195 setMessagesGroupName:v325];
              v196 = [v14 collaborationIdentifier];

              v347 = v195;
              if (v196)
              {
                v197 = [v14 collaborationIdentifier];
                v198 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v197, 0);

                v195 = v347;
                [v347 setHighlightIdentifiers:v198];
              }
              uint32_t v23 = v331;
              if ([v14 hasVideoEnabled])
              {
                -[NSObject setVideoEnabled:](v195, "setVideoEnabled:", [v14 videoEnabled]);
              }
              else if ([v13 participantUpdateType] == (id)3 {
                     && ![v195 letMeInRequestState])
              }
              {
                [v195 setVideoEnabled:[v195 avMode] == (id)2];
                v199 = sub_100008DCC();
                if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v200 = [v347 isVideoEnabled];
                  CFStringRef v201 = @"NO";
                  if (v200) {
                    CFStringRef v201 = @"YES";
                  }
                  v339 = (__CFString *)v201;
                  id v202 = [v347 avMode];
                  *(_DWORD *)buf = 138412546;
                  *(void *)v410 = v339;
                  *(_WORD *)&v410[8] = 2048;
                  *(void *)v411 = v202;
                  _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_DEFAULT, "Setting videoEnabled to %@ because the user was added to an existing call with av mode %lu", buf, 0x16u);
                }

                v195 = v347;
              }
              if ([v331 invitationPreferencesCount])
              {
                v203 = [v331 tuInvitationPreferences];
                [v195 setInvitationPreferences:v203];

                sub_100008DCC();
                v205 = v204 = v195;
                if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
                {
                  v206 = [v204 invitationPreferences];
                  *(_DWORD *)buf = 138412290;
                  *(void *)v410 = v206;
                  _os_log_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEFAULT, "Attached invitation preferences found in message: %@", buf, 0xCu);
                }
              }
              else
              {
                v205 = sub_100008DCC();
                if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEFAULT, "No invitation preferences were set on the message", buf, 2u);
                }
              }

              v207 = [v14 activitySession];
              if (v207)
              {
                v208 = [(CSDConversationManager *)v166 createActivitySession:v207 onConversation:v347 fromHandle:v351];
                if (!v208)
                {
                  v209 = sub_100008DCC();
                  if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                  {
                    [v347 UUID];
                    v210 = v318 = v115;
                    *(_DWORD *)buf = 138412546;
                    *(void *)v410 = v207;
                    *(_WORD *)&v410[8] = 2112;
                    *(void *)v411 = v210;
                    _os_log_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_DEFAULT, "[WARN] Could not create new activity session for activity session %@ and conversation UUID %@", buf, 0x16u);

                    char v115 = v318;
                  }
                }
                id v13 = v332;
              }

              __int16 v165 = v347;
              goto LABEL_262;
            }
LABEL_208:
            v313 = +[NSUUID UUID];
            goto LABEL_209;
          }
        }
        v171 = sub_100008DCC();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
        {
          v172 = [v157 conversationGroupUUID];
          if ([v172 isEqual:v329]) {
            CFStringRef v173 = @"NO";
          }
          else {
            CFStringRef v173 = @"YES";
          }
          id v174 = [v157 letMeInRequestState];
          *(_DWORD *)buf = 138412802;
          if (v174 == (id)2) {
            CFStringRef v175 = @"NO";
          }
          else {
            CFStringRef v175 = @"YES";
          }
          uint32_t v23 = v331;
          id v14 = v333;
          *(void *)v410 = v157;
          *(_WORD *)&v410[8] = 2114;
          *(void *)v411 = v173;
          *(_WORD *)&v411[8] = 2114;
          CFStringRef v412 = v175;
          _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_DEFAULT, "Pending conversation %@ found, but the groupUUID does not match (%{public}@) or the let me in request state is not Requested (%{public}@)", buf, 0x20u);
        }
        id v13 = v332;
        id v25 = v329;
        v95 = v324;
      }
      else
      {
        v168 = sub_100008DCC();
        id v13 = v332;
        if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR)) {
          sub_1003ACBBC();
        }

        v169 = [v337 setByAddingObjectsFromSet:v43];
        v170 = sub_100008DCC();
        v95 = v324;
        if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v410 = v342;
          *(_WORD *)&v410[8] = 2112;
          *(void *)v411 = v169;
          _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "activeLocalHandles: %@, remoteAndLightweightMembers: %@", buf, 0x16u);
        }

        id v25 = v329;
      }
      v94 = v350;
LABEL_385:

LABEL_386:
LABEL_387:

      id v15 = v351;
      id v18 = v338;
      id v12 = v327;
      __int16 v54 = v328;
LABEL_388:

      goto LABEL_389;
    }
    v142 = [v330 association];
    v143 = [v349 localMember];
    uint64_t v144 = [v143 association];
    unsigned __int8 v145 = [v142 isEqualToAssociation:v144];

    uint32_t v23 = v331;
    if ((v145 & 1) == 0) {
      [v349 updateLocalMember:v330];
    }
    int obj = 0;
    id v13 = v332;
    v94 = v349;
LABEL_155:
    id v25 = v329;
LABEL_159:
    unsigned int v93 = v343;
    goto LABEL_160;
  }
  uint32_t v23 = sub_100008DCC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] handleParticipants:joinedConversationWithUpdate:joinContext: Empty joinContext", buf, 2u);
  }
LABEL_389:
}

- (void)handleParticipantWithIdentifier:(unint64_t)a3 leftConversationWithGroupUUID:(id)a4 fromHandle:(id)a5 withGroupSessionUpdate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218242;
    unint64_t v25 = a3;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Participant with identifier: %llu left conversation with groupUUID: %@", (uint8_t *)&v24, 0x16u);
  }

  if (v10)
  {
    id v15 = [v12 clientContextData];

    if (v15)
    {
      id v16 = [CSDMessagingConversationParticipantDidLeaveContext alloc];
      id v17 = [v12 clientContextData];
      id v18 = [(CSDMessagingConversationParticipantDidLeaveContext *)v16 initWithData:v17];

      uint64_t v19 = (int)[v18 leaveReason];
      id v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134218242;
        unint64_t v25 = a3;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Participant with identifier %llu left with leave context %@", (uint8_t *)&v24, 0x16u);
      }
    }
    else
    {
      id v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134217984;
        unint64_t v25 = a3;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Participant with identifier %llu left without providing a leave context", (uint8_t *)&v24, 0xCu);
      }
      uint64_t v19 = 0;
    }

    uint64_t v22 = [(CSDConversationManager *)self conversationWithGroupUUID:v10];
    id v21 = v22;
    if (v22)
    {
      [v22 removeParticipantWithIdentifier:a3 fromHandle:v11 withReason:v19];
    }
    else
    {
      uint32_t v23 = sub_100008DCC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        unint64_t v25 = (unint64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for group UUID %@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  else
  {
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] handleParticipantWithIdentifier:leftConversationWithGroupUUID: empty groupUUID", (uint8_t *)&v24, 2u);
    }
  }
}

- (void)removePendingMemberMatchingActiveParticipant:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 pendingMembers];
  id v10 = [v9 count];

  if (v10)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = [v7 pendingMembers];
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (!v12)
    {
      id v14 = v11;
LABEL_16:

      goto LABEL_17;
    }
    id v13 = v12;
    unint64_t v25 = self;
    __int16 v26 = v7;
    id v14 = 0;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v18 = objc_msgSend(v17, "handle", v25, v26);
        uint64_t v19 = [v6 handle];
        unsigned int v20 = [v18 isEquivalentToHandle:v19];

        if (v20)
        {
          id v21 = v17;

          id v14 = v21;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v13);

    id v7 = v26;
    if (v14)
    {
      uint64_t v22 = sub_100008DCC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v23 = [v26 UUID];
        *(_DWORD *)buf = 138412802;
        id v32 = v6;
        __int16 v33 = 2112;
        id v34 = v14;
        __int16 v35 = 2112;
        id v36 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Active participant %@ was still listed as a pending member %@ for conversation UUID %@; did we miss an approva"
          "l delegation notice?",
          buf,
          0x20u);
      }
      int v24 = [(CSDConversationManager *)v25 pendingMembershipTracker];
      [v24 stopTrackingPendingMember:v14 forConversation:v26 triggeredLocally:0];

      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)prepareAdditionOfActiveParticipant:(id)a3 toInvitedMembersForLinkOnConversation:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  id v7 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v26 link];
  if (v8)
  {
    id v9 = [v26 link];
    if ([v9 isLocallyCreated])
    {
      id v10 = [v26 memberHandlesAwaitingInvitesToLink];
      id v11 = [v10 count];

      if (v11)
      {
        id v12 = +[NSMutableArray array];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id obj = [v26 memberHandlesAwaitingInvitesToLink];
        id v13 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v13)
        {
          uint64_t v15 = *(void *)v34;
          *(void *)&long long v14 = 138412290;
          long long v25 = v14;
          do
          {
            id v16 = 0;
            do
            {
              if (*(void *)v34 != v15) {
                objc_enumerationMutation(obj);
              }
              id v17 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v16);
              id v18 = objc_msgSend(v6, "handle", v25);
              unsigned int v19 = [v17 isEquivalentToHandle:v18];

              if (v19)
              {
                objc_initWeak(&location, self);
                uint64_t v20 = TUKickMemberTimeout();
                dispatch_time_t v21 = dispatch_time(0, 1000000000 * v20);
                uint64_t v22 = [(CSDConversationManager *)self queue];
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                void block[2] = sub_100134140;
                block[3] = &unk_100505AC8;
                objc_copyWeak(&v31, &location);
                id v29 = v26;
                long long v30 = v17;
                dispatch_after(v21, v22, block);

                uint32_t v23 = sub_100008DCC();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v25;
                  unsigned int v38 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Removing handles %@ from handles awaiting link invites as we have scheduled the block to add them if not kicked", buf, 0xCu);
                }

                [v12 addObject:v17];
                objc_destroyWeak(&v31);
                objc_destroyWeak(&location);
              }
              id v16 = (char *)v16 + 1;
            }
            while (v13 != v16);
            id v13 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
          }
          while (v13);
        }

        int v24 = [v26 memberHandlesAwaitingInvitesToLink];
        [v24 removeObjectsInArray:v12];
      }
    }
    else
    {
    }
  }
}

- (id)pickInitiatorFromActiveParticipants:(id)a3 forUpdate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  id v9 = 0;
  if (v8)
  {
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isLightweight", (void)v22) & 1) == 0
          && ([v12 isPseudonym] & 1) == 0)
        {
          if ([v6 isInitiator])
          {
            id v13 = [v12 activeIDSDestination];
            long long v14 = [v6 participantDestinationID];
            unsigned int v15 = [v13 isEqualToString:v14];

            if (v15)
            {
              id v16 = sub_100008DCC();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v27 = v12;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Using group session initiator as conversation initiator: %@", buf, 0xCu);
              }

              id v8 = v12;
              goto LABEL_18;
            }
          }
          if (!v9) {
            id v9 = v12;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  id v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      id v18 = v8;
    }
    else {
      id v18 = v9;
    }
    *(_DWORD *)buf = 138412290;
    long long v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Picked initiator for conversation: %@", buf, 0xCu);
  }

  if (v8) {
    unsigned int v19 = v8;
  }
  else {
    unsigned int v19 = v9;
  }
  id v20 = v19;

  return v20;
}

- (void)linkManager:(id)a3 updatedLinkDescriptorsFromSync:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_1001346B8;
  v8[3] = &unk_100504F10;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)linkManager:(id)a3 removedLinkDescriptorsFromIDSSignal:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100134820;
  v8[3] = &unk_100504F10;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)linkManager:(id)a3 updatedLinkDescriptorsFromIDSSignal:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100134988;
  v8[3] = &unk_100504F10;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)linkManager:(id)a3 removedLinkDescriptorsFromValidityCheck:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100134B00;
  v8[3] = &unk_100504F10;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)handleRemovedLinkDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDConversationManager *)self notifyDelegatesOfChangedLinkDescriptors:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        id v12 = objc_alloc((Class)TUConversationLink);
        id v13 = objc_msgSend(v12, "initWithDescriptor:", v11, (void)v14);
        [(CSDConversationManager *)self sendMessagesForInvalidatedLink:v13];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)pendingMembershipTracker:(id)a3 willAdd:(id)a4 to:(id)a5 using:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [v12 UUID];
    *(_DWORD *)buf = 138412546;
    id v23 = v11;
    __int16 v24 = 2112;
    long long v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Membership tracker prompted response for pending member! {member: %@, conversation UUID: %@}", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100134EEC;
  v18[3] = &unk_100505AC8;
  objc_copyWeak(&v21, (id *)buf);
  id v16 = v12;
  id v19 = v16;
  id v17 = v11;
  id v20 = v17;
  [(CSDConversationManager *)self sendLetMeInResponseToPendingMember:v17 forConversation:v16 usingResponseKeyData:v13 approved:1 callback:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)pendingMembershipTracker:(id)a3 didTrack:(id)a4 forGroupUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Membership tracker retained pending member because conversation does not yet exist {member: %@, groupUUID: %@}", (uint8_t *)&v12, 0x16u);
  }

  id v10 = [(CSDConversationManager *)self conversationLinkForGroupUUID:v8];
  if (v10)
  {
    [(CSDConversationManager *)self notifyDelegatesOfTrackedPendingMember:v7 forConversationLink:v10];
    [(CSDConversationManager *)self notifyDelegatesOfUpdatePendingConversations];
  }
  else
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No link was found; ignoring tracked pending member {member: %@, groupUUID: %@}",
        (uint8_t *)&v12,
        0x16u);
    }
  }
}

- (void)pendingMembershipTracker:(id)a3 willNotAdd:(id)a4 to:(id)a5 using:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Membership not adding pending member! {member: %@}", buf, 0xCu);
  }

  id v13 = [(CSDConversationManager *)self featureFlags];
  if (([v13 groupFacetimeAsAServiceEnabled] & 1) == 0)
  {

    goto LABEL_7;
  }
  __int16 v14 = [v10 provider];

  if (!v14)
  {
LABEL_7:
    id v17 = [(CSDConversationManager *)self service];
    goto LABEL_8;
  }
  id v15 = +[CSDConversationProviderManager sharedInstance];
  id v16 = [v10 provider];
  id v17 = [v15 serviceForProvider:v16];

LABEL_8:
  [(CSDConversationManager *)self sendLetMeInResponseToPendingMember:v9 forConversation:v10 usingResponseKeyData:v11 approved:0 callback:0];

  id v18 = [v9 handle];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10013535C;
  v20[3] = &unk_100506100;
  id v21 = v9;
  id v19 = v9;
  [v17 noteDismissedHandle:v18 completionHandle:v20];
}

- (void)sendDelegationMessageTo:(id)a3 conversation:(id)a4 link:(id)a5 transactionUUID:(id)a6 forMember:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Asked to send delegation message!", v22, 2u);
  }

  id v18 = [CSDMessagingConversationMessage alloc];
  id v19 = [v15 groupUUID];
  id v20 = [(CSDMessagingConversationMessage *)v18 initWithType:14 groupUUID:v19 link:0];

  id v21 = [v12 nickname];
  [(CSDMessagingConversationMessage *)v20 setNickname:v21];

  [(CSDConversationManager *)self _sendDelegationMessageTo:v16 conversation:v15 link:v14 transactionUUID:v13 forMember:v12 withMessage:v20];
}

- (void)sendDelegationResponseMessageTo:(id)a3 conversation:(id)a4 transactionUUID:(id)a5 forMember:(id)a6 withResponse:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    if (v7) {
      CFStringRef v17 = @"YES";
    }
    int v22 = 138412290;
    CFStringRef v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Asked to send delegation response message! {withResponse: %@}", (uint8_t *)&v22, 0xCu);
  }

  id v18 = [CSDMessagingConversationMessage alloc];
  id v19 = [v14 groupUUID];
  id v20 = [(CSDMessagingConversationMessage *)v18 initWithType:15 groupUUID:v19 link:0];

  [(CSDMessagingConversationMessage *)v20 setIsLetMeInApproved:v7];
  id v21 = [v12 nickname];
  [(CSDMessagingConversationMessage *)v20 setNickname:v21];

  [(CSDConversationManager *)self _sendDelegationMessageTo:v15 conversation:v14 link:0 transactionUUID:v13 forMember:v12 withMessage:v20];
}

- (void)_sendDelegationMessageTo:(id)a3 conversation:(id)a4 link:(id)a5 transactionUUID:(id)a6 forMember:(id)a7 withMessage:(id)a8
{
  id v14 = a3;
  unint64_t v15 = (unint64_t)a4;
  unint64_t v16 = (unint64_t)a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([(CSDConversationManager *)self _linksEnabled])
  {
    if (v15 | v16)
    {
      if (v15)
      {
        id v21 = (void *)v15;
        goto LABEL_9;
      }
    }
    else
    {
      id v20 = [0 groupUUID];
      if (v20)
      {
      }
      else
      {
        int v22 = [0 originatorHandle];

        if (!v22)
        {
          long long v28 = sub_100008DCC();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_1003ACCCC();
          }
          goto LABEL_39;
        }
      }
    }
    id v21 = (void *)v16;
LABEL_9:
    uint64_t v60 = [v21 groupUUID];
    id v23 = [v14 count];
    __int16 v24 = sub_100008DCC();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (!v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412802;
        long long v28 = v60;
        uint64_t v69 = v60;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v17;
        __int16 v72 = 2112;
        id v73 = v18;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Not sending delegation message because no handles were specified! {groupUUID: %@, transactionUUID: %@, pendingMember: %@}", buf, 0x20u);
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
LABEL_37:
      long long v28 = v60;
      goto LABEL_38;
    }
    if (v25)
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v69 = (uint64_t)v14;
      __int16 v70 = 2112;
      uint64_t v71 = v60;
      __int16 v72 = 2112;
      id v73 = v17;
      __int16 v74 = 2112;
      id v75 = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Asked to send delegation message {handles: %@, groupUUID: %@, transactionUUID: %@, pendingMember: %@}", buf, 0x2Au);
    }

    [v19 setConversationGroupUUID:v60];
    id v26 = [v18 idsDestination];
    [v19 setLetMeInDelegationHandle:v26];

    long long v27 = [v17 UUIDString];
    [v19 setLetMeInDelegationUUID:v27];

    __int16 v24 = [v19 data];
    id v55 = v17;
    if (v15)
    {
      id v59 = [(id)v15 localMember];
    }
    else
    {
      id v29 = objc_alloc((Class)TUConversationMember);
      long long v30 = [(id)v16 originatorHandle];
      id v59 = [v29 initWithHandle:v30];
    }
    id v31 = [(CSDConversationManager *)self featureFlags];
    unsigned __int8 v58 = v14;
    unint64_t v56 = v16;
    id v54 = v18;
    if ([v31 groupFacetimeAsAServiceEnabled])
    {
      id v32 = [(id)v15 provider];

      if (v32)
      {
        long long v33 = +[CSDConversationProviderManager sharedInstance];
        long long v34 = [(id)v15 provider];
        long long v35 = [v33 serviceForProvider:v34];

LABEL_22:
        long long v36 = [v59 handle];
        CFStringRef v37 = [v36 value];
        id v53 = v35;
        __int16 v57 = [v35 accountWithCallerID:v37];

        unsigned int v38 = +[NSMutableSet set];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v39 = v58;
        id v40 = (char *)[v39 countByEnumeratingWithState:&v61 objects:v67 count:16];
        if (v40)
        {
          CFStringRef v41 = v40;
          uint64_t v42 = *(void *)v62;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(void *)v62 != v42) {
                objc_enumerationMutation(v39);
              }
              BOOL v44 = TUCopyIDSCanonicalAddressForHandle();
              [v38 addObject:v44];
            }
            CFStringRef v41 = (char *)[v39 countByEnumeratingWithState:&v61 objects:v67 count:16];
          }
          while (v41);
        }

        uint64_t v65 = IDSSendMessageOptionPublicMessageIntentKey;
        uint64_t v66 = &off_100523B48;
        id v45 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        id v46 = [v45 mutableCopy];

        uint64_t v47 = [(id)v15 capabilitySendMessageOptions];
        if (v47) {
          [v46 addEntriesFromDictionary:v47];
        }
        long long v48 = [(CSDConversationManager *)self sendDataBlock];
        long long v49 = [(id)v15 provider];
        char v50 = ((uint64_t (**)(void, NSObject *, void *, void *, id, id, void, void, void *))v48)[2](v48, v24, v57, v38, v59, v46, 0, 0, v49);

        id v51 = sub_100008DCC();
        id v52 = v51;
        unint64_t v16 = v56;
        if (v50)
        {
          id v18 = v54;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Sent delegation request!!!", buf, 2u);
          }
        }
        else
        {
          id v18 = v54;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            sub_1003ACD00();
          }
        }

        id v14 = v58;
        id v17 = v55;
        goto LABEL_37;
      }
    }
    else
    {
    }
    long long v35 = [(CSDConversationManager *)self service];
    goto LABEL_22;
  }
LABEL_40:
}

- (void)screenSharingActivityManager:(id)a3 receivedUpdatedRemoteAttributes:(id)a4 isLocallySharing:(BOOL)a5
{
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100135D98;
  block[3] = &unk_1005050D0;
  BOOL v13 = a5;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)screenSharingActivityManager:(id)a3 invalidatedSessionWithReason:(id)a4 wasLocallySharing:(BOOL)a5
{
  id v7 = a4;
  id v8 = [(CSDConversationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100135F38;
  block[3] = &unk_1005050D0;
  BOOL v12 = a5;
  void block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)applicationPolicyManager:(id)a3 authorizationChangedForBundleIdentifier:(id)a4
{
  id v14 = a4;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(CSDConversationManager *)self delegateToQueue];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          BOOL v12 = [(CSDConversationManager *)self delegateToQueue];
          BOOL v13 = [v12 objectForKey:v11];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_100136338;
          block[3] = &unk_100504FE0;
          void block[4] = v11;
          void block[5] = self;
          id v16 = v14;
          dispatch_async(v13, block);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)systemStateObserver:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
  BOOL v24 = a4;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v24) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SharePlay allowed: %@", buf, 0xCu);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = [(CSDConversationManager *)self delegateToQueue];
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      BOOL v12 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [(CSDConversationManager *)self delegateToQueue];
          unint64_t v15 = [v14 objectForKey:v13];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_1001366A4;
          block[3] = &unk_1005050D0;
          void block[4] = v13;
          void block[5] = self;
          BOOL v32 = v24;
          dispatch_async(v15, block);
        }
        BOOL v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = [(CSDConversationManager *)self observerToQueue];
  id v17 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v20);
        if (objc_opt_respondsToSelector())
        {
          int v22 = [(CSDConversationManager *)self observerToQueue];
          id v23 = [v22 objectForKey:v21];

          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1001366B4;
          void v25[3] = &unk_1005050D0;
          v25[4] = v21;
          void v25[5] = self;
          BOOL v26 = v24;
          dispatch_async(v23, v25);
        }
        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v18);
  }
}

- (void)systemStateObserver:(id)a3 screenSharingAllowedStateChanged:(BOOL)a4
{
  BOOL v24 = a4;
  id v5 = [(CSDConversationManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v24) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Screen sharing allowed: %@", buf, 0xCu);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = [(CSDConversationManager *)self delegateToQueue];
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      BOOL v12 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [(CSDConversationManager *)self delegateToQueue];
          unint64_t v15 = [v14 objectForKey:v13];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          void block[2] = sub_100136A20;
          block[3] = &unk_1005050D0;
          void block[4] = v13;
          void block[5] = self;
          BOOL v32 = v24;
          dispatch_async(v15, block);
        }
        BOOL v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = [(CSDConversationManager *)self observerToQueue];
  id v17 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v20);
        if (objc_opt_respondsToSelector())
        {
          int v22 = [(CSDConversationManager *)self observerToQueue];
          id v23 = [v22 objectForKey:v21];

          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100136A30;
          void v25[3] = &unk_1005050D0;
          v25[4] = v21;
          void v25[5] = self;
          BOOL v26 = v24;
          dispatch_async(v23, v25);
        }
        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v18);
  }
}

- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  uint64_t v13 = [(CSDConversationManager *)self queue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100136B40;
  v17[3] = &unk_1005053D0;
  id v18 = v10;
  id v19 = v11;
  long long v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);
}

- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 successfully:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resource transfer did initiate successfully: %d", buf, 8u);
  }

  id v9 = [(CSDConversationManager *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10013705C;
  v11[3] = &unk_100504F10;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, v11);
}

- (CSDPendingMembershipTracker)pendingMembershipTracker
{
  return self->_pendingMembershipTracker;
}

- (void)setPendingMembershipTracker:(id)a3
{
}

- (NSMutableDictionary)mutableConversationsByUUID
{
  return self->_mutableConversationsByUUID;
}

- (NSMutableDictionary)mutablePendingConversationsByPseudonym
{
  return self->_mutablePendingConversationsByPseudonym;
}

- (NSMutableDictionary)mutablePseudonymsByCallUUID
{
  return self->_mutablePseudonymsByCallUUID;
}

- (NSMutableDictionary)mutablePseudonymsByRequestIdentifiers
{
  return self->_mutablePseudonymsByRequestIdentifiers;
}

- (NSMutableDictionary)mutableSendDataCallbacksByRequestIdentifiers
{
  return self->_mutableSendDataCallbacksByRequestIdentifiers;
}

- (NSMutableDictionary)mutableConversationsRequestingUpgradeWithPreferences
{
  return self->_mutableConversationsRequestingUpgradeWithPreferences;
}

- (OS_dispatch_source)pendingConversationCleanupTimer
{
  return self->_pendingConversationCleanupTimer;
}

- (void)setPendingConversationCleanupTimer:(id)a3
{
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void)setDelegateToQueue:(id)a3
{
}

- (NSMutableSet)incomingPendingMessageGUIDs
{
  return self->_incomingPendingMessageGUIDs;
}

- (void)setIncomingPendingMessageGUIDs:(id)a3
{
}

- (NSMapTable)observerToQueue
{
  return self->_observerToQueue;
}

- (void)setObserverToQueue:(id)a3
{
}

- (CSDScreenSharingActivityManager)screenSharingActivityManager
{
  return self->_screenSharingActivityManager;
}

- (CPSystemStateObserver)sharePlaySystemStateObserver
{
  return self->_sharePlaySystemStateObserver;
}

- (void)setSharePlaySystemStateObserver:(id)a3
{
}

- (CSDFileTransferController)fileTransferController
{
  return self->_fileTransferController;
}

- (void)setFileTransferController:(id)a3
{
}

- (NSMutableDictionary)resourceTransferCallbacks
{
  return self->_resourceTransferCallbacks;
}

- (void)setResourceTransferCallbacks:(id)a3
{
}

- (CSDConversationPersistenceController)persistenceController
{
  return self->_persistenceController;
}

- (CSDDeviceLockStateObserver)lockStateObserver
{
  return self->_lockStateObserver;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (void)setCallProviderManager:(id)a3
{
}

- (CSDConversationLinkManager)linkManager
{
  return self->_linkManager;
}

- (void)setLinkManager:(id)a3
{
}

- (CSDReportingController)reportingController
{
  return self->_reportingController;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (CSDConversationNoticeManager)conversationNoticeManger
{
  return self->_conversationNoticeManger;
}

- (CSDSharedConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (CSDConversationInvitationResolving)invitationResolver
{
  return self->_invitationResolver;
}

- (void)setInvitationResolver:(id)a3
{
}

- (NSMutableDictionary)screenCaptureQueue
{
  return self->_screenCaptureQueue;
}

- (CSDVoucherManager)voucherManager
{
  return self->_voucherManager;
}

- (void)setVoucherManager:(id)a3
{
}

- (CSDParticipantUpdateSanitizer)participantUpdateSanitizer
{
  return self->_participantUpdateSanitizer;
}

- (void)setParticipantUpdateSanitizer:(id)a3
{
}

- (_TtC13callservicesd28CSDCollaborationStateManager)collaborationStateManager
{
  return self->_collaborationStateManager;
}

- (void)setCollaborationStateManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (id)groupSessionProviderCreationBlock
{
  return self->_groupSessionProviderCreationBlock;
}

- (void)setGroupSessionProviderCreationBlock:(id)a3
{
}

- (void)setDeviceSupport:(id)a3
{
}

- (id)conversationCreationBlock
{
  return self->_conversationCreationBlock;
}

- (void)setConversationCreationBlock:(id)a3
{
}

- (id)sendDataBlock
{
  return self->_sendDataBlock;
}

- (void)setSendDataBlock:(id)a3
{
}

- (id)getPersonalNicknameBlock
{
  return self->_getPersonalNicknameBlock;
}

- (void)setGetPersonalNicknameBlock:(id)a3
{
}

- (CSDConversationProviderManager)conversationProviderManager
{
  return self->_conversationProviderManager;
}

- (void)setConversationProviderManager:(id)a3
{
}

- (id)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(id)a3
{
}

- (id)activeLocalHandles
{
  return self->_activeLocalHandles;
}

- (void)setActiveLocalHandles:(id)a3
{
}

- (id)activeLocalHandlesForProvider
{
  return self->_activeLocalHandlesForProvider;
}

- (void)setActiveLocalHandlesForProvider:(id)a3
{
}

- (id)senderIdentitiesBlock
{
  return self->_senderIdentitiesBlock;
}

- (void)setSenderIdentitiesBlock:(id)a3
{
}

- (id)localCallerID
{
  return self->_localCallerID;
}

- (void)setLocalCallerID:(id)a3
{
}

- (id)notifyPendingMembershipTrackerOfDelegatedMember
{
  return self->_notifyPendingMembershipTrackerOfDelegatedMember;
}

- (void)setNotifyPendingMembershipTrackerOfDelegatedMember:(id)a3
{
}

- (id)localCallerIDForProvider
{
  return self->_localCallerIDForProvider;
}

- (void)setLocalCallerIDForProvider:(id)a3
{
}

- (CSDSecureImageTranscoder)imageTranscoder
{
  return self->_imageTranscoder;
}

- (void)setImageTranscoder:(id)a3
{
}

- (id)isConversationRelayPreferred
{
  return self->_isConversationRelayPreferred;
}

- (void)setIsConversationRelayPreferred:(id)a3
{
}

- (id)isHandleEligibleForScreenSharingRequestsBlock
{
  return self->_isHandleEligibleForScreenSharingRequestsBlock;
}

- (void)setIsHandleEligibleForScreenSharingRequestsBlock:(id)a3
{
}

- (NSMutableDictionary)outIdentifierToConversationInfo
{
  return self->_outIdentifierToConversationInfo;
}

- (void)setOutIdentifierToConversationInfo:(id)a3
{
}

- (CPApplicationController)cpApplicationController
{
  return self->_cpApplicationController;
}

- (CPActivityAuthorizationManager)activityAuthorizationManager
{
  return self->_activityAuthorizationManager;
}

- (void)setActivityAuthorizationManager:(id)a3
{
}

- (CSDConduitIDSProxy)messageProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageProxy);

  return (CSDConduitIDSProxy *)WeakRetained;
}

- (void)setMessageProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageProxy);
  objc_storeStrong((id *)&self->_activityAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_cpApplicationController, 0);
  objc_storeStrong((id *)&self->_outIdentifierToConversationInfo, 0);
  objc_storeStrong(&self->_isHandleEligibleForScreenSharingRequestsBlock, 0);
  objc_storeStrong(&self->_isConversationRelayPreferred, 0);
  objc_storeStrong((id *)&self->_imageTranscoder, 0);
  objc_storeStrong(&self->_localCallerIDForProvider, 0);
  objc_storeStrong(&self->_notifyPendingMembershipTrackerOfDelegatedMember, 0);
  objc_storeStrong(&self->_localCallerID, 0);
  objc_storeStrong(&self->_senderIdentitiesBlock, 0);
  objc_storeStrong(&self->_activeLocalHandlesForProvider, 0);
  objc_storeStrong(&self->_activeLocalHandles, 0);
  objc_storeStrong(&self->_lockdownModeEnabled, 0);
  objc_storeStrong((id *)&self->_conversationProviderManager, 0);
  objc_storeStrong(&self->_getPersonalNicknameBlock, 0);
  objc_storeStrong(&self->_sendDataBlock, 0);
  objc_storeStrong(&self->_conversationCreationBlock, 0);
  objc_storeStrong((id *)&self->_deviceSupport, 0);
  objc_storeStrong(&self->_groupSessionProviderCreationBlock, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_collaborationStateManager, 0);
  objc_storeStrong((id *)&self->_participantUpdateSanitizer, 0);
  objc_storeStrong((id *)&self->_voucherManager, 0);
  objc_storeStrong((id *)&self->_screenCaptureQueue, 0);
  objc_storeStrong((id *)&self->_invitationResolver, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_conversationNoticeManger, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_reportingController, 0);
  objc_storeStrong((id *)&self->_linkManager, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_lockStateObserver, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_resourceTransferCallbacks, 0);
  objc_storeStrong((id *)&self->_fileTransferController, 0);
  objc_storeStrong((id *)&self->_sharePlaySystemStateObserver, 0);
  objc_storeStrong((id *)&self->_screenSharingActivityManager, 0);
  objc_storeStrong((id *)&self->_observerToQueue, 0);
  objc_storeStrong((id *)&self->_incomingPendingMessageGUIDs, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_pendingConversationCleanupTimer, 0);
  objc_storeStrong((id *)&self->_mutableConversationsRequestingUpgradeWithPreferences, 0);
  objc_storeStrong((id *)&self->_mutableSendDataCallbacksByRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutablePseudonymsByRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutablePseudonymsByCallUUID, 0);
  objc_storeStrong((id *)&self->_mutablePendingConversationsByPseudonym, 0);
  objc_storeStrong((id *)&self->_mutableConversationsByUUID, 0);

  objc_storeStrong((id *)&self->_pendingMembershipTracker, 0);
}

@end