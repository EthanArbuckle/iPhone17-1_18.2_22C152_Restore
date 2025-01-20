@interface CSDCallStateController
+ (id)automaticNameAndPhotoQueue;
+ (void)sanitizeJoinConversationRequest:(id)a3;
- (BOOL)_hasAlreadyDeniedSendingNameAndPhotoToHandles:(id)a3;
- (BOOL)_nameAndPhotoSharingEnabled;
- (BOOL)_nonRingingCallExistsOnThisDevice;
- (BOOL)_sharingAudienceAllowsAutoSendNameAndPhoto;
- (BOOL)_shouldLaunchInCallApplicationForProviderOfCall:(id)a3;
- (BOOL)hasCustomGreetingFor:(id)a3;
- (BOOL)isCallEligible:(id)a3 forClient:(id)a4;
- (BOOL)isClientRecordingApplicationInstalled;
- (BOOL)isInCallUIActive;
- (BOOL)isTrackingVoIPCallForBundleIdentifier:(id)a3;
- (BOOL)multipleCallsActiveOrHeld;
- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 callProvider:(id)a4;
- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 conversationProvider:(id)a4;
- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 isDefaultProvider:(BOOL)a4;
- (BOOL)shouldFilterClient:(id)a3;
- (BOOL)shouldHandleCarPlayControlEvents;
- (BOOL)shouldRelayToOtherDevices;
- (BOOL)shouldSendCall:(id)a3 forClient:(id)a4;
- (CSDAnsweringMachineController)answeringMachineController;
- (CSDApplicationInstallationObserver)applicationInstallationObserver;
- (CSDAudioArbitrationController)audioArbitrationController;
- (CSDAudioController)audioController;
- (CSDCallContainer)callContainer;
- (CSDCallController)callController;
- (CSDCallFilterController)callFilterController;
- (CSDCallHistoryController)callHistoryController;
- (CSDCallHistoryControllerXPCServer)callHistoryControllerXPCServer;
- (CSDCallHistoryManager)callHistoryManager;
- (CSDCallHistoryManagerXPCServer)callHistoryManagerXPCServer;
- (CSDCallProviderManager)callProviderManager;
- (CSDCallProviderManagerXPCServer)callProviderManagerXPCServer;
- (CSDCallRecordingController)callRecordingController;
- (CSDCallStateController)init;
- (CSDCallStateController)initWithQueue:(id)a3 assistantServicesObserver:(id)a4 chManager:(id)a5;
- (CSDCallStateController)initWithQueue:(id)a3 assistantServicesObserver:(id)a4 featureFlags:(id)a5 serverBag:(id)a6 chManager:(id)a7;
- (CSDCarPlayManager)carPlayManager;
- (CSDChannelProviderManager)channelProviderManager;
- (CSDClientManager)clientManager;
- (CSDConversationServerBag)serverBag;
- (CSDProcessObserverProtocol)processObserver;
- (CSDProviderCallDataSource)providerCallDataSource;
- (CSDRecentsController)recentsController;
- (CSDRelayCallDataSource)relayCallDataSource;
- (CSDRelayCallDelegate)relayCallDelegate;
- (CSDRelayMessagingController)relayMessagingController;
- (CSDRouteController)localRouteController;
- (CSDRouteController)pairedHostDeviceRouteController;
- (CSDSpeechAssetManager)speechAssetManager;
- (CSDVoIPApplicationController)voipApplicationController;
- (IMNicknameProvider)nicknameProvider;
- (NSArray)currentUpdatesForScreening;
- (NSMutableDictionary)pendingCallInfoDict;
- (NSNumber)shouldHandleSecureMicrophoneEvents;
- (NSString)currentlyTrackedA2DPRouteIdentifier;
- (NSXPCListenerEndpoint)uiXPCEndpoint;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (TUHardwareControlsBroadcaster)hardwareControlsBroadcaster;
- (id)_contactForHandle:(id)a3 contactStore:(id)a4;
- (id)callForClient:(id)a3 usingCall:(id)a4;
- (id)callWithUniqueProxyIdentifier:(id)a3 fromCallsToAnswer:(id)a4;
- (id)clientInvalidationHandler;
- (id)currentCallsForClient:(id)a3;
- (id)currentProxyCalls;
- (id)eligibleCallsByFilteringCalls:(id)a3 forClient:(id)a4;
- (id)fetchPreferredFaceTimeAccountID;
- (id)outgoingCallFromDialRequest:(id)a3;
- (id)outgoingCallFromJoinRequest:(id)a3;
- (id)performDialCall:(id)a3 displayContext:(id)a4;
- (id)performJoinConversation:(id)a3;
- (void)_answerIncomingCall:(id)a3 withBehavior:(int64_t)a4;
- (void)_answerIncomingCallAsConversation:(id)a3;
- (void)_dial:(id)a3 displayContext:(id)a4 completion:(id)a5;
- (void)_endProxyCallsForConnectingVideoCall;
- (void)_handleActiveCallStatusChangeForHostedCall:(id)a3;
- (void)_handleAudioSessionInterruptionNotification:(id)a3;
- (void)_handleCSDRelayIDSActiveAccountsChanged:(id)a3;
- (void)_handleCSDRelayPairedDeviceConnectedNotification:(id)a3;
- (void)_handleCallConnectedNotification:(id)a3;
- (void)_handleCallDisplayContextChangedNotification:(id)a3;
- (void)_handleCallIsUsingBasebandChangedNotification:(id)a3;
- (void)_handleCallModelChangedNotification:(id)a3;
- (void)_handleCallRemoteParticipantHandlesChangedNotification:(id)a3;
- (void)_handleCallShouldSuppressRingtoneChangedNotification:(id)a3;
- (void)_handleCallStartedConnectingNotification:(id)a3;
- (void)_handleCallStartedOutgoingNotification:(id)a3;
- (void)_handleCallStatusChangedNotification:(id)a3;
- (void)_handleCallWantsHoldMusicChangedNotification:(id)a3;
- (void)_handleCarPlayControlEventNotification:(id)a3;
- (void)_handleConnectedCallStatusChangeForHostedCall:(id)a3;
- (void)_handleConnectingCallStatusChangeForHostedCall:(id)a3;
- (void)_handleDisconnectedCallStatusChangeForHostedCall:(id)a3;
- (void)_handleDisconnectedCallStatusChangeForVoicemailCall;
- (void)_handleFaceTimeAvailabilityChangedNotification:(id)a3;
- (void)_handleFailureExpectedChangedNotification:(id)a3;
- (void)_handleGroupUUIDChangeForHostedCall:(id)a3;
- (void)_handleGroupUUIDChangedNotification:(id)a3;
- (void)_handleHardPauseStateChangedNotification:(id)a3;
- (void)_handleHeldCallStatusChangeForHostedCall:(id)a3;
- (void)_handleInvitationSentNotification:(id)a3;
- (void)_handleLocaleChange:(id)a3;
- (void)_handleMessagingConnectionEndForCalls:(id)a3 withDisconnectedReason:(int)a4 didStartConnecting:(BOOL)a5;
- (void)_handleMixesVoiceWithMediaChangedNotification:(id)a3;
- (void)_handleNeedsManualInCallSoundsChangedNotification:(id)a3;
- (void)_handlePreferredRouteChangedNotification:(id)a3;
- (void)_handleRelayCallingChanged;
- (void)_handleResetCallStateNotification:(id)a3;
- (void)_handleRingingCallStatusChangeForHostedCall:(id)a3;
- (void)_handleSendingCallStatusChangeForHostedCall:(id)a3;
- (void)_handleSupportsDTMFUpdatesChangedNotification:(id)a3;
- (void)_handleSupportsEmergencyFallbackChangedNotification:(id)a3;
- (void)_handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3;
- (void)_handleTUCallTTYTypeChangedNotification:(id)a3;
- (void)_handleUpdateRemoteUplinkMutedChangedNotification:(id)a3;
- (void)_launchICSForScreeningIfNeeded;
- (void)_launchInCallApplicationForCall:(id)a3 withURL:(id)a4;
- (void)_launchInCallApplicationForExistingCall;
- (void)_launchInCallApplicationForIncomingCallIfNecessary:(id)a3;
- (void)_launchInCallApplicationForOutgoingCallIfNecessary:(id)a3;
- (void)_sendClientsReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4;
- (void)_updateBluetoothAudioFormatIfNecessaryDueToMVMChange:(BOOL)a3;
- (void)_updateRoutesForDisconnectedCall;
- (void)activateInCallUIWithActivityContinuationIdentifier:(id)a3;
- (void)answerCallWithRequest:(id)a3;
- (void)callHistoryManager:(id)a3 recentCallRequestedFor:(id)a4 withStartDate:(id)a5 avMode:(unint64_t)a6;
- (void)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5 reply:(id)a6;
- (void)customSandboxedURLGreetingForAccountUUID:(id)a3 withCompletion:(id)a4;
- (void)deactivatePTTBargeCalls;
- (void)dealloc;
- (void)defaultGreeting:(id)a3;
- (void)deleteCustomGreetingForAccountUUID:(id)a3;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)dialWithRequest:(id)a3 reply:(id)a4;
- (void)didChangeFaceTimeCallingAvailability;
- (void)didChangeRelayCallingCapabilities;
- (void)disconnectAllCalls;
- (void)disconnectBargeCall:(id)a3 bundleIdentifier:(id)a4 reason:(int)a5;
- (void)disconnectBargeCallsWithBundleIdentifier:(id)a3 reason:(int)a4;
- (void)disconnectCallWithUniqueProxyIdentifier:(id)a3;
- (void)disconnectCurrentCallAndActivateHeld;
- (void)enteredBackgroundForAllCalls;
- (void)enteredForegroundForCallWithUniqueProxyIdentifier:(id)a3;
- (void)fetchAnonymousXPCEndpoint:(id)a3;
- (void)fetchCurrentCallUpdates:(id)a3;
- (void)filterStatusForAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)groupCallWithUniqueProxyIdentifier:(id)a3 withOtherCallWithUniqueProxyIdentifier:(id)a4;
- (void)handleReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4;
- (void)holdCallWithUniqueProxyIdentifier:(id)a3;
- (void)invalidate;
- (void)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6;
- (void)joinConversationWithRequest:(id)a3;
- (void)localRoutesByUniqueIdentifier:(id)a3;
- (void)messagingConnectionCouldNotEstablishLinkForCalls:(id)a3 didStartConnecting:(BOOL)a4;
- (void)messagingConnectionEndedForCalls:(id)a3 didStartConnecting:(BOOL)a4;
- (void)messagingConnectionFailedForCalls:(id)a3 didStartConnecting:(BOOL)a4;
- (void)pairedHostDeviceRoutesByUniqueIdentifier:(id)a3;
- (void)performAnswerCall:(id)a3 withRequest:(id)a4;
- (void)performAnswerCallAsAudioDowngrade:(id)a3 withRequest:(id)a4;
- (void)performAnswerCallAsVideoUpgrade:(id)a3 withRequest:(id)a4;
- (void)performDisconnectAllCallsWithReason:(int)a3;
- (void)performDisconnectCall:(id)a3;
- (void)performDisconnectCurrentCallAndActivateHeld;
- (void)performEndActiveAndAnswerCall:(id)a3 withRequest:(id)a4;
- (void)performEndHeldAndAnswerCall:(id)a3 withRequest:(id)a4;
- (void)performGroupCall:(id)a3 withCall:(id)a4;
- (void)performHoldActiveAndAnswerCall:(id)a3 withRequest:(id)a4;
- (void)performHoldCall:(id)a3;
- (void)performPlayDTMFToneForCall:(id)a3 key:(unsigned __int8)a4;
- (void)performPullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4;
- (void)performPullHostedCallsFromPairedHostDevice;
- (void)performPullRelayingCallsFromClientAndUpdateEndpoint:(BOOL)a3 updateExpectedDestination:(BOOL)a4;
- (void)performPullRelayingCallsFromClientAndUpdateEndpoint:(BOOL)a3 updateExpectedDestination:(BOOL)a4 onlyIfNeedsEndpointConversationRelaySupport:(BOOL)a5;
- (void)performPushHostedCallsToDestination:(id)a3;
- (void)performPushRelayingCallsToHostWithSourceIdentifier:(id)a3;
- (void)performRecordingRequest:(id)a3 completion:(id)a4;
- (void)performSendMMIOrUSSDCodeWithRequest:(id)a3;
- (void)performSetLiveVoicemailUnavailableReason:(int64_t)a3 forCall:(id)a4;
- (void)performSetTTYType:(int)a3 forCall:(id)a4;
- (void)performSetUplinkMuted:(BOOL)a3 forCall:(id)a4;
- (void)performSwapCalls;
- (void)performUngroupCall:(id)a3;
- (void)performUnholdCall:(id)a3;
- (void)performUpdateCallWithProxy:(id)a3;
- (void)pickLocalRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4;
- (void)pickPairedHostDeviceRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4;
- (void)playDTMFToneForCallWithUniqueProxyIdentifier:(id)a3 key:(unsigned __int8)a4;
- (void)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)propertiesChangedForCall:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 reply:(id)a4;
- (void)pullHostedCallsFromPairedHostDevice;
- (void)pullPersistedChannel:(id)a3;
- (void)pullRelayingCallsFromClient;
- (void)pullRelayingGFTCallsFromClientIfNecessary;
- (void)pushHostedCallsToDestination:(id)a3;
- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3;
- (void)registerAnonymousXPCEndpoint:(id)a3;
- (void)registerForSecureMicEvents;
- (void)reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:(id)a3;
- (void)requestInitialState:(id)a3;
- (void)requestVideoUpgradeForCallWithUniqueProxyIdentifier:(id)a3;
- (void)resetClientCallProvisionalStates;
- (void)saveCustomSandboxedURLGreeting:(id)a3 forAccountUUID:(id)a4;
- (void)screenUpdate:(id)a3 withProvider:(id)a4 callSource:(id)a5 callUUID:(id)a6;
- (void)screenWithRequest:(id)a3;
- (void)sendAutomaticNameAndPhotoUsingDialRequestIfPossible:(id)a3;
- (void)sendAutomaticNameAndPhotoUsingJoinRequestIfPossible:(id)a3;
- (void)sendClientsNotificationName:(id)a3;
- (void)sendClientsNotificationName:(id)a3 forCall:(id)a4;
- (void)sendClientsNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5;
- (void)sendHardPauseDigitsForCallWithUniqueProxyIdentifier:(id)a3;
- (void)sendMMIOrUSSDCodeWithRequest:(id)a3;
- (void)sendNameAndPhotoToHandles:(id)a3 fromID:(id)a4;
- (void)sendNameAndPhotoUsingDialRequest:(id)a3;
- (void)sendNameAndPhotoUsingJoinRequest:(id)a3;
- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4;
- (void)setAnsweringMachineController:(id)a3;
- (void)setAudioArbitrationController:(id)a3;
- (void)setAudioController:(id)a3;
- (void)setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:(id)a3 bluetoothAudioFormat:(int64_t)a4;
- (void)setCallDelegatesIfNeeded:(id)a3;
- (void)setCallHistoryController:(id)a3;
- (void)setCallRecordingController:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setClientInvalidationHandler:(id)a3;
- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3;
- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3;
- (void)setCurrentUpdatesForScreening:(id)a3;
- (void)setCurrentlyTrackedA2DPRouteIdentifier:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setEmergencyMediaItems:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setHasEmergencyVideoStream:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setIsSendingVideo:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setMixesVoiceWithMedia:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setNicknameProvider:(id)a3;
- (void)setPendingCallInfoDict:(id)a3;
- (void)setRelayMessagingController:(id)a3;
- (void)setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:(id)a3 size:(CGSize)a4;
- (void)setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:(id)a3 presentationState:(int)a4;
- (void)setScreenShareAttributesForCallWithUniqueProxyIdentifier:(id)a3 attributes:(id)a4;
- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4 forCallWithUniqueProxyIdentifier:(id)a5;
- (void)setSharingScreen:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setShouldHandleSecureMicrophoneEvents:(id)a3;
- (void)setTTYType:(int)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setUiXPCEndpoint:(id)a3;
- (void)setUplinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setVoipApplicationController:(id)a3;
- (void)shouldAllowRingingCallStatusIndicator:(BOOL)a3;
- (void)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5 reply:(id)a6;
- (void)shouldSuppressInCallStatusBar:(BOOL)a3;
- (void)startTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4;
- (void)stopTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4;
- (void)swapCalls;
- (void)ungroupCallWithUniqueProxyIdentifier:(id)a3;
- (void)unholdCallWithUniqueProxyIdentifier:(id)a3;
- (void)updateCallWithProxy:(id)a3;
- (void)updateClientsWithCall:(id)a3;
- (void)updateClientsWithFrequency:(id)a3 inDirection:(int)a4 forCalls:(id)a5;
- (void)updateClientsWithMeterLevel:(float)a3 inDirection:(int)a4 forCalls:(id)a5;
- (void)willEnterBackgroundForAllCalls;
- (void)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
@end

@implementation CSDCallStateController

- (CSDCallStateController)initWithQueue:(id)a3 assistantServicesObserver:(id)a4 chManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)TUFeatureFlags);
  v12 = objc_alloc_init(CSDSharedConversationServerBag);
  v13 = [(CSDCallStateController *)self initWithQueue:v10 assistantServicesObserver:v9 featureFlags:v11 serverBag:v12 chManager:v8];

  return v13;
}

