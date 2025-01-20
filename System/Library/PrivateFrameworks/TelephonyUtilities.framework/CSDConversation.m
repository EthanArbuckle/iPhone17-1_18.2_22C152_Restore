@interface CSDConversation
- (BOOL)_endScreenCallIfNecessary;
- (BOOL)_expanseEnabled;
- (BOOL)activitySessionManager:(id)a3 activitySessionIsJoinable:(id)a4;
- (BOOL)allParticipantsSupportSharePlay;
- (BOOL)allowsScreenSharing;
- (BOOL)avcSessionInProgress;
- (BOOL)containsMemberWithHandle:(id)a3;
- (BOOL)expectedUplinkMuted;
- (BOOL)forceExpanseEnabled;
- (BOOL)hasJoined;
- (BOOL)hasReceivedLetMeInRequest;
- (BOOL)ignoreLMIRequests;
- (BOOL)isAnyOtherAccountDeviceActive;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioInjectionAllowed;
- (BOOL)isAudioPaused;
- (BOOL)isAudioReady;
- (BOOL)isCameraMixedWithScreen;
- (BOOL)isCaptioningEnable;
- (BOOL)isFromStorage;
- (BOOL)isLocallyCreated;
- (BOOL)isOneToOneHandoffOngoing;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isRedirectingAudio;
- (BOOL)isRelaying;
- (BOOL)isRepresentedByRemoteMembers:(id)a3 andLink:(id)a4;
- (BOOL)isScreenEnabled;
- (BOOL)isScreenSharingInitiationAvailable;
- (BOOL)isScreening;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isUnderlyingLinksConnected;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)isWaitingToPruneParticipants;
- (BOOL)remoteJoinedActivity:(id)a3;
- (BOOL)setConversationLink:(id)a3 allowUpdate:(BOOL)a4;
- (BOOL)setStagedActivitySessionForActivitySession:(id)a3;
- (BOOL)shouldRespondToLetMeInRequestForMember:(id)a3;
- (BOOL)supportsLeaveContext;
- (BOOL)usesAudioSession;
- (CGRect)presentationRect;
- (CGSize)localPortraitAspectRatio;
- (CPActivitySessionManager)activitySessionManager;
- (CPApplicationPolicyManager)applicationLaunchPolicyManager;
- (CPAudioRoutePolicyManager)audioRoutePolicyManager;
- (CPSystemStateObserver)sharePlaySystemStateObserver;
- (CSDAVCSession)avcSession;
- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 activity:(id)a15 link:(id)a16 report:(id)a17 fromStorage:(BOOL)a18 avMode:(unint64_t)a19 presentationMode:(unint64_t)a20 applicationController:(id)a21;
- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 remotePushTokens:(id)a15 activity:(id)a16 link:(id)a17 report:(id)a18 fromStorage:(BOOL)a19 avMode:(unint64_t)a20 presentationMode:(unint64_t)a21 applicationController:(id)a22 featureFlags:(id)a23 systemStateObserver:(id)a24 applicationPolicyManager:(id)a25 screenSharingRequest:(id)a26 testConfiguration:(id)a27;
- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 remotePushTokens:(id)a15 activity:(id)a16 link:(id)a17 report:(id)a18 fromStorage:(BOOL)a19 avMode:(unint64_t)a20 presentationMode:(unint64_t)a21 applicationController:(id)a22 featureFlags:(id)a23 systemStateObserver:(id)a24 applicationPolicyManager:(id)a25 screenSharingRequest:(id)a26 testConfiguration:(id)a27 isOldMessage:(BOOL)a28;
- (CSDConversationABTestConfiguration)ABTestConfiguration;
- (CSDConversationDelegate)delegate;
- (CSDConversationLocalParticipantBlobTracker)localParticipantBlobTracker;
- (CSDConversationParticipant)localCSDParticipant;
- (CSDConversationParticipant)splitSessionSecondary;
- (CSDConversationServerBag)serverBag;
- (CSDFaceTimeInviteDemuxer)faceTimeInviteDemuxer;
- (CSDIDSGroupSession)idsSession;
- (CXCallFailureContext)failureContext;
- (FTDeviceSupport)deviceSupport;
- (NSArray)currentParticipantPresentationContexts;
- (NSArray)supportedMediaTypes;
- (NSDate)lastRebroadcastTime;
- (NSDictionary)activeLightweightParticipantDestinationsByIdentifier;
- (NSDictionary)activeParticipantDestinationsByIdentifier;
- (NSDictionary)capabilitySendMessageOptions;
- (NSMutableArray)addedHandoffParticipants;
- (NSMutableArray)memberHandlesAwaitingInvitesToLink;
- (NSMutableArray)removedHandoffParticipants;
- (NSMutableDictionary)activeLightweightParticipantsByIdentifier;
- (NSMutableDictionary)activeRemoteParticipantsByIdentifier;
- (NSMutableDictionary)addedHandoffParticipantToTime;
- (NSMutableDictionary)audioRoutesByParticipantIdentifier;
- (NSMutableDictionary)inflightAVCBlobRecoveryBlocksByIdentifier;
- (NSMutableDictionary)pendingConversationParticipantsByIdentifier;
- (NSMutableDictionary)pendingKickedMembersByIdentifier;
- (NSMutableDictionary)removedHandoffParticipantToTime;
- (NSMutableDictionary)screenSharingRequestsByUUID;
- (NSMutableDictionary)startAddingHandoffParticipantToTime;
- (NSMutableDictionary)virtualParticipantsByPluginName;
- (NSMutableSet)highlightIdentifiers;
- (NSMutableSet)kickedParticipants;
- (NSMutableSet)pendingAllowedMembers;
- (NSMutableSet)pendingRemoteMembers;
- (NSMutableSet)recentlyLeftParticipantIdentifiers;
- (NSNumber)expectedAudioEnabled;
- (NSNumber)expectedAudioPaused;
- (NSNumber)expectedScreenEnabled;
- (NSNumber)expectedVideoEnabled;
- (NSNumber)expectedVideoPaused;
- (NSObject)reportingHierarchySubToken;
- (NSObject)reportingHierarchyToken;
- (NSSet)activeLightweightParticipants;
- (NSSet)activeRemoteParticipants;
- (NSSet)activitySessions;
- (NSSet)invitationPreferences;
- (NSSet)kickedMembers;
- (NSSet)lightweightMembers;
- (NSSet)memberHandlesEligibleForLinkApproval;
- (NSSet)memberIdentifiers;
- (NSSet)otherInvitedHandles;
- (NSSet)pendingMemberHandles;
- (NSSet)pendingMembers;
- (NSSet)rejectedMembers;
- (NSSet)remoteMemberHandles;
- (NSSet)remoteMembers;
- (NSSet)remotePushTokens;
- (NSSet)screenSharingRequests;
- (NSSet)serverProvidedLightweightParticipantIdentifiers;
- (NSSet)serverProvidedParticipantIdentifiers;
- (NSSet)tuActivitySessions;
- (NSSet)virtualParticipants;
- (NSString)description;
- (NSString)messagesGroupName;
- (NSUUID)UUID;
- (NSUUID)groupUUID;
- (NSUUID)messagesGroupUUID;
- (OS_dispatch_queue)queue;
- (TUCallScreenShareAttributes)screenShareAttributes;
- (TUConversation)tuConversation;
- (TUConversationActivitySession)stagedActivitySession;
- (TUConversationHandoffContext)handoffContext;
- (TUConversationHandoffEligibility)handoffEligibility;
- (TUConversationLink)link;
- (TUConversationMember)localLightweightSecondaryMember;
- (TUConversationMember)localMember;
- (TUConversationParticipant)localParticipant;
- (TUConversationParticipantAssociation)localParticipantAssociation;
- (TUConversationProvider)provider;
- (TUConversationReport)report;
- (TUFeatureFlags)featureFlags;
- (TUHandle)initiator;
- (TUVideoDeviceController)videoDeviceController;
- (_TtC13callservicesd36CSDActivitySessionParticipantMonitor)activitySessionParticipantMonitor;
- (double)sessionSwitchTimeout;
- (id)_allMembers;
- (id)_stableExpanseIdentifier;
- (id)activeParticipants;
- (id)activitySessionManager:(id)a3 activeRemoteParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5;
- (id)activitySessionManager:(id)a3 localParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5;
- (id)activitySessionManagerRequestedCallTypeStringForLogging:(id)a3;
- (id)avcSessionCreationBlock;
- (id)avcSessionIdentifier;
- (id)createActivitySession:(id)a3;
- (id)createStagedActivitySessionForActivity:(id)a3;
- (id)downgradeToOneToOneAfterDelayBlock;
- (id)letMeInRequestUINotificationBlock;
- (id)localCSDConversationParticipant;
- (id)localConversationParticipantWithData;
- (id)localConversationParticipantWithDataToSendToDestinationIDs:(id)a3;
- (id)localParticipantCapabilities;
- (id)localParticipantData;
- (id)localParticipantDataToSendToDestinationIDs:(id)a3;
- (id)memberWithHandle:(id)a3;
- (id)noConversationParticipantTimeoutBlock;
- (id)onlyAvailableSessionConversationParticipant:(id)a3;
- (id)participantRefreshBlock;
- (id)personaHandshakeBlobCreationBlock;
- (id)reducedInfoMembers:(id)a3;
- (id)remoteMemberForHandle:(id)a3;
- (id)remoteParticipantForHandle:(id)a3;
- (id)remoteParticipantForIdentifier:(unint64_t)a3;
- (id)session:(id)a3 conversationParticipantWithParticipantIdentifier:(unint64_t)a4;
- (id)setupNewAVCSession:(BOOL)a3;
- (id)timeoutBlock;
- (id)tuSystemActivitySessions;
- (id)videoDeviceControllerCreationBlock;
- (int)_errorToAVCProviderEndedReason:(id)a3 defaultProviderReason:(int)a4;
- (int)presentationState;
- (int64_t)activeRemoteParticipantCountMinusEligibleAVLess;
- (int64_t)avcLocalCaptionsToken;
- (int64_t)avcSessionToken;
- (int64_t)letMeInRequestState;
- (int64_t)maxVideoDecodesAllowed;
- (int64_t)state;
- (unint64_t)avMode;
- (unint64_t)kickMemberRetryCount;
- (unint64_t)localParticipantIdentifier;
- (unint64_t)presentationMode;
- (unint64_t)rebroadcastTimeThreshold;
- (unint64_t)screenSharingType;
- (unint64_t)setScreenSharingRetryCount;
- (void)_addParticipantsWaitingToBeAddedToAVCSession;
- (void)_addRemoteParticipantToAVCSessionIfPossible:(id)a3;
- (void)_allowMember:(id)a3;
- (void)_applyUpdateFromDataBlobForRemoteParticipant:(id)a3 participantIdentifier:(unint64_t)a4;
- (void)_beginTimeoutForLeavingConversationWithReason:(id)a3;
- (void)_cancelInFlightAVCBlobRecoveryIfNecessary;
- (void)_cancelTimeoutForLeavingConversation;
- (void)_cleanUpConversation;
- (void)_cleanUpFromAVCSessionFailure;
- (void)_cleanUpHandoffMetricsIfNecessary;
- (void)_emitRTCConnectionSetupEvent:(int64_t)a3 participantIdentifier:(unint64_t)a4;
- (void)_emitRTCConnectionSetupEventForAddActiveParticipant:(id)a3;
- (void)_endCallIfNecessary;
- (void)_generateHandoffReportIfNecessaryForUpdatedParticipantID:(unint64_t)a3 isAddParticipant:(BOOL)a4;
- (void)_handleStateChanged:(int64_t)a3 oldState:(int64_t)a4;
- (void)_launchApplicationDueToActivityCreation:(id)a3;
- (void)_launchApplicationForActivityIfNecessary:(id)a3;
- (void)_launchApplicationForActivityIfNecessary:(id)a3 shouldForeground:(BOOL)a4;
- (void)_launchApplicationsForActivitiesIfNecessary;
- (void)_launchApplicationsForActivitiesIfNecessary:(BOOL)a3;
- (void)_pruneRemoteParticipantsIfNecessary;
- (void)_registerPluginsIfNecessary;
- (void)_removeMemberFromPendingMemberListForParticipant:(id)a3;
- (void)_reportConversationFailedWithFailureReason:(int64_t)a3 providerEndedReason:(unint64_t)a4;
- (void)_reportConversationFailedWithProviderEndedReason:(unint64_t)a3;
- (void)_requestAVCBlobsIfNecessary;
- (void)_restartIDSSessionIfNecessary;
- (void)_showLetMeInUIIfNecessary;
- (void)_startAVCSessionIfNecessary;
- (void)_startIDSSessionWithContext:(id)a3;
- (void)_stopAVCSession;
- (void)_updateParticipantTypesForAddedParticipant:(id)a3;
- (void)activitySessionManager:(id)a3 activeRemoteParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)activitySessionManager:(id)a3 activityChangedOnSession:(id)a4;
- (void)activitySessionManager:(id)a3 activitySessionAssociatedSceneChanged:(id)a4;
- (void)activitySessionManager:(id)a3 activitySessionChanged:(id)a4;
- (void)activitySessionManager:(id)a3 activitySessionRemoved:(id)a4 userOriginated:(BOOL)a5;
- (void)activitySessionManager:(id)a3 activitySessionStateChanged:(id)a4 oldState:(unint64_t)a5;
- (void)activitySessionManager:(id)a3 fetchDataCryptorForTopic:(id)a4 completionHandler:(id)a5;
- (void)activitySessionManager:(id)a3 receivedActivitySessionEvent:(id)a4;
- (void)activitySessionManager:(id)a3 requestEncryptionKeysForParticipants:(id)a4 topicName:(id)a5;
- (void)activitySessionManager:(id)a3 requestForegroundPresentationForActivity:(id)a4;
- (void)activitySessionManager:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6;
- (void)activitySessionManager:(id)a3 sendResourceAtURL:(id)a4 toParticipants:(id)a5 metadata:(id)a6 activitySessionUUID:(id)a7 completion:(id)a8;
- (void)activitySessionManager:(id)a3 sessionUnjoined:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (void)activitySessionManager:(id)a3 shouldRegisterPlugin:(id)a4;
- (void)activitySessionManager:(id)a3 tuActivitySessionsDidChange:(id)a4;
- (void)addActiveParticipant:(id)a3;
- (void)addAliasesToConversationContainer:(id)a3 forBundleIdentifier:(id)a4;
- (void)addHighlightIdentifier:(id)a3;
- (void)addPendingMembers:(id)a3 triggeredLocally:(BOOL)a4;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 invitationPreferences:(id)a5 addingFromLetMeIn:(BOOL)a6 triggeredLocally:(BOOL)a7;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 triggeredLocally:(BOOL)a5;
- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)addScreenSharingRequest:(id)a3;
- (void)addScreenSharingType:(unint64_t)a3;
- (void)addVirtualParticipant:(id)a3;
- (void)addedRemoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioEnabled:(BOOL)a4 updatedVideoEnabled:(BOOL)a5 streamToken:(int64_t)a6 screenToken:(int64_t)a7 captionsToken:(int64_t)a8;
- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4;
- (void)broadcastLocalParticipantData;
- (void)cleanUpIDSSessionState;
- (void)continueHandoffAudioRouteForIdentifier:(unint64_t)a3 participantLeft:(BOOL)a4;
- (void)executeSessionDidStart;
- (void)fulfillLocalScreenShareRequests;
- (void)fulfillPendingScreenSharingRequestsForRemoteParticipant:(id)a3;
- (void)joinUsingContext:(id)a3;
- (void)kickMember:(id)a3;
- (void)leave;
- (void)leaveActivitySessionWithUUID:(id)a3;
- (void)leaveUsingContext:(id)a3;
- (void)leaveWithReason:(unint64_t)a3;
- (void)postSharePlayActivityDidChangeNotificationIfNecessary:(id)a3;
- (void)postUserNotificationForUnsupportedScreenSharingActivity:(id)a3 alternateReponseHandler:(id)a4;
- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3;
- (void)refreshActiveParticipantsList;
- (void)registerMessagesGroupAssociation;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 cameraMixedWithScreenDidChange:(BOOL)a4;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 didChangeAudioPriority:(int64_t)a4 videoPriority:(int64_t)a5;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 didReact:(id)a4;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioPaused:(BOOL)a4 streamToken:(int64_t)a5;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedScreenEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedVideoEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7;
- (void)removeActivitySessionIfNecessary;
- (void)removeActivitySessionWithUUID:(id)a3 usingTerminatingHandle:(id)a4;
- (void)removeHighlightIdentifier:(id)a3;
- (void)removeParticipantWithIdentifier:(unint64_t)a3 fromHandle:(id)a4 withReason:(unint64_t)a5;
- (void)removeParticipantsForMember:(id)a3;
- (void)removePendingMembers:(id)a3 triggeredLocally:(BOOL)a4;
- (void)removeRemoteMembers:(id)a3 triggeredLocally:(BOOL)a4;
- (void)removeScreenSharingRequest:(id)a3;
- (void)removeVirtualParticipant:(id)a3;
- (void)removedRemoteParticipantWithIdentifier:(unint64_t)a3 didSucceed:(BOOL)a4;
- (void)resetActivitySessionSceneAssociationsForBundleID:(id)a3;
- (void)reviveOrInvalidateCachedConversationIfNecessary;
- (void)serverDisconnectedForSession:(id)a3;
- (void)session:(id)a3 cameraMixedWithScreenDidChange:(BOOL)a4;
- (void)session:(id)a3 changedBytesOfDataUsed:(int64_t)a4;
- (void)session:(id)a3 changedLocalAudioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 changedLocalAudioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 changedLocalVideoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 changedLocalVideoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 changedScreenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 didDetectError:(id)a4;
- (void)session:(id)a3 didJoinGroup:(BOOL)a4 participantIdentifiers:(id)a5 error:(id)a6;
- (void)session:(id)a3 didLeaveGroupWithError:(id)a4;
- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6;
- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5;
- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveKickedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7;
- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveLocalParticipantType:(unsigned __int16)a4 error:(id)a5;
- (void)session:(id)a3 didReceiveReport:(id)a4;
- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4;
- (void)session:(id)a3 didReceiveUnderlyingLinksStatus:(BOOL)a4;
- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)session:(id)a3 didStopWithError:(id)a4;
- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 endedWithError:(id)a4 reason:(unsigned int)a5;
- (void)session:(id)a3 localParticipantDidReact:(id)a4;
- (void)session:(id)a3 receivedActiveLightweightParticipantDestinationsByIdentifier:(id)a4;
- (void)session:(id)a3 receivedActiveParticipantDestinationsByIdentifier:(id)a4;
- (void)session:(id)a3 requestedOneToOneModeEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 screenCaptureDidStart:(BOOL)a4 withError:(id)a5;
- (void)session:(id)a3 screenCaptureDidStop:(BOOL)a4 withError:(id)a5;
- (void)session:(id)a3 screenShareAttributesUpdated:(id)a4;
- (void)sessionDidReceiveKeyUpdate:(id)a3;
- (void)sessionDidTerminate:(id)a3;
- (void)sessionLocalParticipantDidStopReacting:(id)a3;
- (void)sessionShouldReconnect:(id)a3;
- (void)setABTestConfiguration:(id)a3;
- (void)setActiveLightweightParticipantDestinationsByIdentifier:(id)a3;
- (void)setActiveLightweightParticipantsByIdentifier:(id)a3;
- (void)setActiveParticipantDestinationsByIdentifier:(id)a3;
- (void)setActivitySessionManager:(id)a3;
- (void)setActivitySessionParticipantMonitor:(id)a3;
- (void)setAddedHandoffParticipantToTime:(id)a3;
- (void)setAddedHandoffParticipants:(id)a3;
- (void)setApplicationLaunchPolicyManager:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioInjectionAllowed:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioRoutePolicyManager:(id)a3;
- (void)setAudioRoutesByParticipantIdentifier:(id)a3;
- (void)setAvMode:(unint64_t)a3;
- (void)setAvcSession:(id)a3;
- (void)setAvcSessionCreationBlock:(id)a3;
- (void)setAvcSessionInProgress:(BOOL)a3;
- (void)setCameraMixedWithScreen:(BOOL)a3;
- (void)setConversationGridDisplayMode:(unint64_t)a3;
- (void)setCurrentParticipantPresentationContexts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceSupport:(id)a3;
- (void)setDowngradeToOneToOneAfterDelayBlock:(id)a3;
- (void)setExpectedAudioEnabled:(id)a3;
- (void)setExpectedAudioPaused:(id)a3;
- (void)setExpectedScreenEnabled:(id)a3;
- (void)setExpectedUplinkMuted:(BOOL)a3;
- (void)setExpectedVideoEnabled:(id)a3;
- (void)setExpectedVideoPaused:(id)a3;
- (void)setFailureContext:(id)a3;
- (void)setForceExpanseEnabled:(BOOL)a3;
- (void)setFromStorage:(BOOL)a3;
- (void)setHandoffContext:(id)a3;
- (void)setHandoffEligibility:(id)a3;
- (void)setHasJoined:(BOOL)a3;
- (void)setHasReceivedLetMeInRequest:(BOOL)a3;
- (void)setHighlightIdentifiers:(id)a3;
- (void)setIDSAliasingSalt:(id)a3 onContainer:(id)a4;
- (void)setIgnoreLMIRequests:(BOOL)a3;
- (void)setInvitationPreferences:(id)a3;
- (void)setKickMemberRetryCount:(unint64_t)a3;
- (void)setKickedMembers:(id)a3;
- (void)setKickedParticipants:(id)a3;
- (void)setLastRebroadcastTime:(id)a3;
- (void)setLetMeInRequestState:(int64_t)a3;
- (void)setLetMeInRequestUINotificationBlock:(id)a3;
- (void)setLightweightMembers:(id)a3;
- (void)setLink:(id)a3;
- (void)setLocalLightweightSecondaryMember:(id)a3;
- (void)setLocalParticipantAssociation:(id)a3;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 presentationMode:(unint64_t)a4;
- (void)setMemberHandlesAwaitingInvitesToLink:(id)a3;
- (void)setMemberIdentifiers:(id)a3;
- (void)setMessagesGroupName:(id)a3;
- (void)setMessagesGroupUUID:(id)a3;
- (void)setNoConversationParticipantTimeoutBlock:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setOtherInvitedHandles:(id)a3;
- (void)setParticipantAudioVideoMode:(unint64_t)a3 presentationMode:(unint64_t)a4 forParticipant:(id)a5;
- (void)setParticipantRefreshBlock:(id)a3;
- (void)setPendingAllowedMembers:(id)a3;
- (void)setPendingConversationParticipantsByIdentifier:(id)a3;
- (void)setPendingKickedMembersByIdentifier:(id)a3;
- (void)setPendingMemberHandles:(id)a3;
- (void)setPendingMembers:(id)a3;
- (void)setPendingRemoteMembers:(id)a3;
- (void)setPersonaHandshakeBlobCreationBlock:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationState:(int)a3;
- (void)setProvider:(id)a3;
- (void)setRebroadcastTimeThreshold:(unint64_t)a3;
- (void)setRecentlyLeftParticipantIdentifiers:(id)a3;
- (void)setRejectedMembers:(id)a3;
- (void)setRelaying:(BOOL)a3;
- (void)setRemoteMemberHandles:(id)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setRemoteParticipantType:(unsigned __int16)a3 participant:(id)a4;
- (void)setRemoteParticipantsDownlinkMuted:(BOOL)a3;
- (void)setRemotePushTokens:(id)a3;
- (void)setRemovedHandoffParticipantToTime:(id)a3;
- (void)setRemovedHandoffParticipants:(id)a3;
- (void)setReportingHierarchySubToken:(id)a3;
- (void)setReportingHierarchyToken:(id)a3;
- (void)setScreenEnabled:(BOOL)a3 attributes:(id)a4;
- (void)setScreenShareAttributes:(id)a3;
- (void)setScreenSharingRequestsByUUID:(id)a3;
- (void)setScreenSharingType:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setServerBag:(id)a3;
- (void)setServerProvidedLightweightParticipantIdentifiers:(id)a3;
- (void)setServerProvidedParticipantIdentifiers:(id)a3;
- (void)setSessionSwitchTimeout:(double)a3;
- (void)setSetScreenSharingRetryCount:(unint64_t)a3;
- (void)setSharePlayHandedOff:(BOOL)a3;
- (void)setSharePlaySystemStateObserver:(id)a3;
- (void)setSpatialPersonaEnabled:(BOOL)a3;
- (void)setSplitSessionSecondary:(id)a3;
- (void)setStagedActivitySession:(id)a3;
- (void)setStartAddingHandoffParticipantToTime:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportedMediaTypes:(id)a3;
- (void)setTimeoutBlock:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setUsingAirplay:(BOOL)a3 forActivitySessionUUID:(id)a4;
- (void)setVideo:(BOOL)a3;
- (void)setVideoDeviceControllerCreationBlock:(id)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setWaitingToPruneParticipants:(BOOL)a3;
- (void)startAudio;
- (void)stopContentSharingSession;
- (void)switchBackToOneToOneIfPossible;
- (void)switchBackToOneToOneIfPossibleUsingDelay:(BOOL)a3;
- (void)systemStateObserver:(id)a3 screenSharingAllowedStateChanged:(BOOL)a4;
- (void)systemStateObserver:(id)a3 screenSharingInitiationAllowedStateChanged:(BOOL)a4;
- (void)updateConversationParticipantToHaveMatchingSiriDisplayName:(id)a3;
- (void)updateLightweightMember:(id)a3;
- (void)updateLocalAspectRatios;
- (void)updateLocalMember:(id)a3;
- (void)updateLocalParticipantInfo;
- (void)updateMemberValidationSource:(id)a3 source:(int64_t)a4;
- (void)updateMessagesGroupName:(id)a3;
- (void)updateOneToOneModeForParticipantUpdateType:(unsigned __int16)a3 participant:(id)a4;
- (void)updateParticipantPresentationContexts:(id)a3;
- (void)updateParticipantsWithDestinationIdentifiers:(id)a3;
- (void)updateRemoteMember:(id)a3;
- (void)updateReportInfoForHandoffParticipant:(id)a3;
- (void)updateScreenEnabledForRemoteParticipants:(BOOL)a3;
@end

@implementation CSDConversation

- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 activity:(id)a15 link:(id)a16 report:(id)a17 fromStorage:(BOOL)a18 avMode:(unint64_t)a19 presentationMode:(unint64_t)a20 applicationController:(id)a21
{
  BOOL v41 = a8;
  id v36 = a21;
  id v34 = a17;
  id v32 = a16;
  id v31 = a15;
  id v30 = a14;
  id v46 = a13;
  id v45 = a12;
  id v44 = a11;
  id v43 = a10;
  id v28 = a9;
  id v29 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v39 = objc_alloc_init((Class)TUFeatureFlags);
  LOBYTE(v27) = a18;
  v42 = -[CSDConversation initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avMode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSharingRequest:testConfiguration:](self, "initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avMode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSharingRequest:testConfiguration:", v25, v24, v23, v22, v29, v41, v28, v43, v44, v45, v46, v30, 0, v31,
          v32,
          v34,
          v27,
          a19,
          a20,
          v36,
          v39,
          0,
          0,
          0,
          0);

  return v42;
}

- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 remotePushTokens:(id)a15 activity:(id)a16 link:(id)a17 report:(id)a18 fromStorage:(BOOL)a19 avMode:(unint64_t)a20 presentationMode:(unint64_t)a21 applicationController:(id)a22 featureFlags:(id)a23 systemStateObserver:(id)a24 applicationPolicyManager:(id)a25 screenSharingRequest:(id)a26 testConfiguration:(id)a27
{
  LOBYTE(v29) = 0;
  LOBYTE(v28) = a19;
  return -[CSDConversation initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avMode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSharingRequest:testConfiguration:isOldMessage:](self, "initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avMode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSharingRequest:testConfiguration:isOldMessage:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           v28,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           v29);
}

- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 remotePushTokens:(id)a15 activity:(id)a16 link:(id)a17 report:(id)a18 fromStorage:(BOOL)a19 avMode:(unint64_t)a20 presentationMode:(unint64_t)a21 applicationController:(id)a22 featureFlags:(id)a23 systemStateObserver:(id)a24 applicationPolicyManager:(id)a25 screenSharingRequest:(id)a26 testConfiguration:(id)a27 isOldMessage:(BOOL)a28
{
  BOOL v137 = a8;
  id v150 = a3;
  v155 = (NSUUID *)a4;
  id v135 = a5;
  id v156 = a5;
  id v134 = a6;
  id v146 = a6;
  id v138 = a7;
  id v139 = a9;
  id v145 = a10;
  id v154 = a11;
  id v149 = a12;
  id v148 = a13;
  id v151 = a14;
  id v140 = a15;
  id v157 = a16;
  id v141 = a17;
  id v142 = a18;
  id v153 = a22;
  id v152 = a23;
  id v159 = a24;
  id v147 = a25;
  id v158 = a26;
  id v143 = a27;
  v169.receiver = self;
  v169.super_class = (Class)CSDConversation;
  id v32 = [(CSDConversation *)&v169 init];
  if (v32)
  {
    v33 = sub_100008DCC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v34 = @"NO";
      *(_DWORD *)buf = 138413570;
      v172 = v155;
      if (v137) {
        CFStringRef v35 = @"YES";
      }
      else {
        CFStringRef v35 = @"NO";
      }
      if (a28) {
        CFStringRef v34 = @"YES";
      }
      __int16 v173 = 2112;
      id v174 = v156;
      __int16 v175 = 2112;
      CFStringRef v176 = v35;
      __int16 v177 = 2112;
      id v178 = v145;
      __int16 v179 = 2112;
      id v180 = v154;
      __int16 v181 = 2112;
      CFStringRef v182 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "init CSDConversation: %@, %@, %@, initiator: %@, remoteMembers: %@, isOldMessage: %@", buf, 0x3Eu);
    }

    objc_storeStrong((id *)&v32->_queue, a3);
    objc_storeStrong((id *)&v32->_featureFlags, a23);
    objc_storeStrong((id *)&v32->_UUID, a4);
    objc_storeStrong((id *)&v32->_groupUUID, v135);
    objc_storeStrong((id *)&v32->_messagesGroupUUID, a7);
    v32->_state = 0;
    v32->_letMeInRequestState = 0;
    v32->_locallyCreated = v137;
    objc_storeStrong((id *)&v32->_initiator, a10);
    objc_storeStrong((id *)&v32->_localMember, a9);
    uint64_t v36 = +[NSDictionary dictionary];
    activeParticipantDestinationsByIdentifier = v32->_activeParticipantDestinationsByIdentifier;
    v32->_activeParticipantDestinationsByIdentifier = (NSDictionary *)v36;

    uint64_t v38 = +[NSMutableDictionary dictionary];
    activeRemoteParticipantsByIdentifier = v32->_activeRemoteParticipantsByIdentifier;
    v32->_activeRemoteParticipantsByIdentifier = (NSMutableDictionary *)v38;

    v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeLightweightParticipantsByIdentifier = v32->_activeLightweightParticipantsByIdentifier;
    v32->_activeLightweightParticipantsByIdentifier = v40;

    v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    screenSharingRequestsByUUID = v32->_screenSharingRequestsByUUID;
    v32->_screenSharingRequestsByUUID = v42;

    id v44 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    recentlyLeftParticipantIdentifiers = v32->_recentlyLeftParticipantIdentifiers;
    v32->_recentlyLeftParticipantIdentifiers = v44;

    id v46 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    kickedParticipants = v32->_kickedParticipants;
    v32->_kickedParticipants = v46;

    v48 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingRemoteMembers = v32->_pendingRemoteMembers;
    v32->_pendingRemoteMembers = v48;

    v50 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    removedHandoffParticipants = v32->_removedHandoffParticipants;
    v32->_removedHandoffParticipants = v50;

    v52 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    addedHandoffParticipants = v32->_addedHandoffParticipants;
    v32->_addedHandoffParticipants = v52;

    uint64_t v54 = +[NSMutableDictionary dictionary];
    startAddingHandoffParticipantToTime = v32->_startAddingHandoffParticipantToTime;
    v32->_startAddingHandoffParticipantToTime = (NSMutableDictionary *)v54;

    uint64_t v56 = +[NSMutableDictionary dictionary];
    addedHandoffParticipantToTime = v32->_addedHandoffParticipantToTime;
    v32->_addedHandoffParticipantToTime = (NSMutableDictionary *)v56;

    uint64_t v58 = +[NSMutableDictionary dictionary];
    removedHandoffParticipantToTime = v32->_removedHandoffParticipantToTime;
    v32->_removedHandoffParticipantToTime = (NSMutableDictionary *)v58;

    currentParticipantPresentationContexts = v32->_currentParticipantPresentationContexts;
    v32->_currentParticipantPresentationContexts = (NSArray *)&__NSArray0__struct;

    v61 = objc_alloc_init(CSDSharedConversationServerBag);
    serverBag = v32->_serverBag;
    v32->_serverBag = (CSDConversationServerBag *)v61;

    v32->_fromStorage = a19;
    uint64_t v63 = +[NSDate distantPast];
    lastRebroadcastTime = v32->_lastRebroadcastTime;
    v32->_lastRebroadcastTime = (NSDate *)v63;

    v32->_rebroadcastTimeThreshold = 0;
    objc_storeStrong((id *)&v32->_report, a18);
    v32->_avMode = a20;
    v32->_presentationMode = a21;
    v32->_video = a20 == 2;
    objc_storeStrong((id *)&v32->_link, a17);
    objc_storeStrong((id *)&v32->_sharePlaySystemStateObserver, a24);
    if (v159)
    {
      [(CPSystemStateObserver *)v32->_sharePlaySystemStateObserver addObserver:v32 withQueue:v32->_queue];
    }
    else
    {
      v65 = sub_100008DCC();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
        sub_1003A6E5C();
      }
    }
    id v66 = objc_alloc((Class)CPActivitySessionManager);
    v67 = +[NSSet set];
    v68 = (CPActivitySessionManager *)[v66 initWithIdentifier:v155 groupUUID:v156 activities:v67 applicationController:v153 delegate:v32 queue:v150 systemStateObserver:v159];
    activitySessionManager = v32->_activitySessionManager;
    v32->_activitySessionManager = v68;

    if ([v152 sharePlayCanEndWhenInitiatorLeaves])
    {
      v70 = [[_TtC13callservicesd36CSDActivitySessionParticipantMonitor alloc] initWithActivitySessionManager:v32->_activitySessionManager];
      activitySessionParticipantMonitor = v32->_activitySessionParticipantMonitor;
      v32->_activitySessionParticipantMonitor = v70;
    }
    if (v157) {
      id v72 = [(CSDConversation *)v32 createStagedActivitySessionForActivity:v157];
    }
    v73 = [(CSDConversation *)v32 featureFlags];
    unsigned int v74 = [v73 usesModernScreenSharingFromMessages];
    if (v158) {
      unsigned int v75 = v74;
    }
    else {
      unsigned int v75 = 0;
    }

    if (v75)
    {
      v76 = [(CSDConversation *)v32 screenSharingRequestsByUUID];
      v77 = [v158 UUID];
      [v76 setObject:v158 forKeyedSubscript:v77];
    }
    uint64_t v78 = +[NSMutableDictionary dictionary];
    inflightAVCBlobRecoveryBlocksByIdentifier = v32->_inflightAVCBlobRecoveryBlocksByIdentifier;
    v32->_inflightAVCBlobRecoveryBlocksByIdentifier = (NSMutableDictionary *)v78;

    objc_storeStrong((id *)&v32->_ABTestConfiguration, a27);
    [(CSDConversation *)v32 setRemoteMembers:v154];
    v80 = (NSSet *)[v151 mutableCopy];
    lightweightMembers = v32->_lightweightMembers;
    v32->_lightweightMembers = v80;

    if (v149)
    {
      v82 = (NSSet *)[v149 copy];
    }
    else
    {
      v82 = +[NSSet set];
    }
    pendingMembers = v32->_pendingMembers;
    v32->_pendingMembers = v82;

    v84 = +[NSMutableSet set];
    long long v168 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v165 = 0u;
    v85 = [(CSDConversation *)v32 pendingMembers];
    id v86 = [v85 countByEnumeratingWithState:&v165 objects:v170 count:16];
    if (v86)
    {
      uint64_t v87 = *(void *)v166;
      do
      {
        for (i = 0; i != v86; i = (char *)i + 1)
        {
          if (*(void *)v166 != v87) {
            objc_enumerationMutation(v85);
          }
          v89 = [*(id *)(*((void *)&v165 + 1) + 8 * i) handle];
          [v84 addObject:v89];
        }
        id v86 = [v85 countByEnumeratingWithState:&v165 objects:v170 count:16];
      }
      while (v86);
    }

    v90 = (NSSet *)[v84 copy];
    pendingMemberHandles = v32->_pendingMemberHandles;
    v32->_pendingMemberHandles = v90;

    uint64_t v92 = +[NSSet set];
    kickedMembers = v32->_kickedMembers;
    v32->_kickedMembers = (NSSet *)v92;

    objc_storeStrong((id *)&v32->_remotePushTokens, a15);
    uint64_t v94 = +[NSMutableDictionary dictionary];
    pendingKickedMembersByIdentifier = v32->_pendingKickedMembersByIdentifier;
    v32->_pendingKickedMembersByIdentifier = (NSMutableDictionary *)v94;

    uint64_t v96 = +[NSMutableSet set];
    pendingAllowedMembers = v32->_pendingAllowedMembers;
    v32->_pendingAllowedMembers = (NSMutableSet *)v96;

    uint64_t v98 = +[NSSet set];
    rejectedMembers = v32->_rejectedMembers;
    v32->_rejectedMembers = (NSSet *)v98;

    [(CSDConversation *)v32 setOtherInvitedHandles:v148];
    uint64_t v100 = +[NSMutableSet set];
    highlightIdentifiers = v32->_highlightIdentifiers;
    v32->_highlightIdentifiers = (NSMutableSet *)v100;

    uint64_t v102 = +[NSMutableArray array];
    memberHandlesAwaitingInvitesToLink = v32->_memberHandlesAwaitingInvitesToLink;
    v32->_memberHandlesAwaitingInvitesToLink = (NSMutableArray *)v102;

    objc_storeStrong((id *)&v32->_idsSession, v134);
    [(CSDIDSGroupSession *)v32->_idsSession setDelegate:v32];
    v104 = objc_alloc_init(CSDFaceTimeInviteDemuxer);
    faceTimeInviteDemuxer = v32->_faceTimeInviteDemuxer;
    v32->_faceTimeInviteDemuxer = v104;

    v106 = +[RTCReporting newHierarchyTokenFromParentToken:0];
    reportingHierarchyToken = v32->_reportingHierarchyToken;
    v32->_reportingHierarchyToken = v106;

    objc_initWeak(&location, v32);
    v162[0] = _NSConcreteStackBlock;
    v162[1] = 3221225472;
    v162[2] = sub_10002D5F8;
    v162[3] = &unk_1005054A0;
    objc_copyWeak(&v163, &location);
    v108 = objc_retainBlock(v162);
    id avcSessionCreationBlock = v32->_avcSessionCreationBlock;
    v32->_id avcSessionCreationBlock = v108;

    v160[0] = _NSConcreteStackBlock;
    v160[1] = 3221225472;
    v160[2] = sub_10002D7B0;
    v160[3] = &unk_1005054C8;
    objc_copyWeak(&v161, &location);
    v110 = objc_retainBlock(v160);
    id videoDeviceControllerCreationBlock = v32->_videoDeviceControllerCreationBlock;
    v32->_id videoDeviceControllerCreationBlock = v110;

    if (v32->_fromStorage || a28)
    {
      v112 = sub_100008DCC();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        UUID = v32->_UUID;
        *(_DWORD *)buf = 138412290;
        v172 = UUID;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Requesting remote active participants for cached conversation with UUID: %@", buf, 0xCu);
      }

      [(CSDIDSGroupSession *)v32->_idsSession requestActiveParticipants];
    }
    uint64_t v114 = +[NSMutableDictionary dictionary];
    virtualParticipantsByPluginName = v32->_virtualParticipantsByPluginName;
    v32->_virtualParticipantsByPluginName = (NSMutableDictionary *)v114;

    uint64_t v116 = +[TUConversationProvider unknownProvider];
    provider = v32->_provider;
    v32->_provider = (TUConversationProvider *)v116;

    if (v147)
    {
      v118 = (CPApplicationPolicyManager *)v147;
    }
    else
    {
      v118 = +[CPApplicationPolicyManager sharedInstance];
    }
    applicationLaunchPolicyManager = v32->_applicationLaunchPolicyManager;
    v32->_applicationLaunchPolicyManager = v118;

    uint64_t v120 = +[CPAudioRoutePolicyManager sharedInstance];
    audioRoutePolicyManager = v32->_audioRoutePolicyManager;
    v32->_audioRoutePolicyManager = (CPAudioRoutePolicyManager *)v120;

    [(CPAudioRoutePolicyManager *)v32->_audioRoutePolicyManager addObserver:v32 withQueue:v32->_queue];
    uint64_t v122 = +[NSMutableDictionary dictionary];
    audioRoutesByParticipantIdentifier = v32->_audioRoutesByParticipantIdentifier;
    v32->_audioRoutesByParticipantIdentifier = (NSMutableDictionary *)v122;

    uint64_t v124 = +[NSMutableDictionary dictionary];
    pendingConversationParticipantsByIdentifier = v32->_pendingConversationParticipantsByIdentifier;
    v32->_pendingConversationParticipantsByIdentifier = (NSMutableDictionary *)v124;

    id personaHandshakeBlobCreationBlock = v32->_personaHandshakeBlobCreationBlock;
    v32->_id personaHandshakeBlobCreationBlock = &stru_100505508;

    v127 = [(CSDConversation *)v32 localMember];
    unsigned int v128 = [v127 isLightweightMember];

    if (v128)
    {
      v129 = +[NSSet setWithObject:IDSRegistrationPropertySupportsCo];
      [(CSDConversation *)v32 addRequiredCapabilities:v129 requiredLackOfCapabilities:0];
    }
    if (!v32->_avMode)
    {
      v130 = +[NSSet setWithObject:IDSRegistrationPropertySupportsAVLess];
      [(CSDConversation *)v32 addRequiredCapabilities:v130 requiredLackOfCapabilities:0];
    }
    v32->_sessionSwitchTimeout = 3.0;
    v131 = [[CSDConversationLocalParticipantBlobTracker alloc] initWithConversation:v32 idsGroupSession:v146 queue:v32->_queue];
    localParticipantBlobTracker = v32->_localParticipantBlobTracker;
    v32->_localParticipantBlobTracker = v131;

    v32->_screenSharingType = 0;
    objc_destroyWeak(&v161);
    objc_destroyWeak(&v163);
    objc_destroyWeak(&location);
  }
  return v32;
}

- (TUVideoDeviceController)videoDeviceController
{
  v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  videoDeviceController = self->_videoDeviceController;
  if (!videoDeviceController)
  {
    v5 = [(CSDConversation *)self videoDeviceControllerCreationBlock];
    v5[2]();
    v6 = (TUVideoDeviceController *)objc_claimAutoreleasedReturnValue();
    v7 = self->_videoDeviceController;
    self->_videoDeviceController = v6;

    [(TUVideoDeviceController *)self->_videoDeviceController setIgnoreStartPreview:1];
    videoDeviceController = self->_videoDeviceController;
  }

  return videoDeviceController;
}

- (NSString)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CSDConversation *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  v5 = [(CSDConversation *)self groupUUID];
  [v3 appendFormat:@" groupUUID=%@", v5];

  v6 = [(CSDConversation *)self link];

  if (v6)
  {
    v7 = [(CSDConversation *)self link];
    [v3 appendFormat:@" link=%@", v7];
  }
  v8 = [(CSDConversation *)self messagesGroupUUID];

  if (v8)
  {
    v9 = [(CSDConversation *)self messagesGroupUUID];
    [v3 appendFormat:@" messagesGroupUUID=%@", v9];
  }
  objc_msgSend(v3, "appendFormat:", @" state=%ld", -[CSDConversation state](self, "state"));
  objc_msgSend(v3, "appendFormat:", @" hasReceivedLetMeInRequest=%ld", -[CSDConversation hasReceivedLetMeInRequest](self, "hasReceivedLetMeInRequest"));
  objc_msgSend(v3, "appendFormat:", @" letMeInRequestState=%ld", -[CSDConversation letMeInRequestState](self, "letMeInRequestState"));
  objc_msgSend(v3, "appendFormat:", @" ignoreLMIRequests=%d", -[CSDConversation ignoreLMIRequests](self, "ignoreLMIRequests"));
  objc_msgSend(v3, "appendFormat:", @" avcSessionToken=%ld", -[CSDConversation avcSessionToken](self, "avcSessionToken"));
  v10 = [(CSDConversation *)self avcSessionIdentifier];
  [v3 appendFormat:@" avcSessionIdentifier=%@", v10];

  objc_msgSend(v3, "appendFormat:", @" isLocallyCreated=%d", -[CSDConversation isLocallyCreated](self, "isLocallyCreated"));
  objc_msgSend(v3, "appendFormat:", @" hasJoined=%d", -[CSDConversation hasJoined](self, "hasJoined"));
  objc_msgSend(v3, "appendFormat:", @" isAudioInjectionAllowed=%d", -[CSDConversation isAudioInjectionAllowed](self, "isAudioInjectionAllowed"));
  objc_msgSend(v3, "appendFormat:", @" isUnderlyingLinksConnected=%d", -[CSDConversation isUnderlyingLinksConnected](self, "isUnderlyingLinksConnected"));
  objc_msgSend(v3, "appendFormat:", @" isUplinkMuted=%d", -[CSDConversation isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", @" video=%d", -[CSDConversation isVideo](self, "isVideo"));
  objc_msgSend(v3, "appendFormat:", @" isAudioEnabled=%d", -[CSDConversation isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v3, "appendFormat:", @" isVideoEnabled=%d", -[CSDConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", @" isScreenEnabled=%d", -[CSDConversation isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v3, "appendFormat:", @" oneToOneModeEnabled=%d", -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  v11 = [(CSDConversation *)self localMember];
  [v3 appendFormat:@" localMember=%@", v11];

  v12 = [(CSDConversation *)self remoteMembers];
  [v3 appendFormat:@" remoteMembers=%@", v12];

  v13 = [(CSDConversation *)self localMember];
  v14 = [v13 handle];
  [v3 appendFormat:@" localMemberHandle=%@", v14];

  v15 = [(CSDConversation *)self pendingMembers];
  id v16 = [v15 count];

  if (v16)
  {
    v17 = [(CSDConversation *)self pendingMembers];
    [v3 appendFormat:@" pendingMembers=%@", v17];
  }
  v18 = [(CSDConversation *)self kickedMembers];
  id v19 = [v18 count];

  if (v19)
  {
    v20 = [(CSDConversation *)self kickedMembers];
    [v3 appendFormat:@" kickedMembers=%@", v20];
  }
  v21 = [(CSDConversation *)self rejectedMembers];
  id v22 = [v21 count];

  if (v22)
  {
    id v23 = [(CSDConversation *)self rejectedMembers];
    [v3 appendFormat:@" rejectedMembers=%@", v23];
  }
  id v24 = [(CSDConversation *)self otherInvitedHandles];
  id v25 = [v24 count];

  if (v25)
  {
    v26 = [(CSDConversation *)self otherInvitedHandles];
    uint64_t v27 = [v26 allObjects];
    uint64_t v28 = [v27 componentsJoinedByString:@", "];
    [v3 appendFormat:@" otherInvitedHandles=%@", v28];
  }
  uint64_t v29 = [(CSDConversation *)self lightweightMembers];
  id v30 = [v29 count];

  if (v30)
  {
    id v31 = [(CSDConversation *)self lightweightMembers];
    [v3 appendFormat:@" lightweightMembers=%@", v31];
  }
  id v32 = [(CSDConversation *)self memberIdentifiers];
  id v33 = [v32 count];

  if (v33)
  {
    CFStringRef v34 = [(CSDConversation *)self memberIdentifiers];
    CFStringRef v35 = [v34 allObjects];
    uint64_t v36 = [v35 componentsJoinedByString:@", "];
    [v3 appendFormat:@" memberIdentifiers=%@", v36];
  }
  v37 = [(CSDConversation *)self screenSharingRequests];
  id v38 = [v37 count];

  if (v38)
  {
    id v39 = [(CSDConversation *)self screenSharingRequests];
    v40 = [v39 allObjects];
    BOOL v41 = [v40 componentsJoinedByString:@", "];
    [v3 appendFormat:@" screenSharingRequests=%@", v41];
  }
  v42 = [(CSDConversation *)self activeRemoteParticipants];
  [v3 appendFormat:@" activeRemoteParticipants=%@", v42];

  id v43 = [(CSDConversation *)self activeLightweightParticipants];
  id v44 = [v43 count];

  if (v44)
  {
    id v45 = [(CSDConversation *)self activeLightweightParticipants];
    id v46 = [v45 allObjects];
    v47 = [v46 componentsJoinedByString:@", "];
    [v3 appendFormat:@" activeLightweightParticipants=%@", v47];
  }
  v48 = [(CSDConversation *)self report];
  [v3 appendFormat:@" report=%@", v48];

  v49 = [(CSDConversation *)self virtualParticipants];
  id v50 = [v49 count];

  if (v50)
  {
    v51 = [(CSDConversation *)self virtualParticipants];
    [v3 appendFormat:@" virtualParticipants=%@", v51];
  }
  v52 = [(CSDConversation *)self provider];
  [v3 appendFormat:@" provider=%@", v52];

  v53 = [(CSDConversation *)self tuActivitySessions];
  id v54 = [v53 count];

  if (v54)
  {
    v55 = [(CSDConversation *)self tuActivitySessions];
    [v3 appendFormat:@" tuActivitySessions=%@", v55];
  }
  uint64_t v56 = [(CSDConversation *)self tuSystemActivitySessions];
  id v57 = [v56 count];

  if (v57)
  {
    uint64_t v58 = [(CSDConversation *)self tuSystemActivitySessions];
    [v3 appendFormat:@" tuSystemActivitySessions=%@", v58];
  }
  v59 = [(CSDConversation *)self handoffEligibility];

  if (v59)
  {
    v60 = [(CSDConversation *)self handoffEligibility];
    [v3 appendFormat:@" handoffEligibility=%@", v60];
  }
  v61 = [(CSDConversation *)self highlightIdentifiers];
  id v62 = [v61 count];

  if (v62)
  {
    uint64_t v63 = [(CSDConversation *)self highlightIdentifiers];
    v64 = [v63 allObjects];
    v65 = [v64 componentsJoinedByString:@", "];
    [v3 appendFormat:@" highlightIdentifiers=%@", v65];
  }
  id v66 = [(CSDConversation *)self splitSessionSecondary];

  if (v66)
  {
    v67 = [(CSDConversation *)self splitSessionSecondary];
    [v3 appendFormat:@" splitSessionSecondary=%@", v67];
  }
  v68 = [(CSDConversation *)self localLightweightSecondaryMember];

  if (v68)
  {
    v69 = [(CSDConversation *)self localLightweightSecondaryMember];
    [v3 appendFormat:@" localLightweightSecondaryMember=%@", v69];
  }
  v70 = [(CSDConversation *)self invitationPreferences];

  if (v70)
  {
    v71 = [(CSDConversation *)self invitationPreferences];
    [v3 appendFormat:@" invitationPreferences=%@", v71];
  }
  objc_msgSend(v3, "appendFormat:", @" avMode=%ld", -[CSDConversation avMode](self, "avMode"));
  objc_msgSend(v3, "appendFormat:", @" presentationMode=%ld", -[CSDConversation presentationMode](self, "presentationMode"));
  objc_msgSend(v3, "appendFormat:", @" screening=%d", -[CSDConversation isScreening](self, "isScreening"));
  id v72 = self;
  unsigned int v73 = [v72 isFromStorage];

  if (v73)
  {
    unsigned int v74 = self;
    objc_msgSend(v3, "appendFormat:", @" self.isFromStorage=%d", objc_msgSend(v74, "isFromStorage"));
  }
  if ([(CSDConversation *)self isCameraMixedWithScreen]) {
    objc_msgSend(v3, "appendFormat:", @" isCameraMixedWithScreen=%d", -[CSDConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  }
  unsigned int v75 = [(CSDConversation *)self handoffContext];

  if (v75)
  {
    v76 = [(CSDConversation *)self handoffContext];
    [v3 appendFormat:@" handoffContext=%@", v76];
  }
  v77 = self;
  uint64_t v78 = [v77 ABTestConfiguration];

  if (v78)
  {
    v79 = self;
    v80 = [v79 ABTestConfiguration];
    [v3 appendFormat:@" self.ABTestConfiguration=%@", v80];
  }
  objc_msgSend(v3, "appendFormat:", @" screenSharingType=%ld", -[CSDConversation screenSharingType](self, "screenSharingType"));
  [v3 appendString:@">"];
  id v81 = [v3 copy];

  return (NSString *)v81;
}

- (void)setProvider:(id)a3
{
  id v8 = a3;
  provider = self->_provider;
  if (!provider
    || (+[TUConversationProvider unknownProvider],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [(TUConversationProvider *)provider isEqual:v6],
        v6,
        v7))
  {
    objc_storeStrong((id *)&self->_provider, a3);
  }
}

- (void)setActiveParticipantDestinationsByIdentifier:(id)a3
{
  v4 = (NSDictionary *)a3;
  v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  activeParticipantDestinationsByIdentifier = self->_activeParticipantDestinationsByIdentifier;
  self->_activeParticipantDestinationsByIdentifier = v4;
  unsigned int v7 = v4;

  [(CSDConversation *)self updateParticipantsWithDestinationIdentifiers:v7];
}

- (void)setActiveLightweightParticipantDestinationsByIdentifier:(id)a3
{
  v4 = (NSDictionary *)a3;
  v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  activeLightweightParticipantDestinationsByIdentifier = self->_activeLightweightParticipantDestinationsByIdentifier;
  self->_activeLightweightParticipantDestinationsByIdentifier = v4;
  unsigned int v7 = v4;

  [(CSDConversation *)self updateParticipantsWithDestinationIdentifiers:v7];
}

- (BOOL)usesAudioSession
{
  return 1;
}

- (id)activeParticipants
{
  v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDConversation *)self activeRemoteParticipants];
  v5 = [(CSDConversation *)self activeLightweightParticipants];
  v6 = [v4 setByAddingObjectsFromSet:v5];

  return v6;
}

- (NSSet)activeRemoteParticipants
{
  v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  v5 = [v4 allValues];
  v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

- (NSSet)activeLightweightParticipants
{
  v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
  v5 = [v4 allValues];
  v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

- (BOOL)isAnyOtherAccountDeviceActive
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CSDConversation *)self activeRemoteParticipants];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isLocalAccountHandle])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (NSSet)screenSharingRequests
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(CSDConversation *)self screenSharingRequestsByUUID];
  v5 = [v4 allValues];
  v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

- (TUConversation)tuConversation
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc((Class)TUMutableConversation);
  v5 = [(CSDConversation *)self UUID];
  v6 = [(CSDConversation *)self groupUUID];
  long long v7 = [(CSDConversation *)self provider];
  id v8 = [v4 initWithUUID:v5 groupUUID:v6 provider:v7];

  objc_msgSend(v8, "setState:", -[CSDConversation state](self, "state"));
  objc_msgSend(v8, "setHasReceivedLetMeInRequest:", -[CSDConversation hasReceivedLetMeInRequest](self, "hasReceivedLetMeInRequest"));
  objc_msgSend(v8, "setLetMeInRequestState:", -[CSDConversation letMeInRequestState](self, "letMeInRequestState"));
  long long v9 = [(CSDConversation *)self link];
  [v8 setLink:v9];

  long long v10 = [(CSDConversation *)self messagesGroupUUID];
  [v8 setMessagesGroupUUID:v10];

  objc_msgSend(v8, "setAvcSessionToken:", -[CSDConversation avcSessionToken](self, "avcSessionToken"));
  objc_msgSend(v8, "setLocalCaptionToken:", -[CSDConversation avcLocalCaptionsToken](self, "avcLocalCaptionsToken"));
  v11 = [(CSDConversation *)self avcSessionIdentifier];
  [v8 setAvcSessionIdentifier:v11];

  objc_msgSend(v8, "setAudioEnabled:", -[CSDConversation isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v8, "setVideoEnabled:", -[CSDConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v8, "setVideoPaused:", -[CSDConversation isVideoPaused](self, "isVideoPaused"));
  objc_msgSend(v8, "setScreenEnabled:", -[CSDConversation isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v8, "setLocallyCreated:", -[CSDConversation isLocallyCreated](self, "isLocallyCreated"));
  objc_msgSend(v8, "setHasJoined:", -[CSDConversation hasJoined](self, "hasJoined"));
  v12 = [(CSDConversation *)self initiator];
  [v8 setInitiator:v12];

  v13 = [(CSDConversation *)self remoteMembers];
  [v8 setRemoteMembers:v13];

  v14 = [(CSDConversation *)self pendingMembers];
  [v8 setPendingMembers:v14];

  v15 = [(CSDConversation *)self kickedMembers];
  [v8 setKickedMembers:v15];

  id v16 = [(CSDConversation *)self rejectedMembers];
  [v8 setRejectedMembers:v16];

  v17 = [(CSDConversation *)self otherInvitedHandles];
  [v8 setOtherInvitedHandles:v17];

  objc_msgSend(v8, "setIgnoreLMIRequests:", -[CSDConversation ignoreLMIRequests](self, "ignoreLMIRequests"));
  v18 = [(CSDConversation *)self messagesGroupName];
  [v8 setMessagesGroupName:v18];

  objc_msgSend(v8, "setMaxVideoDecodesAllowed:", -[CSDConversation maxVideoDecodesAllowed](self, "maxVideoDecodesAllowed"));
  id v19 = [(CSDConversation *)self report];
  [v8 setReport:v19];

  v20 = [(CSDConversation *)self reportingHierarchyToken];
  [v8 setReportingHierarchyToken:v20];

  v21 = [(CSDConversation *)self reportingHierarchySubToken];
  [v8 setReportingHierarchySubToken:v21];

  id v22 = [(CSDConversation *)self localMember];
  [v8 setLocalMember:v22];

  objc_msgSend(v8, "setLocalParticipantIdentifier:", -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier"));
  id v23 = [(CSDConversation *)self featureFlags];
  LODWORD(v6) = [v23 conversationHandoffEnabled];

  if (v6)
  {
    id v24 = [(CSDConversation *)self localParticipantAssociation];
    [v8 setLocalParticipantAssociation:v24];

    objc_msgSend(v8, "setOneToOneHandoffOngoing:", -[CSDConversation isOneToOneHandoffOngoing](self, "isOneToOneHandoffOngoing"));
    id v25 = [(CSDConversation *)self handoffEligibility];
    [v8 setHandoffEligibility:v25];
  }
  objc_msgSend(v8, "setOneToOneModeEnabled:", -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  v26 = [(CSDConversation *)self tuActivitySessions];
  [v8 setActivitySessions:v26];

  uint64_t v27 = [(CSDConversation *)self tuSystemActivitySessions];
  [v8 setSystemActivitySessions:v27];

  uint64_t v28 = [(CSDConversation *)self stagedActivitySession];
  [v8 setStagedActivitySession:v28];

  objc_msgSend(v8, "setVideo:", -[CSDConversation isVideo](self, "isVideo"));
  uint64_t v29 = [(CSDConversation *)self virtualParticipants];
  [v8 setVirtualParticipants:v29];

  id v30 = [(CSDConversation *)self invitationPreferences];
  [v8 setInvitationPreferences:v30];

  id v31 = [(CSDConversation *)self lightweightMembers];
  [v8 setLightweightMembers:v31];

  objc_msgSend(v8, "setFromStorage:", -[CSDConversation isFromStorage](self, "isFromStorage"));
  id v32 = [(CSDConversation *)self failureContext];
  [v8 setConversationFailureContext:v32];

  objc_msgSend(v8, "setIsAnyOtherAccountDeviceActive:", -[CSDConversation isAnyOtherAccountDeviceActive](self, "isAnyOtherAccountDeviceActive"));
  objc_msgSend(v8, "setAvMode:", -[CSDConversation avMode](self, "avMode"));
  objc_msgSend(v8, "setPresentationMode:", -[CSDConversation presentationMode](self, "presentationMode"));
  objc_msgSend(v8, "setScreening:", -[CSDConversation isScreening](self, "isScreening"));
  objc_msgSend(v8, "setRelaying:", -[CSDConversation isRelaying](self, "isRelaying"));
  objc_msgSend(v8, "setEndpointOnCurrentDevice:", -[CSDConversation isRelaying](self, "isRelaying") ^ 1);
  objc_msgSend(v8, "setSpatialPersonaEnabled:", -[CSDConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  objc_msgSend(v8, "setCameraMixedWithScreen:", -[CSDConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  objc_msgSend(v8, "setIsUnderlyingLinksConnected:", -[CSDConversation isUnderlyingLinksConnected](self, "isUnderlyingLinksConnected"));
  id v33 = [(CSDConversation *)self activeRemoteParticipants];
  CFStringRef v34 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v33 count]);

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  CFStringRef v35 = [(CSDConversation *)self activeRemoteParticipants];
  id v36 = [v35 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v63;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v63 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = [*(id *)(*((void *)&v62 + 1) + 8 * i) tuConversationParticipant];
        [v34 addObject:v40];
      }
      id v37 = [v35 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v37);
  }

  BOOL v41 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
  v42 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v41 count]);

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v43 = [(CSDConversation *)self activeLightweightParticipants];
  id v44 = [v43 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v59;
    do
    {
      for (j = 0; j != v45; j = (char *)j + 1)
      {
        if (*(void *)v59 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) tuConversationParticipant];
        [v42 addObject:v48];
      }
      id v45 = [v43 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v45);
  }

  v49 = [(CSDConversation *)self featureFlags];
  unsigned __int8 v50 = [v49 aTVHandoff];

  if ((v50 & 1) == 0) {
    [v34 unionSet:v42];
  }
  [v8 setActiveRemoteParticipants:v34];
  [v8 setActiveLightweightParticipants:v42];
  v51 = [(CSDConversation *)self highlightIdentifiers];
  [v8 setHighlightIdentifiers:v51];

  v52 = [(CSDConversation *)self screenSharingRequests];
  [v8 setScreenSharingRequests:v52];

  v53 = [(CSDConversation *)self supportedMediaTypes];
  [v8 setSupportedMediaTypes:v53];

  id v54 = [(CSDConversation *)self handoffContext];
  [v8 setHandoffContext:v54];

  v55 = [(CSDConversation *)self screenSharingRequests];
  [v8 setScreenSharingRequests:v55];

  objc_msgSend(v8, "setScreenSharingType:", -[CSDConversation screenSharingType](self, "screenSharingType"));
  id v56 = [v8 copy];

  return (TUConversation *)v56;
}

- (id)avcSessionIdentifier
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];
  v5 = [v4 sessionIdentifier];

  return v5;
}

- (int64_t)avcSessionToken
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];
  id v5 = [v4 sessionToken];

  return (int64_t)v5;
}

- (int64_t)avcLocalCaptionsToken
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];
  id v5 = [v4 localCaptionsToken];

  return (int64_t)v5;
}

- (unint64_t)localParticipantIdentifier
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self idsSession];
  id v5 = [v4 localParticipantIdentifier];

  return (unint64_t)v5;
}

- (int64_t)maxVideoDecodesAllowed
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];
  id v5 = [v4 maxVideoDecodesAllowed];

  return (int64_t)v5;
}

- (BOOL)isAudioReady
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];
  LOBYTE(v3) = [v4 isAudioReady];

  return (char)v3;
}

- (void)setRemoteMembers:(id)a3
{
  if (self->_remoteMembers != a3)
  {
    id v4 = (NSSet *)[a3 copy];
    remoteMembers = self->_remoteMembers;
    self->_remoteMembers = v4;

    v6 = +[NSMutableSet set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v7 = [(CSDConversation *)self remoteMembers];
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) handle];
          [v6 addObject:v12];

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [(CSDConversation *)self setRemoteMemberHandles:v6];
    v13 = [(CSDConversation *)self delegate];
    [v13 conversation:self remoteMembersChanged:self->_remoteMembers];
  }
}

- (id)localParticipantCapabilities
{
  id v3 = objc_alloc_init((Class)TUMutableConversationParticipantCapabilities);
  [v3 setScreenSharingAvailable:1];
  [v3 setGondolaCallingAvailable:1];
  [v3 setSupportsLeaveContext:1];
  id v4 = [(CSDConversation *)self featureFlags];
  objc_msgSend(v3, "setGftDowngradeToOneToOneAvailable:", objc_msgSend(v4, "gftDowngradeToOneToOne"));

  id v5 = [(CSDConversation *)self featureFlags];
  objc_msgSend(v3, "setUPlusOneScreenShareAvailable:", objc_msgSend(v5, "uPlusOneScreenSharing"));

  v6 = [(CSDConversation *)self featureFlags];
  objc_msgSend(v3, "setUPlusNDowngradeAvailable:", objc_msgSend(v6, "uPlusNDowngrade"));

  [v3 setSharePlayProtocolVersion:TUSharePlayProtocolVersion()];
  [v3 setPersonaAvailable:TUIsPersonaAvailable()];
  [v3 setVisionCallEstablishmentVersion:TUVisionCallEstablishmentVersion()];
  [v3 setVisionFeatureVersion:TUVisionFeatureVersion()];
  [v3 setUPlusOneAVLessAvailable:1];
  long long v7 = [(CSDConversation *)self featureFlags];
  [(CSDConversation *)self isRelaying];
  [(CSDConversation *)self isScreenSharingInitiationAvailable];
  [v3 setSupportsRequestToScreenShare:TUIsRequestToScreenShareAvailable()];

  id v8 = +[CSDMomentsController localCapabilities];
  objc_msgSend(v3, "setMomentsAvailable:", objc_msgSend(v8, "isEnabled"));

  [v3 setPhotosSharePlayAvailable:TUIsPhotosSharePlayAvailable()];

  return v3;
}

- (id)localConversationParticipantWithData
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(CSDConversation *)self remoteMembers];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(CSDConversation *)self remoteMembers];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) handle];
        v12 = [v11 value];
        [v5 addObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [(CSDConversation *)self localConversationParticipantWithDataToSendToDestinationIDs:v5];

  return v13;
}

- (id)localConversationParticipantWithDataToSendToDestinationIDs:(id)a3
{
  id v4 = [(CSDConversation *)self localParticipantDataToSendToDestinationIDs:a3];
  id v5 = 0;
  if ([(CSDConversation *)self localParticipantIdentifier] && v4)
  {
    v6 = [CSDConversationParticipant alloc];
    unint64_t v7 = [(CSDConversation *)self localParticipantIdentifier];
    id v8 = [(CSDConversation *)self localMember];
    uint64_t v9 = [v8 handle];
    id v5 = [(CSDConversationParticipant *)v6 initWithIdentifier:v7 handle:v9 avcData:v4];

    [(CSDConversationParticipant *)v5 setAudioVideoMode:[(CSDConversation *)self avMode]];
    [(CSDConversationParticipant *)v5 setSpatialPersonaEnabled:[(CSDConversation *)self isSpatialPersonaEnabled]];
    uint64_t v10 = [(CSDConversation *)self localParticipantCapabilities];
    [(CSDConversationParticipant *)v5 setCapabilities:v10];
  }

  return v5;
}

- (id)localParticipantData
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(CSDConversation *)self remoteMembers];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(CSDConversation *)self remoteMembers];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) handle];
        v12 = [v11 value];
        [v5 addObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [(CSDConversation *)self localParticipantDataToSendToDestinationIDs:v5];

  return v13;
}

- (id)localParticipantDataToSendToDestinationIDs:(id)a3
{
  id v4 = a3;
  if ([(CSDConversation *)self isOneToOneModeEnabled])
  {
    uint64_t v5 = 2;
  }
  else if ([v4 count])
  {
    v6 = [(CSDConversation *)self faceTimeInviteDemuxer];
    if ([v6 destinationIDsCanUseV2Blobs:v4]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v7 = [(CSDConversation *)self avcSession];
  id v8 = [v7 localParticipantDataWithVersion:v5];

  return v8;
}

- (BOOL)_expanseEnabled
{
  id v3 = [(CSDConversation *)self featureFlags];
  if ([v3 expanseEnabled]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(CSDConversation *)self forceExpanseEnabled];
  }

  return v4;
}

- (void)setForceExpanseEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self _expanseEnabled];
  if (v3)
  {
    if ((v5 & 1) == 0)
    {
      id v6 = objc_alloc((Class)CPActivitySessionManager);
      id v7 = [(CSDConversation *)self UUID];
      id v8 = [(CSDConversation *)self groupUUID];
      uint64_t v9 = +[NSSet set];
      id v10 = objc_alloc_init((Class)CPApplicationController);
      v11 = [(CSDConversation *)self queue];
      v12 = [(CSDConversation *)self sharePlaySystemStateObserver];
      id v13 = [v6 initWithIdentifier:v7 groupUUID:v8 activities:v9 applicationController:v10 delegate:self queue:v11 systemStateObserver:v12];
      [(CSDConversation *)self setActivitySessionManager:v13];
    }
  }
  else if (v5)
  {
    [(CSDConversation *)self setActivitySessionManager:0];
  }
  self->_forceExpanseEnabled = v3;
}

- (NSSet)virtualParticipants
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDConversation *)self virtualParticipantsByPluginName];
  unsigned int v5 = [v4 allValues];
  id v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

- (NSSet)memberHandlesEligibleForLinkApproval
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = +[NSMutableSet set];
  unsigned int v5 = [(CSDConversation *)self link];

  if (v5)
  {
    id v6 = [(CSDConversation *)self link];
    id v7 = [v6 invitedMemberHandles];
    id v8 = [v7 mutableCopy];

    BOOL v4 = v8;
    goto LABEL_15;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(CSDConversation *)self remoteMemberHandles];
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10) {
    goto LABEL_14;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v21;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      long long v15 = [v14 value];
      if ([v15 destinationIdIsPhoneNumber])
      {
      }
      else
      {
        long long v16 = [v14 value];
        unsigned int v17 = [v16 destinationIdIsEmailAddress];

        if (!v17) {
          continue;
        }
      }
      [v4 addObject:v14];
    }
    id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v11);
LABEL_14:

LABEL_15:
  id v18 = [v4 copy];

  return (NSSet *)v18;
}

- (BOOL)isUplinkMuted
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDConversation *)self avcSession];
  LOBYTE(v3) = [v4 isUplinkMuted];

  return (char)v3;
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(CSDConversation *)self isAudioInjectionAllowed]
    && ([(CSDConversation *)self featureFlags],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 callRecordingEnabled],
        v6,
        v7))
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting expected uplink muted to %d instead of muting avcsession because injection is allowed", buf, 8u);
    }

    [(CSDConversation *)self setExpectedUplinkMuted:v3];
  }
  else
  {
    id v9 = [(CSDConversation *)self avcSession];
    [v9 setUplinkMuted:v3];
  }
}

- (void)setAudioInjectionAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversation *)self featureFlags];
  unsigned int v7 = [v6 callRecordingEnabled];

  if (v7 && [(CSDConversation *)self isAudioInjectionAllowed] != v3)
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      unsigned int v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting audio injection allowed to %d", (uint8_t *)&v11, 8u);
    }

    if (v3)
    {
      [(CSDConversation *)self setExpectedUplinkMuted:[(CSDConversation *)self isUplinkMuted]];
      [(CSDConversation *)self setUplinkMuted:0];
      self->_audioInjectionAllowed = v3;
    }
    else
    {
      id v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = [(CSDConversation *)self expectedUplinkMuted];
        int v11 = 67109120;
        unsigned int v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resetting uplink mute to exected uplink muted %d", (uint8_t *)&v11, 8u);
      }

      self->_audioInjectionAllowed = 0;
      [(CSDConversation *)self setUplinkMuted:[(CSDConversation *)self expectedUplinkMuted]];
    }
  }
}

- (BOOL)isUnderlyingLinksConnected
{
  return [(CSDIDSGroupSession *)self->_idsSession isUnderlyingLinksConnected];
}

- (BOOL)isAudioEnabled
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDConversation *)self expectedAudioEnabled];
  if (v4)
  {
    unsigned int v5 = [(CSDConversation *)self expectedAudioEnabled];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned int v5 = [(CSDConversation *)self avcSession];
    unsigned __int8 v6 = [v5 isAudioEnabled];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting audioEnabled to %d", (uint8_t *)v10, 8u);
  }

  BOOL v7 = [(CSDConversation *)self expectedAudioEnabled];

  if (!v7)
  {
    id v8 = [(CSDConversation *)self avcSession];
    [v8 setAudioEnabled:v3];
  }
  id v9 = +[NSNumber numberWithBool:v3];
  [(CSDConversation *)self setExpectedAudioEnabled:v9];
}

- (BOOL)isVideoEnabled
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDConversation *)self expectedVideoEnabled];
  if (v4)
  {
    unsigned int v5 = [(CSDConversation *)self expectedVideoEnabled];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned int v5 = [(CSDConversation *)self avcSession];
    unsigned __int8 v6 = [v5 isVideoEnabled];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)isScreenEnabled
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDConversation *)self expectedScreenEnabled];
  if (v4)
  {
    unsigned int v5 = [(CSDConversation *)self expectedScreenEnabled];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned int v5 = [(CSDConversation *)self avcSession];
    unsigned __int8 v6 = [v5 isScreenEnabled];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [(CSDConversation *)self isRedirectingAudio];
  BOOL v7 = sub_100008DCC();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 && v3)
  {
    if (v8)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring to set videoEnabled since conversation is relaying or being screened", (uint8_t *)v11, 2u);
    }
    goto LABEL_9;
  }
  if (v8)
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting videoEnabled to %d", (uint8_t *)v11, 8u);
  }

  id v9 = [(CSDConversation *)self expectedVideoEnabled];

  unsigned int v10 = +[NSNumber numberWithBool:v3];
  [(CSDConversation *)self setExpectedVideoEnabled:v10];

  if (!v9)
  {
    BOOL v7 = [(CSDConversation *)self avcSession];
    [v7 setVideoEnabled:v3];
LABEL_9:
  }
}

- (void)setScreenEnabled:(BOOL)a3 attributes:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = v4;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting screenEnabled to %d, screenShareAttributes: %@", (uint8_t *)v16, 0x12u);
  }

  uint64_t v9 = [(CSDConversation *)self expectedScreenEnabled];
  if (!v9
    || (unsigned int v10 = (void *)v9,
        [(CSDConversation *)self expectedScreenEnabled],
        int v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 BOOLValue],
        v11,
        v10,
        v12 != v4))
  {
    id v13 = [(CSDConversation *)self avcSession];
    [v13 setScreenEnabled:v4 attributes:v6];
  }
  long long v14 = +[NSNumber numberWithBool:v4];
  [(CSDConversation *)self setExpectedScreenEnabled:v14];

  long long v15 = [(CSDConversation *)self delegate];
  [v15 conversationChanged:self];
}

- (void)addScreenSharingType:(unint64_t)a3
{
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t screenSharingType = self->_screenSharingType;
    int v9 = 134218240;
    unint64_t v10 = a3;
    __int16 v11 = 2048;
    unint64_t v12 = screenSharingType;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding %lu to screenSharingType %lu", (uint8_t *)&v9, 0x16u);
  }

  self->_screenSharingType |= a3;
  BOOL v8 = [(CSDConversation *)self delegate];
  [v8 conversationChanged:self];
}

- (BOOL)isVideoPaused
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDConversation *)self expectedVideoPaused];
  if (v4)
  {
    unsigned int v5 = [(CSDConversation *)self expectedVideoPaused];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned int v5 = [(CSDConversation *)self avcSession];
    unsigned __int8 v6 = [v5 isVideoPaused];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting videoPaused to %d", (uint8_t *)v10, 8u);
  }

  BOOL v7 = [(CSDConversation *)self expectedVideoPaused];

  BOOL v8 = +[NSNumber numberWithBool:v3];
  [(CSDConversation *)self setExpectedVideoPaused:v8];

  if (!v7)
  {
    int v9 = [(CSDConversation *)self avcSession];
    [v9 setVideoPaused:v3];
  }
}

- (void)setScreenShareAttributes:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting screenShareAttributes to %@", (uint8_t *)&v8, 0xCu);
  }

  if ([(CSDConversation *)self isScreenEnabled])
  {
    BOOL v7 = [(CSDConversation *)self avcSession];
    [v7 setScreenShareAttributes:v4];
  }
  else
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1003A6E9C();
    }
  }
}

- (BOOL)isAudioPaused
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self expectedAudioPaused];
  if (v4)
  {
    unsigned int v5 = [(CSDConversation *)self expectedAudioPaused];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned int v5 = [(CSDConversation *)self avcSession];
    unsigned __int8 v6 = [v5 isAudioPaused];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting audioPaused to %d", buf, 8u);
  }

  BOOL v7 = [(CSDConversation *)self expectedAudioPaused];

  if (!v7)
  {
    int v8 = [(CSDConversation *)self avcSession];
    [v8 setAudioPaused:v3];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [(CSDConversation *)self activeRemoteParticipants];
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
          long long v15 = [(CSDConversation *)self avcSession];
          objc_msgSend(v15, "setAudioPaused:forParticipantWithIdentifier:", v3, objc_msgSend(v14, "identifier"));

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  long long v16 = +[NSNumber numberWithBool:v3];
  [(CSDConversation *)self setExpectedAudioPaused:v16];
}

- (BOOL)isRedirectingAudio
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(CSDConversation *)self isRelaying]) {
    return 1;
  }

  return [(CSDConversation *)self isScreening];
}

- (BOOL)isRelaying
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_relaying;
}

- (BOOL)isScreening
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_screening;
}

- (void)setRelaying:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    int v14 = 136315394;
    long long v15 = "-[CSDConversation setRelaying:]";
    __int16 v16 = 2112;
    CFStringRef v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:  %@", (uint8_t *)&v14, 0x16u);
  }

  if (v3)
  {
    int v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Turning off video since we are requesting to relay this conversation", (uint8_t *)&v14, 2u);
    }

    [(CSDConversation *)self setVideoEnabled:0];
  }
  unsigned int v9 = [(CSDConversation *)self isRelaying];
  self->_relaying = v3;
  id v10 = [(CSDConversation *)self avcSession];
  [v10 setRelaying:v3];

  if (v9 != v3)
  {
    id v11 = [(CSDConversation *)self featureFlags];
    unsigned int v12 = [v11 requestToScreenShareEnabled];

    if (v12) {
      [(CSDConversation *)self broadcastLocalParticipantData];
    }
    id v13 = [(CSDConversation *)self delegate];
    [v13 conversationChanged:self];
  }
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_screening = v3;
  unsigned __int8 v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    int v11 = 138412290;
    CFStringRef v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setScreening: %@", (uint8_t *)&v11, 0xCu);
  }

  int v8 = [(CSDConversation *)self avcSession];
  [v8 setScreening:v3];

  unsigned int v9 = [(CSDConversation *)self idsSession];
  [v9 setScreening:v3];

  id v10 = [(CSDConversation *)self delegate];
  [v10 conversationChanged:self];
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3
{
  [(CSDConversation *)self setLocalParticipantAudioVideoMode:a3 presentationMode:a3 == 0];
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 presentationMode:(unint64_t)a4
{
  CFStringRef v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  self->_avMode = a3;
  self->_presentationMode = a4;
  int v8 = [(CSDConversation *)self _allMembers];
  unsigned int v9 = [(CSDConversation *)self localCSDConversationParticipant];
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      CFStringRef v12 = [(CSDConversation *)self idsSession];
      [v12 setParticipantType:0 forParticipant:v9 members:v8 isLocalParticipant:1];

      id v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Stopping session since local av mode is switching to none", v17, 2u);
      }

      if ([(CSDConversation *)self avcSessionInProgress])
      {
        [(CSDConversation *)self setAvcSessionInProgress:0];
        [(CSDConversation *)self _stopAVCSession];
      }
    }
  }
  else
  {
    id v10 = [(CSDConversation *)self idsSession];
    unsigned int v11 = [v10 localParticipantType];

    if (v11 == 1)
    {
      [(CSDConversation *)self setVideo:a3 == 2];
    }
    else
    {
      BOOL v14 = a3 == 2 && [(CSDConversation *)self isVideoEnabled];
      long long v15 = +[NSNumber numberWithInt:v14];
      [(CSDConversation *)self setExpectedVideoEnabled:v15];

      __int16 v16 = [(CSDConversation *)self idsSession];
      [v16 setParticipantType:1 forParticipant:v9 members:v8 isLocalParticipant:1];
    }
  }
}

- (void)registerMessagesGroupAssociation
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CSDConversation *)self UUID];
    int v8 = 138412290;
    unsigned int v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Conversation UUID: %@ asked to register messages group association", (uint8_t *)&v8, 0xCu);
  }
  unsigned __int8 v6 = [(CSDConversation *)self groupUUID];
  [(CSDConversation *)self setMessagesGroupUUID:v6];

  CFStringRef v7 = [(CSDConversation *)self delegate];
  [v7 conversationChanged:self];
}

- (void)setVideo:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![(CSDConversation *)self _endScreenCallIfNecessary] && self->_video != v3)
  {
    unint64_t v6 = 1;
    if (v3) {
      unint64_t v6 = 2;
    }
    self->_avMode = v6;
    self->_video = v3;
    if (!v3) {
      [(CSDConversation *)self setVideoEnabled:0];
    }
    CFStringRef v7 = [(CSDConversation *)self avcSession];
    [v7 setVideo:v3];

    id v9 = [(CSDConversation *)self delegate];
    int v8 = [(CSDConversation *)self localParticipant];
    [v9 conversation:self didChangeLocalParticipant:v8 broadcastActivitySession:1];

    [v9 conversationChanged:self];
  }
}

- (BOOL)isVideo
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self featureFlags];
  unsigned int v5 = [v4 avLessSharePlayEnabled];

  if (v5) {
    return (id)[(CSDConversation *)self avMode] == (id)2;
  }
  else {
    return self->_video;
  }
}

- (int64_t)activeRemoteParticipantCountMinusEligibleAVLess
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v3 = [(CSDConversation *)self activeRemoteParticipants];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    char v8 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned int v11 = [v10 capabilities];
        unsigned int v12 = [v11 isUPlusOneAVLessAvailable];

        if (v12)
        {
          if (![v10 audioVideoMode]) {
            ++v6;
          }
        }
        else
        {
          char v8 = 0;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    char v8 = 1;
  }

  id v13 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  id v14 = [v13 count];

  if (((v6 > 0) & v8) != 0) {
    uint64_t v15 = v6;
  }
  else {
    uint64_t v15 = 0;
  }
  return (int64_t)v14 - v15;
}

- (BOOL)isOneToOneModeEnabled
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];

  if (v4)
  {
    id v5 = [(CSDConversation *)self avcSession];
    unsigned __int8 v6 = [v5 isOneToOneModeEnabled];
    goto LABEL_48;
  }
  uint64_t v7 = [(CSDConversation *)self featureFlags];
  unsigned int v8 = [v7 conversationHandoffEnabled];

  if (v8)
  {
    id v9 = [(CSDConversation *)self localParticipantAssociation];
    if (v9)
    {
      id v10 = [(CSDConversation *)self activeRemoteParticipants];
      BOOL v11 = (unint64_t)[v10 count] < 2;
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
  unsigned int v12 = [(CSDConversation *)self localMember];
  unsigned int v13 = [v12 isLightweightMember];

  id v14 = [(CSDConversation *)self remoteMembers];
  id v15 = [v14 count];

  if (v15 == (id)1)
  {
    LODWORD(v16) = v13 ^ 1;
    goto LABEL_35;
  }
  if ([(CSDConversation *)self state] > 1)
  {
    LODWORD(v16) = (id)[(CSDConversation *)self activeRemoteParticipantCountMinusEligibleAVLess] == (id)1;
    goto LABEL_35;
  }
  long long v17 = [(CSDConversation *)self remoteMembers];
  id v18 = [v17 count];

  if (v18)
  {
    id v16 = [(CSDConversation *)self remoteMembers];
    long long v19 = [(CSDConversation *)self localMember];
    long long v20 = +[TUConversation mergedRemoteMembers:v16 withLocalMember:v19 removingLocallyAssociatedMember:0];

    LODWORD(v16) = 0;
    if ((v13 & 1) == 0)
    {
      if ([v20 count] == (id)1)
      {
        long long v21 = [(CSDConversation *)self lightweightMembers];
        LODWORD(v16) = [v21 count] == 0;
      }
      else
      {
        LODWORD(v16) = 0;
      }
    }

    goto LABEL_35;
  }
  long long v22 = [(CSDConversation *)self featureFlags];
  if (([v22 oneToOneFaceTimeMyselfEnabled] & 1) == 0)
  {

    goto LABEL_32;
  }
  BOOL v23 = [(CSDConversation *)self serverBag];
  unsigned int v24 = [v23 isFaceTimeMyselfEnabled];

  if (!v24)
  {
LABEL_32:
    LODWORD(v16) = 0;
    goto LABEL_35;
  }
  id v25 = [(CSDConversation *)self remotePushTokens];
  id v16 = [v25 count];

  if (!v16) {
    goto LABEL_35;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = [(CSDConversation *)self remotePushTokens];
  v26 = (char *)[obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (!v26) {
    goto LABEL_30;
  }
  uint64_t v27 = v26;
  uint64_t v56 = *(void *)v58;
  while (2)
  {
    for (i = 0; i != v27; ++i)
    {
      if (*(void *)v58 != v56) {
        objc_enumerationMutation(obj);
      }
      uint64_t v29 = TUHandleForIDSCanonicalAddress();
      id v30 = TUCopyIDSFromIDForHandle();
      TUHandleForIDSCanonicalAddress();
      id v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v32 = [(CSDConversation *)self localMember];
      id v33 = [v32 handle];
      unsigned __int8 v34 = [(__CFString *)v31 isEqualToHandle:v33];

      if ((v34 & 1) == 0)
      {
        v49 = sub_100008DCC();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v50 = [(__CFString *)v31 value];
          v51 = [(CSDConversation *)self localMember];
          v52 = [v51 handle];
          v53 = [v52 value];
          *(_DWORD *)buf = 138412546;
          CFStringRef v62 = v50;
          __int16 v63 = 2112;
          CFStringRef v64 = v53;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "not local handle: %@, %@", buf, 0x16u);
        }
        goto LABEL_56;
      }
      CFStringRef v35 = [(__CFString *)v31 value];
      unsigned int v36 = [v35 destinationIdIsPseudonym];

      if (v36)
      {
        v49 = sub_100008DCC();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v62 = v31;
          id v54 = "handle is pseudonym: %@";
LABEL_55:
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, v54, buf, 0xCu);
        }
LABEL_56:

        goto LABEL_32;
      }
      id v37 = [(__CFString *)v31 value];
      unsigned int v38 = [v37 destinationIdIsTemporary];

      if (v38)
      {
        v49 = sub_100008DCC();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v62 = v31;
          id v54 = "handle is temporary: %@";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
    }
    uint64_t v27 = (char *)[obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v27) {
      continue;
    }
    break;
  }
LABEL_30:
  LODWORD(v16) = v13 ^ 1;

LABEL_35:
  id v39 = sub_100008DCC();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v40 = @"NO";
    if (v16) {
      CFStringRef v41 = @"YES";
    }
    else {
      CFStringRef v41 = @"NO";
    }
    if (v11) {
      CFStringRef v40 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v62 = v41;
    __int16 v63 = 2112;
    CFStringRef v64 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "meetsRemoteCountCriteria: %@, meetsParticipantCriteria: %@", buf, 0x16u);
  }

  id v5 = [(CSDConversation *)self featureFlags];
  if (([v5 conversationOneToOneModeEnabled] & v16 & v11) == 1)
  {
    v42 = [(CSDConversation *)self remoteMembers];
    id v43 = [v42 allObjects];
    id v44 = [v43 firstObject];
    id v45 = [v44 handle];
    uint64_t v46 = [v45 value];
    if ([v46 destinationIdIsTemporary])
    {
      unsigned __int8 v6 = 0;
    }
    else
    {
      v47 = [(CSDConversation *)self link];
      unsigned __int8 v6 = v47 == 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
LABEL_48:

  return v6;
}

- (BOOL)isOneToOneHandoffOngoing
{
  BOOL v3 = [(CSDConversation *)self featureFlags];
  unsigned int v4 = [v3 conversationHandoffEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(CSDConversation *)self remoteMembers];
  if ([v5 count] != (id)1)
  {

    return 0;
  }
  unsigned __int8 v6 = [(CSDConversation *)self activeRemoteParticipants];
  id v7 = [v6 count];

  if (v7 != (id)2) {
    return 0;
  }
  unsigned int v8 = [(CSDConversation *)self localParticipantAssociation];

  if (v8)
  {
    id v9 = [(CSDConversation *)self localParticipantAssociation];
    id v10 = [v9 identifier];

    if (v10 != (id)[(CSDConversation *)self localParticipantIdentifier])
    {
      BOOL v11 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
      unsigned int v12 = +[NSNumber numberWithUnsignedLongLong:v10];
      unsigned int v13 = [v11 objectForKeyedSubscript:v12];
      BOOL v14 = v13 != 0;

      return v14;
    }
    return 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = [(CSDConversation *)self activeRemoteParticipants];
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
LABEL_12:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v29 != v19) {
        objc_enumerationMutation(v16);
      }
      long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
      long long v22 = [v21 association];

      if (v22) {
        break;
      }
      if (v18 == (id)++v20)
      {
        id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v18) {
          goto LABEL_12;
        }
        goto LABEL_20;
      }
    }
    BOOL v23 = [v21 association];
    id v24 = [v23 identifier];

    if (v24 == [v21 identifier]) {
      goto LABEL_20;
    }
    if (v24 == (id)[(CSDConversation *)self localParticipantIdentifier])
    {
      BOOL v14 = 1;
    }
    else
    {
      id v25 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
      v26 = +[NSNumber numberWithUnsignedLongLong:v24];
      uint64_t v27 = [v25 objectForKeyedSubscript:v26];
      BOOL v14 = v27 != 0;
    }
  }
  else
  {
LABEL_20:
    BOOL v14 = 0;
  }

  return v14;
}

- (void)addHighlightIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = +[NSMutableSet setWithObject:v4];

  [(CSDConversation *)self setHighlightIdentifiers:v6];
  id v7 = [(CSDConversation *)self delegate];
  [v7 conversationChanged:self];
}

- (void)removeHighlightIdentifier:(id)a3
{
  id v9 = a3;
  id v4 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDConversation *)self highlightIdentifiers];
  unsigned int v6 = [v5 containsObject:v9];

  if (v6)
  {
    id v7 = [(CSDConversation *)self highlightIdentifiers];
    [v7 removeObject:v9];

    unsigned int v8 = [(CSDConversation *)self delegate];
    [v8 conversationChanged:self];
  }
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(CSDConversation *)self isOneToOneModeEnabled] != v3)
  {
    unsigned int v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting oneToOneModeEnabled to %d", (uint8_t *)v8, 8u);
    }

    [(CSDConversation *)self updateLocalAspectRatios];
    id v7 = [(CSDConversation *)self avcSession];
    [v7 setOneToOneModeEnabled:v3];
  }
}

- (void)setSplitSessionSecondary:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = self->_splitSessionSecondary;
  if ((TUObjectsAreEqualOrNil() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_splitSessionSecondary, a3);
    if (v7)
    {
      id v19 = v5;
      unsigned int v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(CSDConversation *)self UUID];
        *(_DWORD *)buf = 138412546;
        v26 = v9;
        __int16 v27 = 2112;
        long long v28 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Kicking previous participant on conversation UUID: %@ participant: %@", buf, 0x16u);
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = [(CSDConversation *)self lightweightMembers];
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            id v16 = [v15 handle];
            id v17 = [(CSDConversationParticipant *)v7 handle];
            unsigned int v18 = [v16 isEquivalentToHandle:v17];

            if (v18) {
              [(CSDConversation *)self kickMember:v15];
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v12);
      }

      id v5 = v19;
    }
    [(CSDConversation *)self setSharePlayHandedOff:v5 != 0];
  }
}

- (void)setSharePlayHandedOff:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sharePlayHandedOff: %d", buf, 8u);
  }

  id v7 = [(CSDConversation *)self activitySessionManager];
  unsigned int v8 = [v7 handedOff];

  if (v8 != v3)
  {
    id v9 = [(CSDConversation *)self activitySessionManager];
    [v9 setHandedOff:v3];

    if ((id)[(CSDConversation *)self state] == (id)3)
    {
      if (!v3)
      {
        [(CSDConversation *)self _launchApplicationsForActivitiesIfNecessary];
        return;
      }
      id v10 = [(CSDConversation *)self splitSessionSecondary];

      if (!v10) {
        return;
      }
      id v11 = +[NSURL faceTimeShowInCallUIURL];
      if ([(CSDConversation *)self isVideo])
      {
        TUOpenURL();
      }
      else
      {
        BOOL v14 = +[NSURL faceTimeShowSystemCallControlsURL];

        id v11 = v14;
        TUOpenHomeScreenWithCompletion();
      }
    }
    else
    {
      id v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(CSDConversation *)self UUID];
        int64_t v13 = [(CSDConversation *)self state];
        *(_DWORD *)buf = 138412546;
        id v16 = v12;
        __int16 v17 = 2048;
        int64_t v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring splitSessionSecondary since we aren't joined into the conversation UUID: %@ state: (%tu)", buf, 0x16u);
      }
    }
  }
}

- (int)presentationState
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];
  LODWORD(v3) = [v4 presentationState];

  return (int)v3;
}

- (void)setPresentationState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversation *)self avcSession];
  [v6 setPresentationState:v3];
}

- (void)setPresentationMode:(unint64_t)a3
{
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    id v7 = [(CSDConversation *)self delegate];
    id v6 = [(CSDConversation *)self localParticipant];
    [v7 conversation:self didChangeLocalParticipant:v6 broadcastActivitySession:0];
  }
}

- (CGRect)presentationRect
{
  uint64_t v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];
  [v4 presentationRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversation *)self avcSession];
  objc_msgSend(v9, "setPresentationRect:", x, y, width, height);
}

- (void)setConversationGridDisplayMode:(unint64_t)a3
{
  double v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversation *)self avcSession];
  [v6 setGridDisplayMode:a3];
}

- (void)updateLocalAspectRatios
{
  uint64_t v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  [(CSDConversation *)self localPortraitAspectRatio];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(CSDConversation *)self videoDeviceController];
  objc_msgSend(v8, "setLocalPortraitAspectRatio:localLandscapeAspectRatio:", v5, v7, v7, v5);
}

- (BOOL)isFromStorage
{
  uint64_t v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_fromStorage;
}

- (void)setFromStorage:(BOOL)a3
{
  double v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_fromStorage = a3;
}

- (NSSet)memberIdentifiers
{
  uint64_t v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  memberIdentifiers = self->_memberIdentifiers;

  return memberIdentifiers;
}

- (void)setMemberIdentifiers:(id)a3
{
  id v4 = a3;
  double v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = (NSSet *)[v4 copy];
  memberIdentifiers = self->_memberIdentifiers;
  self->_memberIdentifiers = v6;
}

- (void)addActiveParticipant:(id)a3
{
  id v4 = a3;
  val = self;
  double v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v72 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding active participant: %@", buf, 0xCu);
  }

  if (!_TUIsInternalInstall())
  {
LABEL_11:
    __int16 v17 = [(CSDConversation *)val activeRemoteParticipantsByIdentifier];
    int64_t v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 identifier]);
    id v19 = [v17 objectForKeyedSubscript:v18];

    if ([v4 isLightweight])
    {
      if ([v4 audioVideoMode]) {
        +[CSDCrashReporter simulateCrashReportWithFormat:@"Attempting to add lightweight participant with invalid AVMode. Please file a bug to [FaceTime | (New Bugs)]"];
      }
      [v4 setAudioVideoMode:0];
      long long v20 = [(CSDConversation *)val activeLightweightParticipantsByIdentifier];
      long long v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 identifier]);
      uint64_t v22 = [v20 objectForKeyedSubscript:v21];

      id v19 = (void *)v22;
    }
    __int16 v63 = v19;
    if (v19)
    {
      long long v23 = [v19 avcData];
      id v24 = [v4 avcData];
      if ([v23 isEqual:v24])
      {

        goto LABEL_19;
      }
      unsigned __int8 v25 = [v4 isLightweight];

      if (v25)
      {
LABEL_19:
        v26 = sub_100008DCC();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v27 = [(CSDConversation *)val UUID];
          *(_DWORD *)buf = 138412290;
          id v72 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Conversation already contains participant with no change in AVC data: %@", buf, 0xCu);
        }
LABEL_72:

        [(CSDConversation *)val _removeMemberFromPendingMemberListForParticipant:v4];
        [(CSDConversation *)val _cancelInFlightAVCBlobRecoveryIfNecessary];
        [(CSDConversation *)val _endScreenCallIfNecessary];
        goto LABEL_73;
      }
    }
    if ((id)[(CSDConversation *)val state] == (id)2 || (id)[(CSDConversation *)val state] == (id)3) {
      [(CSDConversation *)val _emitRTCConnectionSetupEventForAddActiveParticipant:v4];
    }
    if ([v4 isLightweight])
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v28 = [(CSDConversation *)val lightweightMembers];
      id v29 = [v28 countByEnumeratingWithState:&v67 objects:v75 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v68;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v68 != v30) {
              objc_enumerationMutation(v28);
            }
            id v32 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            id v33 = [v32 handle];
            unsigned __int8 v34 = [v4 handle];
            unsigned int v35 = [v33 isEquivalentToHandle:v34];

            if (v35)
            {
              unsigned int v36 = sub_100008DCC();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v72 = v32;
                __int16 v73 = 2112;
                id v74 = v4;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Found member: %@ representing participant: %@", buf, 0x16u);
              }

              if ([v32 isLightweightMember])
              {
                id v37 = [v32 lightweightPrimary];
                unsigned int v38 = [(CSDConversation *)val localMember];
                id v39 = [v38 handle];
                if ([v37 isEquivalentToHandle:v39])
                {
                  id v40 = [v32 lightweightPrimaryParticipantIdentifier];
                  LODWORD(v40) = v40 == (id)[(CSDConversation *)val localParticipantIdentifier];

                  if (v40)
                  {
                    CFStringRef v41 = sub_100008DCC();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v72 = v4;
                      __int16 v73 = 2112;
                      id v74 = v32;
                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "AddedParticipant %@ for member: %@ is representing our localMember", buf, 0x16u);
                    }

                    [(CSDConversation *)val setSplitSessionSecondary:v4];
                  }
                }
                else
                {
                }
              }
            }
          }
          id v29 = [v28 countByEnumeratingWithState:&v67 objects:v75 count:16];
        }
        while (v29);
      }

      v42 = [(CSDConversation *)val activeLightweightParticipantsByIdentifier];
      id v43 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 identifier]);
      [v42 setObject:v4 forKeyedSubscript:v43];

      goto LABEL_69;
    }
    if (v19)
    {
      id v44 = sub_100008DCC();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Removing active participant and replacing it with one with the same identifier but a newer AVC data blob.", buf, 2u);
      }

      id v45 = [v4 audioVideoMode];
      if (v45 != [v19 audioVideoMode])
      {
        uint64_t v46 = sub_100008DCC();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "New participant blob's audioVideoMode is different than our current audioVideoMode. AVModeUpdates need to happen with the explicit ParticipantUpdate message. Resetting to known audioVideoMode", buf, 2u);
        }

        objc_msgSend(v4, "setAudioVideoMode:", objc_msgSend(v19, "audioVideoMode"));
      }
      v47 = [(CSDConversation *)val avcSession];
      [v47 removeParticipant:v19];

      goto LABEL_68;
    }
    v48 = [(CSDConversation *)val deviceSupport];
    if ([v48 isGreenTea])
    {
      v49 = [(CSDConversation *)val activeRemoteParticipantsByIdentifier];
      if ([v49 count])
      {
        if ((id)[(CSDConversation *)val state] == (id)2)
        {

          goto LABEL_61;
        }
        BOOL v50 = (id)[(CSDConversation *)val state] == (id)3;

        if (v50)
        {
LABEL_61:
          v51 = [v4 association];
          BOOL v52 = v51 == 0;

          v53 = sub_100008DCC();
          BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
          if (v52)
          {
            if (v54)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[WARN] GreenTea device cannot be in a call with more than one other participant, leaving", buf, 2u);
            }

            long long v58 = +[CSDConversationLeaveContext greenTeaLeaveContext];
            [(CSDConversation *)val leaveUsingContext:v58];
          }
          else
          {
            if (v54)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "GreenTea hand off eligible call, will leave shortly if handoff not completed", buf, 2u);
            }

            objc_initWeak((id *)buf, val);
            v55 = [(CSDConversation *)val serverBag];
            dispatch_time_t v56 = dispatch_time(0, 1000000000 * (void)[v55 greenTeaHandoffTimeout]);
            long long v57 = [(CSDConversation *)val queue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100033830;
            block[3] = &unk_100505558;
            objc_copyWeak(&v66, (id *)buf);
            block[4] = val;
            dispatch_after(v56, v57, block);

            objc_destroyWeak(&v66);
            objc_destroyWeak((id *)buf);
          }
        }
      }
      else
      {
      }
    }
    else
    {
    }
LABEL_68:
    long long v59 = [(CSDConversation *)val activeRemoteParticipantsByIdentifier];
    long long v60 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 identifier]);
    [v59 setObject:v4 forKeyedSubscript:v60];

    [(CSDConversation *)val _addRemoteParticipantToAVCSessionIfPossible:v4];
LABEL_69:
    [(CSDConversation *)val _updateParticipantTypesForAddedParticipant:v4];
    if ([(CSDConversation *)val activeRemoteParticipantCountMinusEligibleAVLess] >= 2)[(CSDConversation *)val setOneToOneModeEnabled:0]; {
    long long v61 = [(CSDConversation *)val activitySessionManager];
    }
    [v61 refreshActivitySessionActiveParticipants];

    [(CSDConversation *)val setServerProvidedParticipantIdentifiers:0];
    [(CSDConversation *)val setServerProvidedLightweightParticipantIdentifiers:0];
    [(CSDConversation *)val refreshActiveParticipantsList];
    CFStringRef v62 = [(CSDConversation *)val serverBag];
    -[CSDConversation setRebroadcastTimeThreshold:](val, "setRebroadcastTimeThreshold:", [v62 rebroadcastTimeThreshold]);

    v26 = [(CSDConversation *)val delegate];
    [v26 conversation:val addedActiveParticipant:v4];
    [v26 conversationChanged:val];
    goto LABEL_72;
  }
  double v7 = +[NSUserDefaults tu_defaults];
  __int16 v63 = [v7 stringForKey:@"DefaultsRemovedURI"];

  id v8 = v63;
  if (!v63) {
    goto LABEL_10;
  }
  id v9 = [v4 handle];
  double v10 = [v9 value];
  unsigned int v11 = [v10 isEqualToString:v63];

  id v8 = v63;
  if (!v11)
  {
LABEL_10:

    goto LABEL_11;
  }
  double v12 = [(CSDConversation *)val remoteMemberHandles];
  double v13 = [v4 handle];
  unsigned __int8 v14 = [v12 containsObject:v13];

  double v15 = sub_100008DCC();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v63;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "User defaults: added to remote member: %@, continue adding active participant", buf, 0xCu);
    }

    id v8 = v63;
    goto LABEL_10;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138412290;
    id v72 = v63;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "User defaults: do not add %@ to participant", buf, 0xCu);
  }

LABEL_73:
}

- (void)removeParticipantsForMember:(id)a3
{
  id v4 = a3;
  double v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(CSDConversation *)self activeParticipants];
  double v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412802;
    id v26 = v4;
    __int16 v27 = 2112;
    long long v28 = v8;
    __int16 v29 = 2112;
    uint64_t v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing participants for member: %@ on conversation UUID: %@ participants: %@", buf, 0x20u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned __int8 v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v15 = objc_msgSend(v14, "handle", (void)v20);
        BOOL v16 = [v4 handle];
        unsigned int v17 = [v15 isEquivalentToHandle:v16];

        if (v17)
        {
          id v18 = [v14 identifier];
          id v19 = [v14 handle];
          [(CSDConversation *)self removeParticipantWithIdentifier:v18 fromHandle:v19 withReason:0];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)setParticipantAudioVideoMode:(unint64_t)a3 presentationMode:(unint64_t)a4 forParticipant:(id)a5
{
  id v8 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [(CSDConversation *)self activeRemoteParticipants];
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      unsigned __int8 v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
      id v15 = [v14 identifier];
      if (v15 == [v8 identifier]) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    BOOL v16 = v14;

    if (!v16) {
      goto LABEL_12;
    }
    [v16 setAudioVideoMode:a3];
    [v16 setPresentationMode:a4];
  }
  else
  {
LABEL_9:

LABEL_12:
    BOOL v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1003A6F38();
    }
  }
}

- (void)updateReportInfoForHandoffParticipant:(id)a3
{
  id v8 = a3;
  if ((id)[(CSDConversation *)self state] == (id)3)
  {
    id v4 = [(CSDConversation *)self addedHandoffParticipants];
    [v4 addObject:v8];

    double v5 = [(CSDConversation *)self startAddingHandoffParticipantToTime];
    double v6 = +[NSDate now];
    double v7 = [v8 handle];
    [v5 setObject:v6 forKey:v7];
  }
}

- (BOOL)allowsScreenSharing
{
  uint64_t v3 = [(CSDConversation *)self featureFlags];
  if ([v3 supportsScreenSharing] && (TUSharePlayForceDisabled() & 1) == 0)
  {
    double v5 = [(CSDConversation *)self audioRoutePolicyManager];
    if ([v5 sharePlaySupported])
    {
      double v6 = [(CSDConversation *)self sharePlaySystemStateObserver];
      unsigned __int8 v4 = [v6 allowScreenSharing];
    }
    else
    {
      unsigned __int8 v4 = 0;
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)removeParticipantWithIdentifier:(unint64_t)a3 fromHandle:(id)a4 withReason:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)buf = 134218498;
    unint64_t v114 = a3;
    __int16 v115 = 2112;
    unint64_t v116 = (unint64_t)v8;
    __int16 v117 = 2112;
    v118 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing participant with identifier: %lu handle: %@ withReason: %@", buf, 0x20u);
  }
  uint64_t v12 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  uint64_t v13 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned __int8 v14 = [v12 objectForKeyedSubscript:v13];

  if (v14) {
    goto LABEL_5;
  }
  id v15 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
  BOOL v16 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned __int8 v14 = [v15 objectForKeyedSubscript:v16];

  if (v14)
  {
LABEL_5:
    v101 = v14;
    long long v17 = [v14 handle];
    unsigned int v18 = [v17 isEqualToHandle:v8];

    long long v19 = sub_100008DCC();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      unint64_t v98 = a5;
      if (v20)
      {
        long long v21 = [v101 handle];
        *(_DWORD *)buf = 134218242;
        unint64_t v114 = a3;
        __int16 v115 = 2112;
        unint64_t v116 = (unint64_t)v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found matching handle %lu: %@", buf, 0x16u);
      }
      long long v22 = [(CSDConversation *)self delegate];
      long long v23 = [(CSDConversation *)self recentlyLeftParticipantIdentifiers];
      id v24 = +[NSNumber numberWithUnsignedLongLong:a3];
      [v23 addObject:v24];

      unint64_t v97 = a3;
      if ([v101 isLightweight])
      {
        unsigned __int8 v25 = [(CSDConversation *)self splitSessionSecondary];

        if (v25 == v101)
        {
          id v39 = sub_100008DCC();
          long long v28 = v101;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v114 = (unint64_t)v101;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Removing splitSessionSecondary: %@", buf, 0xCu);
          }

          [(CSDConversation *)self setSplitSessionSecondary:0];
        }
        else
        {
          id v26 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
          __int16 v27 = +[NSNumber numberWithUnsignedLongLong:a3];
          [v26 setObject:0 forKeyedSubscript:v27];

          long long v28 = v101;
        }
      }
      else
      {
        uint64_t v30 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
        long long v31 = +[NSNumber numberWithUnsignedLongLong:a3];
        [v30 setObject:0 forKeyedSubscript:v31];

        id v32 = [(CSDConversation *)self avcSession];
        [v32 removeParticipant:v101];

        id v33 = [(CSDConversation *)self localMember];
        id v34 = [v33 lightweightPrimaryParticipantIdentifier];

        long long v28 = v101;
        if (v34 == (id)a3)
        {
          unsigned int v35 = sub_100008DCC();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v36 = [(CSDConversation *)self UUID];
            id v37 = [(CSDConversation *)self localMember];
            *(_DWORD *)buf = 138412802;
            unint64_t v114 = (unint64_t)v36;
            __int16 v115 = 2112;
            unint64_t v116 = (unint64_t)v101;
            __int16 v117 = 2112;
            v118 = v37;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Leaving conversation because lightweightPrimary left on conversation UUID: %@ participant: %@ localMember: %@", buf, 0x20u);
          }
          [(CSDConversation *)self leave];
        }
      }
      if ([v28 isScreenEnabled])
      {
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        id v40 = [(CSDConversation *)self activeRemoteParticipants];
        id v41 = [v40 countByEnumeratingWithState:&v107 objects:v112 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v43 = *(void *)v108;
          int v44 = 1;
          do
          {
            for (i = 0; i != v42; i = (char *)i + 1)
            {
              if (*(void *)v108 != v43) {
                objc_enumerationMutation(v40);
              }
              v44 &= [*(id *)(*((void *)&v107 + 1) + 8 * i) isScreenEnabled] ^ 1;
            }
            id v42 = [v40 countByEnumeratingWithState:&v107 objects:v112 count:16];
          }
          while (v42);

          long long v28 = v101;
          if ((v44 & 1) == 0) {
            goto LABEL_37;
          }
        }
        else
        {
        }
        uint64_t v46 = sub_100008DCC();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Removing screen sharing activity sessions since screen sharing participant was removed and no other screen sharing participant is active.", buf, 2u);
        }

        v47 = [(CSDConversation *)self activitySessionManager];
        [v47 removeScreenSharingSessions];
      }
LABEL_37:
      v48 = [(CSDConversation *)self tuActivitySessions];
      [(CSDConversation *)self checkAndSetTUActivityActive:v48];

      v49 = [(CSDConversation *)self featureFlags];
      unsigned int v50 = [v49 sharePlayCanEndWhenInitiatorLeaves];

      if (v50)
      {
        v51 = [(CSDConversation *)self activitySessionParticipantMonitor];
        [v51 evaluateConversation:self];
      }
      BOOL v52 = [(CSDConversation *)self featureFlags];
      unsigned int v53 = [v52 conversationHandoffEnabled];

      if (v53)
      {
        uint64_t v54 = [(CSDConversation *)self localParticipantAssociation];
        if (v54)
        {
          v55 = (void *)v54;
          dispatch_time_t v56 = [(CSDConversation *)self localParticipantAssociation];
          id v57 = [v56 identifier];
          id v58 = [v28 identifier];

          if (v57 == v58)
          {
            long long v59 = sub_100008DCC();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v60 = [(CSDConversation *)self localParticipantIdentifier];
              *(_DWORD *)buf = 134218242;
              unint64_t v114 = v60;
              __int16 v115 = 2112;
              unint64_t v116 = (unint64_t)v28;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Local participant %llu was associated with participant %@ who is now being removed. Clearing local participant association.", buf, 0x16u);
            }

            [(CSDConversation *)self setLocalParticipantAssociation:0];
          }
        }
        uint64_t v94 = v22;
        v95 = self;
        id v96 = v8;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v61 = [(CSDConversation *)self activeRemoteParticipants];
        id v62 = [v61 countByEnumeratingWithState:&v103 objects:v111 count:16];
        if (v62)
        {
          id v63 = v62;
          uint64_t v64 = *(void *)v104;
          v99 = v61;
          uint64_t v100 = *(void *)v104;
          do
          {
            for (j = 0; j != v63; j = (char *)j + 1)
            {
              if (*(void *)v104 != v64) {
                objc_enumerationMutation(v61);
              }
              id v66 = *(void **)(*((void *)&v103 + 1) + 8 * (void)j);
              uint64_t v67 = [v66 association];
              if (v67)
              {
                long long v68 = (void *)v67;
                long long v69 = [v66 association];
                id v70 = [v69 identifier];
                if (v70 != [v28 identifier])
                {

                  continue;
                }
                v71 = [v66 association];
                id v72 = [v71 avcIdentifier];
                if (v72)
                {
                  __int16 v73 = [v66 association];
                  [v73 avcIdentifier];
                  v75 = id v74 = v63;
                  v76 = [v28 avcIdentifier];
                  unsigned __int8 v102 = [v75 isEqualToString:v76];

                  long long v28 = v101;
                  id v63 = v74;

                  long long v61 = v99;
                  uint64_t v64 = v100;

                  if ((v102 & 1) == 0) {
                    continue;
                  }
                }
                else
                {
                }
                v77 = sub_100008DCC();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                {
                  id v78 = [v66 identifier];
                  v79 = (CSDConversation *)[v66 identifier];
                  *(_DWORD *)buf = 134218498;
                  unint64_t v114 = (unint64_t)v78;
                  __int16 v115 = 2112;
                  unint64_t v116 = (unint64_t)v28;
                  __int16 v117 = 2048;
                  v118 = v79;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Remote participant %llu was associated with participant %@ who is now being removed. Clearing participant association for %llu.", buf, 0x20u);
                }

                [v66 setAssociation:0];
              }
            }
            id v63 = [v61 countByEnumeratingWithState:&v103 objects:v111 count:16];
          }
          while (v63);
        }

        self = v95;
        id v8 = v96;
        long long v22 = v94;
      }
      if ((id)[(CSDConversation *)self state] == (id)3)
      {
        [(CSDConversation *)self continueHandoffAudioRouteForIdentifier:v97 participantLeft:1];
        if (v98 == 1)
        {
          v80 = [(CSDConversation *)self removedHandoffParticipants];
          [v80 addObject:v28];
        }
      }
      [v22 conversation:self removedActiveParticipant:v28 withLeaveReason:v98];
      [v22 conversationChanged:self];
      id v81 = [(CSDConversation *)self featureFlags];
      unsigned int v82 = [v81 uPlusNDowngrade];

      if (!v82) {
        goto LABEL_89;
      }
      v83 = [(CSDConversation *)self activeRemoteParticipants];
      if ([v83 count])
      {
        unsigned int v84 = 0;
      }
      else
      {
        v85 = [(CSDConversation *)self remoteMembers];
        if ([v85 count] == (id)1) {
          unsigned int v84 = 0;
        }
        else {
          unsigned int v84 = [(CSDConversation *)self isOneToOneModeEnabled];
        }
      }
      id v86 = [(CSDConversation *)self featureFlags];
      if ([v86 oneToOneFaceTimeMyselfEnabled])
      {
        uint64_t v87 = [(CSDConversation *)self serverBag];
        unsigned int v88 = [v87 isFaceTimeMyselfEnabled];

        if (v88)
        {
          v89 = [(CSDConversation *)self activeRemoteParticipants];
          if (![v89 count])
          {
            v90 = [(CSDConversation *)self remoteMembers];
            if ((unint64_t)[v90 count] > 1)
            {
              unsigned __int8 v91 = [(CSDConversation *)self isOneToOneModeEnabled];

              if ((v91 & 1) == 0) {
                goto LABEL_87;
              }
LABEL_82:
              uint64_t v92 = sub_100008DCC();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
              {
                v93 = [(CSDConversation *)self remoteMembers];
                *(_DWORD *)buf = 138412290;
                unint64_t v114 = (unint64_t)v93;
                _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "No active remote participants left, remoteMembers: %@, requesting to move back to oneToOne=0", buf, 0xCu);
              }
              [(CSDConversation *)self setOneToOneModeEnabled:0];
              goto LABEL_88;
            }
          }
        }
        else if (v84)
        {
          goto LABEL_82;
        }
LABEL_87:
        [(CSDConversation *)self switchBackToOneToOneIfPossibleUsingDelay:1];
LABEL_88:
        long long v28 = v101;
LABEL_89:

        goto LABEL_90;
      }

      if ((v84 & 1) == 0) {
        goto LABEL_87;
      }
      goto LABEL_82;
    }
    long long v28 = v101;
    if (v20)
    {
      __int16 v29 = [v101 handle];
      *(_DWORD *)buf = 138412802;
      unint64_t v114 = (unint64_t)v29;
      __int16 v115 = 2048;
      unint64_t v116 = a3;
      __int16 v117 = 2112;
      v118 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] removeParticipantWithIdentifier:fromHandle: Not removing participant handle (%@) didn't match, with identifier %lu: %@", buf, 0x20u);
    }
  }
  else
  {
    long long v28 = sub_100008DCC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v38 = [(CSDConversation *)self UUID];
      *(_DWORD *)buf = 134218242;
      unint64_t v114 = a3;
      __int16 v115 = 2112;
      unint64_t v116 = (unint64_t)v38;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[WARN] removeParticipantWithIdentifier:fromHandle: Could not find participant with identifier %lu: %@", buf, 0x16u);
    }
  }
LABEL_90:
}

- (void)updateParticipantPresentationContexts:(id)a3
{
  id v4 = a3;
  double v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(CSDConversation *)self avcSession];
  [v6 beginParticipantUpdates];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v10);
        uint64_t v12 = [(CSDConversation *)self avcSession];
        id v13 = [v11 videoQuality];
        unsigned __int8 v14 = [v11 visibility];
        id v15 = [v11 prominence];
        [v11 spatialPosition];
        objc_msgSend(v12, "setVideoQuality:visibility:prominence:spatialPosition:isInCanvas:forParticipantWithIdentifier:", v13, v14, v15, objc_msgSend(v11, "isInCanvas"), objc_msgSend(v11, "participantIdentifier"), v16, v17, v18, v19);

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  BOOL v20 = [(CSDConversation *)self avcSession];
  [v20 commitParticipantUpdates];

  [(CSDConversation *)self setCurrentParticipantPresentationContexts:obj];
}

- (void)addVirtualParticipant:(id)a3
{
  id v4 = a3;
  double v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding virtual participant: %@", (uint8_t *)&v15, 0xCu);
  }

  id v7 = [(CSDConversation *)self virtualParticipantsByPluginName];
  id v8 = [v4 pluginName];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    if (([v9 isEqual:v4] & 1) == 0)
    {
      id v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_1003A6FAC(v4, (uint64_t)self, v10);
      }
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = [(CSDConversation *)self virtualParticipantsByPluginName];
    uint64_t v12 = [v4 pluginName];
    [v11 setObject:v4 forKeyedSubscript:v12];

    id v13 = [(CSDConversation *)self delegate];
    [v13 conversationChanged:self];

    unsigned __int8 v14 = [v4 pluginName];
    LODWORD(v12) = [v14 isEqualToString:@"PubSub"];

    if (v12)
    {
      id v10 = [(CSDConversation *)self activitySessionManager];
      -[NSObject updateVirtualParticipantIdentifier:](v10, "updateVirtualParticipantIdentifier:", [v4 identifier]);
LABEL_9:
    }
  }
}

- (void)removeVirtualParticipant:(id)a3
{
  id v4 = a3;
  double v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing virtual participant: %@", (uint8_t *)&v22, 0xCu);
  }

  id v7 = [(CSDConversation *)self virtualParticipantsByPluginName];
  id v8 = [v4 pluginName];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = [v4 pluginName];
      int v22 = 138412546;
      id v23 = v17;
      __int16 v24 = 2112;
      long long v25 = self;
      double v18 = "[WARN] Could not find virtual participant for plugin %@: %@";
      double v19 = v16;
      uint32_t v20 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, v20);
    }
LABEL_13:

    goto LABEL_14;
  }
  id v10 = [v9 identifier];
  if (v10 != [v4 identifier])
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = [v4 pluginName];
      long long v21 = (CSDConversation *)[v4 identifier];
      int v22 = 138412802;
      id v23 = v17;
      __int16 v24 = 2048;
      long long v25 = v21;
      __int16 v26 = 2112;
      __int16 v27 = self;
      double v18 = "[WARN] Trying to remove virtual participant for plugin %@ with different identifier %llu: %@";
      double v19 = v16;
      uint32_t v20 = 32;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v11 = [(CSDConversation *)self virtualParticipantsByPluginName];
  uint64_t v12 = [v4 pluginName];
  [v11 setObject:0 forKeyedSubscript:v12];

  id v13 = [(CSDConversation *)self delegate];
  [v13 conversationChanged:self];

  unsigned __int8 v14 = [v4 pluginName];
  LODWORD(v12) = [v14 isEqualToString:@"PubSub"];

  if (v12)
  {
    int v15 = [(CSDConversation *)self activitySessionManager];
    [v15 updateVirtualParticipantIdentifier:0];
  }
  [(CSDConversation *)self _registerPluginsIfNecessary];
LABEL_14:
}

- (void)removeRemoteMembers:(id)a3 triggeredLocally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v92 = self;
    __int16 v93 = 1024;
    LODWORD(v94) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "conversation: %@ remove remoteMembers triggeredLocally: %d", buf, 0x12u);
  }

  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412546;
    uint64_t v92 = v10;
    __int16 v93 = 2112;
    id v94 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UUID: %@ remove remoteMembers: %@", buf, 0x16u);
  }
  id v11 = [(CSDConversation *)self remoteMembers];
  id v12 = [v11 mutableCopy];

  id v13 = [(CSDConversation *)self lightweightMembers];
  id v14 = [v13 mutableCopy];

  int v15 = [(CSDConversation *)self remoteMembers];
  id v16 = [v15 mutableCopy];

  double v17 = [(CSDConversation *)self localMember];
  [v16 addObject:v17];

  double v18 = [(CSDConversation *)self lightweightMembers];
  [v16 unionSet:v18];

  if ([v6 count])
  {
    uint64_t v67 = v16;
    BOOL v65 = v4;
    double v19 = [(CSDConversation *)self kickedMembers];
    [v19 setByAddingObjectsFromSet:v6];
    v21 = uint32_t v20 = v12;
    [(CSDConversation *)self setKickedMembers:v21];

    [v20 minusSet:v6];
    uint64_t v64 = v20;
    [(CSDConversation *)self setRemoteMembers:v20];
    [v14 minusSet:v6];
    id v63 = v14;
    id v22 = [v14 copy];
    [(CSDConversation *)self setLightweightMembers:v22];

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v66 = v6;
    id v23 = v6;
    id v24 = [v23 countByEnumeratingWithState:&v83 objects:v90 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v84;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v84 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          __int16 v29 = [(CSDConversation *)self localLightweightSecondaryMember];
          uint64_t v30 = [v29 handle];
          long long v31 = [v28 handle];
          unsigned int v32 = [v30 isEqual:v31];

          if (v32) {
            [(CSDConversation *)self setLocalLightweightSecondaryMember:0];
          }
          [(CSDConversation *)self removeParticipantsForMember:v28];
        }
        id v25 = [v23 countByEnumeratingWithState:&v83 objects:v90 count:16];
      }
      while (v25);
    }

    id v33 = +[NSMutableSet set];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v34 = v23;
    id v35 = [v34 countByEnumeratingWithState:&v79 objects:v89 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v80;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v80 != v37) {
            objc_enumerationMutation(v34);
          }
          id v39 = [*(id *)(*((void *)&v79 + 1) + 8 * (void)j) handle];
          [v33 addObject:v39];
        }
        id v36 = [v34 countByEnumeratingWithState:&v79 objects:v89 count:16];
      }
      while (v36);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = v67;
    id v40 = [obj countByEnumeratingWithState:&v75 objects:v88 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v76;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v76 != v42) {
            objc_enumerationMutation(obj);
          }
          int v44 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
          id v45 = [v44 association];

          if (v45)
          {
            uint64_t v46 = [v44 association];
            v47 = [v46 handle];
            unsigned int v48 = [v33 containsObject:v47];

            if (v48)
            {
              [v44 setAssociation:0];
              [v44 setAssociationVoucher:0];
              [v44 setValidationSource:0];
            }
          }
        }
        id v41 = [obj countByEnumeratingWithState:&v75 objects:v88 count:16];
      }
      while (v41);
    }
    id v62 = v34;

    long long v68 = +[NSMutableDictionary dictionary];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v69 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
    id v49 = [v69 countByEnumeratingWithState:&v71 objects:v87 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v72;
      do
      {
        for (m = 0; m != v50; m = (char *)m + 1)
        {
          if (*(void *)v72 != v51) {
            objc_enumerationMutation(v69);
          }
          uint64_t v53 = *(void *)(*((void *)&v71 + 1) + 8 * (void)m);
          uint64_t v54 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
          v55 = [v54 objectForKeyedSubscript:v53];
          dispatch_time_t v56 = [v55 handle];
          unsigned __int8 v57 = [v33 containsObject:v56];

          if ((v57 & 1) == 0)
          {
            id v58 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
            long long v59 = [v58 objectForKeyedSubscript:v53];
            [v68 setObject:v59 forKeyedSubscript:v53];
          }
        }
        id v50 = [v69 countByEnumeratingWithState:&v71 objects:v87 count:16];
      }
      while (v50);
    }

    [(CSDConversation *)self setPendingConversationParticipantsByIdentifier:v68];
    [(CSDConversation *)self removeActivitySessionIfNecessary];
    unint64_t v60 = [(CSDConversation *)self idsSession];
    [v60 removeMembers:v62 fromExistingMembers:obj activeParticipants:0 triggeredLocally:v65];

    long long v61 = [(CSDConversation *)self delegate];
    [v61 conversationChanged:self];

    id v6 = v66;
    id v16 = v67;
    id v14 = v63;
    id v12 = v64;
  }
  else
  {
    id v33 = sub_100008DCC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v92 = self;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[WARN] No members were removed to conversation: %@", buf, 0xCu);
    }
  }
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 triggeredLocally:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  uint64_t v9 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CSDConversation *)self link];

  if (v10)
  {
    id v10 = +[TUConversationInvitationPreference incomingCallAndNotificationInvitationPreferences];
  }
  [(CSDConversation *)self addRemoteMembers:v11 otherInvitedHandles:v8 invitationPreferences:v10 addingFromLetMeIn:0 triggeredLocally:v5];
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 invitationPreferences:(id)a5 addingFromLetMeIn:(BOOL)a6 triggeredLocally:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v176 = a6;
  id v11 = a3;
  id v171 = a4;
  id v164 = a5;
  id v12 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v12);

  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(CSDConversation *)self UUID];
    int v15 = [(CSDConversation *)self groupUUID];
    *(_DWORD *)buf = 138413058;
    v202 = v14;
    __int16 v203 = 2112;
    id v204 = v15;
    __int16 v205 = 2112;
    id v206 = v11;
    __int16 v207 = 1024;
    BOOL v208 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "addRemoteMembers - UUID: %@ groupUUID: %@ remoteMembers: %@ triggeredLocally: %d", buf, 0x26u);
  }
  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    double v17 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412546;
    v202 = v17;
    __int16 v203 = 2112;
    id v204 = v171;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "addRemoteMembers - UUID: %@ otherInvitedHandles: %@", buf, 0x16u);
  }
  double v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412546;
    v202 = v19;
    __int16 v203 = 2112;
    id v204 = v164;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "addRemoteMembers - UUID: %@ invitationPreferences: %@", buf, 0x16u);
  }
  uint32_t v20 = [(CSDConversation *)self remoteMembers];
  id v170 = [v20 mutableCopy];

  long long v21 = [(CSDConversation *)self remoteMembers];
  id v22 = [v21 mutableCopy];

  id v23 = [(CSDConversation *)self lightweightMembers];
  id v24 = [v23 mutableCopy];

  id v25 = [(CSDConversation *)self localMember];
  unsigned int v26 = [v25 isLightweightMember];

  __int16 v27 = [(CSDConversation *)self localMember];
  long long v168 = v24;
  objc_super v169 = v22;
  if (v26) {
    long long v28 = v24;
  }
  else {
    long long v28 = v22;
  }
  [v28 addObject:v27];

  __int16 v173 = +[NSMutableSet set];
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  id v29 = v11;
  id v30 = [v29 countByEnumeratingWithState:&v193 objects:v200 count:16];
  BOOL v178 = v7;
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v194;
    do
    {
      id v33 = 0;
      do
      {
        if (*(void *)v194 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = *(void **)(*((void *)&v193 + 1) + 8 * (void)v33);
        if (([v34 isLightweightMember] & 1) == 0)
        {
          if (v7)
          {
            id v35 = [(CSDConversation *)self kickedMembers];
            unsigned int v36 = [v35 containsObject:v34];

            if (v36)
            {
              [(CSDConversation *)self _allowMember:v34];
LABEL_33:
              BOOL v7 = v178;
              goto LABEL_34;
            }
          }
          uint64_t v37 = [(CSDConversation *)self remoteMemberHandles];
          unsigned int v38 = [v34 handle];
          unsigned int v39 = [v37 containsObject:v38];

          if (v39) {
            BOOL v40 = !v176;
          }
          else {
            BOOL v40 = 1;
          }
          if (v40)
          {
            if (v39) {
              goto LABEL_30;
            }
          }
          else
          {
            id v41 = sub_100008DCC();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v43 = [v34 handle];
              *(_DWORD *)buf = 138412290;
              v202 = v43;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Handle is part of remoteMembers list, but trying to add them as part of LMI. Allowing this handle to be added: %@", buf, 0xCu);
            }
          }
          int v44 = [(CSDConversation *)self localMember];
          id v45 = [v44 handle];
          uint64_t v46 = [v34 handle];
          unsigned __int8 v47 = [v45 isEquivalentToHandle:v46];

          if (v47)
          {
LABEL_30:
            unsigned int v48 = sub_100008DCC();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              id v49 = [(CSDConversation *)self UUID];
              id v50 = [v34 handle];
              *(_DWORD *)buf = 138412546;
              v202 = v49;
              __int16 v203 = 2112;
              id v204 = v50;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Conversation UUID %@ already contains member with handle %@, filtering out.", buf, 0x16u);
            }
            goto LABEL_33;
          }
          id v51 = [v34 copy];
          [v173 addObject:v51];

          BOOL v7 = v178;
          if ([v34 joinedFromLetMeIn])
          {
            BOOL v52 = [v34 handle];
            uint64_t v53 = [v52 value];
            unsigned __int8 v54 = [v53 destinationIdIsTemporary];

            if ((v54 & 1) == 0)
            {
              v55 = sub_100008DCC();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                dispatch_time_t v56 = [v34 handle];
                *(_DWORD *)buf = 138412290;
                v202 = v56;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Handle %@ should be considered for addition as an invited member handle if not kicked", buf, 0xCu);
              }
              unsigned __int8 v57 = [(CSDConversation *)self memberHandlesAwaitingInvitesToLink];
              id v58 = [v34 handle];
              [v57 addObject:v58];
            }
          }
          uint64_t v59 = [(CSDConversation *)self link];
          if (v59)
          {
            unint64_t v60 = (void *)v59;
            long long v61 = [(CSDConversation *)self pendingMembers];
            unsigned int v62 = [v61 containsObject:v34];

            if (v62)
            {
              id v63 = sub_100008DCC();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v202 = v34;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "addRemoteMembers, remove pending member: %@", buf, 0xCu);
              }

              uint64_t v64 = +[NSSet setWithObject:v34];
              [(CSDConversation *)self removePendingMembers:v64 triggeredLocally:v178];
            }
          }
          uint64_t v65 = [(CSDConversation *)self link];
          if (v65)
          {
            id v66 = (void *)v65;
            uint64_t v67 = [(CSDConversation *)self pendingRemoteMembers];
            unsigned int v68 = [v67 containsObject:v34];

            if (v68)
            {
              id v69 = sub_100008DCC();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                id v70 = [(CSDConversation *)self pendingRemoteMembers];
                *(_DWORD *)buf = 138412546;
                v202 = v34;
                __int16 v203 = 2112;
                id v204 = v70;
                _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "addRemoteMembers, remove pending remote member: %@ from: %@", buf, 0x16u);
              }
              long long v71 = [(CSDConversation *)self pendingRemoteMembers];
              [v71 removeObject:v34];
            }
          }
        }
LABEL_34:
        id v33 = (char *)v33 + 1;
      }
      while (v31 != v33);
      id v72 = [v29 countByEnumeratingWithState:&v193 objects:v200 count:16];
      id v31 = v72;
    }
    while (v72);
  }

  long long v73 = +[NSMutableSet set];
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v74 = [(CSDConversation *)self lightweightMembers];
  id v75 = [v74 countByEnumeratingWithState:&v189 objects:v199 count:16];
  if (v75)
  {
    id v76 = v75;
    uint64_t v77 = *(void *)v190;
    do
    {
      for (i = 0; i != v76; i = (char *)i + 1)
      {
        if (*(void *)v190 != v77) {
          objc_enumerationMutation(v74);
        }
        [v73 addObject:*(void *)(*((void *)&v189 + 1) + 8 * i)];
      }
      id v76 = [v74 countByEnumeratingWithState:&v189 objects:v199 count:16];
    }
    while (v76);
  }

  v172 = +[NSMutableSet set];
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id obj = v29;
  id v79 = [obj countByEnumeratingWithState:&v185 objects:v198 count:16];
  __int16 v175 = v73;
  if (v79)
  {
    id v80 = v79;
    uint64_t v81 = *(void *)v186;
    do
    {
      for (j = 0; j != v80; j = (char *)j + 1)
      {
        if (*(void *)v186 != v81) {
          objc_enumerationMutation(obj);
        }
        long long v83 = *(void **)(*((void *)&v185 + 1) + 8 * (void)j);
        if ([v83 isLightweightMember])
        {
          long long v84 = [v83 handle];
          if ([v73 containsObject:v84])
          {

LABEL_68:
            v89 = sub_100008DCC();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              v90 = [(CSDConversation *)self UUID];
              unsigned __int8 v91 = [v83 handle];
              *(_DWORD *)buf = 138412546;
              v202 = v90;
              __int16 v203 = 2112;
              id v204 = v91;
              _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Conversation UUID %@ already contains member with handle %@, filtering out.", buf, 0x16u);
            }
          }
          else
          {
            long long v85 = [(CSDConversation *)self localMember];
            long long v86 = [v85 handle];
            uint64_t v87 = [v83 handle];
            unsigned __int8 v88 = [v86 isEquivalentToHandle:v87];

            long long v73 = v175;
            if (v88) {
              goto LABEL_68;
            }
            uint64_t v92 = [v83 copy];
            v89 = v92;
            if (v178)
            {
              [v92 setValidationSource:1];
              __int16 v93 = [(CSDConversation *)self localMember];
              id v94 = [v93 handle];
              [v89 setLightweightPrimary:v94];

              [v89 setLightweightPrimaryParticipantIdentifier:[(CSDConversation *)self localParticipantIdentifier]];
              [(CSDConversation *)self setLocalLightweightSecondaryMember:v89];
            }
            [v172 addObject:v89];
          }

          continue;
        }
      }
      id v80 = [obj countByEnumeratingWithState:&v185 objects:v198 count:16];
    }
    while (v80);
  }

  if ([v173 count] || objc_msgSend(v171, "count") || objc_msgSend(v172, "count"))
  {
    v95 = [(CSDConversation *)self activitySessions];
    id v96 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v95, "count"));
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    unint64_t v97 = v95;
    id v98 = [v97 countByEnumeratingWithState:&v181 objects:v197 count:16];
    if (v98)
    {
      id v99 = v98;
      uint64_t v100 = *(void *)v182;
      do
      {
        for (k = 0; k != v99; k = (char *)k + 1)
        {
          if (*(void *)v182 != v100) {
            objc_enumerationMutation(v97);
          }
          unsigned __int8 v102 = *(void **)(*((void *)&v181 + 1) + 8 * (void)k);
          long long v103 = [v102 activity];
          unsigned __int8 v104 = [v103 isStaticActivity];

          if ((v104 & 1) == 0)
          {
            long long v105 = +[CSDMessagingConversationActivitySession activitySessionWithCSDConversationActivitySession:v102 fromConversation:self forStorage:0];
            [v96 addObject:v105];
          }
        }
        id v99 = [v97 countByEnumeratingWithState:&v181 objects:v197 count:16];
      }
      while (v99);
    }

    long long v106 = [(CSDConversation *)self stagedActivitySession];
    if (v106)
    {
      long long v107 = [(CSDConversation *)self stagedActivitySession];
      id v108 = +[CSDMessagingConversationActivitySession activitySessionWithTUConversationActivitySession:v107 fromConversation:self forStorage:0];
    }
    else
    {
      id v108 = 0;
    }

    [v170 unionSet:v173];
    [(CSDConversation *)self setRemoteMembers:v170];
    long long v109 = [(CSDConversation *)self otherInvitedHandles];
    long long v110 = +[NSMutableSet setWithSet:v109];

    [v110 unionSet:v171];
    id v156 = v110;
    [(CSDConversation *)self setOtherInvitedHandles:v110];
    v111 = [(CSDConversation *)self lightweightMembers];
    v112 = +[NSMutableSet setWithSet:v111];

    [v112 unionSet:v172];
    v155 = v112;
    [(CSDConversation *)self setLightweightMembers:v112];
    if (v178)
    {
      v113 = [(CSDConversation *)self activeRemoteParticipants];
      id v114 = [v113 mutableCopy];

      __int16 v115 = [(CSDConversation *)self activeLightweightParticipants];
      [v114 unionSet:v115];

      unint64_t v116 = [(CSDConversation *)self idsSession];
      unsigned int v117 = [v116 isJoined];

      if (v117)
      {
        v118 = [(CSDConversation *)self localCSDConversationParticipant];
        [v114 addObject:v118];
      }
    }
    else
    {
      id v114 = 0;
    }
    id v119 = v173;
    [v119 unionSet:v172];
    id v120 = v169;
    [v120 unionSet:v168];
    v121 = +[NSMutableArray array];
    uint64_t v122 = v121;
    if (v176) {
      [v121 addObject:IDSRegistrationPropertySupportsModernGFT];
    }
    long long v166 = v122;
    v123 = [(CSDConversation *)self featureFlags];
    id v174 = v114;
    long long v167 = v120;
    if ([v123 uPlusNDowngrade])
    {

      uint64_t v124 = v164;
    }
    else
    {
      v125 = (char *)[v120 count];
      v126 = &v125[(void)[v119 count]];

      BOOL v127 = (unint64_t)v126 >= 2;
      uint64_t v124 = v164;
      if (v127) {
        [(CSDConversation *)self setOneToOneModeEnabled:0];
      }
    }
    unsigned int v128 = [(CSDConversation *)self highlightIdentifiers];
    uint64_t v129 = [v128 anyObject];

    id v157 = [(CSDConversation *)self avMode];
    id v130 = [(CSDConversation *)self localMember];
    id v154 = v119;
    long long v165 = (void *)v129;
    if (([v130 isLightweightMember] & 1) == 0)
    {
      v131 = [(CSDConversation *)self localMember];
      uint64_t v132 = [v131 association];
      if (v132)
      {
        v133 = (void *)v132;
        id v134 = [(CSDConversation *)self localMember];
        id v135 = [v134 association];
        if ([v135 isPrimary])
        {
          [(CSDConversation *)self localMember];
          v136 = id v158 = v134;
          [v136 association];
          BOOL v137 = v160 = v131;
          id v162 = [v137 type];

          if (v162 != (id)2)
          {
LABEL_114:
            id v163 = [(CSDConversation *)self idsSession];
            id v161 = [(CSDConversation *)self link];
            id v159 = [(CSDConversation *)self otherInvitedHandles];
            v144 = [(CSDConversation *)self report];
            id v145 = v124;
            if (!v124)
            {
              id v145 = [(CSDConversation *)self invitationPreferences];
            }
            id v146 = [v166 copy];
            id v147 = [(CSDConversation *)self messagesGroupUUID];
            id v148 = [(CSDConversation *)self messagesGroupName];
            BYTE1(v153) = v178;
            LOBYTE(v153) = v176;
            objc_msgSend(v163, "addMembers:toExistingMembers:activeParticipants:activitySessions:link:otherInvitedHandles:report:invitationPreferences:requiredCapabilities:messagesGroupUUID:messagesGroupName:addingFromLetMeIn:triggeredLocally:highlightIdentifier:stagedActivitySession:avMode:", v154, v167, v174, v96, v161, v159, v144, v145, v146, v147, v148, v153, v165, v108, v157);

            if (!v124) {
            id v149 = [(CSDConversation *)self applicationLaunchPolicyManager];
            }
            id v150 = [(CSDConversation *)self tuConversation];
            [v149 updateAllowedHandlesForConversation:v150];

            id v151 = [(CSDConversation *)self delegate];
            [v151 conversation:self addedMembers:v154 triggeredLocally:v178];

            [(CSDConversation *)self _endScreenCallIfNecessary];
            goto LABEL_119;
          }
          id v138 = [(CSDConversation *)self localMember];
          id v139 = [v138 association];
          id v140 = [v139 handle];

          id v141 = [(CSDConversation *)self activeRemoteParticipants];
          v179[0] = _NSConcreteStackBlock;
          v179[1] = 3221225472;
          v179[2] = sub_100036B48;
          v179[3] = &unk_100505580;
          id v180 = v140;
          id v130 = v140;
          id v142 = objc_msgSend(v141, "tu_anyObjectPassingTest:", v179);

          if (v142)
          {
            id v143 = sub_100008DCC();
            if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "Updating avMode and invitationPreferences for member addition to match the associated participant", buf, 2u);
            }

            id v157 = [v142 audioVideoMode];
          }

          v131 = v180;
        }
        else
        {
        }
      }
    }
    goto LABEL_114;
  }
  unint64_t v97 = sub_100008DCC();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    id v152 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412290;
    v202 = v152;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "[WARN] No new members were added to conversation UUID: %@", buf, 0xCu);
  }
  uint64_t v124 = v164;
LABEL_119:
}

- (void)updateMemberValidationSource:(id)a3 source:(int64_t)a4
{
  id v34 = a3;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v49 = v34;
    __int16 v50 = 2048;
    int64_t v51 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating member validation source for: %@ to source: %ld", buf, 0x16u);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v33 = self;
  id v8 = [(CSDConversation *)self lightweightMembers];
  id v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (!v9)
  {
LABEL_11:

    goto LABEL_31;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v43;
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v43 != v11) {
      objc_enumerationMutation(v8);
    }
    id v13 = *(NSObject **)(*((void *)&v42 + 1) + 8 * v12);
    id v14 = [v13 handle];
    int v15 = [v34 handle];
    unsigned int v16 = [v14 isEquivalentToHandle:v15];

    if (v16) {
      break;
    }
    if (v10 == (id)++v12)
    {
      id v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (!v10) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
  }
  double v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found member to update validation state: %@", buf, 0xCu);
  }

  double v18 = v13;
  if (!v18)
  {
LABEL_31:
    double v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1003A7074();
    }
    goto LABEL_33;
  }
  [v18 setValidationSource:a4];
  id v35 = [v18 lightweightPrimary];
  if (!v35) {
    goto LABEL_30;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(CSDConversation *)v33 activitySessions];
  id v19 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (!v19) {
    goto LABEL_29;
  }
  id v20 = v19;
  uint64_t v37 = *(void *)v39;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v39 != v37) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      id v23 = [v22 activity];
      uint64_t v24 = [v23 trustedFromHandle];
      if (v24)
      {
        id v25 = (void *)v24;
        unsigned int v26 = [v22 activity];
        __int16 v27 = [v26 trustedFromHandle];
        [v18 handle];
        v29 = long long v28 = v18;
        unsigned int v30 = [v27 isEquivalentToHandle:v29];

        double v18 = v28;
        if (!v30) {
          continue;
        }
        id v31 = sub_100008DCC();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v28;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "We found an activity originated from now validated member %@ updating activity", buf, 0xCu);
        }

        id v23 = [v22 activity];
        [v23 setTrustedFromHandle:v35];
      }
    }
    id v20 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  }
  while (v20);
LABEL_29:

LABEL_30:
  uint64_t v32 = [(CSDConversation *)v33 delegate];
  [v32 conversationChanged:v33];

LABEL_33:
}

- (void)updateMessagesGroupName:(id)a3
{
  [(CSDConversation *)self setMessagesGroupName:a3];
  id v4 = [(CSDConversation *)self delegate];
  [v4 conversationChanged:self];
}

- (void)addPendingMembers:(id)a3 triggeredLocally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v43 = v6;
    __int16 v44 = 1024;
    LODWORD(v45) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "add pendingMembers: %@ triggeredLocally: %d", buf, 0x12u);
  }

  id v9 = [(CSDConversation *)self pendingMembers];
  id v34 = [v9 mutableCopy];

  id v10 = [(CSDConversation *)self pendingMemberHandles];
  id v36 = [v10 mutableCopy];

  id v35 = +[NSMutableSet set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned int v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v17 = [v16 handle];
        if (!v17) {
          goto LABEL_10;
        }
        double v18 = (void *)v17;
        id v19 = [(CSDConversation *)self pendingMemberHandles];
        id v20 = [v16 handle];
        unsigned __int8 v21 = [v19 containsObject:v20];

        if ((v21 & 1) == 0)
        {
          id v25 = objc_alloc((Class)TUConversationMember);
          unsigned int v26 = [v16 handle];
          __int16 v27 = [v16 nickname];
          id v28 = [v25 initWithHandle:v26 nickname:v27];
          [v35 addObject:v28];

          id v22 = [v16 handle];
          [v36 addObject:v22];
        }
        else
        {
LABEL_10:
          id v22 = sub_100008DCC();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [(CSDConversation *)self UUID];
            uint64_t v24 = [v16 handle];
            *(_DWORD *)buf = 138412546;
            id v43 = v23;
            __int16 v44 = 2112;
            long long v45 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Conversation UUID %@ already contains pending member with handle %@, filtering out from addition list.", buf, 0x16u);
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v13);
  }

  [v34 unionSet:v35];
  id v29 = [v34 copy];
  [(CSDConversation *)self setPendingMembers:v29];

  id v30 = [v36 copy];
  [(CSDConversation *)self setPendingMemberHandles:v30];

  if ([v35 count])
  {
    id v31 = +[TUCallCenter sharedInstance];
    uint64_t v32 = [v31 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003743C;
    block[3] = &unk_100504EC0;
    block[4] = self;
    dispatch_async(v32, block);
  }
  id v33 = [(CSDConversation *)self delegate];
  [v33 conversationChanged:self];
}

- (BOOL)shouldRespondToLetMeInRequestForMember:(id)a3
{
  id v4 = a3;
  if ([v4 isLightweightMember])
  {
    BOOL v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      id v6 = "No need to add lightweight member to the session";
      BOOL v7 = v5;
      uint32_t v8 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v22, v8);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v9 = [(CSDConversation *)self pendingMemberHandles];
  id v10 = [v4 handle];
  unsigned __int8 v11 = [v9 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    BOOL v5 = sub_100008DCC();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v14 = [(CSDConversation *)self pendingMemberHandles];
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 2112;
    id v25 = v14;
    int v15 = "member: %@ is not in pendingMemberHandles: %@";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v22, 0x16u);

    goto LABEL_12;
  }
  id v12 = [v4 handle];
  id v13 = [(CSDConversation *)self remoteMemberForHandle:v12];

  if (v13)
  {
    BOOL v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v4;
      id v6 = "member: %@ is in remoteMemberForHandle";
      BOOL v7 = v5;
      uint32_t v8 = 12;
      goto LABEL_8;
    }
LABEL_12:
    BOOL v16 = 0;
    goto LABEL_13;
  }
  double v18 = [(CSDConversation *)self pendingRemoteMembers];
  uint64_t v19 = [v18 containsObject:v4];

  if ((v19 & 1) == 0)
  {
    BOOL v5 = sub_100008DCC();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v14 = [(CSDConversation *)self pendingRemoteMembers];
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 2112;
    id v25 = v14;
    int v15 = "member: %@ is not in pendingRemoteMembers: %@";
    goto LABEL_11;
  }
  id v20 = [(CSDConversation *)self pendingRemoteMembers];
  [v20 removeObject:v4];

  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v21 = [(CSDConversation *)self pendingRemoteMembers];
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 2112;
    id v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Get matching memeber: %@ current pendingRemoteMembers: %@", (uint8_t *)&v22, 0x16u);
  }
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (void)removePendingMembers:(id)a3 triggeredLocally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  uint32_t v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v39 = v6;
    __int16 v40 = 1024;
    LODWORD(v41) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "removePendingMembers: %@ triggeredLocally: %d", buf, 0x12u);
  }

  id v9 = [(CSDConversation *)self pendingMemberHandles];
  id v33 = [v9 mutableCopy];

  id v10 = +[NSMutableSet set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v35;
    *(void *)&long long v13 = 138412546;
    long long v32 = v13;
    do
    {
      BOOL v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v16);
        double v18 = [(CSDConversation *)self pendingMemberHandles];
        uint64_t v19 = [v17 handle];
        unsigned int v20 = [v18 containsObject:v19];

        if (v20)
        {
          id v21 = objc_alloc((Class)TUConversationMember);
          int v22 = [v17 handle];
          id v23 = [v17 nickname];
          id v24 = [v21 initWithHandle:v22 nickname:v23];
          [v10 addObject:v24];

          id v25 = [v17 handle];
          [v33 removeObject:v25];
        }
        else
        {
          id v25 = sub_100008DCC();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v26 = [(CSDConversation *)self UUID];
            __int16 v27 = [v17 handle];
            *(_DWORD *)buf = v32;
            id v39 = v26;
            __int16 v40 = 2112;
            long long v41 = v27;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Conversation with UUID %@ does not have pending member with handle %@, filtering out from removal list.", buf, 0x16u);
          }
        }

        BOOL v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v14);
  }

  id v28 = [(CSDConversation *)self pendingMembers];
  id v29 = [v28 mutableCopy];

  [v29 minusSet:v10];
  id v30 = [v29 copy];
  [(CSDConversation *)self setPendingMembers:v30];

  id v31 = [v33 copy];
  [(CSDConversation *)self setPendingMemberHandles:v31];
}

- (BOOL)setConversationLink:(id)a3 allowUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(CSDConversation *)self link];
  if (v7) {
    BOOL v8 = v4;
  }
  else {
    BOOL v8 = 1;
  }

  if (v8)
  {
    id v9 = [(CSDConversation *)self link];

    if (!v9 || !v4)
    {
      id v21 = [v6 copy];
      [(CSDConversation *)self setLink:v21];
      goto LABEL_14;
    }
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(CSDConversation *)self UUID];
      id v12 = [(CSDConversation *)self link];
      long long v13 = [v6 linkName];
      id v14 = [v6 expirationDate];
      uint64_t v15 = [v6 invitedMemberHandles];
      int v24 = 138413314;
      id v25 = v11;
      __int16 v26 = 2112;
      __int16 v27 = v12;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Link on conversation UUID %@ was already set to %@, but this setting allows for updates, setting the link name to %@, the expiration date to %@, and the invited handles to %@", (uint8_t *)&v24, 0x34u);
    }
    BOOL v16 = [v6 linkName];
    uint64_t v17 = [(CSDConversation *)self link];
    [v17 setLinkName:v16];

    double v18 = [v6 expirationDate];
    id v19 = [v18 copy];
    unsigned int v20 = [(CSDConversation *)self link];
    [v20 setExpirationDate:v19];

    id v21 = [v6 invitedMemberHandles];
    int v22 = [(CSDConversation *)self link];
    [v22 setInvitedMemberHandles:v21];
    goto LABEL_12;
  }
  id v21 = sub_100008DCC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = [(CSDConversation *)self link];
    int v24 = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    __int16 v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring new link %@ as conversation link already set to %@", (uint8_t *)&v24, 0x16u);
LABEL_12:
  }
LABEL_14:

  return v8;
}

- (void)addScreenSharingRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversation *)self screenSharingRequestsByUUID];
  BOOL v7 = [v4 UUID];
  [v6 setObject:v4 forKeyedSubscript:v7];

  id v8 = [(CSDConversation *)self delegate];
  [v8 conversationChanged:self];
}

- (void)removeScreenSharingRequest:(id)a3
{
  id v10 = a3;
  id v4 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = [(CSDConversation *)self screenSharingRequests];
  unsigned int v6 = [v5 containsObject:v10];

  if (v6)
  {
    BOOL v7 = [(CSDConversation *)self screenSharingRequestsByUUID];
    id v8 = [v10 UUID];
    [v7 setObject:0 forKeyedSubscript:v8];

    id v9 = [(CSDConversation *)self delegate];
    [v9 conversationChanged:self];
  }
}

- (void)fulfillLocalScreenShareRequests
{
  uint64_t v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSMutableSet set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v5 = [(CSDConversation *)self screenSharingRequestsByUUID];
  unsigned int v6 = [v5 allKeys];

  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v10);
        id v12 = [(CSDConversation *)self screenSharingRequestsByUUID];
        long long v13 = [v12 objectForKeyedSubscript:v11];

        if ([v13 type] == (id)4) {
          [v4 addObject:v13];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v8);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      double v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v18);
        unsigned int v20 = [(CSDConversation *)self screenSharingRequestsByUUID];
        id v21 = [v19 UUID];
        [v20 setObject:0 forKeyedSubscript:v21];

        double v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v16);
  }

  int v22 = sub_100008DCC();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v14;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fulfilled screen sharing requests %@", buf, 0xCu);
  }

  if ([v14 count])
  {
    id v23 = [(CSDConversation *)self delegate];
    [v23 conversationChanged:self];
  }
}

- (void)fulfillPendingScreenSharingRequestsForRemoteParticipant:(id)a3
{
  id v28 = a3;
  id v4 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = +[NSMutableSet set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unsigned int v6 = [(CSDConversation *)self screenSharingRequestsByUUID];
  id v7 = [v6 allKeys];

  id v8 = [v7 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v11);
        long long v13 = [(CSDConversation *)self screenSharingRequestsByUUID];
        id v14 = [v13 objectForKeyedSubscript:v12];

        if ([v14 type] == (id)1)
        {
          id v15 = [v14 handle];
          id v16 = [v28 handle];
          unsigned int v17 = [v15 isEqualToHandle:v16];

          if (v17) {
            [v5 addObject:v14];
          }
        }

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v5;
  id v19 = [v18 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      int v22 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v22);
        long long v24 = [(CSDConversation *)self screenSharingRequestsByUUID];
        long long v25 = [v23 UUID];
        [v24 setObject:0 forKeyedSubscript:v25];

        int v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v20);
  }

  long long v26 = sub_100008DCC();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v18;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Fulfilled remote screen sharing requests %@", buf, 0xCu);
  }

  if ([v18 count])
  {
    long long v27 = [(CSDConversation *)self delegate];
    [v27 conversationChanged:self];
  }
}

- (void)leaveActivitySessionWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "leaveActivitySessionWithUUID: %@", (uint8_t *)&v8, 0xCu);
  }

  if ([(CSDConversation *)self _expanseEnabled])
  {
    id v7 = [(CSDConversation *)self activitySessionManager];
    [v7 leaveActivitySessionWithUUID:v4];
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping request to remove activitySession because Expanse features are disabled. Please enable the \"expanseEnabled\" feature flag in TelephonyUtilities.", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finding activitySession with UUID: %@ to present dismissal alert", buf, 0xCu);
  }

  id v7 = [(CSDConversation *)self activitySessionManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000387E0;
  v9[3] = &unk_1005055A8;
  id v10 = v4;
  id v8 = v4;
  [v7 presentSessionDismissalAlertForActivitySessionUUID:v8 allowingCancellation:1 completionHandler:v9];
}

- (void)removeActivitySessionWithUUID:(id)a3 usingTerminatingHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "removeActivitySessionWithUUID: %@", (uint8_t *)&v11, 0xCu);
  }

  if ([(CSDConversation *)self _expanseEnabled])
  {
    id v10 = [(CSDConversation *)self activitySessionManager];
    [v10 removeActivitySessionWithUUID:v6 usingHandle:v7];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping request to remove activitySession because Expanse features are disabled. Please enable the \"expanseEnabled\" feature flag in TelephonyUtilities.", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)_launchApplicationDueToActivityCreation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 activity];
  unsigned __int8 v6 = [v5 isScreenSharingActivity];

  if (v6)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not launching screen sharing app", buf, 2u);
    }

    id v8 = [(CSDConversation *)self audioRoutePolicyManager];
    unsigned __int8 v9 = [v8 sharePlaySupported];

    if ((v9 & 1) == 0)
    {
      id v10 = [v4 activity];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      _DWORD v11[2] = sub_100038B40;
      v11[3] = &unk_100504EC0;
      v11[4] = self;
      [(CSDConversation *)self postUserNotificationForUnsupportedScreenSharingActivity:v10 alternateReponseHandler:v11];
    }
  }
  else
  {
    [(CSDConversation *)self _launchApplicationForActivityIfNecessary:v4];
  }
}

- (id)createActivitySession:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 138412290;
    id v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "activitySession: %@", (uint8_t *)&v40, 0xCu);
  }

  if (TUSharePlayForceDisabled())
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      id v8 = "[WARN] Dropping new activitySession because Expanse features are disabled. Please upgrade to a later release "
           "to re-enable Expanse features.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v40, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (![(CSDConversation *)self _expanseEnabled])
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      id v8 = "[WARN] Dropping new activitySession because Expanse features are disabled. Please enable the \"expanseEnabled"
           "\" feature flag in TelephonyUtilities.";
      goto LABEL_15;
    }
LABEL_16:
    id v16 = 0;
    goto LABEL_49;
  }
  id v7 = [v4 activity];
  unsigned __int8 v9 = [(CSDConversation *)self serverBag];
  id v10 = [v7 activityIdentifier];
  int v11 = [v9 localBundleIDForActivityIdentifier:v10];

  id v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 138412290;
    id v41 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BundleID override: %@", (uint8_t *)&v40, 0xCu);
  }

  if (v11) {
    [v7 setBundleIdentifier:v11];
  }
  long long v13 = [v7 trustedFromHandle];
  if (v13)
  {
    id v14 = [v7 trustedFromHandle];
    id v15 = [(CSDConversation *)self memberWithHandle:v14];
  }
  else
  {
    id v15 = 0;
  }

  unsigned int v17 = [v15 association];
  if (v15)
  {
    if ([v15 isLightweightMember]
      && [v15 isValidated]
      && ([v15 lightweightPrimary],
          id v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          v18))
    {
      id v19 = sub_100008DCC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v7 trustedFromHandle];
        uint64_t v21 = [v15 lightweightPrimary];
        int v40 = 138412802;
        id v41 = v20;
        __int16 v42 = 2112;
        id v43 = v15;
        __int16 v44 = 2112;
        long long v45 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting to create Activity with trustedFromHandle: %@ on trusted lightweight member: %@. Overriding to lightweightPrimary. %@", (uint8_t *)&v40, 0x20u);
      }
      int v22 = [v15 lightweightPrimary];
      id v23 = [v22 copy];
      [v7 setTrustedFromHandle:v23];
    }
    else
    {
      if (!v17 || ([v17 isPrimary] & 1) != 0 || objc_msgSend(v17, "type") != (id)2) {
        goto LABEL_32;
      }
      long long v24 = [v17 handle];
      int v22 = [(CSDConversation *)self memberWithHandle:v24];

      long long v25 = sub_100008DCC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        long long v26 = [v7 trustedFromHandle];
        long long v27 = [v22 handle];
        int v40 = 138412802;
        id v41 = v26;
        __int16 v42 = 2112;
        id v43 = v22;
        __int16 v44 = 2112;
        long long v45 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Attempting to create Activity with trustedFromHandle: %@ on trusted associated member: %@. Overriding to associated member. %@", (uint8_t *)&v40, 0x20u);
      }
      id v23 = [v22 handle];
      id v28 = [v23 copy];
      [v7 setTrustedFromHandle:v28];
    }
  }
LABEL_32:
  long long v29 = [(CSDConversation *)self localMember];
  if ([v29 isLightweightMember])
  {
    long long v30 = [v29 lightweightPrimary];
    if (v30)
    {
      long long v31 = [v7 originator];
      objc_msgSend(v4, "setIsLightweightPrimaryInitiated:", objc_msgSend(v31, "isEquivalentToHandle:", v30));
    }
    else
    {
      [v4 setIsLightweightPrimaryInitiated:0];
    }
  }
  long long v32 = sub_100008DCC();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v33 = [v4 isLightweightPrimaryInitiated];
    int v40 = 67109120;
    LODWORD(v41) = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "isLightweightPrimaryInitiated: %d", (uint8_t *)&v40, 8u);
  }

  long long v34 = [(CSDConversation *)self activitySessionManager];
  id v16 = [v34 createActivitySessionWithTuActivitySession:v4];

  if (v16)
  {
    if (([v7 isSystemActivity] & 1) == 0) {
      [(CSDConversation *)self setStagedActivitySession:0];
    }
    [(CSDConversation *)self _registerPluginsIfNecessary];
    if ([v4 isLocallyInitiated])
    {
      long long v35 = sub_100008DCC();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        long long v36 = [v16 tuConversationActivitySession];
        int v40 = 138412290;
        id v41 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Not launching app for locally started activity %@", (uint8_t *)&v40, 0xCu);
      }
    }
    else
    {
      [(CSDConversation *)self _launchApplicationDueToActivityCreation:v16];
    }
    long long v37 = [(CSDConversation *)self activitySessionManager];
    id v38 = [v16 tuConversationActivitySession];
    [(CSDConversation *)self activitySessionManager:v37 activitySessionChanged:v38];

    [(CSDConversation *)self postSharePlayActivityDidChangeNotificationIfNecessary:v4];
  }

LABEL_49:

  return v16;
}

- (void)setUsingAirplay:(BOOL)a3 forActivitySessionUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversation *)self activitySessionManager];
  [v7 setUsingAirplay:v4 forActivitySessionWithUUID:v6];
}

- (void)resetActivitySessionSceneAssociationsForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self activitySessionManager];
  [v5 resetSceneAssociationsForBundleID:v4];
}

- (id)createStagedActivitySessionForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to create staged activitySession for activity: %@", (uint8_t *)&v20, 0xCu);
  }

  id v7 = [(CSDConversation *)self activitySessions];
  id v8 = [v7 count];

  if (!v8)
  {
    int v11 = +[IDSCurrentServerTime sharedInstance];
    id v12 = [v11 currentServerTimeDate];

    [v4 setTimestamp:v12];
    long long v13 = [v4 metadata];
    [v13 saveImageToDisk];

    id v14 = [objc_alloc((Class)TUConversationActivitySession) initWithActivity:v4 locallyInitiated:1 timestamp:v12 isFirstJoin:1];
    if ([v4 startWhenStaged])
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping staging activity %@", (uint8_t *)&v20, 0xCu);
      }

      id v16 = [(CSDConversation *)self activitySessionManager];
      id v17 = [v16 createActivitySessionWithTuActivitySession:v14];
    }
    else
    {
      if (![(CSDConversation *)self setStagedActivitySessionForActivitySession:v14])
      {
LABEL_16:
        unsigned __int8 v9 = v14;

        id v10 = v9;
        goto LABEL_17;
      }
      id v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully created staged activitySession: %@", (uint8_t *)&v20, 0xCu);
      }

      id v16 = [(CSDConversation *)self delegate];
      [v16 conversationChanged:self];
    }

    goto LABEL_16;
  }
  unsigned __int8 v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to create staged activitySession since we can't replace an activitySession with a staged activitySession.", (uint8_t *)&v20, 2u);
  }
  id v10 = 0;
LABEL_17:

  return v10;
}

- (BOOL)setStagedActivitySessionForActivitySession:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to set staged activitySession: %@", (uint8_t *)&v16, 0xCu);
  }

  id v7 = [(CSDConversation *)self activitySessions];
  id v8 = [v7 count];

  if (v8)
  {
    unsigned __int8 v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to create staged activitySession since we can't replace an activitySession with a staged activitySession.", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    id v10 = [(CSDConversation *)self serverBag];
    int v11 = [v4 activity];
    id v12 = [v11 activityIdentifier];
    unsigned __int8 v9 = [v10 localBundleIDForActivityIdentifier:v12];

    long long v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BundleID override: %@", (uint8_t *)&v16, 0xCu);
    }

    if (v9)
    {
      id v14 = [v4 activity];
      [v14 setBundleIdentifier:v9];
    }
    [(CSDConversation *)self setStagedActivitySession:v4];
  }

  return v8 == 0;
}

- (void)_launchApplicationsForActivitiesIfNecessary
{
  uint64_t v3 = TUShouldForegroundLaunchForActivity();

  [(CSDConversation *)self _launchApplicationsForActivitiesIfNecessary:v3];
}

- (void)removeActivitySessionIfNecessary
{
  if ((id)[(CSDConversation *)self state] == (id)2 || (id)[(CSDConversation *)self state] == (id)3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v3 = [(CSDConversation *)self activitySessions];
    id v4 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = *(void *)v17;
      *(void *)&long long v5 = 138412802;
      long long v15 = v5;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v3);
          }
          unsigned __int8 v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "activity", v15);
          int v11 = [v10 trustedFromHandle];

          if (v11 && ![(CSDConversation *)self containsMemberWithHandle:v11])
          {
            id v12 = sub_100008DCC();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              id v14 = [v9 identifier];
              *(_DWORD *)buf = v15;
              id v21 = v11;
              __int16 v22 = 2112;
              id v23 = v14;
              __int16 v24 = 2112;
              long long v25 = self;
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Trusted from handle %@ not found in membership list for activitySession ID: %@ on conversation %@", buf, 0x20u);
            }
            long long v13 = [v9 identifier];
            [(CSDConversation *)self removeActivitySessionWithUUID:v13 usingTerminatingHandle:v11];
          }
        }
        id v6 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }
      while (v6);
    }
  }
}

- (void)_launchApplicationsForActivitiesIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = [(CSDConversation *)self activitySessions];
  if ([obj count])
  {
    unsigned __int8 v5 = [(CSDConversation *)self isScreening];

    if (v5) {
      return;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = [(CSDConversation *)self activitySessions];
    id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v7)
    {
      unsigned __int8 v9 = v6;
      goto LABEL_19;
    }
    id v8 = v7;
    long long v19 = self;
    BOOL v20 = v3;
    unsigned __int8 v9 = 0;
    uint64_t v10 = *(void *)v24;
    id obja = v6;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obja);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (!v9) {
          goto LABEL_10;
        }
        long long v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) tuConversationActivitySession];
        id v14 = [v13 timestamp];
        long long v15 = [v9 tuConversationActivitySession];
        long long v16 = [v15 timestamp];
        id v17 = [v14 compare:v16];

        if (v17 == (id)1)
        {
LABEL_10:
          id v18 = v12;

          unsigned __int8 v9 = v18;
        }
      }
      id v8 = [obja countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);

    if (v9)
    {
      [(CSDConversation *)v19 _launchApplicationForActivityIfNecessary:v9 shouldForeground:v20];
LABEL_19:
    }
  }
  else
  {
  }
}

- (void)_launchApplicationForActivityIfNecessary:(id)a3
{
  id v4 = a3;
  [(CSDConversation *)self _launchApplicationForActivityIfNecessary:v4 shouldForeground:TUShouldForegroundLaunchForActivity()];
}

- (void)_launchApplicationForActivityIfNecessary:(id)a3 shouldForeground:(BOOL)a4
{
  id v5 = a3;
  if ((id)[(CSDConversation *)self state] == (id)3)
  {
    id v6 = [(CSDConversation *)self sharePlaySystemStateObserver];
    unsigned __int8 v7 = [v6 allowSharePlay];

    if (v7)
    {
      id v8 = [v5 tuConversationActivitySession];
      unsigned __int8 v9 = [v8 activity];
      uint64_t v10 = [v9 applicationContext];

      if (!v10)
      {
        int v11 = sub_100008DCC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v9 UUID];
          *(_DWORD *)buf = 138412290;
          id v39 = v14;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Activity with identifier %@ is missing application context.", buf, 0xCu);
        }
        goto LABEL_21;
      }
      if ([v9 isStaticActivity])
      {
        int v11 = sub_100008DCC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v8;
          id v12 = "Not launching app for static activity: %@";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
        }
      }
      else if ([v9 isSupported])
      {
        long long v15 = (char *)[v8 state];
        if ((unint64_t)(v15 - 2) >= 3)
        {
          if (v15 != (char *)1)
          {
            long long v16 = [(CSDConversation *)self applicationLaunchPolicyManager];
            id v17 = [(CSDConversation *)self tuConversation];
            if ([v16 shouldAutoLaunchAppForActivity:v9 onConversation:v17])
            {
              id v18 = [(CSDConversation *)self audioRoutePolicyManager];
              unsigned int v19 = [v18 sharePlaySupported];
            }
            else
            {
              unsigned int v19 = 0;
            }

            BOOL v20 = sub_100008DCC();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = [v9 bundleIdentifier];
              uint64_t v22 = [(CSDConversation *)self UUID];
              long long v23 = (void *)v22;
              CFStringRef v24 = @"NO";
              *(_DWORD *)buf = 138412802;
              id v39 = v21;
              __int16 v40 = 2112;
              if (v19) {
                CFStringRef v24 = @"YES";
              }
              uint64_t v41 = v22;
              __int16 v42 = 2112;
              CFStringRef v43 = v24;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request to launch %@ for conversation with UUID: %@ allowing auto-launch: %@", buf, 0x20u);
            }
            if (v19)
            {
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472;
              v35[2] = sub_10003A244;
              v35[3] = &unk_1005055F8;
              v35[4] = self;
              id v25 = v5;
              id v36 = v25;
              long long v37 = v8;
              long long v26 = objc_retainBlock(v35);
              long long v27 = sub_100008DCC();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Attempting to launch app in background w/ PiP", buf, 2u);
              }

              [v25 permitJoin];
              id v28 = [(CSDConversation *)self activitySessionManager];
              long long v29 = [v28 applicationLauncher];
              v32[0] = _NSConcreteStackBlock;
              v32[1] = 3221225472;
              v32[2] = sub_10003A39C;
              v32[3] = &unk_100505620;
              id v33 = v25;
              id v34 = v26;
              long long v30 = v26;
              [v29 launchAppForActivitySession:v33 options:1 completion:v32];
            }
            else
            {
              +[CSDAnalyticsReporter sendManualLaunchNeededEventWithActivitySession:v8];
              long long v31 = [(CSDConversation *)self delegate];
              [v31 conversation:self appLaunchState:1 forActivitySession:v8];
            }
            goto LABEL_22;
          }
          int v11 = sub_100008DCC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v39 = v8;
            id v12 = "Not launching app as the activitySession has already been joined: %@";
            goto LABEL_20;
          }
        }
        else
        {
          int v11 = sub_100008DCC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v39 = v8;
            id v12 = "Not launching app as we are not in an eligible activitySession state: %@";
            goto LABEL_20;
          }
        }
      }
      else
      {
        int v11 = sub_100008DCC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v8;
          id v12 = "Not launching app for unsupported activity: %@";
          goto LABEL_20;
        }
      }
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v13 = "Not launching app as SharePlay is not allowed";
      goto LABEL_11;
    }
  }
  else
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v13 = "Not launching app as we are not joined into this conversation";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
  }
LABEL_23:
}

- (NSSet)activitySessions
{
  v2 = [(CSDConversation *)self activitySessionManager];
  BOOL v3 = [v2 activitySessions];
  id v4 = [v3 copy];

  return (NSSet *)v4;
}

- (NSSet)tuActivitySessions
{
  v2 = [(CSDConversation *)self activitySessionManager];
  BOOL v3 = [v2 tuActivitySessions];

  return (NSSet *)v3;
}

- (id)tuSystemActivitySessions
{
  v2 = [(CSDConversation *)self activitySessionManager];
  BOOL v3 = [v2 tuSystemActivitySessions];

  return v3;
}

- (CGSize)localPortraitAspectRatio
{
  v2 = [(id)CUTWeakLinkClass() mainDisplay];
  [v2 bounds];
  if (v3 <= v4) {
    double v5 = v3;
  }
  else {
    double v5 = v4;
  }
  if (v3 <= v4) {
    double v6 = v4;
  }
  else {
    double v6 = v3;
  }
  unsigned int v7 = TUBinaryGCD();
  double v8 = v5 / (double)v7;
  double v9 = v6 / (double)v7;

  double v10 = v8;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)stopContentSharingSession
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v3 = [(CSDConversation *)self activitySessions];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 138412290;
    long long v14 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "activity", v14);
        if ([v10 isScreenSharingActivity])
        {
          double v11 = [v9 tuConversationActivitySession];
          unsigned int v12 = [v11 isLocallyInitiated];

          if (!v12) {
            continue;
          }
          long long v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            BOOL v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found locally initiated screen sharing activity session %@, ending session", buf, 0xCu);
          }

          double v10 = [v9 identifier];
          [(CSDConversation *)self removeActivitySessionWithUUID:v10 usingTerminatingHandle:0];
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }
}

- (id)setupNewAVCSession:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(CSDConversation *)self avcSession];

  id v6 = sub_100008DCC();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1003A70DC();
    }

    +[CSDCrashReporter simulateCrashReportWithFormat:@"Trying to setup new AVCSession without tearing down previous session first. Please file a bug to [FaceTime Core - TelephonyUtilities | All]."];
    [(CSDConversation *)self leave];
    double v8 = 0;
  }
  else
  {
    os_signpost_id_t v9 = os_signpost_id_generate(v6);

    double v10 = sub_100008DCC();
    double v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "avcSessionCreationBlock", "", buf, 2u);
    }

    unsigned int v12 = [(CSDConversation *)self avcSessionCreationBlock];
    long long v13 = [(CSDConversation *)self idsSession];
    long long v14 = [v13 idsDestination];
    long long v15 = [(CSDConversation *)self queue];
    BOOL v16 = [(CSDConversation *)self isVideoEnabled];
    long long v17 = [(CSDConversation *)self report];
    double v8 = ((void (**)(void, void *, CSDConversation *, void *, BOOL, BOOL, void *))v12)[2](v12, v14, self, v15, v16, v3, v17);

    long long v18 = sub_100008DCC();
    unsigned int v19 = v18;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v9, "avcSessionCreationBlock", "", buf, 2u);
    }

    if (v8)
    {
      if ([(CSDConversation *)self avMode])
      {
        [v8 setAudioEnabled:1];
        if ([(CSDConversation *)self isRelaying]) {
          objc_msgSend(v8, "setRelaying:", -[CSDConversation isRelaying](self, "isRelaying"));
        }
        if ([(CSDConversation *)self isScreening]) {
          objc_msgSend(v8, "setScreening:", -[CSDConversation isScreening](self, "isScreening"));
        }
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      BOOL v20 = [(CSDConversation *)self activeRemoteParticipants];
      id v21 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v27;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v27 != v23) {
              objc_enumerationMutation(v20);
            }
            [(CSDConversation *)self _addRemoteParticipantToAVCSessionIfPossible:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          }
          id v22 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v22);
      }
    }
  }

  return v8;
}

- (void)joinUsingContext:(id)a3
{
  id v4 = a3;
  long long v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v85 = self;
    __int16 v86 = 2112;
    id v87 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Joining CSDConversation self: %@ context: %@", buf, 0x16u);
  }

  uint64_t v7 = [(CSDConversation *)self serverBag];
  -[CSDConversation setRebroadcastTimeThreshold:](self, "setRebroadcastTimeThreshold:", [v7 rebroadcastTimeThreshold]);

  [(CSDConversation *)self setFailureContext:0];
  double v8 = [(CSDConversation *)self delegate];
  os_signpost_id_t v9 = [(CSDConversation *)self messagesGroupUUID];
  [v4 setMessagesGroupUUID:v9];

  double v10 = [(CSDConversation *)self messagesGroupName];
  [v4 setMessagesGroupName:v10];

  if (!+[TUConversationManager allowsVideo])
  {
LABEL_6:
    [v4 setVideoEnabled:0];
    goto LABEL_8;
  }
  double v11 = [(CSDConversation *)self featureFlags];
  if ([v11 groupFacetimeAsAServiceEnabled])
  {
    unsigned int v12 = [v4 provider];
    unsigned __int8 v13 = [v12 supportsVideo];

    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

LABEL_8:
  long long v14 = +[CSDMomentsController localCapabilities];
  objc_msgSend(v4, "setMomentsAvailable:", objc_msgSend(v14, "isEnabled"));

  [v4 setPersonaAvailable:TUIsPersonaAvailable()];
  long long v15 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  objc_msgSend(v4, "setInitiator:", objc_msgSend(v15, "count") == 0);

  BOOL v16 = [(CSDConversation *)self featureFlags];
  id v17 = [v16 avLessSharePlayEnabled];

  if (v17)
  {
    -[CSDConversation setAvMode:](self, "setAvMode:", [v4 avMode]);
    if ([(CSDConversation *)self avMode]) {
      -[CSDConversation setVideo:](self, "setVideo:", [v4 avMode] == (id)2);
    }
    -[CSDConversation setPresentationMode:](self, "setPresentationMode:", [v4 presentationMode]);
    if (![v4 avMode] && objc_msgSend(v4, "isVideo"))
    {
      long long v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_1003A72A0();
      }
    }
    if ([v4 avMode] && objc_msgSend(v4, "presentationMode"))
    {
      unsigned int v19 = sub_100008DCC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_1003A7238();
      }
    }
    if (![v4 avMode] && !objc_msgSend(v4, "presentationMode"))
    {
      BOOL v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_1003A71D0();
      }
    }
  }
  else
  {
    -[CSDConversation setVideo:](self, "setVideo:", [v4 isVideo]);
  }
  id v21 = [(CSDConversation *)self featureFlags];
  if ([v21 usesModernScreenSharingFromMessages])
  {
    id v17 = [v4 screenSharingRequest];

    if (!v17) {
      goto LABEL_31;
    }
    id v21 = [v4 screenSharingRequest];
    id v17 = [(CSDConversation *)self screenSharingRequestsByUUID];
    id v22 = [v4 screenSharingRequest];
    uint64_t v23 = [v22 UUID];
    [v17 setObject:v21 forKeyedSubscript:v23];
  }
LABEL_31:
  self->_spatialPersonaEnabled = [v4 isSpatialPersonaEnabled];
  CFStringRef v24 = [(CSDConversation *)self localMember];
  objc_msgSend(v4, "setLightweight:", objc_msgSend(v24, "isLightweightMember"));

  id v25 = [(CSDConversation *)self deviceSupport];
  if ([v25 isGreenTea])
  {
    unsigned __int8 v26 = [(CSDConversation *)self isVideo];
    if ((v26 & 1) == 0)
    {
      id v17 = [v4 provider];
      if ([v17 isDefaultProvider])
      {

LABEL_61:
        id v38 = sub_100008DCC();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_1003A7110(self);
        }

        [(CSDConversation *)self _reportConversationFailedWithProviderEndedReason:519];
        goto LABEL_107;
      }
    }
    id v34 = [(CSDConversation *)self remoteMembers];
    id v35 = [v34 count];

    if (v26)
    {

      if ((unint64_t)v35 >= 2) {
        goto LABEL_61;
      }
    }
    else
    {

      if ((unint64_t)v35 > 1) {
        goto LABEL_61;
      }
    }
  }
  else
  {
  }
  long long v27 = [(CSDConversation *)self invitationPreferences];
  if (![v27 count])
  {
    id v28 = [v4 invitationPreferences];
    if ([v28 count] && !-[CSDConversation hasJoined](self, "hasJoined"))
    {
      unsigned int v29 = [(CSDConversation *)self isLocallyCreated];

      if (!v29) {
        goto LABEL_45;
      }
      long long v30 = sub_100008DCC();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        long long v31 = [v4 invitationPreferences];
        *(_DWORD *)buf = 138412290;
        long long v85 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Copying invitation preferences to locally-created conversation from join context: %@", buf, 0xCu);
      }
      long long v27 = [v4 invitationPreferences];
      id v28 = [v27 copy];
      [(CSDConversation *)self setInvitationPreferences:v28];
    }
  }
LABEL_45:
  if ([v4 isLightweight])
  {
    long long v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [(CSDConversation *)self localMember];
      *(_DWORD *)buf = 138412290;
      long long v85 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Bypassing AVCSession creation because localMember is lightweight %@", buf, 0xCu);
    }
    [(CSDConversation *)self setState:2];
    [(CSDConversation *)self _startIDSSessionWithContext:v4];
    goto LABEL_106;
  }
  if (![(CSDConversation *)self state])
  {
    id v39 = sub_100008DCC();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v40 = [(CSDConversation *)self idsSession];
      uint64_t v41 = [v40 idsDestination];
      *(_DWORD *)buf = 138412290;
      long long v85 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Creating CSDAVCSession with transport token %@", buf, 0xCu);
    }
    uint64_t v42 = [(CSDConversation *)self isOneToOneModeEnabled];
    CFStringRef v43 = [(CSDConversation *)self featureFlags];
    if (([v43 conversationHandoffEnabled] & 1) == 0)
    {

      goto LABEL_85;
    }
    __int16 v44 = [v4 participantAssociation];

    if (!v44) {
      goto LABEL_85;
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v45 = [(CSDConversation *)self activeRemoteParticipants];
    id v46 = [v45 countByEnumeratingWithState:&v79 objects:v83 count:16];
    BOOL v47 = v46 != 0;
    if (v46)
    {
      id v48 = v46;
      BOOL v75 = v46 != 0;
      unsigned int v76 = v42;
      uint64_t v77 = v8;
      long long v78 = self;
      char v49 = 0;
      uint64_t v50 = *(void *)v80;
      do
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v80 != v50) {
            objc_enumerationMutation(v45);
          }
          BOOL v52 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          id v53 = [v52 identifier];
          unsigned __int8 v54 = [v4 participantAssociation];
          id v55 = [v54 identifier];

          if (v53 == v55)
          {
            dispatch_time_t v56 = [v52 avcIdentifier];
            id v57 = [v56 copy];
            id v58 = [v4 participantAssociation];
            [v58 setAvcIdentifier:v57];

            char v49 = 1;
          }
        }
        id v48 = [v45 countByEnumeratingWithState:&v79 objects:v83 count:16];
      }
      while (v48);

      if ((v49 & 1) == 0)
      {
        BOOL v47 = 0;
        double v8 = v77;
        self = v78;
        uint64_t v42 = v76;
        if (!v76) {
          goto LABEL_85;
        }
        goto LABEL_109;
      }
      long long v45 = [v4 participantAssociation];
      self = v78;
      [(CSDConversation *)v78 setLocalParticipantAssociation:v45];
      double v8 = v77;
      BOOL v47 = v75;
      uint64_t v42 = v76;
    }

    if (!v42) {
      goto LABEL_85;
    }
LABEL_109:
    long long v71 = [(CSDConversation *)self activeRemoteParticipants];
    id v72 = [v71 count];

    char v73 = !v47;
    if ((unint64_t)v72 < 2) {
      char v73 = 1;
    }
    if (v73)
    {
      uint64_t v42 = 1;
    }
    else
    {
      long long v74 = sub_100008DCC();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "This device is joining a U+1 FaceTime call to complete a handoff from a different participant, setting oneToOneModeEnabled to NO.", buf, 2u);
      }

      [v4 setOneToOneModeEnabled:0];
      uint64_t v42 = 0;
    }
LABEL_85:
    long long v61 = [(CSDConversation *)self featureFlags];
    unsigned int v62 = [v61 conversationOneToOneModeEnabled];

    if (v62) {
      [(CSDConversation *)self updateLocalAspectRatios];
    }
    if ([(CSDConversation *)self avMode]) {
      -[CSDConversation setVideoEnabled:](self, "setVideoEnabled:", [v4 isVideoEnabled]);
    }
    id v63 = [(CSDConversation *)self setupNewAVCSession:v42];
    [(CSDConversation *)self setAvcSession:v63];

    [(CSDConversation *)self setAvcSessionInProgress:0];
    [(CSDConversation *)self setExpectedAudioEnabled:0];
    [(CSDConversation *)self setExpectedVideoEnabled:0];
    [(CSDConversation *)self setExpectedVideoPaused:0];
    [(CSDConversation *)self setExpectedScreenEnabled:0];
    uint64_t v64 = [(CSDConversation *)self avcSession];

    uint64_t v65 = sub_100008DCC();
    id v66 = v65;
    if (!v64)
    {
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_1003A719C();
      }

      [(CSDConversation *)self _reportConversationFailedWithProviderEndedReason:502];
      goto LABEL_106;
    }
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v67 = [(CSDConversation *)self avcSession];
      *(_DWORD *)buf = 138412290;
      long long v85 = v67;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Created CSDAVCSession %@", buf, 0xCu);
    }
    if ([v4 wantsStagingArea])
    {
      [(CSDConversation *)self setState:1];
      if ([v4 representsTransitionFromPending]) {
        -[CSDConversation setVideoEnabled:](self, "setVideoEnabled:", [v4 isVideoEnabled]);
      }
      unsigned int v68 = sub_100008DCC();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Not joining IDS group session because wantsStagingArea is true, instead moving to preparing state", buf, 2u);
      }
      goto LABEL_105;
    }
    if ([(CSDConversation *)self avMode]) {
      goto LABEL_101;
    }
    goto LABEL_102;
  }
  if ((id)[(CSDConversation *)self state] == (id)1)
  {
    if ([(CSDConversation *)self avMode])
    {
      id v36 = [(CSDConversation *)self featureFlags];
      if ([v36 conversationHandoffEnabled])
      {
        long long v37 = [(CSDConversation *)self localParticipantAssociation];

        if (!v37)
        {
LABEL_59:
          -[CSDConversation setVideoEnabled:](self, "setVideoEnabled:", [v4 isVideoEnabled]);
LABEL_101:
          -[CSDConversation setVideoPaused:](self, "setVideoPaused:", [v4 isVideoPaused]);
          goto LABEL_102;
        }
        id v36 = [(CSDConversation *)self localParticipantAssociation];
        [v4 setParticipantAssociation:v36];
      }

      goto LABEL_59;
    }
LABEL_102:
    [(CSDConversation *)self setState:2];
    [(CSDConversation *)self _startIDSSessionWithContext:v4];
    id v69 = [(CSDConversation *)self featureFlags];
    unsigned int v70 = [v69 avLessSharePlayEnabled];

    if (v70) {
      -[CSDConversation setAvMode:](self, "setAvMode:", [v4 avMode]);
    }
    unsigned int v68 = [v4 participantAssociation];
    [(CSDConversation *)self continueHandoffAudioRouteForIdentifier:[v68 identifier] participantLeft:0];
LABEL_105:

LABEL_106:
    [v8 conversationChanged:self];
    goto LABEL_107;
  }
  uint64_t v59 = sub_100008DCC();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v60 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412290;
    long long v85 = v60;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "[WARN] Not joining conversation because it isn't waiting or preparing: %@", buf, 0xCu);
  }
LABEL_107:
}

- (void)updateLocalParticipantInfo
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self localParticipantBlobTracker];
  [v4 invalidateLocalParticipantBlobWantsDeliveryOverPush:0];
}

- (void)broadcastLocalParticipantData
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];

  if (v4)
  {
    id v7 = [(CSDConversation *)self localParticipantBlobTracker];
    [v7 invalidateLocalParticipantBlobWantsDeliveryOverPush:1];
  }
  else
  {
    long long v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(CSDConversation *)self UUID];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Not sending local participant data, no AVCSession: %@", buf, 0xCu);
    }
  }
}

- (void)startAudio
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = [(CSDConversation *)self UUID];
    int v10 = 138413058;
    double v11 = v5;
    __int16 v12 = 1024;
    unsigned int v13 = [(CSDConversation *)self isAudioReady];
    __int16 v14 = 1024;
    unsigned int v15 = [(CSDConversation *)self isAudioPaused];
    __int16 v16 = 1024;
    unsigned int v17 = [(CSDConversation *)self isAudioEnabled];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requested to mark conversation as audioReady UUID: %@ audioReady: %d audioPaused: %d audioEnabled: %d", (uint8_t *)&v10, 0x1Eu);
  }
  [(CSDConversation *)self _addParticipantsWaitingToBeAddedToAVCSession];
  if ([(CSDConversation *)self avMode])
  {
    if ((id)[(CSDConversation *)self state] == (id)2 || (id)[(CSDConversation *)self state] == (id)3)
    {
      id v6 = [(CSDConversation *)self avcSession];
      [v6 setAudioReady:1];

      [(CSDConversation *)self _startAVCSessionIfNecessary];
      return;
    }
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [(CSDConversation *)self UUID];
      int v10 = 138412290;
      double v11 = v8;
      os_signpost_id_t v9 = "[WARN] Not starting audio for conversation because it isn't joining/joined: %@";
      goto LABEL_11;
    }
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [(CSDConversation *)self UUID];
      int v10 = 138412290;
      double v11 = v8;
      os_signpost_id_t v9 = "[WARN] Not starting audio for conversation because avmode is .none %@";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)supportsLeaveContext
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CSDConversation *)self activeRemoteParticipants];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    unsigned __int8 v6 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if (v6)
        {
          double v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) capabilities];
          unsigned __int8 v6 = [v8 supportsLeaveContext];
        }
        else
        {
          unsigned __int8 v6 = 0;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)leave
{
}

- (void)leaveWithReason:(unint64_t)a3
{
  uint64_t v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = [[CSDConversationLeaveContext alloc] initWithLeaveReason:a3];
  [(CSDConversation *)self leaveUsingContext:v6];
}

- (void)leaveUsingContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "leaveUsingContext: self UUID: %@", buf, 0xCu);
  }
  [(CSDConversation *)self setUplinkMuted:1];
  [(CSDConversation *)self setAudioEnabled:0];
  [(CSDConversation *)self setVideoEnabled:0];
  double v8 = +[TUCallScreenShareAttributes defaultAttributes];
  [(CSDConversation *)self setScreenEnabled:0 attributes:v8];

  os_signpost_id_t v9 = [(CSDConversation *)self delegate];
  long long v10 = [(CSDConversation *)self tuConversation];
  long long v11 = [v10 mergedActiveRemoteParticipants];

  long long v12 = [(CSDConversation *)self tuConversation];
  long long v13 = [v12 mergedRemoteMembers];

  if ((id)[(CSDConversation *)self state] == (id)2 || (id)[(CSDConversation *)self state] == (id)3)
  {
    __int16 v44 = v13;
    [(CSDConversation *)self setState:4];
    -[CSDConversation _beginTimeoutForLeavingConversationWithReason:](self, "_beginTimeoutForLeavingConversationWithReason:", @"Calling -[CSDConversation leave]");
    [(CSDConversation *)self setUplinkMuted:1];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    __int16 v14 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
    id v15 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v51;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v51 != v17) {
            objc_enumerationMutation(v14);
          }
          unsigned int v19 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          BOOL v20 = [(CSDConversation *)self avcSession];
          objc_msgSend(v20, "setDownlinkMuted:forParticipantWithIdentifier:", 1, objc_msgSend(v19, "unsignedLongLongValue"));
        }
        id v16 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v16);
    }

    [(CSDConversation *)self setSplitSessionSecondary:0];
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [(CSDConversation *)self idsSession];
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Leaving CSDIDSGroupSession: %@", buf, 0xCu);
    }
    uint64_t v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v24 = [(CSDConversation *)self supportsLeaveContext];
      CFStringRef v25 = @"NO";
      if (v24) {
        CFStringRef v25 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Conversation participants support leave context: %@", buf, 0xCu);
    }

    unsigned __int8 v26 = [(CSDConversation *)self idsSession];
    if ([(CSDConversation *)self supportsLeaveContext]) {
      id v27 = v4;
    }
    else {
      id v27 = 0;
    }
    [v26 leaveGroupSessionWithContext:v27];

    [(CSDConversation *)self stopContentSharingSession];
    [(CSDConversation *)self destroyScreenCapturePickerIfNecessary];
    id v28 = [(CSDConversation *)self activitySessionManager];
    [v28 resetSessions];

    self->_spatialPersonaEnabled = 0;
    [v9 conversationChanged:self];
LABEL_22:
    long long v13 = v44;
    goto LABEL_23;
  }
  if ((id)[(CSDConversation *)self state] == (id)1)
  {
    [(CSDConversation *)self setState:0];
    [(CSDConversation *)self setAvcSession:0];
    [(CSDConversation *)self setAvcSessionInProgress:0];
    [v9 conversationChanged:self];
    goto LABEL_23;
  }
  if (![(CSDConversation *)self state])
  {
    unsigned int v29 = [(CSDConversation *)self link];
    if (v29 || [v13 count] != (id)1)
    {
    }
    else if ([v11 count] == (id)1)
    {
      id v43 = v4;
      __int16 v44 = v13;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v30 = [(CSDConversation *)self activeRemoteParticipants];
      id v31 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v47;
        do
        {
          id v34 = 0;
          do
          {
            if (*(void *)v47 != v33) {
              objc_enumerationMutation(v30);
            }
            id v35 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v34);
            id v36 = [v35 activeIDSDestination];
            if (v36) {
              goto LABEL_37;
            }
            long long v37 = [(CSDConversation *)self remoteMembers];
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_10003C39C;
            v45[3] = &unk_100505648;
            v45[4] = v35;
            id v38 = objc_msgSend(v37, "tu_anyObjectPassingTest:", v45);

            id v36 = [v38 idsDestination];

            if (v36)
            {
LABEL_37:
              [v9 conversation:self sendDeclineMessageToParticipantDestination:v36];
            }
            else
            {
              id v36 = sub_100008DCC();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                id v39 = [(CSDConversation *)self UUID];
                *(_DWORD *)buf = 138412290;
                CFStringRef v57 = v39;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[WARN] No IDS destination to send decline message: %@", buf, 0xCu);
              }
            }

            id v34 = (char *)v34 + 1;
          }
          while (v32 != v34);
          id v40 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
          id v32 = v40;
        }
        while (v40);
      }

      id v4 = v43;
      goto LABEL_22;
    }
  }
  uint64_t v41 = sub_100008DCC();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[WARN] Not leaving conversation because it isn't joining/joined: %@", buf, 0xCu);
  }
LABEL_23:
}

- (void)kickMember:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412546;
    long long v18 = v6;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Kicking member on conversation UUID: %@ member: %@", buf, 0x16u);
  }
  id v7 = [(CSDConversation *)self activeParticipants];
  double v8 = [v7 allObjects];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003C60C;
  v15[3] = &unk_100505670;
  id v9 = v4;
  id v16 = v9;
  long long v10 = objc_msgSend(v8, "tu_firstObjectPassingTest:", v15);

  if (v10)
  {
    long long v11 = [(CSDConversation *)self pendingKickedMembersByIdentifier];
    long long v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 identifier]);
    [v11 setObject:v9 forKeyedSubscript:v12];
  }
  long long v13 = [(CSDConversation *)self idsSession];
  [v13 kickMember:v9];

  __int16 v14 = +[NSSet setWithObject:v9];
  [(CSDConversation *)self removeRemoteMembers:v14 triggeredLocally:1];
}

- (void)_allowMember:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSDConversation *)self pendingAllowedMembers];
  [v5 addObject:v4];

  id v6 = [(CSDConversation *)self idsSession];
  [v6 allowMember:v4];
}

- (void)setRemoteParticipantsDownlinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        long long v11 = [(CSDConversation *)self avcSession];
        objc_msgSend(v11, "setAudioAndVideoMuted:forParticipantWithIdentifier:", v3, objc_msgSend(v10, "unsignedLongLongValue"));

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)reducedInfoMembers:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "handle", (void)v16);
        long long v11 = +[CXHandle handleWithTUHandle:v10];

        id v12 = objc_alloc((Class)TUConversationMember);
        long long v13 = [v11 tuHandle];
        id v14 = [v12 initWithHandle:v13];

        [v4 addObject:v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isRepresentedByRemoteMembers:(id)a3 andLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversation *)self remoteMembers];
  long long v10 = [(CSDConversation *)self reducedInfoMembers:v9];

  long long v11 = [(CSDConversation *)self reducedInfoMembers:v7];

  if ([v10 isEqualToSet:v11]
    && (([(CSDConversation *)self link], id v12 = objc_claimAutoreleasedReturnValue(), v12, v6)
     || !v12))
  {
    long long v15 = [(CSDConversation *)self link];

    if (!v6 || v15)
    {
      long long v16 = [(CSDConversation *)self link];

      unsigned __int8 v13 = 1;
      if (v6 && v16)
      {
        long long v17 = [(CSDConversation *)self link];
        long long v18 = [v17 pseudonym];
        long long v19 = [v6 pseudonym];
        unsigned __int8 v13 = [v18 isEqualToString:v19];
      }
    }
    else
    {
      unsigned __int8 v13 = 1;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)updateRemoteMember:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(CSDConversation *)self remoteMembers];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v11 = [v4 handle];
        id v12 = [v10 handle];
        int v13 = TUHandlesAreCanonicallyEqual();

        if (v13)
        {
          id v14 = [(CSDConversation *)self remoteMembers];
          id v15 = [v14 mutableCopy];

          [v15 removeObject:v10];
          [v15 addObject:v4];
          id v16 = [v15 copy];
          [(CSDConversation *)self setRemoteMembers:v16];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)updateLightweightMember:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(CSDConversation *)self lightweightMembers];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v11 = [v4 handle];
        id v12 = [v10 handle];
        int v13 = TUHandlesAreCanonicallyEqual();

        if (v13)
        {
          id v14 = [(CSDConversation *)self lightweightMembers];
          id v15 = [v14 mutableCopy];

          [v15 removeObject:v10];
          [v15 addObject:v4];
          id v16 = [v15 copy];
          [(CSDConversation *)self setLightweightMembers:v16];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)updateLocalMember:(id)a3
{
}

- (id)memberWithHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self localMember];
  id v6 = [v5 handle];
  int v7 = TUHandlesAreCanonicallyEqual();

  if (v7)
  {
    id v8 = [(CSDConversation *)self localMember];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = [(CSDConversation *)self remoteMembers];
    id v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v31;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        id v15 = [v14 handle];
        char v16 = TUHandlesAreCanonicallyEqual();

        if (v16) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v11) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v8 = v14;

      if (v8) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_11:
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v17 = [(CSDConversation *)self lightweightMembers];
    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v23 = [v22 handle];
          int v24 = TUHandlesAreCanonicallyEqual();

          if (v24)
          {
            id v8 = v22;
            goto LABEL_23;
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    id v8 = 0;
LABEL_23:
  }
LABEL_24:

  return v8;
}

- (BOOL)containsMemberWithHandle:(id)a3
{
  id v3 = [(CSDConversation *)self memberWithHandle:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSDictionary)capabilitySendMessageOptions
{
  id v3 = [(CSDConversation *)self idsSession];
  BOOL v4 = [v3 requiredCapabilities];

  id v5 = [(CSDConversation *)self idsSession];
  id v6 = [v5 requiredLackOfCapabilities];

  if ([v4 count] || objc_msgSend(v6, "count"))
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    if ([v4 count]) {
      [v7 setObject:v4 forKeyedSubscript:IDSSendMessageOptionRequireAllRegistrationPropertiesKey];
    }
    if ([v6 count]) {
      [v7 setObject:v6 forKeyedSubscript:IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey];
    }
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = 0;
  }

  return (NSDictionary *)v8;
}

- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversation *)self idsSession];
  [v8 addRequiredCapabilities:v7 requiredLackOfCapabilities:v6];
}

- (id)remoteParticipantForHandle:(id)a3
{
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [(CSDConversation *)self activeRemoteParticipants];
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
      id v11 = [v10 handle];
      unsigned __int8 v12 = [v11 isEquivalentToHandle:v4];

      if (v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = [(CSDConversation *)self activeLightweightParticipants];
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v20 = [v19 handle];
        unsigned int v21 = [v20 isEquivalentToHandle:v4];

        if (v21)
        {
          id v13 = v19;
          goto LABEL_21;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_21:

LABEL_22:
  id v22 = [v13 tuConversationParticipant];

  return v22;
}

- (id)remoteParticipantForIdentifier:(unint64_t)a3
{
  id v5 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  id v6 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 tuConversationParticipant];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
    unsigned __int8 v12 = +[NSNumber numberWithUnsignedLongLong:a3];
    id v13 = [v11 objectForKeyedSubscript:v12];
    id v10 = [v13 tuConversationParticipant];
  }

  return v10;
}

- (id)remoteMemberForHandle:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CSDConversation *)self remoteMembers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 handle];
        unsigned int v11 = [v10 isEquivalentToHandle:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (TUConversationParticipant)localParticipant
{
  id v3 = objc_alloc((Class)TUConversationParticipant);
  unint64_t v4 = [(CSDConversation *)self localParticipantIdentifier];
  id v5 = [(CSDConversation *)self localMember];
  id v6 = [v5 handle];
  id v7 = [v3 initWithIdentifier:v4 handle:v6];

  objc_msgSend(v7, "setAudioVideoMode:", -[CSDConversation avMode](self, "avMode"));
  objc_msgSend(v7, "setPresentationMode:", -[CSDConversation presentationMode](self, "presentationMode"));
  [v7 setLocalAccountHandle:1];
  objc_msgSend(v7, "setSpatialPersonaEnabled:", -[CSDConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  objc_msgSend(v7, "setCameraMixedWithScreen:", -[CSDConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));

  return (TUConversationParticipant *)v7;
}

- (id)localCSDConversationParticipant
{
  id v3 = [CSDConversationParticipant alloc];
  unint64_t v4 = [(CSDConversation *)self idsSession];
  id v5 = [v4 localParticipantIdentifier];
  id v6 = [(CSDConversation *)self localMember];
  id v7 = [v6 handle];
  uint64_t v8 = [(CSDConversation *)self localParticipantData];
  uint64_t v9 = [(CSDConversationParticipant *)v3 initWithIdentifier:v5 handle:v7 avcData:v8];

  id v10 = [(CSDConversation *)self localParticipantCapabilities];
  [(CSDConversationParticipant *)v9 setCapabilities:v10];

  [(CSDConversationParticipant *)v9 setVideoEnabled:[(CSDConversation *)self isVideoEnabled]];
  [(CSDConversationParticipant *)v9 setAudioVideoMode:[(CSDConversation *)self avMode]];
  [(CSDConversationParticipant *)v9 setPresentationMode:[(CSDConversation *)self presentationMode]];
  [(CSDConversationParticipant *)v9 setSpatialPersonaEnabled:[(CSDConversation *)self isSpatialPersonaEnabled]];
  [(CSDConversationParticipant *)v9 setCameraMixedWithScreen:[(CSDConversation *)self isCameraMixedWithScreen]];
  [(CSDConversationParticipant *)v9 setCaptionsToken:[(CSDConversation *)self avcLocalCaptionsToken]];

  return v9;
}

- (void)addAliasesToConversationContainer:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDConversation *)self serverBag];
  uint64_t v9 = [v8 stableBundleIdentifierForLocalBundleIdentifier:v7];

  if (v9)
  {
    id v10 = v9;

    id v7 = v10;
  }
  unsigned int v11 = [v7 dataUsingEncoding:4];
  [(CSDConversation *)self setIDSAliasingSalt:v11 onContainer:v6];
  unsigned __int8 v12 = [(CSDConversation *)self idsSession];
  [v12 addAliasesToConversationContainer:v6 withSalt:v11];

  long long v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = [(CSDConversation *)self groupUUID];
    long long v15 = [v6 groupUUID];
    int v16 = 138412802;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    id v19 = v15;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Aliased session %@ to %@ for bundle identifier %@", (uint8_t *)&v16, 0x20u);
  }
}

- (void)setIDSAliasingSalt:(id)a3 onContainer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = [v5 virtualParticipantConfig];
  [v8 setIdsAliasingSalt:v6];
  [v5 setVirtualParticipantConfig:v8];
  id v7 = [v5 unreliableMessengerConfig];
  [v7 setIdsAliasingSalt:v6];

  [v5 setUnreliableMessengerConfig:v7];
}

- (BOOL)allParticipantsSupportSharePlay
{
  return 1;
}

- (BOOL)_endScreenCallIfNecessary
{
  BOOL v3 = [(CSDConversation *)self isScreening];
  if (!v3) {
    return v3;
  }
  unint64_t v4 = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 3)
  {
    id v6 = sub_100008DCC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v7 = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
    *(_DWORD *)buf = 134217984;
    id v35 = [v7 count];
    id v8 = "Ending the screening call because a new participant joins, count: %ld";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v9 = [(CSDConversation *)self activeLightweightParticipants];
  id v10 = [v9 count];

  if (v10)
  {
    id v6 = sub_100008DCC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v7 = [(CSDConversation *)self activeLightweightParticipants];
    *(_DWORD *)buf = 134217984;
    id v35 = [v7 count];
    id v8 = "Ending the screening call because a lightweight participant joins, count: %ld";
    goto LABEL_11;
  }
  unsigned int v11 = [(CSDConversation *)self activeRemoteParticipants];
  id v12 = [v11 count];

  if ((unint64_t)v12 >= 2)
  {
    id v6 = sub_100008DCC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v7 = [(CSDConversation *)self activeRemoteParticipants];
    *(_DWORD *)buf = 134217984;
    id v35 = [v7 count];
    id v8 = "Ending the screening call because active remote participants, count: %ld";
    goto LABEL_11;
  }
  long long v13 = [(CSDConversation *)self remoteMembers];
  if ((unint64_t)[v13 count] >= 2)
  {

LABEL_22:
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(CSDConversation *)self remoteMembers];
      id v16 = [v7 count];
      uint64_t v17 = [(CSDConversation *)self lightweightMembers];
      *(_DWORD *)buf = 134218240;
      id v35 = v16;
      __int16 v36 = 2048;
      id v37 = [v17 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ending the screening call because a new member is added, remoteMembers: %ld, lightweightMembers: %ld", buf, 0x16u);

      goto LABEL_12;
    }
LABEL_13:

    [(CSDConversation *)self leaveWithReason:3];
LABEL_14:
    LOBYTE(v3) = 1;
    return v3;
  }
  long long v14 = [(CSDConversation *)self lightweightMembers];
  id v15 = [v14 count];

  if (v15) {
    goto LABEL_22;
  }
  if ([(CSDConversation *)self isVideoEnabled])
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ending the screening call because local upgrades to video", buf, 2u);
    }
    goto LABEL_13;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  __int16 v18 = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
  id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        long long v24 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
        long long v25 = [v24 objectForKeyedSubscript:v23];

        if ([v25 isVideoEnabled])
        {
          long long v26 = sub_100008DCC();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v27 = [(CSDConversation *)self state];
            *(_DWORD *)buf = 134218242;
            id v35 = (id)v27;
            __int16 v36 = 2112;
            id v37 = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Ending the screening call because participant upgrades to video call, state: %ld, %@", buf, 0x16u);
          }

          [(CSDConversation *)self leaveWithReason:3];
          goto LABEL_14;
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  LOBYTE(v3) = 0;
  return v3;
}

- (id)_allMembers
{
  BOOL v3 = [(CSDConversation *)self remoteMembers];
  id v4 = [v3 mutableCopy];

  id v5 = [(CSDConversation *)self lightweightMembers];
  id v6 = [v5 mutableCopy];

  id v7 = [(CSDConversation *)self localMember];
  [v4 addObject:v7];

  [v4 unionSet:v6];
  id v8 = [v4 copy];

  return v8;
}

- (void)_restartIDSSessionIfNecessary
{
  if ([(CSDConversation *)self isOneToOneModeEnabled])
  {
    BOOL v3 = [(CSDConversation *)self remoteMembers];
    if ([v3 count] == (id)1)
    {
      id v4 = [(CSDConversation *)self link];

      if (!v4)
      {
        [(CSDConversation *)self _cleanUpConversation];
        id v5 = sub_100008DCC();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          if ([(CSDConversation *)self isOneToOneModeEnabled]) {
            CFStringRef v6 = @"YES";
          }
          else {
            CFStringRef v6 = @"NO";
          }
          id v7 = [(CSDConversation *)self remoteMembers];
          *(_DWORD *)buf = 138412546;
          CFStringRef v10 = v6;
          __int16 v11 = 2048;
          id v12 = [v7 count];
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restartIDSSessionIfNecessary: No need to restart IDS Session since it's U + 1, %@, %lu", buf, 0x16u);
        }
        return;
      }
    }
    else
    {
    }
  }
  id v8 = [(CSDConversation *)self idsSession];
  [v8 restart];
}

- (void)_stopAVCSession
{
  BOOL v3 = [(CSDConversation *)self failureContext];
  id v4 = [v3 providerEndedReason];

  if (v4)
  {
    id v5 = [(CSDConversation *)self failureContext];
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"callservicesd.ConversationErrorType", [v5 providerEndedReason], 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    CFStringRef v6 = [(CSDConversation *)self avcSession];
    [v6 stopWithError:v7];
  }
  else
  {
    id v7 = [(CSDConversation *)self avcSession];
    [v7 stopWithError:0];
  }
}

- (void)_cleanUpConversation
{
  BOOL v3 = +[NSDictionary dictionary];
  activeParticipantDestinationsByIdentifier = self->_activeParticipantDestinationsByIdentifier;
  self->_activeParticipantDestinationsByIdentifier = v3;

  id v5 = +[NSMutableDictionary dictionary];
  activeRemoteParticipantsByIdentifier = self->_activeRemoteParticipantsByIdentifier;
  self->_activeRemoteParticipantsByIdentifier = v5;

  id v7 = +[NSMutableDictionary dictionary];
  activeLightweightParticipantsByIdentifier = self->_activeLightweightParticipantsByIdentifier;
  self->_activeLightweightParticipantsByIdentifier = v7;

  id v9 = objc_alloc_init((Class)NSSet);
  [(CSDConversation *)self setRemoteMembers:v9];

  id v10 = objc_alloc_init((Class)NSSet);
  [(CSDConversation *)self setRemotePushTokens:v10];

  id v11 = objc_alloc_init((Class)NSMutableSet);
  [(CSDConversation *)self setPendingRemoteMembers:v11];

  id v12 = [(CSDConversation *)self letMeInRequestUINotificationBlock];

  if (v12)
  {
    long long v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "cleanUpConversation: cancel letMeInRequestUINotificationBlock", v15, 2u);
    }

    long long v14 = [(CSDConversation *)self letMeInRequestUINotificationBlock];
    dispatch_block_cancel(v14);

    [(CSDConversation *)self setLetMeInRequestUINotificationBlock:0];
  }
  [(CSDConversation *)self setABTestConfiguration:0];
}

- (void)_emitRTCConnectionSetupEventForAddActiveParticipant:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self report];
  -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:](self, "_emitRTCConnectionSetupEvent:participantIdentifier:", 5, objc_msgSend(v5, "hashForParticipantIdentifier:", objc_msgSend(v4, "identifier")));

  CFStringRef v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Metrics] Adding active participant: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_emitRTCConnectionSetupEvent:(int64_t)a3 participantIdentifier:(unint64_t)a4
{
  int v7 = +[CSDRTCConnectionSetup rtcKey:1];
  v18[0] = v7;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  v19[0] = v8;
  id v9 = +[CSDRTCConnectionSetup rtcKey:2];
  v18[1] = v9;
  id v10 = +[NSDate date];
  id v11 = [(CSDConversation *)self report];
  id v12 = [v11 timebase];
  [v10 timeIntervalSinceDate:v12];
  long long v14 = +[NSNumber numberWithUnsignedInteger:(unint64_t)(v13 * 1000.0)];
  v19[1] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  id v16 = +[CSDReportingController sharedInstance];
  uint64_t v17 = [(CSDConversation *)self tuConversation];
  [v16 connectionSetupReportReceived:v15 eventType:a3 forConversation:v17];
}

- (void)_startIDSSessionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  if ((id)[(CSDConversation *)self state] != (id)2)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = [(CSDConversation *)self state];
      long long v14 = [(CSDConversation *)self UUID];
      *(_DWORD *)buf = 134218242;
      int64_t v82 = v13;
      __int16 v83 = 2112;
      long long v84 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Not joining IDS session as state (%tu) is not joining on conversation: %@", buf, 0x16u);
    }
    goto LABEL_42;
  }
  CFStringRef v6 = [(CSDConversation *)self remoteMembers];
  int v7 = +[NSMutableSet setWithSet:v6];

  id v8 = [(CSDConversation *)self lightweightMembers];
  [v7 unionSet:v8];

  id v9 = [(CSDConversation *)self localMember];
  id v66 = v7;
  [v7 addObject:v9];

  id v10 = +[NSMutableSet set];
  unsigned int v70 = v4;
  if ([(CSDConversation *)self isOneToOneModeEnabled]
    && ([v4 isInitiator] & 1) == 0)
  {
    id v15 = [(CSDConversation *)self idsSession];
    id v16 = [v15 participantDestinationIDs];
    id v11 = +[NSMutableSet setWithArray:v16];

    uint64_t v17 = [(CSDConversation *)self localMember];
    __int16 v18 = +[IDSDestination destinationWithTUConversationMember:v17];
    [v11 removeObject:v18];

    id v19 = [(CSDConversation *)self localMember];
    id v20 = [v19 idsDestination];
    [v11 removeObject:v20];

    uint64_t v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v82 = (int64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sending U+1 join context to subset of participants: %@", buf, 0xCu);
    }
  }
  else
  {
    id v11 = v10;
  }
  if ([(CSDConversation *)self isOneToOneModeEnabled])
  {
    id v22 = [(CSDConversation *)self featureFlags];
    if ([v22 uPlusOneSessionWithCapabilitiesEnabled])
    {
      uint64_t v23 = [(CSDConversation *)self serverBag];
      unsigned int v24 = [v23 isUPlusOneSessionCapabilitiesEnabled];

      if (!v24) {
        goto LABEL_17;
      }
      long long v25 = [(CSDConversation *)self screenSharingRequests];
      id v26 = [v25 count];

      if (v26)
      {
        int64_t v27 = +[NSSet setWithObject:IDSRegistrationPropertySupportsSSRC];
        [(CSDConversation *)self addRequiredCapabilities:v27 requiredLackOfCapabilities:0];
      }
      id v22 = +[NSSet setWithObject:IDSRegistrationPropertySupportsModernGFT];
      [(CSDConversation *)self addRequiredCapabilities:v22 requiredLackOfCapabilities:0];
    }
  }
LABEL_17:
  uint64_t v65 = v11;
  long long v28 = sub_100008DCC();
  long long v29 = [(CSDConversation *)self idsSession];
  os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v28, v29);

  long long v31 = sub_100008DCC();
  long long v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "idsSessionJoin", "", buf, 2u);
  }

  long long v33 = [(CSDConversation *)self report];
  -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:](self, "_emitRTCConnectionSetupEvent:participantIdentifier:", 1, objc_msgSend(v33, "hashForParticipantIdentifier:", -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")));

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v34 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  id v35 = [v34 allValues];

  id v36 = [v35 countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v76;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v76 != v38) {
          objc_enumerationMutation(v35);
        }
        [(CSDConversation *)self _emitRTCConnectionSetupEventForAddActiveParticipant:*(void *)(*((void *)&v75 + 1) + 8 * i)];
      }
      id v37 = [v35 countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v37);
  }

  uint64_t v40 = [(CSDConversation *)self stagedActivitySession];
  if (v40
    && (uint64_t v41 = (void *)v40,
        [(CSDConversation *)self stagedActivitySession],
        uint64_t v42 = objc_claimAutoreleasedReturnValue(),
        unsigned int v43 = [v42 isLocallyInitiated],
        v42,
        v41,
        v43))
  {
    __int16 v44 = [(CSDConversation *)self stagedActivitySession];
    uint64_t v67 = +[CSDMessagingConversationActivitySession activitySessionWithTUConversationActivitySession:v44 fromConversation:self forStorage:0];
  }
  else
  {
    uint64_t v67 = 0;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = [(CSDConversation *)self activitySessions];
  id v45 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v72;
    while (2)
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v72 != v47) {
          objc_enumerationMutation(obj);
        }
        long long v49 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
        long long v50 = [v49 activity];
        long long v51 = [v50 UUID];
        long long v52 = [v70 activity];
        long long v53 = [v52 UUID];
        unsigned int v54 = [v51 isEqual:v53];

        if (v54)
        {
          uint64_t v55 = +[CSDMessagingConversationActivitySession activitySessionWithCSDConversationActivitySession:v49 fromConversation:self];
          goto LABEL_41;
        }
      }
      id v46 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (v46) {
        continue;
      }
      break;
    }
  }
  uint64_t v55 = 0;
LABEL_41:
  uint64_t v64 = (void *)v55;

  id obja = [(CSDConversation *)self idsSession];
  dispatch_time_t v56 = [(CSDConversation *)self localParticipantData];
  CFStringRef v57 = [(CSDConversation *)self otherInvitedHandles];
  id v58 = [(CSDConversation *)self link];
  uint64_t v59 = [(CSDConversation *)self report];
  unint64_t v60 = [(CSDConversation *)self personaHandshakeBlobCreationBlock];
  long long v61 = v60[2]();
  uint64_t v63 = v55;
  id v12 = v66;
  id v4 = v70;
  [obja joinUsingContext:v70 localParticipantAVCData:v56 members:v66 otherInvitedHandles:v57 participantDestinationIDs:v65 link:v58 report:v59 stagedActivitySession:v67 personaHandshakeBlob:v61 activitySession:v63];

  unsigned int v62 = [(CSDConversation *)self delegate];
  [v62 conversationDidTriggerJoin:self];

LABEL_42:
}

- (void)_addRemoteParticipantToAVCSessionIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  CFStringRef v6 = [(CSDConversation *)self avcSession];
  unsigned int v7 = [v6 isAudioReady];

  unsigned int v8 = [(CSDConversation *)self isRedirectingAudio];
  if (v8) {
    unsigned int v8 = [(CSDConversation *)self isOneToOneModeEnabled];
  }
  if ((v7 | v8) != 1)
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      id v13 = [v4 identifier];
      id v11 = "AVAudioClient not set up yet, delaying adding participant to AVCSession: %llu";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (![v4 audioVideoMode])
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      id v13 = [v4 identifier];
      id v11 = "Participant has no AV configured, ignoring to add the participant to the session: %llu";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v9 = [(CSDConversation *)self avcSession];
  objc_msgSend(v9, "addParticipant:withVideoEnabled:audioPaused:screenEnabled:", v4, +[TUConversationManager allowsVideo](TUConversationManager, "allowsVideo"), -[CSDConversation isAudioPaused](self, "isAudioPaused"), -[CSDConversation allowsScreenSharing](self, "allowsScreenSharing"));

LABEL_12:
}

- (void)_addParticipantsWaitingToBeAddedToAVCSession
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(CSDConversation *)self activeRemoteParticipants];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 134217984;
    long long v20 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [(CSDConversation *)self avcSession];
        unsigned __int8 v12 = objc_msgSend(v11, "containsRemoteParticipantWithIdentifier:", objc_msgSend(v10, "identifier"));

        id v13 = sub_100008DCC();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (!v14) {
            goto LABEL_16;
          }
          id v15 = [v10 identifier];
          *(_DWORD *)buf = v20;
          id v26 = v15;
          id v16 = v13;
          uint64_t v17 = "Not adding participant %llu to AVCSession now that AVAudioClient is set up because they're already in the AVCSession";
          goto LABEL_15;
        }
        if (v14)
        {
          id v18 = [v10 identifier];
          *(_DWORD *)buf = v20;
          id v26 = v18;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding participant to AVCSession now that AVAudioClient is set up: %llu", buf, 0xCu);
        }

        if ([v10 audioVideoMode])
        {
          id v13 = [(CSDConversation *)self avcSession];
          [v13 addParticipant:v10 withVideoEnabled:+[TUConversationManager allowsVideo] audioPaused:[(CSDConversation *)self isAudioPaused] screenEnabled:[(CSDConversation *)self allowsScreenSharing]];
          goto LABEL_16;
        }
        id v13 = sub_100008DCC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v10 identifier];
          *(_DWORD *)buf = v20;
          id v26 = v19;
          id v16 = v13;
          uint64_t v17 = "Participant has no AV configured, ignoring to add the participant to the session: %llu";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
        }
LABEL_16:
      }
      id v7 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)_startAVCSessionIfNecessary
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self avcSession];
  unsigned int v5 = [v4 isAudioReady];

  unsigned int v6 = [(CSDConversation *)self isRelaying];
  if (v6)
  {
    char v7 = v6;
    uint64_t v8 = [(CSDConversation *)self featureFlags];
    if (([v8 gftOnWatch] & 1) != 0
      || [(CSDConversation *)self isOneToOneModeEnabled])
    {
      unsigned int v9 = 1;
    }
    else if ([(CSDConversation *)self isScreening])
    {
      unsigned int v9 = [(CSDConversation *)self isOneToOneModeEnabled];
      if ((v7 & 1) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
      unsigned int v9 = 0;
    }
  }
  else if ([(CSDConversation *)self isScreening])
  {
    unsigned int v9 = [(CSDConversation *)self isOneToOneModeEnabled];
  }
  else
  {
    unsigned int v9 = 0;
  }
LABEL_9:
  unint64_t v10 = [(CSDConversation *)self avMode];
  id v11 = [(CSDConversation *)self idsSession];
  unsigned int v12 = [v11 localParticipantType];

  id v13 = [(CSDConversation *)self idsSession];
  unsigned int v14 = [v13 isJoined];

  if (v14 && v5 | v9 && v10 && v12 == 1)
  {
    unsigned __int8 v15 = [(CSDConversation *)self avcSessionInProgress];
    id v16 = sub_100008DCC();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        id v18 = [(CSDConversation *)self avcSession];
        int v35 = 138412290;
        CFStringRef v36 = v18;
        id v19 = "Skipped starting session since session start is already in progress %@";
        long long v20 = v16;
        uint32_t v21 = 12;
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v35, v21);
      }
    }
    else
    {
      if (v17)
      {
        long long v28 = [(CSDConversation *)self avcSession];
        int v35 = 138412290;
        CFStringRef v36 = v28;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Starting %@", (uint8_t *)&v35, 0xCu);
      }
      [(CSDConversation *)self setAvcSessionInProgress:1];
      long long v29 = sub_100008DCC();
      os_signpost_id_t v30 = [(CSDConversation *)self avcSession];
      os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v29, v30);

      long long v32 = sub_100008DCC();
      long long v33 = v32;
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "avcSessionStart", "", (uint8_t *)&v35, 2u);
      }

      id v34 = [(CSDConversation *)self report];
      -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:](self, "_emitRTCConnectionSetupEvent:participantIdentifier:", 3, objc_msgSend(v34, "hashForParticipantIdentifier:", -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")));

      id v16 = [(CSDConversation *)self avcSession];
      [v16 start];
    }
  }
  else
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(CSDConversation *)self idsSession];
      unsigned int v22 = [(__CFString *)v18 isJoined];
      CFStringRef v23 = @"NO";
      if (v22) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      if (v5) {
        CFStringRef v25 = @"YES";
      }
      else {
        CFStringRef v25 = @"NO";
      }
      int v35 = 138413314;
      CFStringRef v36 = v24;
      if (v9) {
        CFStringRef v26 = @"YES";
      }
      else {
        CFStringRef v26 = @"NO";
      }
      __int16 v37 = 2112;
      CFStringRef v38 = v25;
      if (v10) {
        CFStringRef v27 = @"NO";
      }
      else {
        CFStringRef v27 = @"YES";
      }
      __int16 v39 = 2112;
      CFStringRef v40 = v26;
      __int16 v41 = 2112;
      if (v12 == 1) {
        CFStringRef v23 = @"YES";
      }
      CFStringRef v42 = v27;
      __int16 v43 = 2112;
      CFStringRef v44 = v23;
      id v19 = "Skipped starting session since isJoined:%@ audioReady:%@ isRedirectingAudio :%@ isAVLess:%@ isLocalParticipantNormal: %@";
      long long v20 = v16;
      uint32_t v21 = 52;
      goto LABEL_32;
    }
  }
}

- (void)_cleanUpFromAVCSessionFailure
{
  BOOL v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self activitySessionManager];
  [v4 resetSessions];

  self->_spatialPersonaEnabled = 0;
  [(CSDConversation *)self refreshActiveParticipantsList];
  [(CSDConversation *)self cleanUpIDSSessionState];

  [(CSDConversation *)self _cleanUpHandoffMetricsIfNecessary];
}

- (void)setState:(int64_t)a3
{
  unsigned int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t state = self->_state;
    int v8 = 134218240;
    int64_t v9 = a3;
    __int16 v10 = 2048;
    int64_t v11 = state;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setting state to: %ld, from: %ld", (uint8_t *)&v8, 0x16u);
  }

  int64_t v7 = self->_state;
  self->_int64_t state = a3;
  [(CSDConversation *)self _handleStateChanged:a3 oldState:v7];
}

- (void)_handleStateChanged:(int64_t)a3 oldState:(int64_t)a4
{
  if (a3 != a4)
  {
    id v5 = [(CSDConversation *)self localParticipantBlobTracker];
    [v5 handleConversationStateUpdated];
  }
}

- (void)_cleanUpHandoffMetricsIfNecessary
{
  BOOL v3 = [(CSDConversation *)self addedHandoffParticipantToTime];
  id v4 = [v3 count];

  id v5 = [(CSDConversation *)self removedHandoffParticipantToTime];
  id v6 = [v5 count];

  int64_t v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 134218240;
    id v24 = v4;
    __int16 v25 = 2048;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cleanUpHandoffMetrics: addedHandoffParticipantToTimeCount: %lu, removedHandoffParticipantToTimeCount: %lu", (uint8_t *)&v23, 0x16u);
  }

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  if (v4)
  {
    int64_t v9 = +[NSNumber numberWithUnsignedLong:v4];
    [v8 setObject:v9 forKeyedSubscript:@"kCSDConversationAddedParticipantCount"];
  }
  if (v6)
  {
    __int16 v10 = +[NSNumber numberWithUnsignedLong:v6];
    [v8 setObject:v10 forKeyedSubscript:@"kCSDConversationRemovedParticipantCount"];
  }
  if ([v8 count])
  {
    int64_t v11 = +[CSDReportingController sharedInstance];
    unsigned int v12 = [(CSDConversation *)self tuConversation];
    [v11 handoffReportReceived:v8 forConversation:v12];
  }
  id v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  removedHandoffParticipants = self->_removedHandoffParticipants;
  self->_removedHandoffParticipants = v13;

  unsigned __int8 v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  addedHandoffParticipants = self->_addedHandoffParticipants;
  self->_addedHandoffParticipants = v15;

  BOOL v17 = +[NSMutableDictionary dictionary];
  startAddingHandoffParticipantToTime = self->_startAddingHandoffParticipantToTime;
  self->_startAddingHandoffParticipantToTime = v17;

  id v19 = +[NSMutableDictionary dictionary];
  addedHandoffParticipantToTime = self->_addedHandoffParticipantToTime;
  self->_addedHandoffParticipantToTime = v19;

  uint32_t v21 = +[NSMutableDictionary dictionary];
  removedHandoffParticipantToTime = self->_removedHandoffParticipantToTime;
  self->_removedHandoffParticipantToTime = v21;
}

- (void)cleanUpIDSSessionState
{
  if ((id)[(CSDConversation *)self state] == (id)4)
  {
    [(CSDConversation *)self _cancelTimeoutForLeavingConversation];
    [(CSDConversation *)self _restartIDSSessionIfNecessary];
    [(CSDConversation *)self setState:0];
  }
  else if ([(CSDConversation *)self state])
  {
    [(CSDConversation *)self setState:4];
    [(CSDConversation *)self _beginTimeoutForLeavingConversationWithReason:@"Cleaning up from AVCSession failure."];
    id v3 = [(CSDConversation *)self idsSession];
    [v3 leaveGroupSessionWithContext:0];
  }
}

- (void)_beginTimeoutForLeavingConversationWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversation *)self timeoutBlock];

  if (v6)
  {
    int64_t v7 = [(CSDConversation *)self timeoutBlock];
    dispatch_block_cancel(v7);
  }
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FD64;
  block[3] = &unk_100505558;
  objc_copyWeak(&v16, &location);
  id v8 = v4;
  id v15 = v8;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(CSDConversation *)self setTimeoutBlock:v9];

  __int16 v10 = [(CSDConversation *)self serverBag];
  dispatch_time_t v11 = dispatch_time(0, 1000000000 * (void)[v10 sessionCleanupTimeout]);
  unsigned int v12 = [(CSDConversation *)self queue];
  id v13 = [(CSDConversation *)self timeoutBlock];
  dispatch_after(v11, v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_cancelTimeoutForLeavingConversation
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self timeoutBlock];

  if (v4)
  {
    id v5 = [(CSDConversation *)self timeoutBlock];
    dispatch_block_cancel(v5);

    [(CSDConversation *)self setTimeoutBlock:0];
  }
}

- (void)_endCallIfNecessary
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self serverBag];
  unsigned __int8 v5 = [v4 isNoConversationParticipantEndCallEnabled];

  if (v5)
  {
    if ((id)[(CSDConversation *)self state] != (id)3) {
      return;
    }
    id v6 = [(CSDConversation *)self activeRemoteParticipants];
    if ([v6 count])
    {

LABEL_9:
      __int16 v10 = [(CSDConversation *)self noConversationParticipantTimeoutBlock];

      if (!v10) {
        return;
      }
      dispatch_time_t v11 = [(CSDConversation *)self noConversationParticipantTimeoutBlock];
      dispatch_block_cancel(v11);

      [(CSDConversation *)self setNoConversationParticipantTimeoutBlock:0];
      unsigned int v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_endCallIfNecessary: Cancel noConversationParticipantTimeoutBlock", (uint8_t *)buf, 2u);
      }
      goto LABEL_12;
    }
    id v8 = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
    id v9 = [v8 count];

    if ((unint64_t)v9 <= 1) {
      goto LABEL_9;
    }
    id v13 = [(CSDConversation *)self noConversationParticipantTimeoutBlock];

    if (v13)
    {
      unsigned int v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_endCallIfNecessary: noConversationParticipantTimeout is running, return", (uint8_t *)buf, 2u);
      }
LABEL_12:

      return;
    }
    objc_initWeak(buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040304;
    block[3] = &unk_100505698;
    objc_copyWeak(&v23, buf);
    dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
    [(CSDConversation *)self setNoConversationParticipantTimeoutBlock:v14];

    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(CSDConversation *)self serverBag];
      unsigned int v17 = [v16 noConversationParticipantTimeout];
      *(_DWORD *)__int16 v25 = 67109120;
      unsigned int v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "_endCallIfNecessary: started noConversationParticipantTimeout: %d", v25, 8u);
    }
    id v18 = [(CSDConversation *)self serverBag];
    dispatch_time_t v19 = dispatch_time(0, 1000000000 * (void)[v18 noConversationParticipantTimeout]);
    long long v20 = [(CSDConversation *)self queue];
    uint32_t v21 = [(CSDConversation *)self noConversationParticipantTimeoutBlock];
    dispatch_after(v19, v20, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(buf);
  }
  else
  {
    int64_t v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "disable noConversationParticipantEndCall due to server over-ride", (uint8_t *)buf, 2u);
    }
  }
}

- (void)_showLetMeInUIIfNecessary
{
  v2 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v2);

  id v3 = [(CSDConversation *)self serverBag];
  unsigned __int8 v4 = [v3 isLetMeInRequestUIForUnknownParticipantEnabled];

  if ((v4 & 1) == 0)
  {
    CFStringRef v36 = sub_100008DCC();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "disable showLetMeInUI due to server over-ride", buf, 2u);
    }
    goto LABEL_40;
  }
  if ((id)[(CSDConversation *)self state] == (id)3)
  {
    unsigned __int8 v5 = [(CSDConversation *)self link];

    if (v5)
    {
      CFStringRef v44 = objc_alloc_init((Class)NSMutableSet);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
      id v47 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v47)
      {
        uint64_t v46 = *(void *)v52;
        do
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(void *)v52 != v46) {
              objc_enumerationMutation(obj);
            }
            int64_t v7 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            id v8 = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
            id v9 = [v8 objectForKeyedSubscript:v7];

            id v10 = [(CSDConversation *)self localParticipantIdentifier];
            if (v10 != [v7 unsignedLongLongValue])
            {
              dispatch_time_t v11 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
              unsigned int v12 = [v11 objectForKeyedSubscript:v7];
              BOOL v13 = v12 || v9 == 0;
              BOOL v14 = !v13;

              if (v14)
              {
                v50[1] = 0;
                id v15 = IDSCopyTokenAndIDForTokenWithID();
                id v16 = 0;
                unsigned int v17 = [v15 _stripFZIDPrefix];
                id v18 = +[TUHandle normalizedHandleWithDestinationID:v17];

                id v19 = [objc_alloc((Class)TUConversationMember) initWithHandle:v18];
                long long v20 = [(CSDConversation *)self localMember];
                uint32_t v21 = [v20 handle];
                unsigned int v22 = +[TUHandle normalizedHandleWithDestinationID:v9];
                unsigned __int8 v23 = [v21 isEquivalentToHandle:v22];

                if ((v23 & 1) == 0)
                {
                  id v24 = [(CSDConversation *)self remoteMemberHandles];
                  unsigned __int8 v25 = [v24 containsObject:v18];

                  if ((v25 & 1) == 0) {
                    [v44 addObject:v19];
                  }
                }
              }
            }
          }
          id v47 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
        }
        while (v47);
      }

      if ([v44 count])
      {
        unsigned int v26 = sub_100008DCC();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v27 = [(CSDConversation *)self pendingRemoteMembers];
          long long v28 = [(CSDConversation *)self localMember];
          long long v29 = [v28 handle];
          *(_DWORD *)buf = 138412802;
          dispatch_time_t v56 = v44;
          __int16 v57 = 2112;
          id v58 = v27;
          __int16 v59 = 2112;
          unint64_t v60 = v29;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "add pending remote members: %@ to %@, localMember: %@", buf, 0x20u);
        }
        os_signpost_id_t v30 = [(CSDConversation *)self pendingRemoteMembers];
        id v31 = [v44 copy];
        [v30 unionSet:v31];
      }
      long long v32 = [(CSDConversation *)self pendingRemoteMembers];
      BOOL v33 = [v32 count] == 0;

      id v34 = [(CSDConversation *)self letMeInRequestUINotificationBlock];

      if (v33)
      {
        if (v34)
        {
          __int16 v37 = sub_100008DCC();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "No pendingRemoteMembers, cancel letMeInRequestUINotificationBlock", buf, 2u);
          }

          CFStringRef v38 = [(CSDConversation *)self letMeInRequestUINotificationBlock];
          dispatch_block_cancel(v38);

          [(CSDConversation *)self setLetMeInRequestUINotificationBlock:0];
        }
      }
      else if (v34)
      {
        int v35 = sub_100008DCC();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "waiting till existing letMeInRequestUINotification completes", buf, 2u);
        }
      }
      else
      {
        objc_initWeak((id *)buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100040A84;
        block[3] = &unk_100505698;
        objc_copyWeak(v50, (id *)buf);
        dispatch_block_t v39 = dispatch_block_create((dispatch_block_flags_t)0, block);
        [(CSDConversation *)self setLetMeInRequestUINotificationBlock:v39];

        CFStringRef v40 = [(CSDConversation *)self serverBag];
        dispatch_time_t v41 = dispatch_time(0, 1000000000 * (void)[v40 letMeInRequestUINotificationGracePeriod]);
        CFStringRef v42 = [(CSDConversation *)self queue];
        __int16 v43 = [(CSDConversation *)self letMeInRequestUINotificationBlock];
        dispatch_after(v41, v42, v43);

        objc_destroyWeak(v50);
        objc_destroyWeak((id *)buf);
      }
      CFStringRef v36 = v44;
LABEL_40:
    }
  }
}

- (void)_requestAVCBlobsIfNecessary
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  if ((id)[(CSDConversation *)self state] == (id)3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    unsigned __int8 v4 = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
    id v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v25;
      id v19 = v21;
      do
      {
        int64_t v7 = 0;
        do
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v7);
          id v9 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
          id v10 = [v9 objectForKeyedSubscript:v8];
          if (v10
            || (id v11 = [(CSDConversation *)self localParticipantIdentifier],
                v11 == [v8 unsignedLongLongValue]))
          {
          }
          else
          {
            unsigned int v12 = [(CSDConversation *)self inflightAVCBlobRecoveryBlocksByIdentifier];
            BOOL v13 = [v12 objectForKeyedSubscript:v8];
            BOOL v14 = v13 == 0;

            if (v14)
            {
              objc_initWeak(&location, self);
              id v15 = [(CSDConversation *)self serverBag];
              dispatch_time_t v16 = dispatch_time(0, 1000000000 * (void)[v15 AVCBlobRecoveryGracePeriod]);
              unsigned int v17 = [(CSDConversation *)self queue];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              v21[0] = sub_100041178;
              v21[1] = &unk_100505558;
              objc_copyWeak(&v22, &location);
              v21[2] = v8;
              dispatch_after(v16, v17, block);

              objc_destroyWeak(&v22);
              objc_destroyWeak(&location);
            }
          }
          int64_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v18 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
        id v5 = v18;
      }
      while (v18);
    }
  }
}

- (void)_removeMemberFromPendingMemberListForParticipant:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(CSDConversation *)self link];

  if (v6)
  {
    int64_t v7 = [v4 handle];
    id v8 = [(CSDConversation *)self memberWithHandle:v7];

    if (v8)
    {
      id v9 = [(CSDConversation *)self pendingRemoteMembers];
      unsigned int v10 = [v9 containsObject:v8];

      if (v10)
      {
        id v11 = sub_100008DCC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v12 = [(CSDConversation *)self pendingRemoteMembers];
          int v14 = 138412546;
          id v15 = v8;
          __int16 v16 = 2112;
          unsigned int v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "remove %@ from pendingRemoteMembers: %@", (uint8_t *)&v14, 0x16u);
        }
        BOOL v13 = [(CSDConversation *)self pendingRemoteMembers];
        [v13 removeObject:v8];
      }
    }
  }
}

- (void)_cancelInFlightAVCBlobRecoveryIfNecessary
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(CSDConversation *)self inflightAVCBlobRecoveryBlocksByIdentifier];
  id v5 = [v4 allKeys];

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138412290;
    long long v19 = v7;
    do
    {
      unsigned int v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
        unsigned int v12 = [(CSDConversation *)self serverProvidedParticipantIdentifiers];
        if ([v12 containsObject:v11])
        {
          BOOL v13 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
          int v14 = [v13 objectForKeyedSubscript:v11];

          if (!v14) {
            goto LABEL_13;
          }
        }
        else
        {
        }
        id v15 = sub_100008DCC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v19;
          uint64_t v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cancelling in flight AVC blob recovery for participant with identifier %@", buf, 0xCu);
        }

        __int16 v16 = [(CSDConversation *)self inflightAVCBlobRecoveryBlocksByIdentifier];
        unsigned int v17 = [v16 objectForKeyedSubscript:v11];
        dispatch_block_cancel(v17);

        id v18 = [(CSDConversation *)self inflightAVCBlobRecoveryBlocksByIdentifier];
        [v18 setObject:0 forKeyedSubscript:v11];

LABEL_13:
        unsigned int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }
}

- (void)_pruneRemoteParticipantsIfNecessary
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(CSDConversation *)self isWaitingToPruneParticipants])
  {
    [(CSDConversation *)self setWaitingToPruneParticipants:1];
    objc_initWeak(&location, self);
    id v4 = [(CSDConversation *)self serverBag];
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * (void)[v4 activeParticipantPruningTimeout]);
    id v6 = [(CSDConversation *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100041BA4;
    block[3] = &unk_100505558;
    objc_copyWeak(&v8, &location);
    void block[4] = self;
    dispatch_after(v5, v6, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)refreshActiveParticipantsList
{
  id v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversation *)self participantRefreshBlock];

  if (v4)
  {
    dispatch_time_t v5 = [(CSDConversation *)self participantRefreshBlock];
    dispatch_block_cancel(v5);
  }
  objc_initWeak(&location, self);
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  BOOL v13 = sub_10004206C;
  int v14 = &unk_100505698;
  objc_copyWeak(&v15, &location);
  dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, &v11);
  -[CSDConversation setParticipantRefreshBlock:](self, "setParticipantRefreshBlock:", v6, v11, v12, v13, v14);

  long long v7 = [(CSDConversation *)self serverBag];
  dispatch_time_t v8 = dispatch_time(0, (int64_t)[v7 activeParticipantRefreshDelay]);
  uint64_t v9 = [(CSDConversation *)self queue];
  unsigned int v10 = [(CSDConversation *)self participantRefreshBlock];
  dispatch_after(v8, v9, v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_reportConversationFailedWithFailureReason:(int64_t)a3 providerEndedReason:(unint64_t)a4
{
  long long v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  id v9 = objc_alloc_init((Class)CXCallFailureContext);
  [v9 setFailureReason:a3];
  [v9 setProviderEndedReason:a4];
  [(CSDConversation *)self setFailureContext:v9];
  dispatch_time_t v8 = [(CSDConversation *)self delegate];
  [v8 conversation:self failedWithContext:v9];
}

- (void)_reportConversationFailedWithProviderEndedReason:(unint64_t)a3
{
  dispatch_time_t v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v7 = objc_alloc_init((Class)CXCallFailureContext);
  [v7 setProviderEndedReason:a3];
  [v7 setFailureReason:a3];
  [(CSDConversation *)self setFailureContext:v7];
  dispatch_block_t v6 = [(CSDConversation *)self delegate];
  [v6 conversation:self failedWithContext:v7];
}

- (id)_stableExpanseIdentifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(CSDConversation *)self messagesGroupUUID];
  dispatch_time_t v5 = [v4 UUIDString];
  if ([v5 length])
  {
    unsigned __int8 v6 = [(CSDConversation *)self isOneToOneModeEnabled];

    if ((v6 & 1) == 0)
    {
      id v7 = [(CSDConversation *)self messagesGroupUUID];
      dispatch_time_t v8 = [v7 UUIDString];
      [v3 addObject:v8];

      goto LABEL_12;
    }
  }
  else
  {
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(CSDConversation *)self remoteMemberHandles];
  id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        BOOL v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) normalizedValue];
        [v3 addObject:v13];
      }
      id v10 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }
LABEL_12:

  [v3 sortUsingSelector:"caseInsensitiveCompare:"];
  int v14 = [v3 componentsJoinedByString:@"-"];
  id v15 = [v14 dataUsingEncoding:4];
  __int16 v16 = [v15 SHA1HexString];

  unsigned int v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [(CSDConversation *)self UUID];
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v16;
    __int16 v26 = 2112;
    long long v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_stableExpanseIdentifier %@ for %@ ", buf, 0x16u);
  }

  return v16;
}

- (void)_registerPluginsIfNecessary
{
  id v3 = [(CSDConversation *)self idsSession];
  unsigned int v4 = [v3 isJoined];

  if (v4)
  {
    id v10 = [(CSDConversation *)self virtualParticipantsByPluginName];
    dispatch_time_t v5 = [v10 objectForKeyedSubscript:@"PubSub"];
    if (v5)
    {
    }
    else
    {
      unsigned __int8 v6 = [(CSDConversation *)self activitySessions];
      id v7 = [v6 count];

      if (v7)
      {
        uint64_t v11 = IDSGroupSessionPluginNameKey;
        CFStringRef v12 = @"PubSub";
        dispatch_time_t v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
        id v9 = [(CSDConversation *)self idsSession];
        [v9 registerPluginWithOptions:v8];
      }
    }
  }
}

- (void)switchBackToOneToOneIfPossible
{
}

- (void)switchBackToOneToOneIfPossibleUsingDelay:(BOOL)a3
{
  BOOL v63 = a3;
  id v3 = [(CSDConversation *)self downgradeToOneToOneAfterDelayBlock];

  unsigned int v4 = self;
  if (v3)
  {
    dispatch_time_t v5 = [(CSDConversation *)self downgradeToOneToOneAfterDelayBlock];
    dispatch_block_cancel(v5);

    unsigned int v4 = self;
    [(CSDConversation *)self setDowngradeToOneToOneAfterDelayBlock:0];
  }
  unsigned __int8 v6 = [(CSDConversation *)v4 remoteMembers];
  id v64 = [v6 count];

  id v7 = [(CSDConversation *)self activeRemoteParticipants];
  dispatch_time_t v8 = (char *)[v7 count];
  id v9 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
  id v10 = [v9 count];

  int64_t v65 = [(CSDConversation *)self activeRemoteParticipantCountMinusEligibleAVLess];
  uint64_t v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    *(void *)long long v80 = [(CSDConversation *)self state];
    *(_WORD *)&v80[8] = 1024;
    unsigned int v81 = [(CSDConversation *)self isOneToOneModeEnabled];
    __int16 v82 = 2048;
    id v83 = v64;
    __int16 v84 = 2048;
    long long v85 = &v8[(void)v10];
    __int16 v86 = 2048;
    int64_t v87 = v65;
    __int16 v88 = 1024;
    BOOL v89 = v63;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking if oneToOne->1 downgrade available with state: %tu oneToOneMode: %d remoteMemberCount: %lu activeRemoteParticipantCount: %lu activeRemoteParticipantCountMinusEligibleAVLess: %lu useDelay: %d", buf, 0x36u);
  }

  CFStringRef v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = [(CSDConversation *)self activeRemoteParticipants];
    *(_DWORD *)buf = 138412290;
    *(void *)long long v80 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "activeRemoteParticipantsByIdentifier: %@", buf, 0xCu);
  }
  if ([(CSDConversation *)self isOneToOneModeEnabled])
  {
    int v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Returning - isOneToOneModeEnabled is already true", buf, 2u);
    }
LABEL_10:

    return;
  }
  if ((id)[(CSDConversation *)self state] != (id)3)
  {
    int v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Returning - Conversation state is not Joined", buf, 2u);
    }
    goto LABEL_10;
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v15 = [(CSDConversation *)self activeRemoteParticipants];
  uint64_t v16 = 0;
  id v17 = [v15 countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v74;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v74 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        long long v21 = [v20 capabilities];
        if ([v21 isUPlusOneAVLessAvailable])
        {
          BOOL v22 = [v20 audioVideoMode] == 0;

          if (v22)
          {
            long long v23 = sub_100008DCC();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)long long v80 = v20;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "switchBackToOneToOneIfPossibleUsingDelay: remoteParticipant %@ is AVLess", buf, 0xCu);
            }

            ++v16;
          }
        }
        else
        {
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v73 objects:v78 count:16];
    }
    while (v17);
  }

  if (v65 == 1)
  {
    long long v24 = [(CSDConversation *)self featureFlags];
    if ([v24 uPlusNDowngrade])
    {
      uint64_t v25 = [(CSDConversation *)self serverBag];
      unsigned int v26 = [v25 isUPlusNDowngradeAvailable];
    }
    else
    {
      unsigned int v26 = 0;
    }

    long long v28 = [(CSDConversation *)self activeRemoteParticipants];
    long long v29 = [v28 anyObject];
    os_signpost_id_t v30 = [v29 capabilities];
    unsigned int v31 = [v30 isUPlusNDowngradeAvailable];

    long long v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)long long v80 = v16;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "switchBackToOneToOneIfPossibleUsingDelay: avLessParticipantCount: %lu", buf, 0xCu);
    }

    if (v64 == (id)1 || v16)
    {
      BOOL v33 = [(CSDConversation *)self link];
      if (v33)
      {

        if ((v26 & v31 & 1) == 0) {
          return;
        }
      }
    }
    else if ((v26 & v31) != 1)
    {
      return;
    }
    if ([(CSDConversation *)self isScreenEnabled]
      || ([(CSDConversation *)self activeRemoteParticipants],
          id v34 = objc_claimAutoreleasedReturnValue(),
          [v34 anyObject],
          int v35 = objc_claimAutoreleasedReturnValue(),
          unsigned int v36 = [v35 isScreenEnabled],
          v35,
          v34,
          (v36 & 1) != 0))
    {
      int v37 = 0;
    }
    else
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      CFStringRef v38 = [(CSDConversation *)self activitySessions];
      id v39 = [v38 countByEnumeratingWithState:&v69 objects:v77 count:16];
      if (v39)
      {
        int v37 = v36 ^ 1;
        uint64_t v40 = *(void *)v70;
        while (2)
        {
          for (j = 0; j != v39; j = (char *)j + 1)
          {
            if (*(void *)v70 != v40) {
              objc_enumerationMutation(v38);
            }
            CFStringRef v42 = [*(id *)(*((void *)&v69 + 1) + 8 * (void)j) activity];
            unsigned __int8 v43 = [v42 isScreenSharingActivity];

            if (v43)
            {
              int v37 = 0;
              goto LABEL_58;
            }
          }
          id v39 = [v38 countByEnumeratingWithState:&v69 objects:v77 count:16];
          if (v39) {
            continue;
          }
          break;
        }
      }
      else
      {
        int v37 = 1;
      }
LABEL_58:
    }
    CFStringRef v44 = [(CSDConversation *)self featureFlags];
    if ([v44 uPlusOneScreenSharing])
    {
      id v45 = [(CSDConversation *)self activeRemoteParticipants];
      uint64_t v46 = [v45 anyObject];
      id v47 = [v46 capabilities];
      unsigned int v48 = [v47 isUPlusOneScreenShareAvailable];

      if (((v48 | v37) & 1) == 0) {
        return;
      }
    }
    else
    {

      if (!v37) {
        return;
      }
    }
    long long v49 = [(CSDConversation *)self featureFlags];
    if ([v49 gftDowngradeToOneToOne])
    {
      long long v50 = [(CSDConversation *)self serverBag];
      unsigned int v51 = [v50 isGFTDowngradeToOneToOneAvailable];
    }
    else
    {
      unsigned int v51 = 0;
    }

    long long v52 = [(CSDConversation *)self activeRemoteParticipants];
    long long v53 = [v52 anyObject];
    long long v54 = [v53 capabilities];
    unsigned int v55 = [v54 isGFTDowngradeToOneToOneAvailable];

    if (v51 & v55)
    {
      if (v63)
      {
        objc_initWeak((id *)buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        void block[2] = sub_100042F4C;
        block[3] = &unk_100505698;
        objc_copyWeak(&v68, (id *)buf);
        dispatch_block_t v56 = dispatch_block_create((dispatch_block_flags_t)0, block);
        [(CSDConversation *)self setDowngradeToOneToOneAfterDelayBlock:v56];

        [(CSDConversation *)self sessionSwitchTimeout];
        dispatch_time_t v58 = dispatch_time(0, (uint64_t)(v57 * 1000000000.0));
        __int16 v59 = [(CSDConversation *)self queue];
        unint64_t v60 = [(CSDConversation *)self downgradeToOneToOneAfterDelayBlock];
        dispatch_after(v58, v59, v60);

        objc_destroyWeak(&v68);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        unsigned int v62 = sub_100008DCC();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "We only have 1 remote participant that AV compatible, requesting to move back to U+1 mode", buf, 2u);
        }

        [(CSDConversation *)self setOneToOneModeEnabled:1];
      }
    }
    else
    {
      long long v61 = sub_100008DCC();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)long long v80 = v51;
        *(_WORD *)&v80[4] = 1024;
        *(_DWORD *)&v80[6] = v55;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Screen sharing has ended but not requesting to move back to U+1 mode since localDowngradeAvailable:%d remoteDowngradeAvailable:%d", buf, 0xEu);
      }
    }
  }
  else
  {
    long long v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Returning - active remote participants is greater than 1 or zero", buf, 2u);
    }
  }
}

- (void)continueHandoffAudioRouteForIdentifier:(unint64_t)a3 participantLeft:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  dispatch_time_t v8 = [(CSDConversation *)self audioRoutesByParticipantIdentifier];
  id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = sub_100008DCC();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      int v16 = 134217984;
      unint64_t v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Did not retrieve a route identifier for participant identifier %llu", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_8;
  }
  if (v12)
  {
    int v16 = 138412546;
    unint64_t v17 = (unint64_t)v10;
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Retrieved route identifier %@ for participant identifier %llu", (uint8_t *)&v16, 0x16u);
  }

  BOOL v13 = +[NSNotificationCenter defaultCenter];
  int v14 = +[CSDHandoffAudioController continueHandoffAudioRouteNotification];
  [v13 postNotificationName:v14 object:v10];

  if (v4)
  {
    uint64_t v11 = [(CSDConversation *)self audioRoutesByParticipantIdentifier];
    id v15 = +[NSNumber numberWithUnsignedLongLong:a3];
    [v11 setObject:0 forKeyedSubscript:v15];

LABEL_8:
  }
}

- (FTDeviceSupport)deviceSupport
{
  deviceSupport = self->_deviceSupport;
  if (deviceSupport)
  {
    id v3 = deviceSupport;
  }
  else
  {
    id v3 = +[FTDeviceSupport sharedInstance];
  }

  return v3;
}

- (void)updateConversationParticipantToHaveMatchingSiriDisplayName:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(CSDConversation *)self remoteMembers];
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 handle];
        uint64_t v11 = [v4 handle];
        if ([v10 isEquivalentToHandle:v11])
        {
          BOOL v12 = [v9 handle];
          BOOL v13 = [v12 siriDisplayName];
          id v14 = [v13 length];

          if (v14)
          {
            id v15 = [v9 handle];
            int v16 = [v15 siriDisplayName];
            unint64_t v17 = [v4 handle];
            [v17 setSiriDisplayName:v16];

            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
LABEL_12:
}

- (void)_generateHandoffReportIfNecessaryForUpdatedParticipantID:(unint64_t)a3 isAddParticipant:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    long long v51 = 0uLL;
    long long v52 = 0uLL;
    long long v49 = 0uLL;
    long long v50 = 0uLL;
    uint64_t v7 = [(CSDConversation *)self addedHandoffParticipants];
    id v8 = [v7 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v50;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if ([v12 identifier] == (id)a3)
          {
            uint64_t v18 = [(CSDConversation *)self addedHandoffParticipantToTime];
            goto LABEL_22;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v49 objects:v62 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    long long v47 = 0uLL;
    long long v48 = 0uLL;
    *((void *)&v45 + 1) = 0;
    long long v46 = 0uLL;
    uint64_t v7 = [(CSDConversation *)self removedHandoffParticipants];
    id v13 = [v7 countByEnumeratingWithState:&v45 objects:v61 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v46;
      while (2)
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
          if ([v12 identifier] == (id)a3)
          {
            uint64_t v18 = [(CSDConversation *)self removedHandoffParticipantToTime];
LABEL_22:
            long long v19 = (void *)v18;
            long long v20 = +[NSDate now];
            long long v21 = [v12 handle];
            [v19 setObject:v20 forKey:v21];

            id v17 = v12;
            goto LABEL_23;
          }
        }
        id v14 = [v7 countByEnumeratingWithState:&v45 objects:v61 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  id v17 = 0;
LABEL_23:

  if (v17)
  {
    long long v22 = [v17 handle];
    long long v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v24 = @"NO";
      *(_DWORD *)buf = 134218498;
      unint64_t v56 = a3;
      __int16 v57 = 2112;
      if (v4) {
        CFStringRef v24 = @"YES";
      }
      CFStringRef v58 = v24;
      __int16 v59 = 2112;
      unint64_t v60 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "updatedParticipantID: %llu, isAddParticipant: %@, handle: %@", buf, 0x20u);
    }

    uint64_t v25 = [(CSDConversation *)self addedHandoffParticipantToTime];
    unsigned int v26 = [v25 allKeys];
    if ([v26 containsObject:v22])
    {
      long long v27 = [(CSDConversation *)self removedHandoffParticipantToTime];
      long long v28 = [v27 allKeys];
      if ([v28 containsObject:v22])
      {
        long long v29 = [(CSDConversation *)self startAddingHandoffParticipantToTime];
        os_signpost_id_t v30 = [v29 allKeys];
        unsigned int v31 = [v30 containsObject:v22];

        if (!v31)
        {
LABEL_36:

          goto LABEL_37;
        }
        long long v32 = [(CSDConversation *)self addedHandoffParticipants];
        [v32 removeObject:v17];

        BOOL v33 = [(CSDConversation *)self removedHandoffParticipants];
        [v33 removeObject:v17];

        v53[0] = @"kCSDConversationStartAddingParticipant";
        id v34 = [(CSDConversation *)self startAddingHandoffParticipantToTime];
        int v35 = [v34 objectForKeyedSubscript:v22];
        v54[0] = v35;
        v53[1] = @"kCSDConversationAddedParticipant";
        unsigned int v36 = [(CSDConversation *)self addedHandoffParticipantToTime];
        int v37 = [v36 objectForKeyedSubscript:v22];
        v54[1] = v37;
        v53[2] = @"kCSDConversationRemovedParticipant";
        CFStringRef v38 = [(CSDConversation *)self removedHandoffParticipantToTime];
        id v39 = [v38 objectForKeyedSubscript:v22];
        v54[2] = v39;
        uint64_t v25 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];

        uint64_t v40 = sub_100008DCC();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v56 = (unint64_t)v25;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "handoff report: %@", buf, 0xCu);
        }

        dispatch_time_t v41 = +[CSDReportingController sharedInstance];
        CFStringRef v42 = [(CSDConversation *)self tuConversation];
        [v41 handoffReportReceived:v25 forConversation:v42];

        unsigned __int8 v43 = [(CSDConversation *)self startAddingHandoffParticipantToTime];
        [v43 removeObjectForKey:v22];

        CFStringRef v44 = [(CSDConversation *)self addedHandoffParticipantToTime];
        [v44 removeObjectForKey:v22];

        unsigned int v26 = [(CSDConversation *)self removedHandoffParticipantToTime];
        [v26 removeObjectForKey:v22];
      }
      else
      {
      }
    }

    goto LABEL_36;
  }
LABEL_37:
}

- (void)postSharePlayActivityDidChangeNotificationIfNecessary:(id)a3
{
  id v9 = a3;
  if ((id)[(CSDConversation *)self state] == (id)3)
  {
    BOOL v4 = [v9 activity];
    unsigned __int8 v5 = [v4 isSystemActivity];

    if ((v5 & 1) == 0)
    {
      if (![v9 isLocallyInitiated]
        || ([v9 activity],
            id v6 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v7 = [v6 isScreenSharingActivity],
            v6,
            (v7 & 1) == 0))
      {
        if (([v9 isLocallyInitiated] & 1) == 0)
        {
          id v8 = +[NSNotificationCenter defaultCenter];
          [v8 postNotificationName:@"CSDSharePlayRemoteActivityDidChangeNotification" object:self];
        }
      }
    }
  }
}

- (void)_applyUpdateFromDataBlobForRemoteParticipant:(id)a3 participantIdentifier:(unint64_t)a4
{
  id v15 = a3;
  id v6 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  unsigned __int8 v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = [(CSDConversation *)self delegate];
  if (v8)
  {
    uint64_t v10 = [v8 capabilities];
    uint64_t v11 = [v15 capabilities];
    if ([v10 isEqualToCapabilities:v11])
    {
      unsigned int v12 = [v8 isSpatialPersonaEnabled];
      unsigned int v13 = [v15 isSpatialPersonaEnabled];

      if (v12 == v13) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    id v14 = [v15 capabilities];
    [v8 setCapabilities:v14];

    objc_msgSend(v8, "setSpatialPersonaEnabled:", objc_msgSend(v15, "isSpatialPersonaEnabled"));
    objc_msgSend(v8, "setSpatialPersonaGenerationCounter:", objc_msgSend(v15, "spatialPersonaGenerationCounter"));
    [v9 conversation:self updatedActiveParticipant:v8];
  }
LABEL_7:
}

- (BOOL)isScreenSharingInitiationAvailable
{
  v2 = [(CSDConversation *)self sharePlaySystemStateObserver];
  unsigned __int8 v3 = [v2 allowScreenSharingInitiation];

  return v3;
}

- (void)session:(id)a3 didJoinGroup:(BOOL)a4 participantIdentifiers:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = sub_100008DCC();
  unsigned int v13 = [(CSDConversation *)self idsSession];
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v12, v13);

  id v15 = sub_100008DCC();
  int v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v25[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v14, "idsSessionJoin", "", (uint8_t *)v25, 2u);
  }

  id v17 = [(CSDConversation *)self report];
  -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:](self, "_emitRTCConnectionSetupEvent:participantIdentifier:", 2, objc_msgSend(v17, "hashForParticipantIdentifier:", -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")));

  uint64_t v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v25[0] = 67109378;
    v25[1] = v7;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "didJoinGroup: %d error: %@", (uint8_t *)v25, 0x12u);
  }

  long long v19 = [(CSDConversation *)self delegate];
  if (v7)
  {
    [(CSDConversation *)self setMemberIdentifiers:v9];
    [(CSDConversation *)self _startAVCSessionIfNecessary];
    [(CSDConversation *)self setLocalParticipantAudioVideoMode:[(CSDConversation *)self avMode] presentationMode:[(CSDConversation *)self presentationMode]];
    [(CSDConversation *)self createScreenCapturePickerIfNecessary];
    if ((id)[(CSDConversation *)self state] == (id)2)
    {
      long long v20 = [(CSDConversation *)self localMember];
      if ([v20 isLightweightMember])
      {

LABEL_14:
        long long v23 = sub_100008DCC();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Joining conversation without AVC session for lightweight device", (uint8_t *)v25, 2u);
        }

        [(CSDConversation *)self setState:3];
        [(CSDConversation *)self setHasJoined:1];
        [(CSDConversation *)self createContentSharingSessionIfNecessary];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained conversationChanged:self];

        [(CSDConversation *)self _launchApplicationsForActivitiesIfNecessary];
        goto LABEL_17;
      }
      unint64_t v22 = [(CSDConversation *)self avMode];

      if (!v22) {
        goto LABEL_14;
      }
    }
LABEL_17:
    [(CSDConversation *)self _registerPluginsIfNecessary];
    [v19 conversationConnectionDidStart:self];
    goto LABEL_18;
  }
  long long v21 = sub_100008DCC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1003A73FC();
  }

  [(CSDConversation *)self setState:0];
  -[CSDConversation _reportConversationFailedWithProviderEndedReason:](self, "_reportConversationFailedWithProviderEndedReason:", (char *)[v10 code] + 2000);
LABEL_18:
  [v19 conversationChanged:self];
}

- (void)session:(id)a3 didLeaveGroupWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversation *)self delegate];
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didLeaveGroupWithError: %@", buf, 0xCu);
  }

  if (v7)
  {
    uint64_t v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v30 = [(CSDConversation *)self UUID];
      *(_DWORD *)buf = 138412802;
      id v37 = v6;
      __int16 v38 = 2112;
      id v39 = v30;
      __int16 v40 = 2112;
      id v41 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CSDIDSGroupSession %@ failed to leave group for conversation UUID %@: %@", buf, 0x20u);
    }
  }
  [v9 conversationDidLeave:self];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unsigned int v12 = [(CSDConversation *)self activeRemoteParticipants];
  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v17 setStreamToken:0];
        [v17 setScreenToken:0];
        [v17 setCaptionsToken:0];
      }
      id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  uint64_t v18 = +[NSMutableDictionary dictionary];
  virtualParticipantsByPluginName = self->_virtualParticipantsByPluginName;
  self->_virtualParticipantsByPluginName = v18;

  [(CSDConversation *)self setAvcSessionInProgress:0];
  [(CSDConversation *)self _stopAVCSession];
  [(CSDConversation *)self setSplitSessionSecondary:0];
  id v20 = objc_alloc_init((Class)NSMutableSet);
  [(CSDConversation *)self setPendingRemoteMembers:v20];

  long long v21 = [(CSDConversation *)self letMeInRequestUINotificationBlock];

  if (v21)
  {
    unint64_t v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Cancel letMeInRequestUINotificationBlock", buf, 2u);
    }

    long long v23 = [(CSDConversation *)self letMeInRequestUINotificationBlock];
    dispatch_block_cancel(v23);

    [(CSDConversation *)self setLetMeInRequestUINotificationBlock:0];
  }
  CFStringRef v24 = [(CSDConversation *)self activitySessionManager];
  [v24 resetSessions];

  self->_spatialPersonaEnabled = 0;
  uint64_t v25 = [(CSDConversation *)self localMember];
  unsigned int v26 = [v25 isLightweightMember];

  if (v26) {
    [v9 conversationInvalidated:self];
  }
  uint64_t v27 = [(CSDConversation *)self avcSession];
  if (!v27
    || (long long v28 = (void *)v27, v29 = [(CSDConversation *)self isAudioReady],
                           v28,
                           (v29 & 1) == 0))
  {
    [(CSDConversation *)self setAvcSession:0];
    [(CSDConversation *)self setState:0];
    [(CSDConversation *)self _cancelTimeoutForLeavingConversation];
    if (!v7) {
      [(CSDConversation *)self _reportConversationFailedWithProviderEndedReason:528];
    }
    [(CSDConversation *)self _cleanUpHandoffMetricsIfNecessary];
    [(CSDConversation *)self _restartIDSSessionIfNecessary];
  }
  [v9 conversationChanged:self];
}

- (void)session:(id)a3 endedWithError:(id)a4 reason:(unsigned int)a5
{
  id v7 = a4;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversation *)self delegate];
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unsigned int v25 = [(CSDConversation *)self isOneToOneModeEnabled];
    unsigned int v26 = [(CSDConversation *)self remoteMembers];
    int v27 = 138413058;
    id v28 = v7;
    __int16 v29 = 1024;
    unsigned int v30 = a5;
    __int16 v31 = 1024;
    unsigned int v32 = v25;
    __int16 v33 = 2048;
    id v34 = [v26 count];
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "endedWithError: %@ reason: %d, isOneToOneModeEnabled: %d, remoteMembers count: %lu", (uint8_t *)&v27, 0x22u);
  }
  [(CSDConversation *)self setAvcSession:0];
  [(CSDConversation *)self setAvcSessionInProgress:0];
  uint64_t v11 = +[NSMutableDictionary dictionary];
  virtualParticipantsByPluginName = self->_virtualParticipantsByPluginName;
  self->_virtualParticipantsByPluginName = v11;

  [(CSDConversation *)self _cancelTimeoutForLeavingConversation];
  [(CSDConversation *)self _cleanUpHandoffMetricsIfNecessary];
  [(CSDConversation *)self setSplitSessionSecondary:0];
  id v13 = [(CSDConversation *)self activitySessionManager];
  [v13 resetSessions];

  self->_spatialPersonaEnabled = 0;
  id v14 = [(CSDConversation *)self localMember];
  unsigned int v15 = [v14 isLightweightMember];

  if (v15) {
    [v9 conversationInvalidated:self];
  }
  if (a5 == 48)
  {
    id v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unknown participant added while in lockdown mode, cleaning up", (uint8_t *)&v27, 2u);
    }

    [(CSDConversation *)self _cleanUpConversation];
    id v17 = self;
    uint64_t v18 = 14;
    uint64_t v19 = 2048;
    goto LABEL_13;
  }
  if (a5 == 44)
  {
    int v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Kicked from the conversation, cleaning up", (uint8_t *)&v27, 2u);
    }

    [(CSDConversation *)self _cleanUpConversation];
    id v17 = self;
    uint64_t v18 = 7;
    uint64_t v19 = 2044;
LABEL_13:
    [(CSDConversation *)v17 _reportConversationFailedWithFailureReason:v18 providerEndedReason:v19];
    goto LABEL_14;
  }
  if ([(CSDConversation *)self isOneToOneModeEnabled]
    && ([(CSDConversation *)self remoteMembers],
        long long v21 = objc_claimAutoreleasedReturnValue(),
        id v22 = [v21 count],
        v21,
        v22 == (id)1))
  {
    long long v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "U + 1, no need to recreate session, cleaning up", (uint8_t *)&v27, 2u);
    }

    [(CSDConversation *)self _cleanUpConversation];
  }
  else
  {
    [(CSDConversation *)self _reportConversationFailedWithProviderEndedReason:a5 + 2000];
    if (v7)
    {
      CFStringRef v24 = [(CSDConversation *)self idsSession];
      [v24 restart];
    }
  }
LABEL_14:
  [(CSDConversation *)self setState:0];
  [v9 conversationChanged:self];
}

- (void)updateParticipantsWithDestinationIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CSDConversation *)self activeParticipants];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 identifier]);
        id v13 = [v4 objectForKeyedSubscript:v12];

        if (v13) {
          [v11 setActiveIDSDestination:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)reviveOrInvalidateCachedConversationIfNecessary
{
  v2 = self;
  unsigned __int8 v3 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(CSDConversation *)v2 isFromStorage])
  {
    uint64_t v4 = [(CSDConversation *)v2 serverProvidedParticipantIdentifiers];
    if (v4)
    {
      unsigned __int8 v5 = (void *)v4;
      id v6 = [(CSDConversation *)v2 serverProvidedLightweightParticipantIdentifiers];

      if (v6)
      {
        unsigned int v32 = [(CSDConversation *)v2 delegate];
        int v35 = +[NSMutableSet set];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id obj = [(CSDConversation *)v2 serverProvidedLightweightParticipantIdentifiers];
        id v37 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v37)
        {
          uint64_t v36 = *(void *)v44;
          id v34 = v2;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v44 != v36) {
                objc_enumerationMutation(obj);
              }
              uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              uint64_t v9 = [(CSDConversation *)v2 activeLightweightParticipantDestinationsByIdentifier];
              id v10 = [v9 objectForKeyedSubscript:v8];

              if (v10)
              {
                uint64_t v38 = v8;
                long long v41 = 0u;
                long long v42 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                uint64_t v11 = [(CSDConversation *)v2 lightweightMembers];
                id v12 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
                if (v12)
                {
                  id v13 = v12;
                  uint64_t v14 = *(void *)v40;
LABEL_12:
                  uint64_t v15 = 0;
                  while (1)
                  {
                    if (*(void *)v40 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    long long v16 = *(void **)(*((void *)&v39 + 1) + 8 * v15);
                    long long v17 = [v16 handle];
                    uint64_t v18 = +[TUHandle normalizedHandleWithDestinationID:v10];
                    unsigned __int8 v19 = [v17 isEquivalentToHandle:v18];

                    if (v19) {
                      break;
                    }
                    if (v13 == (id)++v15)
                    {
                      id v13 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
                      if (v13) {
                        goto LABEL_12;
                      }
                      goto LABEL_18;
                    }
                  }
                  id v20 = v16;

                  v2 = v34;
                  uint64_t v8 = v38;
                  if (v20) {
                    goto LABEL_21;
                  }
                }
                else
                {
LABEL_18:

                  v2 = v34;
                  uint64_t v8 = v38;
                }
              }
              [v35 addObject:v8];
              id v20 = 0;
LABEL_21:
            }
            id v37 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
          }
          while (v37);
        }

        long long v21 = [(CSDConversation *)v2 serverProvidedParticipantIdentifiers];
        if ([v21 count])
        {
        }
        else
        {
          id v22 = [v35 count];

          if (!v22)
          {
            unsigned int v30 = sub_100008DCC();
            __int16 v29 = v32;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v31 = [(CSDConversation *)v2 UUID];
              *(_DWORD *)buf = 138412290;
              long long v48 = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Invalidating cached conversation: %@, no remote active participants were found.", buf, 0xCu);
            }
            [v32 conversationInvalidated:v2];
            goto LABEL_29;
          }
        }
        long long v23 = sub_100008DCC();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v24 = [(CSDConversation *)v2 UUID];
          unsigned int v25 = [(CSDConversation *)v2 activeParticipantDestinationsByIdentifier];
          unsigned int v26 = (char *)[v25 count];
          int v27 = [(CSDConversation *)v2 serverProvidedLightweightParticipantIdentifiers];
          id v28 = [v27 count];
          *(_DWORD *)buf = 138412546;
          long long v48 = v24;
          __int16 v49 = 2048;
          long long v50 = &v26[(void)v28];
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Activating cached conversation with UUID: %@ since %lu remote participants were still found to be active.", buf, 0x16u);
        }
        [(CSDConversation *)v2 setFromStorage:0];
        __int16 v29 = v32;
        [v32 conversationChanged:v2];
LABEL_29:
      }
    }
  }
}

- (void)session:(id)a3 receivedActiveParticipantDestinationsByIdentifier:(id)a4
{
  id v33 = a3;
  id v34 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v34 allKeys];
  uint64_t v8 = +[NSSet setWithArray:v7];
  [(CSDConversation *)self setServerProvidedParticipantIdentifiers:v8];

  [(CSDConversation *)self setActiveParticipantDestinationsByIdentifier:v34];
  uint64_t v9 = [(CSDConversation *)self recentlyLeftParticipantIdentifiers];
  [v9 removeAllObjects];

  if (![(CSDConversation *)self _endScreenCallIfNecessary])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v10 = v34;
    id v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16, v33);
    if (!v11) {
      goto LABEL_21;
    }
    uint64_t v12 = *(void *)v39;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v15 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
        long long v16 = [v15 objectForKeyedSubscript:v14];

        if (v16)
        {
          long long v17 = [v10 objectForKeyedSubscript:v14];
          [v16 setActiveIDSDestination:v17];

          id v18 = [(CSDConversation *)self localParticipantIdentifier];
          if (v18 == [v16 identifier])
          {
            unsigned __int8 v19 = sub_100008DCC();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v43 = v16;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found cached pending-participant, do not add local participant: %@", buf, 0xCu);
            }

            id v20 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
            [v20 removeObjectForKey:v14];
          }
          else
          {
            long long v21 = [(CSDConversation *)self featureFlags];
            if ([v21 controlMessageOverQREnabled])
            {
              id v22 = [(CSDConversation *)self serverBag];
              unsigned __int8 v23 = [v22 isControlMessageOverQREnabled];

              if (v23)
              {
                objc_initWeak((id *)buf, self);
                CFStringRef v24 = [(CSDConversation *)self serverBag];
                dispatch_time_t v25 = dispatch_time(0, 1000000 * (void)[v24 addParticipantFromQRTime]);
                unsigned int v26 = [(CSDConversation *)self queue];
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                void block[2] = sub_1000450F4;
                block[3] = &unk_1005056E8;
                objc_copyWeak(&v37, (id *)buf);
                void block[4] = self;
                void block[5] = v14;
                id v36 = v16;
                dispatch_after(v25, v26, block);

                objc_destroyWeak(&v37);
                objc_destroyWeak((id *)buf);
                goto LABEL_19;
              }
            }
            else
            {
            }
            int v27 = sub_100008DCC();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v43 = v16;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Found cached pending-participant, adding as active-participant, csdParticipant: %@", buf, 0xCu);
            }

            [(CSDConversation *)self addActiveParticipant:v16];
            id v28 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
            [v28 removeObjectForKey:v14];
          }
        }
LABEL_19:
      }
      id v11 = [v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (!v11)
      {
LABEL_21:

        __int16 v29 = [(CSDConversation *)self featureFlags];
        if ([v29 controlMessageOverQREnabled])
        {
          unsigned int v30 = [(CSDConversation *)self serverBag];
          unsigned __int8 v31 = [v30 isControlMessageOverQREnabled];

          if (v31)
          {
LABEL_26:
            [(CSDConversation *)self reviveOrInvalidateCachedConversationIfNecessary];
            [(CSDConversation *)self _requestAVCBlobsIfNecessary];
            [(CSDConversation *)self _cancelInFlightAVCBlobRecoveryIfNecessary];
            [(CSDConversation *)self _showLetMeInUIIfNecessary];
            [(CSDConversation *)self _endCallIfNecessary];
            [(CSDConversation *)self _pruneRemoteParticipantsIfNecessary];
            break;
          }
        }
        else
        {
        }
        unsigned int v32 = +[NSMutableDictionary dictionary];
        [(CSDConversation *)self setPendingConversationParticipantsByIdentifier:v32];

        goto LABEL_26;
      }
    }
  }
}

- (void)session:(id)a3 receivedActiveLightweightParticipantDestinationsByIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v5 allKeys];
  uint64_t v8 = +[NSSet setWithArray:v7];
  [(CSDConversation *)self setServerProvidedLightweightParticipantIdentifiers:v8];

  [(CSDConversation *)self setActiveLightweightParticipantDestinationsByIdentifier:v5];
  if (![(CSDConversation *)self _endScreenCallIfNecessary])
  {
    [(CSDConversation *)self reviveOrInvalidateCachedConversationIfNecessary];
    [(CSDConversation *)self _pruneRemoteParticipantsIfNecessary];
  }
}

- (void)sessionDidTerminate:(id)a3
{
  uint64_t v4 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDConversation *)self setState:0];
  [(CSDConversation *)self _cancelTimeoutForLeavingConversation];
  [(CSDConversation *)self _cleanUpHandoffMetricsIfNecessary];
  [(CSDConversation *)self _restartIDSSessionIfNecessary];
  id v5 = [(CSDConversation *)self delegate];
  [v5 conversationChanged:self];
}

- (void)session:(id)a3 didReceiveLocalParticipantType:(unsigned __int16)a4 error:(id)a5
{
  int v5 = a4;
  id v7 = (__CFString *)a5;
  uint64_t v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    uint64_t v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(CSDConversation *)self UUID];
      int v39 = 138412546;
      CFStringRef v40 = v10;
      __int16 v41 = 2112;
      CFStringRef v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requested audio/video mode changed for conversation %@ failed with error %@", (uint8_t *)&v39, 0x16u);
    }
    goto LABEL_54;
  }
  if ((id)[(CSDConversation *)self state] == (id)2 || (id)[(CSDConversation *)self state] == (id)3)
  {
    if (v5 == 1)
    {
      if ((id)[(CSDConversation *)self avMode] == (id)1
        || (id)[(CSDConversation *)self avMode] == (id)2)
      {
        uint64_t v15 = sub_100008DCC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v39) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Configuring session since local participant type is Normal", (uint8_t *)&v39, 2u);
        }

        unint64_t v16 = [(CSDConversation *)self avMode];
        long long v17 = [(CSDConversation *)self avcSession];
        [v17 setAudioEnabled:1];
        [v17 setVideo:v16 == 2];
        id v18 = [(CSDConversation *)self expectedVideoEnabled];

        if (v18)
        {
          unsigned __int8 v19 = [(CSDConversation *)self expectedVideoEnabled];
          objc_msgSend(v17, "setVideoEnabled:", objc_msgSend(v19, "BOOLValue"));
        }
        id v20 = sub_100008DCC();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v39) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "broadcastLocalParticipantData since we transitioned to AVMode", (uint8_t *)&v39, 2u);
        }

        [(CSDConversation *)self broadcastLocalParticipantData];
        if ([(CSDConversation *)self usesAudioSession]
          && ([(CSDConversation *)self avcSession],
              long long v21 = objc_claimAutoreleasedReturnValue(),
              unsigned int v22 = [v21 isAudioReady],
              v21,
              !v22))
        {
          __int16 v29 = sub_100008DCC();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            if ([(CSDConversation *)self usesAudioSession]) {
              CFStringRef v30 = @"YES";
            }
            else {
              CFStringRef v30 = @"NO";
            }
            unsigned __int8 v31 = [(CSDConversation *)self avcSession];
            if ([v31 isAudioReady]) {
              CFStringRef v32 = @"YES";
            }
            else {
              CFStringRef v32 = @"NO";
            }
            int v39 = 138412546;
            CFStringRef v40 = v30;
            __int16 v41 = 2112;
            CFStringRef v42 = v32;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Not starting audio, usesAudioSession: %@, audioReady: %@", (uint8_t *)&v39, 0x16u);
          }
        }
        else
        {
          unsigned __int8 v23 = sub_100008DCC();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            if ([(CSDConversation *)self usesAudioSession]) {
              CFStringRef v24 = @"YES";
            }
            else {
              CFStringRef v24 = @"NO";
            }
            dispatch_time_t v25 = [(CSDConversation *)self avcSession];
            if ([v25 isAudioReady]) {
              CFStringRef v26 = @"YES";
            }
            else {
              CFStringRef v26 = @"NO";
            }
            int v39 = 138412546;
            CFStringRef v40 = v24;
            __int16 v41 = 2112;
            CFStringRef v42 = v26;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Starting audio, usesAudioSession: %@, audioReady: %@", (uint8_t *)&v39, 0x16u);
          }
          [(CSDConversation *)self startAudio];
        }

        goto LABEL_53;
      }
    }
    else if (!v5 && ![(CSDConversation *)self avMode])
    {
      id v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if ([(CSDConversation *)self avcSessionInProgress]) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        id v13 = [(CSDConversation *)self avcSession];
        int v39 = 138412546;
        CFStringRef v40 = v12;
        __int16 v41 = 2112;
        CFStringRef v42 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Stopping session since local participant type is Lightweight avcSessionInProgress %@ avcSession: %@", (uint8_t *)&v39, 0x16u);
      }
      if ([(CSDConversation *)self avcSessionInProgress])
      {
        [(CSDConversation *)self setAvcSessionInProgress:0];
        [(CSDConversation *)self _stopAVCSession];
      }
      else
      {
        id v28 = [(CSDConversation *)self avcSession];
        if (v28)
        {
        }
        else
        {
          id v34 = [(CSDConversation *)self localMember];
          unsigned __int8 v35 = [v34 isLightweightMember];

          if ((v35 & 1) == 0)
          {
            id v36 = sub_100008DCC();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v39) = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Downgraded from AV -> AVLess, but didn't have AVCSession yet. Creating an AVCSession.", (uint8_t *)&v39, 2u);
            }

            id v37 = [(CSDConversation *)self setupNewAVCSession:[(CSDConversation *)self isOneToOneModeEnabled]];
            [(CSDConversation *)self setAvcSession:v37];

            [(CSDConversation *)self setExpectedVideoPaused:0];
            [(CSDConversation *)self setExpectedAudioEnabled:0];
            [(CSDConversation *)self setExpectedVideoEnabled:0];
            [(CSDConversation *)self setExpectedScreenEnabled:0];
            long long v38 = sub_100008DCC();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v39) = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Rebroadcasting AVC data to other members of this group to since we transitioned to lightweight and setup a new AVCSession.", (uint8_t *)&v39, 2u);
            }

            [(CSDConversation *)self broadcastLocalParticipantData];
          }
        }
      }
LABEL_53:
      uint64_t v9 = [(CSDConversation *)self delegate];
      id v33 = [(CSDConversation *)self localParticipant];
      [v9 conversation:self didChangeLocalParticipant:v33 broadcastActivitySession:1];

LABEL_54:
      goto LABEL_55;
    }
    int v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1003A7464(self);
    }
  }
  else
  {
    uint64_t v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003A74F8();
    }

    +[CSDCrashReporter simulateCrashReportWithFormat:@"Received update callback for participant type without being joined into a conversation. Please file a bug to [FaceTime | (New Bugs)]"];
  }
LABEL_55:
}

- (void)_updateParticipantTypesForAddedParticipant:(id)a3
{
  id v4 = a3;
  -[CSDConversation setRemoteParticipantType:participant:](self, "setRemoteParticipantType:participant:", [v4 audioVideoMode] != 0, v4);
}

- (void)setRemoteParticipantType:(unsigned __int16)a3 participant:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversation *)self featureFlags];
  unsigned int v8 = [v7 avLessSharePlayEnabled];

  if (v8)
  {
    uint64_t v9 = [(CSDConversation *)self _allMembers];
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setRemoteParticipantType for existing members: %@", (uint8_t *)&v12, 0xCu);
    }

    id v11 = [(CSDConversation *)self idsSession];
    [v11 setParticipantType:v4 forParticipant:v6 members:v9 isLocalParticipant:0];

    [(CSDConversation *)self _addParticipantsWaitingToBeAddedToAVCSession];
  }
}

- (void)updateOneToOneModeForParticipantUpdateType:(unsigned __int16)a3 participant:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  unsigned int v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 identifier]);
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
    id v11 = [v10 count];
    int v12 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
    id v13 = (char *)[v12 count];

    if (&v13[(void)v11]) {
      BOOL v14 = (id)[(CSDConversation *)self activeRemoteParticipantCountMinusEligibleAVLess] == (id)1;
    }
    else {
      BOOL v14 = [(CSDConversation *)self isOneToOneModeEnabled];
    }
    unint64_t v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 67109634;
      *(_DWORD *)int v27 = v4;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v6;
      __int16 v28 = 1024;
      BOOL v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "type: %d participant: %@, shouldSetOneToOneModeEnabled: %d", (uint8_t *)&v26, 0x18u);
    }

    if (v4 == 1)
    {
      dispatch_time_t v25 = sub_100008DCC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138412290;
        *(void *)int v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Adding participant: %@", (uint8_t *)&v26, 0xCu);
      }

      [(CSDConversation *)self _addRemoteParticipantToAVCSessionIfPossible:v6];
      if ([(CSDConversation *)self isOneToOneModeEnabled] && !v14) {
        [(CSDConversation *)self setOneToOneModeEnabled:0];
      }
    }
    else if (!v4)
    {
      long long v17 = [(CSDConversation *)self avcSession];
      id v18 = objc_msgSend(v17, "pendingRemovedRemoteParticipantByIdentififer:", objc_msgSend(v6, "identifier"));

      unsigned __int8 v19 = [(CSDConversation *)self avcSession];
      unsigned int v20 = objc_msgSend(v19, "containsRemoteParticipantWithIdentifier:", objc_msgSend(v6, "identifier"));

      long long v21 = sub_100008DCC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 67109376;
        *(_DWORD *)int v27 = v18 != 0;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "isRemovingParticipantWithIdentifier: %d containsRemoteParticipantWithIdentifier: %d", (uint8_t *)&v26, 0xEu);
      }

      unsigned int v22 = sub_100008DCC();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v18 || ((v20 ^ 1) & 1) != 0)
      {
        if (v23)
        {
          int v26 = 138412290;
          *(void *)int v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignoring to remove participant %@ since its in pending list", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        if (v23)
        {
          int v26 = 138412290;
          *(void *)int v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Removing participant %@", (uint8_t *)&v26, 0xCu);
        }

        CFStringRef v24 = [(CSDConversation *)self avcSession];
        [v24 removeParticipant:v6];

        if (![(CSDConversation *)self isOneToOneModeEnabled] && v14) {
          [(CSDConversation *)self switchBackToOneToOneIfPossibleUsingDelay:1];
        }
      }
    }
  }
  else
  {
    uint64_t v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No participant found on the conversation", (uint8_t *)&v26, 2u);
    }
  }
}

- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  unsigned int v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(CSDConversation *)self featureFlags];
  if ([v9 controlMessageOverQREnabled])
  {
    id v10 = [(CSDConversation *)self serverBag];
    unsigned __int8 v11 = [v10 isControlMessageOverQREnabled];

    if (v11)
    {
      if ([(CSDConversation *)self localParticipantIdentifier] == a4)
      {
        int v12 = sub_100008DCC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v38 = a4;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Do not add local participant: %llu", buf, 0xCu);
        }

        id v13 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
        BOOL v14 = +[NSNumber numberWithUnsignedLongLong:a4];
        [(CSDMessagingConversationParticipant *)v13 removeObjectForKey:v14];
        goto LABEL_16;
      }
      if (v7)
      {
        id v13 = [[CSDMessagingConversationParticipant alloc] initWithData:v7];
        [(CSDMessagingConversationParticipant *)v13 setIdentifier:a4];
        id v18 = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
        unsigned __int8 v19 = +[NSNumber numberWithUnsignedLongLong:a4];
        unsigned int v20 = [v18 objectForKeyedSubscript:v19];

        long long v21 = IDSCopyTokenAndIDForTokenWithID();
        id v22 = 0;
        BOOL v23 = [v21 _stripFZIDPrefix];
        CFStringRef v24 = +[TUHandle normalizedHandleWithDestinationID:v23];

        if (v24)
        {
          id v36 = v22;
          dispatch_time_t v25 = +[CSDMessagingHandle handleWithTUHandle:v24];
          [(CSDMessagingConversationParticipant *)v13 setHandle:v25];

          int v26 = [(CSDMessagingConversationParticipant *)v13 csdConversationParticipant];
          int v27 = sub_100008DCC();
          __int16 v28 = v27;
          if (v26)
          {
            unsigned __int8 v35 = v20;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v38 = (unint64_t)v26;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "add csdParticipant: %@ to active participant", buf, 0xCu);
            }

            [(CSDConversation *)self addActiveParticipant:v26];
            BOOL v29 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
            CFStringRef v30 = +[NSNumber numberWithUnsignedLongLong:a4];
            __int16 v28 = [v29 objectForKeyedSubscript:v30];

            if (v28)
            {
              unsigned __int8 v31 = sub_100008DCC();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v32 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
                *(_DWORD *)buf = 134218242;
                unint64_t v38 = a4;
                __int16 v39 = 2112;
                CFStringRef v40 = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "remove participantID: %llu from pendingConversationParticipantsByIdentifier %@", buf, 0x16u);
              }
              id v33 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
              id v34 = +[NSNumber numberWithUnsignedLongLong:a4];
              [v33 removeObjectForKey:v34];
            }
            unsigned int v20 = v35;
          }
          else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            sub_1003A7560((uint64_t)v13, a4, v28);
          }

          id v22 = v36;
        }
        else
        {
          int v26 = sub_100008DCC();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218754;
            unint64_t v38 = a4;
            __int16 v39 = 2112;
            CFStringRef v40 = v20;
            __int16 v41 = 2112;
            id v42 = v22;
            __int16 v43 = 2112;
            long long v44 = v21;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Couldn't find handle for participantID: %llu, participantDestination: %@, participantToken: %@, participantURI: %@", buf, 0x2Au);
          }
        }
      }
      else
      {
        sub_100008DCC();
        id v13 = (CSDMessagingConversationParticipant *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "no valid clientContext, return", buf, 2u);
        }
      }
      goto LABEL_17;
    }
  }
  else
  {
  }
  sub_100008DCC();
  id v13 = (CSDMessagingConversationParticipant *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = [(CSDConversation *)self featureFlags];
    if ([v14 controlMessageOverQREnabled]) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    unint64_t v16 = [(CSDConversation *)self serverBag];
    if ([v16 isControlMessageOverQREnabled]) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    unint64_t v38 = (unint64_t)v15;
    __int16 v39 = 2112;
    CFStringRef v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "didReceiveJoinedParticipantID: feature flag of controlMessageOverQREnabled: %@, server bag of isControlMessageOverQREnabled: %@, return", buf, 0x16u);

LABEL_16:
  }
LABEL_17:
}

- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  unsigned int v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(CSDConversation *)self featureFlags];
  if (([v9 controlMessageOverQREnabled] & 1) == 0)
  {

LABEL_7:
    int v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [(CSDConversation *)self featureFlags];
      if ([v14 controlMessageOverQREnabled]) {
        CFStringRef v15 = @"YES";
      }
      else {
        CFStringRef v15 = @"NO";
      }
      unint64_t v16 = [(CSDConversation *)self serverBag];
      if ([v16 isControlMessageOverQREnabled]) {
        CFStringRef v17 = @"YES";
      }
      else {
        CFStringRef v17 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      unint64_t v35 = (unint64_t)v15;
      __int16 v36 = 2112;
      id v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "feature flag of controlMessageOverQREnabled: %@, server bag of isControlMessageOverQREnabled: %@, return", buf, 0x16u);
    }
    goto LABEL_30;
  }
  id v10 = [(CSDConversation *)self serverBag];
  unsigned __int8 v11 = [v10 isControlMessageOverQREnabled];

  if ((v11 & 1) == 0) {
    goto LABEL_7;
  }
  if (v7)
  {
    int v12 = [[CSDMessagingConversationParticipantDidLeaveContext alloc] initWithData:v7];
    uint64_t v28 = (int)[v12 leaveReason];
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v35 = a4;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ParticipantId %llu left with leave context %@", buf, 0x16u);
    }
  }
  else
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v35 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ParticipantID %llu left without providing leave context", buf, 0xCu);
    }
    uint64_t v28 = 0;
    int v12 = 0;
  }

  [(CSDConversation *)self activeParticipants];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        BOOL v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v23 identifier] == (id)a4)
        {
          dispatch_time_t v25 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
          int v26 = +[NSNumber numberWithUnsignedLongLong:a4];
          [v25 removeObjectForKey:v26];

          int v27 = [v23 handle];
          [(CSDConversation *)self removeParticipantWithIdentifier:a4 fromHandle:v27 withReason:v28];

          CFStringRef v24 = v18;
          goto LABEL_29;
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  CFStringRef v24 = sub_100008DCC();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v35 = a4;
    __int16 v36 = 2112;
    id v37 = v18;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Couldn't find participantID %llu from active participant list: %@", buf, 0x16u);
  }
LABEL_29:

LABEL_30:
}

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v8 = +[CSDReportingController sharedInstance];
  id v7 = [(CSDConversation *)self tuConversation];
  [v8 idsReportsReceived:v5 forConversation:v7];
}

- (void)session:(id)a3 didReceiveKickedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7
{
  int v7 = a6;
  id v93 = a4;
  id v10 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v10);

  unsigned __int8 v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v123 = (unint64_t)v93;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didReceiveKickedParticipantIDs: %@", buf, 0xCu);
  }

  if (a5 - 4 < 2)
  {
    id v34 = sub_100008DCC();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v123) = a5;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[WARN] resetting state, IDSGroupSessionMemberManagementCode: %d", buf, 8u);
    }

    [(CSDConversation *)self setKickMemberRetryCount:0];
    unint64_t v35 = +[NSMutableDictionary dictionary];
    [(CSDConversation *)self setPendingKickedMembersByIdentifier:v35];
    goto LABEL_70;
  }
  if (a5 == 2)
  {
    unint64_t v36 = [(CSDConversation *)self kickMemberRetryCount];
    id v37 = [(CSDConversation *)self serverBag];
    id v38 = [v37 maxKickMemberRetries];

    if (v36 >= (unint64_t)v38)
    {
      long long v51 = sub_100008DCC();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        long long v52 = [(CSDConversation *)self serverBag];
        id v53 = [v52 maxActiveParticipantFetchRetries];
        *(_DWORD *)buf = 134217984;
        unint64_t v123 = (unint64_t)v53;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[WARN] Not retrying to kickMembers, max retry count (%lu) reached", buf, 0xCu);
      }
      goto LABEL_71;
    }
    if (v7 == 2)
    {
      long long v80 = sub_100008DCC();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v81 = [(CSDConversation *)self kickMemberRetryCount];
        __int16 v82 = [(CSDConversation *)self pendingAllowedMembers];
        *(_DWORD *)buf = 134218242;
        unint64_t v123 = v81;
        __int16 v124 = 2112;
        id v125 = v82;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Retrying allowed members: retries: %lu pendingAllowedMembers: %@", buf, 0x16u);
      }
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v83 = [(CSDConversation *)self pendingAllowedMembers];
      id v42 = [v83 copy];

      id v84 = [v42 countByEnumeratingWithState:&v96 objects:v118 count:16];
      if (v84)
      {
        id v85 = v84;
        uint64_t v86 = *(void *)v97;
        do
        {
          for (i = 0; i != v85; i = (char *)i + 1)
          {
            if (*(void *)v97 != v86) {
              objc_enumerationMutation(v42);
            }
            [(CSDConversation *)self _allowMember:*(void *)(*((void *)&v96 + 1) + 8 * i)];
          }
          id v85 = [v42 countByEnumeratingWithState:&v96 objects:v118 count:16];
        }
        while (v85);
      }
    }
    else
    {
      if (v7 != 1)
      {
LABEL_82:
        [(CSDConversation *)self setKickMemberRetryCount:(char *)[(CSDConversation *)self kickMemberRetryCount] + 1];
        goto LABEL_71;
      }
      __int16 v39 = sub_100008DCC();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v40 = [(CSDConversation *)self kickMemberRetryCount];
        __int16 v41 = [(CSDConversation *)self pendingKickedMembersByIdentifier];
        *(_DWORD *)buf = 134218242;
        unint64_t v123 = v40;
        __int16 v124 = 2112;
        id v125 = v41;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Retrying kicked members: retries: %lu pendingKickedMembers: %@", buf, 0x16u);
      }
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v42 = [(CSDConversation *)self pendingKickedMembersByIdentifier];
      id v43 = [v42 countByEnumeratingWithState:&v100 objects:v119 count:16];
      if (v43)
      {
        id v44 = v43;
        uint64_t v45 = *(void *)v101;
        do
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(void *)v101 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v100 + 1) + 8 * (void)j);
            long long v48 = [(CSDConversation *)self pendingKickedMembersByIdentifier];
            __int16 v49 = [v48 objectForKeyedSubscript:v47];

            long long v50 = [(CSDConversation *)self idsSession];
            [v50 kickMember:v49];
          }
          id v44 = [v42 countByEnumeratingWithState:&v100 objects:v119 count:16];
        }
        while (v44);
      }
    }

    goto LABEL_82;
  }
  if (!a5)
  {
    [(CSDConversation *)self setKickMemberRetryCount:0];
    if (v7 == 2)
    {
      id v54 = objc_alloc((Class)NSMutableSet);
      unsigned int v55 = [(CSDConversation *)self pendingAllowedMembers];
      id v95 = [v54 initWithSet:v55];

      id v92 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v93, "count"));
      id obja = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v93, "count"));
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      unint64_t v56 = [(CSDConversation *)self kickedParticipants];
      id v57 = [v56 countByEnumeratingWithState:&v108 objects:v121 count:16];
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = *(void *)v109;
        do
        {
          for (k = 0; k != v58; k = (char *)k + 1)
          {
            if (*(void *)v109 != v59) {
              objc_enumerationMutation(v56);
            }
            long long v61 = *(void **)(*((void *)&v108 + 1) + 8 * (void)k);
            unsigned int v62 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v61 identifier]);
            unsigned int v63 = [v93 containsObject:v62];

            if (v63)
            {
              id v64 = objc_alloc((Class)TUConversationMember);
              int64_t v65 = [v61 handle];
              id v66 = [v64 initWithHandle:v65];

              [obja addObject:v61];
              [v92 addObject:v66];
              [v95 removeObject:v66];
            }
          }
          id v58 = [v56 countByEnumeratingWithState:&v108 objects:v121 count:16];
        }
        while (v58);
      }

      [(CSDConversation *)self setKickedMembers:v92];
      uint64_t v67 = [(CSDConversation *)self pendingAllowedMembers];
      [v67 minusSet:v95];

      id v68 = sub_100008DCC();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        long long v69 = [(CSDConversation *)self kickedMembers];
        *(_DWORD *)buf = 138412290;
        unint64_t v123 = (unint64_t)v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "updating kickedMembers to %@", buf, 0xCu);
      }
      long long v70 = sub_100008DCC();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        long long v71 = [(CSDConversation *)self pendingAllowedMembers];
        *(_DWORD *)buf = 138412290;
        unint64_t v123 = (unint64_t)v71;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "updating pendingAllowedMembers to %@", buf, 0xCu);
      }
      id v72 = objc_alloc_init((Class)NSSet);
      id v18 = v95;
      [(CSDConversation *)self addRemoteMembers:v95 otherInvitedHandles:v72 triggeredLocally:1];

      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v73 = [(CSDConversation *)self pendingAllowedMembers];
      id v74 = [v73 copy];

      id v75 = [v74 countByEnumeratingWithState:&v104 objects:v120 count:16];
      if (v75)
      {
        id v76 = v75;
        uint64_t v77 = *(void *)v105;
        do
        {
          for (m = 0; m != v76; m = (char *)m + 1)
          {
            if (*(void *)v105 != v77) {
              objc_enumerationMutation(v74);
            }
            [(CSDConversation *)self _allowMember:*(void *)(*((void *)&v104 + 1) + 8 * (void)m)];
          }
          id v76 = [v74 countByEnumeratingWithState:&v104 objects:v120 count:16];
        }
        while (v76);
      }
    }
    else if (v7 == 1)
    {
      int v12 = [(CSDConversation *)self remoteMembers];
      id v13 = [(CSDConversation *)self lightweightMembers];
      BOOL v14 = [v12 setByAddingObjectsFromSet:v13];
      uint64_t v15 = [v14 allObjects];

      BOOL v89 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v93 count]);
      unint64_t v16 = [(CSDConversation *)self memberIdentifiers];
      CFStringRef v17 = +[NSMutableSet setWithSet:v16];

      id v18 = (void *)v15;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id obj = v93;
      id v19 = [obj countByEnumeratingWithState:&v114 objects:v128 count:16];
      if (v19)
      {
        id v21 = v19;
        uint64_t v22 = *(void *)v115;
        *(void *)&long long v20 = 138412802;
        long long v88 = v20;
        id v94 = v18;
        do
        {
          for (n = 0; n != v21; n = (char *)n + 1)
          {
            if (*(void *)v115 != v22) {
              objc_enumerationMutation(obj);
            }
            CFStringRef v24 = *(void **)(*((void *)&v114 + 1) + 8 * (void)n);
            dispatch_time_t v25 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
            int v26 = [v25 objectForKeyedSubscript:v24];
            int v27 = v26;
            if (v26)
            {
              id v28 = v26;
            }
            else
            {
              long long v29 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
              id v28 = [v29 objectForKeyedSubscript:v24];

              id v18 = v94;
            }

            [v17 removeObject:v24];
            long long v30 = [(CSDConversation *)self pendingKickedMembersByIdentifier];
            [v30 removeObjectForKey:v24];

            if (v28)
            {
              v112[0] = _NSConcreteStackBlock;
              v112[1] = 3221225472;
              v112[2] = sub_10004757C;
              v112[3] = &unk_100505710;
              id v31 = v28;
              id v113 = v31;
              long long v32 = objc_msgSend(v18, "tu_firstObjectPassingTest:", v112);
              if (v32)
              {
                [v89 addObject:v32];
              }
              else
              {
                id v33 = sub_100008DCC();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v88;
                  unint64_t v123 = (unint64_t)v24;
                  __int16 v124 = 2112;
                  id v125 = v31;
                  __int16 v126 = 2112;
                  BOOL v127 = v94;
                  _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "When kicking participantID %@ we found participant %@ with no member in %@", buf, 0x20u);
                }

                id v18 = v94;
              }
            }
          }
          id v21 = [obj countByEnumeratingWithState:&v114 objects:v128 count:16];
        }
        while (v21);
      }

      [(CSDConversation *)self setMemberIdentifiers:v17];
      [(CSDConversation *)self removeRemoteMembers:v89 triggeredLocally:0];
    }
    else
    {
      long long v79 = sub_100008DCC();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v123) = v7;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "[WARN] didReceiveKickedParticipantIDstype: %hu unexpected", buf, 8u);
      }
      id v18 = v79;
    }

    unint64_t v35 = [(CSDConversation *)self delegate];
    [v35 conversationChanged:self];
LABEL_70:
  }
LABEL_71:
}

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  int v7 = [v5 objectForKeyedSubscript:IDSGroupSessionParticipantIdentifierKey];
  id v8 = [v7 unsignedLongLongValue];

  id v10 = [v5 objectForKeyedSubscript:IDSGroupSessionPluginNameKey];

  if (![(__CFString *)v10 length])
  {

    id v10 = @"PubSub";
  }
  id v9 = [objc_alloc((Class)TUConversationVirtualParticipant) initWithIdentifier:v8 pluginName:v10];
  [(CSDConversation *)self addVirtualParticipant:v9];
}

- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  int v7 = [v5 objectForKeyedSubscript:IDSGroupSessionParticipantIdentifierKey];
  id v8 = [v7 unsignedLongLongValue];

  id v13 = [v5 objectForKeyedSubscript:IDSGroupSessionPluginNameKey];

  if (![(__CFString *)v13 length])
  {

    id v13 = @"PubSub";
  }
  id v9 = [(CSDConversation *)self virtualParticipantsByPluginName];
  id v10 = [v9 objectForKeyedSubscript:v13];
  id v11 = [v10 identifier];

  if (v11 == v8)
  {
    id v12 = [objc_alloc((Class)TUConversationVirtualParticipant) initWithIdentifier:v8 pluginName:v13];
    [(CSDConversation *)self removeVirtualParticipant:v12];
  }
}

- (void)sessionDidReceiveKeyUpdate:(id)a3
{
  int v4 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDConversation *)self activitySessionManager];
  [v5 refreshDataCryptors];
}

- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v51 = v8;
    __int16 v52 = 2112;
    id v53 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didReceiveDataBlob for participant: %@, blob %@", buf, 0x16u);
  }

  id v11 = [[CSDMessagingConversationParticipant alloc] initWithData:v7];
  [(CSDMessagingConversationParticipant *)v11 setIdentifier:[v8 participantIdentifier]];
  id v12 = [v8 participantURI];
  id v13 = [v12 _stripFZIDPrefix];
  BOOL v14 = +[TUHandle normalizedHandleWithDestinationID:v13];

  if (v14)
  {
    uint64_t v15 = [(CSDConversation *)self pendingKickedMembersByIdentifier];
    unint64_t v16 = +[NSNumber numberWithUnsignedLongLong:[v8 participantIdentifier]];
    CFStringRef v17 = [v15 objectForKeyedSubscript:v16];

    if (v17)
    {
      id v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [v8 participantIdentifier];
        *(_DWORD *)buf = 134217984;
        long long v51 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] didReceiveDataBlob not processing because we have a pendingKickedMember with the same identifier: %llu", buf, 0xCu);
      }
      goto LABEL_34;
    }
    uint64_t v22 = [(CSDConversation *)self kickedMembers];
    BOOL v23 = [v22 allObjects];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100047F20;
    v48[3] = &unk_100505710;
    CFStringRef v24 = v14;
    __int16 v49 = v24;
    unsigned int v25 = objc_msgSend(v23, "tu_containsObjectPassingTest:", v48);

    if (v25)
    {
      int v26 = sub_100008DCC();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v51 = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] didReceiveDataBlob not processing because we have a kickedMember with the same handle: %@", buf, 0xCu);
      }
      goto LABEL_33;
    }
    int v27 = +[CSDMessagingHandle handleWithTUHandle:v24];
    [(CSDMessagingConversationParticipant *)v11 setHandle:v27];

    int v26 = [(CSDMessagingConversationParticipant *)v11 csdConversationParticipant];
    if (!v26)
    {
      long long v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1003A75D8();
      }
      goto LABEL_32;
    }
    [(CSDConversation *)self _applyUpdateFromDataBlobForRemoteParticipant:v26 participantIdentifier:[v8 participantIdentifier]];
    [(CSDConversation *)self updateConversationParticipantToHaveMatchingSiriDisplayName:v26];
    id v28 = [(CSDConversation *)self localParticipantIdentifier];
    if (v28 == [v26 identifier])
    {
      long long v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v51 = v26;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "didReceiveDataBlob skipped adding local-participant's datablob to the cache, csdConversationParticipant: %@", buf, 0xCu);
      }
LABEL_32:

LABEL_33:
      id v18 = v49;
      goto LABEL_34;
    }
    long long v30 = [(CSDConversation *)self activeParticipantDestinationsByIdentifier];
    id v31 = +[NSNumber numberWithUnsignedLongLong:[v26 identifier]];
    long long v32 = [v30 objectForKeyedSubscript:v31];
    if (!v32)
    {
      id v33 = [(CSDConversation *)self activeLightweightParticipantsByIdentifier];
      id v34 = +[NSNumber numberWithUnsignedLongLong:[v26 identifier]];
      uint64_t v35 = [v33 objectForKeyedSubscript:v34];
      if (!v35)
      {

LABEL_29:
        unint64_t v40 = sub_100008DCC();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v51 = v26;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "didReceiveDataBlob caching as pending-participant, csdConversationParticipant: %@", buf, 0xCu);
        }

        long long v29 = [(CSDConversation *)self pendingConversationParticipantsByIdentifier];
        __int16 v41 = +[NSNumber numberWithUnsignedLongLong:[v8 participantIdentifier]];
        [v29 setObject:v26 forKeyedSubscript:v41];

        goto LABEL_32;
      }
      uint64_t v42 = v35;
      id v44 = v34;
      uint64_t v45 = v33;
      long long v32 = 0;
    }
    long long v46 = v31;
    uint64_t v47 = v30;
    unint64_t v36 = [(CSDConversation *)self recentlyLeftParticipantIdentifiers];
    id v37 = +[NSNumber numberWithUnsignedLongLong:[v26 identifier]];
    unsigned __int8 v38 = [v36 containsObject:v37];

    if (v32)
    {
    }
    else
    {
    }
    if ((v38 & 1) == 0)
    {
      __int16 v39 = sub_100008DCC();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v51 = v26;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "didReceiveDataBlob adding as active-participant, csdConversationParticipant: %@", buf, 0xCu);
      }

      [(CSDConversation *)self addActiveParticipant:v26];
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  id v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = [v8 participantURI];
    id v21 = TULoggableStringForHandle();
    *(_DWORD *)buf = 138412290;
    long long v51 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] didReceiveDataBlob not processing because unable to create handle from URI: %@", buf, 0xCu);
  }
LABEL_34:
}

- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6
{
  int v6 = a5;
  id v8 = a6;
  id v9 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didReceiveData dataType: %u for participant: %@", (uint8_t *)v12, 0x12u);
  }

  if (v6 != 1)
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003A7640(v6, v11);
    }
  }
}

- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didReceiveServerErrorCode: %u", (uint8_t *)v11, 8u);
  }

  id v8 = [(CSDConversation *)self tuActivitySessions];
  id v9 = [v8 anyObject];

  if (v9)
  {
    +[CSDAnalyticsReporter sendSessionServerTerminatedEventWithActivitySession:v9 code:v4];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003A76B8();
    }
  }
}

- (id)session:(id)a3 conversationParticipantWithParticipantIdentifier:(unint64_t)a4
{
  int v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  id v8 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v9 = [v7 objectForKeyedSubscript:v8];

  return v9;
}

- (id)onlyAvailableSessionConversationParticipant:(id)a3
{
  uint64_t v4 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  int v6 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  id v7 = [v6 allValues];
  id v8 = [v7 firstObject];
  id v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 identifier]);
  id v10 = [v5 objectForKeyedSubscript:v9];

  return v10;
}

- (void)session:(id)a3 didReceiveUnderlyingLinksStatus:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    int v10 = 138412290;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CSDConversation] didReceiveUnderlyingLinksStatus: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversation *)self delegate];
  [v9 conversationChanged:self];
}

- (int)_errorToAVCProviderEndedReason:(id)a3 defaultProviderReason:(int)a4
{
  id v5 = a3;
  int v6 = v5;
  if (!v5)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      int v15 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No error with a failed start from AVC using %d", (uint8_t *)&v14, 8u);
    }
    goto LABEL_12;
  }
  CFStringRef v7 = [v5 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"NSErrorUserInfoDetailedError"];

  if (v8)
  {
    id v9 = [v6 userInfo];
    int v10 = [v9 objectForKeyedSubscript:@"NSErrorUserInfoDetailedError"];
    LODWORD(v8) = [v10 intValue];
  }
  a4 = v8 + 100 * [v6 code];
  CFStringRef v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109632;
    int v15 = a4;
    __int16 v16 = 1024;
    unsigned int v17 = [v6 code];
    __int16 v18 = 1024;
    int v19 = (int)v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AVCProviderEndReason=%d error.code=%d detailedError=%d", (uint8_t *)&v14, 0x14u);
  }

  if (!a4)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AVCProviderEndReason=%d, this should not happen", (uint8_t *)&v14, 8u);
    }
    a4 = 518;
LABEL_12:
  }
  return a4;
}

- (void)executeSessionDidStart
{
  unsigned __int8 v3 = [(CSDConversation *)self avcSession];
  if (!v3) {
    sub_1003A76EC();
  }

  BOOL v4 = [(CSDConversation *)self expectedVideoEnabled];

  if (v4)
  {
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CSDConversation *)self expectedVideoEnabled];
      int v9 = 138412290;
      int v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found expectedVideoEnabled: %@, updating value to match state", (uint8_t *)&v9, 0xCu);
    }
    CFStringRef v7 = [(CSDConversation *)self expectedVideoEnabled];
    id v8 = [v7 BOOLValue];

    [(CSDConversation *)self setExpectedVideoEnabled:0];
    [(CSDConversation *)self setVideoEnabled:v8];
  }
  [(CSDConversation *)self switchBackToOneToOneIfPossibleUsingDelay:1];
  [(CSDConversation *)self createContentSharingSessionIfNecessary];
  [(CSDConversation *)self _launchApplicationsForActivitiesIfNecessary:0];
}

- (void)session:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v28[0] = 67109378;
    v28[1] = v5;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didStart: %d error: %@", (uint8_t *)v28, 0x12u);
  }

  int v10 = sub_100008DCC();
  CFStringRef v11 = [(CSDConversation *)self avcSession];
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v10, v11);

  __int16 v13 = sub_100008DCC();
  int v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v28[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v12, "avcSessionStart", "", (uint8_t *)v28, 2u);
  }

  int v15 = [(CSDConversation *)self report];
  -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:](self, "_emitRTCConnectionSetupEvent:participantIdentifier:", 4, objc_msgSend(v15, "hashForParticipantIdentifier:", -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")));

  __int16 v16 = [(CSDConversation *)self delegate];
  if (v5)
  {
    if ((id)[(CSDConversation *)self state] == (id)2 || (id)[(CSDConversation *)self state] == (id)3)
    {
      [(CSDConversation *)self setState:3];
      [(CSDConversation *)self setHasJoined:1];
      [(CSDConversation *)self executeSessionDidStart];
    }
    else
    {
      CFStringRef v24 = sub_100008DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1003A7718();
      }

      [(CSDConversation *)self setState:4];
      [(CSDConversation *)self _beginTimeoutForLeavingConversationWithReason:@"AVCSession started but we weren't trying to join the conversation."];
      [(CSDConversation *)self setAvcSessionInProgress:0];
      [(CSDConversation *)self _reportConversationFailedWithProviderEndedReason:[(CSDConversation *)self _errorToAVCProviderEndedReason:v7 defaultProviderReason:515]];
      [(CSDConversation *)self _stopAVCSession];
    }
    goto LABEL_29;
  }
  unsigned int v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1003A7780();
  }

  [(CSDConversation *)self setAvcSessionInProgress:0];
  [(CSDConversation *)self setAvcSession:0];
  __int16 v18 = [(CSDConversation *)self featureFlags];
  if ([v18 conversationOneToOneModeEnabled]
    && [(CSDConversation *)self isOneToOneModeEnabled])
  {
    int64_t v19 = [(CSDConversation *)self state];

    if (v19 == 4)
    {
      long long v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1003A774C();
      }

      [(CSDConversation *)self setState:0];
      goto LABEL_29;
    }
  }
  else
  {
  }
  id v21 = [(CSDConversation *)self featureFlags];
  unsigned int v22 = [v21 avLessSharePlayEnabled];
  if (v7 || !v22 || (id)[(CSDConversation *)self state] != (id)3 || [(CSDConversation *)self avMode])
  {

    goto LABEL_24;
  }
  unsigned int v25 = [(CSDConversation *)self remoteMembers];
  id v26 = [v25 count];

  if (v26 != (id)1)
  {
LABEL_24:
    if ((id)[(CSDConversation *)self state] != (id)4)
    {
      [(CSDConversation *)self setState:4];
      [(CSDConversation *)self _beginTimeoutForLeavingConversationWithReason:@"AVCSession failed to start."];
      BOOL v23 = [(CSDConversation *)self idsSession];
      [v23 leaveGroupSessionWithContext:0];

      [(CSDConversation *)self _reportConversationFailedWithProviderEndedReason:[(CSDConversation *)self _errorToAVCProviderEndedReason:v7 defaultProviderReason:516]];
    }
    goto LABEL_29;
  }
  int v27 = sub_100008DCC();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "CSDAVCSession failed to start, but there is no error, Ignoring the start failure and leaving conversation intact", (uint8_t *)v28, 2u);
  }

LABEL_29:
  [v16 conversationChanged:self];
}

- (void)session:(id)a3 didDetectError:(id)a4
{
  id v5 = a4;
  int v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1003A77E8();
  }

  if ((id)[(CSDConversation *)self state] == (id)3)
  {
    id v8 = +[NSDate date];
    int v9 = [(CSDConversation *)self lastRebroadcastTime];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;

    if (v11 > (double)[(CSDConversation *)self rebroadcastTimeThreshold])
    {
      os_signpost_id_t v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        float v13 = v11;
        int v15 = 134217984;
        double v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rebroadcasting AVC data to other members of this group to attempt to recover from error (last rebroadcast time was %f).", (uint8_t *)&v15, 0xCu);
      }

      [(CSDConversation *)self setLastRebroadcastTime:v8];
      int v14 = [(CSDConversation *)self serverBag];
      -[CSDConversation setRebroadcastTimeThreshold:](self, "setRebroadcastTimeThreshold:", -[CSDConversation rebroadcastTimeThreshold](self, "rebroadcastTimeThreshold")* (void)[v14 rebroadcastTimeThreshold]);

      [(CSDConversation *)self broadcastLocalParticipantData];
    }
  }
  else
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      LODWORD(v16) = [(CSDConversation *)self state];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not attempting to rebroadcast message since state was not in join (was %d)", (uint8_t *)&v15, 8u);
    }
  }
}

- (void)session:(id)a3 didStopWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSDAVCSession didStopWithError: %@", (uint8_t *)&v22, 0xCu);
  }

  if (v7)
  {
    id v10 = [v7 code];
    double v11 = sub_100008DCC();
    os_signpost_id_t v12 = v11;
    if (v10 == (id)32003)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AVCSession %@ stopped for remote hangup. Ignoring this signal.", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v21 = [(CSDConversation *)self UUID];
        int v22 = 138412802;
        id v23 = v6;
        __int16 v24 = 2112;
        unsigned int v25 = v21;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "AVCSession %@ stopped in failure for conversation UUID %@: %@", (uint8_t *)&v22, 0x20u);
      }
      [(CSDConversation *)self _cleanUpFromAVCSessionFailure];
      [(CSDConversation *)self _reportConversationFailedWithProviderEndedReason:[(CSDConversation *)self _errorToAVCProviderEndedReason:v7 defaultProviderReason:518]];
    }
  }
  else if ([(CSDConversation *)self avMode])
  {
    float v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AVCSession %@ stopped, cleaning up IDSSession state", (uint8_t *)&v22, 0xCu);
    }

    [(CSDConversation *)self cleanUpIDSSessionState];
  }
  [(CSDConversation *)self setAvcSession:0];
  [(CSDConversation *)self setAvcSessionInProgress:0];
  [(CSDConversation *)self setSetScreenSharingRetryCount:0];
  if (![(CSDConversation *)self avMode] && (id)[(CSDConversation *)self state] == (id)3)
  {
    int v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CSDAVCSession stopped for downgrade to AVModeNone, setting up new not started AVCSession", (uint8_t *)&v22, 2u);
    }

    int v15 = [(CSDConversation *)self setupNewAVCSession:[(CSDConversation *)self isOneToOneModeEnabled]];
    [(CSDConversation *)self setAvcSession:v15];

    [(CSDConversation *)self setExpectedVideoPaused:0];
    [(CSDConversation *)self setExpectedAudioEnabled:0];
    [(CSDConversation *)self setExpectedVideoEnabled:0];
    [(CSDConversation *)self setExpectedScreenEnabled:0];
    double v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rebroadcasting AVC data to other members of this group to since we transitioned to lightweight and setup a new AVCSession.", (uint8_t *)&v22, 2u);
    }

    [(CSDConversation *)self broadcastLocalParticipantData];
  }
  if (![(CSDConversation *)self isOneToOneModeEnabled]
    && ![(CSDConversation *)self isVideo])
  {
    unsigned int v17 = [(CSDConversation *)self featureFlags];
    if ([v17 avLessSharePlayEnabled])
    {
      unint64_t v18 = [(CSDConversation *)self avMode];

      if (!v18) {
        goto LABEL_31;
      }
    }
    else
    {
    }
    int64_t v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting GFT conversation back to default state of video=1", (uint8_t *)&v22, 2u);
    }

    [(CSDConversation *)self setVideo:1];
  }
LABEL_31:
  long long v20 = [(CSDConversation *)self delegate];
  [v20 conversationChanged:self];
}

- (void)serverDisconnectedForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1003A7850((uint64_t)v4, self);
  }

  [(CSDConversation *)self setAvcSession:0];
  [(CSDConversation *)self setAvcSessionInProgress:0];
  if ([(CSDConversation *)self avMode] || (id)[(CSDConversation *)self state] != (id)3)
  {
    [(CSDConversation *)self _cleanUpFromAVCSessionFailure];
    [(CSDConversation *)self _reportConversationFailedWithProviderEndedReason:13];
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Detected AVCSession server disconnect, but we're in AVLess. Re-creating an AVCSession and re-distributing blob.", buf, 2u);
    }

    id v8 = [(CSDConversation *)self setupNewAVCSession:[(CSDConversation *)self isOneToOneModeEnabled]];
    [(CSDConversation *)self setAvcSession:v8];

    [(CSDConversation *)self setExpectedVideoPaused:0];
    [(CSDConversation *)self setExpectedAudioEnabled:0];
    [(CSDConversation *)self setExpectedVideoEnabled:0];
    [(CSDConversation *)self setExpectedScreenEnabled:0];
    int v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "serverDisconnectedForSession: broadcastLocalParticipantData", v11, 2u);
    }

    [(CSDConversation *)self broadcastLocalParticipantData];
  }
  id v10 = [(CSDConversation *)self delegate];
  [v10 conversationChanged:self];
}

- (void)session:(id)a3 changedLocalAudioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  id v10 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v10);

  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 67109120;
    int v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "changedLocalAudioEnabled=%d", (uint8_t *)&v23, 8u);
  }

  if (v9 || !v6)
  {
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 67109634;
      int v24 = v7;
      __int16 v25 = 1024;
      *(_DWORD *)__int16 v26 = v6;
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to set localAudioEnabled (%d): didSucceed (%d): error: %@", (uint8_t *)&v23, 0x18u);
    }

    goto LABEL_14;
  }
  uint64_t v12 = [(CSDConversation *)self expectedAudioEnabled];
  if (!v12
    || (float v13 = (void *)v12,
        [(CSDConversation *)self expectedAudioEnabled],
        int v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 BOOLValue],
        v14,
        v13,
        v15 == v7))
  {
    int v22 = [(CSDConversation *)self delegate];
    [v22 conversationChanged:self];

LABEL_14:
    [(CSDConversation *)self setExpectedAudioEnabled:0];
    goto LABEL_15;
  }
  double v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = [(CSDConversation *)self expectedAudioEnabled];
    int v23 = 67109378;
    int v24 = v7;
    __int16 v25 = 2112;
    *(void *)__int16 v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Audio was set to audioEnabled: %d self.expectedAudioEnabled.BOOLValue: %@. Setting audioEnabled to self.expectedAudioEnabled.BOOLValue", (uint8_t *)&v23, 0x12u);
  }
  unint64_t v18 = [(CSDConversation *)self expectedAudioEnabled];
  id v19 = [v18 BOOLValue];
  long long v20 = [(CSDConversation *)self avcSession];
  [v20 setAudioEnabled:v19];

LABEL_15:
}

- (void)session:(id)a3 changedLocalVideoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  id v10 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v10);

  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 67109120;
    int v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "changedLocalVideoEnabled=%d", (uint8_t *)&v29, 8u);
  }

  if (v9 || !v6)
  {
    unsigned int v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v29 = 67109634;
      int v30 = v7;
      __int16 v31 = 1024;
      *(_DWORD *)long long v32 = v6;
      *(_WORD *)&void v32[4] = 2112;
      *(void *)&v32[6] = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to set localVideoEnabled (%d): didSucceed (%d): error: %@", (uint8_t *)&v29, 0x18u);
    }

    if ((id)[(CSDConversation *)self state] == (id)3)
    {
      uint64_t v18 = [(CSDConversation *)self expectedVideoEnabled];
      if (v18)
      {
        id v19 = (void *)v18;
        long long v20 = [(CSDConversation *)self expectedVideoEnabled];
        if ([v20 BOOLValue])
        {
          unsigned int v21 = +[TUConversationManager allowsVideo];

          if (!v21) {
            goto LABEL_28;
          }
        }
        else
        {
        }
        goto LABEL_27;
      }
    }
    else
    {
      int v22 = sub_100008DCC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 67109378;
        int v30 = v7;
        __int16 v31 = 2112;
        *(void *)long long v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Skipping to set localVideoEnabled (%d) error: %@", (uint8_t *)&v29, 0x12u);
      }
    }
  }
  else
  {
    uint64_t v12 = [(CSDConversation *)self expectedVideoEnabled];
    if (v12)
    {
      float v13 = (void *)v12;
      int v14 = [(CSDConversation *)self expectedVideoEnabled];
      if ([v14 BOOLValue] == v7)
      {
      }
      else
      {
        unsigned int v15 = [(CSDConversation *)self expectedVideoEnabled];
        if (([v15 BOOLValue] & 1) == 0)
        {

LABEL_24:
          int v24 = sub_100008DCC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v25 = [(CSDConversation *)self expectedVideoEnabled];
            int v29 = 67109378;
            int v30 = v7;
            __int16 v31 = 2112;
            *(void *)long long v32 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Video was set to videoEnabled: %d self.expectedVideoEnabled.BOOLValue: %@. Setting videoEnabled to self.expectedVideoEnabled.BOOLValue", (uint8_t *)&v29, 0x12u);
          }
LABEL_27:
          __int16 v26 = [(CSDConversation *)self expectedVideoEnabled];
          id v27 = [v26 BOOLValue];
          id v28 = [(CSDConversation *)self avcSession];
          [v28 setVideoEnabled:v27];

          goto LABEL_28;
        }
        unsigned int v16 = +[TUConversationManager allowsVideo];

        if (v16) {
          goto LABEL_24;
        }
      }
    }
    int v23 = [(CSDConversation *)self delegate];
    [v23 conversationChanged:self];

    [(CSDConversation *)self setExpectedVideoEnabled:0];
  }
LABEL_28:
}

- (void)session:(id)a3 changedScreenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  id v10 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v10);

  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 67109634;
    int v33 = v7;
    __int16 v34 = 1024;
    *(_DWORD *)uint64_t v35 = v6;
    *(_WORD *)&v35[4] = 2112;
    *(void *)&v35[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "changedScreenEnabled=%d didSucceed=%d error %@", (uint8_t *)&v32, 0x18u);
  }

  if (!v9 && v6)
  {
    [(CSDConversation *)self setSetScreenSharingRetryCount:0];
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v12 = [(CSDConversation *)self featureFlags];
    if ([v12 requestToScreenShareEnabled])
    {
    }
    else
    {
      unsigned int v16 = [(CSDConversation *)self featureFlags];
      unsigned int v17 = [v16 usesModernScreenSharingFromMessages];

      if (!v17) {
        goto LABEL_18;
      }
    }
    [(CSDConversation *)self fulfillLocalScreenShareRequests];
    [(CSDConversation *)self addScreenSharingType:1];
LABEL_18:
    uint64_t v18 = [(CSDConversation *)self expectedScreenEnabled];
    if (v18)
    {
      id v19 = (void *)v18;
      long long v20 = [(CSDConversation *)self expectedScreenEnabled];
      unsigned int v21 = [v20 BOOLValue];

      if (v21 != v7)
      {
        int v22 = sub_100008DCC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = [(CSDConversation *)self expectedScreenEnabled];
          int v32 = 67109378;
          int v33 = v7;
          __int16 v34 = 2112;
          *(void *)uint64_t v35 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Screen was set to screenEnabled: %d self.expectedScreenEnabled.BOOLValue: %@. Setting screenEnabled to self.expectedScreenEnabled.BOOLValue", (uint8_t *)&v32, 0x12u);
        }
        goto LABEL_23;
      }
    }
    if ((v7 & 1) == 0)
    {
      [(CSDConversation *)self resetContentSharingSessionContent];
      [(CSDConversation *)self switchBackToOneToOneIfPossible];
    }
    int v29 = [(CSDConversation *)self delegate];
    [v29 conversationChanged:self];

    goto LABEL_28;
  }
  float v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    unint64_t v31 = [(CSDConversation *)self setScreenSharingRetryCount];
    int v32 = 67109890;
    int v33 = v7;
    __int16 v34 = 1024;
    *(_DWORD *)uint64_t v35 = v6;
    *(_WORD *)&v35[4] = 2112;
    *(void *)&v35[6] = v9;
    __int16 v36 = 2048;
    unint64_t v37 = v31;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to set screenEnabled (%d): didSucceed (%d): error: %@ retry:%lu", (uint8_t *)&v32, 0x22u);
  }

  int v14 = [(CSDConversation *)self expectedScreenEnabled];

  if (v14)
  {
    if ([(CSDConversation *)self setScreenSharingRetryCount] <= 2)
    {
      [(CSDConversation *)self setSetScreenSharingRetryCount:(char *)[(CSDConversation *)self setScreenSharingRetryCount] + 1];
LABEL_23:
      int v24 = [(CSDConversation *)self expectedScreenEnabled];
      unsigned int v25 = [v24 BOOLValue];

      __int16 v26 = [(CSDConversation *)self avcSession];
      id v27 = [(CSDConversation *)self expectedScreenEnabled];
      id v28 = [v27 BOOLValue];
      if (v25) {
        [(CSDConversation *)self screenShareAttributes];
      }
      else {
      int v30 = +[TUCallScreenShareAttributes defaultAttributes];
      }
      [v26 setScreenEnabled:v28 attributes:v30];

      goto LABEL_31;
    }
    unsigned int v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1003A78FC();
    }

    [(CSDConversation *)self setSetScreenSharingRetryCount:0];
LABEL_28:
    [(CSDConversation *)self setExpectedScreenEnabled:0];
  }
LABEL_31:
}

- (void)session:(id)a3 changedLocalAudioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  id v10 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v10);

  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 67109120;
    int v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "changedLocalAudioPaused=%d", (uint8_t *)&v23, 8u);
  }

  if (v9 || !v6)
  {
    unsigned int v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 67109634;
      int v24 = v7;
      __int16 v25 = 1024;
      *(_DWORD *)__int16 v26 = v6;
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to set localAudioPaused (%d): didSucceed (%d): error: %@", (uint8_t *)&v23, 0x18u);
    }

    goto LABEL_14;
  }
  uint64_t v12 = [(CSDConversation *)self expectedAudioPaused];
  if (!v12
    || (float v13 = (void *)v12,
        [(CSDConversation *)self expectedAudioPaused],
        int v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 BOOLValue],
        v14,
        v13,
        v15 == v7))
  {
    int v22 = [(CSDConversation *)self delegate];
    [v22 conversationChanged:self];

LABEL_14:
    [(CSDConversation *)self setExpectedAudioPaused:0];
    goto LABEL_15;
  }
  unsigned int v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = [(CSDConversation *)self expectedAudioPaused];
    int v23 = 67109378;
    int v24 = v7;
    __int16 v25 = 2112;
    *(void *)__int16 v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Audio paused was set to audioPaused: %d self.expectedAudioPaused.BOOLValue: %@. Setting audioPaused to self.expectedAudioPaused.BOOLValue", (uint8_t *)&v23, 0x12u);
  }
  uint64_t v18 = [(CSDConversation *)self expectedAudioPaused];
  id v19 = [v18 BOOLValue];
  long long v20 = [(CSDConversation *)self avcSession];
  [v20 setAudioPaused:v19];

LABEL_15:
}

- (void)session:(id)a3 changedLocalVideoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  id v10 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v10);

  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 67109120;
    int v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "changedLocalVideoPaused=%d", (uint8_t *)&v23, 8u);
  }

  if (v9 || !v6)
  {
    unsigned int v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 67109634;
      int v24 = v7;
      __int16 v25 = 1024;
      *(_DWORD *)__int16 v26 = v6;
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to set localVideoPaused (%d): didSucceed (%d): error: %@", (uint8_t *)&v23, 0x18u);
    }

    goto LABEL_14;
  }
  uint64_t v12 = [(CSDConversation *)self expectedVideoPaused];
  if (!v12
    || (float v13 = (void *)v12,
        [(CSDConversation *)self expectedVideoPaused],
        int v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 BOOLValue],
        v14,
        v13,
        v15 == v7))
  {
    int v22 = [(CSDConversation *)self delegate];
    [v22 conversationChanged:self];

LABEL_14:
    [(CSDConversation *)self setExpectedVideoPaused:0];
    goto LABEL_15;
  }
  unsigned int v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = [(CSDConversation *)self expectedVideoPaused];
    int v23 = 67109378;
    int v24 = v7;
    __int16 v25 = 2112;
    *(void *)__int16 v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Video paused was set to videoPaused: %d self.expectedVideoPaused.BOOLValue: %@. Setting videoPaused to self.expectedVideoPaused.BOOLValue", (uint8_t *)&v23, 0x12u);
  }
  uint64_t v18 = [(CSDConversation *)self expectedVideoPaused];
  id v19 = [v18 BOOLValue];
  long long v20 = [(CSDConversation *)self avcSession];
  [v20 setVideoPaused:v19];

LABEL_15:
}

- (void)session:(id)a3 requestedOneToOneModeEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v10);

  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    LODWORD(v19) = 67109634;
    HIDWORD(v19) = v7;
    *(_WORD *)long long v20 = 2112;
    if (v6) {
      CFStringRef v12 = @"YES";
    }
    *(void *)&v20[2] = v12;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "requestedOneToOneModeEnabled: %d, didSucceed: %@, error: %@", (uint8_t *)&v19, 0x1Cu);
  }

  if (v9 || !v6)
  {
    int v14 = +[CSDReportingController sharedInstance];
    unsigned int v15 = [(CSDConversation *)self tuConversation];
    [v14 oneToOneModeSwitchFailureForConversation:v15 isOneToOneMode:v7];
  }
  else if (v7)
  {
    float v13 = [(CSDConversation *)self delegate];
    [v13 conversationChanged:self];
  }
  else
  {
    if ([(CSDConversation *)self isOneToOneHandoffOngoing])
    {
      unsigned int v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "oneToOneModeEnabled is disabled because a 3rd participant that joined is replacing another participant for handoff", (uint8_t *)&v19, 2u);
      }
    }
    unsigned int v17 = [(CSDConversation *)self delegate];
    [v17 conversationChanged:self];

    if ([(CSDConversation *)self isVideoPaused] && (id)[(CSDConversation *)self state] == (id)3)
    {
      uint64_t v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "User requested videoPaused=true in a U+1 call, since we're moving out of U+1 state, setting videoEnabled=false for parity", (uint8_t *)&v19, 2u);
      }

      [(CSDConversation *)self setVideoEnabled:0];
    }
  }
}

- (void)session:(id)a3 changedBytesOfDataUsed:(int64_t)a4
{
  BOOL v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "changedBytesOfDataUsed=%ld", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(CSDConversation *)self delegate];
  [v8 conversation:self changedBytesOfDataUsed:a4];
}

- (void)sessionShouldReconnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sessionShouldReconnect=%@", (uint8_t *)&v13, 0xCu);
  }

  if (![(CSDConversation *)self isOneToOneModeEnabled])
  {
    CFStringRef v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Skipping reconnect since one to one mode is disabled", (uint8_t *)&v13, 2u);
    }
    goto LABEL_13;
  }
  BOOL v7 = [(CSDConversation *)self serverProvidedParticipantIdentifiers];
  if ([v7 count] != (id)1)
  {

    goto LABEL_12;
  }
  id v8 = [(CSDConversation *)self serverProvidedParticipantIdentifiers];
  int v9 = +[NSNumber numberWithUnsignedLongLong:[(CSDConversation *)self localParticipantIdentifier]];
  unsigned int v10 = [v8 containsObject:v9];

  if (!v10)
  {
LABEL_12:
    CFStringRef v12 = [(CSDConversation *)self idsSession];
    [v12 reconnect];
LABEL_13:

    goto LABEL_14;
  }
  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Only local participant presents and media stall for U + 1, end the call", (uint8_t *)&v13, 2u);
  }

  [(CSDConversation *)self leaveWithReason:4];
LABEL_14:
}

- (void)session:(id)a3 cameraMixedWithScreenDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cameraMixedWithScreenDidChange=%d", (uint8_t *)v9, 8u);
  }

  [(CSDConversation *)self setCameraMixedWithScreen:v4];
  id v8 = [(CSDConversation *)self delegate];
  [v8 conversationChanged:self];
}

- (void)session:(id)a3 screenShareAttributesUpdated:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  if ([(CSDConversation *)self isScreenEnabled])
  {
    BOOL v7 = [(CSDConversation *)self delegate];
    [v7 conversation:self screenShareAttributesUpdated:v5];
  }
  else
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1003A7930();
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7
{
  BOOL v10 = a4;
  int v13 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  unsigned int v15 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v16 = [v14 objectForKeyedSubscript:v15];

  if (v16)
  {
    [v16 setAudioEnabled:v10];
    [v16 setStreamToken:a5];
    [v16 setScreenToken:a6];
    [v16 setCaptionsToken:a7];
    unsigned int v17 = [(CSDConversation *)self delegate];
    [v17 conversation:self updatedActiveParticipant:v16];
  }
  else
  {
    uint64_t v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134217984;
      unint64_t v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown participant with identifier: %llu", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedVideoEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7
{
  BOOL v10 = a4;
  int v13 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  unsigned int v15 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v16 = [v14 objectForKeyedSubscript:v15];

  if (v16)
  {
    [v16 setVideoEnabled:v10];
    [v16 setStreamToken:a5];
    [v16 setScreenToken:a6];
    [v16 setCaptionsToken:a7];
    unsigned int v17 = [(CSDConversation *)self delegate];
    [v17 conversation:self updatedActiveParticipant:v16];

    [(CSDConversation *)self _endScreenCallIfNecessary];
  }
  else
  {
    uint64_t v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134217984;
      unint64_t v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown participant with identifier: %llu", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedScreenEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7
{
  BOOL v10 = a4;
  int v13 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  unsigned int v15 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v16 = [v14 objectForKeyedSubscript:v15];

  unsigned int v17 = [(CSDConversation *)self delegate];
  if (!v10 || ![(CSDConversation *)self isScreening])
  {
    if (!v16)
    {
      id v22 = sub_100008DCC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unint64_t v31 = 134217984;
        *(void *)&v31[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown participant with identifier: %llu", v31, 0xCu);
      }
      goto LABEL_29;
    }
    if ([v16 isScreenEnabled] != v10)
    {
      int v19 = sub_100008DCC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v20 = @"NO";
        *(_DWORD *)unint64_t v31 = 138412802;
        if (v10) {
          CFStringRef v20 = @"YES";
        }
        *(void *)&v31[4] = v20;
        __int16 v32 = 2112;
        int v33 = self;
        __int16 v34 = 2112;
        uint64_t v35 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Conversation screen sharing about to change to screen enabled: %@ conversation: %@ \n participant: %@", v31, 0x20u);
      }

      [v16 setScreenEnabled:v10];
      [v17 conversation:self updatedActiveParticipantWithScreenSharing:v16];
    }
    objc_msgSend(v16, "setStreamToken:", a5, *(void *)v31);
    [v16 setScreenToken:a6];
    [v16 setCaptionsToken:a7];
    [v17 conversation:self updatedActiveParticipant:v16];
    __int16 v21 = [(CSDConversation *)self featureFlags];
    if ([v21 requestToScreenShareEnabled])
    {

      if (!v10) {
        goto LABEL_30;
      }
    }
    else
    {
      int v23 = [(CSDConversation *)self featureFlags];
      unsigned int v24 = [v23 usesModernScreenSharingFromMessages];

      if (!v24)
      {
        if (!v10) {
          goto LABEL_30;
        }
        goto LABEL_22;
      }
      if (!v10) {
        goto LABEL_30;
      }
    }
    [(CSDConversation *)self fulfillPendingScreenSharingRequestsForRemoteParticipant:v16];
LABEL_22:
    if ([(CSDConversation *)self isScreenEnabled])
    {
      __int16 v25 = sub_100008DCC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = [(CSDConversation *)self UUID];
        *(_DWORD *)unint64_t v31 = 138412290;
        *(void *)&v31[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[WARN] Stopping screen on local device since one of the remote participants sharing their screen %@", v31, 0xCu);
      }
      id v27 = +[TUCallScreenShareAttributes defaultAttributes];
      [(CSDConversation *)self setScreenEnabled:0 attributes:v27];

      id v28 = [(CSDConversation *)self activitySessionManager];
      [v28 removeLocalScreenSharingSessions];
    }
    int v29 = sub_100008DCC();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = [(CSDConversation *)self UUID];
      *(_DWORD *)unint64_t v31 = 138412290;
      *(void *)&v31[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Resetting non screen sharing sessions as one of the remote participants started screen sharing %@", v31, 0xCu);
    }
    id v22 = [(CSDConversation *)self activitySessionManager];
    [v22 resetNonScreenSharingSessions];
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Conversation is currently being screened and screen sharing is enabled by remote, disallowing screen sharing", v31, 2u);
  }

  [(CSDConversation *)self updateScreenEnabledForRemoteParticipants:0];
LABEL_30:
}

- (void)addedRemoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioEnabled:(BOOL)a4 updatedVideoEnabled:(BOOL)a5 streamToken:(int64_t)a6 screenToken:(int64_t)a7 captionsToken:(int64_t)a8
{
  BOOL v11 = a4;
  id v14 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v14);

  unsigned int v15 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  unsigned int v16 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v17 = [v15 objectForKeyedSubscript:v16];

  if (v17)
  {
    [v17 setAudioEnabled:v11];
    [v17 setStreamToken:a6];
    [v17 setScreenToken:a7];
    [v17 setCaptionsToken:a8];
    uint64_t v18 = [(CSDConversation *)self delegate];
    [v18 conversation:self updatedActiveParticipant:v17];

    -[CSDConversation _generateHandoffReportIfNecessaryForUpdatedParticipantID:isAddParticipant:](self, "_generateHandoffReportIfNecessaryForUpdatedParticipantID:isAddParticipant:", [v17 identifier], 1);
    int v19 = [(CSDConversation *)self currentParticipantPresentationContexts];
    [(CSDConversation *)self updateParticipantPresentationContexts:v19];

    if ([v17 audioVideoMode])
    {
      [(CSDConversation *)self switchBackToOneToOneIfPossibleUsingDelay:1];
    }
    else
    {
      __int16 v21 = sub_100008DCC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Retrying updating oneToOneMode since participant got added", (uint8_t *)&v22, 2u);
      }

      [(CSDConversation *)self updateOneToOneModeForParticipantUpdateType:0 participant:v17];
    }
  }
  else
  {
    CFStringRef v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134217984;
      unint64_t v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown participant with identifier: %llu", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioPaused:(BOOL)a4 streamToken:(int64_t)a5
{
  BOOL v5 = a4;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  BOOL v10 = +[NSNumber numberWithUnsignedLongLong:a3];
  BOOL v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    [v11 setAudioPaused:v5];
    CFStringRef v12 = [(CSDConversation *)self delegate];
    [v12 conversation:self updatedActiveParticipant:v11];
  }
  else
  {
    int v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      unint64_t v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown participant with identifier: %llu", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 didChangeAudioPriority:(int64_t)a4 videoPriority:(int64_t)a5
{
  int v9 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v9);

  BOOL v10 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  BOOL v11 = +[NSNumber numberWithUnsignedLongLong:a3];
  CFStringRef v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    [v12 setAudioPriority:a4];
    [v12 setVideoPriority:a5];
    int v13 = [(CSDConversation *)self delegate];
    [v13 conversation:self mediaPrioritiesChangedForParticipant:v12];
  }
  else
  {
    int v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      unint64_t v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown participant with identifier: %llu", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 cameraMixedWithScreenDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  int v9 = +[NSNumber numberWithUnsignedLongLong:a3];
  BOOL v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    [v10 setCameraMixedWithScreen:v4];
    BOOL v11 = [(CSDConversation *)self delegate];
    [v11 conversation:self updatedActiveParticipant:v10];
  }
  else
  {
    CFStringRef v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      unint64_t v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown participant with identifier: %llu", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 didReact:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  int v9 = +[NSNumber numberWithUnsignedLongLong:a3];
  BOOL v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    BOOL v11 = [(CSDConversation *)self delegate];
    [v11 conversation:self participant:v10 didReact:v6];
  }
  else
  {
    CFStringRef v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      unint64_t v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown participant with identifier: %llu", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)session:(id)a3 localParticipantDidReact:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = [CSDConversationParticipant alloc];
  id v8 = [(CSDConversation *)self idsSession];
  id v9 = [v8 localParticipantIdentifier];
  BOOL v10 = [(CSDConversation *)self localMember];
  BOOL v11 = [v10 handle];
  CFStringRef v12 = [(CSDConversation *)self localParticipantData];
  unint64_t v14 = [(CSDConversationParticipant *)v7 initWithIdentifier:v9 handle:v11 avcData:v12];

  int v13 = [(CSDConversation *)self delegate];
  [v13 conversation:self participant:v14 didReact:v5];
}

- (void)sessionLocalParticipantDidStopReacting:(id)a3
{
  BOOL v4 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [CSDConversationParticipant alloc];
  id v6 = [(CSDConversation *)self idsSession];
  id v7 = [v6 localParticipantIdentifier];
  id v8 = [(CSDConversation *)self localMember];
  id v9 = [v8 handle];
  BOOL v10 = [(CSDConversation *)self localParticipantData];
  CFStringRef v12 = [(CSDConversationParticipant *)v5 initWithIdentifier:v7 handle:v9 avcData:v10];

  BOOL v11 = [(CSDConversation *)self delegate];
  [v11 conversation:self participantDidStopReacting:v12];
}

- (void)session:(id)a3 screenCaptureDidStart:(BOOL)a4 withError:(id)a5
{
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  if (a5 || !a4)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(CSDConversation *)self UUID];
      int v12 = 138412290;
      int v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Stopping screen on local device capture failed to start for conversation UUID: %@", (uint8_t *)&v12, 0xCu);
    }
    BOOL v11 = +[TUCallScreenShareAttributes defaultAttributes];
    [(CSDConversation *)self setScreenEnabled:0 attributes:v11];
  }
}

- (void)session:(id)a3 screenCaptureDidStop:(BOOL)a4 withError:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversation *)self featureFlags];
  unsigned int v10 = [v9 sckSystemPickerEnabled];

  if (v7 && v5 && v10)
  {
    BOOL v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(CSDConversation *)self UUID];
      int v15 = 138412546;
      unint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Stopping screen on local device capture, capture stopped without calling stop for conversation UUID: %@ error: %@", (uint8_t *)&v15, 0x16u);
    }
    int v13 = +[TUCallScreenShareAttributes defaultAttributes];
    [(CSDConversation *)self setScreenEnabled:0 attributes:v13];

    unint64_t v14 = [(CSDConversation *)self delegate];
    [v14 conversationDidStopScreenCapture:self];
  }
}

- (void)removedRemoteParticipantWithIdentifier:(unint64_t)a3 didSucceed:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v4)
  {
    [(CSDConversation *)self switchBackToOneToOneIfPossible];
    [(CSDConversation *)self _generateHandoffReportIfNecessaryForUpdatedParticipantID:a3 isAddParticipant:0];
  }
  id v8 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    if (![v10 audioVideoMode])
    {
      BOOL v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Retrying updating oneToOneMode since participant got added", v13, 2u);
      }

      [(CSDConversation *)self updateOneToOneModeForParticipantUpdateType:0 participant:v10];
    }
  }
  else
  {
    int v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No participant found on the conversation", buf, 2u);
    }
  }
}

- (void)updateScreenEnabledForRemoteParticipants:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating screenEnabled on all remote participants to: %@", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(CSDConversation *)self activeRemoteParticipantsByIdentifier];
  id v9 = [v8 allValues];

  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      int v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v13);
        int v15 = [(CSDConversation *)self avcSession];
        objc_msgSend(v15, "setScreenEnabled:forParticipantWithIdentifier:", v3, objc_msgSend(v14, "identifier"));

        int v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
  id v6 = [(CSDConversation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004C00C;
  v7[3] = &unk_100505030;
  BOOL v8 = a4;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)postUserNotificationForUnsupportedScreenSharingActivity:(id)a3 alternateReponseHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CSDConversation *)self tuConversation];
  id v9 = [v8 groupUUID];
  id v10 = [v7 bundleIdentifier];
  id v11 = +[NSString stringWithFormat:@"%@.%@", v9, v10];

  uint64_t v12 = [(CSDConversation *)self audioRoutePolicyManager];
  int v13 = +[CPActivityAuthorizationManager notificationDisplayInformationForAudioPolicyManager:v12 activity:v7 conversation:v8];

  unint64_t v14 = +[IMUserNotification userNotificationWithIdentifier:v11 timeout:3 alertLevel:0 displayFlags:v13 displayInformation:0.0];

  [v14 setUsesNotificationCenter:0];
  [v14 setRepresentedApplicationBundle:TUBundleIdentifierTelephonyUtilitiesFramework];
  int v15 = +[IMUserNotificationCenter sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004C54C;
  v17[3] = &unk_100505760;
  v17[4] = self;
  id v18 = v6;
  id v16 = v6;
  [v15 addUserNotification:v14 listener:0 completionHandler:v17];
}

- (BOOL)remoteJoinedActivity:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(CSDConversation *)self activeRemoteParticipants];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v4 activeRemoteParticipants];
        id v11 = [v9 tuConversationParticipant];
        unsigned __int8 v12 = [v10 containsObject:v11];

        if (v12)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (void)activitySessionManager:(id)a3 tuActivitySessionsDidChange:(id)a4
{
  id v6 = a4;
  BOOL v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDConversation *)self checkAndSetTUActivityActive:v6];
}

- (void)activitySessionManager:(id)a3 activitySessionChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(CSDConversation *)self applicationLaunchPolicyManager];
  BOOL v8 = [(CSDConversation *)self tuConversation];
  [v7 updateAllowedHandlesForConversation:v8];

  id v9 = [(CSDConversation *)self delegate];
  [v9 conversation:self activitySessionChanged:v5];
}

- (BOOL)activitySessionManager:(id)a3 activitySessionIsJoinable:(id)a4
{
  id v5 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v5);

  return (id)[(CSDConversation *)self state] == (id)3;
}

- (void)activitySessionManager:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDConversation *)self delegate];
  [v7 conversation:self receivedActivitySessionEvent:v5];
}

- (void)activitySessionManager:(id)a3 fetchDataCryptorForTopic:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CSDConversation *)self idsSession];
  [v10 requestDataCryptorForTopic:v8 completionHandler:v7];
}

- (void)activitySessionManager:(id)a3 requestEncryptionKeysForParticipants:(id)a4 topicName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CSDConversation *)self idsSession];
  [v10 requestEncryptionKeyForParticipants:v8 topic:v7];
}

- (id)activitySessionManager:(id)a3 localParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5
{
  id v7 = a5;
  if ([(CSDConversation *)self localParticipantIdentifier] == a4)
  {
    id v8 = [(CSDConversation *)self localParticipant];
  }
  else
  {
    id v9 = [(CSDConversation *)self serverBag];
    id v10 = [v9 stableBundleIdentifierForLocalBundleIdentifier:v7];

    if (v10)
    {
      id v11 = v10;

      id v7 = v11;
    }
    unsigned __int8 v12 = [(CSDConversation *)self idsSession];
    int v13 = [v7 dataUsingEncoding:4];
    id v14 = [v12 participantIDForAlias:a4 salt:v13];

    if (v14 == (id)[(CSDConversation *)self localParticipantIdentifier])
    {
      id v8 = [(CSDConversation *)self localParticipant];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (id)activitySessionManager:(id)a3 activeRemoteParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversation *)self remoteParticipantForIdentifier:a4];
  if (v7)
  {
    id v10 = [(CSDConversation *)self serverBag];
    uint64_t v11 = [v10 stableBundleIdentifierForLocalBundleIdentifier:v7];
    unsigned __int8 v12 = (void *)v11;
    if (v11) {
      int v13 = (void *)v11;
    }
    else {
      int v13 = v7;
    }
    id v14 = v13;

    long long v15 = [v14 dataUsingEncoding:4];

    long long v16 = [(CSDConversation *)self idsSession];
    id v17 = [v16 participantIDForAlias:a4 salt:v15];

    id v18 = [(CSDConversation *)self remoteParticipantForIdentifier:v17];
  }
  else
  {
    id v18 = 0;
  }
  if (v18) {
    long long v19 = v18;
  }
  else {
    long long v19 = v9;
  }
  id v20 = v19;

  return v20;
}

- (void)activitySessionManager:(id)a3 activeRemoteParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = [(CSDConversation *)self remoteParticipantForIdentifier:a4];
  if (v9)
  {
    int v13 = [(CSDConversation *)self serverBag];
    uint64_t v14 = [v13 stableBundleIdentifierForLocalBundleIdentifier:v9];
    long long v15 = (void *)v14;
    if (v14) {
      long long v16 = (void *)v14;
    }
    else {
      long long v16 = v9;
    }
    id v17 = v16;

    id v18 = [v17 dataUsingEncoding:4];

    long long v19 = [(CSDConversation *)self idsSession];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004CEC0;
    v20[3] = &unk_100505788;
    v20[4] = self;
    id v22 = v10;
    id v21 = v12;
    [v19 participantIDForAlias:a4 salt:v18 completion:v20];
  }
  else
  {
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

- (void)activitySessionManager:(id)a3 activityChangedOnSession:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDConversation *)self delegate];
  [v7 conversation:self activityChangedOnSession:v5];
}

- (id)activitySessionManagerRequestedCallTypeStringForLogging:(id)a3
{
  id v4 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v4);

  if ([(CSDConversation *)self isOneToOneModeEnabled]) {
    return @"1-1";
  }
  else {
    return @"GFT";
  }
}

- (void)activitySessionManager:(id)a3 sessionUnjoined:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unsigned __int8 v12 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v12);

  int v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Did get session unjoined callback startDate %@ endDate %@ session %@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v14 = +[CSDReportingController sharedInstance];
  [v14 didEndSession:v9 startDate:v10 endDate:v11];
}

- (void)activitySessionManager:(id)a3 requestForegroundPresentationForActivity:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v5 activity];
  unsigned __int8 v8 = [v7 isSystemActivity];

  if ((v8 & 1) == 0)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSDConversation setting appLaunchState to needsLaunch %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = [(CSDConversation *)self delegate];
    [v10 conversation:self appLaunchState:1 forActivitySession:v5];
  }
}

- (void)activitySessionManager:(id)a3 activitySessionRemoved:(id)a4 userOriginated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  unsigned __int8 v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSDConversation received activity session removed: %@", (uint8_t *)&v13, 0xCu);
  }

  id v10 = [(CSDConversation *)self delegate];
  [v10 conversation:self activitySessionRemoved:v7 userOriginated:v5];

  int v11 = [v7 activity];
  if ([v11 isScreenSharingActivity])
  {
    unsigned int v12 = [v7 isLocallyInitiated];

    if (v12) {
      [(CSDConversation *)self switchBackToOneToOneIfPossible];
    }
  }
  else
  {
  }
}

- (void)activitySessionManager:(id)a3 activitySessionStateChanged:(id)a4 oldState:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CSDConversation *)self delegate];
  [(CSDConversation *)self activitySessionManager:v8 activitySessionChanged:v7];

  [v10 conversation:self didChangeStateForActivitySession:v7];
}

- (void)activitySessionManager:(id)a3 activitySessionAssociatedSceneChanged:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSDConversation associated scene changed for %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(CSDConversation *)self delegate];
  [(CSDConversation *)self activitySessionManager:v7 activitySessionChanged:v6];

  [v10 conversation:self didChangeSceneAssociationForActivitySession:v6];
}

- (void)activitySessionManager:(id)a3 sendResourceAtURL:(id)a4 toParticipants:(id)a5 metadata:(id)a6 activitySessionUUID:(id)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v18);

  __int16 v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [(CSDConversation *)self UUID];
    id v21 = [v13 URL];
    id v22 = [v21 path];
    int v24 = 138412546;
    __int16 v25 = v20;
    __int16 v26 = 2112;
    id v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Conversation UUID: %@ sending resource url.path: %@", (uint8_t *)&v24, 0x16u);
  }
  unint64_t v23 = [(CSDConversation *)self delegate];
  [v23 conversation:self sendResourceAtURL:v13 toParticipants:v17 metadata:v16 activitySessionUUID:v15 completion:v14];
}

- (void)activitySessionManager:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(CSDConversation *)self delegate];
  [v13 conversation:self requestedEndpointWithIdentifier:v11 activitySession:v10 completion:v9];
}

- (void)activitySessionManager:(id)a3 shouldRegisterPlugin:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversation *)self featureFlags];
  unsigned __int8 v7 = [v6 sharePlayInFaceTimeCanvasEnabled];

  if ((v7 & 1) == 0)
  {
    id v13 = sub_100008DCC();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v15 = "[WARN] Not registering plugin since featureFlag is disabled.";
    id v16 = v13;
    uint32_t v17 = 2;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_13;
  }
  id v8 = [(CSDConversation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversation *)self idsSession];
  unsigned __int8 v10 = [v9 isJoined];

  if ((v10 & 1) == 0)
  {
    id v13 = sub_100008DCC();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    unint64_t v23 = self;
    id v15 = "Not registering plugin \"%@\" since we're not joined. Conversation: %@";
    id v16 = v13;
    uint32_t v17 = 22;
    goto LABEL_10;
  }
  id v11 = [(CSDConversation *)self virtualParticipantsByPluginName];
  id v12 = [v11 objectForKeyedSubscript:v5];

  if (!v12)
  {
    uint64_t v18 = IDSGroupSessionPluginNameKey;
    id v19 = v5;
    id v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v14 = [(CSDConversation *)self idsSession];
    [(CSDConversation *)v14 registerPluginWithOptions:v13];
    goto LABEL_12;
  }
  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(CSDConversation *)self virtualParticipantsByPluginName];
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    unint64_t v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not registering plugin \"%@\" because it already exists. All current plugins: %@", buf, 0x16u);
LABEL_12:
  }
LABEL_13:
}

- (void)systemStateObserver:(id)a3 screenSharingAllowedStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    int v10 = 138412290;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "screenSharingAllowedStateChanged: %@", (uint8_t *)&v10, 0xCu);
  }

  [(CSDConversation *)self updateScreenEnabledForRemoteParticipants:v4];
  id v8 = [(CSDConversation *)self featureFlags];
  unsigned int v9 = [v8 requestToScreenShareEnabled];

  if (v9) {
    [(CSDConversation *)self broadcastLocalParticipantData];
  }
}

- (void)systemStateObserver:(id)a3 screenSharingInitiationAllowedStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    int v10 = 138412290;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "screenSharingInitiationAllowedStateChanged: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [(CSDConversation *)self featureFlags];
  unsigned int v9 = [v8 requestToScreenShareEnabled];

  if (v9) {
    [(CSDConversation *)self broadcastLocalParticipantData];
  }
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (BOOL)isAudioInjectionAllowed
{
  return self->_audioInjectionAllowed;
}

- (CSDConversationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDConversationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (TUConversationLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)hasReceivedLetMeInRequest
{
  return self->_hasReceivedLetMeInRequest;
}

- (void)setHasReceivedLetMeInRequest:(BOOL)a3
{
  self->_hasReceivedLetMeInRequest = a3;
}

- (int64_t)letMeInRequestState
{
  return self->_letMeInRequestState;
}

- (void)setLetMeInRequestState:(int64_t)a3
{
  self->_letMeInRequestState = a3;
}

- (BOOL)isLocallyCreated
{
  return self->_locallyCreated;
}

- (TUConversationMember)localLightweightSecondaryMember
{
  return self->_localLightweightSecondaryMember;
}

- (void)setLocalLightweightSecondaryMember:(id)a3
{
}

- (BOOL)hasJoined
{
  return self->_hasJoined;
}

- (void)setHasJoined:(BOOL)a3
{
  self->_hasJoined = a3;
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (NSSet)lightweightMembers
{
  return self->_lightweightMembers;
}

- (void)setLightweightMembers:(id)a3
{
}

- (NSSet)pendingMembers
{
  return self->_pendingMembers;
}

- (void)setPendingMembers:(id)a3
{
}

- (NSSet)kickedMembers
{
  return self->_kickedMembers;
}

- (void)setKickedMembers:(id)a3
{
}

- (NSSet)rejectedMembers
{
  return self->_rejectedMembers;
}

- (void)setRejectedMembers:(id)a3
{
}

- (NSSet)remotePushTokens
{
  return self->_remotePushTokens;
}

- (void)setRemotePushTokens:(id)a3
{
}

- (NSSet)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
{
}

- (BOOL)ignoreLMIRequests
{
  return self->_ignoreLMIRequests;
}

- (void)setIgnoreLMIRequests:(BOOL)a3
{
  self->_ignoreLMIRequests = a3;
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_unint64_t screenSharingType = a3;
}

- (NSArray)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (void)setSupportedMediaTypes:(id)a3
{
}

- (TUConversationActivitySession)stagedActivitySession
{
  return self->_stagedActivitySession;
}

- (void)setStagedActivitySession:(id)a3
{
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
}

- (BOOL)isCaptioningEnable
{
  return self->_captioningEnabled;
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (BOOL)isCameraMixedWithScreen
{
  return self->_cameraMixedWithScreen;
}

- (void)setCameraMixedWithScreen:(BOOL)a3
{
  self->_cameraMixedWithScreen = a3;
}

- (CPActivitySessionManager)activitySessionManager
{
  return self->_activitySessionManager;
}

- (void)setActivitySessionManager:(id)a3
{
}

- (TUConversationReport)report
{
  return self->_report;
}

- (TUConversationParticipantAssociation)localParticipantAssociation
{
  return self->_localParticipantAssociation;
}

- (void)setLocalParticipantAssociation:(id)a3
{
}

- (TUConversationHandoffEligibility)handoffEligibility
{
  return self->_handoffEligibility;
}

- (void)setHandoffEligibility:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)activeRemoteParticipantsByIdentifier
{
  return self->_activeRemoteParticipantsByIdentifier;
}

- (NSMutableDictionary)activeLightweightParticipantsByIdentifier
{
  return self->_activeLightweightParticipantsByIdentifier;
}

- (void)setActiveLightweightParticipantsByIdentifier:(id)a3
{
}

- (NSMutableSet)kickedParticipants
{
  return self->_kickedParticipants;
}

- (void)setKickedParticipants:(id)a3
{
}

- (NSMutableDictionary)screenSharingRequestsByUUID
{
  return self->_screenSharingRequestsByUUID;
}

- (void)setScreenSharingRequestsByUUID:(id)a3
{
}

- (CSDIDSGroupSession)idsSession
{
  return self->_idsSession;
}

- (CSDConversationLocalParticipantBlobTracker)localParticipantBlobTracker
{
  return self->_localParticipantBlobTracker;
}

- (NSNumber)expectedAudioEnabled
{
  return self->_expectedAudioEnabled;
}

- (void)setExpectedAudioEnabled:(id)a3
{
}

- (NSNumber)expectedVideoEnabled
{
  return self->_expectedVideoEnabled;
}

- (void)setExpectedVideoEnabled:(id)a3
{
}

- (NSNumber)expectedScreenEnabled
{
  return self->_expectedScreenEnabled;
}

- (void)setExpectedScreenEnabled:(id)a3
{
}

- (NSNumber)expectedVideoPaused
{
  return self->_expectedVideoPaused;
}

- (void)setExpectedVideoPaused:(id)a3
{
}

- (NSNumber)expectedAudioPaused
{
  return self->_expectedAudioPaused;
}

- (void)setExpectedAudioPaused:(id)a3
{
}

- (NSDictionary)activeLightweightParticipantDestinationsByIdentifier
{
  return self->_activeLightweightParticipantDestinationsByIdentifier;
}

- (NSSet)serverProvidedParticipantIdentifiers
{
  return self->_serverProvidedParticipantIdentifiers;
}

- (void)setServerProvidedParticipantIdentifiers:(id)a3
{
}

- (NSSet)serverProvidedLightweightParticipantIdentifiers
{
  return self->_serverProvidedLightweightParticipantIdentifiers;
}

- (void)setServerProvidedLightweightParticipantIdentifiers:(id)a3
{
}

- (BOOL)isWaitingToPruneParticipants
{
  return self->_waitingToPruneParticipants;
}

- (void)setWaitingToPruneParticipants:(BOOL)a3
{
  self->_waitingToPruneParticipants = a3;
}

- (NSDate)lastRebroadcastTime
{
  return self->_lastRebroadcastTime;
}

- (void)setLastRebroadcastTime:(id)a3
{
}

- (unint64_t)rebroadcastTimeThreshold
{
  return self->_rebroadcastTimeThreshold;
}

- (void)setRebroadcastTimeThreshold:(unint64_t)a3
{
  self->_rebroadcastTimeThreshold = a3;
}

- (NSMutableDictionary)virtualParticipantsByPluginName
{
  return self->_virtualParticipantsByPluginName;
}

- (CSDFaceTimeInviteDemuxer)faceTimeInviteDemuxer
{
  return self->_faceTimeInviteDemuxer;
}

- (NSMutableDictionary)pendingKickedMembersByIdentifier
{
  return self->_pendingKickedMembersByIdentifier;
}

- (void)setPendingKickedMembersByIdentifier:(id)a3
{
}

- (NSMutableSet)pendingAllowedMembers
{
  return self->_pendingAllowedMembers;
}

- (void)setPendingAllowedMembers:(id)a3
{
}

- (unint64_t)kickMemberRetryCount
{
  return self->_kickMemberRetryCount;
}

- (void)setKickMemberRetryCount:(unint64_t)a3
{
  self->_kickMemberRetryCount = a3;
}

- (unint64_t)setScreenSharingRetryCount
{
  return self->_setScreenSharingRetryCount;
}

- (void)setSetScreenSharingRetryCount:(unint64_t)a3
{
  self->_setScreenSharingRetryCount = a3;
}

- (NSArray)currentParticipantPresentationContexts
{
  return self->_currentParticipantPresentationContexts;
}

- (void)setCurrentParticipantPresentationContexts:(id)a3
{
}

- (CSDConversationParticipant)splitSessionSecondary
{
  return self->_splitSessionSecondary;
}

- (CSDConversationABTestConfiguration)ABTestConfiguration
{
  return self->_ABTestConfiguration;
}

- (void)setABTestConfiguration:(id)a3
{
}

- (NSMutableArray)addedHandoffParticipants
{
  return self->_addedHandoffParticipants;
}

- (void)setAddedHandoffParticipants:(id)a3
{
}

- (NSMutableArray)removedHandoffParticipants
{
  return self->_removedHandoffParticipants;
}

- (void)setRemovedHandoffParticipants:(id)a3
{
}

- (NSMutableDictionary)startAddingHandoffParticipantToTime
{
  return self->_startAddingHandoffParticipantToTime;
}

- (void)setStartAddingHandoffParticipantToTime:(id)a3
{
}

- (NSMutableDictionary)addedHandoffParticipantToTime
{
  return self->_addedHandoffParticipantToTime;
}

- (void)setAddedHandoffParticipantToTime:(id)a3
{
}

- (NSMutableDictionary)removedHandoffParticipantToTime
{
  return self->_removedHandoffParticipantToTime;
}

- (void)setRemovedHandoffParticipantToTime:(id)a3
{
}

- (CPApplicationPolicyManager)applicationLaunchPolicyManager
{
  return self->_applicationLaunchPolicyManager;
}

- (void)setApplicationLaunchPolicyManager:(id)a3
{
}

- (CPAudioRoutePolicyManager)audioRoutePolicyManager
{
  return self->_audioRoutePolicyManager;
}

- (void)setAudioRoutePolicyManager:(id)a3
{
}

- (CPSystemStateObserver)sharePlaySystemStateObserver
{
  return self->_sharePlaySystemStateObserver;
}

- (void)setSharePlaySystemStateObserver:(id)a3
{
}

- (_TtC13callservicesd36CSDActivitySessionParticipantMonitor)activitySessionParticipantMonitor
{
  return self->_activitySessionParticipantMonitor;
}

- (void)setActivitySessionParticipantMonitor:(id)a3
{
}

- (BOOL)expectedUplinkMuted
{
  return self->_expectedUplinkMuted;
}

- (void)setExpectedUplinkMuted:(BOOL)a3
{
  self->_expectedUplinkMuted = a3;
}

- (id)downgradeToOneToOneAfterDelayBlock
{
  return self->_downgradeToOneToOneAfterDelayBlock;
}

- (void)setDowngradeToOneToOneAfterDelayBlock:(id)a3
{
}

- (NSMutableSet)highlightIdentifiers
{
  return self->_highlightIdentifiers;
}

- (void)setHighlightIdentifiers:(id)a3
{
}

- (NSSet)remoteMemberHandles
{
  return self->_remoteMemberHandles;
}

- (void)setRemoteMemberHandles:(id)a3
{
}

- (NSSet)pendingMemberHandles
{
  return self->_pendingMemberHandles;
}

- (void)setPendingMemberHandles:(id)a3
{
}

- (NSMutableSet)pendingRemoteMembers
{
  return self->_pendingRemoteMembers;
}

- (void)setPendingRemoteMembers:(id)a3
{
}

- (NSMutableArray)memberHandlesAwaitingInvitesToLink
{
  return self->_memberHandlesAwaitingInvitesToLink;
}

- (void)setMemberHandlesAwaitingInvitesToLink:(id)a3
{
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (id)avcSessionCreationBlock
{
  return self->_avcSessionCreationBlock;
}

- (void)setAvcSessionCreationBlock:(id)a3
{
}

- (id)videoDeviceControllerCreationBlock
{
  return self->_videoDeviceControllerCreationBlock;
}

- (void)setVideoDeviceControllerCreationBlock:(id)a3
{
}

- (NSObject)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
}

- (NSObject)reportingHierarchySubToken
{
  return self->_reportingHierarchySubToken;
}

- (void)setReportingHierarchySubToken:(id)a3
{
}

- (NSMutableDictionary)inflightAVCBlobRecoveryBlocksByIdentifier
{
  return self->_inflightAVCBlobRecoveryBlocksByIdentifier;
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

- (void)setTimeoutBlock:(id)a3
{
}

- (id)participantRefreshBlock
{
  return self->_participantRefreshBlock;
}

- (void)setParticipantRefreshBlock:(id)a3
{
}

- (id)letMeInRequestUINotificationBlock
{
  return self->_letMeInRequestUINotificationBlock;
}

- (void)setLetMeInRequestUINotificationBlock:(id)a3
{
}

- (id)noConversationParticipantTimeoutBlock
{
  return self->_noConversationParticipantTimeoutBlock;
}

- (void)setNoConversationParticipantTimeoutBlock:(id)a3
{
}

- (double)sessionSwitchTimeout
{
  return self->_sessionSwitchTimeout;
}

- (void)setSessionSwitchTimeout:(double)a3
{
  self->_sessionSwitchTimeout = a3;
}

- (id)personaHandshakeBlobCreationBlock
{
  return self->_personaHandshakeBlobCreationBlock;
}

- (void)setPersonaHandshakeBlobCreationBlock:(id)a3
{
}

- (BOOL)avcSessionInProgress
{
  return self->_avcSessionInProgress;
}

- (void)setAvcSessionInProgress:(BOOL)a3
{
  self->_avcSessionInProgress = a3;
}

- (BOOL)forceExpanseEnabled
{
  return self->_forceExpanseEnabled;
}

- (NSSet)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
}

- (TUCallScreenShareAttributes)screenShareAttributes
{
  return self->_screenShareAttributes;
}

- (TUConversationProvider)provider
{
  return self->_provider;
}

- (NSDictionary)activeParticipantDestinationsByIdentifier
{
  return self->_activeParticipantDestinationsByIdentifier;
}

- (NSMutableDictionary)audioRoutesByParticipantIdentifier
{
  return self->_audioRoutesByParticipantIdentifier;
}

- (void)setAudioRoutesByParticipantIdentifier:(id)a3
{
}

- (CXCallFailureContext)failureContext
{
  return self->_failureContext;
}

- (void)setFailureContext:(id)a3
{
}

- (CSDAVCSession)avcSession
{
  return self->_avcSession;
}

- (void)setAvcSession:(id)a3
{
}

- (void)setDeviceSupport:(id)a3
{
}

- (TUConversationHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void)setHandoffContext:(id)a3
{
}

- (NSMutableSet)recentlyLeftParticipantIdentifiers
{
  return self->_recentlyLeftParticipantIdentifiers;
}

- (void)setRecentlyLeftParticipantIdentifiers:(id)a3
{
}

- (NSMutableDictionary)pendingConversationParticipantsByIdentifier
{
  return self->_pendingConversationParticipantsByIdentifier;
}

- (void)setPendingConversationParticipantsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConversationParticipantsByIdentifier, 0);
  objc_storeStrong((id *)&self->_recentlyLeftParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_handoffContext, 0);
  objc_storeStrong((id *)&self->_deviceSupport, 0);
  objc_storeStrong((id *)&self->_avcSession, 0);
  objc_storeStrong((id *)&self->_failureContext, 0);
  objc_storeStrong((id *)&self->_audioRoutesByParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_activeParticipantDestinationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_invitationPreferences, 0);
  objc_storeStrong(&self->_personaHandshakeBlobCreationBlock, 0);
  objc_storeStrong(&self->_noConversationParticipantTimeoutBlock, 0);
  objc_storeStrong(&self->_letMeInRequestUINotificationBlock, 0);
  objc_storeStrong(&self->_participantRefreshBlock, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_inflightAVCBlobRecoveryBlocksByIdentifier, 0);
  objc_storeStrong((id *)&self->_reportingHierarchySubToken, 0);
  objc_storeStrong((id *)&self->_reportingHierarchyToken, 0);
  objc_storeStrong(&self->_videoDeviceControllerCreationBlock, 0);
  objc_storeStrong(&self->_avcSessionCreationBlock, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_memberHandlesAwaitingInvitesToLink, 0);
  objc_storeStrong((id *)&self->_pendingRemoteMembers, 0);
  objc_storeStrong((id *)&self->_pendingMemberHandles, 0);
  objc_storeStrong((id *)&self->_remoteMemberHandles, 0);
  objc_storeStrong((id *)&self->_highlightIdentifiers, 0);
  objc_storeStrong(&self->_downgradeToOneToOneAfterDelayBlock, 0);
  objc_storeStrong((id *)&self->_activitySessionParticipantMonitor, 0);
  objc_storeStrong((id *)&self->_sharePlaySystemStateObserver, 0);
  objc_storeStrong((id *)&self->_audioRoutePolicyManager, 0);
  objc_storeStrong((id *)&self->_applicationLaunchPolicyManager, 0);
  objc_storeStrong((id *)&self->_removedHandoffParticipantToTime, 0);
  objc_storeStrong((id *)&self->_addedHandoffParticipantToTime, 0);
  objc_storeStrong((id *)&self->_startAddingHandoffParticipantToTime, 0);
  objc_storeStrong((id *)&self->_removedHandoffParticipants, 0);
  objc_storeStrong((id *)&self->_addedHandoffParticipants, 0);
  objc_storeStrong((id *)&self->_ABTestConfiguration, 0);
  objc_storeStrong((id *)&self->_splitSessionSecondary, 0);
  objc_storeStrong((id *)&self->_currentParticipantPresentationContexts, 0);
  objc_storeStrong((id *)&self->_pendingAllowedMembers, 0);
  objc_storeStrong((id *)&self->_pendingKickedMembersByIdentifier, 0);
  objc_storeStrong((id *)&self->_faceTimeInviteDemuxer, 0);
  objc_storeStrong((id *)&self->_virtualParticipantsByPluginName, 0);
  objc_storeStrong((id *)&self->_lastRebroadcastTime, 0);
  objc_storeStrong((id *)&self->_serverProvidedLightweightParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_serverProvidedParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeLightweightParticipantDestinationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_expectedAudioPaused, 0);
  objc_storeStrong((id *)&self->_expectedVideoPaused, 0);
  objc_storeStrong((id *)&self->_expectedScreenEnabled, 0);
  objc_storeStrong((id *)&self->_expectedVideoEnabled, 0);
  objc_storeStrong((id *)&self->_expectedAudioEnabled, 0);
  objc_storeStrong((id *)&self->_localParticipantBlobTracker, 0);
  objc_storeStrong((id *)&self->_idsSession, 0);
  objc_storeStrong((id *)&self->_screenSharingRequestsByUUID, 0);
  objc_storeStrong((id *)&self->_kickedParticipants, 0);
  objc_storeStrong((id *)&self->_activeLightweightParticipantsByIdentifier, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipantsByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_handoffEligibility, 0);
  objc_storeStrong((id *)&self->_localParticipantAssociation, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_activitySessionManager, 0);
  objc_storeStrong((id *)&self->_messagesGroupName, 0);
  objc_storeStrong((id *)&self->_stagedActivitySession, 0);
  objc_storeStrong((id *)&self->_supportedMediaTypes, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_remotePushTokens, 0);
  objc_storeStrong((id *)&self->_rejectedMembers, 0);
  objc_storeStrong((id *)&self->_kickedMembers, 0);
  objc_storeStrong((id *)&self->_pendingMembers, 0);
  objc_storeStrong((id *)&self->_lightweightMembers, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
  objc_storeStrong((id *)&self->_localMember, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_localLightweightSecondaryMember, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUID, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_videoDeviceController, 0);

  objc_storeStrong((id *)&self->_memberIdentifiers, 0);
}

- (CSDConversationParticipant)localCSDParticipant
{
  v2 = self;
  id v3 = sub_100298464();

  return (CSDConversationParticipant *)v3;
}

@end