- (CSDCallStateController)init
{
  v37.receiver = self;
  v37.super_class = (Class)CSDCallStateController;
  v2 = [(CSDCallStateController *)&v37 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_handleCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_handleCallStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_handleGroupUUIDChangedNotification:" name:TUCallGroupUUIDChangedNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_handleGroupUUIDChangedNotification:" name:TUCallConversationChangedNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_handleCSDRelayIDSActiveAccountsChanged:" name:@"CSDRelayIDSActiveAccountsChanged" object:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_handleCSDRelayPairedDeviceConnectedNotification:" name:@"CSDRelayPairedDeviceConnectedNotification" object:0];

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_handlePreferredRouteChangedNotification:" name:@"CSDRouteManagerPreferredRouteChangedNotification" object:0];

    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_handleCallStartedOutgoingNotification:" name:@"CSDCallHasStartedOutgoingChangedNotification" object:0];

    id v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_handleCallStartedConnectingNotification:" name:TUCallCenterCallStartedConnectingNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_handleCallConnectedNotification:" name:TUCallCenterCallConnectedNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_handleNeedsManualInCallSoundsChangedNotification:" name:TUCallNeedsManualInCallSoundsChangedNotification object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"_handleCallWantsHoldMusicChangedNotification:" name:TUCallCenterCallWantsHoldMusicChangedNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"_handleCallShouldSuppressRingtoneChangedNotification:" name:TUCallShouldSuppressRingingChangedNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"_handleCallModelChangedNotification:" name:TUCallModelChangedNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v2 selector:"_handleResetCallStateNotification:" name:TUCallCenterResetCallStateNotification object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"_handleHardPauseStateChangedNotification:" name:TUCallHardPauseDigitsStateChangedNotification object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"_handleCallIsUsingBasebandChangedNotification:" name:TUCallIsUsingBasebandChangedNotification object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v2 selector:"_handleInvitationSentNotification:" name:TUCallCenterCallInvitationSentNotification object:0];

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v2 selector:"_handleCallDisplayContextChangedNotification:" name:TUCallDisplayContextChangedNotification object:0];

    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v2 selector:"_handleUpdateRemoteUplinkMutedChangedNotification:" name:TUCallRemoteUplinkMutedChangedNotification object:0];

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v2 selector:"_handleCallRemoteParticipantHandlesChangedNotification:" name:TUCallRemoteParticipantHandlesChangedNotification object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v2 selector:"_handleTUCallSupportsTTYWithVoiceChangedNotification:" name:TUCallSupportsTTYWithVoiceChangedNotification object:0];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v2 selector:"_handleTUCallTTYTypeChangedNotification:" name:TUCallTTYTypeChangedNotification object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v2 selector:"_handleMixesVoiceWithMediaChangedNotification:" name:TUCallMixesVoiceWithMediaChangedNotification object:0];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v2 selector:"_handleFailureExpectedChangedNotification:" name:TUCallCenterIsFailureExpectedChangedNotification object:0];

    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v2 selector:"_handleSupportsEmergencyFallbackChangedNotification:" name:TUCallCenterSupportsEmergencyFallbackChangedNotification object:0];

    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v2 selector:"_handleSupportsDTMFUpdatesChangedNotification:" name:TUCallSupportsDTMFUpdatesChangedNotification object:0];

    if (MGGetBoolAnswer())
    {
      v30 = +[NSNotificationCenter defaultCenter];
      [v30 addObserver:v2 selector:"_handleCarPlayControlEventNotification:" name:TUCarPlayHardwareControlEventNotification object:0];
    }
    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v2 selector:"_handleAudioSessionInterruptionNotification:" name:AVAudioSessionInterruptionNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10015103C, @"BluetoothTakeAudioNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v33 = +[NSNotificationCenter defaultCenter];
    [v33 addObserver:v2 selector:"_handleLocaleChange:" name:NSCurrentLocaleDidChangeNotification object:0];

    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingCallInfoDict = v2->_pendingCallInfoDict;
    v2->_pendingCallInfoDict = v34;
  }
  return v2;
}

- (CSDCallStateController)initWithQueue:(id)a3 assistantServicesObserver:(id)a4 featureFlags:(id)a5 serverBag:(id)a6 chManager:(id)a7
{
  queue = a3;
  id v79 = a4;
  id v76 = a5;
  id v77 = a6;
  id v81 = a7;
  v13 = [(CSDCallStateController *)self init];
  if (v13)
  {
    dispatch_assert_queue_V2(queue);
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeStrong((id *)&v13->_featureFlags, a5);
    objc_storeStrong((id *)&v13->_serverBag, a6);
    v14 = [[CSDClientManager alloc] initWithSerialQueue:v13->_queue];
    clientManager = v13->_clientManager;
    v13->_clientManager = v14;

    v16 = +[NSXPCConnection callServicesClientXPCInterface];
    [(CSDClientManager *)v13->_clientManager setRemoteObjectInterface:v16];

    v17 = +[NSXPCConnection callServicesServerXPCInterface];
    [(CSDClientManager *)v13->_clientManager setExportedInterface:v17];

    [(CSDClientManager *)v13->_clientManager setExportedObject:v13];
    [(CSDClientManager *)v13->_clientManager setRequiredConnectionCapability:@"access-calls"];
    [(CSDClientManager *)v13->_clientManager setInterruptionHandler:&stru_100508600];
    v18 = [(CSDCallStateController *)v13 clientInvalidationHandler];
    [(CSDClientManager *)v13->_clientManager setInvalidationHandler:v18];

    v19 = v13->_queue;
    v20 = [(CSDClientManager *)v13->_clientManager synchronousExportedObjectProxy];
    v78 = +[TUCallCenter sharedInstanceWithQueue:v19 server:v20 shouldRegister:0];

    v21 = v13->_clientManager;
    v22 = [v78 callServicesInterface];
    [(CSDClientManager *)v21 addLocalClientObject:v22];

    [v78 registerWithCompletionHandler:0];
    v23 = [[CSDCallHistoryManager alloc] initWithCHManager:v81];
    callHistoryManager = v13->_callHistoryManager;
    v13->_callHistoryManager = v23;

    [(CSDCallHistoryManager *)v13->_callHistoryManager addDelegate:v13 queue:v13->_queue];
    v25 = [[CSDCallHistoryManagerXPCServer alloc] initWithManager:v13->_callHistoryManager];
    callHistoryManagerXPCServer = v13->_callHistoryManagerXPCServer;
    v13->_callHistoryManagerXPCServer = v25;

    v27 = objc_alloc_init(CSDCallProviderManager);
    callProviderManager = v13->_callProviderManager;
    v13->_callProviderManager = v27;

    [(CSDCallProviderManager *)v13->_callProviderManager addDelegate:v13 queue:v13->_queue];
    v29 = [[CSDCallProviderManagerXPCServer alloc] initWithProviderManager:v13->_callProviderManager];
    callProviderManagerXPCServer = v13->_callProviderManagerXPCServer;
    v13->_callProviderManagerXPCServer = v29;

    v31 = [[CSDRelayCallDataSource alloc] initWithCallStateController:v13 queue:v13->_queue];
    relayCallDataSource = v13->_relayCallDataSource;
    v13->_relayCallDataSource = v31;

    v33 = [[CSDProviderCallDataSource alloc] initWithCallStateController:v13 queue:v13->_queue assistantServicesObserver:v79 coreTelephonyClient:0 chManager:v81 callSourceManager:0 protectedAppsUtilities:0];
    providerCallDataSource = v13->_providerCallDataSource;
    v13->_providerCallDataSource = v33;

    [(CSDProviderCallDataSource *)v13->_providerCallDataSource setCallProviderManager:v13->_callProviderManager];
    [(CSDProviderCallDataSource *)v13->_providerCallDataSource setRelayCallDataSource:v13->_relayCallDataSource];
    v35 = objc_alloc_init(CSDChannelProviderManager);
    channelProviderManager = v13->_channelProviderManager;
    v13->_channelProviderManager = v35;

    [(CSDProviderCallDataSource *)v13->_providerCallDataSource setChannelProviderManager:v13->_channelProviderManager];
    objc_super v37 = [CSDCallController alloc];
    v38 = v13->_providerCallDataSource;
    v99[0] = v13->_relayCallDataSource;
    v99[1] = v38;
    v39 = +[NSArray arrayWithObjects:v99 count:2];
    v40 = [(CSDCallController *)v37 initWithDataSources:v39 queue:v13->_queue];
    callController = v13->_callController;
    v13->_callController = v40;

    objc_initWeak(&location, v13);
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_100151C4C;
    v96[3] = &unk_100508628;
    objc_copyWeak(&v97, &location);
    [(CSDCallController *)v13->_callController setCallChanged:v96];
    v42 = objc_alloc_init(CSDRelayCallDelegate);
    relayCallDelegate = v13->_relayCallDelegate;
    v13->_relayCallDelegate = v42;

    [(CSDRelayCallDelegate *)v13->_relayCallDelegate setCallStateController:v13];
    v44 = [[CSDProcessObserver alloc] initWithQueue:v13->_queue];
    processObserver = v13->_processObserver;
    v13->_processObserver = (CSDProcessObserverProtocol *)v44;

    v46 = [[CSDApplicationInstallationObserver alloc] initWithQueue:v13->_queue];
    applicationInstallationObserver = v13->_applicationInstallationObserver;
    v13->_applicationInstallationObserver = v46;

    v48 = objc_alloc_init(CSDCarPlayManager);
    carPlayManager = v13->_carPlayManager;
    v13->_carPlayManager = v48;

    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_100151CB8;
    v94[3] = &unk_1005075E0;
    objc_copyWeak(&v95, &location);
    [(CSDCarPlayManager *)v13->_carPlayManager setCarPlayScreenConnectionChanged:v94];
    v50 = objc_alloc_init(CSDCallHistoryController);
    callHistoryController = v13->_callHistoryController;
    v13->_callHistoryController = v50;

    v52 = v13->_callHistoryController;
    v53 = [(CSDCallStateController *)v13 providerCallDataSource];
    v54 = [v53 faceTimeProviderDelegate];
    v55 = [v54 firewallManager];
    [(CSDCallHistoryController *)v52 setDelegate:v55];

    v56 = [[CSDCallHistoryControllerXPCServer alloc] initWithCallHistoryController:v13->_callHistoryController];
    callHistoryControllerXPCServer = v13->_callHistoryControllerXPCServer;
    v13->_callHistoryControllerXPCServer = v56;

    [(CSDCallStateController *)v13 _handleRelayCallingChanged];
    v58 = [[CSDRecentsController alloc] initWithQueue:v13->_queue chManager:v81];
    recentsController = v13->_recentsController;
    v13->_recentsController = v58;

    uint64_t v60 = +[CSDRouteController makeLocalRouteController];
    localRouteController = v13->_localRouteController;
    v13->_localRouteController = (CSDRouteController *)v60;

    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_100151D84;
    v92[3] = &unk_100505698;
    objc_copyWeak(&v93, &location);
    [(CSDRouteController *)v13->_localRouteController setRoutesDidChangeHandler:v92];
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_100151F6C;
    v90[3] = &unk_100508678;
    objc_copyWeak(&v91, &location);
    [(CSDRouteController *)v13->_localRouteController setPickedRouteDidChangeHandler:v90];
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_100152088;
    v88[3] = &unk_100508678;
    objc_copyWeak(&v89, &location);
    [(CSDRouteController *)v13->_localRouteController setRouteWasPickedHandler:v88];
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1001521A4;
    v86[3] = &unk_100508678;
    objc_copyWeak(&v87, &location);
    [(CSDRouteController *)v13->_localRouteController setTimedOutPickingRouteHandler:v86];
    uint64_t v62 = +[CSDRouteController makePairedHostDeviceRouteController];
    pairedHostDeviceRouteController = v13->_pairedHostDeviceRouteController;
    v13->_pairedHostDeviceRouteController = (CSDRouteController *)v62;

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_1001522C0;
    v84[3] = &unk_100505698;
    objc_copyWeak(&v85, &location);
    [(CSDRouteController *)v13->_pairedHostDeviceRouteController setRoutesDidChangeHandler:v84];
    [(CSDRouteController *)v13->_pairedHostDeviceRouteController setPickedRouteDidChangeHandler:&stru_1005086B8];
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_100152500;
    v82[3] = &unk_100508678;
    objc_copyWeak(&v83, &location);
    [(CSDRouteController *)v13->_pairedHostDeviceRouteController setRouteWasPickedHandler:v82];
    [(CSDRouteController *)v13->_pairedHostDeviceRouteController setTimedOutPickingRouteHandler:&stru_1005086D8];
    [(CSDClientManager *)v13->_clientManager startListeningOnMachServiceWithName:@"com.apple.telephonyutilities.callservicesdaemon.callstatecontroller"];
    +[TUCallCapabilities addDelegate:v13 queue:v13->_queue];
    v64 = (TUHardwareControlsBroadcaster *)objc_alloc_init((Class)TUHardwareControlsBroadcaster);
    hardwareControlsBroadcaster = v13->_hardwareControlsBroadcaster;
    v13->_hardwareControlsBroadcaster = v64;

    v66 = [[CSDSpeechAssetManager alloc] initWithQueue:v13->_queue];
    speechAssetManager = v13->_speechAssetManager;
    v13->_speechAssetManager = v66;

    if (TUCallScreeningActivatable())
    {
      v68 = [[CSDAnsweringMachineController alloc] initWith:v13->_queue speechAssetManager:v13->_speechAssetManager];
      answeringMachineController = v13->_answeringMachineController;
      v13->_answeringMachineController = v68;

      v70 = +[CSDAnalyticsManager sharedInstance];
      [v70 setAnalyticsManagerProvider:v13];
    }
    v71 = [(CSDCallStateController *)v13 featureFlags];
    unsigned int v72 = [v71 callRecordingEnabled];

    if (v72)
    {
      v73 = [[CSDCallRecordingController alloc] initWithQueue:queue speechAssetManager:v13->_speechAssetManager];
      callRecordingController = v13->_callRecordingController;
      v13->_callRecordingController = v73;
    }
    objc_destroyWeak(&v83);
    objc_destroyWeak(&v85);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&v91);
    objc_destroyWeak(&v93);
    objc_destroyWeak(&v95);
    objc_destroyWeak(&v97);
    objc_destroyWeak(&location);
  }
  return v13;
}

- (void)invalidate
{
  id v2 = [(CSDCallStateController *)self clientManager];
  [v2 invalidate];
}

- (id)clientInvalidationHandler
{
  objc_initWeak(&location, self);
  id clientInvalidationHandler = self->_clientInvalidationHandler;
  if (!clientInvalidationHandler)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001527C0;
    v8[3] = &unk_100505E78;
    objc_copyWeak(&v9, &location);
    v4 = objc_retainBlock(v8);
    id v5 = self->_clientInvalidationHandler;
    self->_id clientInvalidationHandler = v4;

    objc_destroyWeak(&v9);
    id clientInvalidationHandler = self->_clientInvalidationHandler;
  }
  id v6 = objc_retainBlock(clientInvalidationHandler);
  objc_destroyWeak(&location);

  return v6;
}

- (void)dealloc
{
  v3 = [(CSDCallStateController *)self callHistoryManagerXPCServer];
  [v3 invalidate];

  v4 = [(CSDCallStateController *)self callProviderManagerXPCServer];
  [v4 invalidate];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v7.receiver = self;
  v7.super_class = (Class)CSDCallStateController;
  [(CSDCallStateController *)&v7 dealloc];
}

- (void)registerForSecureMicEvents
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100152C24;
  block[3] = &unk_100504EC0;
  block[4] = self;
  if (qword_10058C478 != -1) {
    dispatch_once(&qword_10058C478, block);
  }
}

- (NSNumber)shouldHandleSecureMicrophoneEvents
{
  shouldHandleSecureMicrophoneEvents = self->_shouldHandleSecureMicrophoneEvents;
  if (!shouldHandleSecureMicrophoneEvents)
  {
    v4 = +[NSNumber numberWithBool:MGGetBoolAnswer()];
    id v5 = self->_shouldHandleSecureMicrophoneEvents;
    self->_shouldHandleSecureMicrophoneEvents = v4;

    shouldHandleSecureMicrophoneEvents = self->_shouldHandleSecureMicrophoneEvents;
  }

  return shouldHandleSecureMicrophoneEvents;
}

- (TUCallCenter)callCenter
{
  return +[TUCallCenter sharedInstance];
}

- (CSDCallContainer)callContainer
{
  id v2 = [(CSDCallStateController *)self callController];
  v3 = [v2 callContainer];

  return (CSDCallContainer *)v3;
}

- (CSDCallFilterController)callFilterController
{
  id v2 = [(CSDCallStateController *)self providerCallDataSource];
  v3 = [v2 callFilterController];

  return (CSDCallFilterController *)v3;
}

- (BOOL)shouldRelayToOtherDevices
{
  unsigned int v2 = +[TUCallCapabilities supportsRelayingToOtherDevices];
  if (v2)
  {
    LOBYTE(v2) = +[TUCallCapabilities areRelayCallingFeaturesEnabled];
  }
  return v2;
}

- (void)_handleRelayCallingChanged
{
  unsigned int v3 = +[TUCallCapabilities areRelayCallingFeaturesEnabled];
  v4 = sub_100008DCC();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Relay capabilities enabled", buf, 2u);
    }

    [(CSDCallStateController *)self _requestCallStateFromHost];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Relay capabilities disabled", buf, 2u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = [(CSDCallStateController *)self callContainer];
    objc_super v7 = [v6 callsHostedElsewhere];

    id v8 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v11);
          v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Disconnecting relaying call because relay calling is no longer enabled: %@", buf, 0xCu);
          }

          [v12 setLocallyDisconnectedWithReasonIfNone:8 stopConference:1];
          v14 = [(CSDCallStateController *)self relayMessagingController];
          [v14 disconnectMessagingConnectionForCall:v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v9);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = [(CSDCallStateController *)self callContainer];
    v16 = [v15 callsWithAnEndpointElsewhere];

    id v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v22 = sub_100008DCC();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Disconnecting call being relayed elsewhere because relay calling is no longer enabled: %@", buf, 0xCu);
          }

          v23 = [(CSDCallStateController *)self callCenter];
          [v23 disconnectCall:v21 withReason:8];
        }
        id v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }
  }
}

- (void)setRelayMessagingController:(id)a3
{
  BOOL v5 = (CSDRelayMessagingController *)a3;
  if (self->_relayMessagingController != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)&self->_relayMessagingController, a3);
    [(CSDCallStateController *)self _requestCallStateFromHost];
    id v6 = [(CSDCallStateController *)self relayMessagingController];
    [v6 sendResetStateMessageToClient];

    BOOL v5 = v7;
  }
}

- (BOOL)shouldHandleCarPlayControlEvents
{
  BOOL v5 = [(CSDCallStateController *)self callContainer];
  id v6 = [v5 currentAudioAndVideoCalls];
  id v7 = [v6 count];
  if (!v7)
  {
    unsigned int v2 = [(CSDCallStateController *)self callContainer];
    unsigned int v3 = [v2 bargeCalls];
    if (![v3 count])
    {
      unsigned __int8 v9 = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v8 = [(CSDCallStateController *)self carPlayManager];
  unsigned __int8 v9 = [v8 isCarPlayConnected];

  if (!v7) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (void)_handleLocaleChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100153520;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleAudioSessionInterruptionNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001537E4;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleCarPlayControlEventNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100153A20;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_answerIncomingCall:(id)a3 withBehavior:(int64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)TUAnswerRequest) initWithCall:v6];
  [v7 setSourceIdentifier:TUCallSourceIdentifierCarPlay];
  [v7 setBehavior:a4];
  [v7 setDowngradeToAudio:1];
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Answering incoming call: %@, %@", (uint8_t *)&v10, 0x16u);
  }

  unsigned __int8 v9 = [(CSDCallStateController *)self callCenter];
  [v9 answerWithRequest:v7];
}

- (void)_answerIncomingCallAsConversation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self callCenter];
  id v6 = [v5 activeConversationForCall:v4];

  id v7 = [objc_alloc((Class)TUJoinConversationRequest) initWithConversation:v6 originatingUIType:45];
  objc_msgSend(v7, "setVideoEnabled:", objc_msgSend(v4, "isVideo"));
  objc_msgSend(v7, "setVideo:", objc_msgSend(v4, "isVideo"));
  id v8 = [v4 uniqueProxyIdentifierUUID];
  [v7 setUUID:v8];

  unsigned __int8 v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Answering incoming call as conversation: %@, %@", (uint8_t *)&v12, 0x16u);
  }

  int v10 = [(CSDCallStateController *)self callCenter];
  id v11 = [v10 joinConversationWithConversationRequest:v7];
}

- (void)_launchInCallApplicationForIncomingCallIfNecessary:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CSDCallCapabilities sharedInstance];
  if (![v5 _supportslaunchingInCallApplicationForIncomingCall])
  {
LABEL_6:

    goto LABEL_7;
  }
  unsigned int v6 = [(CSDCallStateController *)self _shouldLaunchInCallApplicationForProviderOfCall:v4];

  if (v6)
  {
    BOOL v5 = +[NSURL faceTimeLaunchForIncomingCallURL];
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      unsigned __int8 v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Opening URL for incoming call: %@", (uint8_t *)&v8, 0xCu);
    }

    [(CSDCallStateController *)self _launchInCallApplicationForCall:v4 withURL:v5];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_launchInCallApplicationForOutgoingCallIfNecessary:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CSDCallCapabilities sharedInstance];
  if (![v5 _supportslaunchingInCallApplicationForIncomingCall])
  {
LABEL_13:

    goto LABEL_14;
  }
  unsigned int v6 = [(CSDCallStateController *)self _shouldLaunchInCallApplicationForProviderOfCall:v4];

  if (v6)
  {
    BOOL v5 = +[NSURL faceTimeShowInCallUIURL];
    if (([v4 isConversation] & 1) == 0)
    {
      id v7 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v8 = [v7 isExpanseProvider];

        if (v8)
        {
          unsigned __int8 v9 = sub_100008DCC();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 138412290;
            int v12 = v5;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not opening URL %@ because outgoing call is provided by SharePlay.", (uint8_t *)&v11, 0xCu);
          }

          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    int v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      int v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Opening URL: %@ for outgoing call", (uint8_t *)&v11, 0xCu);
    }

    [(CSDCallStateController *)self _launchInCallApplicationForCall:v4 withURL:v5];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_launchInCallApplicationForExistingCall
{
  unsigned int v2 = +[CSDCallCapabilities sharedInstance];
  unsigned int v3 = [v2 _supportslaunchingInCallApplicationForIncomingCall];

  if (v3)
  {
    BOOL v5 = +[NSURL faceTimeShowInCallUIURL];
    id v4 = v5;
    TUOpenURLWithCompletion();
  }
}

- (void)_launchInCallApplicationForCall:(id)a3 withURL:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  TUOpenURLWithCompletion();
}

- (BOOL)_shouldLaunchInCallApplicationForProviderOfCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self callCenter];
  id v6 = [v5 activeConversationForCall:v4];

  id v7 = [(CSDCallStateController *)self featureFlags];
  unsigned __int8 v8 = 1;
  if ([v7 groupFacetimeAsAServiceEnabled] && v6)
  {
    unsigned __int8 v9 = [v6 provider];
    unsigned __int8 v8 = [v9 isDefaultProvider];
  }
  return v8;
}

- (void)_endProxyCallsForConnectingVideoCall
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v3 = [(CSDCallStateController *)self callContainer];
  id v4 = [v3 currentCalls];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 138412290;
    long long v13 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isHostedOnCurrentDevice", v13) & 1) == 0)
        {
          int v11 = sub_100008DCC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Disconnecting proxy call because a video call started connecting: %@", buf, 0xCu);
          }

          int v12 = [(CSDCallStateController *)self callCenter];
          [v12 disconnectCall:v10];
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)updateClientsWithCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating clients with call: %@", buf, 0xCu);
  }

  long long v6 = [(CSDCallStateController *)self currentProxyCalls];
  id v7 = +[TUProxyCall proxyCallWithCall:v4];
  uint64_t v8 = [(CSDCallStateController *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100154E10;
  v12[3] = &unk_1005053D0;
  v12[4] = self;
  id v13 = v4;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v4;
  dispatch_async(v8, v12);
}

- (id)eligibleCallsByFilteringCalls:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (-[CSDCallStateController isCallEligible:forClient:](self, "isCallEligible:forClient:", v14, v7, (void)v17))
        {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v15 = [v8 copy];

  return v15;
}

- (BOOL)shouldFilterClient:(id)a3
{
  unsigned int v4 = [a3 isRemote];
  if (v4)
  {
    id v5 = [(CSDCallStateController *)self featureFlags];
    unsigned __int8 v6 = [v5 filterGFTaaSCalls];

    LOBYTE(v4) = v6;
  }
  return v4;
}

- (BOOL)shouldSendCall:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CSDCallStateController *)self shouldFilterClient:v7])
  {
    uint64_t v8 = [(CSDCallStateController *)self callCenter];
    id v9 = [v8 activeConversationForCall:v6];

    id v10 = [v9 provider];
    id v11 = [v10 identifier];

    if (!v11)
    {
      if (![v6 isConversation])
      {
        id v11 = 0;
        goto LABEL_16;
      }
      long long v16 = [v6 providerContext];
      id v11 = [v16 objectForKeyedSubscript:TUConversationProviderIdentifierKey];

      if (!v11) {
        goto LABEL_16;
      }
    }
    if ((+[TUConversationProvider matchesDefaultProviderIdentifier:v11] & 1) == 0)
    {
      uint64_t v12 = +[CSDConversationProviderManager sharedInstance];
      id v13 = [v12 providerIdentifiersForClient:v7];

      uint64_t v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        long long v19 = v13;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "providerIdentifiers: %@ client: %@", (uint8_t *)&v18, 0x16u);
      }

      BOOL v15 = [v13 count] && (objc_msgSend(v13, "containsObject:", v11) & 1) != 0;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v15 = 1;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v15 = 1;
LABEL_18:

  return v15;
}

- (BOOL)isCallEligible:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = [v7 capabilities];
  id v9 = [v8 wantsToScreenCalls];

  char v18 = (char)v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100155970;
  v14[3] = &unk_100507FD8;
  v14[4] = &v15;
  sub_1000085AC(v7, @"access-screen-calls", v14, 0, (uint64_t)"-[CSDCallStateController isCallEligible:forClient:]");
  id v10 = [(CSDCallStateController *)self featureFlags];
  if ([v10 callScreeningEnabledM3]
    && [v7 isRemote]
    && [v6 isScreening]
    && !*((unsigned char *)v16 + 24)
    && [v6 status] != 5
    && [v6 status] != 6)
  {
    BOOL v12 = 0;
  }
  else
  {
    unsigned int v11 = [v7 isRemote];
    if (v11
      && ([v6 provider],
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          ![v9 supportsCurrentPlatform]))
    {
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = [(CSDCallStateController *)self shouldSendCall:v6 forClient:v7];
      if (!v11) {
        goto LABEL_13;
      }
    }
  }
LABEL_13:

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void)updateClientsWithFrequency:(id)a3 inDirection:(int)a4 forCalls:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CSDCallStateController *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100155A6C;
  v13[3] = &unk_1005051D0;
  int v16 = a4;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)updateClientsWithMeterLevel:(float)a3 inDirection:(int)a4 forCalls:(id)a5
{
  id v8 = a5;
  id v9 = [(CSDCallStateController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100155D28;
  block[3] = &unk_1005050A8;
  int v13 = a4;
  block[4] = self;
  id v12 = v8;
  float v14 = a3;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)resetClientCallProvisionalStates
{
  unsigned int v3 = [(CSDCallStateController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100155F60;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)sendClientsNotificationName:(id)a3
{
}

- (void)sendClientsNotificationName:(id)a3 forCall:(id)a4
{
}

- (void)sendClientsNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDCallStateController *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001560F0;
  v15[3] = &unk_1005053D0;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)handleReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(CSDCallStateController *)self _sendClientsReceivedCallDTMFUpdate:v8 forCall:v6];
  if ([v6 isHostedOnCurrentDevice])
  {
    id v7 = [(CSDCallStateController *)self relayMessagingController];
    [v7 sendReceivedDTMFUpdateForCall:v6 dtmfUpdate:v8];
  }
}

- (void)_sendClientsReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001563D0;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)_handleCallDisplayContextChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice])
  {
    id v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendUpdateCallDisplayContextMessageToClientForCall:v7];
  }
}

- (void)_handleUpdateRemoteUplinkMutedChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice])
  {
    id v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendUpdateRemoteUplinkMutedCallMessageToClientForCall:v7];
  }
}

- (void)_handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v4;
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [v4 object];
  if ([v8 isHostedOnCurrentDevice])
  {
    int v9 = [(CSDCallStateController *)self relayMessagingController];
    [v9 sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall:v8];
  }
}

- (void)_handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v4;
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [v4 object];
  if ([v8 isHostedOnCurrentDevice])
  {
    int v9 = [(CSDCallStateController *)self relayMessagingController];
    objc_msgSend(v9, "sendSetTTYTypeCallMessageForCall:ttyType:", v8, objc_msgSend(v8, "ttyType"));
  }
}

- (void)_handleMixesVoiceWithMediaChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2112;
    id v11 = v4;
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v8, 0x16u);
  }
  [(CSDCallStateController *)self _updateBluetoothAudioFormatIfNecessaryDueToMVMChange:1];
}

- (void)_handleFailureExpectedChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v4;
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v10, 0x16u);
  }
  int v8 = [v4 object];
  if ([v8 isHostedOnCurrentDevice])
  {
    id v9 = [(CSDCallStateController *)self relayMessagingController];
    [v9 sendUpdateFailureExpectedMessageToClientForCall:v8];
  }
}

- (void)_handleSupportsEmergencyFallbackChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v4;
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v10, 0x16u);
  }
  int v8 = [v4 object];
  if ([v8 isHostedOnCurrentDevice])
  {
    id v9 = [(CSDCallStateController *)self relayMessagingController];
    [v9 sendUpdateSupportsEmergencyFallbackToClientForCall:v8];
  }
}

- (void)_handleSupportsDTMFUpdatesChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v4;
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v10, 0x16u);
  }
  int v8 = [v4 object];
  if ([v8 isHostedOnCurrentDevice])
  {
    id v9 = [(CSDCallStateController *)self relayMessagingController];
    [v9 sendUpdateSupportsDTMFUpdatesToClientForCall:v8];
  }
}

- (void)_handleGroupUUIDChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling groupUUIDChangedNotification: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v4 object];
  int v8 = v7;
  if (v7 && [v7 isHostedOnCurrentDevice]) {
    [(CSDCallStateController *)self _handleGroupUUIDChangeForHostedCall:v8];
  }
}

- (void)_handleCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v18, 0xCu);
  }

  id v7 = [v4 object];
  int v8 = v7;
  if (v7)
  {
    int v9 = [v7 provider];
    if ([v9 isFaceTimeProvider])
    {
      unsigned int v10 = [v8 isActive];

      if (v10) {
        [(CSDCallStateController *)self registerForSecureMicEvents];
      }
    }
    else
    {
    }
    switch([v8 status])
    {
      case 1u:
        if ([v8 isHostedOnCurrentDevice]) {
          [(CSDCallStateController *)self _handleActiveCallStatusChangeForHostedCall:v8];
        }
        break;
      case 2u:
        if ([v8 isHostedOnCurrentDevice]) {
          [(CSDCallStateController *)self _handleHeldCallStatusChangeForHostedCall:v8];
        }
        break;
      case 3u:
        if ([v8 isHostedOnCurrentDevice]) {
          [(CSDCallStateController *)self _handleSendingCallStatusChangeForHostedCall:v8];
        }
        if ([v8 isOutgoing])
        {
          if ([v8 isEndpointOnCurrentDevice])
          {
            id v11 = [v8 provider];
            unsigned int v12 = [v11 supportsCurrentPlatform];

            if (v12)
            {
              if ([v8 isConversation]) {
                [(CSDCallStateController *)self _launchInCallApplicationForOutgoingConversationIfNecessary:v8];
              }
              else {
                [(CSDCallStateController *)self _launchInCallApplicationForOutgoingCallIfNecessary:v8];
              }
            }
          }
        }
        break;
      case 4u:
        id v13 = [v8 provider];
        unsigned int v14 = [v13 supportsCurrentPlatform];

        if (v14) {
          [(CSDCallStateController *)self _launchInCallApplicationForIncomingCallIfNecessary:v8];
        }
        if ([v8 isHostedOnCurrentDevice]) {
          [(CSDCallStateController *)self _handleRingingCallStatusChangeForHostedCall:v8];
        }
        break;
      case 6u:
        if ([v8 isHostedOnCurrentDevice])
        {
          [(CSDCallStateController *)self _handleDisconnectedCallStatusChangeForHostedCall:v8];
          if ([v8 isVoicemail]) {
            [(CSDCallStateController *)self _handleDisconnectedCallStatusChangeForVoicemailCall];
          }
        }
        [(CSDCallStateController *)self _updateRoutesForDisconnectedCall];
        break;
      default:
        break;
    }
  }
  id v15 = [(CSDCallStateController *)self localRouteController];
  id v16 = [(CSDCallStateController *)self callContainer];
  uint64_t v17 = [v16 currentAudioAndVideoCalls];
  [v15 updateStateWithCalls:v17];
}

- (void)_handleCallStartedOutgoingNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v12, 0xCu);
  }

  id v7 = [v4 object];
  int v8 = [v7 provider];
  id v9 = [v8 isTinCanProvider];

  unsigned int v10 = +[CSDRelayConferenceInterface sharedInstance];
  id v11 = [v7 uniqueProxyIdentifier];
  objc_msgSend(v10, "updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:", v11, objc_msgSend(v7, "isUsingBaseband"), 0, v9);
}

- (void)_handleCallStartedConnectingNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice]) {
    [(CSDCallStateController *)self _handleConnectingCallStatusChangeForHostedCall:v7];
  }
  if ([v7 isVideo]) {
    [(CSDCallStateController *)self _endProxyCallsForConnectingVideoCall];
  }
}

- (void)_handleCallConnectedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice]) {
    [(CSDCallStateController *)self _handleConnectedCallStatusChangeForHostedCall:v7];
  }
}

- (void)_handleNeedsManualInCallSoundsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice])
  {
    int v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendNeedsManualInCallSoundsChangeMessageToClientForCall:v7];
  }
}

- (void)_handleCallWantsHoldMusicChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice]
    && ([v7 wantsHoldMusic] & 1) == 0)
  {
    int v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendResetWantsHoldMusicMessageToClientForCall:v7];
  }
}

- (void)_handleCallShouldSuppressRingtoneChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 shouldSuppressRingtone]
    && (([v7 isHostedOnCurrentDevice] & 1) != 0
     || ([v7 ringtoneSuppressedRemotely] & 1) == 0))
  {
    int v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendSuppressRingtoneMessageForCall:v7];
    goto LABEL_10;
  }
  if (([v7 shouldSuppressRingtone] & 1) == 0
    && [v7 isHostedOnCurrentDevice])
  {
    int v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendUpdateRemoteCallStateMessageToClient];
LABEL_10:
  }
}

- (void)_handleCallModelChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice])
  {
    int v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendUpdateCallModelMessageToClientForCall:v7];
  }
}

- (void)_handleResetCallStateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(CSDCallStateController *)self relayMessagingController];
  [v7 sendResetStateMessageToClient];
}

- (void)_handleHardPauseStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [v4 object];
  int v8 = [(CSDCallStateController *)self relayMessagingController];
  id v9 = [v7 hardPauseDigitsState];
  id v10 = [v7 hardPauseDigits];
  [v8 sendHardPauseAvailabilityMessageToClientForState:v9 digits:v10];
}

- (void)_handleCallIsUsingBasebandChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v12, 0xCu);
  }

  id v7 = [v4 object];
  if (([v7 isEndpointOnCurrentDevice] & 1) == 0
    && [v7 hasStartedOutgoing])
  {
    int v8 = [v7 provider];
    id v9 = [v8 isTinCanProvider];

    id v10 = +[CSDRelayConferenceInterface sharedInstance];
    int v11 = [v7 uniqueProxyIdentifier];
    objc_msgSend(v10, "updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:", v11, objc_msgSend(v7, "isUsingBaseband"), 0, v9);
  }
}

- (void)_handleFaceTimeAvailabilityChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  if (+[TUCallCapabilities supportsPrimaryCalling])
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = [(CSDCallStateController *)self relayMessagingController];
    int v8 = [(CSDCallStateController *)self callProviderManager];
    [v7 sendUpdateCallContextMessageToClientForCallProviderManager:v8];
  }
}

- (void)_handleInvitationSentNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice])
  {
    int v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendInvitationSentMessageToClientForCall:v7];
  }
}

- (void)_handleCSDRelayIDSActiveAccountsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100158018;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleCSDRelayPairedDeviceConnectedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015817C;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handlePreferredRouteChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100158380;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)_nonRingingCallExistsOnThisDevice
{
  unsigned int v3 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CSDCallStateController *)self callContainer];
  id v5 = [v4 currentAudioAndVideoCalls];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 status] != 4
          && [v10 isEndpointOnCurrentDevice])
        {
          int v12 = sub_100008DCC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [(CSDCallStateController *)self callContainer];
            unsigned int v14 = [v13 _allCalls];
            *(_DWORD *)buf = 138412546;
            id v21 = v10;
            __int16 v22 = 2112;
            v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Non-ringing call found on device: %@. All calls: %@", buf, 0x16u);
          }
          BOOL v11 = 1;
          goto LABEL_14;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (void)_handleRingingCallStatusChangeForHostedCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CSDRouteManager sharedInstance];
  unsigned int v7 = [v6 isAnyVehicleRouteAvailableForCall:v4];

  uint64_t v8 = +[PDRRegistry sharedInstance];
  int v9 = [v8 getActivePairedDevice];

  if (v9)
  {
    id v10 = +[CSDRouteManager sharedInstance];
    id v11 = [v10 isEligibleRouteAvailableForCall:v4];

    int v12 = [v4 provider];
    unsigned int v13 = [v12 isTinCanProvider];

    if (v13)
    {
      unsigned int v14 = [v9 supportsCapability:674176742];
      goto LABEL_6;
    }
  }
  else
  {
    id v11 = 0;
  }
  unsigned int v14 = 1;
LABEL_6:
  if (![v4 isConversation])
  {
LABEL_10:
    int v18 = 0;
    goto LABEL_15;
  }
  if ([v4 isConversation])
  {
    id v15 = [(CSDCallStateController *)self featureFlags];
    if ([v15 conversationOneToOneModeEnabled])
    {
      long long v16 = [v4 remoteParticipantHandles];
      id v17 = [v16 count];

      if (v17 == (id)1) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if ([v4 isConversation])
  {
    long long v19 = [(CSDCallStateController *)self featureFlags];
    unsigned int v20 = [v19 gftOnWatch];

    int v18 = v20 ^ 1;
  }
  else
  {
    int v18 = 1;
  }
LABEL_15:
  if (![(CSDCallStateController *)self shouldRelayToOtherDevices]
    || (([v4 hasRelaySupport:1] ^ 1 | v7) & 1) != 0
    || (([v4 isTTY] | v18) & 1) != 0
    || ((v14 ^ 1) & 1) != 0)
  {
    __int16 v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138413826;
      id v24 = v4;
      __int16 v25 = 1024;
      unsigned int v26 = ![(CSDCallStateController *)self shouldRelayToOtherDevices];
      __int16 v27 = 1024;
      unsigned int v28 = [v4 hasRelaySupport:1] ^ 1;
      __int16 v29 = 1024;
      unsigned int v30 = v7;
      __int16 v31 = 1024;
      unsigned int v32 = [v4 isTTY];
      __int16 v33 = 1024;
      unsigned int v34 = [v4 isConversation];
      __int16 v35 = 1024;
      unsigned int v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignoring ringing call status change for call %@ because relay calling is disabled (%d) or this call doesn't support relaying call state (%d) or a vehicle route is available (%d) or call is TTY (%d) or call is conversation (%d) or shouldRelayTinCanCall (%d)", (uint8_t *)&v23, 0x30u);
    }
  }
  else
  {
    id v21 = [(CSDCallStateController *)self relayMessagingController];
    objc_msgSend(v21, "sendIncomingCallMessageToClientForCall:cannotBeAnswered:cannotRelayAudioOrVideoOnPairedDevice:", v4, -[CSDCallStateController _nonRingingCallExistsOnThisDevice](self, "_nonRingingCallExistsOnThisDevice"), v11);
  }
}

- (void)_handleGroupUUIDChangeForHostedCall:(id)a3
{
  id v8 = a3;
  id v4 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v4);

  if (([v8 isConversation] & 1) != 0
    || ([(CSDCallStateController *)self featureFlags],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 gftOnWatch],
        v5,
        v6))
  {
    if ([v8 isHostedOnCurrentDevice])
    {
      unsigned int v7 = [(CSDCallStateController *)self relayMessagingController];
      [v7 sendUpdateRemoteCallStateMessageToClient:1];
    }
  }
}

- (void)_handleSendingCallStatusChangeForHostedCall:(id)a3
{
  id v8 = a3;
  id v4 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v4);

  if (![v8 isConversation]
    || ([(CSDCallStateController *)self featureFlags],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 gftOnWatch],
        v5,
        v6))
  {
    unsigned int v7 = [(CSDCallStateController *)self relayMessagingController];
    [v7 sendCallDialedMessageToClientForCall:v8];
  }
}

- (void)_handleConnectingCallStatusChangeForHostedCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isEndpointOnCurrentDevice]
    && ([v4 isOutgoing] & 1) == 0)
  {
    unsigned int v6 = [(CSDCallStateController *)self relayMessagingController];
    [v6 sendCallAnsweredElsewhereMessageToClientForCall:v4];

    unsigned int v7 = +[CSDRelayConferenceInterface sharedInstance];
    id v8 = [v4 uniqueProxyIdentifier];
    [v7 stopConferenceForIdentifier:v8];
  }
  if ([v4 status] == 6)
  {
    int v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not sending out call started connecting message because call is already disconnected: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    int v9 = [(CSDCallStateController *)self relayMessagingController];
    [v9 sendCallStartedConnectingMessageToClientForCall:v4];
  }
}

- (void)_handleConnectedCallStatusChangeForHostedCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 status] == 6)
  {
    unsigned int v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not sending out call connected message because call is already disconnected: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    unsigned int v6 = [(CSDCallStateController *)self relayMessagingController];
    [v6 sendCallConnectedMessageToClientForCall:v4];
  }
}

- (void)_handleActiveCallStatusChangeForHostedCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [(CSDCallStateController *)self relayMessagingController];
  [v6 sendUpdateRemoteCallStateMessageToClient];

  id v8 = +[CSDRelayConferenceInterface sharedInstance];
  int v7 = [v4 uniqueProxyIdentifier];

  [v8 setConferenceActiveForIdentifier:v7];
}

- (void)_handleCallRemoteParticipantHandlesChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  int v7 = [v4 object];
  if ([v7 isHostedOnCurrentDevice])
  {
    id v8 = [(CSDCallStateController *)self relayMessagingController];
    [v8 sendUpdateRemoteCallStateMessageToClient];
  }
}

- (void)_handleHeldCallStatusChangeForHostedCall:(id)a3
{
  id v4 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDCallStateController *)self relayMessagingController];
  [v5 sendUpdateRemoteCallStateMessageToClient];
}

- (void)_handleDisconnectedCallStatusChangeForVoicemailCall
{
  unsigned int v2 = sub_100008DCC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = +[NSString stringWithUTF8String:"com.apple.telephonyutilities.callservicesdaemon.voicemailcallended"];
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Sending voicemail call ended notification %@", (uint8_t *)&v4, 0xCu);
  }
  notify_post("com.apple.telephonyutilities.callservicesdaemon.voicemailcallended");
}

- (void)_updateRoutesForDisconnectedCall
{
  unsigned int v3 = [(CSDCallStateController *)self localRouteController];
  [v3 clearState];

  id v4 = [(CSDCallStateController *)self pairedHostDeviceRouteController];
  [v4 clearState];
}

- (void)_handleDisconnectedCallStatusChangeForHostedCall:(id)a3
{
  id v10 = a3;
  id v4 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDCallStateController *)self relayMessagingController];
  [v5 sendNeedsManualInCallSoundsChangeMessageToClientForCall:v10];

  unsigned int v6 = [(CSDCallStateController *)self relayMessagingController];
  [v6 sendCallDisconnectedMessageToClientForCall:v10];

  unsigned int v7 = [v10 isEndpointOnCurrentDevice];
  id v8 = +[CSDRelayConferenceInterface sharedInstance];
  int v9 = [v10 uniqueProxyIdentifier];
  if (v7) {
    [v8 stopConferenceForIdentifier:v9];
  }
  else {
    [v8 prepareToStopConferenceForIdentifier:v9];
  }
}

- (void)_updateBluetoothAudioFormatIfNecessaryDueToMVMChange:(BOOL)a3
{
  unsigned int v3 = a3;
  id v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [(CSDCallStateController *)self featureFlags];
  unsigned int v7 = [v6 expanseBTSwitchingEnabled];

  if (!v7) {
    return;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = [(CSDCallStateController *)self callContainer];
  int v9 = [v8 currentAudioAndVideoCalls];

  id v10 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (!v10)
  {
LABEL_10:

    goto LABEL_21;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v39;
LABEL_4:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v39 != v12) {
      objc_enumerationMutation(v9);
    }
    unsigned int v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
    if ([v14 mixesVoiceWithMedia]) {
      break;
    }
    if (v11 == (id)++v13)
    {
      id v11 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (!v11) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }
  }
  id v15 = v14;

  if (!v15)
  {
LABEL_21:
    [(CSDCallStateController *)self setCurrentlyTrackedA2DPRouteIdentifier:0];
    [0 setBluetoothAudioFormat:0];
    return;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v16 = [(CSDCallStateController *)self localRouteController];
  id v17 = [v16 routesByUniqueIdentifier];
  int v18 = [v17 allValues];

  id v19 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (!v19) {
    goto LABEL_20;
  }
  id v20 = v19;
  uint64_t v21 = *(void *)v35;
  while (2)
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v35 != v21) {
        objc_enumerationMutation(v18);
      }
      int v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if ([v23 isCurrentlyPicked])
      {
        id v24 = v23;

        if (!v24) {
          goto LABEL_39;
        }
        if (v3) {
          unsigned int v3 = [v24 isBluetoothLE];
        }
        if ((([v24 isA2DPRoute] & 1) != 0 || v3)
          && [v15 bluetoothAudioFormat] != (id)1)
        {
          [v15 setBluetoothAudioFormat:1];
          __int16 v25 = sub_100008DCC();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Picked route %@ changed to A2DP, so muting", buf, 0xCu);
          }

          [v15 setUplinkMuted:1];
        }
        unsigned int v26 = [(CSDCallStateController *)self currentlyTrackedA2DPRouteIdentifier];
        if ([v26 length])
        {
          __int16 v27 = [v24 uniqueIdentifier];
          unsigned int v28 = [(CSDCallStateController *)self currentlyTrackedA2DPRouteIdentifier];
          if (([v27 isEqualToString:v28] & 1) == 0
            && ![v24 isA2DPRoute])
          {
            unsigned __int8 v30 = [v24 isBluetoothLE];

            if ((v30 & 1) == 0)
            {
              __int16 v31 = sub_100008DCC();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v32 = [(CSDCallStateController *)self currentlyTrackedA2DPRouteIdentifier];
                __int16 v33 = [v24 uniqueIdentifier];
                *(_DWORD *)buf = 138412546;
                id v43 = v32;
                __int16 v44 = 2112;
                v45 = v33;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Picked route changed from %@ to %@, setting call's bluetooth audio format back to automatic", buf, 0x16u);
              }
              [v15 setBluetoothAudioFormat:0];
            }
            goto LABEL_36;
          }
        }
LABEL_36:
        if (([v24 isA2DPRoute] & 1) != 0
          || ([v24 isBluetoothLE] & 1) != 0)
        {
          __int16 v29 = [v24 uniqueIdentifier];
          [(CSDCallStateController *)self setCurrentlyTrackedA2DPRouteIdentifier:v29];
        }
        else
        {
          [(CSDCallStateController *)self setCurrentlyTrackedA2DPRouteIdentifier:0];
        }

        goto LABEL_42;
      }
    }
    id v20 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_20:

LABEL_39:
  [(CSDCallStateController *)self setCurrentlyTrackedA2DPRouteIdentifier:0];
  [v15 setBluetoothAudioFormat:0];
LABEL_42:
}

- (id)outgoingCallFromDialRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hostOnCurrentDevice];
  unsigned int v6 = off_100502C40;
  if (!v5) {
    unsigned int v6 = off_100502C48;
  }
  id v7 = [objc_alloc(*v6) initOutgoingWithDialRequest:v4];

  [(CSDCallStateController *)self setCallDelegatesIfNeeded:v7];
  [(CSDCallStateController *)self propertiesChangedForCall:v7];

  return v7;
}

- (id)outgoingCallFromJoinRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDCallStateController *)self callCenter];
  objc_msgSend(v4, "setHostedOnCurrentDevice:", objc_msgSend(v5, "_shouldRelayJoinConversationRequest:", v4) ^ 1);

  unsigned int v6 = [v4 hostedOnCurrentDevice];
  id v7 = off_100502C40;
  if (!v6) {
    id v7 = off_100502C48;
  }
  id v8 = [objc_alloc(*v7) initOutgoingWithJoinConversationRequest:v4];
  [(CSDCallStateController *)self setCallDelegatesIfNeeded:v8];
  [(CSDCallStateController *)self propertiesChangedForCall:v8];

  return v8;
}

- (void)setCallDelegatesIfNeeded:(id)a3
{
  id v19 = a3;
  id v4 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v4);

  unsigned int v5 = [(CSDCallStateController *)self callCenter];
  unsigned int v6 = [v5 callServicesInterface];
  [v6 registerCall:v19];

  [v19 setDelegate:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(CSDCallStateController *)self relayCallDataSource];
    [v19 setDataSource:v7];

    id v8 = v19;
    int v9 = [v8 relayDelegate];

    if (!v9)
    {
      id v10 = [(CSDCallStateController *)self relayCallDelegate];
      [v8 setRelayDelegate:v10];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(CSDCallStateController *)self providerCallDataSource];
    [v19 setDataSource:v11];

    id v12 = v19;
    uint64_t v13 = [v12 providerCallDelegate];

    if (!v13)
    {
      unsigned int v14 = [(CSDCallStateController *)self providerCallDataSource];
      [v12 setProviderCallDelegate:v14];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [(CSDCallStateController *)self providerCallDataSource];
    [v19 setDataSource:v15];

    id v16 = v19;
    id v17 = [v16 providerBargeCallDelegate];

    if (!v17)
    {
      int v18 = [(CSDCallStateController *)self providerCallDataSource];
      [v16 setProviderBargeCallDelegate:v18];
    }
  }
}

- (id)performDialCall:(id)a3 displayContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[SOSUtilities shouldBlockNonEmergencyCalls])
  {
    id v8 = [(CSDCallStateController *)self callCenter];
    unsigned __int8 v9 = [v8 _isEmergencyDialRequest:v6];

    if ((v9 & 1) == 0)
    {
      id v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dial request rejected due to SOS being active", buf, 2u);
      }
      goto LABEL_12;
    }
  }
  id v10 = [(CSDCallStateController *)self callCenter];
  id v11 = [v10 frontmostCall];

  if (v11 && [v11 isEmergency])
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dial request rejected due to active emergency call", v18, 2u);
    }

LABEL_12:
    uint64_t v13 = 0;
    goto LABEL_19;
  }
  uint64_t v13 = [(CSDCallStateController *)self outgoingCallFromDialRequest:v6];
  unsigned int v14 = [v13 dateAnsweredOrDialed];
  if (v14)
  {
    [v13 setDateAnsweredOrDialed:v14];
  }
  else
  {
    id v15 = [v6 dateDialed];
    [v13 setDateAnsweredOrDialed:v15];
  }
  [(CSDCallStateController *)self setCallDelegatesIfNeeded:v13];
  if (v13)
  {
    [(CSDCallStateController *)self sendAutomaticNameAndPhotoUsingDialRequestIfPossible:v6];
    [v13 dialWithRequest:v6 displayContext:v7];
  }
  else
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1003AD4D4();
    }
  }
LABEL_19:

  return v13;
}

+ (void)sanitizeJoinConversationRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[CSDConversationProviderManager sharedInstance];
  unsigned int v5 = [v3 provider];
  id v6 = [v4 serviceForProvider:v5];

  unsigned __int8 v30 = v6;
  if (v6)
  {
    id v7 = [v3 provider];
    unsigned int v8 = [v7 isDefaultProvider];

    if (v8)
    {
      unsigned __int8 v9 = +[NSMutableSet set];
      id v10 = +[NSMutableSet set];
      id v11 = [v6 allAliases];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10015A07C;
      v35[3] = &unk_1005088E8;
      id v12 = v9;
      id v36 = v12;
      [v11 enumerateObjectsUsingBlock:v35];

      uint64_t v13 = [v3 remoteMembers];
      id v14 = [v13 count];

      if (v14 == (id)1)
      {
        id v15 = [v3 remoteMembers];
        id v16 = [v15 anyObject];
        [v10 addObject:v16];
      }
      else
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v15 = [v3 remoteMembers];
        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v17)
        {
          id v18 = v17;
          id v29 = v3;
          uint64_t v19 = *(void *)v32;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v32 != v19) {
                objc_enumerationMutation(v15);
              }
              uint64_t v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              __int16 v22 = [v21 handle];
              int v23 = [v22 normalizedValue];
              unsigned __int8 v24 = [v12 containsObject:v23];

              if (v24)
              {
                __int16 v25 = sub_100008DCC();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  long long v38 = v21;
                  __int16 v39 = 2112;
                  long long v40 = v30;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Removing %@ from sanitized join request since it matches a local alias on the ids service: %@", buf, 0x16u);
                }
              }
              else
              {
                [v10 addObject:v21];
              }
            }
            id v18 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
          }
          while (v18);
          id v3 = v29;
        }
      }

      [v3 setRemoteMembers:v10];
      if ([v3 avMode] == (id)1)
      {
        unsigned int v26 = [v3 remoteMembers];
        if ((unint64_t)[v26 count] <= 1)
        {
        }
        else
        {
          unsigned int v27 = [v3 supportsAVMode:2];

          if (v27)
          {
            unsigned int v28 = sub_100008DCC();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Setting join request to TUConversationAVModeVideo from Audio since this is a GFT conversation", buf, 2u);
            }

            [v3 setAvMode:2];
            [v3 setVideoEnabled:0];
          }
        }
      }
    }
  }
}

- (id)performJoinConversation:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() sanitizeJoinConversationRequest:v4];
  unsigned int v5 = [(CSDCallStateController *)self callContainer];
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  unsigned int v8 = [v5 callWithCallUUID:v7];

  if (v8)
  {
    [(CSDCallStateController *)self _launchInCallApplicationForAnsweringCallIfNecessary:v8];
  }
  else
  {
    unsigned int v8 = [(CSDCallStateController *)self outgoingCallFromJoinRequest:v4];
    [(CSDCallStateController *)self setCallDelegatesIfNeeded:v8];
  }
  [(CSDCallStateController *)self sendAutomaticNameAndPhotoUsingJoinRequestIfPossible:v4];
  if (objc_opt_respondsToSelector()) {
    [v8 joinConversationWithRequest:v4];
  }

  return v8;
}

- (void)performHoldCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CSDCallStateController *)self callContainer];
    id v7 = [v6 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  unsigned int v8 = [v4 callGroupUUID];

  if (v8)
  {
    unsigned __int8 v9 = [(CSDCallStateController *)self callContainer];
    id v10 = [v4 callGroupUUID];
    id v11 = [v9 callsWithGroupUUID:v10];
  }
  else
  {
    id v13 = v4;
    id v11 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  id v12 = [v4 dataSource];
  [v12 holdCalls:v11 whileUnholdingCalls:&__NSArray0__struct];
}

- (void)performUnholdCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CSDCallStateController *)self callContainer];
    id v7 = [v6 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  unsigned int v8 = [v4 callGroupUUID];

  if (v8)
  {
    unsigned __int8 v9 = [(CSDCallStateController *)self callContainer];
    id v10 = [v4 callGroupUUID];
    id v11 = [v9 callsWithGroupUUID:v10];
  }
  else
  {
    id v13 = v4;
    id v11 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  id v12 = [v4 dataSource];
  [v12 holdCalls:&__NSArray0__struct whileUnholdingCalls:v11];
}

- (void)performGroupCall:(id)a3 withCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = [(CSDCallStateController *)self callContainer];
    id v10 = [v9 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  id v11 = [v7 callGroupUUID];

  id v12 = [v6 callGroupUUID];

  if (v11)
  {
    if (v12)
    {
      id v13 = [(CSDCallStateController *)self callContainer];
      id v14 = [v6 callGroupUUID];
      id v15 = [v13 callsWithGroupUUID:v14];
    }
    else
    {
      id v27 = v6;
      id v15 = +[NSArray arrayWithObjects:&v27 count:1];
    }
    id v20 = [(CSDCallStateController *)self callContainer];
    uint64_t v21 = [v7 callGroupUUID];
    id v18 = [v20 callsWithGroupUUID:v21];
  }
  else
  {
    if (v12)
    {
      id v16 = [(CSDCallStateController *)self callContainer];
      id v17 = [v6 callGroupUUID];
      id v18 = [v16 callsWithGroupUUID:v17];

      id v26 = v7;
      uint64_t v19 = &v26;
    }
    else
    {
      id v25 = v7;
      id v18 = +[NSArray arrayWithObjects:&v25 count:1];
      id v24 = v6;
      uint64_t v19 = &v24;
    }
    id v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 1, v24);
  }
  __int16 v22 = [v15 firstObject];
  int v23 = [v22 dataSource];
  [v23 groupCalls:v15 withCalls:v18];
}

- (void)performUngroupCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CSDCallStateController *)self callContainer];
    id v7 = [v6 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  unsigned int v8 = [v4 callGroupUUID];

  if (v8)
  {
    unsigned __int8 v9 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = [(CSDCallStateController *)self callContainer];
    id v11 = [v10 currentCalls];

    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v21 + 1) + 8 * (void)v15);
          if (v16 != v4)
          {
            id v17 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v15) callGroupUUID];
            id v18 = [v4 callGroupUUID];
            unsigned int v19 = [v17 isEqual:v18];

            if (v19) {
              [v9 addObject:v16];
            }
          }
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    id v20 = [v4 dataSource];
    [v20 ungroupCall:v4 fromOtherCallsInGroup:v9];
  }
  else
  {
    unsigned __int8 v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to performUngroupCall because the call is not grouped", buf, 2u);
    }
  }
}

- (void)performSwapCalls
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CSDCallStateController *)self callContainer];
    unsigned int v5 = [v4 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    *(void *)long long v41 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  id v6 = [(CSDCallStateController *)self callContainer];
  id v7 = [v6 callsPassingTest:&stru_100508908];

  unsigned int v8 = [(CSDCallStateController *)self callContainer];
  unsigned __int8 v9 = [v8 callsPassingTest:&stru_100508928];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v36 + 1) + 8 * i) model];
        unsigned int v16 = [v15 supportsHolding];

        if (!v16)
        {
          int v17 = 1;
          goto LABEL_13;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  int v17 = 0;
LABEL_13:

  if ([v10 count] && (!objc_msgSend(v9, "count") ? (char v18 = 1) : (char v18 = v17), (v18 & 1) == 0))
  {
    unsigned int v19 = objc_alloc_init(CSDCallDataSourceMap);
    id v30 = v10;
    [(CSDCallDataSourceMap *)v19 addCalls:v10 forIdentifier:@"callsToHold"];
    long long v31 = v9;
    [(CSDCallDataSourceMap *)v19 addCalls:v9 forIdentifier:@"callsToUnhold"];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v22 = [(CSDCallDataSourceMap *)v19 dataSources];
    id v23 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
          unsigned int v28 = [(CSDCallDataSourceMap *)v19 callsForDataSource:v27 identifier:@"callsToHold"];
          id v29 = [(CSDCallDataSourceMap *)v19 callsForDataSource:v27 identifier:@"callsToUnhold"];
          [v27 holdCalls:v28 whileUnholdingCalls:v29];
        }
        id v24 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v24);
    }

    id v10 = v30;
    unsigned __int8 v9 = v31;
  }
  else
  {
    sub_100008DCC();
    unsigned int v19 = (CSDCallDataSourceMap *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [v10 count] == 0;
      id v21 = [v9 count];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)long long v41 = v20;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v21 == 0;
      __int16 v42 = 1024;
      int v43 = v17;
      _os_log_impl((void *)&_mh_execute_header, &v19->super, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to performSwapCalls because either there is no active call (%d), there is no held call (%d), or an active call exists that cannot be held (%d)", buf, 0x14u);
    }
  }
}

- (void)performAnswerCall:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CSDCallStateController *)self _launchInCallApplicationForAnsweringCallIfNecessary:v6];
  unsigned int v8 = [v7 endpointIDSDestination];

  if (v8)
  {
    unsigned __int8 v9 = [(CSDCallStateController *)self relayMessagingController];
    [v9 requestAnswerForRequest:v7 forCall:v6];
  }
  else
  {
    switch((unint64_t)[v7 behavior])
    {
      case 0uLL:
        [(CSDCallStateController *)self performEndActiveAndAnswerCall:v6 withRequest:v7];
        break;
      case 1uLL:
        [(CSDCallStateController *)self performEndHeldAndAnswerCall:v6 withRequest:v7];
        break;
      case 2uLL:
        [(CSDCallStateController *)self performHoldActiveAndAnswerCall:v6 withRequest:v7];
        break;
      case 3uLL:
        [(CSDCallStateController *)self performAnswerCallAsVideoUpgrade:v6 withRequest:v7];
        break;
      case 4uLL:
        [(CSDCallStateController *)self performAnswerCallAsAudioDowngrade:v6 withRequest:v7];
        break;
      default:
        break;
    }
    [(CSDCallStateController *)self deactivatePTTBargeCalls];
    id v10 = [v7 endpointRapportEffectiveIdentifier];
    id v11 = [v7 endpointRapportMediaSystemIdentifier];
    if ([v10 length] || objc_msgSend(v11, "length"))
    {
      id v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v6 uniqueProxyIdentifier];
        int v15 = 138412802;
        unsigned int v16 = v11;
        __int16 v17 = 2112;
        char v18 = v10;
        __int16 v19 = 2112;
        BOOL v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "An endpointRapportMediaSystemIdentifier=\"%@\" or endpointRapportEffectiveIdentifier=\"%@\" is present on answer request for call with identifier %@ so attempting to pick matching route", (uint8_t *)&v15, 0x20u);
      }
      uint64_t v14 = [(CSDCallStateController *)self callCenter];
      [v14 pickRouteForRapportDeviceWithMediaSystemIdentifier:v11 effectiveIdentifier:v10];
    }
  }
}

- (id)callWithUniqueProxyIdentifier:(id)a3 fromCallsToAnswer:(id)a4
{
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
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
        id v11 = objc_msgSend(v10, "uniqueProxyIdentifier", (void)v14);
        unsigned int v12 = [v11 isEqualToString:v5];

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

- (void)performEndActiveAndAnswerCall:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v46 = v6;
    __int16 v47 = 2112;
    id v48 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing end active calls and answer ringing call %@ for answer request %@", buf, 0x16u);
  }

  unsigned __int8 v9 = [v7 uniqueProxyIdentifier];
  if ([v9 length])
  {
    id v10 = [(CSDCallStateController *)self callContainer];
    id v11 = [v10 audioAndVideoCallsWithStatus:4];

    unsigned int v12 = [(CSDCallStateController *)self callContainer];
    uint64_t v13 = [v12 screeningCall];

    if (-[NSObject count](v11, "count") || ([v7 sendToScreening] & 1) != 0 || v13)
    {
      long long v14 = [(CSDCallStateController *)self callWithUniqueProxyIdentifier:v9 fromCallsToAnswer:v11];
      if (v14
        || ([v7 sendToScreening] & 1) != 0
        || ([v13 uniqueProxyIdentifier],
            long long v15 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v16 = [v15 isEqualToString:v9],
            v15,
            (v16 & 1) != 0))
      {
        if (([v14 isEqualToCall:v6] & 1) != 0
          || ([v7 sendToScreening] & 1) != 0
          || ([v13 isEqualToCall:v6] & 1) != 0)
        {
          long long v17 = [v6 dataSource];
          if (v17)
          {
            id v38 = v7;
            char v18 = objc_alloc_init((Class)NSMutableArray);
            __int16 v19 = [(CSDCallStateController *)self callContainer];
            BOOL v20 = [v19 audioAndVideoCallsWithStatus:1];

            if ([v20 count]) {
              [v18 addObjectsFromArray:v20];
            }
            long long v34 = v20;
            long long v36 = v14;
            long long v37 = v9;
            id v21 = [(CSDCallStateController *)self callContainer];
            long long v22 = [v21 audioAndVideoCallsWithStatus:3];

            if ([v22 count]) {
              [v18 addObjectsFromArray:v22];
            }
            long long v33 = v22;
            id v39 = v6;
            [v18 removeObject:v6];
            id v23 = objc_alloc_init(CSDCallDataSourceMap);
            long long v35 = v18;
            [(CSDCallDataSourceMap *)v23 addCalls:v18 forIdentifier:@"callsToDisconnect"];
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v24 = [(CSDCallDataSourceMap *)v23 dataSources];
            id v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v41;
              do
              {
                for (i = 0; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v41 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  id v29 = *(NSObject **)(*((void *)&v40 + 1) + 8 * i);
                  if (v29 != v17)
                  {
                    id v30 = [(CSDCallDataSourceMap *)v23 callsForDataSource:*(void *)(*((void *)&v40 + 1) + 8 * i) identifier:@"callsToDisconnect"];
                    [v29 disconnectCalls:v30 whileHoldingCalls:&__NSArray0__struct andUnholdingCalls:&__NSArray0__struct andUngroupingCalls:&__NSArray0__struct];
                  }
                }
                id v26 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
              }
              while (v26);
            }

            long long v31 = [(CSDCallDataSourceMap *)v23 callsForDataSource:v17 identifier:@"callsToDisconnect"];
            id v7 = v38;
            id v6 = v39;
            [v17 answerCall:v39 withRequest:v38 whileDisconnectingActiveCalls:v31];

            unsigned __int8 v9 = v37;
            long long v14 = v36;
            long long v32 = v35;
          }
          else
          {
            long long v32 = sub_100008DCC();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_1003AD570();
            }
          }
        }
        else
        {
          long long v17 = sub_100008DCC();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_1003AD5D8();
          }
        }
      }
      else
      {
        long long v17 = sub_100008DCC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1003AD640();
        }
      }
    }
    else
    {
      long long v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1003AD6A8();
      }
    }
  }
  else
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AD53C();
    }
  }
}

- (void)performEndHeldAndAnswerCall:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v50 = v6;
    __int16 v51 = 2112;
    id v52 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing end held calls and answer ringing call %@ for answer request %@", buf, 0x16u);
  }

  unsigned __int8 v9 = [v7 uniqueProxyIdentifier];
  if ([v9 length])
  {
    id v10 = [(CSDCallStateController *)self callContainer];
    id v11 = [v10 audioAndVideoCallsWithStatus:4];

    if ([v11 count])
    {
      unsigned int v12 = [(CSDCallStateController *)self callWithUniqueProxyIdentifier:v9 fromCallsToAnswer:v11];
      uint64_t v13 = v12;
      if (v12)
      {
        if ([v12 isEqualToCall:v6])
        {
          long long v43 = [v6 dataSource];
          if (v43)
          {
            id v38 = v13;
            long long v14 = objc_alloc_init((Class)NSMutableArray);
            id v15 = objc_alloc_init((Class)NSMutableArray);
            unsigned __int8 v16 = [(CSDCallStateController *)self callContainer];
            long long v17 = [v16 audioAndVideoCallsWithStatus:1];

            if ([v17 count]) {
              [v15 addObjectsFromArray:v17];
            }
            id v41 = v7;
            char v18 = [(CSDCallStateController *)self callContainer];
            __int16 v19 = [v18 audioAndVideoCallsWithStatus:2];

            if ([v19 count]) {
              [v14 addObjectsFromArray:v19];
            }
            long long v35 = v17;
            id v39 = v11;
            BOOL v20 = [(CSDCallStateController *)self callContainer];
            id v21 = [v20 audioAndVideoCallsWithStatus:3];

            if ([v21 count]) {
              [v14 addObjectsFromArray:v21];
            }
            long long v34 = v19;
            long long v40 = v9;
            [v14 removeObject:v6];
            id v42 = v6;
            [v15 removeObject:v6];
            long long v22 = objc_alloc_init(CSDCallDataSourceMap);
            long long v37 = v14;
            [(CSDCallDataSourceMap *)v22 addCalls:v14 forIdentifier:@"callsToDisconnect"];
            long long v36 = v15;
            [(CSDCallDataSourceMap *)v22 addCalls:v15 forIdentifier:@"callsToHold"];
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v23 = [(CSDCallDataSourceMap *)v22 dataSources];
            id v24 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = *(void *)v45;
              do
              {
                for (i = 0; i != v25; i = (char *)i + 1)
                {
                  if (*(void *)v45 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  unsigned int v28 = *(NSObject **)(*((void *)&v44 + 1) + 8 * i);
                  if (v28 != v43)
                  {
                    id v29 = [(CSDCallDataSourceMap *)v22 callsForDataSource:*(void *)(*((void *)&v44 + 1) + 8 * i) identifier:@"callsToDisconnect"];
                    id v30 = [(CSDCallDataSourceMap *)v22 callsForDataSource:v28 identifier:@"callsToHold"];
                    [v28 disconnectCalls:v29 whileHoldingCalls:v30 andUnholdingCalls:&__NSArray0__struct andUngroupingCalls:&__NSArray0__struct];
                  }
                }
                id v25 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
              }
              while (v25);
            }

            long long v31 = [(CSDCallDataSourceMap *)v22 callsForDataSource:v43 identifier:@"callsToDisconnect"];
            long long v32 = [(CSDCallDataSourceMap *)v22 callsForDataSource:v43 identifier:@"callsToHold"];
            id v7 = v41;
            id v6 = v42;
            [v43 answerCall:v42 withRequest:v41 whileDisconnectingHeldCalls:v31 andHoldingCalls:v32];

            id v11 = v39;
            unsigned __int8 v9 = v40;
            long long v33 = v37;
            uint64_t v13 = v38;
          }
          else
          {
            long long v33 = sub_100008DCC();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              sub_1003AD7AC();
            }
          }
        }
        else
        {
          long long v43 = sub_100008DCC();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            sub_1003AD814();
          }
        }
      }
      else
      {
        long long v43 = sub_100008DCC();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_1003AD744();
        }
      }
    }
    else
    {
      uint64_t v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1003AD710();
      }
    }
  }
  else
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AD6DC();
    }
  }
}

- (void)performHoldActiveAndAnswerCall:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v50 = v6;
    __int16 v51 = 2112;
    id v52 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing hold active calls and answer ringing call %@ for answer request %@", buf, 0x16u);
  }

  unsigned __int8 v9 = [v7 uniqueProxyIdentifier];
  if ([v9 length])
  {
    id v10 = [(CSDCallStateController *)self callContainer];
    id v11 = [v10 audioAndVideoCallsWithStatus:4];

    if ([v11 count])
    {
      unsigned int v12 = [(CSDCallStateController *)self callWithUniqueProxyIdentifier:v9 fromCallsToAnswer:v11];
      uint64_t v13 = v12;
      if (v12)
      {
        if ([v12 isEqualToCall:v6])
        {
          long long v14 = [v6 dataSource];
          if (v14)
          {
            id v38 = v13;
            id v39 = v11;
            long long v40 = v9;
            long long v43 = v7;
            id v15 = objc_alloc_init((Class)NSMutableArray);
            unsigned __int8 v16 = [(CSDCallStateController *)self callContainer];
            long long v17 = [v16 audioAndVideoCallsWithStatus:1];

            id v42 = v17;
            if ([v17 count])
            {
              char v18 = [v17 lastObject];
              if (v18)
              {
                __int16 v19 = +[TUAudioSystemController sharedAudioSystemController];
                BOOL v20 = [v18 audioCategory];
                id v21 = [v18 audioMode];
                long long v22 = [v19 currentlyPickedRouteIdForCategory:v20 andMode:v21];

                if (v22)
                {
                  id v23 = [v43 sourceIdentifier];

                  if (!v23)
                  {
                    id v24 = +[TUAudioSystemController sourceIdentifierForRouteID:v22];
                    [v43 setSourceIdentifier:v24];

                    id v25 = sub_100008DCC();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v26 = [v43 sourceIdentifier];
                      *(_DWORD *)buf = 138412290;
                      id v50 = v26;
                      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Changed sourceIdentifier of answerRequest to %@", buf, 0xCu);
                    }
                  }
                }

                long long v17 = v42;
              }
              [v15 addObjectsFromArray:v17];
            }
            id v41 = v6;
            [v15 removeObject:v6];
            uint64_t v27 = objc_alloc_init(CSDCallDataSourceMap);
            long long v37 = v15;
            [(CSDCallDataSourceMap *)v27 addCalls:v15 forIdentifier:@"callsToHold"];
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            unsigned int v28 = [(CSDCallDataSourceMap *)v27 dataSources];
            id v29 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
            if (v29)
            {
              id v30 = v29;
              uint64_t v31 = *(void *)v45;
              do
              {
                for (i = 0; i != v30; i = (char *)i + 1)
                {
                  if (*(void *)v45 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  long long v33 = *(NSObject **)(*((void *)&v44 + 1) + 8 * i);
                  if (v33 != v14)
                  {
                    long long v34 = [(CSDCallDataSourceMap *)v27 callsForDataSource:*(void *)(*((void *)&v44 + 1) + 8 * i) identifier:@"callsToHold"];
                    [v33 holdCalls:v34 whileUnholdingCalls:&__NSArray0__struct];
                  }
                }
                id v30 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
              }
              while (v30);
            }

            long long v35 = [(CSDCallDataSourceMap *)v27 callsForDataSource:v14 identifier:@"callsToHold"];
            id v6 = v41;
            id v7 = v43;
            [v14 answerCall:v41 withRequest:v43 whileHoldingActiveCalls:v35];

            id v11 = v39;
            unsigned __int8 v9 = v40;
            long long v36 = v37;
            uint64_t v13 = v38;
          }
          else
          {
            long long v36 = sub_100008DCC();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              sub_1003AD94C();
            }
          }
        }
        else
        {
          long long v14 = sub_100008DCC();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1003AD9B4();
          }
        }
      }
      else
      {
        long long v14 = sub_100008DCC();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1003AD8E4();
        }
      }
    }
    else
    {
      uint64_t v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1003AD8B0();
      }
    }
  }
  else
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AD87C();
    }
  }
}

- (void)performAnswerCallAsVideoUpgrade:(id)a3 withRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 dataSource];
  [v7 answerCall:v6 withRequest:v5 whileDisconnectingActiveCalls:&__NSArray0__struct];
}

- (void)performAnswerCallAsAudioDowngrade:(id)a3 withRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 dataSource];
  [v7 answerCall:v6 withRequest:v5 whileDisconnectingActiveCalls:&__NSArray0__struct];
}

- (void)performDisconnectCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CSDCallStateController *)self callContainer];
    id v7 = [v6 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    unsigned int v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  uint64_t v8 = +[NSMutableArray array];
  unsigned __int8 v9 = [v4 callGroupUUID];

  if (v9)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [(CSDCallStateController *)self callContainer];
    id v11 = [v10 currentCalls];

    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v22 + 1) + 8 * (void)v15);
          if (v16 != v4)
          {
            long long v17 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v15) callGroupUUID];
            char v18 = [v4 callGroupUUID];
            unsigned int v19 = [v17 isEqual:v18];

            if (v19) {
              [v8 addObject:v16];
            }
          }
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
  if ([v8 count] == (id)1)
  {
    BOOL v20 = [v4 dataSource];
    id v21 = [v8 firstObject];
    [v20 disconnectCall:v4 whileUngroupingCall:v21];
  }
  else
  {
    [v4 disconnectCallWithReason:41];
  }
}

- (void)performDisconnectCurrentCallAndActivateHeld
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CSDCallStateController *)self callContainer];
    id v5 = [v4 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    id v76 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  v56 = objc_alloc_init(CSDCallDataSourceMap);
  id v6 = [(CSDCallStateController *)self callContainer];
  id v7 = [v6 audioAndVideoCallsWithStatus:3];

  uint64_t v8 = [(CSDCallStateController *)self callContainer];
  unsigned __int8 v9 = [v8 audioAndVideoCallsWithStatus:1];

  id v10 = [(CSDCallStateController *)self callContainer];
  id v11 = [v10 audioAndVideoCallsWithStatus:2];

  id v12 = [(CSDCallStateController *)self callContainer];
  id v13 = [v12 audioAndVideoCallsWithStatus:4];

  v57 = +[NSMutableSet set];
  v58 = +[NSMutableSet set];
  __int16 v51 = v7;
  if (![v7 count])
  {
    if (![v9 count])
    {
      if (![v11 count]) {
        goto LABEL_25;
      }
      char v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v76 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "   ... no sending or active calls were found so adding all held calls to list of calls to disconnect: %@", buf, 0xCu);
      }

      unsigned int v19 = v57;
      goto LABEL_24;
    }
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v76 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "   ... no sending calls were found so adding all active calls to list of calls to disconnect: %@", buf, 0xCu);
    }

    [v57 addObjectsFromArray:v9];
    long long v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v76 = v11;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "   ... and adding held calls to the list of calls to unhold: %@", buf, 0xCu);
    }
LABEL_23:

    unsigned int v19 = v58;
LABEL_24:
    [v19 addObjectsFromArray:v11];
    goto LABEL_25;
  }
  uint64_t v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v76 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "   ... sending calls were found so adding them to list of calls to disconnect: %@", buf, 0xCu);
  }

  [v57 addObjectsFromArray:v7];
  if (![v9 count] && !objc_msgSend(v13, "count"))
  {
    long long v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v76 = v11;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  id v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v76 = v9;
    __int16 v77 = 2112;
    v78 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "   ... and not unholding held calls because there are active calls %@ or ringing calls %@", buf, 0x16u);
  }

LABEL_25:
  id v48 = v13;
  v49 = v11;
  id v50 = v9;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = [v57 copy];
  id v20 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v69;
    uint64_t v52 = *(void *)v69;
    do
    {
      long long v23 = 0;
      id v53 = v21;
      do
      {
        if (*(void *)v69 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v24 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v23);
        long long v25 = [v24 model];
        unsigned __int8 v26 = [v25 supportsUnambiguousMultiPartyState];

        if ((v26 & 1) == 0)
        {
          v55 = v23;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v59 = [v58 copy];
          id v27 = [v59 countByEnumeratingWithState:&v64 objects:v73 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v65;
            do
            {
              for (i = 0; i != v28; i = (char *)i + 1)
              {
                if (*(void *)v65 != v29) {
                  objc_enumerationMutation(v59);
                }
                uint64_t v31 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                long long v32 = [v31 provider];
                long long v33 = [v32 identifier];
                long long v34 = [v24 provider];
                long long v35 = [v34 identifier];
                unsigned int v36 = [v33 isEqualToString:v35];

                if (v36)
                {
                  long long v37 = sub_100008DCC();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v76 = v31;
                    __int16 v77 = 2112;
                    v78 = v24;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "   ... and moving call %@ from call to unhold to call to disconnect because a disconnected call from the same provider doesn't support unambiguous multi-party state: %@", buf, 0x16u);
                  }

                  [v57 addObject:v31];
                  [v58 removeObject:v31];
                }
              }
              id v28 = [v59 countByEnumeratingWithState:&v64 objects:v73 count:16];
            }
            while (v28);
          }

          uint64_t v22 = v52;
          id v21 = v53;
          long long v23 = v55;
        }
        long long v23 = (char *)v23 + 1;
      }
      while (v23 != v21);
      id v21 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v21);
  }

  id v38 = [v57 allObjects];
  [(CSDCallDataSourceMap *)v56 addCalls:v38 forIdentifier:@"callsToDisconnect"];

  id v39 = [v58 allObjects];
  [(CSDCallDataSourceMap *)v56 addCalls:v39 forIdentifier:@"callsToUnhold"];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v40 = [(CSDCallDataSourceMap *)v56 dataSources];
  id v41 = [v40 countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v61;
    do
    {
      for (j = 0; j != v42; j = (char *)j + 1)
      {
        if (*(void *)v61 != v43) {
          objc_enumerationMutation(v40);
        }
        long long v45 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        long long v46 = [(CSDCallDataSourceMap *)v56 callsForDataSource:v45 identifier:@"callsToDisconnect"];
        long long v47 = [(CSDCallDataSourceMap *)v56 callsForDataSource:v45 identifier:@"callsToUnhold"];
        [v45 disconnectCalls:v46 whileHoldingCalls:&__NSArray0__struct andUnholdingCalls:v47 andUngroupingCalls:&__NSArray0__struct];
      }
      id v42 = [v40 countByEnumeratingWithState:&v60 objects:v72 count:16];
    }
    while (v42);
  }
}

- (void)performDisconnectAllCallsWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CSDCallStateController *)self callContainer];
    id v7 = [v6 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    long long v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  uint64_t v8 = objc_alloc_init(CSDCallDataSourceMap);
  unsigned __int8 v9 = [(CSDCallStateController *)self callContainer];
  id v10 = [v9 currentAudioAndVideoCalls];

  [(CSDCallDataSourceMap *)v8 addCalls:v10 forIdentifier:@"callsToDisconnect"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [(CSDCallDataSourceMap *)v8 dataSources];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v17 = [(CSDCallDataSourceMap *)v8 callsForDataSource:v16 identifier:@"callsToDisconnect"];
        [v16 disconnectAllCalls:v17 withReason:v3];
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)performPullRelayingCallsFromClientAndUpdateEndpoint:(BOOL)a3 updateExpectedDestination:(BOOL)a4
{
}

- (void)performPullRelayingCallsFromClientAndUpdateEndpoint:(BOOL)a3 updateExpectedDestination:(BOOL)a4 onlyIfNeedsEndpointConversationRelaySupport:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  long long v40 = +[NSMutableArray array];
  if (!v5) {
    goto LABEL_21;
  }
  unsigned __int8 v9 = [(CSDCallStateController *)self featureFlags];
  unsigned int v10 = [v9 gftOnWatch];

  if (!v10) {
    goto LABEL_21;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v11 = [(CSDCallStateController *)self callContainer];
  id v12 = [v11 currentAudioAndVideoCalls];

  id v13 = [v12 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v47;
    *(void *)&long long v14 = 138412546;
    long long v39 = v14;
    id v41 = v12;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if (objc_msgSend(v18, "needsConversationOrVideoRelaySupport", v39))
        {
          long long v19 = [(CSDCallStateController *)self featureFlags];
          unsigned int v20 = [v19 gftOnWatch];

          if (v20)
          {
            long long v21 = [(CSDCallStateController *)self relayMessagingController];
            uint64_t v22 = [v18 uniqueProxyIdentifier];
            long long v23 = [v21 remoteDeviceForUPI:v22];

            long long v24 = sub_100008DCC();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v25 = [v23 canReceiveRelayedGFTCalls];
              *(_DWORD *)buf = v39;
              CFStringRef v26 = @"NO";
              if (v25) {
                CFStringRef v26 = @"YES";
              }
              uint64_t v52 = v23;
              __int16 v53 = 2112;
              CFStringRef v54 = v26;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Relay device %@ canReceiveRelayedCalls: %@", buf, 0x16u);
            }

            if (!v23 || ([v23 canReceiveRelayedGFTCalls] & 1) == 0)
            {
              id v27 = [v18 uniqueProxyIdentifier];
              [v40 addObject:v27];
            }
            id v12 = v41;
          }
        }
      }
      id v15 = [v12 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v15);
  }

  if (![v40 count])
  {
    id v30 = sub_100008DCC();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Not pulling calls since current calls either do not require GFT relay or all the endpoints support GFT relay", buf, 2u);
    }
  }
  else
  {
LABEL_21:
    id v28 = [(CSDCallStateController *)self relayMessagingController];
    [v28 sendPullRelayingCallsMessageToClientAndDisconnectCallsWithUPI:v40];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v29 = [(CSDCallStateController *)self callContainer];
    id v30 = [v29 currentAudioAndVideoCalls];

    id v31 = [v30 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v43;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
          [v35 setRelayClientTransport:0];
          if (v7) {
            [v35 setEndpointOnCurrentDevice:1];
          }
          if (v6) {
            [v35 setExpectedRelayClientDestination:0];
          }
          unsigned int v36 = [(CSDCallStateController *)self relayMessagingController];
          [v36 prepareToDisconnectMessagingConnectionForCall:v35];

          long long v37 = +[CSDRelayConferenceInterface sharedInstance];
          id v38 = [v35 uniqueProxyIdentifier];
          [v37 prepareToStopConferenceForIdentifier:v38];
        }
        id v32 = [v30 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v32);
    }
  }
}

- (void)performSendMMIOrUSSDCodeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self providerCallDataSource];
  [v5 sendMMIOrUSSDCodeWithRequest:v4];
}

- (void)performPlayDTMFToneForCall:(id)a3 key:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [v6 playRemoteDTMFToneForKey:v4];
  id v7 = [(CSDCallStateController *)self relayMessagingController];
  [v7 sendPlayDTMFToneForKeyMessageForCall:v6 DTMFKey:v4];
}

- (void)performSetTTYType:(int)a3 forCall:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(CSDCallStateController *)self callContainer];
    unsigned __int8 v9 = [v8 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  if (![v6 isHostedOnCurrentDevice]
    || ([v6 isEndpointOnCurrentDevice] & 1) == 0)
  {
    unsigned int v10 = [(CSDCallStateController *)self relayMessagingController];
    [v10 sendSetTTYTypeCallMessageForCall:v6 ttyType:v4];
  }
  if (v6)
  {
    id v11 = [(CSDCallStateController *)self providerCallDataSource];
    id v13 = v6;
    id v12 = +[NSArray arrayWithObjects:&v13 count:1];
    [v11 setTTYType:v4 forCalls:v12];
  }
}

- (void)performSetLiveVoicemailUnavailableReason:(int64_t)a3 forCall:(id)a4
{
  if (a4) {
    [a4 setLiveVoicemailUnavailableReason:a3];
  }
}

- (void)performSetUplinkMuted:(BOOL)a3 forCall:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(CSDCallStateController *)self callContainer];
    unsigned __int8 v9 = [v8 currentAudioAndVideoCalls];
    *(_DWORD *)buf = 138412290;
    long long v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }
  if (![v6 isHostedOnCurrentDevice]
    || ([v6 isEndpointOnCurrentDevice] & 1) == 0)
  {
    unsigned int v10 = [(CSDCallStateController *)self relayMessagingController];
    [v10 sendSetUplinkMutedCallMessageForCall:v6 uplinkMuted:v4];
  }
  id v11 = [v6 callGroupUUID];

  if (v11)
  {
    id v12 = [(CSDCallStateController *)self callContainer];
    id v13 = [v6 callGroupUUID];
    long long v14 = [v12 callsWithGroupUUID:v13];
  }
  else
  {
    id v16 = v6;
    long long v14 = +[NSArray arrayWithObjects:&v16 count:1];
  }
  id v15 = [v6 dataSource];
  [v15 setUplinkMuted:v4 forCalls:v14];
}

- (void)performPullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(CSDCallStateController *)self providerCallDataSource];
    [v8 pullCallWithHandoffActivityUserInfo:v6 completion:v7];
  }
  else
  {
    unsigned __int8 v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handoff context did not include any handoff payload. Assuming this is for a relay call", v10, 2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)performPushRelayingCallsToHostWithSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self relayMessagingController];
  [v5 sendPushRelayingCallsMessageToHostForSourceIdentifier:v4];
}

- (void)performPushHostedCallsToDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self callContainer];
  unsigned int v6 = [v5 allCallsPassTest:&stru_100508948];

  if (v6)
  {
    id v7 = [(CSDCallStateController *)self callContainer];
    uint64_t v8 = [v7 callsWithAnEndpointElsewhere];
    id v9 = [v8 count];

    if (v9) {
      [(CSDCallStateController *)self performPullRelayingCallsFromClientAndUpdateEndpoint:0 updateExpectedDestination:1];
    }
    unsigned int v10 = [(CSDCallStateController *)self relayMessagingController];
    [v10 sendPushCallsMessageToClientDestination:v4];
  }
  else
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(CSDCallStateController *)self callContainer];
      id v13 = [v12 _allCalls];
      int v14 = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      long long v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to performPushHostedCallsToDestination %@ because not all calls are hosted here and relayable. All calls: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)performPullHostedCallsFromPairedHostDevice
{
  uint64_t v3 = +[CSDRelayIDSService sharedInstance];
  unsigned int v4 = [v3 pairedDeviceExists];

  if (v4)
  {
    id v5 = [(CSDCallStateController *)self callContainer];
    unsigned int v6 = [v5 allCallsPassTest:&stru_100508968];

    if (v6)
    {
      id v11 = [(CSDCallStateController *)self relayMessagingController];
      [v11 sendPullCallsMessageToHost];
    }
    else
    {
      uint64_t v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(CSDCallStateController *)self callContainer];
        unsigned int v10 = [v9 _allCalls];
        *(_DWORD *)buf = 138412290;
        id v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to performPullHostedCallsFromPairedHostDevice because not all calls are not hosted here and not an endpoint here and relayable. All calls: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to performPullHostedCallsFromPairedHostDevice because no paired device exists", buf, 2u);
    }
  }
}

- (void)performUpdateCallWithProxy:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self callContainer];
  unsigned int v6 = [v4 uniqueProxyIdentifier];
  id v7 = [v5 callWithUniqueProxyIdentifier:v6];

  [v7 updateWithProxyCall:v4];
}

- (void)_handleMessagingConnectionEndForCalls:(id)a3 withDisconnectedReason:(int)a4 didStartConnecting:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v22;
    *(void *)&long long v10 = 67109378;
    long long v20 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v8);
        }
        int v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unsigned __int8 v15 = objc_msgSend(v14, "isOutgoing", v20);
        __int16 v16 = sub_100008DCC();
        long long v17 = v16;
        if ((v15 & 1) != 0 || v5)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            unsigned int v26 = v6;
            __int16 v27 = 2112;
            v28[0] = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Disconnecting call with disconnected reason %d: %@", buf, 0x12u);
          }

          long long v19 = [(CSDCallStateController *)self callCenter];
          [v19 disconnectCall:v14 withReason:v6];
          goto LABEL_15;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v18 = [v14 isOutgoing];
          *(_DWORD *)buf = 67109634;
          unsigned int v26 = v18;
          __int16 v27 = 1024;
          LODWORD(v28[0]) = 0;
          WORD2(v28[0]) = 2112;
          *(void *)((char *)v28 + 6) = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Disconnecting call normally since it was outgoing (%d) or was never connecting to relay (%d): %@", buf, 0x18u);
        }

        if ([v14 isHostedOnCurrentDevice])
        {
          long long v19 = [(CSDCallStateController *)self callCenter];
          [v19 disconnectCall:v14];
LABEL_15:

          continue;
        }
        [v14 setLocallyDisconnectedWithReasonIfNone:0];
      }
      id v11 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v11);
  }
}

- (void)_launchICSForScreeningIfNeeded
{
  unsigned int v2 = +[CLFSystemShellSwitcher sharedSystemShellSwitcher];
  unsigned int v3 = [v2 isClarityBoardEnabled];

  if (v3)
  {
    id v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ClarityBoard is enabled. Do not launch ICS for screening", buf, 2u);
    }
  }
  else
  {
    BOOL v5 = +[NSURL faceTimeLaunchForScreeningURL];
    id v4 = v5;
    TUOpenURLWithCompletion();
  }
}

- (void)fetchCurrentCallUpdates:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "fetchCurrentCallUpdates", buf, 2u);
  }

  uint64_t v6 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [(CSDCallStateController *)self pendingCallInfoDict];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10015E150;
  int v14 = &unk_100508990;
  unsigned __int8 v15 = self;
  id v16 = v7;
  id v9 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:&v11];

  id v10 = objc_msgSend(v9, "copy", v11, v12, v13, v14, v15);
  v4[2](v4, v10);
}

- (void)screenWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "screenWithRequest", buf, 2u);
  }

  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10015E364;
  v10[3] = &unk_100504F10;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  sub_1000085AC(v8, @"screen-calls", v10, 0, (uint64_t)"-[CSDCallStateController screenWithRequest:]");
}

- (void)performRecordingRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to perform recording request %@", buf, 0xCu);
  }

  id v9 = [(CSDCallStateController *)self clientManager];
  id v10 = [v9 currentClient];

  id v11 = (void *)TUEntitlementsRecordCalls;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10015E830;
  v16[3] = &unk_100505EA0;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10015E948;
  v14[3] = &unk_100505738;
  id v15 = v18;
  id v12 = v18;
  id v13 = v6;
  sub_1000085AC(v10, v11, v16, v14, (uint64_t)"-[CSDCallStateController performRecordingRequest:completion:]");
}

- (void)registerAnonymousXPCEndpoint:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "registerAnonymousXPCEndpoint", buf, 2u);
  }

  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015EA98;
  v11[3] = &unk_100504F10;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController registerAnonymousXPCEndpoint:]");
}

- (void)fetchAnonymousXPCEndpoint:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetchAnonymousXPCEndpoint", v8, 2u);
  }

  id v7 = [(CSDCallStateController *)self uiXPCEndpoint];
  v4[2](v4, v7, 0);
}

- (void)screenUpdate:(id)a3 withProvider:(id)a4 callSource:(id)a5 callUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  int v14 = [(CSDCallStateController *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "screenUpdate for callUpdate: %@", (uint8_t *)&v18, 0xCu);
  }

  id v16 = [[CSDPendingCallInfo alloc] initWithCallSource:v12 withCallUpdate:v10 withProvider:v13 callUUID:v11];
  id v17 = [(CSDCallStateController *)self pendingCallInfoDict];
  [v17 setObject:v16 forKeyedSubscript:v11];

  [(CSDCallStateController *)self _launchICSForScreeningIfNeeded];
}

- (void)dialWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self clientManager];
  id v9 = [v8 currentClient];

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10015EFC8;
  v17[3] = &unk_100507BA8;
  id v18 = v6;
  id v19 = self;
  id v21 = v7;
  id v20 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10015F184;
  v14[3] = &unk_1005070F8;
  id v15 = v20;
  id v16 = v21;
  void v14[4] = self;
  id v11 = v20;
  id v12 = v21;
  id v13 = v6;
  sub_1000085AC(v11, v10, v17, v14, (uint64_t)"-[CSDCallStateController dialWithRequest:reply:]");
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self clientManager];
  id v9 = [v8 currentClient];

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10015F2F8;
  v13[3] = &unk_100504FE0;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  sub_1000085AC(v9, v10, v13, 0, (uint64_t)"-[CSDCallStateController dialWithRequest:displayContext:]");
}

- (void)_dial:(id)a3 displayContext:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = [(CSDCallStateController *)self performDialCall:a3 displayContext:a4];
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dialed call: %@", (uint8_t *)&v11, 0xCu);
  }

  if (v8) {
    v8[2](v8, v9);
  }
}

- (void)answerCallWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (__CFString *)TUEntitlementsModifyCallsCapability;
  if ([v4 sendToScreening])
  {
    id v8 = @"screen-calls";

    id v7 = v8;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10015F5CC;
  v10[3] = &unk_100504F10;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  sub_1000085AC(v6, v7, v10, 0, (uint64_t)"-[CSDCallStateController answerCallWithRequest:]");
}

- (void)holdCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10015F920;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController holdCallWithUniqueProxyIdentifier:]");
}

- (void)unholdCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10015FB90;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController unholdCallWithUniqueProxyIdentifier:]");
}

- (void)requestVideoUpgradeForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10015FE00;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController requestVideoUpgradeForCallWithUniqueProxyIdentifier:]");
}

- (void)disconnectCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10016024C;
  v10[3] = &unk_100504FE0;
  id v11 = v4;
  id v12 = v6;
  id v13 = self;
  id v8 = v6;
  id v9 = v4;
  sub_1000085AC(v8, v7, v10, 0, (uint64_t)"-[CSDCallStateController disconnectCallWithUniqueProxyIdentifier:]");
}

- (void)groupCallWithUniqueProxyIdentifier:(id)a3 withOtherCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self clientManager];
  id v9 = [v8 currentClient];

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001604F8;
  v13[3] = &unk_100504FE0;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  sub_1000085AC(v9, v10, v13, 0, (uint64_t)"-[CSDCallStateController groupCallWithUniqueProxyIdentifier:withOtherCallWithUniqueProxyIdentifier:]");
}

- (void)ungroupCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100160818;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController ungroupCallWithUniqueProxyIdentifier:]");
}

- (void)swapCalls
{
  unsigned int v3 = [(CSDCallStateController *)self clientManager];
  id v4 = [v3 currentClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100160A48;
  v5[3] = &unk_100504EC0;
  v5[4] = self;
  sub_1000085AC(v4, TUEntitlementsModifyCallsCapability, v5, 0, (uint64_t)"-[CSDCallStateController swapCalls]");
}

- (void)playDTMFToneForCallWithUniqueProxyIdentifier:(id)a3 key:(unsigned __int8)a4
{
  id v6 = a3;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100160BAC;
  v11[3] = &unk_1005050D0;
  unsigned __int8 v14 = a4;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController playDTMFToneForCallWithUniqueProxyIdentifier:key:]");
}

- (void)disconnectCurrentCallAndActivateHeld
{
  unsigned int v3 = [(CSDCallStateController *)self clientManager];
  id v4 = [v3 currentClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100160DF0;
  v5[3] = &unk_100504EC0;
  v5[4] = self;
  sub_1000085AC(v4, TUEntitlementsModifyCallsCapability, v5, 0, (uint64_t)"-[CSDCallStateController disconnectCurrentCallAndActivateHeld]");
}

- (void)disconnectAllCalls
{
  unsigned int v3 = [(CSDCallStateController *)self clientManager];
  id v4 = [v3 currentClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100160F20;
  v5[3] = &unk_100504EC0;
  v5[4] = self;
  sub_1000085AC(v4, TUEntitlementsModifyCallsCapability, v5, 0, (uint64_t)"-[CSDCallStateController disconnectAllCalls]");
}

- (void)setTTYType:(int)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100161088;
  v11[3] = &unk_100507B08;
  int v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setTTYType:forCallWithUniqueProxyIdentifier:]");
}

- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100161270;
  v11[3] = &unk_1005050A8;
  id v13 = self;
  int64_t v14 = a3;
  id v12 = v6;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setLiveVoicemailUnavailableReason:forCallWithUniqueProxyIdentifier:]");
}

- (void)pullRelayingCallsFromClient
{
  unsigned int v3 = [(CSDCallStateController *)self clientManager];
  id v4 = [v3 currentClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016142C;
  v5[3] = &unk_100504EC0;
  v5[4] = self;
  sub_1000085AC(v4, TUEntitlementsModifyCallsCapability, v5, 0, (uint64_t)"-[CSDCallStateController pullRelayingCallsFromClient]");
}

- (void)pullRelayingGFTCallsFromClientIfNecessary
{
  unsigned int v3 = [(CSDCallStateController *)self clientManager];
  id v4 = [v3 currentClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100161564;
  v5[3] = &unk_100504EC0;
  v5[4] = self;
  sub_1000085AC(v4, TUEntitlementsModifyCallsCapability, v5, 0, (uint64_t)"-[CSDCallStateController pullRelayingGFTCallsFromClientIfNecessary]");
}

- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001616C4;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController pushRelayingCallsToHostWithSourceIdentifier:]");
}

- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self clientManager];
  id v9 = [v8 currentClient];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100161944;
  v22[3] = &unk_1005089B8;
  id v23 = v9;
  id v24 = v7;
  v22[4] = self;
  id v10 = v9;
  id v11 = v7;
  id v12 = objc_retainBlock(v22);
  id v13 = (void *)TUEntitlementsModifyCallsCapability;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001619C8;
  v18[3] = &unk_100505EA0;
  id v19 = v6;
  id v20 = self;
  id v21 = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100161A7C;
  v16[3] = &unk_100505738;
  id v17 = v21;
  int64_t v14 = v21;
  id v15 = v6;
  sub_1000085AC(v10, v13, v18, v16, (uint64_t)"-[CSDCallStateController pullCallFromClientUsingHandoffActivityUserInfo:reply:]");
}

- (void)pullPersistedChannel:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CSDPersistedChannelRegistry sharedInstance];
  id v6 = [v5 activePersistedChannelIdentity];

  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];
  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100161BB0;
  v12[3] = &unk_100507120;
  id v13 = v6;
  id v14 = v4;
  id v10 = v6;
  id v11 = v4;
  sub_1000085AC(v8, v9, v12, 0, (uint64_t)"-[CSDCallStateController pullPersistedChannel:]");
}

- (void)startTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CSDCallStateController *)self callContainer];
  id v8 = [v6 uniqueProxyIdentifier];

  id v9 = [v7 bargeCallWithUniqueProxyIdentifier:v8];

  if (v9)
  {
    if (v4) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 4;
    }
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending start transmission request to barge call.", v12, 2u);
    }

    [v9 startTransmissionWithOriginator:v10];
  }
}

- (void)stopTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CSDCallStateController *)self callContainer];
  id v8 = [v6 uniqueProxyIdentifier];

  id v9 = [v7 bargeCallWithUniqueProxyIdentifier:v8];

  if (v9)
  {
    if (v4) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 4;
    }
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending stop transmission request to barge call", v12, 2u);
    }

    [v9 stopTransmissionWithOriginator:v10];
  }
}

- (void)sendMMIOrUSSDCodeWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100161EF0;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController sendMMIOrUSSDCodeWithRequest:]");
}

- (void)setUplinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100162090;
  v11[3] = &unk_1005050D0;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setUplinkMuted:forCallWithUniqueProxyIdentifier:]");
}

- (void)setDownlinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100162308;
  v11[3] = &unk_1005050D0;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setDownlinkMuted:forCallWithUniqueProxyIdentifier:]");
}

- (void)setIsSendingVideo:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10016257C;
  v11[3] = &unk_1005050D0;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setIsSendingVideo:forCallWithUniqueProxyIdentifier:]");
}

- (void)setMixesVoiceWithMedia:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100162830;
  v11[3] = &unk_1005050D0;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setMixesVoiceWithMedia:forCallWithUniqueProxyIdentifier:]");
}

- (void)setSharingScreen:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100162AA4;
  v11[3] = &unk_1005050D0;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setSharingScreen:forCallWithUniqueProxyIdentifier:]");
}

- (void)setHasEmergencyVideoStream:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100162D18;
  v11[3] = &unk_1005050D0;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setHasEmergencyVideoStream:forCallWithUniqueProxyIdentifier:]");
}

- (void)setEmergencyMediaItems:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self clientManager];
  id v9 = [v8 currentClient];

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100162FA8;
  v13[3] = &unk_100504FE0;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  sub_1000085AC(v9, v10, v13, 0, (uint64_t)"-[CSDCallStateController setEmergencyMediaItems:forCallWithUniqueProxyIdentifier:]");
}

- (void)pushHostedCallsToDestination:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100163214;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController pushHostedCallsToDestination:]");
}

- (void)pullHostedCallsFromPairedHostDevice
{
  unsigned int v3 = [(CSDCallStateController *)self clientManager];
  id v4 = [v3 currentClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100163380;
  v5[3] = &unk_100504EC0;
  v5[4] = self;
  sub_1000085AC(v4, TUEntitlementsModifyCallsCapability, v5, 0, (uint64_t)"-[CSDCallStateController pullHostedCallsFromPairedHostDevice]");
}

- (void)sendHardPauseDigitsForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001634D4;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController sendHardPauseDigitsForCallWithUniqueProxyIdentifier:]");
}

- (void)updateCallWithProxy:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016368C;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController updateCallWithProxy:]");
}

- (void)enteredForegroundForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016381C;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController enteredForegroundForCallWithUniqueProxyIdentifier:]");
}

- (void)willEnterBackgroundForAllCalls
{
  unsigned int v2 = [(CSDCallStateController *)self clientManager];
  id v3 = [v2 currentClient];

  sub_1000085AC(v3, TUEntitlementsModifyCallsCapability, &stru_1005089D8, 0, (uint64_t)"-[CSDCallStateController willEnterBackgroundForAllCalls]");
}

- (void)enteredBackgroundForAllCalls
{
  unsigned int v2 = [(CSDCallStateController *)self clientManager];
  id v3 = [v2 currentClient];

  sub_1000085AC(v3, TUEntitlementsModifyCallsCapability, &stru_1005089F8, 0, (uint64_t)"-[CSDCallStateController enteredBackgroundForAllCalls]");
}

- (void)setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  id v8 = [(CSDCallStateController *)self clientManager];
  id v9 = [v8 currentClient];

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100163C3C;
  v12[3] = &unk_100507F18;
  CGFloat v15 = width;
  CGFloat v16 = height;
  id v13 = v7;
  id v14 = self;
  id v11 = v7;
  sub_1000085AC(v9, v10, v12, 0, (uint64_t)"-[CSDCallStateController setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:size:]");
}

- (void)setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:(id)a3 presentationState:(int)a4
{
  id v6 = a3;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100163E30;
  v11[3] = &unk_100507B08;
  int v14 = a4;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:presentationState:]");
}

- (void)setScreenShareAttributesForCallWithUniqueProxyIdentifier:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self clientManager];
  id v9 = [v8 currentClient];

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100164030;
  v13[3] = &unk_100504FE0;
  id v14 = v7;
  id v15 = v6;
  CGFloat v16 = self;
  id v11 = v6;
  id v12 = v7;
  sub_1000085AC(v9, v10, v13, 0, (uint64_t)"-[CSDCallStateController setScreenShareAttributesForCallWithUniqueProxyIdentifier:attributes:]");
}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4 forCallWithUniqueProxyIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDCallStateController *)self clientManager];
  id v11 = [v10 currentClient];

  id v12 = (void *)TUEntitlementsModifyCallsCapability;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100164234;
  v15[3] = &unk_100506C18;
  BOOL v19 = a3;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v13 = v9;
  id v14 = v8;
  sub_1000085AC(v11, v12, v15, 0, (uint64_t)"-[CSDCallStateController setSharingScreen:attributes:forCallWithUniqueProxyIdentifier:]");
}

- (void)setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:(id)a3 bluetoothAudioFormat:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100164424;
  v11[3] = &unk_1005050A8;
  id v13 = self;
  int64_t v14 = a4;
  id v12 = v6;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:bluetoothAudioFormat:]");
}

- (void)shouldSuppressInCallStatusBar:(BOOL)a3
{
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016462C;
  v7[3] = &unk_100505030;
  BOOL v8 = a3;
  void v7[4] = self;
  sub_1000085AC(v6, @"modify-status-bar", v7, 0, (uint64_t)"-[CSDCallStateController shouldSuppressInCallStatusBar:]");
}

- (void)shouldAllowRingingCallStatusIndicator:(BOOL)a3
{
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016485C;
  v7[3] = &unk_100505030;
  BOOL v8 = a3;
  void v7[4] = self;
  sub_1000085AC(v6, @"modify-status-bar", v7, 0, (uint64_t)"-[CSDCallStateController shouldAllowRingingCallStatusIndicator:]");
}

- (void)activateInCallUIWithActivityContinuationIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100164A9C;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController activateInCallUIWithActivityContinuationIdentifier:]");
}

- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSDCallStateController: sendUserScoreToRTCReporting with UUID: %@ and Score: %d", (uint8_t *)&v8, 0x12u);
  }

  id v7 = +[CSDReportingController sharedInstance];
  [v7 sendUserScoreToRTCReporting:v5 withScore:v4];
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001650C4;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  int v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController joinConversationWithRequest:]");
}

- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016525C;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  int v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController setCurrentAudioInputDeviceToDeviceWithUID:]");
}

- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100165418;
  v9[3] = &unk_100504F10;
  id v10 = v4;
  int v11 = self;
  id v8 = v4;
  sub_1000085AC(v6, v7, v9, 0, (uint64_t)"-[CSDCallStateController setCurrentAudioOutputDeviceToDeviceWithUID:]");
}

- (void)localRoutesByUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001655D4;
  v8[3] = &unk_100507120;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_1000085AC(v6, @"access-calls", v8, 0, (uint64_t)"-[CSDCallStateController localRoutesByUniqueIdentifier:]");
}

- (void)pairedHostDeviceRoutesByUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100165720;
  v8[3] = &unk_100507120;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_1000085AC(v6, @"access-calls", v8, 0, (uint64_t)"-[CSDCallStateController pairedHostDeviceRoutesByUniqueIdentifier:]");
}

- (void)pickLocalRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10016587C;
  v11[3] = &unk_1005050D0;
  id v12 = v6;
  id v13 = self;
  BOOL v14 = a4;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController pickLocalRouteWithUniqueIdentifier:shouldWaitUntilAvailable:]");
}

- (void)pickPairedHostDeviceRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(CSDCallStateController *)self clientManager];
  id v8 = [v7 currentClient];

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100165A34;
  v11[3] = &unk_1005050D0;
  id v12 = v6;
  id v13 = self;
  BOOL v14 = a4;
  id v10 = v6;
  sub_1000085AC(v8, v9, v11, 0, (uint64_t)"-[CSDCallStateController pickPairedHostDeviceRouteWithUniqueIdentifier:shouldWaitUntilAvailable:]");
}

- (void)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(CSDCallStateController *)self clientManager];
  BOOL v14 = [v13 currentClient];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100165C38;
  v18[3] = &unk_100508A70;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  BOOL v22 = a5;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  sub_1000085AC(v14, @"access-calls", v18, 0, (uint64_t)"-[CSDCallStateController containsRestrictedHandle:forBundleIdentifier:performSynchronously:reply:]");
}

- (void)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDCallStateController *)self clientManager];
  id v12 = [v11 currentClient];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100165DEC;
  v16[3] = &unk_100508A98;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  sub_1000085AC(v12, @"access-calls", v16, 0, (uint64_t)"-[CSDCallStateController policyForAddresses:forBundleIdentifier:reply:]");
}

- (void)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDCallStateController *)self clientManager];
  id v12 = [v11 currentClient];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100165F90;
  v16[3] = &unk_100508A98;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  sub_1000085AC(v12, @"access-calls", v16, 0, (uint64_t)"-[CSDCallStateController willRestrictAddresses:forBundleIdentifier:reply:]");
}

- (void)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(CSDCallStateController *)self clientManager];
  id v14 = [v13 currentClient];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10016616C;
  v18[3] = &unk_100508A70;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  BOOL v22 = a5;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  sub_1000085AC(v14, @"access-calls", v18, 0, (uint64_t)"-[CSDCallStateController shouldRestrictAddresses:forBundleIdentifier:performSynchronously:reply:]");
}

- (void)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CSDCallStateController *)self clientManager];
  id v15 = [v14 currentClient];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100166334;
  v20[3] = &unk_100508AC0;
  id v23 = v12;
  id v24 = v13;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v13;
  sub_1000085AC(v15, @"access-calls", v20, 0, (uint64_t)"-[CSDCallStateController isUnknownAddress:normalizedAddress:forBundleIdentifier:reply:]");
}

- (void)filterStatusForAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDCallStateController *)self clientManager];
  id v12 = [v11 currentClient];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001664E8;
  v16[3] = &unk_100508A98;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  sub_1000085AC(v12, @"access-calls", v16, 0, (uint64_t)"-[CSDCallStateController filterStatusForAddresses:forBundleIdentifier:reply:]");
}

- (void)setClientCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "clientCapabilities: %@", (uint8_t *)&v8, 0xCu);
  }

  [v6 setCapabilities:v4];
}

- (void)messagingConnectionEndedForCalls:(id)a3 didStartConnecting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Messaging connection ended for calls %@. Disconnecting calls that are an endpoint here but are not hosted here.", (uint8_t *)&v10, 0xCu);
  }

  int v8 = +[NSPredicate predicateWithBlock:&stru_100508B00];
  id v9 = [v6 filteredArrayUsingPredicate:v8];

  [(CSDCallStateController *)self _handleMessagingConnectionEndForCalls:v9 withDisconnectedReason:8 didStartConnecting:v4];
}

- (void)messagingConnectionFailedForCalls:(id)a3 didStartConnecting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1003ADC44();
  }

  int v8 = +[NSPredicate predicateWithBlock:&stru_100508B20];
  id v9 = [v6 filteredArrayUsingPredicate:v8];

  [(CSDCallStateController *)self _handleMessagingConnectionEndForCalls:v9 withDisconnectedReason:8 didStartConnecting:v4];
}

- (void)messagingConnectionCouldNotEstablishLinkForCalls:(id)a3 didStartConnecting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1003ADCAC();
  }

  int v8 = +[NSPredicate predicateWithBlock:&stru_100508B40];
  id v9 = [v6 filteredArrayUsingPredicate:v8];

  [(CSDCallStateController *)self _handleMessagingConnectionEndForCalls:v9 withDisconnectedReason:13 didStartConnecting:v4];
}

- (void)propertiesChangedForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self callController];
  [v5 registerCall:v4];
}

- (BOOL)multipleCallsActiveOrHeld
{
  unsigned int v2 = [(CSDCallStateController *)self callContainer];
  id v3 = [v2 countOfCallsPassingTest:&stru_100508B60];

  return (unint64_t)v3 > 1;
}

- (BOOL)isClientRecordingApplicationInstalled
{
  unsigned int v2 = [(CSDCallStateController *)self applicationInstallationObserver];
  id v3 = +[CSDCallRecordingController notesApplicationBundleID];
  unsigned __int8 v4 = [v2 isApplicationInstalledWithBundleID:v3];

  return v4;
}

- (id)currentProxyCalls
{
  unsigned int v2 = [(CSDCallStateController *)self callContainer];
  id v3 = [v2 _allCalls];

  unsigned __int8 v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = +[TUProxyCall proxyCallWithCall:](TUProxyCall, "proxyCallWithCall:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (id)callForClient:(id)a3 usingCall:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([v5 isRemote])
    {
      id v7 = +[TUProxyCall proxyCallWithCall:v6];
    }
    else
    {
      id v7 = v6;
    }
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)currentCallsForClient:(id)a3
{
  id v4 = a3;
  if ([v4 isRemote])
  {
    id v5 = [(CSDCallStateController *)self currentProxyCalls];
    [(CSDCallStateController *)self eligibleCallsByFilteringCalls:v5 forClient:v4];
  }
  else
  {
    id v5 = [(CSDCallStateController *)self callContainer];
    [v5 _allCalls];
  id v6 = };

  return v6;
}

- (BOOL)isTrackingVoIPCallForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(CSDCallStateController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100166EA0;
  block[3] = &unk_100505DC0;
  void block[4] = self;
  id v9 = v4;
  int v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)disconnectBargeCall:(id)a3 bundleIdentifier:(id)a4 reason:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [(CSDCallStateController *)self callContainer];
  uint64_t v11 = [v8 UUIDString];
  id v12 = [v10 bargeCallWithUniqueProxyIdentifier:v11];

  uint64_t v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 1024;
    int v26 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "disconnectBargeCall, callUUID: %@, bundleIdentifier: %@, reason: %d", buf, 0x1Cu);
  }

  char v14 = [v12 provider];
  long long v15 = [v14 bundleIdentifier];
  unsigned int v16 = [v15 isEqualToString:v9];

  if (v16)
  {
    id v17 = [(CSDCallStateController *)self queue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001671E0;
    v18[3] = &unk_100505080;
    id v19 = v12;
    int v20 = a5;
    dispatch_async(v17, v18);
  }
}

- (void)disconnectBargeCallsWithBundleIdentifier:(id)a3 reason:(int)a4
{
  id v6 = a3;
  id v7 = [(CSDCallStateController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001672AC;
  block[3] = &unk_100507B08;
  void block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)deactivatePTTBargeCalls
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking for active PushToTalk barge calls to deactivate.", buf, 2u);
  }

  id v4 = [(CSDCallStateController *)self callContainer];
  id v5 = [v4 bargeCallsPassingTest:&stru_100508B80];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v11, "deactivate", (void)v12);
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)requestInitialState:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CSDCallStateController *)self clientManager];
  id v6 = [v5 currentClient];

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting initial state for client %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(CSDCallStateController *)self currentCallsForClient:v6];
  v4[2](v4, v8);
}

- (void)reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "uniqueProxyIdentifier %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(CSDCallStateController *)self callContainer];
  id v7 = [v6 callWithUniqueProxyIdentifier:v4];

  if (v7)
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"CSDCallLocalPreviewStoppedNotification" object:v7];
  }
}

- (void)saveCustomSandboxedURLGreeting:(id)a3 forAccountUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "saveCustomGreeting", v11, 2u);
  }

  int v9 = [(CSDCallStateController *)self answeringMachineController];
  id v10 = [v7 URL];

  [v9 saveCustomGreeting:v10 for:v6];
}

- (void)deleteCustomGreetingForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleteCustomGreetingForAccountUUID", v7, 2u);
  }

  id v6 = [(CSDCallStateController *)self answeringMachineController];
  [v6 deleteCustomGreetingFor:v4];
}

- (void)customSandboxedURLGreetingForAccountUUID:(id)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "customGreetingForAccountUUID:withCompletion:", (uint8_t *)v12, 2u);
  }

  int v9 = [(CSDCallStateController *)self answeringMachineController];
  id v10 = [v9 customGreetingFor:v7];

  if (v10)
  {
    id v11 = [objc_alloc((Class)TUSandboxExtendedURL) initWithURL:v10 withExtensionType:0];
    v6[2](v6, v11);
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)defaultGreeting:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "defaultGreeting", (uint8_t *)v9, 2u);
  }

  id v6 = [(CSDCallStateController *)self answeringMachineController];
  id v7 = [v6 defaultGreeting];

  if (v7)
  {
    id v8 = [objc_alloc((Class)TUSandboxExtendedURL) initWithURL:v7 withExtensionType:0];
    v4[2](v4, v8);
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (void)callHistoryManager:(id)a3 recentCallRequestedFor:(id)a4 withStartDate:(id)a5 avMode:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = [(CSDCallStateController *)self recentsController];
  [v11 reportRecentCallForConversation:v10 withStartDate:v9 avMode:a6];
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self relayMessagingController];
  [v5 sendUpdateCallContextMessageToClientForCallProviderManager:v4];
}

- (void)didChangeRelayCallingCapabilities
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }

  [(CSDCallStateController *)self _handleRelayCallingChanged];
}

- (void)didChangeFaceTimeCallingAvailability
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }

  id v4 = [(CSDCallStateController *)self relayMessagingController];
  id v5 = [(CSDCallStateController *)self callProviderManager];
  [v4 sendUpdateCallContextMessageToClientForCallProviderManager:v5];
}

- (IMNicknameProvider)nicknameProvider
{
  id v3 = [(CSDCallStateController *)self featureFlags];
  unsigned int v4 = [v3 nameAndPhotoEnabled];

  if (v4)
  {
    nicknameProvider = self->_nicknameProvider;
    if (!nicknameProvider)
    {
      id v6 = (IMNicknameProvider *)objc_alloc_init((Class)IMNicknameProvider);
      id v7 = self->_nicknameProvider;
      self->_nicknameProvider = v6;

      nicknameProvider = self->_nicknameProvider;
    }
    id v8 = nicknameProvider;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fetchPreferredFaceTimeAccountID
{
  unsigned int v2 = +[IMService facetimeService];
  id v3 = IMPreferredAccountForService();

  unsigned int v4 = [v3 displayName];

  return v4;
}

+ (id)automaticNameAndPhotoQueue
{
  if (qword_10058C488 != -1) {
    dispatch_once(&qword_10058C488, &stru_100508BA0);
  }
  unsigned int v2 = (void *)qword_10058C480;

  return v2;
}

- (void)sendAutomaticNameAndPhotoUsingDialRequestIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self featureFlags];
  unsigned int v6 = [v5 nameAndPhotoEnabled];

  if (v6)
  {
    id v7 = [v4 handle];
    id v8 = TUNormalizedHandleForTUHandle();

    if (v8)
    {
      id v9 = +[CSDCallStateController automaticNameAndPhotoQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001680CC;
      block[3] = &unk_100504FE0;
      void block[4] = self;
      id v11 = v8;
      id v12 = v4;
      dispatch_async(v9, block);
    }
  }
}

- (void)sendAutomaticNameAndPhotoUsingJoinRequestIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self featureFlags];
  unsigned int v6 = [v5 nameAndPhotoEnabled];

  if (v6)
  {
    id v7 = +[CSDCallStateController automaticNameAndPhotoQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100168260;
    v8[3] = &unk_100504F10;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)sendNameAndPhotoUsingDialRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self featureFlags];
  unsigned int v6 = [v5 nameAndPhotoEnabled];

  if (v6)
  {
    id v7 = [v4 handle];
    id v8 = TUNormalizedHandleForTUHandle();

    if (v8)
    {
      id v9 = [v4 provider];
      unsigned int v10 = [v9 isTelephonyProvider];

      if (v10)
      {
        id v11 = [v4 localSenderIdentity];
        id v12 = sub_100008DCC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138412290;
          int v26 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SNAP: Using localSenderIdentity %@", (uint8_t *)&v25, 0xCu);
        }

        long long v13 = [v11 handle];
        long long v14 = [v13 normalizedValue];

        long long v15 = [v11 handle];
        unsigned int v16 = v15;
        if (v14)
        {
          id v17 = [v15 normalizedValue];
          id v18 = v16;
        }
        else
        {
          id v18 = TUNormalizedHandleForTUHandle();

          id v19 = sub_100008DCC();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 138412290;
            int v26 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SNAP: Normalized senderIdentity handle to be %@", (uint8_t *)&v25, 0xCu);
          }

          int v20 = [v18 normalizedValue];
          id v21 = v20;
          if (v20)
          {
            id v22 = v20;
          }
          else
          {
            id v22 = [v18 value];
          }
          id v17 = v22;
        }
      }
      else
      {
        id v17 = [(CSDCallStateController *)self fetchPreferredFaceTimeAccountID];
      }
      __int16 v23 = [v8 value];
      id v24 = +[NSSet setWithObject:v23];
      [(CSDCallStateController *)self sendNameAndPhotoToHandles:v24 fromID:v17];
    }
  }
}

- (void)sendNameAndPhotoUsingJoinRequest:(id)a3
{
  id v5 = [a3 sanitizedHandles];
  id v4 = [(CSDCallStateController *)self fetchPreferredFaceTimeAccountID];
  [(CSDCallStateController *)self sendNameAndPhotoToHandles:v5 fromID:v4];
}

- (void)sendNameAndPhotoToHandles:(id)a3 fromID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self featureFlags];
  unsigned int v9 = [v8 nameAndPhotoEnabled];

  if (v9)
  {
    unsigned int v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SNAP: Requesting to send Name+Photo to handles %@ fromID %@", buf, 0x16u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v15);
          id v17 = [(CSDCallStateController *)self nicknameProvider];
          [v17 sendPersonalNicknameToHandleID:v16 fromHandleID:v7];

          long long v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
  }
}

- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 callProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self featureFlags];
  unsigned int v9 = [v8 nameAndPhotoEnabled];

  if (v9) {
    BOOL v10 = -[CSDCallStateController shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:](self, "shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:", v6, [v7 isSystemProvider]);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 conversationProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallStateController *)self featureFlags];
  unsigned int v9 = [v8 nameAndPhotoEnabled];

  if (v9) {
    BOOL v10 = -[CSDCallStateController shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:](self, "shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:", v6, [v7 isDefaultProvider]);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 isDefaultProvider:(BOOL)a4
{
  BOOL v4 = a4;
  id v43 = a3;
  id v6 = [(CSDCallStateController *)self featureFlags];
  unsigned int v7 = [v6 nameAndPhotoEnabled];

  if (!v7) {
    goto LABEL_26;
  }
  if (![(CSDCallStateController *)self _nameAndPhotoSharingEnabled])
  {
    __int16 v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SNAP: Shouldnt automatically send Name+Photo because sharing is disabled", buf, 2u);
    }
    BOOL v8 = 0;
    goto LABEL_30;
  }
  if ([(CSDCallStateController *)self _sharingAudienceAllowsAutoSendNameAndPhoto])
  {
    BOOL v8 = 0;
    if (![(CSDCallStateController *)self _hasAlreadyDeniedSendingNameAndPhotoToHandles:v43]&& v4)
    {
      long long v39 = self;
      unsigned int v9 = [(CSDCallStateController *)self callProviderManager];
      BOOL v10 = [v9 providersByIdentifierForRemoteClients:0];

      long long v37 = v10;
      [v10 objectForKeyedSubscript:@"com.apple.coretelephony"];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v38 = v55 = 0u;
      id v11 = [v38 prioritizedSenderIdentities];
      id v12 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v12)
      {
        id v13 = v12;
        char v41 = 0;
        uint64_t v42 = *(void *)v53;
        id obj = v11;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v53 != v42) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            uint64_t v16 = v43;
            id v17 = (char *)[v16 countByEnumeratingWithState:&v48 objects:v61 count:16];
            if (v17)
            {
              long long v18 = v17;
              uint64_t v19 = *(void *)v49;
              while (2)
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(void *)v49 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  long long v21 = [v15 handle];
                  id v22 = [v21 normalizedValue];
                  char v23 = TUStringsAreEqualOrNil();

                  if (v23)
                  {
                    char v41 = 1;
                    goto LABEL_21;
                  }
                }
                long long v18 = (char *)[v16 countByEnumeratingWithState:&v48 objects:v61 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }
LABEL_21:
          }
          id v13 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
        }
        while (v13);

        if (v41)
        {
          id v24 = sub_100008DCC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v25 = v38;
            id v26 = [v38 prioritizedSenderIdentities];
            *(_DWORD *)buf = 138412546;
            v58 = v16;
            __int16 v59 = 2112;
            long long v60 = v26;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SNAP: Shouldnt automatically send Name+Photo because handles %@ contains self handle %@", buf, 0x16u);

            BOOL v8 = 0;
            __int16 v27 = v37;
LABEL_47:

LABEL_30:
            goto LABEL_31;
          }
          BOOL v8 = 0;
          __int16 v27 = v37;
LABEL_46:
          __int16 v25 = v38;
          goto LABEL_47;
        }
      }
      else
      {
      }
      uint64_t v29 = [(CSDCallStateController *)v39 callCenter];
      id v24 = [v29 contactStore];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v30 = v43;
      id v31 = [v30 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v45;
        while (2)
        {
          for (k = 0; k != v32; k = (char *)k + 1)
          {
            if (*(void *)v45 != v33) {
              objc_enumerationMutation(v30);
            }
            long long v35 = [(CSDCallStateController *)v39 _contactForHandle:*(void *)(*((void *)&v44 + 1) + 8 * (void)k) contactStore:v24];

            if (!v35)
            {

              unsigned int v36 = sub_100008DCC();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v30;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SNAP: Shouldnt automatically send Name+Photo because handles are unknown %@", buf, 0xCu);
              }
              BOOL v8 = 0;
              id v30 = v36;
              goto LABEL_45;
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v44 objects:v56 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }
      BOOL v8 = 1;
LABEL_45:
      __int16 v27 = v37;

      goto LABEL_46;
    }
  }
  else
  {
LABEL_26:
    BOOL v8 = 0;
  }
LABEL_31:

  return v8;
}

- (id)_contactForHandle:(id)a3 contactStore:(id)a4
{
  return [a4 contactForDestinationId:a3];
}

- (BOOL)_nameAndPhotoSharingEnabled
{
  unsigned int v2 = +[IMMeCardSharingStateController sharedInstance];
  unsigned __int8 v3 = [v2 sharingEnabled];

  return v3;
}

- (BOOL)_sharingAudienceAllowsAutoSendNameAndPhoto
{
  unsigned int v2 = +[IMMeCardSharingStateController sharedInstance];
  id v3 = [v2 sharingAudience];

  if (v3 == (id)2)
  {
    BOOL v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = 2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SNAP: Shouldnt automatically send Name+Photo because sharing audience is %ld", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 != (id)2;
}

- (BOOL)_hasAlreadyDeniedSendingNameAndPhotoToHandles:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[IMServiceImpl iMessageService];
  id v5 = IMPreferredAccountForService();

  int v6 = +[NSMutableSet set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [v5 imHandleWithID:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        if (v12) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    while (2)
    {
      for (j = 0; j != v14; j = ((char *)j + 1))
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
        long long v18 = +[IMNicknameController sharedInstance];
        LODWORD(v17) = [v18 handleIsDeniedForSharing:v17];

        if (v17)
        {
          uint64_t v14 = sub_100008DCC();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v20 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SNAP: Shouldnt automatically send Name+Photo because has previously denied sending to handle", v20, 2u);
          }

          LOBYTE(v14) = 1;
          goto LABEL_22;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  return (char)v14;
}

- (BOOL)isInCallUIActive
{
  uint64_t v2 = TUBundleIdentifierInCallServiceApplication;
  id v3 = [(CSDCallStateController *)self processObserver];
  BOOL v4 = [v3 fetchCurrentProcessStatesForBundleIdentifier:v2];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(v4, "allValues", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) integerValue] == (id)4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)hasCustomGreetingFor:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallStateController *)self answeringMachineController];
  unsigned __int8 v6 = [v5 hasCustomGreetingFor:v4];

  return v6;
}

- (CSDCallHistoryController)callHistoryController
{
  return self->_callHistoryController;
}

- (void)setCallHistoryController:(id)a3
{
}

- (CSDCallHistoryManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (CSDCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDCallController)callController
{
  return self->_callController;
}

- (CSDChannelProviderManager)channelProviderManager
{
  return self->_channelProviderManager;
}

- (CSDVoIPApplicationController)voipApplicationController
{
  return self->_voipApplicationController;
}

- (void)setVoipApplicationController:(id)a3
{
}

- (CSDRelayMessagingController)relayMessagingController
{
  return self->_relayMessagingController;
}

- (CSDAnsweringMachineController)answeringMachineController
{
  return self->_answeringMachineController;
}

- (void)setAnsweringMachineController:(id)a3
{
}

- (CSDCallRecordingController)callRecordingController
{
  return self->_callRecordingController;
}

- (void)setCallRecordingController:(id)a3
{
}

- (CSDRecentsController)recentsController
{
  return self->_recentsController;
}

- (CSDAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
}

- (CSDAudioArbitrationController)audioArbitrationController
{
  return self->_audioArbitrationController;
}

- (void)setAudioArbitrationController:(id)a3
{
}

- (CSDRouteController)localRouteController
{
  return self->_localRouteController;
}

- (CSDRouteController)pairedHostDeviceRouteController
{
  return self->_pairedHostDeviceRouteController;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (NSString)currentlyTrackedA2DPRouteIdentifier
{
  return self->_currentlyTrackedA2DPRouteIdentifier;
}

- (void)setCurrentlyTrackedA2DPRouteIdentifier:(id)a3
{
}

- (CSDCallHistoryManagerXPCServer)callHistoryManagerXPCServer
{
  return self->_callHistoryManagerXPCServer;
}

- (CSDCallProviderManagerXPCServer)callProviderManagerXPCServer
{
  return self->_callProviderManagerXPCServer;
}

- (CSDRelayCallDataSource)relayCallDataSource
{
  return self->_relayCallDataSource;
}

- (CSDRelayCallDelegate)relayCallDelegate
{
  return self->_relayCallDelegate;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (TUHardwareControlsBroadcaster)hardwareControlsBroadcaster
{
  return self->_hardwareControlsBroadcaster;
}

- (CSDProcessObserverProtocol)processObserver
{
  return self->_processObserver;
}

- (CSDApplicationInstallationObserver)applicationInstallationObserver
{
  return self->_applicationInstallationObserver;
}

- (void)setNicknameProvider:(id)a3
{
}

- (NSArray)currentUpdatesForScreening
{
  return self->_currentUpdatesForScreening;
}

- (void)setCurrentUpdatesForScreening:(id)a3
{
}

- (NSMutableDictionary)pendingCallInfoDict
{
  return self->_pendingCallInfoDict;
}

- (void)setPendingCallInfoDict:(id)a3
{
}

- (CSDCarPlayManager)carPlayManager
{
  return self->_carPlayManager;
}

- (CSDSpeechAssetManager)speechAssetManager
{
  return self->_speechAssetManager;
}

- (CSDCallHistoryControllerXPCServer)callHistoryControllerXPCServer
{
  return self->_callHistoryControllerXPCServer;
}

- (NSXPCListenerEndpoint)uiXPCEndpoint
{
  return self->_uiXPCEndpoint;
}

- (void)setUiXPCEndpoint:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setClientInvalidationHandler:(id)a3
{
}

- (CSDProviderCallDataSource)providerCallDataSource
{
  return self->_providerCallDataSource;
}

- (void)setShouldHandleSecureMicrophoneEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldHandleSecureMicrophoneEvents, 0);
  objc_storeStrong((id *)&self->_providerCallDataSource, 0);
  objc_storeStrong(&self->_clientInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_uiXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_callHistoryControllerXPCServer, 0);
  objc_storeStrong((id *)&self->_speechAssetManager, 0);
  objc_storeStrong((id *)&self->_carPlayManager, 0);
  objc_storeStrong((id *)&self->_pendingCallInfoDict, 0);
  objc_storeStrong((id *)&self->_currentUpdatesForScreening, 0);
  objc_storeStrong((id *)&self->_nicknameProvider, 0);
  objc_storeStrong((id *)&self->_applicationInstallationObserver, 0);
  objc_storeStrong((id *)&self->_processObserver, 0);
  objc_storeStrong((id *)&self->_hardwareControlsBroadcaster, 0);
  objc_storeStrong((id *)&self->_clientManager, 0);
  objc_storeStrong((id *)&self->_relayCallDelegate, 0);
  objc_storeStrong((id *)&self->_relayCallDataSource, 0);
  objc_storeStrong((id *)&self->_callProviderManagerXPCServer, 0);
  objc_storeStrong((id *)&self->_callHistoryManagerXPCServer, 0);
  objc_storeStrong((id *)&self->_currentlyTrackedA2DPRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pairedHostDeviceRouteController, 0);
  objc_storeStrong((id *)&self->_localRouteController, 0);
  objc_storeStrong((id *)&self->_audioArbitrationController, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_callRecordingController, 0);
  objc_storeStrong((id *)&self->_answeringMachineController, 0);
  objc_storeStrong((id *)&self->_relayMessagingController, 0);
  objc_storeStrong((id *)&self->_voipApplicationController, 0);
  objc_storeStrong((id *)&self->_channelProviderManager, 0);
  objc_storeStrong((id *)&self->_callController, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);

  objc_storeStrong((id *)&self->_callHistoryController, 0);
}

@end